Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4430D32098E
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 10:56:21 +0100 (CET)
Received: from localhost ([::1]:38726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDlTQ-0000i2-BX
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 04:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDlSa-0000BT-75
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 04:55:28 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDlSY-0000Lg-Ra
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 04:55:27 -0500
Received: by mail-wr1-x432.google.com with SMTP id v1so15807279wrd.6
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 01:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6xY2Y9Nidda4HhEhqxim7OqNWFI6oCVfAdWFToH0kxY=;
 b=hnnRov5FBbA6Cx6HL66KyJVvgLL5KJILaw8E5yKL3nEZXofb2BmVgTjek7bHPT3Pde
 xCVh5u7hAyWj1PRLOBxf4i1iEUsH7YzBjkaM9x3Gpp6oth1b6vU4fJox3pfg1ZdiM12c
 2EeW3m/BDPzBgDlm0PNSYITo1aU8wECG4rkwLm8w6yhr/jPWIyEjmDwmfb1bd1rvxnbr
 56FyBK18ttfuXzROrM738xdL8EgY23YjnqJ3DTtXMeQzuu/9TsEBH4PYCGBy7XTSfQz5
 nVc9oUpsIoTeeW+LAnUYBT+QzTQVjTi1WeID2zvGa5ukIablkIIJMdbfoWvoPClADkEl
 Redw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6xY2Y9Nidda4HhEhqxim7OqNWFI6oCVfAdWFToH0kxY=;
 b=rufbsLj50oU+T+Jx5+oE50f3vcxvXvhXeLbQIXU+OnHg2BQFwT0dBSN8WaBZ5WOB89
 FbB+XDv5ylZBFJakP/YWgkRb1E1upljsXNrbzNgxZ0TyZ0R9Ef6X85bpXNEjmqRg5ej7
 50rhPiO9H6tga7u4ma/QRgYCg/b2S0iJKLcvIPwM8ADEh0wXENoevnDzl/DDx8MHJy2V
 ySj+DYdz6E2/skbYHWBBmHwruVPWK6OCfpeQZmlNpF0w3iShbV37Tl0q3YkGjtCMFXG7
 Lrg2b7JNKy1m1pOldKtekFyvB6g0LXm2nyMOloaO7h19fLeGeR7ig0BTLW2rkcF3bWsI
 r9xw==
X-Gm-Message-State: AOAM530WUvJ6mhXmOFJ+m6IEoik6G5hvt9ak1z4QZgwR1/+uxbPn2Bj1
 8hWm2e/L9XljffjH61kQFbB4UXpqOg0=
X-Google-Smtp-Source: ABdhPJxVUUsaaMaOZoUkufab98K/gOyJFpDmSh0gPwGj1McaV0aZVLR7tayHKOVdZHwMtRfvJ+otoA==
X-Received: by 2002:a5d:5601:: with SMTP id l1mr5572740wrv.178.1613901325262; 
 Sun, 21 Feb 2021 01:55:25 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y12sm11915678wrm.33.2021.02.21.01.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 01:55:24 -0800 (PST)
Subject: Re: [RFC v1 34/38] target/arm: cpu: only initialize TCG gt timers
 under CONFIG_TCG
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-35-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ef926947-1073-4d7e-0b59-c47fbbfb44a2@amsat.org>
Date: Sun, 21 Feb 2021 10:55:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-35-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 10:24 AM, Claudio Fontana wrote:
> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
> 
> KVM has its own cpu->kvm_vtime.
> 
> Adjust cpu vmstate by putting unused fields instead of the
> VMSTATE_TIMER_PTR when TCG is not available.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu.c     | 4 +++-
>  target/arm/machine.c | 5 +++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 1d81a1e7ac..b929109054 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1322,6 +1322,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          }
>      }
>  
> +#ifdef CONFIG_TCG
>      {
>          uint64_t scale;
>  
> @@ -1347,7 +1348,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
>                                                    arm_gt_hvtimer_cb, cpu);

What about Xen?

>      }
> -#endif
> +#endif /* CONFIG_TCG */
> +#endif /* !CONFIG_USER_ONLY */
>  
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err != NULL) {
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 666ef329ef..13d7c6d930 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -822,8 +822,13 @@ const VMStateDescription vmstate_arm_cpu = {
>          VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
>          VMSTATE_UINT32(env.exception.fsr, ARMCPU),
>          VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
> +#ifdef CONFIG_TCG
>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
> +#else
> +        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
> +        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
> +#endif /* CONFIG_TCG */
>          {
>              .name = "power_state",
>              .version_id = 0,
> 


