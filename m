Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802C720A099
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 16:10:53 +0200 (CEST)
Received: from localhost ([::1]:58294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joSaa-0004Qm-H1
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 10:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1joSZW-0003z0-LD
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 10:09:46 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1joSZU-00045g-1S
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 10:09:46 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef4aff60000>; Thu, 25 Jun 2020 07:08:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 25 Jun 2020 07:09:41 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 25 Jun 2020 07:09:41 -0700
Received: from [10.40.100.228] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Jun
 2020 14:09:12 +0000
Subject: Re: [PATCH QEMU v25 11/17] vfio: Get migration capability flags for
 container
To: Alex Williamson <alex.williamson@redhat.com>
References: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
 <1592684486-18511-12-git-send-email-kwankhede@nvidia.com>
 <20200624125508.5222135e@x1.home>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <7d45d104-4cea-ff5f-d0c1-f4db9ec05486@nvidia.com>
Date: Thu, 25 Jun 2020 19:39:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200624125508.5222135e@x1.home>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593094134; bh=bV9nZAwPHzuadRqtIAYjXotwQkuIKDCorGP1XlAOftQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=q2tg/ZBi4rEaYNHoTEC8vjTBsHbKkEu0/FLbuc1IRZsn/g9gGSIqwFv98HQ9QsLzj
 6oG7jh+qHG/955z1nqFUCXfF3uzxzlAHauCHwHdvkeK/PyXcSW5Xou6aqEfzwkh7fX
 5kQ45SW1DR1Hl2L9QFdzN7X02Qf1PbhBbOPe8QKla6xatjZel+qaz/u+lfhemogwsn
 vmLX4HLhFoOWKw7a4OmCiCm2ksVSbhVjKnJHPgvjRlq3KnQlZLLPiE8z6hE7ofXh59
 u/FW3f9j8Rjk2h25vIOxG37CrjOaO8oV3rykyn4yRUcd4sIhdrXDULdJQGc0+xSGmV
 G4TGYJidfAAYQ==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 10:09:41
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: cohuck@redhat.com, cjia@nvidia.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, kevin.tian@intel.com,
 yan.y.zhao@intel.com, dgilbert@redhat.com, Eric Auger <eric.auger@redhat.com>,
 changpeng.liu@intel.com, eskultet@redhat.com,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/25/2020 12:25 AM, Alex Williamson wrote:
> On Sun, 21 Jun 2020 01:51:20 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
>> Added helper functions to get IOMMU info capability chain.
>> Added function to get migration capability information from that
>> capability chain for IOMMU container.
>>
>> Similar change was proposed earlier:
>> https://lists.gnu.org/archive/html/qemu-devel/2018-05/msg03759.html
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> Cc: Eric Auger <eric.auger@redhat.com>
>> ---
>>   hw/vfio/common.c              | 91 +++++++++++++++++++++++++++++++++++++++----
>>   include/hw/vfio/vfio-common.h |  3 ++
>>   2 files changed, 86 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 90e9a854d82c..e0d3d4585a65 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -1229,6 +1229,75 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
>>       return 0;
>>   }
>>   
>> +static int vfio_get_iommu_info(VFIOContainer *container,
>> +                               struct vfio_iommu_type1_info **info)
>> +{
>> +
>> +    size_t argsz = sizeof(struct vfio_iommu_type1_info);
>> +
>> +    *info = g_new0(struct vfio_iommu_type1_info, 1);
>> +again:
>> +    (*info)->argsz = argsz;
>> +
>> +    if (ioctl(container->fd, VFIO_IOMMU_GET_INFO, *info)) {
>> +        g_free(*info);
>> +        *info = NULL;
>> +        return -errno;
>> +    }
>> +
>> +    if (((*info)->argsz > argsz)) {
>> +        argsz = (*info)->argsz;
>> +        *info = g_realloc(*info, argsz);
>> +        goto again;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static struct vfio_info_cap_header *
>> +vfio_get_iommu_info_cap(struct vfio_iommu_type1_info *info, uint16_t id)
>> +{
>> +    struct vfio_info_cap_header *hdr;
>> +    void *ptr = info;
>> +
>> +    if (!(info->flags & VFIO_IOMMU_INFO_CAPS)) {
>> +        return NULL;
>> +    }
>> +
>> +    for (hdr = ptr + info->cap_offset; hdr != ptr; hdr = ptr + hdr->next) {
>> +        if (hdr->id == id) {
>> +            return hdr;
>> +        }
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +static void vfio_get_iommu_info_migration(VFIOContainer *container,
>> +                                         struct vfio_iommu_type1_info *info)
>> +{
>> +    struct vfio_info_cap_header *hdr;
>> +    struct vfio_iommu_type1_info_cap_migration *cap_mig;
>> +
>> +    hdr = vfio_get_iommu_info_cap(info, VFIO_IOMMU_TYPE1_INFO_CAP_MIGRATION);
>> +    if (!hdr) {
>> +        return;
>> +    }
>> +
>> +    cap_mig = container_of(hdr, struct vfio_iommu_type1_info_cap_migration,
>> +                            header);
>> +
>> +    container->dirty_pages_supported = true;
>> +    container->max_dirty_bitmap_size = cap_mig->max_dirty_bitmap_size;
>> +    container->dirty_pgsizes = cap_mig->pgsize_bitmap;
>> +
>> +    /*
>> +     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
>> +     * TARGET_PAGE_SIZE to mark those dirty.
>> +     */
>> +    assert(container->dirty_pgsizes & TARGET_PAGE_SIZE);
> 
> Why assert versus simply not support dirty page tracking and therefore
> migration of contained devices?
> 

Ok, that can be done.

>> +}
>> +
>>   static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>                                     Error **errp)
>>   {
>> @@ -1293,6 +1362,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>       container->space = space;
>>       container->fd = fd;
>>       container->error = NULL;
>> +    container->dirty_pages_supported = false;
>>       QLIST_INIT(&container->giommu_list);
>>       QLIST_INIT(&container->hostwin_list);
>>   
>> @@ -1305,7 +1375,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>       case VFIO_TYPE1v2_IOMMU:
>>       case VFIO_TYPE1_IOMMU:
>>       {
>> -        struct vfio_iommu_type1_info info;
>> +        struct vfio_iommu_type1_info *info;
>>   
>>           /*
>>            * FIXME: This assumes that a Type1 IOMMU can map any 64-bit
>> @@ -1314,15 +1384,20 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>>            * existing Type1 IOMMUs generally support any IOVA we're
>>            * going to actually try in practice.
>>            */
>> -        info.argsz = sizeof(info);
>> -        ret = ioctl(fd, VFIO_IOMMU_GET_INFO, &info);
>> -        /* Ignore errors */
>> -        if (ret || !(info.flags & VFIO_IOMMU_INFO_PGSIZES)) {
>> +        ret = vfio_get_iommu_info(container, &info);
>> +        if (ret) {
>> +                goto free_container_exit;
> 
> This was previously not fatal, why is it now?  Thanks,
> 

Cornelia asked same question.
Then what should be the action if ioctl fails? Disable migration?

Thanks,
Kirti


> Alex
> 
>> +        }
>> +
>> +        if (!(info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
>>               /* Assume 4k IOVA page size */
>> -            info.iova_pgsizes = 4096;
>> +            info->iova_pgsizes = 4096;
>>           }
>> -        vfio_host_win_add(container, 0, (hwaddr)-1, info.iova_pgsizes);
>> -        container->pgsizes = info.iova_pgsizes;
>> +        vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
>> +        container->pgsizes = info->iova_pgsizes;
>> +
>> +        vfio_get_iommu_info_migration(container, info);
>> +        g_free(info);
>>           break;
>>       }
>>       case VFIO_SPAPR_TCE_v2_IOMMU:
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index c78033e4149d..5a57a78ec517 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -79,6 +79,9 @@ typedef struct VFIOContainer {
>>       unsigned iommu_type;
>>       Error *error;
>>       bool initialized;
>> +    bool dirty_pages_supported;
>> +    uint64_t dirty_pgsizes;
>> +    uint64_t max_dirty_bitmap_size;
>>       unsigned long pgsizes;
>>       QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
>>       QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
> 

