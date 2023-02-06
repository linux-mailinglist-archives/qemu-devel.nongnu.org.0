Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D1168BE4C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:32:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1be-0006XM-V7; Mon, 06 Feb 2023 08:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pP1bd-0006Wr-08
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:32:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pP1ba-0004Ij-MQ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675690341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IKHdX0V5RLmy+u1tFNo2MDB+t/mBxnu0tidvmerJgQ4=;
 b=fMTOACwZ4ZrrhNU9jx/vEEjhOzw4raOG9/xd1mMLQ0YjuylgtpmIGs0CnKF2M1dYMS0tQw
 xK5+Asm63GkGAevJoHpzwU33Z9FqV+0aNEXcW5+LArant9YxsREKTWFyELMDT6sb6D+pAN
 jp7k8dx1F1L0vqDkDPcqrEUUE+XAGWI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339-mS9fB8pPOkGWuHSY3u35Gg-1; Mon, 06 Feb 2023 08:32:20 -0500
X-MC-Unique: mS9fB8pPOkGWuHSY3u35Gg-1
Received: by mail-qk1-f198.google.com with SMTP id
 ay10-20020a05620a178a00b0072db6346c39so6481640qkb.16
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 05:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IKHdX0V5RLmy+u1tFNo2MDB+t/mBxnu0tidvmerJgQ4=;
 b=5NcmC7Jx69A8r21EGfgVRGkuzsNMCh0jylzhM+Te+Ljcoc89GoL9EKWRcwNTZT+85v
 XAplxkKYrga9i/Oe3m+a+4N3jlSydWUDoX5uCvpj9T5b9toHJ0o0VXon2+f4fydh0SKC
 jmPw5gcf0Y06QGhlloqBlL8fnRvEqtY/eLlVJGCXi+4coYp84JXDx0xqZ0SZU65IYT2X
 EaupapbKLbEwBnGzhifsKmq8ttkXXKlSsgp9bchyVFor7acic29C3BXnb2IV/5NqwyyQ
 zLt5i+LJyTnofvpdtcVDygyjuEzg1YiY57eEwQcdMBmXYPYEasA+lTZwYaMXa/fXs/lr
 XWMw==
X-Gm-Message-State: AO0yUKXuj7Jgr40sA0uCZ4XiGmW2zBDAOX6YFnKf0q3lpVL3w+JPzQY2
 Fd6vDPlNUCbe2n2D6cdkhhvO51ixDtVSIuqCY71bwb5C7HlIbobD+6k6f5eZT+wkJdPkn7Dnd3M
 XapTFzR4RhRlO3oI=
X-Received: by 2002:a05:622a:1741:b0:3b6:92ce:b4f7 with SMTP id
 l1-20020a05622a174100b003b692ceb4f7mr31330227qtk.37.1675690339762; 
 Mon, 06 Feb 2023 05:32:19 -0800 (PST)
X-Google-Smtp-Source: AK7set/A/EIRZelNZeFPdZ8LLeuaiBhOCwbSjnw20r+Uv+5gvOPdT8xUM6zj5e7j/Dm53T5RIppGWg==
X-Received: by 2002:a05:622a:1741:b0:3b6:92ce:b4f7 with SMTP id
 l1-20020a05622a174100b003b692ceb4f7mr31330187qtk.37.1675690339373; 
 Mon, 06 Feb 2023 05:32:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a05620a0f9800b0071ba3799334sm7334212qkn.58.2023.02.06.05.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 05:32:18 -0800 (PST)
Message-ID: <ecddd3a1-f4e4-4cc8-3294-8c94aca28ed0@redhat.com>
Date: Mon, 6 Feb 2023 14:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 2/3] arm/kvm: add support for MTE
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-3-cohuck@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20230203134433.31513-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Connie,

