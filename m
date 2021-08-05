Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CDE3E1003
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 10:13:49 +0200 (CEST)
Received: from localhost ([::1]:33792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBYVh-00088E-1y
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 04:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mBYSw-0006IO-DJ
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:11:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mBYSs-0004cx-VU
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 04:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628151049;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyMVpSPCzfxfbXy1zPhgX43o73F6xIE5BSVPS5jhYnk=;
 b=IjG2Dx35XB0InCDrlTppd3COXUYog30TjlIyn+4jWqAM5JPhyyiexA82CCKChEFXwWweAS
 7KSSSlHsU6/kiAi5XFxW1g51fFqRpQWJRTCjayp5G54knjI3+2eYpQhuYAm0yW/b6Xfwx0
 2uylfAsPV1eIV6/TwhxTDQYETZzstDI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-uYGiqNd4OWisZOXXNxCFog-1; Thu, 05 Aug 2021 04:10:48 -0400
X-MC-Unique: uYGiqNd4OWisZOXXNxCFog-1
Received: by mail-wr1-f72.google.com with SMTP id
 o10-20020a5d684a0000b0290154758805bcso1645716wrw.3
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 01:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=uyMVpSPCzfxfbXy1zPhgX43o73F6xIE5BSVPS5jhYnk=;
 b=chwPvorIJ+qsp1+63i0zZROQOgHefiHGxvUHqQJQA1Wq58QVJcJqxLiF4yNZ8357hs
 W2dlI87cW+SgJ6eUl/zleadUM6h14bbVsaVOBzTlP8HRrxB1RxtxXxhgIhn2HRwrJDJY
 VisiVUi12dDlgLHaqmPVIY+QMAGcyBlK/GEqQT7gtlkI+YRINNuqks0FDn7wLaYkgnZ2
 tEjPmorgaoegKrtJE5Xg6Xr/QXuuySpAHTPWmLpKMkCB61wSMteUGzWGdEYlYxzuCtNR
 fpLIvChs9tdLgyWU+v6gwPcgJOWZ+hk8SI8A7wGqRWn7vA4syPaLZB96Fi05sZ1MIInE
 Z8tA==
X-Gm-Message-State: AOAM530ELarx91ar/GCaV8xXE9L/S+4uWihBUBZxGokrEB3Akr9UywtW
 gnlhamOUxwFonH/q3fXlVcTv/1BN/dPZ20aKaOdK7F8QFQi5KmKonjdtPlnB+f8OttiMiLGoYN4
 wy27YD14fjEesmVU=
X-Received: by 2002:a7b:c452:: with SMTP id l18mr13831575wmi.22.1628151047002; 
 Thu, 05 Aug 2021 01:10:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjFeJ73fUpkfiQWV0qchpzDX8yM55gM3X1Bh1xwH+uKXKxbf6nR370lbOs2jTQZSMUIPaUzQ==
X-Received: by 2002:a7b:c452:: with SMTP id l18mr13831546wmi.22.1628151046731; 
 Thu, 05 Aug 2021 01:10:46 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f5sm5321578wrs.5.2021.08.05.01.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 01:10:46 -0700 (PDT)
Subject: Re: [RESEND RFC] hw/arm/smmuv3: add device properties to disable
 cached iotlb
To: "chenxiang (M)" <chenxiang66@hisilicon.com>
References: <1628066969-29945-1-git-send-email-chenxiang66@hisilicon.com>
 <5fc0cd6c-1e1d-3cb3-51e5-f20c10736643@redhat.com>
 <c3224918-bf19-4dab-3779-afb616902c39@hisilicon.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <5c64c2b3-b8c3-f50f-0842-cce58e7a7591@redhat.com>
Date: Thu, 5 Aug 2021 10:10:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c3224918-bf19-4dab-3779-afb616902c39@hisilicon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, linuxarm@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Chenxiang,
On 8/5/21 9:48 AM, chenxiang (M) wrote:
> Hi Eric,
>
>
> 在 2021/8/5 0:26, Eric Auger 写道:
>> Hi Chenxiang,
>>
>> On 8/4/21 10:49 AM, chenxiang wrote:
>>> From: Xiang Chen <chenxiang66@hisilicon.com>
>>>
>>> It splits invalidations into ^2 range invalidations in the patch
>>> 6d9cd115b(" hw/arm/smmuv3: Enforce invalidation on a power of two
>>> range").
>>> So for some scenarios such as the size of invalidation is not ^2 range
>>> invalidation, it costs more time to invalidate.
>> this ^² split is not only necessary for internal TLB management but also
>> for IOMMU MR notifier calls (which use a mask), ie. IOTLB unmap
>> notifications used for both vhost and vfio integrations.
>> So you can disable the internal IOTLB but we can't simply remove the pow
>> of 2 split. See below.
> Right, in current code of qemu,  it is not right to simply remove the
> pow of 2 split.
> But i find that in my local repo, there is a private patch which seems
> solve the issue, so it works on my test.
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 4a7a183..83d24e1 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -825,7 +825,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>      event.type = IOMMU_NOTIFIER_UNMAP;
>      event.entry.target_as = &address_space_memory;
>      event.entry.iova = iova;
> -    event.entry.addr_mask = num_pages * (1 << granule) - 1;
> +    event.entry.addr_mask = (1 << granule) - 1;
> +       event.entry.num_pages = num_pages;
OK I see. But you change the existing semantic of addr_mask which
originally matches the mask of the  full addr range of the IOTLB
operation and you replace it by the granule mask and add another
num_pages field.

This is a change in the memory.h API and should be discussed with other
memory.h and vIOMMU maintainers if you want to go that way. This
typically breaks vhost integration which does not use num_pages and
would typically fail invalidating the full range.

So we have 2 different things: the disablement of the internal IOTLB (x-
prop) which can be done easily but what you mostly want it to remove the
pow of 2 splits to reduce the interactions with the physical IOMMU in
the VFIO/SMMU use case , right? pow of 2 splits is also needed for vhost
integration at the moment. Note this use case is not upstreamed and far
from being upstreamed given the /dev/iommu redesign, so it will be
difficult to justify that kind of change at thims moment.

Thanks

Eric
>      event.entry.perm = IOMMU_NONE;
>      event.entry.flags = IOMMU_INV_FLAGS_ARCHID;
>      event.entry.arch_id = asid;
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index a863b7d..7b026f0 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -639,7 +639,7 @@ static void vfio_iommu_unmap_notify(IOMMUNotifier
> *n, IOMMUTLBEntry *iotlb)
>      {
>          hwaddr start = iotlb->iova + giommu->iommu_offset;
>          struct iommu_inv_addr_info *addr_info;
> -        size_t size = iotlb->addr_mask + 1;
> +        size_t size = iotlb->num_pages * (iotlb->addr_mask + 1);
>          int archid = -1;
>
>          addr_info = &ustruct.info.granu.addr_info;
> @@ -653,8 +653,8 @@ static void vfio_iommu_unmap_notify(IOMMUNotifier
> *n, IOMMUTLBEntry *iotlb)
>          }
>          addr_info->archid = archid;
>          addr_info->addr = start;
> -        addr_info->granule_size = size;
> -        addr_info->nb_granules = 1;
> +        addr_info->granule_size = iotlb->addr_mask + 1;
> +               addr_info->nb_granules = iotlb->num_pages;
>          trace_vfio_iommu_addr_inv_iotlb(archid, start, size,
>                                          1, iotlb->leaf);
>          break;
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 0c4389c..268a395 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -110,6 +110,7 @@ struct IOMMUTLBEntry {
>      hwaddr           iova;
>      hwaddr           translated_addr;
>      hwaddr           addr_mask;
> +       uint64_t         num_pages;
>      IOMMUAccessFlags perm;
>      IOMMUInvGranularity granularity;
>  #define IOMMU_INV_FLAGS_PASID  (1 << 0)
>
>
>>
>> internal TLB could be disabled through a property but I would rather set
>> it as an "x-" experimental property for debug purpose. Until recently
>> this was indeed helpful to debug bugs related to internal IOTLB
>> management (RIL support) ;-) I hope this period is over though ;-)
> Ok, maybe we set it as "x-" experimental property currently.
>
>>> Currently smmuv3_translate is rarely used (i only see it is used when
>>> binding msi), so i think maybe we can disable cached iotlb to promote
>>> efficiency of invalidation. So add device property disable_cached_iotlb
>>> to disable cached iotlb, and then we can send non-^2 range invalidation
>>> directly.
>>> Use tool dma_map_benchmark to have a test on the latency of unmap,
>>> and we can see it promotes much on unmap when the size of invalidation
>>> is not ^2 range invalidation (such as g = 7/15/31/511):
>>>
>>> t = 1(thread = 1)
>>>             before opt(us)   after opt(us)
>>> g=1(4K size)    0.2/7.6        0.2/7.5
>>> g=4(8K size)    0.4/7.9        0.4/7.9
>>> g=7(28K size)    0.6/10.2        0.6/8.2
>>> g=8(32K size)    0.6/8.3        0.6/8.3
>>> g=15(60K size)    1.1/12.1        1.1/9.1
>>> g=16(64K size)    1.1/9.2        1.1/9.1
>>> g=31(124K size)    2.0/14.8        2.0/10.7
>>> g=32(128K size)    2.1/14.8        2.1/10.7
>>> g=511(2044K size)    30.9/65.1        31.1/55.9
>>> g=512(2048K size) 0.3/32.1        0.3/32.1
>>> t = 10(thread = 10)
>>>             before opt(us)   after opt(us)
>>> g=1(4K size)    0.2/39.9        0.2/39.1
>>> g=4(8K size)    0.5/42.6        0.5/42.4
>>> g=7(28K size)    0.6/66.4        0.6/45.3
>>> g=8(32K size)    0.7/45.8        0.7/46.1
>>> g=15(60K size)    1.1/80.5        1.1/49.6
>>> g=16(64K size)    1.1/49.8        1.1/50.2
>>> g=31(124K size)    2.0/98.3        2.1/58.0
>>> g=32(128K size)    2.1/57.7        2.1/58.2
>>> g=511(2044K size)    35.2/322.2        35.3/236.7
>>> g=512(2048K size) 0.8/238.2        0.9/240.3
>>>
>>> Note: i test it based on VSMMU enabled with the patchset
>>> ("vSMMUv3/pSMMUv3 2 stage VFIO integration").
>>>
>>> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
>>> ---
>>>   hw/arm/smmuv3.c         | 77
>>> ++++++++++++++++++++++++++++++++-----------------
>>>   include/hw/arm/smmuv3.h |  1 +
>>>   2 files changed, 52 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index 01b60be..7ae668f 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -19,6 +19,7 @@
>>>   #include "qemu/osdep.h"
>>>   #include "qemu/bitops.h"
>>>   #include "hw/irq.h"
>>> +#include "hw/qdev-properties.h"
>>>   #include "hw/sysbus.h"
>>>   #include "migration/vmstate.h"
>>>   #include "hw/qdev-core.h"
>>> @@ -682,19 +683,21 @@ static IOMMUTLBEntry
>>> smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>>       page_mask = (1ULL << (tt->granule_sz)) - 1;
>>>       aligned_addr = addr & ~page_mask;
>>>   -    cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
>>> -    if (cached_entry) {
>>> -        if ((flag & IOMMU_WO) && !(cached_entry->entry.perm &
>>> IOMMU_WO)) {
>>> -            status = SMMU_TRANS_ERROR;
>>> -            if (event.record_trans_faults) {
>>> -                event.type = SMMU_EVT_F_PERMISSION;
>>> -                event.u.f_permission.addr = addr;
>>> -                event.u.f_permission.rnw = flag & 0x1;
>>> +    if (s->disable_cached_iotlb) {
>>> +        cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
>>> +        if (cached_entry) {
>>> +            if ((flag & IOMMU_WO) && !(cached_entry->entry.perm &
>>> IOMMU_WO)) {
>>> +                status = SMMU_TRANS_ERROR;
>>> +                if (event.record_trans_faults) {
>>> +                    event.type = SMMU_EVT_F_PERMISSION;
>>> +                    event.u.f_permission.addr = addr;
>>> +                    event.u.f_permission.rnw = flag & 0x1;
>>> +                }
>>> +            } else {
>>> +                status = SMMU_TRANS_SUCCESS;
>>>               }
>>> -        } else {
>>> -            status = SMMU_TRANS_SUCCESS;
>>> +            goto epilogue;
>>>           }
>>> -        goto epilogue;
>>>       }
>>>         cached_entry = g_new0(SMMUTLBEntry, 1);
>>> @@ -742,7 +745,9 @@ static IOMMUTLBEntry
>>> smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>>           }
>>>           status = SMMU_TRANS_ERROR;
>>>       } else {
>>> -        smmu_iotlb_insert(bs, cfg, cached_entry);
>>> +        if (s->disable_cached_iotlb) {
>>> +            smmu_iotlb_insert(bs, cfg, cached_entry);
>>> +        }
>>>           status = SMMU_TRANS_SUCCESS;
>>>       }
>>>   @@ -855,8 +860,9 @@ static void
>>> smmuv3_inv_notifiers_iova(SMMUState *s, int asid, dma_addr_t iova,
>>>       }
>>>   }
>>>   -static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>>> +static void smmuv3_s1_range_inval(SMMUv3State *s, Cmd *cmd)
>>>   {
>>> +    SMMUState *bs = ARM_SMMU(s);
>>>       dma_addr_t end, addr = CMD_ADDR(cmd);
>>>       uint8_t type = CMD_TYPE(cmd);
>>>       uint16_t vmid = CMD_VMID(cmd);
>>> @@ -876,7 +882,9 @@ static void smmuv3_s1_range_inval(SMMUState *s,
>>> Cmd *cmd)
>>>       if (!tg) {
>>>           trace_smmuv3_s1_range_inval(vmid, asid, addr, tg, 1, ttl,
>>> leaf);
>>>           smmuv3_inv_notifiers_iova(s, asid, addr, tg, 1);
>>> -        smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
>>> +        if (s->disable_cached_iotlb) {
>>> +            smmu_iotlb_inv_iova(s, asid, addr, tg, 1, ttl);
>>> +        }
>>>           return;
>>>       }
>>>   @@ -885,17 +893,23 @@ static void smmuv3_s1_range_inval(SMMUState
>>> *s, Cmd *cmd)
>>>       num_pages = (num + 1) * BIT_ULL(scale);
>>>       granule = tg * 2 + 10;
>>>   -    /* Split invalidations into ^2 range invalidations */
>>> -    end = addr + (num_pages << granule) - 1;
>>> -
>>> -    while (addr != end + 1) {
>>> -        uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
>>> -
>>> -        num_pages = (mask + 1) >> granule;
>>> +    if (s->disable_cached_iotlb) {
>>>           trace_smmuv3_s1_range_inval(vmid, asid, addr, tg,
>>> num_pages, ttl, leaf);
>>>           smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
>>> -        smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
>> smmuv3_inv_notifiers_iova()
>> also needs to be called with power of 2 ranges
>> as it eventually calls memory_region_notify_iommu_one() which sets
>> event.entry.addr_mask = num_pages * (1 << granule) - 1;
>>
>>> -        addr += mask + 1;
>>> +    } else {
>>> +        /* Split invalidations into ^2 range invalidations */
>>> +        end = addr + (num_pages << granule) - 1;
>>> +
>>> +        while (addr != end + 1) {
>>> +            uint64_t mask = dma_aligned_pow2_mask(addr, end, 64);
>>> +
>>> +            num_pages = (mask + 1) >> granule;
>>> +            trace_smmuv3_s1_range_inval(vmid, asid, addr,
>>> +                                        tg, num_pages, ttl, leaf);
>>> +            smmuv3_inv_notifiers_iova(s, asid, addr, tg, num_pages);
>>> +            smmu_iotlb_inv_iova(s, asid, addr, tg, num_pages, ttl);
>>> +            addr += mask + 1;
>>> +        }
>>>       }
>>>   }
>>>   @@ -1028,18 +1042,22 @@ static int smmuv3_cmdq_consume(SMMUv3State
>>> *s)
>>>                 trace_smmuv3_cmdq_tlbi_nh_asid(asid);
>>>               smmu_inv_notifiers_all(&s->smmu_state);
>>> -            smmu_iotlb_inv_asid(bs, asid);
>>> +            if (s->disable_cached_iotlb) {
>>> +                smmu_iotlb_inv_asid(bs, asid);
>>> +            }
>>>               break;
>>>           }
>>>           case SMMU_CMD_TLBI_NH_ALL:
>>>           case SMMU_CMD_TLBI_NSNH_ALL:
>>>               trace_smmuv3_cmdq_tlbi_nh();
>>>               smmu_inv_notifiers_all(&s->smmu_state);
>>> -            smmu_iotlb_inv_all(bs);
>>> +            if (s->disable_cached_iotlb) {
>>> +                smmu_iotlb_inv_all(bs);
>>> +            }
>>>               break;
>>>           case SMMU_CMD_TLBI_NH_VAA:
>>>           case SMMU_CMD_TLBI_NH_VA:
>>> -            smmuv3_s1_range_inval(bs, &cmd);
>>> +            smmuv3_s1_range_inval(s, &cmd);
>>>               break;
>>>           case SMMU_CMD_TLBI_EL3_ALL:
>>>           case SMMU_CMD_TLBI_EL3_VA:
>>> @@ -1506,6 +1524,12 @@ static void smmuv3_instance_init(Object *obj)
>>>       /* Nothing much to do here as of now */
>>>   }
>>>   +static Property smmuv3_properties[] = {
>>> +    DEFINE_PROP_BOOL("disable_cached_iotlb", SMMUv3State,
>>> +                     disable_cached_iotlb, true),
>>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>> +
>>>   static void smmuv3_class_init(ObjectClass *klass, void *data)
>>>   {
>>>       DeviceClass *dc = DEVICE_CLASS(klass);
>>> @@ -1515,6 +1539,7 @@ static void smmuv3_class_init(ObjectClass
>>> *klass, void *data)
>>>       device_class_set_parent_reset(dc, smmu_reset, &c->parent_reset);
>>>       c->parent_realize = dc->realize;
>>>       dc->realize = smmu_realize;
>>> +    device_class_set_props(dc, smmuv3_properties);
>>>   }
>>>     static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>>> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
>>> index c641e60..c94ab7e 100644
>>> --- a/include/hw/arm/smmuv3.h
>>> +++ b/include/hw/arm/smmuv3.h
>>> @@ -62,6 +62,7 @@ struct SMMUv3State {
>>>         qemu_irq     irq[4];
>>>       QemuMutex mutex;
>>> +    bool disable_cached_iotlb; /* Whether disable/enable cached
>>> iotlb */
>>>   };
>>>     typedef enum {
>> Thanks
>>
>> Eric
>>
>>
>> .
>>
>
>


