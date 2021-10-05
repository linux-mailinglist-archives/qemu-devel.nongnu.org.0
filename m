Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C034223E2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 12:48:46 +0200 (CEST)
Received: from localhost ([::1]:59920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXi05-00011P-T7
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 06:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXhyF-0007Yt-F2
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:46:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXhyB-0004yt-IA
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 06:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633430806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVG2LswyQNOuElNGD4fcYX5JNPQtkil/XvOSEaqvA1w=;
 b=DfYG1BnbA6esHhHSXFA+DsyTo3cP9l81gA175e5PDEHN/w+M19qFZKld55htdELixS7F1z
 beiIX8yCmDQfkZmR1Be50L6nWHsVA5Wbtrvz+f3gpzx17Rjv9ucqyVNieGDlsGWsY2nZA9
 bRODarqNOlteeHoz3350r0Q/AX189C4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-td_x9GfYMtSiv76FmA4JsA-1; Tue, 05 Oct 2021 06:46:45 -0400
X-MC-Unique: td_x9GfYMtSiv76FmA4JsA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so20199785edn.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 03:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KVG2LswyQNOuElNGD4fcYX5JNPQtkil/XvOSEaqvA1w=;
 b=TLOBMPevHWnn5d6VhuNuGJWfxf3CsEqMAi5BSslEw+MyLEhPlGFGfXeU1XBotPrn19
 +hENJcnKR3fLFvoY48fd+BJyNSwOt9B/WcFMhS8Wb0V2VWIea/3blpKiEeotplAaTqyJ
 eQwiFfW819EkVqtjm8qpVR0oyvZalflaMhnzuQrXlYSH4nUsE+/96QNWcCNkFfK+ZRwJ
 nx3LHzRQ+WUnjP4M3QAWV5VDLnaARmxmNJ3iHxSwhb3AWrGVSpZvdVg6AcFJYmfTnqYU
 GE8YDhYdKW567I0uX9LCC0fZ6D17w7hxOEXsUlBUkZ9vEb99adDe1ypuvGLKsOFO28ih
 HyAQ==
X-Gm-Message-State: AOAM531q4haFIocKuF9h7HRK7qlmLeys7LMTPe7vPglIC+Cb4eItc+ll
 3ftXomDTBmkyMA76Ff8jlkj/uIXu+V2GznK8/I8GITpcyfDzmaYWIXTxp2qf1k1xFMu8buJFVuc
 Un+7sU8o0BTYX3MI=
X-Received: by 2002:a17:906:5051:: with SMTP id
 e17mr23550229ejk.481.1633430803882; 
 Tue, 05 Oct 2021 03:46:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpUwHMeKX2P53cunQHgX/tNH3AauGbN7alhz5U5ELzrC+k5PMrrvbc1a0R4XihaoPJRfGcYA==
X-Received: by 2002:a17:906:5051:: with SMTP id
 e17mr23550184ejk.481.1633430803530; 
 Tue, 05 Oct 2021 03:46:43 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id y8sm7553618ejm.104.2021.10.05.03.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 03:46:42 -0700 (PDT)
Date: Tue, 5 Oct 2021 06:46:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH 3/3] vdpa: Check for iova range at mappings changes
Message-ID: <20211005064626-mutt-send-email-mst@kernel.org>
References: <20211005080131.408506-1-eperezma@redhat.com>
 <20211005080131.408506-4-eperezma@redhat.com>
 <20211005040928-mutt-send-email-mst@kernel.org>
 <CAJaqyWdJbpSN8q5idvaYFr7eKAyj5yD36aOMpJ21roqc2ObxHg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdJbpSN8q5idvaYFr7eKAyj5yD36aOMpJ21roqc2ObxHg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Parav Pandit <parav@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 11:58:12AM +0200, Eugenio Perez Martin wrote:
