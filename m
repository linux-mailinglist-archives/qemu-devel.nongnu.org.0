Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCCB64B0F0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 09:18:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p50U0-0007yu-Hj; Tue, 13 Dec 2022 03:17:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p50Tt-0007xT-Je
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:17:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p50Tq-0006wz-Ja
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670919456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CITosRpPOCwe3DgElsD+BWXroBhdgCyOFlCks09K3HU=;
 b=M2Ix7OjVx6ONbUF6wLJicinDmnnzeFyQZwNUwzbiUt/KH08TKG1NQg94+XP+rkiNrecPFM
 /6VXHsY0TxzQVoK5cxifUUK/yjyiATrMHMmiAHKxNXnUe6FNbLEVOu82ZLxdHaLo7vSPq/
 JaHtIHYXucFAoQdTzBxakPNAGmiklRI=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-f5hda4ljNe2lFeDZZkigXw-1; Tue, 13 Dec 2022 03:17:35 -0500
X-MC-Unique: f5hda4ljNe2lFeDZZkigXw-1
Received: by mail-pg1-f197.google.com with SMTP id
 p7-20020a631e47000000b0047691854a86so9258181pgm.16
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 00:17:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CITosRpPOCwe3DgElsD+BWXroBhdgCyOFlCks09K3HU=;
 b=pvqm8T1ImqFesGtDuXrq6oxDHQlxmN6WBzuiNWCkegnDmJS+kwujVyCmkaf6MbWvRV
 OKySRsLq8kOXMh2fuzkIb9EWFDMv0Ql9Jfr0PKSWlqxNrd7Ud/qwZ0U/COuP5/JlShEV
 MNi1BuTCx2OJxW8Quj0HQ7pPqdN4ebaiDMboXy5frvjhuGHP3OU+0Acr6hMaR+uxYg8x
 KVsm+sXFkaDF1FEQ4cJSyh0r+yNMxAodmrQMrHs2i5e2MLRMIy7DO6jTyAV33giVSjfd
 wmX5D+CrQVZgaLFgzAiRqB2qGWOI2tsJc3rhMA2CVL23jvQz7r3oB8WVcWPzXRia7fgK
 C3lg==
X-Gm-Message-State: ANoB5pmdE74VyEADh2E7pR1YY9HJmza7tU0VJvi1qDUoSZY/WhDjIlQG
 eiiDauuMjyj3Up1vY7MowIPDYA0jU9081Xv0GHm4DjUrOkvcpVaHapsSt71GZwBSw0ggeoA0g0T
 9BSrjattDaTUH2/o=
X-Received: by 2002:a17:90b:4b05:b0:221:6899:4485 with SMTP id
 lx5-20020a17090b4b0500b0022168994485mr4985707pjb.15.1670919454031; 
 Tue, 13 Dec 2022 00:17:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6nKRSbn4ef0MY7cg1wtz0Edfts891Jj+Op0xkBjkUa45MO5g3lsO7cpqVom/ez8kLh1iZ1vQ==
X-Received: by 2002:a17:90b:4b05:b0:221:6899:4485 with SMTP id
 lx5-20020a17090b4b0500b0022168994485mr4985693pjb.15.1670919453750; 
 Tue, 13 Dec 2022 00:17:33 -0800 (PST)
Received: from [10.72.13.188] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 fa17-20020a17090af0d100b002191e769546sm6650695pjb.4.2022.12.13.00.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 00:17:33 -0800 (PST)
Message-ID: <273d0d56-a1a0-444d-ac35-7eee3c83e6fe@redhat.com>
Date: Tue, 13 Dec 2022 16:17:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v12 1/1] vhost-vdpa: add support for vIOMMU
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com
Cc: qemu-devel@nongnu.org, Eugenio Perez Martin <eperezma@redhat.com>
References: <20221209130805.3614970-1-lulu@redhat.com>
 <20221209130805.3614970-2-lulu@redhat.com>
Content-Language: en-US
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221209130805.3614970-2-lulu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/12/9 21:08, Cindy Lu 写道:
> 1.Skip the check in vhost_vdpa_listener_skipped_section() while
> MR is IOMMU, Move this check to  vhost_vdpa_iommu_map_notify()
> 2.Add support for vIOMMU.


So I think the changlog needs some tweak, we need to explain why you 
need to do the above.


> Add the new function to deal with iommu MR.
> - during iommu_region_add register a specific IOMMU notifier,
>   and store all notifiers in a list.
> - during iommu_region_del, compare and delete the IOMMU notifier from the list


And try to describe how you implement it by avoid duplicating what the 
code did as below.

E.g you can say you implement this through the IOMMU MAP notifier etc.


>
> Verified in vp_vdpa and vdpa_sim_net driver
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c         | 162 ++++++++++++++++++++++++++++++---
>   include/hw/virtio/vhost-vdpa.h |  10 ++
>   2 files changed, 161 insertions(+), 11 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7468e44b87..2b3920c2a1 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -26,6 +26,7 @@
>   #include "cpu.h"
>   #include "trace.h"
>   #include "qapi/error.h"
> +#include "hw/virtio/virtio-access.h"


Any reason you need to use virtio accessors here?


