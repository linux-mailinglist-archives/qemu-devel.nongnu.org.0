Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B47343E62
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:51:50 +0100 (CET)
Received: from localhost ([::1]:49464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIA1-0001gi-Es
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lOI7T-0000CC-0Q
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lOI7R-0001P3-2E
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616410148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IdMyx4Ge8WP5u/ksqA3Bu4g4/7MUQLUbjBsq/UzTV1M=;
 b=bLnw8SENfbVV81URA+TYMw+n42MUsetPU5ioH/HEuJ9GlOv0vlW+lkku25NweO0ZFIp4CY
 SLddGYmAvF02rjxew/prAxoqdeXDz53/ZZEaC0nLBg/EvHFQkNzMuAJ5XkuKhEzycpvZEq
 jSJyWEm8mh4FV1sVl9FSkkrL5IibeH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-LvMn0ekuOJax2atLdcfg5A-1; Mon, 22 Mar 2021 06:49:06 -0400
X-MC-Unique: LvMn0ekuOJax2atLdcfg5A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22C5781623;
 Mon, 22 Mar 2021 10:49:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D582C2B3BE;
 Mon, 22 Mar 2021 10:49:02 +0000 (UTC)
Date: Mon, 22 Mar 2021 11:48:59 +0100
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH 3/3] Enable nested virtualization support in arm64 KVM mode
Message-ID: <20210322104859.snm764n7sfmrpmrd@kamzik.brq.redhat.com>
References: <cover.1616052889.git.haibo.xu@linaro.org>
 <b7c2626e6c720ccc43e57197dff3dac72d613640.1616052890.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <b7c2626e6c720ccc43e57197dff3dac72d613640.1616052890.git.haibo.xu@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 10:07:26AM +0000, Haibo Xu wrote:
> Add support for arm64 el2 in qemu KVM mode(nested virtualization).
> This feature is disabled by default, just as that in TCG mode, and
> can be enabled by "-M virt,accel=kvm,virtualization=on" when starting
> a VM.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  hw/arm/virt.c        | 11 ++++++++---
>  target/arm/cpu.h     |  8 ++++++++
>  target/arm/kvm64.c   | 14 ++++++++++++++
>  target/arm/kvm_arm.h | 28 ++++++++++++++++++++++++++++
>  4 files changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index aa2bbd14e0..72e60348d5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -663,6 +663,11 @@ static void create_gic(VirtMachineState *vms)
>              qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
>                  MIN(smp_cpus - redist0_count, redist1_capacity));
>          }
> +
> +        if (kvm_irqchip_in_kernel()) {
> +            qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
> +                              vms->virt);
> +        }
>      } else {
>          if (!kvm_irqchip_in_kernel()) {
>              qdev_prop_set_bit(vms->gic, "has-virtualization-extensions",
> @@ -1905,9 +1910,9 @@ static void machvirt_init(MachineState *machine)
>          exit(1);
>      }
>  
> -    if (vms->virt && kvm_enabled()) {
> -        error_report("mach-virt: KVM does not support providing "
> -                     "Virtualization extensions to the guest CPU");
> +    if (vms->virt && kvm_enabled() && !kvm_arm_nested_virt_supported()) {
> +        error_report("mach-virt: nested virtualization requested, "
> +                     "but not supported by the host.");
>          exit(1);
>      }
>  
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 193a49ec7f..377187152b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -4182,6 +4182,14 @@ static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
>  }
>  
> +/*
> + * Currently we don't differentiate between the ARMv8.3-NV and ARMv8.4-NV.
> + */
> +static inline bool isar_feature_aa64_nv(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, NV) != 0;
> +}

What calls this function?

> +
>  /*
>   * Feature tests for "does this exist in either 32-bit or 64-bit?"
>   */
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index dff85f6db9..2810104dea 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -500,6 +500,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       */
>      int fdarray[3];
>      bool sve_supported;
> +    bool el2_supported;
>      uint64_t features = 0;
>      uint64_t t;
>      int err;
> @@ -646,6 +647,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      }
>  
>      sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
> +    el2_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_EL2) > 0;
>  
>      kvm_arm_destroy_scratch_host_vcpu(fdarray);
>  
> @@ -671,6 +673,10 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      features |= 1ULL << ARM_FEATURE_PMU;
>      features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
>  
> +    if (el2_supported) {
> +        features |= 1ULL << ARM_FEATURE_EL2;
> +    }
> +
>      ahcf->features = features;
>  
>      return true;
> @@ -721,6 +727,11 @@ bool kvm_arm_steal_time_supported(void)
>      return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
>  }
>  
> +bool kvm_arm_nested_virt_supported(void)
> +{
> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2);
> +}
> +
>  QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
>  
>  void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
> @@ -856,6 +867,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          assert(kvm_arm_sve_supported());
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
>      }
> +    if (cpu->has_el2) {
> +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
> +    }
>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 34f8daa377..da3a3d5920 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -285,6 +285,24 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
>   */
>  bool kvm_arm_steal_time_supported(void);
>  
> +/**
> + * kvm_arm_nested_virt_finalize:
> + * @cpu: ARMCPU for which to finalize nested-virt
> + * @errp: Pointer to Error* for error propagation
> + *
> + * Validate the nested-virt property selection and set its default
> + * based on KVM support and guest configuration.
> + */
> +void kvm_arm_nested_virt_finalize(ARMCPU *cpu, Error **errp);

Where is this function defined? From where is it called?

> +
> +/**
> + * kvm_arm_nested_virt_supported:
> + *
> + * Returns: true if KVM can enable nested virtualization
> + * and false otherwise.
> + */
> +bool kvm_arm_nested_virt_supported(void);
> +
>  /**
>   * kvm_arm_aarch32_supported:
>   *
> @@ -398,6 +416,11 @@ static inline bool kvm_arm_steal_time_supported(void)
>      return false;
>  }
>  
> +static inline bool kvm_arm_nested_virt_supported(void)
> +{
> +    return false;
> +}
> +
>  /*
>   * These functions should never actually be called without KVM support.
>   */
> @@ -441,6 +464,11 @@ static inline void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
>      g_assert_not_reached();
>  }
>  
> +static inline void kvm_arm_nested_virt_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    g_assert_not_reached();
> +}
> +
>  static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
>  {
>      g_assert_not_reached();
> -- 
> 2.17.1
>

Thanks,
drew 


