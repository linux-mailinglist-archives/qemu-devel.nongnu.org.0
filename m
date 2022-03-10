Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A134D3E03
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 01:18:37 +0100 (CET)
Received: from localhost ([::1]:40468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS6Vo-0007PB-Dt
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 19:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nS6UC-0006ZT-7H
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 19:16:56 -0500
Received: from [2607:f8b0:4864:20::102d] (port=36361
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nS6UA-0000fh-Jw
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 19:16:55 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 kx6-20020a17090b228600b001bf859159bfso6788794pjb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 16:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KLIYW/FTFcfDHW6br3tTfMzxrF+0EKGq8xoRtU9b89U=;
 b=m5j3UZ2fAxKUD2hae79cxDqIKtHaO8qvfjhw3YyQVeFppkMUT7UHDmmDMewArBlNcg
 JAAsMqhuw5nzhCWP4j/3zu5y6SkF8dqHvbqYeQ+H0P+baZMZfQhFcQf0GnMZekb9efQP
 6MKtM3LflRaGk8Nax9Nzq6cgyf5OzNwyLGtU4DQHPNFnvi303lK3hnTTiA6ereU8Q3lE
 48pzbC970SLlZXi9SgNO7M/wy9h++QGJu6b/KL0EdqjRB12NC03pD1xhpFhR9xkob7gk
 9Z8kn9VsYQ+b6FhmET1/l0Ss7sVmsuXCwkAbHwviz+blWXncZ737xFeCnENto5I+Vd7U
 YUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KLIYW/FTFcfDHW6br3tTfMzxrF+0EKGq8xoRtU9b89U=;
 b=nFZ21qI3BFyjvi1CbHiEaxWMlHV/H37tWvknWfsbxpDgtGPOL3WD+Ev7XOGFePHqo1
 0pu2I3BVGpx+VzU4xdIP5DeNk7QrSnKr0hZHJAISz2mzSrFXQMIjzclmYQZseMvVId3L
 jY2GpkFfSBS2G78RTNpkXMaR3RMp05hYDCP/7VHsKDT8J84G5AB3xSF6KgA/c5av+P++
 TZr0RtKtcanOtwqAap4XKoHRzZSjF8QuJProK4apwPOgw3xuYBW1MKSYqKh8VUgZytWZ
 l4YnEv0N9kPYZBMYusmPIRzisQ13dAQrA5eSJqc2zPz0OqEDinTq9O6LhR3WPZGx5DMe
 D+Gw==
X-Gm-Message-State: AOAM5306mL4q4DVj/qRyd7+kFU0ExqOoTot6KLgktt4B9TB7vcASsM1W
 63vLLRQ1Gmdlx5u3DVh6sDc=
X-Google-Smtp-Source: ABdhPJwk8pJrt+9aJ2HI6InsDQLWfQ1Ozmfa/00THlQgu7SMV86Yn4enOwdXt1iqSW7Ac+ALH37K/A==
X-Received: by 2002:a17:902:b709:b0:151:49e7:d4e1 with SMTP id
 d9-20020a170902b70900b0015149e7d4e1mr2406517pls.144.1646871413139; 
 Wed, 09 Mar 2022 16:16:53 -0800 (PST)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 pi10-20020a17090b1e4a00b001bf9749b95bsm6197936pjb.50.2022.03.09.16.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 16:16:52 -0800 (PST)
Message-ID: <c934ed55-b954-5334-8830-c5e36e957af3@gmail.com>
Date: Thu, 10 Mar 2022 01:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Lost patch
Content-Language: en-US
To: Patrick Venture <venture@google.com>, Corey Minyard
 <cminyard@mvista.com>, Peter Maydell <peter.maydell@linaro.org>
References: <CAO=notw1Aacb+EXLOBw4fy3rt2cFSkYmeXtJx6UziBdz7tveTg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAO=notw1Aacb+EXLOBw4fy3rt2cFSkYmeXtJx6UziBdz7tveTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/22 00:12, Patrick Venture wrote:
> Corey and Peter;
> 
> I was about to submit a fix to the at24c-eeprom device and noticed that 
> my v2 patch appears to have been lost to time.  Is there any way we can 
> get this pulled into 7.0?
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03485.html 

Thanks for noticing.

It is a bugfix so it is still good to go. I'm queuing it (except if
Peter beats me via qemu-arm) and will send a pullreq for it on next
Monday.

Regards,

Phil.

