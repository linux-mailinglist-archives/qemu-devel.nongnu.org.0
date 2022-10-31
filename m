Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A7F6137A3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:16:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUWb-0003lc-3J; Mon, 31 Oct 2022 09:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUVu-0003VH-04
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUVr-0008P1-LC
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667221654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJc1uW0mBGMjsxBk7D+jsAUsP+H8SCz6vSIKxhBTlb0=;
 b=ct75K7xIBW756jg1f6i5iypZzJN2Mmggke4A/38rh0NLMvBstlZkj+yvGD8ELO6+mybSuh
 6fvWIyxJq/dzsG09JFSqdEpLxN5MmCVkqvrjrSeoDdjbX3zOR+Bi5xh7Q2IPqs/U+YN+pK
 sh2CAx89nbtufGTs+/QQB/wStQTV2yY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-177-LV7T4x4bNgKdf1QkvlOkHg-1; Mon, 31 Oct 2022 09:07:30 -0400
X-MC-Unique: LV7T4x4bNgKdf1QkvlOkHg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l1-20020a7bc341000000b003bfe1273d6cso2589040wmj.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jJc1uW0mBGMjsxBk7D+jsAUsP+H8SCz6vSIKxhBTlb0=;
 b=rfoTs9dvmmv6c2QHU+lJSVuTRcuZASIDWdWNIMJc3P/ztfktyK621CxFCT1ucl7Et/
 ID5mcUw02YwXHU4Lmj8UvIyCE1uD+DlaEDUYSTwYbmtAp3ffaB9RMp92tREKobE1oIsP
 6Aopsp7kZacd8t5jHdbki8+Q83RM1kvYD5blva70WTU7KfSBUjUwie+w34yeEg7ZOX2x
 LLVyTGJiZ9+6/gH2b0p36rNTpv+7FMDXHtaChhSgSYnosmm16h33Rt5ipW/IzIAHUdj3
 1nWL3oRernLxCI1GBWxCsCd8l/cYm4SaN/TeTvCCC8bnKjR25XPlj2GJCgRmZf6FIzPJ
 J/gQ==
X-Gm-Message-State: ACrzQf1J/ukgMtS5bJadLtvXc/IjzF8vuM38j2rsbvdjjT/Vf1jVC/NB
 IZMAQ8rsexjL0b09MEwIrNeueTCtnglKclhvNocLFlFoSIraBYqkuLQTLj9hNB2K6r/gbpg43B3
 xa05JrIDZ+jtuFI8=
X-Received: by 2002:a05:600c:a04:b0:3b4:f20e:63f4 with SMTP id
 z4-20020a05600c0a0400b003b4f20e63f4mr8045015wmp.201.1667221649572; 
 Mon, 31 Oct 2022 06:07:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4VRTxZkxU6uVrKGeFuep58dqzTgMu2JGfEaHQuHDVY+/W2L9ty9dfzD/3t1NIUWqn7VxMQXA==
X-Received: by 2002:a05:600c:a04:b0:3b4:f20e:63f4 with SMTP id
 z4-20020a05600c0a0400b003b4f20e63f4mr8044974wmp.201.1667221649287; 
 Mon, 31 Oct 2022 06:07:29 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 u13-20020a056000038d00b00236c1f2cecesm5664252wrf.81.2022.10.31.06.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:07:28 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:07:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org,
 sgarzare@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v9 2/2] vhost-vdpa: add support for vIOMMU
Message-ID: <20221031090711-mutt-send-email-mst@kernel.org>
References: <20221031031020.1405111-1-lulu@redhat.com>
 <20221031031020.1405111-3-lulu@redhat.com>
 <20221031025743-mutt-send-email-mst@kernel.org>
 <CACLfguVJjqOwPfjsMCKFoaDOixmhxtvm+E_ENMpiqr7dHyr6RA@mail.gmail.com>
 <20221031031804-mutt-send-email-mst@kernel.org>
 <CACLfguVXPA8_oaszbUEs=RDDn-NrZZRUhAWoUCRQFS3JDViW5w@mail.gmail.com>
 <CACLfguWf01q8+GmNBzs7XUUhZ6n3uAuwVp8FfjzyCyokPEzLXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACLfguWf01q8+GmNBzs7XUUhZ6n3uAuwVp8FfjzyCyokPEzLXg@mail.gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 08:56:22PM +0800, Cindy Lu wrote:
