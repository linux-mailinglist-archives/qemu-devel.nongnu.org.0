Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762C96B2EDC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:45:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paN85-0005Jc-PX; Thu, 09 Mar 2023 15:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paN82-0005Ix-Sp
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:44:46 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paN81-0007PM-7T
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:44:46 -0500
Received: by mail-pg1-x52f.google.com with SMTP id d10so1826116pgt.12
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678394683;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3C0UwMgWENNIgVRqXWh+6XqbY0jzBubncxZEujTGp+o=;
 b=WjYS942W5zhMPobYvzJoX2AxAeVXYKkFA/qIZemA2zmIsEN3ikRzcwZumoiep6TY5O
 giiG5cAp8zWavPPyuwaV+MRhcxfSHhLPi6vaUITjd57o0IoZIaabhgxNnfIiW4qJ0JvI
 CmlC3opSlPmjxzsJ7bn2rcCYRW4nXSTZKZgHhR0a0AxPTFz0HKmYFe9xtewc7xl00cr9
 RwJ/IismaNjuCp2zU1kRI/b0O/yCwSuPdaZpxzMyKUpMUku6tsY+T2hzliFEH7IXIhoY
 20r+NyUVsks6ytrlJkNugJkKlxFg6EDfr8F2GpHpQ2BlYCcOJcVtAGds73Z32KHJXBU/
 hkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678394683;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3C0UwMgWENNIgVRqXWh+6XqbY0jzBubncxZEujTGp+o=;
 b=uKfEckx7eqOcytTbhkxt6jcRgmYnORasjayPoA5Wxdve8YJIKmP3MNDC+hfXnc2jsd
 I9aU3I0V3eeyD0mqIKSi0Cvn0anmy3i6jNi84ANZcAEb90oHeOLfoEOLvYPlgAW6wf0L
 FhQhhCwwNPptfUq1PUQeRzmbxvk21ypu1jGKqxZGzer10kQvInMN7XJY4Z3eLRBKyktc
 IyfvXYaeiIGRBoCTPsaVPo47h8mkQQa2XDckHL9XUJHlqaSEhal054Ica145SInAXegN
 uru7D35k0ciGTAKsW85xoZF4ygBWMtMnegGV0WWlmiRhAmwJjvqNGv40bj349oG3Jnvg
 l05g==
X-Gm-Message-State: AO0yUKXe6nEPuY6dyXNTd+SmcXl7gldJnhpdXyJFvJ5qPRzm41of83Fh
 qbsvKO+OqN22+RVBaHUIazu0gA==
X-Google-Smtp-Source: AK7set+zDqmQTz5IgmJuc+PrtlbDCXsu99uR2whnM138lwCFyjvqoVQOn73kOIi11Eqdr7nUBEyhCw==
X-Received: by 2002:aa7:9488:0:b0:5a8:b6ab:49c3 with SMTP id
 z8-20020aa79488000000b005a8b6ab49c3mr18961817pfk.17.1678394683580; 
 Thu, 09 Mar 2023 12:44:43 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:bf7f:79a0:a976:bdaf?
 ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a63e24f000000b004fb997a0bd8sm34355pgj.30.2023.03.09.12.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:44:43 -0800 (PST)
Message-ID: <42a5ac76-a78e-c99c-87b3-76da5318c993@linaro.org>
Date: Thu, 9 Mar 2023 12:44:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 11/11] target/arm: gdbstub: Guard pauth code with
 CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-12-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230309201434.10831-12-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/9/23 12:14, Fabiano Rosas wrote:
> We currently don't have the reading of pauth regs implemented for KVM
> so wrap the pauth registration with CONFIG_TCG.
> 
> This avoids the build error when using --disable-tcg:
> 
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub64.c.o: in function
> `aarch64_gdb_get_pauth_reg': ../target/arm/gdbstub64.c:233: undefined
> reference to `pauth_ptr_mask'
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> Does this make sense? I seem to remember we had a rule that for KVM
> register values should come from the ONE_REG interface.
> ---
>   target/arm/gdbstub.c   | 2 ++
>   target/arm/gdbstub64.c | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 2ecc362ac2..fc937580dd 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -521,11 +521,13 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
>                                        aarch64_gdb_set_fpu_reg,
>                                        34, "aarch64-fpu.xml", 0);
>           }
> +#ifdef CONFIG_TCG
>           if (isar_feature_aa64_pauth(&cpu->isar)) {
>               gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
>                                        aarch64_gdb_set_pauth_reg,
>                                        4, "aarch64-pauth.xml", 0);

I think this should be tcg_enabled(), which should avoid the need for ifdef.


r~


>           }
> +#endif /* CONFIG_TCG */
>   #endif
>       } else {
>           if (arm_feature(env, ARM_FEATURE_NEON)) {
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 3bee892fb7..67c7cbb63c 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -210,6 +210,7 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
>       return 0;
>   }
>   
> +#ifdef CONFIG_TCG
>   int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
>   {
>       switch (reg) {
> @@ -243,6 +244,7 @@ int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
>       /* All pseudo registers are read-only. */
>       return 0;
>   }
> +#endif
>   
>   static void output_vector_union_type(GString *s, int reg_width,
>                                        const char *name)


