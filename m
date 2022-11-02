Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DD461635E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 14:07:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqDBV-0006UD-U6; Wed, 02 Nov 2022 08:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqDBD-0006Tg-Dq
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:49:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqDBB-0004pA-4B
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667393352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s9xOdc9hZQyZl8yfAKgmYoD3ELdWdf5ZRh8AKX8r4SA=;
 b=ejJgU9lQnIRAs0HDGR1ai3dOFqizONPYkZ284XqAMug/3KLWkGXNFQs/dI6JRRP0AQif4H
 60ScSYreqMkEgNfc1seZdyzW51anyxty/jLKyAUBrEIgdfanWLwbnJNjSufokb+QoX6+g4
 a7SWZg+fe35YzBhf2N6hllBtErucqc8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-F2z5hwPqOoCzEf65i1PZRg-1; Wed, 02 Nov 2022 08:49:08 -0400
X-MC-Unique: F2z5hwPqOoCzEf65i1PZRg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r6-20020a1c4406000000b003cf4d3b6644so3708980wma.6
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 05:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s9xOdc9hZQyZl8yfAKgmYoD3ELdWdf5ZRh8AKX8r4SA=;
 b=tIvYOtMHza2ptK59fwnC+guzp3GG1+4aWls88c2O82YN4Mlu2JjhoRETQc80CvVyf/
 RbisOq6B/yFP1Lk17ecH9SMChclGOmS47lgMPBfoOQhS0uT3M41VueZU/Iy1EDobI6Bn
 qY1KzrqnKq9gZ+uf0QXWBpWu5SP3LKSCSPrdblbeqP9P0Sn2GK6ggsQ2lUljHNsbCdt0
 vaLtUN2sqwgQ3IG4ydCMOgLLobSwfpJaFlt7+aEJtwACUXn6uWe9XUoQd6DJNhg9lCUc
 7IZxdy7VPF7/afNKZDrPharPs0XVtlY3OQSkNrfjZJnvSHoXzumw8AfEnQBDe9aRmO7W
 FVHw==
X-Gm-Message-State: ACrzQf3t9n3C3MiXfBoEX3REM07IDPeyoVK/DtYIyHt45JgE2kVm2h3j
 O7lVgX+8qkiRuEt/lAnvALLNE9Dw9Ued06Y5lXf2o9YoUF4qgrO5LISqQnJ4PvqNJNXG6Y0wfQC
 HO5/wKXMY5UupAYU=
X-Received: by 2002:a1c:c90c:0:b0:3b4:adc7:9766 with SMTP id
 f12-20020a1cc90c000000b003b4adc79766mr15739174wmb.66.1667393347244; 
 Wed, 02 Nov 2022 05:49:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6vndpHcjY63Y9IpGcLsAYI1pedN0DnopyK/CXsI45GidoToHFOWXRekEde4fiuUe52kMJimQ==
X-Received: by 2002:a1c:c90c:0:b0:3b4:adc7:9766 with SMTP id
 f12-20020a1cc90c000000b003b4adc79766mr15739152wmb.66.1667393346968; 
 Wed, 02 Nov 2022 05:49:06 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 m39-20020a05600c3b2700b003bfaba19a8fsm2083280wms.35.2022.11.02.05.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 05:49:06 -0700 (PDT)
Date: Wed, 2 Nov 2022 08:49:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org,
 sgarzare@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 2/2] vhost-vdpa: add support for vIOMMU
Message-ID: <20221102084507-mutt-send-email-mst@kernel.org>
References: <20221031125702.1445168-1-lulu@redhat.com>
 <20221031125702.1445168-3-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031125702.1445168-3-lulu@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 08:57:02PM +0800, Cindy Lu wrote:
