Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCE32F01E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:32:54 +0100 (CET)
Received: from localhost ([::1]:41670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDNl-0001jI-7G
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lIDG8-0002el-PQ
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:25:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lIDG6-0000hp-1c
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614961495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MZDLO6AgAwZqZSFXjooFMmkuOmLvh4T78MBb11ItBM0=;
 b=MCZVh0DISkTq2lMHuyl98QrimPH2I6IC85+S0aBTnHf0SBll083sdAHz3QQqgie02xJC2s
 JzOhUWc5ccb0q2wSbBp3FupH3bWJOLijgJN/MnAO8fCpOKvCP6+/mPbSywLGPLrS91A90h
 YgjEY+TkqxAIlmArNbATisFdM1dUDk8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-1_dCLjaiOA2dLCl2MFfE9g-1; Fri, 05 Mar 2021 11:24:54 -0500
X-MC-Unique: 1_dCLjaiOA2dLCl2MFfE9g-1
Received: by mail-wr1-f69.google.com with SMTP id y5so1281572wrp.2
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MZDLO6AgAwZqZSFXjooFMmkuOmLvh4T78MBb11ItBM0=;
 b=nOJd3ong4slwPwxTihdj1MuDHPiDtx624h51VZqd/8f/NHfN8MgAEtgK4pnOJ9TuUy
 7Lc4/LrrHncMgr1Tu+B79y6Z7AdqHG2MWKEa6nQQ47XgJkotx8RZNrpz/dEMuxroBEGf
 iiWctikyCsqU/Yog/FYV3Nrghx8P6L3FXRtaOTtF5ngfEvdkH2xjS6lJT3BmAvQ+v13m
 Wz8Rzt0U/y7e5tirOJp9ZH2R0mrDDfDqVyxx5UtRFlbzCW0ShMXRQPbwBRAU0IE5uEww
 NthFC+LpNa42qcy+/mOSzXQQWLuoVLaAUxRcp/a0Fy+3qxLUbE8wwO53HgVdtbdBFEih
 xFaw==
X-Gm-Message-State: AOAM532WMfrKIWHLJ5teKq4N79hxVFXaZ21YraOQyoeFqXrqAy44o7qV
 SAkakuQAI7iuw7qu+Ap4q44TBJI7I0HnWTB5Prs5ZfDdHYv2RnUiX33cUFBJz6YCRCn4gD4FkpC
 JGqZ1IEEsG8w6SJ8=
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr10163639wrt.133.1614961492899; 
 Fri, 05 Mar 2021 08:24:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhaGfuSDgbUvCEoNwU9vU3X+dGsovOI0z8QXVKWhHunJudgLUqDc6ePSfoV5mliOuqBAdvFg==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr10163616wrt.133.1614961492677; 
 Fri, 05 Mar 2021 08:24:52 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z1sm5226754wru.95.2021.03.05.08.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 08:24:52 -0800 (PST)
Subject: Re: [RFC v4 30/33] target/arm: remove broad "else" statements when
 checking accels
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210305145941.32020-1-cfontana@suse.de>
 <20210305145941.32020-31-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <36e4893f-8eeb-9e16-5d1f-4167d5dc0e7d@redhat.com>
Date: Fri, 5 Mar 2021 17:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305145941.32020-31-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Xen list

On 3/5/21 3:59 PM, Claudio Fontana wrote:
> There might be more than just KVM and TCG in the future,
> so where appropriate, replace broad "else" statements
> with the appropriate if (accel_enabled()) check.
> 
> Also invert some checks for !kvm_enabled() or !tcg_enabled()
> where it seems appropriate to do so.
> 
> Note that to make qtest happy we need to perform gpio
> initialization in the qtest_enabled() case as well.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/cpu.c     | 10 ++++++----
>  target/arm/cpu64.c   | 13 +++++++++----
>  target/arm/machine.c | 19 ++++++-------------
>  3 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index be86bd4b8b..353cd652bc 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -37,6 +37,7 @@
>  #endif
>  
>  #include "sysemu/tcg.h"
> +#include "sysemu/qtest.h"
>  #include "kvm/kvm_arm.h"
>  #include "disas/capstone.h"
>  #include "fpu/softfloat.h"
> @@ -564,7 +565,8 @@ static void arm_cpu_initfn(Object *obj)
>           * the same interface as non-KVM CPUs.
>           */
>          qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
> -    } else {
> +    }
> +    if (tcg_enabled() || qtest_enabled()) {
>          qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 4);
>      }
>  
> @@ -741,14 +743,14 @@ void arm_cpu_post_init(Object *obj)
>          ? cpu_isar_feature(aa64_fp_simd, cpu)
>          : cpu_isar_feature(aa32_vfp, cpu)) {
>          cpu->has_vfp = true;
> -        if (!kvm_enabled()) {
> +        if (tcg_enabled()) {
>              qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
>          }
>      }
>  
>      if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
>          cpu->has_neon = true;
> -        if (!kvm_enabled()) {
> +        if (tcg_enabled()) {
>              qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property);
>          }
>      }
> @@ -849,7 +851,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>           * We have not registered the cpu properties when KVM
>           * is in use, so the user will not be able to set them.
>           */
> -        if (!kvm_enabled()) {
> +        if (tcg_enabled()) {
>              arm_cpu_pauth_finalize(cpu, &local_err);
>              if (local_err != NULL) {
>                  error_propagate(errp, local_err);
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 7c27b0febb..be3c1c6f36 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -23,6 +23,7 @@
>  #include "qemu/qemu-print.h"
>  #include "cpu.h"
>  #include "qemu/module.h"
> +#include "sysemu/tcg.h"
>  #include "sysemu/kvm.h"
>  #include "kvm/kvm_arm.h"
>  #include "qapi/visitor.h"
> @@ -296,7 +297,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>               */
>              bitmap_andnot(tmp, kvm_supported, cpu->sve_vq_init, max_vq);
>              bitmap_or(cpu->sve_vq_map, cpu->sve_vq_map, tmp, max_vq);
> -        } else {
> +        }
> +        if (tcg_enabled()) {
>              /* Propagate enabled bits down through required powers-of-two. */
>              for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
>                  if (!test_bit(vq - 1, cpu->sve_vq_init)) {
> @@ -333,7 +335,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>                                    "vector length must be enabled.\n");
>                  return;
>              }
> -        } else {
> +        }
> +        if (tcg_enabled()) {
>              /* Disabling a power-of-two disables all larger lengths. */
>              if (test_bit(0, cpu->sve_vq_init)) {
>                  error_setg(errp, "cannot disable sve128");
> @@ -415,7 +418,8 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>              }
>              return;
>          }
> -    } else {
> +    }
> +    if (tcg_enabled()) {
>          /* Ensure all required powers-of-two are enabled. */
>          for (vq = pow2floor(max_vq); vq >= 1; vq >>= 1) {
>              if (!test_bit(vq - 1, cpu->sve_vq_map)) {
> @@ -609,7 +613,8 @@ static void aarch64_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> -    } else {
> +    }
> +    if (tcg_enabled()) {
>          uint64_t t;
>          uint32_t u;
>          aarch64_a57_initfn(obj);
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 595ab94237..cfc2bb4982 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -638,24 +638,21 @@ static int cpu_pre_save(void *opaque)
>  
>      if (tcg_enabled()) {
>          pmu_op_start(&cpu->env);
> +        if (!write_cpustate_to_list(cpu, false)) {
> +            /* This should never fail. */
> +            abort();
> +        }
>      }
> -
>      if (kvm_enabled()) {
>          if (!write_kvmstate_to_list(cpu)) {
>              /* This should never fail */
>              abort();
>          }
> -
>          /*
>           * kvm_arm_cpu_pre_save() must be called after
>           * write_kvmstate_to_list()
>           */
>          kvm_arm_cpu_pre_save(cpu);
> -    } else {
> -        if (!write_cpustate_to_list(cpu, false)) {
> -            /* This should never fail. */
> -            abort();
> -        }
>      }
>  
>      cpu->cpreg_vmstate_array_len = cpu->cpreg_array_len;
> @@ -754,20 +751,16 @@ static int cpu_post_load(void *opaque, int version_id)
>           */
>          write_list_to_cpustate(cpu);
>          kvm_arm_cpu_post_load(cpu);
> -    } else {
> +    }
> +    if (tcg_enabled()) {
>          if (!write_list_to_cpustate(cpu)) {
>              return -1;
>          }
> -    }
> -
> -    if (tcg_enabled()) {
>          hw_breakpoint_update_all(cpu);
>          hw_watchpoint_update_all(cpu);
> -
>          pmu_op_finish(&cpu->env);
>          arm_rebuild_hflags(&cpu->env);
>      }
> -
>      return 0;
>  }
>  
> 


