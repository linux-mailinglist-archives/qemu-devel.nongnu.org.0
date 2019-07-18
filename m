Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 246BA6CE34
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 14:42:22 +0200 (CEST)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho5jo-00014M-Ec
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 08:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46707)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1ho5jZ-0000Vl-L6
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 08:42:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ho5jX-00050x-Sx
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 08:42:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38788)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1ho5jR-0004rc-Vl; Thu, 18 Jul 2019 08:41:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3DEB030842A1;
 Thu, 18 Jul 2019 12:41:53 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E14A85D9D5;
 Thu, 18 Jul 2019 12:41:47 +0000 (UTC)
Date: Thu, 18 Jul 2019 14:41:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190718144146.0af95667@redhat.com>
In-Reply-To: <20190716153816.17676-7-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
 <20190716153816.17676-7-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 18 Jul 2019 12:41:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v7 06/10] hw/arm/virt: Enable
 device memory cold/hot plug with ACPI boot
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Jul 2019 16:38:12 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This initializes the GED device with base memory and irq, configures
> ged memory hotplug event and builds the corresponding aml code. With
> this, both hot and cold plug of device memory is enabled now for Guest
> with ACPI boot.
> 
> Memory cold plug support with Guest DT boot is not yet supported.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
> v6 --> v7
>   Disabled ACPI GED dev creation for machine < 4.2.
> 
> ---
>  hw/arm/Kconfig           |  2 ++
>  hw/arm/virt-acpi-build.c | 14 +++++++++++
>  hw/arm/virt.c            | 51 ++++++++++++++++++++++++++++++++++------
>  include/hw/arm/virt.h    |  4 ++++
>  4 files changed, 64 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 84961c17ab..ad7f7c089b 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -22,6 +22,8 @@ config ARM_VIRT
>      select ACPI_PCI
>      select MEM_DEVICE
>      select DIMM
> +    select ACPI_MEMORY_HOTPLUG
> +    select ACPI_HW_REDUCED
>  
>  config CHEETAH
>      bool
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 0afb372769..018b1e326d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -40,6 +40,8 @@
>  #include "hw/acpi/aml-build.h"
>  #include "hw/acpi/utils.h"
>  #include "hw/acpi/pci.h"
> +#include "hw/acpi/memory_hotplug.h"
> +#include "hw/acpi/generic_event_device.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/arm/virt.h"
> @@ -705,6 +707,7 @@ static void
>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      Aml *scope, *dsdt;
> +    MachineState *ms = MACHINE(vms);
>      const MemMapEntry *memmap = vms->memmap;
>      const int *irqmap = vms->irqmap;
>  
> @@ -729,6 +732,17 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                        vms->highmem, vms->highmem_ecam);
>      acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
>                         (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
> +    if (vms->acpi_dev) {
> +        build_ged_aml(scope, "\\_SB."GED_DEVICE,
> +                      HOTPLUG_HANDLER(vms->acpi_dev),
> +                      irqmap[VIRT_ACPI_GED] + ARM_SPI_BASE, AML_SYSTEM_MEMORY);
> +    }
> +
> +    if (vms->acpi_dev && ms->ram_slots) {
> +        build_memory_hotplug_aml(scope, ms->ram_slots, "\\_SB", NULL,
> +                                 AML_SYSTEM_MEMORY);
> +    }
> +
>      acpi_dsdt_add_power_button(scope);
>  
>      aml_append(dsdt, scope);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index bbe156dc35..ffcccc05ad 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -66,6 +66,7 @@
>  #include "target/arm/internals.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
> +#include "hw/acpi/generic_event_device.h"
>  
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -136,6 +137,8 @@ static const MemMapEntry base_memmap[] = {
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
> +    [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
> +    [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_REG_LEN },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -171,6 +174,7 @@ static const int a15irqmap[] = {
>      [VIRT_PCIE] = 3, /* ... to 6 */
>      [VIRT_GPIO] = 7,
>      [VIRT_SECURE_UART] = 8,
> +    [VIRT_ACPI_GED] = 9,
>      [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
>      [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
>      [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
> @@ -520,6 +524,25 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>      }
>  }
>  
> +static inline DeviceState *create_acpi_ged(VirtMachineState *vms, qemu_irq *pic)
> +{
> +    DeviceState *dev;
> +    int irq = vms->irqmap[VIRT_ACPI_GED];
> +    uint32_t event = ACPI_GED_MEM_HOTPLUG_EVT;
> +
> +    dev = DEVICE(object_new(TYPE_ACPI_GED));
> +    qdev_prop_set_uint64(dev, "memhp-base",
> +                         vms->memmap[VIRT_PCDIMM_ACPI].base);
> +    qdev_prop_set_uint64(dev, "ged-base", vms->memmap[VIRT_ACPI_GED].base);
> +    qdev_prop_set_uint32(dev, "ged-event", event);
> +    object_property_add_child(qdev_get_machine(), "acpi-ged",
> +                              OBJECT(dev), NULL);
> +    qdev_init_nofail(dev);
> +    qdev_connect_gpio_out_named(dev, "ged-irq", 0, pic[irq]);

leaking 'dev' reference created by object_new(), you need to unref it here.

> +
> +    return dev;
> +}
> +
>  static void create_its(VirtMachineState *vms, DeviceState *gicdev)
>  {
>      const char *itsclass = its_class_name();
> @@ -1697,6 +1720,10 @@ static void machvirt_init(MachineState *machine)
>  
>      create_gpio(vms, pic);
>  
> +    if (!vmc->no_acpi_dev && aarch64 && firmware_loaded && acpi_enabled) {
suggest s/no_acpi_dev/has_ged/

> +        vms->acpi_dev = create_acpi_ged(vms, pic);
> +    }
> +
>      /* Create mmio transports, so the user can create virtio backends
>       * (which will be automatically plugged in to the transports). If
>       * no backend is created the transport will just sit harmlessly idle.
> @@ -1876,27 +1903,34 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>  static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>                                   Error **errp)
>  {
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>  
> -    /*
> -     * The device memory is not yet exposed to the Guest either through
> -     * DT or ACPI and hence both cold/hot plug of memory is explicitly
> -     * disabled for now.
> -     */
> -    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> -        error_setg(errp, "memory cold/hot plug is not yet supported");
> +    if (is_nvdimm) {
> +        error_setg(errp, "nvdimm is not yet supported");
>          return;
>      }
>  
> +    if (!vms->acpi_dev) {
> +        error_setg(errp, "memory hotplug is not enabled: missing acpi device");
> +        return;
> +    }
> +
> +    hotplug_handler_pre_plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, errp);
> +
>      pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
>  }
>  
>  static void virt_memory_plug(HotplugHandler *hotplug_dev,
>                               DeviceState *dev, Error **errp)
>  {
> +    HotplugHandlerClass *hhc;
>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>  
>      pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), NULL);
>  
> +    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
> +    hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, NULL);
>  }
>  
>  static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> @@ -2102,8 +2136,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(4, 2)
>  
>  static void virt_machine_4_1_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_4_2_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_len);
> +    vmc->no_acpi_dev = true;
>  }
>  DEFINE_VIRT_MACHINE(4, 1)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index a72094204e..32892af1dd 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -77,6 +77,8 @@ enum {
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_PCDIMM_ACPI,
> +    VIRT_ACPI_GED,
>      VIRT_LOWMEMMAP_LAST,
>  };
>  
> @@ -106,6 +108,7 @@ typedef struct {
>      bool claim_edge_triggered_timers;
>      bool smbios_old_sys_ver;
>      bool no_highmem_ecam;
> +    bool no_acpi_dev;
it deserved a comment or maybe be more specific and s/acpi_dev/ged/ + comment

>  } VirtMachineClass;
>  
>  typedef struct {
> @@ -133,6 +136,7 @@ typedef struct {
>      uint32_t iommu_phandle;
>      int psci_conduit;
>      hwaddr highest_gpa;
> +    DeviceState *acpi_dev;
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)