> Add support for vIOMMU. add the new function to deal with iommu MR.
> - during iommu_region_add register a specific IOMMU notifier,
>  and store all notifiers in a list.
> - during iommu_region_del, compare and delete the IOMMU notifier from the list
> 
> Verified in vp_vdpa and vdpa_sim_net driver
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c         | 122 ++++++++++++++++++++++++++++++---
>  include/hw/virtio/vhost-vdpa.h |  10 +++
>  2 files changed, 121 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 3ff9ce3501..e483d6e60b 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -26,6 +26,7 @@
>  #include "cpu.h"
>  #include "trace.h"
>  #include "qapi/error.h"
> +#include "hw/virtio/virtio-access.h"
>  
>  /*
>   * Return one past the end of the end of section. Be careful with uint64_t
> @@ -44,7 +45,6 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
>                                                  uint64_t iova_min,
>                                                  uint64_t iova_max)
>  {
> -    Int128 llend;
>  
>      if ((!memory_region_is_ram(section->mr) &&
>           !memory_region_is_iommu(section->mr)) ||
> @@ -61,14 +61,6 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
>          return true;
>      }
>  
> -    llend = vhost_vdpa_section_end(section);
> -    if (int128_gt(llend, int128_make64(iova_max))) {
> -        error_report("RAM section out of device range (max=0x%" PRIx64
> -                     ", end addr=0x%" PRIx64 ")",
> -                     iova_max, int128_get64(llend));
> -        return true;
> -    }
> -
>      return false;
>  }
>

OK so you said this check is not really needed, and I would like
a separate patch to just drop this check with proper
explanation why it's safe.

Sorry if I was not clear this is what I asked for!

Thanks!

  
> @@ -173,6 +165,106 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
>      v->iotlb_batch_begin_sent = false;
>  }
>  
> +static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> +{
> +    struct vdpa_iommu *iommu = container_of(n, struct vdpa_iommu, n);
> +
> +    hwaddr iova = iotlb->iova + iommu->iommu_offset;
> +    struct vhost_vdpa *v = iommu->dev;
> +    void *vaddr;
> +    int ret;
> +
> +    if (iotlb->target_as != &address_space_memory) {
> +        error_report("Wrong target AS \"%s\", only system memory is allowed",
> +                     iotlb->target_as->name ? iotlb->target_as->name : "none");
> +        return;
> +    }
> +    RCU_READ_LOCK_GUARD();
> +    vhost_vdpa_iotlb_batch_begin_once(v);
> +
> +    if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
> +        bool read_only;
> +
> +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, NULL)) {
> +            return;
> +        }
> +        ret =
> +            vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vaddr, read_only);
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
> +    end =  int128_add(int128_make64(section->offset_within_region),
> +            section->size);
> +    end = int128_sub(end, int128_one());
> +    iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
> +            MEMTXATTRS_UNSPECIFIED);
> +
> +    iommu->iommu_mr = iommu_mr;
> +
> +    iommu_notifier_init(
> +        &iommu->n, vhost_vdpa_iommu_map_notify, IOMMU_NOTIFIER_IOTLB_EVENTS,
> +        section->offset_within_region, int128_get64(end), iommu_idx);
> +    iommu->iommu_offset =
> +        section->offset_within_address_space - section->offset_within_region;
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
>  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>                                             MemoryRegionSection *section)
>  {
> @@ -186,6 +278,10 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>                                              v->iova_range.last)) {
>          return;
>      }
> +    if (memory_region_is_iommu(section->mr)) {
> +        vhost_vdpa_iommu_region_add(listener, section);
> +        return;
> +    }
>  
>      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
>                   (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> @@ -260,6 +356,10 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>                                              v->iova_range.last)) {
>          return;
>      }
> +    if (memory_region_is_iommu(section->mr)) {
> +        vhost_vdpa_iommu_region_del(listener, section);
> +        return;
> +    }
>  
>      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
>                   (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> @@ -587,7 +687,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>      v = dev->opaque;
>      trace_vhost_vdpa_cleanup(dev, v);
>      vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> -    memory_listener_unregister(&v->listener);
>      vhost_vdpa_svq_cleanup(dev);
>  
>      dev->opaque = NULL;
> @@ -1127,7 +1226,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>      }
>  
>      if (started) {
> -        memory_listener_register(&v->listener, &address_space_memory);
> +        memory_listener_register(&v->listener, dev->vdev->dma_as);
> +
>          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>      } else {
>          vhost_vdpa_reset_device(dev);
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index d10a89303e..92bfc4785f 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -41,8 +41,18 @@ typedef struct vhost_vdpa {
>      void *shadow_vq_ops_opaque;
>      struct vhost_dev *dev;
>      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> +    IOMMUNotifier n;
>  } VhostVDPA;
>  
> +typedef struct vdpa_iommu {
> +    struct vhost_vdpa *dev;
> +    IOMMUMemoryRegion *iommu_mr;
> +    hwaddr iommu_offset;
> +    IOMMUNotifier n;
> +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> +} VDPAIommu;
> +

We mostly say IOMMU. VDPAIOMMU is a mouthful So maybe
VDPAIOMMUState or some such.

>  int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
>                         void *vaddr, bool readonly);
>  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
> -- 
> 2.34.3


