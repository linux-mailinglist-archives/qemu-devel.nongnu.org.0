Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45D236C1AF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:26:49 +0200 (CEST)
Received: from localhost ([::1]:43744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbJzU-0002hL-On
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJxK-0001BS-4c
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:24:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbJxG-0001Su-3Y
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619515468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GL4xdjVlNe4H7m/vo3sYq7By6/D+yy08WE+aX94vJvU=;
 b=UjEtUS8O6E//1kPi97lvMvwiKyVWwTZiD/h/r9F/fdHAIR1BLZ7SZ4eQRbN1BkZNSbgRjj
 vdVt6OAf9AA9qZcDofNursopNVJ3rWtEfXKArkJSB7P08ks+wpm9PPFgV+Ec2yv9KwTlV5
 I5YAO+3eLBewyIDjBEhxDVcPrCAZwN0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125--N6a2JHLNny-3IoQCrNV4w-1; Tue, 27 Apr 2021 05:24:27 -0400
X-MC-Unique: -N6a2JHLNny-3IoQCrNV4w-1
Received: by mail-ed1-f72.google.com with SMTP id
 l7-20020aa7c3070000b029038502ffe9f2so18757183edq.16
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 02:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GL4xdjVlNe4H7m/vo3sYq7By6/D+yy08WE+aX94vJvU=;
 b=USx3j018g7SvUZBVXretZD9EWHBCan9FZiIZoFSUnhT/IxpLtAMadqMBCojHXGx53o
 O2exSCeD/EyQzsE9LyOfx3WGmp1pJmF3ytSrDkNIgR40SqUAwVDvUeHpvDuwrf63YBwh
 VEpWjHIDHi3gunhyuwQbqVbp21Ew2IC3dFczXGe5JaIueeUbPkCLxix5JNdHl0EusJei
 eB2IH6IJq7JSjonhRu2mwcbP1KkBrDuEC5rqQ2V9TUpR//1lJi+qnzl5Y8ztF2KOtLmm
 EddXsGEcDdTxlXNa92Vtilhgz7M3RH6RYhej7BvWePed9L1bvBP1C0BTc0fiq6P8nlix
 tF6w==
X-Gm-Message-State: AOAM533Dh3mfdL5xsy8QylvOW79EPNMWdoWU7QJzb0jtWfz9G4O6mRHM
 75HkPmPsEBSlqSqKe94eeVIUrp/eOve5a5ejYORnvStZXvrGQTnLKRRA2hJDyMJ8X3owWvZl+zb
 1xxRWLMEFXT1dMuM=
X-Received: by 2002:a17:906:dfe3:: with SMTP id
 lc3mr1807378ejc.320.1619515465636; 
 Tue, 27 Apr 2021 02:24:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcSYxJArV3QQB2iqyOOBjhhUD1+2rYbDa6vUxLl5bQzbzzndBXcU0cPnEfIAg/Au2R3jzYCA==
X-Received: by 2002:a17:906:dfe3:: with SMTP id
 lc3mr1807360ejc.320.1619515465408; 
 Tue, 27 Apr 2021 02:24:25 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id x7sm12700415ejc.116.2021.04.27.02.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:24:25 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:24:23 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH RESEND v2 5/6] target/arm/cpu: Enable 'el2' to work with
 host/max cpu
