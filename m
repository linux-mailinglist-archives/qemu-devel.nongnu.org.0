Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AC2438650
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 04:11:29 +0200 (CEST)
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meSyu-0001NU-6l
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 22:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1meSx4-0000Wy-2b
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 22:09:34 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1meSwz-0000Yl-Ry
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 22:09:33 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HcM0s5Ncwz1DHfP;
 Sun, 24 Oct 2021 10:07:25 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Sun, 24 Oct 2021 10:09:16 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Sun, 24 Oct 2021 10:09:16 +0800
Subject: Re: [PATCH v2 1/2] vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping
 in live migration
To: <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210914015326.1494-1-jiangkunkun@huawei.com>
 <20210914015326.1494-2-jiangkunkun@huawei.com>
 <571dc3ee-8b2a-fcef-b617-1ba85a3d442a@redhat.com>
 <248f1b98-07a7-619c-b5ef-0c1e8508fea9@huawei.com>
 <d64e6e23-e698-82b5-6236-cb81983f9c92@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <af9a9425-0704-fe1c-cc30-a5f27428e895@huawei.com>
Date: Sun, 24 Oct 2021 10:09:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d64e6e23-e698-82b5-6236-cb81983f9c92@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangkunkun@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.781,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: wanghaibin.wang@huawei.com, tangnianyao@huawei.com, ganqixin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/10/23 22:26, Eric Auger wrote:
> Hi Kunkun,
>
> On 10/22/21 12:01 PM, Kunkun Jiang wrote:
>> Hi Eric,
>>
>> On 2021/10/22 0:15, Eric Auger wrote:
>>> Hi Kunkun,
>>>
>>> On 9/14/21 3:53 AM, Kunkun Jiang wrote:
>>>> We expand MemoryRegions of vfio-pci sub-page MMIO BARs to
>>>> vfio_pci_write_config to improve IO performance.
>>> s/to vfio_pci_write_config/ in vfio_pci_write_config()
>> Thank you for your review. I will correct it in v3.
>>>> The MemoryRegions of destination VM will not be expanded
>>>> successful in live migration, because their addresses have
>>> s/will not be expanded successful in live migration/are not expanded
>>> anymore after live migration (?) Is that the correct symptom?
>> You are right. They are not expanded anymore after live migration,
>> not expanded unsuccessfully. I used the wrong words.
>>>> been updated in vmstate_load_state (vfio_pci_load_config).
>>>>
>>>> So iterate BARs in vfio_pci_write_config and try to update
>>>> sub-page BARs.
>>>>
>>>> Fixes: c5e2fb3ce4d (vfio: Add save and load functions for VFIO PCI
>>>> devices)
>>> is it an actual fix or an optimization?
>> I recently realized that this is actually an optimization.
>>
>> The VF driver in VM use the assembly language instructions,
>> which can operate two registers simultaneously, like stp, ldp.
>> These instructions would result in non-ISV data abort, which
>> cannot be handled well at the moment.
>>
>> If the driver doesn't use such instructions,  not expanding
>> only affects performance.
>>
>> I will add these to the commit message in the next version.
>>>> Reported-by: Nianyao Tang <tangnianyao@huawei.com>
>>>> Reported-by: Qixin Gan <ganqixin@huawei.com>
>>>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>>>> ---
>>>>    hw/vfio/pci.c | 15 ++++++++++++++-
>>>>    1 file changed, 14 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>> index e1ea1d8a23..43c7e93153 100644
>>>> --- a/hw/vfio/pci.c
>>>> +++ b/hw/vfio/pci.c
>>>> @@ -2453,7 +2453,12 @@ static int vfio_pci_load_config(VFIODevice
>>>> *vbasedev, QEMUFile *f)
>>>>    {
>>>>        VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice,
>>>> vbasedev);
>>>>        PCIDevice *pdev = &vdev->pdev;
>>>> -    int ret;
>>>> +    pcibus_t old_addr[PCI_NUM_REGIONS - 1];
>>>> +    int bar, ret;
>>>> +
>>>> +    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
>>>> +        old_addr[bar] = pdev->io_regions[bar].addr;
>>>> +    }
>>> what are those values before the vmstate_load_state ie. can't you do the
>> Are you referring to pdev->io_regions[bar].addr ? All of the bars addr is
>> PCI_BAR_UNMAPPED (~(pcibus_t)0) before the vmstate_load_state.
> OK that was my assumption. What I meant is in that case you always have
>
> old_addr[bar] != pdev->io_regions[bar].addr, right? In the positive this check is not needed and you don't need old_addr at all.
> In the original code this was needed since one wanted to call
> vfio_sub_page_bar_update_mapping() only for the bar base address that were changed during the
> vfio_pci_write_config.
As far as I know, there is at least one case. If the VF driver is not loaded
(insmod xxx.ko) in the VM, we will have old_addr[bar] == 
pdev->io_regions[bar].addr.
The vfio_sub_page_bar_update_mapping() will be called when 0 < bar size 
< host page size.
But vfio_sub_page_bar_update_mapping() will not change anything in this 
case.

Thanks,
Kunkun Jiang
>
> Thanks
>
> Eric
>
>>> vfio_sub_page_bar_update_mapping() unconditionnaly on old_addr[bar] !=
>>> pdev->io_regions[bar].addr
>> The size of Bar is a power of 2. The Bar, whose size is greater than host
>> page size, doesn't need to be expanded.
>>
>> Can you explain more? May be I misunderstood you.
>>
>> Thanks,
>> Kunkun Jiang
>>>>          ret = vmstate_load_state(f, &vmstate_vfio_pci_config, vdev, 1);
>>>>        if (ret) {
>>>> @@ -2463,6 +2468,14 @@ static int vfio_pci_load_config(VFIODevice
>>>> *vbasedev, QEMUFile *f)
>>>>        vfio_pci_write_config(pdev, PCI_COMMAND,
>>>>                              pci_get_word(pdev->config +
>>>> PCI_COMMAND), 2);
>>>>    +    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
>>>> +        if (old_addr[bar] != pdev->io_regions[bar].addr &&
>>>> +            vdev->bars[bar].region.size > 0 &&
>>>> +            vdev->bars[bar].region.size < qemu_real_host_page_size) {
>>>> +            vfio_sub_page_bar_update_mapping(pdev, bar);
>>>> +        }
>>>> +    }
>>>> +
>>>>        if (msi_enabled(pdev)) {
>>>>            vfio_msi_enable(vdev);
>>>>        } else if (msix_enabled(pdev)) {
>>> Thanks
>>>
>>> Eric
>>>
>>> .
> .