On 2/3/23 14:44, Cornelia Huck wrote:
> Introduce a new cpu feature flag to control MTE support. To preserve
> backwards compatibility for tcg, MTE will continue to be enabled as
> long as tag memory has been provided.
> 
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst |  21 ++++++
>  hw/arm/virt.c                    |   2 +-
>  target/arm/cpu.c                 |  18 ++---
>  target/arm/cpu.h                 |   1 +
>  target/arm/cpu64.c               | 114 +++++++++++++++++++++++++++++++
>  target/arm/internals.h           |   1 +
>  target/arm/kvm.c                 |  29 ++++++++
>  target/arm/kvm64.c               |   5 ++
>  target/arm/kvm_arm.h             |  19 ++++++
>  target/arm/monitor.c             |   1 +
>  10 files changed, 198 insertions(+), 13 deletions(-)
> 
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 00c444042ff5..f8b0f339d32d 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -443,3 +443,24 @@ As with ``sve-default-vector-length``, if the default length is larger
>  than the maximum vector length enabled, the actual vector length will
>  be reduced.  If this property is set to ``-1`` then the default vector
>  length is set to the maximum possible length.
> +
> +MTE CPU Property
> +================
> +
> +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> +presence of tag memory (which can be turned on for the ``virt`` machine via
> +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> +proper migration support is implemented, enabling MTE will install a migration
> +blocker.
> +
> +If not specified explicitly via ``on`` or ``off``, MTE will be available
> +according to the following rules:
> +
> +* When TCG is used, MTE will be available if and only if tag memory is available;
> +  i.e. it preserves the behaviour prior to the introduction of the feature.
> +
> +* When KVM is used, MTE will default to off, so that migration will not
> +  unintentionally be blocked. This might change in a future QEMU version.
> +
> +* Other accelerators currently don't support MTE.
> +
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index bdc297a4570c..3aff0b8425f4 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2136,7 +2136,7 @@ static void machvirt_init(MachineState *machine)
>  
>      if (vms->mte && (kvm_enabled() || hvf_enabled())) {
>          error_report("mach-virt: %s does not support providing "
> -                     "MTE to the guest CPU",
> +                     "emulated MTE to the guest CPU (tag memory not supported)",
>                       current_accel_name());
>          exit(1);
>      }
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5f63316dbf22..decab743d0d5 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1529,6 +1529,11 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>              error_propagate(errp, local_err);
>              return;
>          }
> +        arm_cpu_mte_finalize(cpu, &local_err);
> +        if (local_err != NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
>      }
>  #endif
>  
> @@ -1605,7 +1610,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          }
>          if (cpu->tag_memory) {
>              error_setg(errp,
> -                       "Cannot enable %s when guest CPUs has MTE enabled",
> +                       "Cannot enable %s when guest CPUs has tag memory enabled",
>                         current_accel_name());
>              return;
>          }
> @@ -1984,17 +1989,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>                                         ID_PFR1, VIRTUALIZATION, 0);
>      }
>  
> -#ifndef CONFIG_USER_ONLY
> -    if (cpu->tag_memory == NULL && cpu_isar_feature(aa64_mte, cpu)) {
> -        /*
> -         * Disable the MTE feature bits if we do not have tag-memory
> -         * provided by the machine.
> -         */
> -        cpu->isar.id_aa64pfr1 =
> -            FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
> -    }
> -#endif
> -
>      if (tcg_enabled()) {
>          /*
>           * Don't report the Statistical Profiling Extension in the ID
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8cf70693be41..6cfaba30e30f 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1039,6 +1039,7 @@ struct ArchCPU {
>      bool prop_pauth;
>      bool prop_pauth_impdef;
>      bool prop_lpa2;
> +    OnOffAuto prop_mte;
>  
>      /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
>      uint32_t dcz_blocksize;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 0e021960fb5b..20c18b607b0b 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -24,11 +24,16 @@
>  #include "qemu/module.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/hvf.h"
> +#include "sysemu/tcg.h"
>  #include "kvm_arm.h"
>  #include "hvf_arm.h"
>  #include "qapi/visitor.h"
>  #include "hw/qdev-properties.h"
>  #include "internals.h"
> +#include "qapi/qapi-visit-common.h"
> +#if !defined(CONFIG_USER_ONLY)
> +#include "hw/arm/virt.h"
> +#endif
>  
>  static void aarch64_a35_initfn(Object *obj)
>  {
> @@ -1096,6 +1101,113 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
>      cpu->isar.reset_pmcr_el0 = 0x410c3000;
>  }
>  
> +static void aarch64_cpu_get_mte(Object *obj, Visitor *v, const char *name,
> +                                void *opaque, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    OnOffAuto mte = cpu->prop_mte;
> +
> +    visit_type_OnOffAuto(v, name, &mte, errp);
> +}
> +
> +static void aarch64_cpu_set_mte(Object *obj, Visitor *v, const char *name,
> +                                void *opaque, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    visit_type_OnOffAuto(v, name, &cpu->prop_mte, errp);
> +}
> +
> +static void aarch64_add_mte_properties(Object *obj)
> +{
> +    /*
> +     * For tcg, "AUTO" means turn on mte if tag memory has been provided, and
> +     * turn it off (without error) if not.
> +     * For kvm, "AUTO" currently means mte off, as migration is not supported
> +     * yet.
> +     * For all others, "AUTO" means mte off.
> +     */
> +    object_property_add(obj, "mte", "OnOffAuto", aarch64_cpu_get_mte,
> +                        aarch64_cpu_set_mte, NULL, NULL);
> +}
> +
> +static inline bool arm_machine_has_tag_memory(void)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    Object *obj = object_dynamic_cast(qdev_get_machine(), TYPE_VIRT_MACHINE);
> +
> +    /* so far, only the virt machine has support for tag memory */
> +    if (obj) {
> +        VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +        return vms->mte;
> +    }
> +    return false;
> +#endif
> +    return true;
> +}
> +
> +void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    bool enable_mte;
> +
> +    switch (cpu->prop_mte) {
> +    case ON_OFF_AUTO_OFF:
> +        enable_mte = false;
> +        break;
> +    case ON_OFF_AUTO_ON:
> +        if (tcg_enabled()) {
> +            if (cpu_isar_feature(aa64_mte, cpu)) {
> +                if (!arm_machine_has_tag_memory()) {
> +                    error_setg(errp, "mte=on requires tag memory");
> +                    return;
> +                }
> +            } else {
> +                error_setg(errp, "mte not supported by this CPU type");
> +                return;
> +            }
> +        }
> +        if (kvm_enabled() && !kvm_arm_mte_supported()) {
> +            error_setg(errp, "mte not supported by kvm");
> +            return;
> +        }
> +        enable_mte = true;
> +        break;
> +    default: /* AUTO */
> +        if (tcg_enabled()) {
> +            if (cpu_isar_feature(aa64_mte, cpu)) {
> +                /*
> +                 * Tie mte enablement to presence of tag memory, in order to
> +                 * preserve pre-existing behaviour.
> +                 */
> +                enable_mte = arm_machine_has_tag_memory();
> +            } else {
> +                enable_mte = false;
> +            }
> +            break;
> +        } else {
> +            /*
> +             * This cannot yet be
> +             * enable_mte = kvm_arm_mte_supported();
> +             * as we don't support migration yet.
> +             */
> +            enable_mte = false;
> +        }
> +    }
> +
> +    if (!enable_mte) {
> +        /* Disable MTE feature bits. */
> +        cpu->isar.id_aa64pfr1 =
> +            FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
> +        return;
> +    }
> +
> +    /* accelerator-specific enablement */
> +    if (kvm_enabled()) {
> +        kvm_arm_enable_mte(errp);
> +    }
> +}
> +
>  static void aarch64_host_initfn(Object *obj)
>  {
>  #if defined(CONFIG_KVM)
> @@ -1104,6 +1216,7 @@ static void aarch64_host_initfn(Object *obj)
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
>          aarch64_add_pauth_properties(obj);
> +        aarch64_add_mte_properties(obj);
>      }
>  #elif defined(CONFIG_HVF)
>      ARMCPU *cpu = ARM_CPU(obj);
> @@ -1300,6 +1413,7 @@ static void aarch64_max_initfn(Object *obj)
>      object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
>                          cpu_max_set_sve_max_vq, NULL, NULL);
>      qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
> +    aarch64_add_mte_properties(obj);
>  }
>  
>  static const ARMCPUInfo aarch64_cpus[] = {
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index d9555309df0f..4dc6d19be42b 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1348,6 +1348,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
>  void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
>  void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
>  void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
> +void arm_cpu_mte_finalize(ARMCPU *cpu, Error **errp);
>  #endif
>  
>  #ifdef CONFIG_USER_ONLY
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index f022c644d2ff..e6f2cb807bde 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -31,6 +31,7 @@
>  #include "hw/boards.h"
>  #include "hw/irq.h"
>  #include "qemu/log.h"
> +#include "migration/blocker.h"
>  
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
> @@ -1062,3 +1063,31 @@ bool kvm_arch_cpu_check_are_resettable(void)
>  void kvm_arch_accel_class_init(ObjectClass *oc)
>  {
>  }
> +
> +void kvm_arm_enable_mte(Error **errp)
> +{
> +    static bool tried_to_enable = false;
> +    Error *mte_migration_blocker = NULL;
can't you make the mte_migration_blocker static instead?

Thanks

Eric
> +    int ret;
> +
> +    if (tried_to_enable) {
> +        /*
> +         * MTE on KVM is enabled on a per-VM basis (and retrying doesn't make
> +         * sense), and we only want a single migration blocker as well.
> +         */
> +        return;
> +    }
> +    tried_to_enable = true;
> +
> +    if ((ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0))) {
> +        error_setg_errno(errp, -ret, "Failed to enable KVM_CAP_ARM_MTE");
> +        return;
> +    }
> +
> +    /* TODO: add proper migration support with MTE enabled */
> +    error_setg(&mte_migration_blocker,
> +               "Live migration disabled due to MTE enabled");
> +    if (migrate_add_blocker(mte_migration_blocker, errp)) {
> +        error_free(mte_migration_blocker);
> +    }
> +}
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 1197253d12f7..b777bd0a11d2 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -764,6 +764,11 @@ bool kvm_arm_steal_time_supported(void)
>      return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
>  }
>  
> +bool kvm_arm_mte_supported(void)
> +{
> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_MTE);
> +}
> +
>  QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
>  
>  uint32_t kvm_arm_sve_get_vls(CPUState *cs)
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 99017b635ce4..9f88b0722293 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -305,6 +305,13 @@ bool kvm_arm_pmu_supported(void);
>   */
>  bool kvm_arm_sve_supported(void);
>  
> +/**
> + * kvm_arm_mte_supported:
> + *
> + * Returns: true if KVM can enable MTE, and false otherwise.
> + */
> +bool kvm_arm_mte_supported(void);
> +
>  /**
>   * kvm_arm_get_max_vm_ipa_size:
>   * @ms: Machine state handle
> @@ -369,6 +376,8 @@ void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa);
>  
>  int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
>  
> +void kvm_arm_enable_mte(Error **errp);
> +
>  #else
>  
>  /*
> @@ -395,6 +404,11 @@ static inline bool kvm_arm_steal_time_supported(void)
>      return false;
>  }
>  
> +static inline bool kvm_arm_mte_supported(void)
> +{
> +    return false;
> +}
> +
>  /*
>   * These functions should never actually be called without KVM support.
>   */
> @@ -443,6 +457,11 @@ static inline uint32_t kvm_arm_sve_get_vls(CPUState *cs)
>      g_assert_not_reached();
>  }
>  
> +static inline void kvm_arm_enable_mte(Error **errp)
> +{
> +    g_assert_not_reached();
> +}
> +
>  #endif
>  
>  static inline const char *gic_class_name(void)
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index ecdd5ee81742..c419c81612ed 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -96,6 +96,7 @@ static const char *cpu_model_advertised_features[] = {
>      "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
>      "kvm-no-adjvtime", "kvm-steal-time",
>      "pauth", "pauth-impdef",
> +    "mte",
>      NULL
>  };
>  


