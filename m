Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D982C60F1FA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 10:14:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onxzP-00031D-Oj; Thu, 27 Oct 2022 04:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onxz7-0002c1-TC
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:11:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onxz0-00033i-0x
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666858273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5S8ENV5s4oy1P6VVmFFfAFKTITBLxwgjWvBaJ0+cC9Y=;
 b=dba6SP9p4Pl1A64eb+k8jQsM++/+DxIKtWsCK0S+ssM/B6fggxq/njG/lG+k9LfXVVAQH4
 lSLM7WERkX59/pUuHGhIs1xXYTtOtDrTR+WJSTi/GfbiFQCHjjZdHM0nE+6q3crM9qUfhQ
 /T7XppgdV3j5xSGtO54jGqsS07Ititw=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-325-IPPSyoBNNZmrVCfS7Ns6kA-1; Thu, 27 Oct 2022 04:11:11 -0400
X-MC-Unique: IPPSyoBNNZmrVCfS7Ns6kA-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-13b041fd3cbso441812fac.16
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5S8ENV5s4oy1P6VVmFFfAFKTITBLxwgjWvBaJ0+cC9Y=;
 b=t8EiYVvE7qFmxl1vIZ4PrGuO6JFQPKb76zxFIxd3JP5+us7XQoGg29CVgj0ut4UyqC
 J8sZvLTMgzsz8j0TGX+/Dv87bx6MgLzm3dACz5gZboaaj38o41edA4Dm6U8dpftgarxi
 OCVlFSMFmQgfhUFrACSzIwohMxZhCfEl1L+hh0Qx4drjIcJuKQ9yulQlz5a7pZ8y1S5Y
 fS/G58pkAWWrT4bUuBgFN324PQ2/p8MskOlkiwo419wdXHTBA5C2mcIW/rslMZQtpCtS
 aVp4/fE9vEc/Z8QZI/A/+c01Oxbhlb6cX3/Qng43tU8AqHpwaeVCVfCyaDkJOVzdup+F
 A7Iw==
X-Gm-Message-State: ACrzQf1KTJDm6LIe5bl9M+QOVMl7+iOGWpeei19eUatsjAD0TJU4eckU
 TcqG7SFdkHjeGxJ30k9f4RszfpKFi7wAjIECBZKoDgWsGHGQYVhZqfJ0n3cFg+dGeTjVNYmElEZ
 dxBIYoRkMlqfdlIjoUwfTyogDdcogqws=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr4670362oal.35.1666858270499; 
 Thu, 27 Oct 2022 01:11:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4tXPfcddWrGCCYWOOBdS8WEOXJCdpk+S1S/eXzrxLvy8/zTlGuCAGcDh+5x1h1urFeIXt17pWPAlpaxS9R8IM=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr4670343oal.35.1666858270192; Thu, 27
 Oct 2022 01:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221027074032.1101939-1-lulu@redhat.com>
 <20221027074032.1101939-3-lulu@redhat.com>
In-Reply-To: <20221027074032.1101939-3-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 27 Oct 2022 16:10:58 +0800
Message-ID: <CACGkMEu5Nzz9jg-nuQtaway1-Jm-V-0KUNcsDJEz9nq=xOHkeA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] vhost-vdpa: add support for vIOMMU
To: Cindy Lu <lulu@redhat.com>
Cc: alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Oct 27, 2022 at 3:41 PM Cindy Lu <lulu@redhat.com> wrote:
>
> Add support for vIOMMU. add the new function to deal with iommu MR.
> - during iommu_region_add register a specific IOMMU notifier,
>  and store all notifiers in a list.
> - during iommu_region_del, compare and delete the IOMMU notifier from the list
>
> Verified in vp_vdpa and vdpa_sim_net driver
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

(some nits, see below)

> ---
>  hw/virtio/vhost-vdpa.c         | 131 ++++++++++++++++++++++++++++++---
>  include/hw/virtio/vhost-vdpa.h |  10 +++
>  2 files changed, 130 insertions(+), 11 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 3ff9ce3501..407f3e9ac2 100644
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
> @@ -173,6 +165,115 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
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
> +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only,
> +                                  &address_space_memory)) {
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
> +    if (!memory_region_is_iommu(section->mr)) {
> +        return;

Nit: So we had already had one check in the caller, there's no need to
check twice. (this could be done on top).

> +    }
> +
> +    iommu_mr = IOMMU_MEMORY_REGION(section->mr);
> +
> +    iommu = g_malloc0(sizeof(*iommu));
> +    end =  int128_add(int128_make64(section->offset_within_region),
> +        section->size);
> +    end = int128_sub(end, int128_one());
> +    iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
> +        MEMTXATTRS_UNSPECIFIED);
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
> +    if (!memory_region_is_iommu(section->mr)) {
> +        return;

Ditto.

Thanks

> +    }
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
> @@ -186,6 +287,10 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
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
> @@ -260,6 +365,10 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
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
> @@ -587,7 +696,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
>      v = dev->opaque;
>      trace_vhost_vdpa_cleanup(dev, v);
>      vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> -    memory_listener_unregister(&v->listener);
>      vhost_vdpa_svq_cleanup(dev);
>
>      dev->opaque = NULL;
> @@ -1127,7 +1235,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
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
> index d10a89303e..64a46e37cb 100644
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
> +struct vdpa_iommu {
> +    struct vhost_vdpa *dev;
> +    IOMMUMemoryRegion *iommu_mr;
> +    hwaddr iommu_offset;
> +    IOMMUNotifier n;
> +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> +};
> +
>  int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
>                         void *vaddr, bool readonly);
>  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
> --
> 2.34.3
>