Message-ID: <20210427092423.q3ktw4kkd5xhapad@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <37df1b1872f15086dd1d066e53dc1eedaf114051.1617281290.git.haibo.xu@linaro.org>
MIME-Version: 1.0
In-Reply-To: <37df1b1872f15086dd1d066e53dc1eedaf114051.1617281290.git.haibo.xu@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 05:55:37AM -0700, Haibo Xu wrote:
> Turn off the 'el2' cpu property by default to keep in line with
> that in TCG mode, i.e. we can now use '-cpu max|host,el2=on' to
> enable the nested virtualization.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> ---
>  hw/arm/virt.c      | 14 ++++++++++----
>  target/arm/cpu.c   |  3 ++-
>  target/arm/cpu64.c |  1 +
>  target/arm/kvm64.c | 10 ++++++++++
>  4 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 92d46ebcfe..74340e21bd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -454,6 +454,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>  {
>      MachineState *ms = MACHINE(vms);
>      char *nodename;
> +    bool has_el2 = object_property_get_bool(OBJECT(first_cpu), "el2", NULL);
>  
>      vms->gic_phandle = qemu_fdt_alloc_phandle(ms->fdt);
>      qemu_fdt_setprop_cell(ms->fdt, "/", "interrupt-parent", vms->gic_phandle);
> @@ -491,7 +492,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>                                   2, vms->memmap[VIRT_HIGH_GIC_REDIST2].size);
>          }
>  
> -        if (vms->virt) {
> +        if (vms->virt || has_el2) {
>              qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
>                                     GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
>                                     GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> @@ -1911,8 +1912,8 @@ static void machvirt_init(MachineState *machine)
>      }
>  
>      if (vms->virt && kvm_enabled()) {
> -        error_report("mach-virt: KVM does not support providing "
> -                     "Virtualization extensions to the guest CPU");
> +        error_report("mach-virt: VM 'virtualization' feature is not supported "
> +                     "in KVM mode, please use CPU feature 'el2' instead");
>          exit(1);
>      }
>  
> @@ -1950,11 +1951,16 @@ static void machvirt_init(MachineState *machine)
>              object_property_set_bool(cpuobj, "has_el3", false, NULL);
>          }
>  
> -        if (!vms->virt && object_property_find(cpuobj, "has_el2")) {
> +        if (!vms->virt && !kvm_enabled() &&
> +            object_property_find(cpuobj, "has_el2")) {
>              object_property_set_bool(cpuobj, "has_el2", false, NULL);
>          }
>  
>          if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
> +            if (kvm_enabled() && ARM_CPU(cpuobj)->has_el2) {
> +                vms->psci_conduit = QEMU_PSCI_CONDUIT_SMC;
> +            }
> +
>              object_property_set_int(cpuobj, "psci-conduit", vms->psci_conduit,
>                                      NULL);

Is there any reason not to do

  vms->virt = object_property_get_bool(OBJECT(first_cpu), "el2", NULL);

right after we do the cpu realize loop here in machvirt_init()? If we did
that we wouldn't need to scatter that object_property_get_bool() around.
We'd just use 'vms->virt'. Actually, shouldn't vms->virt be consistent
with cpu->has_el2 anyway?

>  
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 30cc330f50..9530a2c4bf 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1099,7 +1099,7 @@ static Property arm_cpu_rvbar_property =
>  
>  #ifndef CONFIG_USER_ONLY
>  static Property arm_cpu_has_el2_property =
> -            DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
> +            DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, false);

Doesn't this break TCG's enablement of the feature?

>  
>  static Property arm_cpu_has_el3_property =
>              DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
> @@ -2018,6 +2018,7 @@ static void arm_host_initfn(Object *obj)
>      kvm_arm_set_cpu_features_from_host(cpu);
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
> +        aarch64_add_el2_properties(obj);
>      }
>      arm_cpu_post_init(obj);
>  }
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 3f3f2c5495..ae8811d09e 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -666,6 +666,7 @@ static void aarch64_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> +        aarch64_add_el2_properties(obj);
>      } else {
>          uint64_t t;
>          uint32_t u;
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 9cacaf2eb8..7bf892404f 100644
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
> @@ -660,6 +662,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          ahcf->isar.id_aa64pfr0 = t;
>      }
>  
> +    /* Use the ARM_FEATURE_EL2 bit to keep inline with that in TCG mode. */
> +    if (el2_supported) {
> +        features |= 1ULL << ARM_FEATURE_EL2;
> +    }

Do we need to do this? Why not just used kvm_arm_el2_supported()? Note, we
add a check for SVE here because we want to update ID_AA64PFR0. Unless you
want to update ID registers, which maybe you should, then I don't think we
need to touch kvm_arm_get_host_cpu_features().

> +
>      /*
>       * We can assume any KVM supporting CPU is at least a v8
>       * with VFPv4+Neon; this in turn implies most of the other
> @@ -861,6 +868,9 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          assert(kvm_arm_sve_supported());
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
>      }
> +    if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
> +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
> +    }

I feel like there are way too many ways to track this feature now. If I
didn't lose count we have

 1) cpu->has_el2
 2) cpu->env & ARM_FEATURE_EL2
 3) (for mach-virt) vms->virt
 4) possibly (and probably should) some ID register bits

I realize the first three are already in use for TCG, but I'm guessing
we'll want to clean those up. What's the plan going forward? I presume
it'll be (4), but maybe something like (1) and/or (3) will stick around
for convenience. I'm pretty sure we want to avoid (2).

I suggest figuring out what's the best way forward (at least for a next
step) and then post a patch that changes TCG's use to that and then use
that for KVM too.

>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
> -- 
> 2.17.1
> 
> 

Thanks,
drew


