Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDB732CA8E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 03:51:43 +0100 (CET)
Received: from localhost ([::1]:44648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHe5V-0002QU-PI
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 21:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHe41-0001uC-El
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:50:09 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHe3z-0007tb-Ro
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 21:50:09 -0500
Received: by mail-pl1-x631.google.com with SMTP id p5so15298724plo.4
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 18:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=adOmbQ+JsCCeqaRqw8hd2Cg/83hOgFoi1nQAgMXIr2s=;
 b=zIPR5cGuxI6DYUQfpagPFWLZrm6FKLbRZMhNo5rPx1lZClWZ6OkRG1W6l/jycAHlI+
 OPJCWvrcJdMZpc3uxwcyhVnPeeudvb5n/hyayjulNPfLtnTV4XhiwMDX8IJX7A1X+CoT
 AAfLShsr+LxDobBS+VjTCvRtl+58CIdmk5okclo9rGJVBOKyDPrErVVe9O1iDgT3BnHg
 +oyf2yHCdpCGyvpLgxd2VoY7najQe6mozdh66uBx9JkIh1kNY0xPKA8A4U5TIW9rpi7t
 WcacQskGlZR/86A7kALc9iYRYG94xsmzONyRtvFbpeuw5ZIhmYFhHTop0AqmYtOswtwt
 Fx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=adOmbQ+JsCCeqaRqw8hd2Cg/83hOgFoi1nQAgMXIr2s=;
 b=ozGEJrRrpvhEJOqbfR0Yv3/X/XPvQusAl+95ggmNKevpqZfCKAexidNOjL1Lov7FyS
 f1Vt24GsYtdiEL3bwiUOb79Vvc7WeHazf/l9RE24g9+8zXz4ar6q3/SMC28z8HS3EMS2
 svEnyCP4E2CtOk8sPcs4XCuYYgjbx9W4djnqIwMl9f4pnOYbBUkkaqK2nV4gORNuA3eC
 mAN7rpTLNznvAoL1pITcAUP7JO7wZFSxBre0n55PpJXDXlmu7e6QjALJPqNlkFnJBPwK
 kgYBtPrG4gxKlpt9S/v1B6588dVxpurI0ujfXy1DtKgtfB+3ODGB1MM8pMsaw8oMzt9q
 ZDxw==
X-Gm-Message-State: AOAM532+5gQxVoilYOtmoBCys49501Wwx17XWNXpneuoDX4NhQ9/49Ss
 aBqscU0dhBVUb+KJmD8SqATXgQ0uzIMCyQ==
X-Google-Smtp-Source: ABdhPJyZCTu42c2cRelwza2eRKEu819fPMjuGX6ahSr24Ai4WomDfTiQSbFjDRmtmxnQD+RHJEO1XA==
X-Received: by 2002:a17:902:d346:b029:e4:c35b:dc0a with SMTP id
 l6-20020a170902d346b02900e4c35bdc0amr1982087plk.75.1614826206321; 
 Wed, 03 Mar 2021 18:50:06 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id c193sm426176pfc.180.2021.03.03.18.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:50:05 -0800 (PST)
Subject: Re: [PATCH 01/44] clock: Add ClockEvent parameter to callbacks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <592e47e0-6148-9a73-4397-0e30e12d5409@linaro.org>
Date: Wed, 3 Mar 2021 18:50:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The Clock framework allows users to specify a callback which is
> called after the clock's period has been updated.  Some users need to
> also have a callback which is called before the clock period is
> updated.
> 
> As the first step in adding support for notifying Clock users on
> pre-update events, add an argument to the ClockCallback to specify
> what event is being notified, and add an argument to the various
> functions for registering a callback to specify which events are
> of interest to that callback.
> 
> Note that the documentation update renders correct the previously
> incorrect claim in 'Adding a new clock' that callbacks "will be
> explained in a following section".
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Reviewed-by: Luc Michel<luc@lmichel.fr>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


