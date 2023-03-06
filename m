Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31D26AB514
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 04:38:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ1eF-0006YE-Ap; Sun, 05 Mar 2023 22:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ1eC-0006Y4-9t
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:36:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZ1e9-0001mF-Ve
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 22:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678073780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=77Mz0SbMGwUeMu+UVBBe/tqpIX2iAFs5nn2kqfNC69o=;
 b=XuZSE4kMBUZP1W3VvrEyKHBo1+SEhI2+gYCGCmTRfkaErae7aIHv1BiVt3Hth1DmVUW2hI
 q0ucskemI9Ns6Dlki6EzqdPmKU4tB5sTDdkvnU7wvFZlrXmhruk+plM7kpeC6jkpn+4ARh
 fkgDhlXPjygzlfIF/EptyES+G7MMmAo=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-L79gidGKPRqLh36y2NSRsA-1; Sun, 05 Mar 2023 22:36:18 -0500
X-MC-Unique: L79gidGKPRqLh36y2NSRsA-1
Received: by mail-pf1-f197.google.com with SMTP id
 n17-20020a056a000d5100b005e5e662a4ccso4749222pfv.4
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 19:36:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678073778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=77Mz0SbMGwUeMu+UVBBe/tqpIX2iAFs5nn2kqfNC69o=;
 b=uaBhyePRm7an8JDU5GtzI/M40ufsB3aIi6vVFrMeP4mnoSCdaeosNd2KuBE5cKh3GX
 bu5IMDveT0ZJiNOLY8g7zyuRXTq9OMkcr1IXHraYhyPbOMTV6D7XJx/tEUfBIknDQczJ
 +Eef/tWlvhCyc6yR8EUpU7H972ee+q7tJEg+ppLxFbJWIMqjlDGV7DEE9+kGCUoaypk2
 7OIgEI2MDcEh2NS7SgWpER6hgYt2ofht468n4E1FDcTxGHpYOuB1kLrvpDPy60Yif2LE
 sFjBOWSHZdgv5lZ+kWcvXUYRVrnqjiFF1xkMOPgc4Vxam7Aoxu7CT738AipBe8tpP+Tc
 +Djw==
X-Gm-Message-State: AO0yUKVot2R6CM1hDTA81AzvZDSeaUD+bJahwUz1RX26hd5qTK4RXjKh
 0GLqc0kkmORN7xNgwLMrd9baBkcCkKJ6sk2wSqbwFuF1U50Gi/lVmYuyfdxSxRwexTvX2TZnQbK
 jJ7ErphEMHzvYnU0=
X-Received: by 2002:a05:6a20:1609:b0:cc:d44a:bec2 with SMTP id
 l9-20020a056a20160900b000ccd44abec2mr11490330pzj.1.1678073777654; 
 Sun, 05 Mar 2023 19:36:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/xmhZpyxFjgbzPFAR6/CDT0xhIDz2lraGgm86Ma6gv4PaKWXbeEhWjLHHEsQep9pAWf1IbaQ==
X-Received: by 2002:a05:6a20:1609:b0:cc:d44a:bec2 with SMTP id
 l9-20020a056a20160900b000ccd44abec2mr11490310pzj.1.1678073777196; 
 Sun, 05 Mar 2023 19:36:17 -0800 (PST)
Received: from [10.72.13.207] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm5239648pgj.52.2023.03.05.19.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 19:36:16 -0800 (PST)
Message-ID: <7d12ff4f-3d33-e360-c76c-b0937b6be7c8@redhat.com>
Date: Mon, 6 Mar 2023 11:36:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v13 2/2] vhost-vdpa: add support for vIOMMU
Content-Language: en-US
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com
Cc: qemu-devel@nongnu.org
References: <20230208025722.2683024-1-lulu@redhat.com>
 <20230208025722.2683024-3-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230208025722.2683024-3-lulu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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


在 2023/2/8 10:57, Cindy Lu 写道:
> 1.Add support for vIOMMU.
> Add the new function to deal with iommu MR.
> - during iommu_region_add register a specific IOMMU notifier,
>    and store all notifiers in a list.
> - during iommu_region_del, compare and delete the IOMMU notifier from the list
> - since the SVQ not support iommu yet, add the check for IOMMU
>    in vhost_vdpa_dev_start, if the SVQ and IOMMU enable at the same time
>    function will return fail.
>
> 2.Skip the check in vhost_vdpa_listener_skipped_section() while
> MR is IOMMU, Move this check to  vhost_vdpa_iommu_map_notify()


This need some tweak as well, it's better not repeat what is done in the 
code but why do you need this change. More could be found at:

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes


>
> Verified in vp_vdpa and vdpa_sim_net driver
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c         | 173 ++++++++++++++++++++++++++++++---
>   include/hw/virtio/vhost-vdpa.h |  11 +++
>   2 files changed, 173 insertions(+), 11 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 542e003101..46f676ab71 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -26,6 +26,7 @@
>   #include "cpu.h"
>   #include "trace.h"
>   #include "qapi/error.h"
> +#include "hw/virtio/virtio-access.h"
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


Please tweak the comment, it has issues of whitespace, capitalization,  
punctuation marks.


