Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D92940D29D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:39:53 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQjBg-0001ll-L4
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQj8x-0007Pv-AV; Thu, 16 Sep 2021 00:37:03 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQj8v-0006Sf-5n; Thu, 16 Sep 2021 00:37:03 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso6373176wme.4; 
 Wed, 15 Sep 2021 21:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RA/qMhU9dd5BvbadOHmviAXUl/yG5PeLghHm7IiXOf0=;
 b=CBOcMVcz6AttMtBy1QHWbWTSJ+eKPqcxWJS8hb1Nf3SU4JU82mR4wDePySrKF9mu1Y
 7tS/DtVetQ7PffJHJMYfM61jl5Hi0QXt86uqTlTJIYSFAZJoDLYrhOLJ6TmpQ4Dhila7
 OLVD/66mSN08BEO3IEmA0PTW1tkpcXTdkBiWMLJTqDHHMMeE377HYWDl4RCdPzeTyDsF
 u6PvO9H/cp3zMjz6qgCuoVaF2KhO0pW1LmUyzufI2WCJy72UcOeQCtsgKg+sGD7RBEQn
 cZT1UPcJz/gAk9I0ut2t67wI5s3AdQaqu6sHJn4XtIX6cRJktUddxzxRQLcAVS9DMWrp
 coIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RA/qMhU9dd5BvbadOHmviAXUl/yG5PeLghHm7IiXOf0=;
 b=ynAaFp5mSflo1GUhKLRVjNb4g6EGZTcopdm9EkigsMQgjdBvHvJ/fid9ZDyLjuI4Kv
 mIvv+gQ+TZdRZj1gwsW5h9fIc/vudHfvxpzWQfayXbOwe6kXqrb9ArZJyroJxRxZJRUS
 P2kpePqk+2DZYupRj+tr1KVk5hDwPtJPgGRWuAdYBnZ0mI+IW2gI3goZrTLOzJ4FJxw/
 eGmnhGHW08AMFgl5Qnm+ubtPCsDdAk1oGzGjk20AQeY2N3z6LtYFF6KWj17IfFxPrvyU
 CNR49Ta9t0vus0qYVGfLf5KdXdGUMbMsHPiTTXpucA6PLevDgUOsGCHADo1m1SUb6PhN
 7XRQ==
X-Gm-Message-State: AOAM532LGQ91u0eIBtGHj9o2EHfI97Oszn6GXJ8THUAXISXebwsQHKKl
 lH1Jb7rnoiGPJ94RlMWjU9XUI6p8emU=
X-Google-Smtp-Source: ABdhPJxBOefUQInUwCoXMCw6Bbh+0z182BKL+xPqe2XjUJSKPq6TDQ2uSiuK5lQrXTwbNlKAbW96vg==
X-Received: by 2002:a05:600c:3652:: with SMTP id
 y18mr3004553wmq.66.1631767018131; 
 Wed, 15 Sep 2021 21:36:58 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id u13sm1621196wmq.33.2021.09.15.21.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 21:36:57 -0700 (PDT)
Subject: Re: [PATCH] hw/intc: GIC maintenance interrupt not triggered
To: Shashi Mallela <shashi.mallela@linaro.org>, peter.maydell@linaro.org
References: <20210915205809.59068-1-shashi.mallela@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4aba1039-addb-9594-924a-4f8650637df4@amsat.org>
Date: Thu, 16 Sep 2021 06:36:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915205809.59068-1-shashi.mallela@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.698,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 10:58 PM, Shashi Mallela wrote:
> During sbsa acs level 3 testing,it is seen that the GIC
> maintenance interrupts are not triggered and the related test
> cases failed.On debugging the cause,found that the value of
> MISR register (from maintenance_interrupt_state()) was being
> passed to qemu_set_irq() as level.Updated logic to set level
> to 1 if any of the maintenance interrupt attributes are set.
> Confirmed that the GIC maintanence interrupts are triggered and
> sbsa acs test cases passed with this change.
> 

Fixes: c5fc89b36c0 ("hw/intc/arm_gicv3: Implement
gicv3_cpuif_virt_update()")

> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 462a35f66e..34691d4fe2 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -418,7 +418,9 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
>      }
>  
>      if (cs->ich_hcr_el2 & ICH_HCR_EL2_EN) {
> -        maintlevel = maintenance_interrupt_state(cs);
> +        if (maintenance_interrupt_state(cs)) {
> +            maintlevel = 1;
> +        }

Or:
           maintlevel = !!maintenance_interrupt_state(cs);

But your style is more explicit.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

