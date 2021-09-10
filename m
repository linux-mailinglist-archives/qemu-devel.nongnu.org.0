Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6440688B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 10:35:08 +0200 (CEST)
Received: from localhost ([::1]:38138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOc02-0004sQ-K2
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 04:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mObyS-0003Y8-SN
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:33:28 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mObyP-0003jT-Lf
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 04:33:28 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H5TYf4zxdzbjLn;
 Fri, 10 Sep 2021 16:29:10 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 16:33:12 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Fri, 10 Sep 2021 16:33:12 +0800
Subject: Re: [PATCH 1/2] vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping in
 live migration
To: Alex Williamson <alex.williamson@redhat.com>
References: <20210903093611.1159-1-jiangkunkun@huawei.com>
 <20210903093611.1159-2-jiangkunkun@huawei.com>
 <20210908144535.66463b6c.alex.williamson@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <10e2296d-5bf4-7b83-c2a6-42f3e37ceb95@huawei.com>
Date: Fri, 10 Sep 2021 16:33:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210908144535.66463b6c.alex.williamson@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.975,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 tangnianyao@huawei.com, ganqixin@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 2021/9/9 4:45, Alex Williamson wrote:
> On Fri, 3 Sep 2021 17:36:10 +0800
> Kunkun Jiang <jiangkunkun@huawei.com> wrote:
>
>> We expand MemoryRegions of vfio-pci sub-page MMIO BARs to
>> vfio_pci_write_config to improve IO performance.
>> The MemoryRegions of destination VM will not be expanded
>> successful in live migration, because their addresses have
>> been updated in vmstate_load_state (vfio_pci_load_config).
> What's the call path through vfio_pci_write_config() that you're
> relying on to get triggered to enable this and why wouldn't we just
> walk all sub-page BARs in vfio_pci_load_config() to resolve the issue
> then?  It's my understanding that we do this update in write-config
> because it's required that the VM sizes the BAR before using it, which
> is not the case when we resume from migration.  Thanks,
Let's take an example:

AArch64
host page granularity: 64KB
PCI device: *Bar2 size 32KB* [mem 0x8000200000-0x800020ffff 64bit pref]

When enable Command register bit 1(Memory Space), the code flow is
as follows:

vfio_pci_write_config (addr: 4 val: 2 len: 2)
     // record the old address of each bar, 0xffffffffffffffff
     old_addr[bar] = pdev->io_regions[bar].addr;
     pci_default_write_config
         pci_update_mappings
             new_addr = pci_bar_address    // 0x8000200000
             r->addr = new_addr;
             memory_region_addr_subregion_overlap
                 ...
*vfio_listener_region_add*
                     alignment check of the ram section address and size 
fail, return
*kvm_region_add*
                     kvm_set_phys_mem
                         alignment check of the ram section address and 
size fail, return

     // old_addr[bar] != pdev->io_regions[bar].addr &&
     // 0 < vdev->bars[bar].region.size < qemu_real_host_page_size
     vfio_sub_page_bar_update_mapping
*bar size = qemu_real_host_page_size*
             ...
             vfio_listener_region_add
                 map success
             kvm_region_add
                 kvm_set_phys_mem
                     map success

In live migration, only pci config data is sent to the destination VM.
Therefore, we need to update the bar's size before destination VM
using it.

In vfio_pci_load_config, the code flow is as follows:

vfio_pci_load_config
     vmstate_load_state
         *get_pci_config_device*
             pci_update_mappings
                 ...
                 // bar's addr is updated(0x8000200000), but bar's size 
is still 32KB, so map failed
     vfio_pci_write_config
         // bar's addr will not be changed, so 
vfio_sub_page_bar_update_mapping won't be called

My idea is that removing the check 'old_addr[bar] != 
pdev->io_regions[bar].addr' doesn't
affect the previous process. There's also a bar size check. In 
vfio_sub_page_bar_update_mapping,
it will check if bar is mapped and page aligned.
1) If bar's addr is 0xffffffffffffffff, it will not pass the 
vfio_sub_page_bar_update_mapping check.
2) If bar's size has been updated, it will not pass the bar size check 
in vfio_pci_write_config.

Thanks,
Kunkun Jiang

> Alex
>   
>> Remove the restriction on base address change in
>> vfio_pci_write_config for correct mmapping sub-page MMIO
>> BARs. Accroding to my analysis, the remaining parameter
>> verification is enough.
>>
>> Fixes: c5e2fb3ce4d (vfio: Add save and load functions for VFIO PCI devices)
>> Reported-by: Nianyao Tang <tangnianyao@huawei.com>
>> Reported-by: Qixin Gan <ganqixin@huawei.com>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   hw/vfio/pci.c | 8 +-------
>>   1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index e1ea1d8a23..891b211ddf 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -1189,18 +1189,12 @@ void vfio_pci_write_config(PCIDevice *pdev,
>>           }
>>       } else if (ranges_overlap(addr, len, PCI_BASE_ADDRESS_0, 24) ||
>>           range_covers_byte(addr, len, PCI_COMMAND)) {
>> -        pcibus_t old_addr[PCI_NUM_REGIONS - 1];
>>           int bar;
>>   
>> -        for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
>> -            old_addr[bar] = pdev->io_regions[bar].addr;
>> -        }
>> -
>>           pci_default_write_config(pdev, addr, val, len);
>>   
>>           for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
>> -            if (old_addr[bar] != pdev->io_regions[bar].addr &&
>> -                vdev->bars[bar].region.size > 0 &&
>> +            if (vdev->bars[bar].region.size > 0 &&
>>                   vdev->bars[bar].region.size < qemu_real_host_page_size) {
>>                   vfio_sub_page_bar_update_mapping(pdev, bar);
>>               }
> .



