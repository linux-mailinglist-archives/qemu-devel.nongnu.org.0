Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4468623B6D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:43:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0LV-0003fs-Bq; Thu, 10 Nov 2022 00:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0LT-0003bE-2I
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:43:23 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0LR-0004ce-IT
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:43:22 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l6so812284pjj.0
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kkkJRNB5iEj1u2/jWx07iZulRFainRFSjPdTa/xPYK4=;
 b=nl08b1AcqbilxllXlUwNfl9yd0IXbqu1xXXN3FsfJSAXKgMJNc7RTtvE79981284iP
 nC2/J9gNGIl/GH73cQ3SNfD8EoozFtOeLjVkLkSDezY528iMPYBfRH+2C45fG9f2d1xH
 cvsaOUpLNvzdjcTxHZeh4mv0TsQ2FoR0nRPyswZvuoncGXs6NrX+N65otlxDACmcNDKc
 c4nbLQchMMq52Tauie23WMd4f3uo2/sfIycMopfRyPI8LYnIVk08v9PnL2ID1KKRUX3q
 9PptBxVX2gOhBRh0rnRD7saTOdAWyybmDsQYYeWDq6sNtIew8ENtCKpKlqhQzT4SdMly
 4kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kkkJRNB5iEj1u2/jWx07iZulRFainRFSjPdTa/xPYK4=;
 b=itiPzmfQK5IhpcldEd8jEqLIN2GNt4wXupR3SW3zKmUbCg4IT9I7gvz4XikowdO72E
 dlJLPAeSq3DyKfJP3/Hy/AQaL0jmFBHOWK6l/44jNGjPxfFnkt2+dpVzs7jWSzNhAD2Z
 6xvTgFfqQ8zo66GSSo0mayPmTepznugB7b4D9Bgb1mGZ/x6Ai/L2/x7bjnBqDrChv1e6
 5WR731U1nremQIg5Yb4xkuC6+da12NPep8PQObnXpmzUcqac6RgY+PW6H7muZvTXzMkP
 MKZyFhLQ5fgFZ1ybieKOX5du3ENIV1rEXArnwQ6gFKUWWdJTyDAvivmWMFLI/HkGzD81
 ZA7A==
X-Gm-Message-State: ACrzQf3h+r9Jhl+oK1/yhztGmONgaRG1eh23XdNaKSytctvKUxZn166j
 6h0M2+TwMokyjcfop0WWWqtGo+TuBglBcR1a
X-Google-Smtp-Source: AMsMyM5I8ZslSJxYmpdPakwJE4GYtacEbeh2kvWeYRxWKRm9U23QDdOTiVDrgSu3pg8VHgDesVS11g==
X-Received: by 2002:a17:90b:1c87:b0:20a:e485:4e21 with SMTP id
 oo7-20020a17090b1c8700b0020ae4854e21mr65043787pjb.194.1668059000261; 
 Wed, 09 Nov 2022 21:43:20 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a170903228100b00176ba091cd3sm10206946plh.196.2022.11.09.21.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:43:19 -0800 (PST)
Message-ID: <e0891fb6-d9df-3c73-5df1-57cad759b606@linaro.org>
Date: Thu, 10 Nov 2022 16:43:15 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 6/9] hw/intc: Convert TYPE_KVM_ARM_GICV3 to
 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_KVM_ARM_GICV3 device to 3-phase reset.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_kvm.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