>   
>   /*
>    * Return one past the end of the end of section. Be careful with uint64_t
> @@ -60,15 +61,22 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
>                        iova_min, section->offset_within_address_space);
>           return true;
>       }
> +    /*
> +     * While using vIOMMU, Sometimes the section will be larger than iova_max
> +     * but the memory that  actually mapping is smaller, So skip the check
> +     * here. Will add the check in vhost_vdpa_iommu_map_notify,
> +     *There is the real size that maps to the kernel
> +     */
>   
> -    llend = vhost_vdpa_section_end(section);
> -    if (int128_gt(llend, int128_make64(iova_max))) {
> -        error_report("RAM section out of device range (max=0x%" PRIx64
> -                     ", end addr=0x%" PRIx64 ")",
> -                     iova_max, int128_get64(llend));
> -        return true;
> +    if (!memory_region_is_iommu(section->mr)) {
> +        llend = vhost_vdpa_section_end(section);
> +        if (int128_gt(llend, int128_make64(iova_max))) {
> +            error_report("RAM section out of device range (max=0x%" PRIx64
> +                         ", end addr=0x%" PRIx64 ")",
> +                         iova_max, int128_get64(llend));
> +            return true;
> +        }
>       }
> -
>       return false;
>   }
>   
> @@ -173,6 +181,115 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
>       v->iotlb_batch_begin_sent = false;
>   }
>   
> +static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> +{
> +    struct vdpa_iommu *iommu = container_of(n, struct vdpa_iommu, n);
> +
> +    hwaddr iova = iotlb->iova + iommu->iommu_offset;
> +    struct vhost_vdpa *v = iommu->dev;
> +    void *vaddr;
> +    int ret;
> +    Int128 llend;
> +
> +    if (iotlb->target_as != &address_space_memory) {
> +        error_report("Wrong target AS \"%s\", only system memory is allowed",
> +                     iotlb->target_as->name ? iotlb->target_as->name : "none");
> +        return;
> +    }
> +    RCU_READ_LOCK_GUARD();
> +    /* check if RAM section out of device range */
> +    llend = int128_add(int128_makes64(iotlb->addr_mask), int128_makes64(iova));
> +    if (int128_gt(llend, int128_make64(v->iova_range.last))) {
> +        error_report("RAM section out of device range (max=0x%" PRIx64
> +                     ", end addr=0x%" PRIx64 ")",
> +                     v->iova_range.last, int128_get64(llend));
> +        return;
> +    }
> +
> +    vhost_vdpa_iotlb_batch_begin_once(v);'


Any reason we need to consider batching here? (or batching can be done 
via notifier?)


> +
> +    if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
> +        bool read_only;
> +
> +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, NULL)) {
> +            return;
> +        }
> +
> +        ret = vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vaddr,
> +            read_only);


Let's add some tracepoints for those as what is done in the 
region_add()/del().


> +        if (ret) {
> +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
> +                         "0x%" HWADDR_PRIx ", %p) = %d (%m)",
> +                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
> +        }
> +    } else {
> +        ret = vhost_vdpa_dma_unmap(v, iova, iotlb->addr_mask + 1);
> +        if (ret) {
> +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
> +                         "0x%" HWADDR_PRIx ") = %d (%m)",
> +                         v, iova, iotlb->addr_mask + 1, ret);
> +        }
> +    }
> +}
> +
> +static void vhost_vdpa_iommu_region_add(MemoryListener *listener,
> +                                        MemoryRegionSection *section)
> +{
> +    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
> +
> +    struct vdpa_iommu *iommu;
> +    Int128 end;
> +    int iommu_idx;
> +    IOMMUMemoryRegion *iommu_mr;
> +    int ret;
> +
> +    iommu_mr = IOMMU_MEMORY_REGION(section->mr);
> +
> +    iommu = g_malloc0(sizeof(*iommu));
> +    end = int128_add(int128_make64(section->offset_within_region),
> +        section->size);


Though checkpatch.pl doesn't complain, the indentation looks odd, e.g 
the 's' should be indent to below "i" of "int128" etc.

You can tweak you editor to adopt Qemu coding style.


> +    end = int128_sub(end, int128_one());
> +    iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
> +        MEMTXATTRS_UNSPECIFIED);
> +    iommu->iommu_mr = iommu_mr;
> +    iommu_notifier_init(&iommu->n, vhost_vdpa_iommu_map_notify,
> +        IOMMU_NOTIFIER_IOTLB_EVENTS,
> +        section->offset_within_region, int128_get64(end), iommu_idx);
> +    iommu->iommu_offset = section->offset_within_address_space -
> +        section->offset_within_region;
> +    iommu->dev = v;
> +
> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
> +    if (ret) {
> +        g_free(iommu);
> +        return;
> +    }
> +
> +    QLIST_INSERT_HEAD(&v->iommu_list, iommu, iommu_next);
> +    memory_region_iommu_replay(iommu->iommu_mr, &iommu->n);
> +
> +    return;
> +}
> +
> +static void vhost_vdpa_iommu_region_del(MemoryListener *listener,
> +                                        MemoryRegionSection *section)
> +{
> +    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
> +
> +    struct vdpa_iommu *iommu;
> +
> +    QLIST_FOREACH(iommu, &v->iommu_list, iommu_next)
> +    {
> +        if (MEMORY_REGION(iommu->iommu_mr) == section->mr &&
> +            iommu->n.start == section->offset_within_region) {
> +            memory_region_unregister_iommu_notifier(section->mr, &iommu->n);
> +            QLIST_REMOVE(iommu, iommu_next);
> +            g_free(iommu);
> +            break;
> +        }
> +    }
> +}
> +
>   static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>                                              MemoryRegionSection *section)
>   {
> @@ -187,6 +304,10 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>                                               v->iova_range.last)) {
>           return;
>       }
> +    if (memory_region_is_iommu(section->mr)) {
> +        vhost_vdpa_iommu_region_add(listener, section);


Adding Eugenio.

I think it need to populate iova_tree otherwise the vIOMMU may break 
shadow virtqueue (and we need to do it for region_del as well).

E.g you can test your code with shadow virtqueue via x-svq=on.

Thanks



