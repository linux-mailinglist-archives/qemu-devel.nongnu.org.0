Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A8F337283
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:25:47 +0100 (CET)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKNu-0000mS-Tl
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lKKMw-0000By-Ha; Thu, 11 Mar 2021 07:24:46 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:4484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lKKMs-0000Ae-V8; Thu, 11 Mar 2021 07:24:46 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dx7Pj1HpDzrTtH;
 Thu, 11 Mar 2021 20:22:49 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Thu, 11 Mar 2021 20:24:31 +0800
To: Auger Eric <eric.auger@redhat.com>, <qemu-devel@nongnu.org>
References: <1614414831-39712-1-git-send-email-wangxingang5@huawei.com>
 <1614414831-39712-3-git-send-email-wangxingang5@huawei.com>
 <d5cac8e3-2584-e904-0d1f-92058b45975e@redhat.com>
From: Wang Xingang <wangxingang5@huawei.com>
Subject: Re: [RFC RESEND PATCH 2/4] hw/pci: Add iommu option for pci root bus
Message-ID: <0aa15918-44fb-1b61-e520-a3ac8f6da4de@huawei.com>
Date: Thu, 11 Mar 2021 20:24:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <d5cac8e3-2584-e904-0d1f-92058b45975e@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/3/10 18:24, Auger Eric wrote:
> Hi Xingang,
> 
> On 2/27/21 9:33 AM, Wang Xingang wrote:
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> This add iommu option for pci root bus, including primary bus
>> and pxb root bus. Default option is set to true, and the option
>> is valid only if the iommu option for machine is properly set.
>>
>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
>> ---
>>   hw/arm/virt.c                       | 29 +++++++++++++++++++++++++++++
>>   hw/pci-bridge/pci_expander_bridge.c |  6 ++++++
>>   hw/pci/pci.c                        |  2 +-
>>   include/hw/arm/virt.h               |  1 +
>>   4 files changed, 37 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 371147f3ae..0c9e549759 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -79,6 +79,7 @@
>>   #include "hw/virtio/virtio-iommu.h"
>>   #include "hw/char/pl011.h"
>>   #include "qemu/guest-random.h"
>> +#include "include/hw/pci/pci_bus.h"
>>   
>>   #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>>       static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
>> @@ -1232,6 +1233,10 @@ static void create_smmu(const VirtMachineState *vms,
>>   
>>       dev = qdev_new("arm-smmuv3");
>>   
>> +    if (vms->primary_bus_iommu) {
>> +        bus->flags |= PCI_BUS_IOMMU;
>> +    }
>> +
>>       object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>>                                &error_abort);
>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> @@ -2305,6 +2310,20 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>>       }
>>   }
>>   
>> +static bool virt_get_primary_bus_iommu(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    return vms->primary_bus_iommu;
>> +}
>> +
>> +static void virt_set_primary_bus_iommu(Object *obj, bool value, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    vms->primary_bus_iommu = value;
>> +}
>> +
>>   static CpuInstanceProperties
>>   virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>   {
>> @@ -2629,6 +2648,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>                                             "Set the IOMMU type. "
>>                                             "Valid values are none and smmuv3");
>>   
>> +    object_class_property_add_bool(oc, "primary_bus_iommu",
>> +                                  virt_get_primary_bus_iommu,
>> +                                  virt_set_primary_bus_iommu);
>> +    object_class_property_set_description(oc, "primary_bus_iommu",
>> +                                          "Set on/off to enable/disable "
>> +                                          "iommu for primary bus");
>> +
>>       object_class_property_add_bool(oc, "ras", virt_get_ras,
>>                                      virt_set_ras);
>>       object_class_property_set_description(oc, "ras",
>> @@ -2696,6 +2722,9 @@ static void virt_instance_init(Object *obj)
>>       /* Default disallows iommu instantiation */
>>       vms->iommu = VIRT_IOMMU_NONE;
>>   
>> +    /* Iommu is enabled by default for primary bus */
>> +    vms->primary_bus_iommu = true;
>> +
>>       /* Default disallows RAS instantiation */
>>       vms->ras = false;
>>   
>> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
>> index aedded1064..0412656265 100644
>> --- a/hw/pci-bridge/pci_expander_bridge.c
>> +++ b/hw/pci-bridge/pci_expander_bridge.c
>> @@ -57,6 +57,7 @@ struct PXBDev {
>>   
>>       uint8_t bus_nr;
>>       uint16_t numa_node;
>> +    bool iommu;
>>   };
>>   
>>   static PXBDev *convert_to_pxb(PCIDevice *dev)
>> @@ -254,6 +255,10 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
>>       bus->address_space_io = pci_get_bus(dev)->address_space_io;
>>       bus->map_irq = pxb_map_irq_fn;
>>   
>> +    if (pxb->iommu) {
>> +        bus->flags |= PCI_BUS_IOMMU;
>> +    }
>> +
>>       PCI_HOST_BRIDGE(ds)->bus = bus;
>>   
>>       pxb_register_bus(dev, bus, &local_err);
>> @@ -301,6 +306,7 @@ static Property pxb_dev_properties[] = {
>>       /* Note: 0 is not a legal PXB bus number. */
>>       DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
>>       DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
>> +    DEFINE_PROP_BOOL("iommu", PXBDev, iommu, true),
> looks a bit odd to me that we have a property for the PXE-PCIe extra
> root complex and not for the gpex device. Wouldn't it make sense to add
> one for the GPEX too? In the positive you still could have a machine
> option that would force the GPEX property value?

Indeed it makes sense to add one property for GPEX too.However, the 
iommu property for PXBDev only helps to add option in qemu command line.
When it is necessary to check whether the iommu is enabled on the root 
bus, it would be better to access the bus flag. In qemu, the pxb is not 
related to GPEX currently, and i do not find proper position to add the 
iommu property for GPEX, you might have some good idea for that.

>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index a9ebef8a35..dc969989c9 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -2712,7 +2712,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>>   
>>           iommu_bus = parent_bus;
>>       }
>> -    if (iommu_bus && iommu_bus->iommu_fn) {
>> +    if (pci_bus_has_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
>>           return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
>>       }
>>       return &address_space_memory;
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index ee9a93101e..babe829486 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -147,6 +147,7 @@ struct VirtMachineState {
>>       OnOffAuto acpi;
>>       VirtGICType gic_version;
>>       VirtIOMMUType iommu;
>> +    bool primary_bus_iommu;
>>       VirtMSIControllerType msi_controller;
>>       uint16_t virtio_iommu_bdf;
>>       struct arm_boot_info bootinfo;
>>
> Thanks
> 
> Eric
> 
> .
> 

Thanks

Xingang

.

