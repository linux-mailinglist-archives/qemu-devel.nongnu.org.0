Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D6D503499
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 09:02:37 +0200 (CEST)
Received: from localhost ([::1]:50268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfcS3-0003jW-Lp
	for lists+qemu-devel@lfdr.de; Sat, 16 Apr 2022 03:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nfcPw-0002vr-39
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 03:00:24 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nfcPt-00027V-Hr
 for qemu-devel@nongnu.org; Sat, 16 Apr 2022 03:00:23 -0400
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KgPGD1fjnzgYsr;
 Sat, 16 Apr 2022 15:00:04 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 16 Apr 2022 15:00:05 +0800
Subject: Re: [PATCH] hw/arm/smmuv3: Pass the real perm to returned
 IOMMUTLBEntry in smmuv3_translate()
To: <eric.auger@redhat.com>
References: <1649318245-77817-1-git-send-email-chenxiang66@hisilicon.com>
 <5436eae2-2af1-b81a-3a06-c834f8f6f835@redhat.com>
CC: <qemu-devel@nongnu.org>, <linuxarm@huawei.com>
Message-ID: <03e1f09b-6cbb-81ab-e00b-c1326c2b6053@hisilicon.com>
Date: Sat, 16 Apr 2022 15:00:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <5436eae2-2af1-b81a-3a06-c834f8f6f835@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "chenxiang (M)" <chenxiang66@hisilicon.com>
From:  "chenxiang (M)" via <qemu-devel@nongnu.org>

Hi Eric,


在 2022/4/15 0:02, Eric Auger 写道:
> Hi Chenxiang,
>
> On 4/7/22 9:57 AM, chenxiang via wrote:
>> From: Xiang Chen <chenxiang66@hisilicon.com>
>>
>> In function memory_region_iommu_replay(), it decides to notify() or not
>> according to the perm of returned IOMMUTLBEntry. But for smmuv3, the
>> returned perm is always IOMMU_NONE even if the translation success.
> I think you should precise in the commit message that
> memory_region_iommu_replay() always calls the IOMMU MR translate()
> callback with flag=IOMMU_NONE and thus, currently, translate() returns
> an IOMMUTLBEntry with perm set to IOMMU_NONE if the translation
> succeeds, whereas it is expected to return the actual permission set in
> the table entry.

Thank you for your comments.
I will change the commit message in next version.

>
>
>> Pass the real perm to returned IOMMUTLBEntry to avoid the issue.
>>
>> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
>> ---
>>   hw/arm/smmuv3.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 674623aabe..707eb430c2 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -760,7 +760,7 @@ epilogue:
>>       qemu_mutex_unlock(&s->mutex);
>>       switch (status) {
>>       case SMMU_TRANS_SUCCESS:
>> -        entry.perm = flag;
>> +        entry.perm = cached_entry->entry.perm;
> With that clarification
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Ok, thanks

>
> the translate() doc in ./include/exec/memory.h states
> "
> If IOMMU_NONE is passed then the IOMMU must do the
>       * full page table walk and report the permissions in the returned
>       * IOMMUTLBEntry. (Note that this implies that an IOMMU may not
>       * return different mappings for reads and writes.)
> "
>
>
> Thanks
>
> Eric
>>           entry.translated_addr = cached_entry->entry.translated_addr +
>>                                       (addr & cached_entry->entry.addr_mask);
>>           entry.addr_mask = cached_entry->entry.addr_mask;
> .
>