> On Tue, Oct 5, 2021 at 10:14 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Oct 05, 2021 at 10:01:31AM +0200, Eugenio Pérez wrote:
> > > Check vdpa device range before updating memory regions so we don't add
> > > any outside of it, and report the invalid change if any.
> > >
> > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > ---
> > >  include/hw/virtio/vhost-vdpa.h |  2 +
> > >  hw/virtio/vhost-vdpa.c         | 68 ++++++++++++++++++++++++++--------
> > >  hw/virtio/trace-events         |  1 +
> > >  3 files changed, 55 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> > > index a8963da2d9..c288cf7ecb 100644
> > > --- a/include/hw/virtio/vhost-vdpa.h
> > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > @@ -13,6 +13,7 @@
> > >  #define HW_VIRTIO_VHOST_VDPA_H
> > >
> > >  #include "hw/virtio/virtio.h"
> > > +#include "standard-headers/linux/vhost_types.h"
> > >
> > >  typedef struct VhostVDPAHostNotifier {
> > >      MemoryRegion mr;
> > > @@ -24,6 +25,7 @@ typedef struct vhost_vdpa {
> > >      uint32_t msg_type;
> > >      bool iotlb_batch_begin_sent;
> > >      MemoryListener listener;
> > > +    struct vhost_vdpa_iova_range iova_range;
> > >      struct vhost_dev *dev;
> > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > >  } VhostVDPA;
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index a1de6c7c9c..26d0258723 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -33,20 +33,34 @@ static Int128 vhost_vdpa_section_end(const MemoryRegionSection *section)
> > >      return llend;
> > >  }
> > >
> > > -static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
> > > -{
> > > -    return (!memory_region_is_ram(section->mr) &&
> > > -            !memory_region_is_iommu(section->mr)) ||
> > > -            memory_region_is_protected(section->mr) ||
> > > -           /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > > -            memory_region_is_ram_device(section->mr) ||
> > > -           /*
> > > -            * Sizing an enabled 64-bit BAR can cause spurious mappings to
> > > -            * addresses in the upper part of the 64-bit address space.  These
> > > -            * are never accessed by the CPU and beyond the address width of
> > > -            * some IOMMU hardware.  TODO: VDPA should tell us the IOMMU width.
> > > -            */
> > > -           section->offset_within_address_space & (1ULL << 63);
> > > +static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
> > > +                                                uint64_t iova_min,
> > > +                                                uint64_t iova_max)
> > > +{
> > > +    Int128 llend;
> > > +    bool r = (!memory_region_is_ram(section->mr) &&
> > > +              !memory_region_is_iommu(section->mr)) ||
> > > +              memory_region_is_protected(section->mr) ||
> > > +              /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > > +              memory_region_is_ram_device(section->mr);
> > > +    if (r) {
> > > +        return true;
> > > +    }
> > > +
> > > +    if (section->offset_within_address_space < iova_min) {
> > > +        error_report("RAM section out of device range (min=%lu, addr=%lu)",
> > > +                     iova_min, section->offset_within_address_space);
> > > +        return true;
> > > +    }
> > > +
> > > +    llend = vhost_vdpa_section_end(section);
> > > +    if (int128_make64(llend) > iova_max) {
> >
> > I am puzzled by this.
> > You are taking a Int128, converting to u64, converting
> > back to Int128, and comparing to u64.
> > Head spins. What is all this back and forth trying to achieve?
> >
> 
> You are totally right, this series was extracted from a longer one
> where I didn't use vhost_vdpa_section_end, but raw addresses. Then I
> applied int128_make64 to the wrong variable, too fast.
> 
> To be sure we are on the same page, to do:
> 
> if (int128_ge(int128_make64(iova), llend)) {
>     // error message
>     return;
> }
> 
> The same way as vhost_vdpa_listener_region_{add,del} would be ok?
> 
> Thanks!


should be ok, yea

> > > +        error_report("RAM section out of device range (max=%lu, end addr=%lu)",
> > > +                     iova_max, (uint64_t)int128_make64(llend));
> > > +        return true;
> > > +    }
> > > +
> > > +    return false;
> > >  }
> > >
> > >  static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwaddr size,
> > > @@ -158,7 +172,8 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
> > >      void *vaddr;
> > >      int ret;
> > >
> > > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.first,
> > > +                                            v->iova_range.last)) {
> > >          return;
> > >      }
> > >
> > > @@ -216,7 +231,8 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
> > >      Int128 llend, llsize;
> > >      int ret;
> > >
> > > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.first,
> > > +                                            v->iova_range.last)) {
> > >          return;
> > >      }
> > >
> > > @@ -284,9 +300,24 @@ static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
> > >      vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
> > >  }
> > >
> > > +static int vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> > > +{
> > > +    int ret;
> > > +
> > > +    ret = vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE, &v->iova_range);
> > > +    if (ret != 0) {
> > > +        return ret;
> > > +    }
> > > +
> > > +    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> > > +                                    v->iova_range.last);
> > > +    return ret;
> > > +}
> > > +
> > >  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
> > >  {
> > >      struct vhost_vdpa *v;
> > > +    int r;
> > >      assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
> > >      trace_vhost_vdpa_init(dev, opaque);
> > >
> > > @@ -296,6 +327,11 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
> > >      v->listener = vhost_vdpa_memory_listener;
> > >      v->msg_type = VHOST_IOTLB_MSG_V2;
> > >
> > > +    r = vhost_vdpa_get_iova_range(v);
> > > +    if (unlikely(!r)) {
> > > +        return r;
> > > +    }
> > > +
> > >      vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > >                                 VIRTIO_CONFIG_S_DRIVER);
> > >
> > > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > > index 8ed19e9d0c..650e521e35 100644
> > > --- a/hw/virtio/trace-events
> > > +++ b/hw/virtio/trace-events
> > > @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
> > >  vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
> > >  vhost_vdpa_set_owner(void *dev) "dev: %p"
> > >  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> > > +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
> > >
> > >  # virtio.c
> > >  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
> > > --
> > > 2.27.0
> >


