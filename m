Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C34D39A155
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:44:06 +0200 (CEST)
Received: from localhost ([::1]:53270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lomhh-0001y0-K3
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lomg7-000109-Au; Thu, 03 Jun 2021 08:42:27 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lomg4-0003eP-2k; Thu, 03 Jun 2021 08:42:26 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Fwllq3dhhz1BHLx;
 Thu,  3 Jun 2021 20:37:27 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:42:11 +0800
Received: from [10.174.185.226] (10.174.185.226) by
 dggpemm500009.china.huawei.com (7.185.36.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 3 Jun 2021 20:42:11 +0800
Subject: Re: [PATCH v4 1/8] hw/pci/pci_host: Allow bypass iommu for pci host
To: <eric.auger@redhat.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
 <1621914605-14724-2-git-send-email-wangxingang5@huawei.com>
 <4fed8139-c5f0-8b96-4b98-69374d31c10e@redhat.com>
From: Xingang Wang <wangxingang5@huawei.com>
Message-ID: <45364475-8e0c-8af6-de24-64a3aa605514@huawei.com>
Date: Thu, 3 Jun 2021 20:42:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <4fed8139-c5f0-8b96-4b98-69374d31c10e@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangxingang5@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/6/2 20:18, Eric Auger wrote:
> Hi Xingang,
> 
> On 5/25/21 5:49 AM, Wang Xingang wrote:
>> From: Xingang Wang <wangxingang5@huawei.com>
>>
>> This add a bypass_iommu property for pci host, which indicates
>> whether devices attached to the pci root bus will bypass iommu.
>> In pci_device_iommu_address_space(), add a bypass_iommu check
>> to avoid getting iommu address space for devices bypass iommu.
>>
>> Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
>> ---
>>   hw/pci/pci.c              | 18 +++++++++++++++++-
>>   hw/pci/pci_host.c         |  2 ++
>>   include/hw/pci/pci.h      |  1 +
>>   include/hw/pci/pci_host.h |  1 +
>>   4 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 377084f1a8..27d588e268 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -416,6 +416,22 @@ const char *pci_root_bus_path(PCIDevice *dev)
>>       return rootbus->qbus.name;
>>   }
>>   
>> +bool pci_bus_bypass_iommu(PCIBus *bus)
>> +{
>> +    PCIBus *rootbus = bus;
>> +    PCIHostState *host_bridge;
>> +
>> +    if (!pci_bus_is_root(bus)) {
>> +        rootbus = pci_device_root_bus(bus->parent_dev);
>> +    }
>> +
>> +    host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
>> +
>> +    assert(host_bridge->bus == rootbus);
>> +
>> +    return host_bridge->bypass_iommu;
>> +}
>> +
>>   static void pci_root_bus_init(PCIBus *bus, DeviceState *parent,
>>                                 MemoryRegion *address_space_mem,
>>                                 MemoryRegion *address_space_io,
>> @@ -2718,7 +2734,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
>>   
>>           iommu_bus = parent_bus;
>>       }
>> -    if (iommu_bus && iommu_bus->iommu_fn) {
>> +    if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
>>           return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
>>       }
>>       return &address_space_memory;
>> diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
>> index 8ca5fadcbd..2768db53e6 100644
>> --- a/hw/pci/pci_host.c
>> +++ b/hw/pci/pci_host.c
>> @@ -222,6 +222,8 @@ const VMStateDescription vmstate_pcihost = {
>>   static Property pci_host_properties_common[] = {
>>       DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
>>                        mig_enabled, true),
>> +    DEFINE_PROP_BOOL("pci-host-bypass-iommu", PCIHostState,
>> +                     bypass_iommu, false),
> "bypass-iommu" may be sufficient.

Thanks, will fix this.

> 
> Besides:
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Thanks
> 
> Eric
> 
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
>>   
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index 6be4e0c460..f4d51b672b 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -480,6 +480,7 @@ void pci_for_each_bus(PCIBus *bus,
>>   
>>   PCIBus *pci_device_root_bus(const PCIDevice *d);
>>   const char *pci_root_bus_path(PCIDevice *dev);
>> +bool pci_bus_bypass_iommu(PCIBus *bus);
>>   PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn);
>>   int pci_qdev_find_device(const char *id, PCIDevice **pdev);
>>   void pci_bus_get_w64_range(PCIBus *bus, Range *range);
>> diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
>> index 52e038c019..c6f4eb4585 100644
>> --- a/include/hw/pci/pci_host.h
>> +++ b/include/hw/pci/pci_host.h
>> @@ -43,6 +43,7 @@ struct PCIHostState {
>>       uint32_t config_reg;
>>       bool mig_enabled;
>>       PCIBus *bus;
>> +    bool bypass_iommu;
>>   
>>       QLIST_ENTRY(PCIHostState) next;
>>   };
> 
> .
> 

