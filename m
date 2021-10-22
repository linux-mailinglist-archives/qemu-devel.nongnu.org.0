Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C2A437538
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:03:13 +0200 (CEST)
Received: from localhost ([::1]:46072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrOJ-00033I-TU
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mdrMp-0002Gw-91
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:01:39 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mdrMl-0006Cf-Ho
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:01:38 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HbKbD1jcRz8tt0;
 Fri, 22 Oct 2021 18:00:08 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 22 Oct 2021 18:01:24 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Fri, 22 Oct 2021 18:01:23 +0800
Subject: Re: [PATCH v2 1/2] vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping
 in live migration
To: <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210914015326.1494-1-jiangkunkun@huawei.com>
 <20210914015326.1494-2-jiangkunkun@huawei.com>
 <571dc3ee-8b2a-fcef-b617-1ba85a3d442a@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <248f1b98-07a7-619c-b5ef-0c1e8508fea9@huawei.com>
Date: Fri, 22 Oct 2021 18:01:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <571dc3ee-8b2a-fcef-b617-1ba85a3d442a@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangkunkun@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.867,
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
Cc: wanghaibin.wang@huawei.com, tangnianyao@huawei.com, ganqixin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On 2021/10/22 0:15, Eric Auger wrote:
> Hi Kunkun,
>
> On 9/14/21 3:53 AM, Kunkun Jiang wrote:
>> We expand MemoryRegions of vfio-pci sub-page MMIO BARs to
>> vfio_pci_write_config to improve IO performance.
> s/to vfio_pci_write_config/ in vfio_pci_write_config()
Thank you for your review. I will correct it in v3.
>> The MemoryRegions of destination VM will not be expanded
>> successful in live migration, because their addresses have
> s/will not be expanded successful in live migration/are not expanded
> anymore after live migration (?) Is that the correct symptom?
You are right. They are not expanded anymore after live migration,
not expanded unsuccessfully. I used the wrong words.
>> been updated in vmstate_load_state (vfio_pci_load_config).
>>
>> So iterate BARs in vfio_pci_write_config and try to update
>> sub-page BARs.
>>
>> Fixes: c5e2fb3ce4d (vfio: Add save and load functions for VFIO PCI devices)
> is it an actual fix or an optimization?
I recently realized that this is actually an optimization.

The VF driver in VM use the assembly language instructions,
which can operate two registers simultaneously, like stp, ldp.
These instructions would result in non-ISV data abort, which
cannot be handled well at the moment.

If the driver doesn't use such instructions,  not expanding
only affects performance.

I will add these to the commit message in the next version.
>> Reported-by: Nianyao Tang <tangnianyao@huawei.com>
>> Reported-by: Qixin Gan <ganqixin@huawei.com>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   hw/vfio/pci.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index e1ea1d8a23..43c7e93153 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -2453,7 +2453,12 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
>>   {
>>       VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
>>       PCIDevice *pdev = &vdev->pdev;
>> -    int ret;
>> +    pcibus_t old_addr[PCI_NUM_REGIONS - 1];
>> +    int bar, ret;
>> +
>> +    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
>> +        old_addr[bar] = pdev->io_regions[bar].addr;
>> +    }
> what are those values before the vmstate_load_state ie. can't you do the
Are you referring to pdev->io_regions[bar].addr ? All of the bars addr is
PCI_BAR_UNMAPPED (~(pcibus_t)0) before the vmstate_load_state.
> vfio_sub_page_bar_update_mapping() unconditionnaly on old_addr[bar] !=
> pdev->io_regions[bar].addr
The size of Bar is a power of 2. The Bar, whose size is greater than host
page size, doesn't need to be expanded.

Can you explain more? May be I misunderstood you.

Thanks,
Kunkun Jiang
>>   
>>       ret = vmstate_load_state(f, &vmstate_vfio_pci_config, vdev, 1);
>>       if (ret) {
>> @@ -2463,6 +2468,14 @@ static int vfio_pci_load_config(VFIODevice *vbasedev, QEMUFile *f)
>>       vfio_pci_write_config(pdev, PCI_COMMAND,
>>                             pci_get_word(pdev->config + PCI_COMMAND), 2);
>>   
>> +    for (bar = 0; bar < PCI_ROM_SLOT; bar++) {
>> +        if (old_addr[bar] != pdev->io_regions[bar].addr &&
>> +            vdev->bars[bar].region.size > 0 &&
>> +            vdev->bars[bar].region.size < qemu_real_host_page_size) {
>> +            vfio_sub_page_bar_update_mapping(pdev, bar);
>> +        }
>> +    }
>> +
>>       if (msi_enabled(pdev)) {
>>           vfio_msi_enable(vdev);
>>       } else if (msix_enabled(pdev)) {
> Thanks
>
> Eric
>
> .