> +     */
>   
> -    llend = vhost_vdpa_section_end(section);
> -    if (int128_gt(llend, int128_make64(iova_max))) {
> -        error_report("RAM section out of device range (max=0x%" PRIx64
> -                     ", end addr=0x%" PRIx64 ")",
> -                     iova_max, int128_get64(llend));
> -        return true;
> +    if (!memory_region_is_iommu(section->mr)) {


Note related to this patch but should we exclude non ram region here as 
well?


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
> @@ -185,6 +193,118 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
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


Can you meet this condition? If yes, should we crop instead of fail here?


> +    }
> +
> +    vhost_vdpa_iotlb_batch_begin_once(v);


Where do we send the VHOST_IOTLB_BATCH_END message, or do we even need 
any batching here?


> +
> +    if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
> +        bool read_only;
> +
> +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, NULL)) {
> +            return;
> +        }
> +
> +        ret = vhost_vdpa_dma_map(v, VHOST_VDPA_GUEST_PA_ASID, iova,
> +                                 iotlb->addr_mask + 1, vaddr, read_only);
> +        if (ret) {
> +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
> +                         "0x%" HWADDR_PRIx ", %p) = %d (%m)",
> +                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
> +        }
> +    } else {
> +        ret = vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
> +                                   iotlb->addr_mask + 1);
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
> +                     section->size);
> +    end = int128_sub(end, int128_one());
> +    iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
> +                                                   MEMTXATTRS_UNSPECIFIED);
> +    iommu->iommu_mr = iommu_mr;
> +    iommu_notifier_init(&iommu->n, vhost_vdpa_iommu_map_notify,
> +                        IOMMU_NOTIFIER_IOTLB_EVENTS,
> +                        section->offset_within_region,
> +                        int128_get64(end),
> +                        iommu_idx);
> +    iommu->iommu_offset = section->offset_within_address_space -
> +                          section->offset_within_region;
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
> @@ -199,6 +319,10 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>                                               v->iova_range.last)) {
>           return;
>       }
> +    if (memory_region_is_iommu(section->mr)) {
> +        vhost_vdpa_iommu_region_add(listener, section);
> +        return;
> +    }
>   
>       if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
>                    (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> @@ -278,6 +402,9 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>                                               v->iova_range.last)) {
>           return;
>       }
> +    if (memory_region_is_iommu(section->mr)) {
> +        vhost_vdpa_iommu_region_del(listener, section);
> +    }
>   
>       if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
>                    (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> @@ -288,7 +415,8 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>       iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
>       llend = vhost_vdpa_section_end(section);
>   
> -    trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
> +    trace_vhost_vdpa_listener_region_del(v, iova,
> +        int128_get64(int128_sub(llend, int128_one())));


Seems like an independent fix?


>   
>       if (int128_ge(int128_make64(iova), llend)) {
>           return;
> @@ -315,10 +443,28 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>           vhost_iova_tree_remove(v->iova_tree, *result);
>       }
>       vhost_vdpa_iotlb_batch_begin_once(v);
> +    /*
> +     * The unmap ioctl doesn't accept a full 64-bit. need to check it
> +     */
> +    if (int128_eq(llsize, int128_2_64())) {
> +        llsize = int128_rshift(llsize, 1);
> +        ret = vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
> +                                   int128_get64(llsize));
> +
> +        if (ret) {
> +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
> +                         "0x%" HWADDR_PRIx ") = %d (%m)",
> +                         v, iova, int128_get64(llsize), ret);
> +        }
> +        iova += int128_get64(llsize);
> +    }
>       ret = vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
>                                  int128_get64(llsize));
> +
>       if (ret) {
> -        error_report("vhost_vdpa dma unmap error!");
> +        error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
> +                     "0x%" HWADDR_PRIx ") = %d (%m)",
> +                     v, iova, int128_get64(llsize), ret);
>       }


Let's use a separate patch to fix this full 64-bit issue.


>   
>       memory_region_unref(section->mr);
> @@ -578,7 +724,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>       v = dev->opaque;
>       trace_vhost_vdpa_cleanup(dev, v);
>       vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> -    memory_listener_unregister(&v->listener);


Any reason for not unregistering listener here?

Thanks


>       vhost_vdpa_svq_cleanup(dev);
>   
>       dev->opaque = NULL;
> @@ -1130,7 +1275,13 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>       }
>   
>       if (started) {
> -        memory_listener_register(&v->listener, &address_space_memory);
> +        if (vhost_dev_has_iommu(dev) && (v->shadow_vqs_enabled)) {
> +            error_report("the SVQ can not wortk in with IOMMU enable, please "
> +                         "disable IOMMU and try again");
> +            return -1;
> +        }
> +        memory_listener_register(&v->listener, dev->vdev->dma_as);
> +
>           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>       } else {
>           vhost_vdpa_reset_device(dev);
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 7997f09a8d..54cede86dc 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -49,6 +49,8 @@ typedef struct vhost_vdpa {
>       void *shadow_vq_ops_opaque;
>       struct vhost_dev *dev;
>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> +    IOMMUNotifier n;
>   } VhostVDPA;
>   
>   int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
> @@ -58,4 +60,13 @@ int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
>   int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
>                            hwaddr size);
>   
> +typedef struct vdpa_iommu {
> +    struct vhost_vdpa *dev;
> +    IOMMUMemoryRegion *iommu_mr;
> +    hwaddr iommu_offset;
> +    IOMMUNotifier n;
> +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> +} VDPAIOMMUState;
> +
> +
>   #endif


