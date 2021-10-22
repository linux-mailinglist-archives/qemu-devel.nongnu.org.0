Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E4A43753A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 12:03:55 +0200 (CEST)
Received: from localhost ([::1]:47826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdrP0-0004EH-Iy
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 06:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mdrNM-0002tJ-LQ
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:02:13 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1mdrNJ-0000sx-Os
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 06:02:12 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HbKWl59Qyz90Mw;
 Fri, 22 Oct 2021 17:57:07 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Fri, 22 Oct 2021 18:02:05 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Fri, 22 Oct 2021 18:02:05 +0800
Subject: Re: [PATCH v2 2/2] vfio/common: Add trace point when a MMIO RAM
 section less than PAGE_SIZE
To: <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20210914015326.1494-1-jiangkunkun@huawei.com>
 <20210914015326.1494-3-jiangkunkun@huawei.com>
 <4ff1afe8-2bff-985f-85cc-9ec68ed77a1b@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <7d5fa529-48e1-df16-962c-b5c67b2fadaf@huawei.com>
Date: Fri, 22 Oct 2021 18:02:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4ff1afe8-2bff-985f-85cc-9ec68ed77a1b@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
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

On 2021/10/22 1:02, Eric Auger wrote:
> Hi Kunkun,
>
> On 9/14/21 3:53 AM, Kunkun Jiang wrote:
>> The MSI-X structures of some devices and other non-MSI-X structures
>> are in the same BAR. They may share one host page, especially in the
> may be in the same bar?
You are right. So embarrassing.😅
>> case of large page granularity, such as 64K.
>>
>> For example, MSIX-Table size of 82599 NIC is 0x30 and the offset in
>> Bar 3(size 64KB) is 0x0. If host page size is 64KB.
> remove the '.'
s/./, ?
> In that case wouldn't the symptom be the same with a 4kB page?
Host page size is different, iova is different.
> iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);

If host page size is 4KB, the iova will smaller than llend.
If host page size is 64KB, the iova will be equal to llend.

>> vfio_listener_region_add() will be called to map the remaining range
>> (0x30-0xffff). And it will return early at
>> 'int128_ge((int128_make64(iova), llend))' and hasn't any message.
> s/and hasn't any message /without any message

Ok, I will correct this in next version.

>> Let's add a trace point to informed users like commit 5c08600547c0
> s/informed/inform
Same for this.
>> ("vfio: Use a trace point when a RAM section cannot be DMA mapped")
>> did.
>>
>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>> ---
>>   hw/vfio/common.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 8728d4d5c2..2fc6213c0f 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -892,6 +892,13 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>       llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask));
>>   
>>       if (int128_ge(int128_make64(iova), llend)) {
>> +        if (memory_region_is_ram_device(section->mr)) {
>> +            trace_vfio_listener_region_add_no_dma_map(
>> +                memory_region_name(section->mr),
>> +                section->offset_within_address_space,
>> +                int128_getlo(section->size),
>> +                qemu_real_host_page_size);
>> +        }
>>           return;
>>       }
>>       end = int128_get64(int128_sub(llend, int128_one()));
By the way, if this patch is accepted. The following code in the
vfio_listener_region_add may need to be deleted:
>     if (memory_region_is_ram_device(section->mr)) {
>         hwaddr pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
>
>         if ((iova & pgmask) || (int128_get64(llsize) & pgmask)) {
>             trace_vfio_listener_region_add_no_dma_map(
>                 memory_region_name(section->mr),
>                 section->offset_within_address_space,
>                 int128_getlo(section->size),
>                 pgmask + 1);
>             return;
>         }
>     }
What do you think?

Thanks,
Kunkun Jiang
> Thanks
>
> Eric
>
> .