> On Mon, 31 Oct 2022 at 16:30, Cindy Lu <lulu@redhat.com> wrote:
> >
> > On Mon, 31 Oct 2022 at 15:20, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Oct 31, 2022 at 03:15:14PM +0800, Cindy Lu wrote:
> > > > ,
> > > >
> > > >
> > > > On Mon, 31 Oct 2022 at 15:04, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Mon, Oct 31, 2022 at 11:10:20AM +0800, Cindy Lu wrote:
> > > > > > Add support for vIOMMU. add the new function to deal with iommu MR.
> > > > > > - during iommu_region_add register a specific IOMMU notifier,
> > > > > >  and store all notifiers in a list.
> > > > > > - during iommu_region_del, compare and delete the IOMMU notifier from the list
> > > > > >
> > > > > > Verified in vp_vdpa and vdpa_sim_net driver
> > > > > >
> > > > > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > > > > > ---
> > > > > >  hw/virtio/vhost-vdpa.c         | 123 ++++++++++++++++++++++++++++++---
> > > > > >  include/hw/virtio/vhost-vdpa.h |  10 +++
> > > > > >  2 files changed, 122 insertions(+), 11 deletions(-)
> > > > > >
> > > > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > > > index 3ff9ce3501..dcfaaccfa9 100644
> > > > > > --- a/hw/virtio/vhost-vdpa.c
> > > > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > > > @@ -26,6 +26,7 @@
> > > > > >  #include "cpu.h"
> > > > > >  #include "trace.h"
> > > > > >  #include "qapi/error.h"
> > > > > > +#include "hw/virtio/virtio-access.h"
> > > > > >
> > > > > >  /*
> > > > > >   * Return one past the end of the end of section. Be careful with uint64_t
> > > > > > @@ -44,7 +45,6 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
> > > > > >                                                  uint64_t iova_min,
> > > > > >                                                  uint64_t iova_max)
> > > > > >  {
> > > > > > -    Int128 llend;
> > > > > >
> > > > > >      if ((!memory_region_is_ram(section->mr) &&
> > > > > >           !memory_region_is_iommu(section->mr)) ||
> > > > > > @@ -61,14 +61,6 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
> > > > > >          return true;
> > > > > >      }
> > > > > >
> > > > > > -    llend = vhost_vdpa_section_end(section);
> > > > > > -    if (int128_gt(llend, int128_make64(iova_max))) {
> > > > > > -        error_report("RAM section out of device range (max=0x%" PRIx64
> > > > > > -                     ", end addr=0x%" PRIx64 ")",
> > > > > > -                     iova_max, int128_get64(llend));
> > > > > > -        return true;
> > > > > > -    }
> > > > > > -
> > > > > >      return false;
> > > > > >  }
> > > > > >
> > > > >
> > > > > I couldn't figure out we are completely removing this.
> > > > > So this function is now checking iova_min but not iova_max?
> > > > > Seems asymmetrical.
> > > > >
> > > > this is because this is an asset for int128_get64，So I just not jump
> > > > this part of the check,
> > > > static inline uint64_t int128_get64(Int128 a)
> > > > {
> > > >     uint64_t r = a;
> > > >     assert(r == a);
> > > >     return r;
> > > > }
> > >
> > >
> > > ?
> > >
> > > Could not parse this. You mean assert? And removing functionality
> > > because you don't like an error message does not make sense.
> > > So find another way to print it?
> > >
> > sorry for my mistake here
> > for this part, I remove this because it will report error in iommu mr added
> > Also there is no such check in vfio,
> > seems the llend is always small than iov_max in iommu domain,
> > not sure we can remove it first and I will add more comments later ?
> > Thanks
> > cindy
> sorry here I mean llend is larger than  iov_max here, so the iommu mr
> can not pass the
> check, not sure if we can remove this check first?
> Thanks
> Cindy


ys split it out with proper documentation first.

> > >
> > > >
> > > > >
> > > > > > @@ -173,6 +165,106 @@ static void vhost_vdpa_listener_commit(MemoryListener *listener)
> > > > > >      v->iotlb_batch_begin_sent = false;
> > > > > >  }
> > > > > >
> > > > > > +static void vhost_vdpa_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
> > > > > > +{
> > > > > > +    struct vdpa_iommu *iommu = container_of(n, struct vdpa_iommu, n);
> > > > > > +
> > > > > > +    hwaddr iova = iotlb->iova + iommu->iommu_offset;
> > > > > > +    struct vhost_vdpa *v = iommu->dev;
> > > > > > +    void *vaddr;
> > > > > > +    int ret;
> > > > > > +
> > > > > > +    if (iotlb->target_as != &address_space_memory) {
> > > > > > +        error_report("Wrong target AS \"%s\", only system memory is allowed",
> > > > > > +                     iotlb->target_as->name ? iotlb->target_as->name : "none");
> > > > > > +        return;
> > > > > > +    }
> > > > > > +    RCU_READ_LOCK_GUARD();
> > > > > > +    vhost_vdpa_iotlb_batch_begin_once(v);
> > > > > > +
> > > > > > +    if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
> > > > > > +        bool read_only;
> > > > > > +
> > > > > > +        if (!memory_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, NULL)) {
> > > > > > +            return;
> > > > > > +        }
> > > > > > +        ret =
> > > > > > +            vhost_vdpa_dma_map(v, iova, iotlb->addr_mask + 1, vaddr, read_only);
> > > > > > +        if (ret) {
> > > > > > +            error_report("vhost_vdpa_dma_map(%p, 0x%" HWADDR_PRIx ", "
> > > > > > +                         "0x%" HWADDR_PRIx ", %p) = %d (%m)",
> > > > > > +                         v, iova, iotlb->addr_mask + 1, vaddr, ret);
> > > > > > +        }
> > > > > > +    } else {
> > > > > > +        ret = vhost_vdpa_dma_unmap(v, iova, iotlb->addr_mask + 1);
> > > > > > +        if (ret) {
> > > > > > +            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
> > > > > > +                         "0x%" HWADDR_PRIx ") = %d (%m)",
> > > > > > +                         v, iova, iotlb->addr_mask + 1, ret);
> > > > > > +        }
> > > > > > +    }
> > > > > > +}
> > > > > > +
> > > > > > +static void vhost_vdpa_iommu_region_add(MemoryListener *listener,
> > > > > > +                                        MemoryRegionSection *section)
> > > > > > +{
> > > > > > +    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
> > > > > > +
> > > > > > +    struct vdpa_iommu *iommu;
> > > > > > +    Int128 end;
> > > > > > +    int iommu_idx;
> > > > > > +    IOMMUMemoryRegion *iommu_mr;
> > > > > > +    int ret;
> > > > > > +
> > > > > > +    iommu_mr = IOMMU_MEMORY_REGION(section->mr);
> > > > > > +
> > > > > > +    iommu = g_malloc0(sizeof(*iommu));
> > > > > > +    end =  int128_add(int128_make64(section->offset_within_region),
> > > > > > +            section->size);
> > > > > > +    end = int128_sub(end, int128_one());
> > > > > > +    iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
> > > > > > +            MEMTXATTRS_UNSPECIFIED);
> > > > > > +
> > > > > > +    iommu->iommu_mr = iommu_mr;
> > > > > > +
> > > > > > +    iommu_notifier_init(
> > > > > > +        &iommu->n, vhost_vdpa_iommu_map_notify, IOMMU_NOTIFIER_IOTLB_EVENTS,
> > > > > > +        section->offset_within_region, int128_get64(end), iommu_idx);
> > > > > > +    iommu->iommu_offset =
> > > > > > +        section->offset_within_address_space - section->offset_within_region;
> > > > > > +    iommu->dev = v;
> > > > > > +
> > > > > > +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
> > > > > > +    if (ret) {
> > > > > > +        g_free(iommu);
> > > > > > +        return;
> > > > > > +    }
> > > > > > +
> > > > > > +    QLIST_INSERT_HEAD(&v->iommu_list, iommu, iommu_next);
> > > > > > +    memory_region_iommu_replay(iommu->iommu_mr, &iommu->n);
> > > > > > +
> > > > > > +    return;
> > > > > > +}
> > > > > > +
> > > > > > +static void vhost_vdpa_iommu_region_del(MemoryListener *listener,
> > > > > > +                                        MemoryRegionSection *section)
> > > > > > +{
> > > > > > +    struct vhost_vdpa *v = container_of(listener, struct vhost_vdpa, listener);
> > > > > > +
> > > > > > +    struct vdpa_iommu *iommu;
> > > > > > +
> > > > > > +    QLIST_FOREACH(iommu, &v->iommu_list, iommu_next)
> > > > > > +    {
> > > > > > +        if (MEMORY_REGION(iommu->iommu_mr) == section->mr &&
> > > > > > +            iommu->n.start == section->offset_within_region) {
> > > > > > +            memory_region_unregister_iommu_notifier(section->mr, &iommu->n);
> > > > > > +            QLIST_REMOVE(iommu, iommu_next);
> > > > > > +            g_free(iommu);
> > > > > > +            break;
> > > > > > +        }
> > > > > > +    }
> > > > > > +}
> > > > > > +
> > > > > >  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > > > > >                                             MemoryRegionSection *section)
> > > > > >  {
> > > > > > @@ -186,6 +278,10 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > > > > >                                              v->iova_range.last)) {
> > > > > >          return;
> > > > > >      }
> > > > > > +    if (memory_region_is_iommu(section->mr)) {
> > > > > > +        vhost_vdpa_iommu_region_add(listener, section);
> > > > > > +        return;
> > > > > > +    }
> > > > > >
> > > > > >      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
> > > > > >                   (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> > > > > > @@ -260,6 +356,10 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
> > > > > >                                              v->iova_range.last)) {
> > > > > >          return;
> > > > > >      }
> > > > > > +    if (memory_region_is_iommu(section->mr)) {
> > > > > > +        vhost_vdpa_iommu_region_del(listener, section);
> > > > > > +        return;
> > > > > > +    }
> > > > > >
> > > > > >      if (unlikely((section->offset_within_address_space & ~TARGET_PAGE_MASK) !=
> > > > > >                   (section->offset_within_region & ~TARGET_PAGE_MASK))) {
> > > > > > @@ -312,6 +412,7 @@ static const MemoryListener vhost_vdpa_memory_listener = {
> > > > > >      .region_del = vhost_vdpa_listener_region_del,
> > > > > >  };
> > > > > >
> > > > > > +
> > > > > >  static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
> > > > > >                               void *arg)
> > > > > >  {
> > > > >
> > > > >
> > > > > This change is not necessary.
> > > > >
> > > > will fix this
> > > > > > @@ -587,7 +688,6 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
> > > > > >      v = dev->opaque;
> > > > > >      trace_vhost_vdpa_cleanup(dev, v);
> > > > > >      vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> > > > > > -    memory_listener_unregister(&v->listener);
> > > > > >      vhost_vdpa_svq_cleanup(dev);
> > > > > >
> > > > > >      dev->opaque = NULL;
> > > > > > @@ -1127,7 +1227,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> > > > > >      }
> > > > > >
> > > > > >      if (started) {
> > > > > > -        memory_listener_register(&v->listener, &address_space_memory);
> > > > > > +        memory_listener_register(&v->listener, dev->vdev->dma_as);
> > > > > > +
> > > > > >          return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
> > > > > >      } else {
> > > > > >          vhost_vdpa_reset_device(dev);
> > > > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> > > > > > index d10a89303e..64a46e37cb 100644
> > > > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > > > @@ -41,8 +41,18 @@ typedef struct vhost_vdpa {
> > > > > >      void *shadow_vq_ops_opaque;
> > > > > >      struct vhost_dev *dev;
> > > > > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > > > > > +    QLIST_HEAD(, vdpa_iommu) iommu_list;
> > > > > > +    IOMMUNotifier n;
> > > > > >  } VhostVDPA;
> > > > > >
> > > > > > +struct vdpa_iommu {
> > > > > > +    struct vhost_vdpa *dev;
> > > > > > +    IOMMUMemoryRegion *iommu_mr;
> > > > > > +    hwaddr iommu_offset;
> > > > > > +    IOMMUNotifier n;
> > > > > > +    QLIST_ENTRY(vdpa_iommu) iommu_next;
> > > > > > +};
> > > > > > +
> > > > >
> > > > > You need to add a typedef as per coding style.
> > > > >
> > > > will fix this
> > > > Thanks
> > > > Cindy
> > > > > >  int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> > > > > >                         void *vaddr, bool readonly);
> > > > > >  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, hwaddr iova, hwaddr size);
> > > > > > --
> > > > > > 2.34.3
> > > > >
> > >


