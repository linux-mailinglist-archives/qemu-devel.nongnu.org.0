Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266DC5160B7
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 00:05:37 +0200 (CEST)
Received: from localhost ([::1]:55090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkvDb-0002X5-Hr
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 18:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkvBm-0001De-5x
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 18:03:42 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkvBk-0007Sb-FP
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 18:03:41 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso10049256pjj.2
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 15:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:cc
 :references:from:in-reply-to:content-transfer-encoding;
 bh=3ZnYZGBTRrUOQhCF9OsgO9zD6KTDyG3V4Z4po44X8bM=;
 b=YmCejJexBku0cXTEwRc5Yun2fD4HlKtDSNvBciGeRFpi2DrNYAJPrFRmy1T6tpaOSG
 ywJfQTJORD0IEPyDM22VFPk/HPRORUOkuf7XXF3TCQuCZb0mqyV/dEvTLW07heZsMve7
 dW5n1zgv7666rPfozqfn4uSagbCeXwUp9Gyt59Zrdld9lDZ8sAgA+TGw89tp9aUzljTm
 cdt0VfM+q5UTJmC4WDwkqe3ysNb01+e318bzZiAY1AgbEfMY1YH+5YgtAtLsYkj9Jv1u
 t1lnI7dx/B8nTwbqflBvU526iFplAwsIF9NHhGgpjIrLGDa1MrFIyTq0T9HSGeZk3tn+
 xuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3ZnYZGBTRrUOQhCF9OsgO9zD6KTDyG3V4Z4po44X8bM=;
 b=TOCdwFyerp2U8U+xCEntyPSaHhTf8Y6PwuUhuwHqoK/CguGKr5Dv9dryDkqKEXnM93
 9pTaOItrWF75J2DZHK2ItaM80PDmg1g4KRtDs2Z82JD2qoRlHHoPMtNl2mNcKEJz8h2v
 ai3Jvea3mPcEcMnkRy+0Qik22gBti5UPUQYvoxgHbPQXBbciRdn8JeYVNmIOvZovfiCL
 +/mPfX9TbBdfrAVTYK2b4RFGNTJ4cWpcYjQsoxf16VudkjWXqVxXMbKjaqTyHljmpzSF
 K1gLm73pUfolo8ySSRx/Cu7aYy7LEckcdpQ+AMawTlASTRmH0/PMfE+C2wZAnei3BZam
 NYeA==
X-Gm-Message-State: AOAM5319i6HRT7szqYZENv1f0nr6AQALWXXVWljhMabAAhaF+AJ6enRw
 q7VUtz9mjoXeqy0uBZ9KNjW6laV6Fe9SVQ==
X-Google-Smtp-Source: ABdhPJz6Hux6x22FOI+q80iASs1BNq2xZU5qodPlLINyKb84RKt2F733BR1mqwZlDFIAY2KJUpe5Kg==
X-Received: by 2002:a17:902:ab59:b0:15c:f4f3:7e3b with SMTP id
 ij25-20020a170902ab5900b0015cf4f37e3bmr5317881plb.24.1651356218614; 
 Sat, 30 Apr 2022 15:03:38 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b0015e8d4eb1d4sm1944806plg.30.2022.04.30.15.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 15:03:38 -0700 (PDT)
Message-ID: <46be82d3-64ac-67a5-ccf3-f50185bd4e5b@linaro.org>
Date: Sat, 30 Apr 2022 15:03:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] tcg: fix guest memory ordering enforcement
Content-Language: en-US
References: <20220428113234.37953-1-redha.gouicem@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220428113234.37953-1-redha.gouicem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MISSING_HEADERS=1.021,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
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
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/22 04:32, Redha Gouicem wrote:
> This commit allows memory ordering enforcement to be performed more
> precisely. The previous scheme with fences always inserted before the memory
> access made it impossible to correctly enforce the x86 model on weakly ordered
> architectures such as arm. With this change, the memory models of guests can be
> defined more precisely, with a fence before and a fence after the access. This
> allows for a precise mapping of the ordering, that relies less on what type of
> fences the host architecture provides.
> 
> Signed-off-by: Redha Gouicem <redha.gouicem@gmail.com>
> ---
>   target/alpha/cpu.h  |  4 ++++
>   target/arm/cpu.h    |  4 ++++
>   target/avr/cpu.h    |  4 ++++
>   target/hppa/cpu.h   |  4 ++++
>   target/i386/cpu.h   |  4 ++++
>   target/mips/cpu.h   |  4 ++++
>   target/ppc/cpu.h    |  4 ++++
>   target/riscv/cpu.h  |  4 ++++
>   target/s390x/cpu.h  |  4 ++++
>   target/xtensa/cpu.h |  4 ++++
>   tcg/tcg-op.c        | 19 ++++++++++++-------
>   11 files changed, 52 insertions(+), 7 deletions(-)

First of all, patches that don't compile aren't particularly helpful.  You've missed out 
on updating 10 of 20 targets.

I do not believe your assertion that the current scheme "makes it impossible to correctly 
enforce the memory model".  Please provide your rationale.

>   /* Alpha processors have a weak memory model */
>   #define TCG_GUEST_DEFAULT_MO      (0)
> +#define TCG_GUEST_MO_BEF_LD       (0)
> +#define TCG_GUEST_MO_AFT_LD       (0)
> +#define TCG_GUEST_MO_BEF_ST       (0)
> +#define TCG_GUEST_MO_AFT_ST       (0)

There's no new information here.

> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 9661f9fbd1..c6a7052d58 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -29,6 +29,10 @@
>   
>   /* The x86 has a strong memory model with some store-after-load re-ordering */
>   #define TCG_GUEST_DEFAULT_MO      (TCG_MO_ALL & ~TCG_MO_ST_LD)
> +#define TCG_GUEST_MO_BEF_LD       (0)
> +#define TCG_GUEST_MO_AFT_LD       (TCG_MO_LD_ST | TCG_MO_LD_LD)
> +#define TCG_GUEST_MO_BEF_ST       (TCG_MO_ST_ST)
> +#define TCG_GUEST_MO_AFT_ST       (0)

Or even here -- you're making the executive decision that barriers go after loads and 
before stores.  Note that

   TCG_GUEST_MO_AFT_LD == (TCG_GUEST_DEFAULT_MO & (TCG_MO_LD_ST | TCG_MO_LD_LD))
   TCG_GUEST_MO_BEF_ST == (TCG_GUEST_DEFAULT_MO & TCG_MO_ST_ST)
   TCG_GUEST_MO_AFT_ST == (TCG_GUEST_DEFAULT_MO & TCG_MO_ST_LD)

You could just as easily make this selection in tcg-op.c alone.

I'm not sure why putting a ST_ST barrier before a store is better or worse than putting a 
ST_ST barrier after the store.  I could imagine that putting wmb barriers before the 
operation schedules better with the surrounding code, but I'd want that decision 
explicitly stated.

There *are* still missing barriers with the cpu_ld*_data* and cpu_st*_data* functions, as 
used by out-of-line helpers.  Certainly I expect those to have less impact than the 
generated code, but they are still required.


r~

