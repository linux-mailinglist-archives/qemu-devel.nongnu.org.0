Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 898AD242997
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 14:44:48 +0200 (CEST)
Received: from localhost ([::1]:51356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5q7b-0005oR-Kb
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 08:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k5q4v-00021b-QF
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 08:42:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52436
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1k5q4r-0005Mt-VM
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 08:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597236116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SLcDcsZ3wRT78IqeZRBvSe3SK+fiWRDFcpLbPralw5U=;
 b=hddHoqa+0nI379TNQchC05ajLNFuofuKjg45hPxc2kDQzeKneGBF8DcPkZ5yegeNBlh/qi
 5ZLOnN844i9ycu4JXlAYdKLeEonF2yY71lu3obbHGJ8/jANexFVmuN3m26WKSvuVKypFxO
 rPdiLRJGRSJdnG8ZxCOpaO4sNYurkbo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-prUl_djuMDWTTUV5WMH6UA-1; Wed, 12 Aug 2020 08:41:52 -0400
X-MC-Unique: prUl_djuMDWTTUV5WMH6UA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B821918551A9;
 Wed, 12 Aug 2020 12:41:51 +0000 (UTC)
Received: from [10.36.113.93] (ovpn-113-93.ams2.redhat.com [10.36.113.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36E5B5D9D7;
 Wed, 12 Aug 2020 12:41:50 +0000 (UTC)
Subject: Re: [PATCH v2 5/5] hw/arm/virt: Implement kvm-steal-time
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200805091640.11134-1-drjones@redhat.com>
 <20200805091640.11134-6-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <89849f50-c0f3-6d3a-46c8-245257384df2@redhat.com>
Date: Wed, 12 Aug 2020 14:41:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200805091640.11134-6-drjones@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/12 06:16:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drew,

On 8/5/20 11:16 AM, Andrew Jones wrote:
> We add the kvm-steal-time CPU property and implement it for machvirt.
> A tiny bit of refactoring was also done to allow pmu and pvtime to
> use the same vcpu device helper functions.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst | 11 +++++
>  hw/arm/virt.c                    | 43 ++++++++++++++++--
>  include/hw/arm/virt.h            |  5 +++
>  target/arm/cpu.c                 | 10 +++++
>  target/arm/cpu.h                 |  4 ++
>  target/arm/kvm.c                 | 20 +++++++++
>  target/arm/kvm32.c               |  5 +++
>  target/arm/kvm64.c               | 77 +++++++++++++++++++++++++++++---
>  target/arm/kvm_arm.h             | 30 +++++++++++++
>  target/arm/monitor.c             |  2 +-
>  tests/qtest/arm-cpu-features.c   | 25 +++++++++--
>  11 files changed, 219 insertions(+), 13 deletions(-)
> 
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 2d5c06cd016b..35196a6b759d 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -200,6 +200,17 @@ the list of KVM VCPU features and their descriptions.
>                             adjustment, also restoring the legacy (pre-5.0)
>                             behavior.
>  
> +  kvm-steal-time           Since v5.2, kvm-steal-time is enabled by
> +                           default when KVM is enabled, the feature is
> +                           supported, and the guest is 64-bit.
> +
> +                           When kvm-steal-time is enabled a 64-bit guest
> +                           can account for time its CPUs were not running
> +                           due to the host not scheduling the corresponding
> +                           VCPU threads.  The accounting statistics may
> +                           influence the guest scheduler behavior and/or be
> +                           exposed to the guest userspace.
> +
>  SVE CPU Properties
>  ==================
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6797eb397a7a..12efc2f095cb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -151,6 +151,7 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
>      [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
>      [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
> +    [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -1666,15 +1667,39 @@ static void finalize_gic_version(VirtMachineState *vms)
>   * virt_cpu_post_init() must be called after the CPUs have
>   * been realized and the GIC has been created.
>   */
> -static void virt_cpu_post_init(VirtMachineState *vms)
> +static void virt_cpu_post_init(VirtMachineState *vms, int max_cpus,
> +                               MemoryRegion *sysmem)
>  {
> -    bool aarch64, pmu;
> +    bool aarch64, pmu, steal_time;
>      CPUState *cpu;
>  
>      aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
>      pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
> +    steal_time = object_property_get_bool(OBJECT(first_cpu),
> +                                          "kvm-steal-time", NULL);
>  
>      if (kvm_enabled()) {> +        hwaddr pvtime_reg_base = vms->memmap[VIRT_PVTIME].base;
> +        hwaddr pvtime_reg_size = vms->memmap[VIRT_PVTIME].size;
> +
> +        if (steal_time) {
> +            MemoryRegion *pvtime = g_new(MemoryRegion, 1);
> +            hwaddr pvtime_size = max_cpus * PVTIME_SIZE_PER_CPU;
> +
> +            /* The memory region size must be a multiple of host page size. */
> +            pvtime_size = REAL_HOST_PAGE_ALIGN(pvtime_size);
> +
> +            if (pvtime_size > pvtime_reg_size) {
> +                error_report("pvtime requires a %ld byte memory region for "
> +                             "%d CPUs, but only %ld has been reserved",
> +                             pvtime_size, max_cpus, pvtime_reg_size);
> +                exit(1);
> +            }
> +
> +            memory_region_init_ram(pvtime, NULL, "pvtime", pvtime_size, NULL);
> +            memory_region_add_subregion(sysmem, pvtime_reg_base, pvtime);
> +        }
> +
>          CPU_FOREACH(cpu) {
>              if (pmu) {
>                  assert(arm_feature(&ARM_CPU(cpu)->env, ARM_FEATURE_PMU));
> @@ -1683,6 +1708,10 @@ static void virt_cpu_post_init(VirtMachineState *vms)
>                  }
>                  kvm_arm_pmu_init(cpu);
>              }
> +            if (steal_time) {
> +                kvm_arm_pvtime_init(cpu, pvtime_reg_base +
> +                                         cpu->cpu_index * PVTIME_SIZE_PER_CPU);
> +            }
>          }
>      } else {
>          if (aarch64 && vms->highmem) {
> @@ -1853,6 +1882,11 @@ static void machvirt_init(MachineState *machine)
>              object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
>          }
>  
> +        if (vmc->no_kvm_steal_time &&
> +            object_property_find(cpuobj, "kvm-steal-time", NULL)) {
> +            object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
> +        }
> +
>          if (vmc->no_pmu && object_property_find(cpuobj, "pmu", NULL)) {
>              object_property_set_bool(cpuobj, "pmu", false, NULL);
>          }
> @@ -1924,7 +1958,7 @@ static void machvirt_init(MachineState *machine)
>  
>      create_gic(vms);
>  
> -    virt_cpu_post_init(vms);
> +    virt_cpu_post_init(vms, possible_cpus->len, sysmem);
>  
>      fdt_add_pmu_nodes(vms);
>  
> @@ -2566,8 +2600,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
>  
>  static void virt_machine_5_1_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_5_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
> +    vmc->no_kvm_steal_time = true;
>  }
>  DEFINE_VIRT_MACHINE(5, 1)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index dff67e1bef03..5fb43a009f7a 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -53,6 +53,9 @@
>  
>  #define PPI(irq) ((irq) + 16)
>  
> +/* See Linux kernel arch/arm64/include/asm/pvclock-abi.h */
> +#define PVTIME_SIZE_PER_CPU 64
> +
>  enum {
>      VIRT_FLASH,
>      VIRT_MEM,
> @@ -80,6 +83,7 @@ enum {
>      VIRT_PCDIMM_ACPI,
>      VIRT_ACPI_GED,
>      VIRT_NVDIMM_ACPI,
> +    VIRT_PVTIME,
>      VIRT_LOWMEMMAP_LAST,
>  };
>  
> @@ -126,6 +130,7 @@ typedef struct {
>      bool no_ged;   /* Machines < 4.2 has no support for ACPI GED device */
>      bool kvm_no_adjvtime;
>      bool acpi_expose_flash;
> +    bool no_kvm_steal_time;
>  } VirtMachineClass;
>  
>  typedef struct {
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 111579554fb9..866d0a9fb146 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1308,6 +1308,16 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>              return;
>          }
>      }
> +
> +    if (kvm_enabled()) {
> +#ifdef TARGET_AARCH64
> +        kvm_arm_steal_time_finalize(cpu, &local_err);
> +        if (local_err != NULL) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +#endif
> +    }
>  }
>  
>  static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9e8ed423ea1d..a4d4cb640c77 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -24,6 +24,7 @@
>  #include "hw/registerfields.h"
>  #include "cpu-qom.h"
>  #include "exec/cpu-defs.h"
> +#include "qapi/qapi-types-common.h"
>  
>  /* ARM processors have a weak memory model */
>  #define TCG_GUEST_DEFAULT_MO      (0)
> @@ -859,6 +860,9 @@ struct ARMCPU {
>      bool kvm_vtime_dirty;
>      uint64_t kvm_vtime;
>  
> +    /* KVM steal time */
> +    OnOffAuto kvm_steal_time;
> +
>      /* Uniprocessor system with MP extensions */
>      bool mp_is_up;
>  
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 8bb7318378b5..093a290453f6 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -192,6 +192,18 @@ static void kvm_no_adjvtime_set(Object *obj, bool value, Error **errp)
>      ARM_CPU(obj)->kvm_adjvtime = !value;
>  }
>  
> +#ifdef TARGET_AARCH64
> +static bool kvm_steal_time_get(Object *obj, Error **errp)
> +{
> +    return ARM_CPU(obj)->kvm_steal_time != ON_OFF_AUTO_OFF;
> +}
> +
> +static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
> +{
> +    ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
> +}
> +#endif
> +
>  /* KVM VCPU properties should be prefixed with "kvm-". */
>  void kvm_arm_add_vcpu_properties(Object *obj)
>  {
> @@ -207,6 +219,14 @@ void kvm_arm_add_vcpu_properties(Object *obj)
>                                          "the virtual counter. VM stopped time "
>                                          "will be counted.");
>      }
> +
> +#ifdef TARGET_AARCH64
> +    cpu->kvm_steal_time = ON_OFF_AUTO_AUTO;
> +    object_property_add_bool(obj, "kvm-steal-time", kvm_steal_time_get,
> +                             kvm_steal_time_set);
> +    object_property_set_description(obj, "kvm-steal-time",
> +                                    "Set off to disable KVM steal time.");
> +#endif
>  }
>  
>  bool kvm_arm_pmu_supported(void)
> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
> index 0af46b41c847..d3f3195077fa 100644
> --- a/target/arm/kvm32.c
> +++ b/target/arm/kvm32.c
> @@ -560,6 +560,11 @@ void kvm_arm_pmu_init(CPUState *cs)
>      qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
>  }
>  
> +void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s: not implemented\n", __func__);
> +}
> +
>  #define ARM_REG_DFSR  ARM_CP15_REG32(0, 5, 0, 0)
>  #define ARM_REG_TTBCR ARM_CP15_REG32(0, 2, 0, 2)
>  /*
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 116923790550..4de1eeb723ac 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -17,6 +17,7 @@
>  #include <linux/kvm.h>
>  
>  #include "qemu-common.h"
> +#include "qapi/error.h"
>  #include "cpu.h"
>  #include "qemu/timer.h"
>  #include "qemu/error-report.h"
> @@ -398,19 +399,20 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
>      return NULL;
>  }
>  
> -static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_attr *attr)
> +static bool kvm_arm_set_device_attr(CPUState *cs, struct kvm_device_attr *attr,
> +                                    const char *name)
>  {
>      int err;
>  
>      err = kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, attr);
>      if (err != 0) {
> -        error_report("PMU: KVM_HAS_DEVICE_ATTR: %s", strerror(-err));
> +        error_report("%s: KVM_HAS_DEVICE_ATTR: %s", name, strerror(-err));
>          return false;
>      }
>  
>      err = kvm_vcpu_ioctl(cs, KVM_SET_DEVICE_ATTR, attr);
>      if (err != 0) {
> -        error_report("PMU: KVM_SET_DEVICE_ATTR: %s", strerror(-err));
> +        error_report("%s: KVM_SET_DEVICE_ATTR: %s", name, strerror(-err));
>          return false;
>      }
>  
> @@ -427,7 +429,7 @@ void kvm_arm_pmu_init(CPUState *cs)
>      if (!ARM_CPU(cs)->has_pmu) {
>          return;
>      }
> -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> +    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
>          error_report("failed to init PMU");
>          abort();
>      }
> @@ -444,12 +446,29 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
>      if (!ARM_CPU(cs)->has_pmu) {
>          return;
>      }
> -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> +    if (!kvm_arm_set_device_attr(cs, &attr, "PMU")) {
>          error_report("failed to set irq for PMU");
>          abort();
>      }
>  }
>  
> +void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
> +{
> +    struct kvm_device_attr attr = {
> +        .group = KVM_ARM_VCPU_PVTIME_CTRL,
> +        .attr = KVM_ARM_VCPU_PVTIME_IPA,
> +        .addr = (uint64_t)&ipa,
> +    };
> +
> +    if (ARM_CPU(cs)->kvm_steal_time == ON_OFF_AUTO_OFF) {
> +        return;
> +    }
> +    if (!kvm_arm_set_device_attr(cs, &attr, "PVTIME IPA")) {
> +        error_report("failed to init PVTIME IPA");
> +        abort();
> +    }
> +}
> +
>  static int read_sys_reg32(int fd, uint32_t *pret, uint64_t id)
>  {
>      uint64_t ret;
> @@ -652,6 +671,54 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      return true;
>  }
>  
> +void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    static bool has_steal_time;
> +    static bool probed;
> +    int fdarray[3];
> +
> +    if (!probed) {
> +        probed = true;
> +        if (kvm_check_extension(kvm_state, KVM_CAP_VCPU_ATTRIBUTES)) {
> +            if (!kvm_arm_create_scratch_host_vcpu(NULL, fdarray, NULL)) {
> +                error_report("Failed to create scratch VCPU");
> +                abort();
> +            }
> +
> +            has_steal_time = kvm_device_check_attr(fdarray[2],
> +                                                   KVM_ARM_VCPU_PVTIME_CTRL,
> +                                                   KVM_ARM_VCPU_PVTIME_IPA);
> +
> +            kvm_arm_destroy_scratch_host_vcpu(fdarray);
> +        }
> +    }
> +
> +    if (cpu->kvm_steal_time == ON_OFF_AUTO_AUTO) {
> +        if (!has_steal_time || !arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +            cpu->kvm_steal_time = ON_OFF_AUTO_OFF;
> +        } else {
> +            cpu->kvm_steal_time = ON_OFF_AUTO_ON;
> +        }
> +    } else if (cpu->kvm_steal_time == ON_OFF_AUTO_ON) {
> +        if (!has_steal_time) {
> +            error_setg(errp, "'kvm-steal-time' cannot be enabled "
> +                             "on this host");
> +            return;
> +        } else if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +            /*
> +             * DEN0057A chapter 2 says "This specification only covers
> +             * systems in which the Execution state of the hypervisor
> +             * as well as EL1 of virtual machines is AArch64.". And,
> +             * to ensure that, the smc/hvc calls are only specified as
> +             * smc64/hvc64.
> +             */
> +            error_setg(errp, "'kvm-steal-time' cannot be enabled "
> +                             "for AArch32 guests");
> +            return;
> +        }
> +    }
> +}
> +
>  bool kvm_arm_aarch32_supported(void)
>  {
>      return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL1_32BIT);
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 0da00eb6b20c..4a8969505967 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -267,6 +267,16 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>   */
>  void kvm_arm_add_vcpu_properties(Object *obj);
>  
> +/**
> + * kvm_arm_steal_time_finalize:
> + * @cpu: ARMCPU for which to finalize kvm-steal-time
> + * @errp: Pointer to Error* for error propagation
> + *
> + * Validate the kvm-steal-time property selection and set its default
> + * based on KVM support and guest configuration.
> + */
> +void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
> +
>  /**
>   * kvm_arm_aarch32_supported:
>   *
> @@ -340,6 +350,16 @@ int kvm_arm_vgic_probe(void);
>  
>  void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
>  void kvm_arm_pmu_init(CPUState *cs);
> +
> +/**
> + * kvm_arm_pvtime_init:
> + * @cs: CPUState
> + * @ipa: Per-vcpu guest physical base address of the pvtime structures
> + *
> + * Initializes PVTIME for the VCPU, setting the PVTIME IPA to @ipa.
> + */
> +void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa);
> +
>  int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
>  
>  #else
> @@ -393,6 +413,16 @@ static inline void kvm_arm_pmu_init(CPUState *cs)
>      g_assert_not_reached();
>  }
>  
> +static inline void kvm_arm_pvtime_init(CPUState *cs, uint64_t ipa)
> +{
> +    g_assert_not_reached();
> +}
> +
> +static inline void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
> +{
> +    g_assert_not_reached();
> +}
> +
>  static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
>  {
>      g_assert_not_reached();
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index ba6e01abd037..bd3590604a71 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -103,7 +103,7 @@ static const char *cpu_model_advertised_features[] = {
>      "sve128", "sve256", "sve384", "sve512",
>      "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
>      "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
> -    "kvm-no-adjvtime",
> +    "kvm-no-adjvtime", "kvm-steal-time",
>      NULL
>  };
>  
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index f7e062c1891e..91b181f38268 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -452,6 +452,7 @@ static void test_query_cpu_model_expansion(const void *data)
>      assert_set_feature(qts, "max", "pmu", true);
>  
>      assert_has_not_feature(qts, "max", "kvm-no-adjvtime");
> +    assert_has_not_feature(qts, "max", "kvm-steal-time");
>  
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          assert_has_feature_enabled(qts, "max", "aarch64");
> @@ -493,6 +494,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>      assert_set_feature(qts, "host", "kvm-no-adjvtime", false);
>  
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
> +        bool kvm_supports_steal_time;
>          bool kvm_supports_sve;
>          char max_name[8], name[8];
>          uint32_t max_vq, vq;
> @@ -500,6 +502,10 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>          QDict *resp;
>          char *error;
>  
> +        assert_error(qts, "cortex-a15",
> +            "We cannot guarantee the CPU type 'cortex-a15' works "
> +            "with KVM on this host", NULL);
> +
>          assert_has_feature_enabled(qts, "host", "aarch64");
>  
>          /* Enabling and disabling pmu should always work. */
> @@ -507,16 +513,26 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>          assert_set_feature(qts, "host", "pmu", false);
>          assert_set_feature(qts, "host", "pmu", true);
>  
> -        assert_error(qts, "cortex-a15",
> -            "We cannot guarantee the CPU type 'cortex-a15' works "
> -            "with KVM on this host", NULL);
> -
> +        /*
> +         * Some features would be enabled by default, but they're disabled
> +         * because this instance of KVM doesn't support them. Test that the
> +         * features are present, and, when enabled, issue further tests.
> +         */
> +        assert_has_feature(qts, "host", "kvm-steal-time");
>          assert_has_feature(qts, "host", "sve");
> +
>          resp = do_query_no_props(qts, "host");
> +        kvm_supports_steal_time = resp_get_feature(resp, "kvm-steal-time");
>          kvm_supports_sve = resp_get_feature(resp, "sve");
>          vls = resp_get_sve_vls(resp);
>          qobject_unref(resp);
>  
> +        if (kvm_supports_steal_time) {
> +            /* If we have steal-time then we should be able to toggle it. */
> +            assert_set_feature(qts, "host", "kvm-steal-time", false);
> +            assert_set_feature(qts, "host", "kvm-steal-time", true);
> +        }
> +
>          if (kvm_supports_sve) {
>              g_assert(vls != 0);
>              max_vq = 64 - __builtin_clzll(vls);
> @@ -577,6 +593,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>          assert_has_not_feature(qts, "host", "aarch64");
>          assert_has_not_feature(qts, "host", "pmu");
>          assert_has_not_feature(qts, "host", "sve");
> +        assert_has_not_feature(qts, "host", "kvm-steal-time");
>      }
>  
>      qtest_quit(qts);
> 
This looks good to me
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric


