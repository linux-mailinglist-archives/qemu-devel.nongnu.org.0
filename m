Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36934222FB
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 12:01:25 +0200 (CEST)
Received: from localhost ([::1]:42748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXhGG-0001rw-J7
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 06:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXhDq-00017Q-BG
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:58:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXhDn-0005qw-E4
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633427929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmwnXvkmYDV2UFgwVlGPjFT8h4eTJqISaB74o5IEW0c=;
 b=DROHVrJxp7CyWA1TijTGXVeBB2Z754KmL8RVDZydnei3zfqRt+oCZl48wBfOABPHT02+Ml
 JZksX1U2UCTd43NKX5Wn0Kw7kQKitVhN2eDmPw9GE5hZI3uTkgOXBPVUPDq3MjogE439CS
 +7hOkK+14n266nabVtYolpdiCdJvnZw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-B2mZ3HNHPdScII_SoFJmHA-1; Tue, 05 Oct 2021 05:58:48 -0400
X-MC-Unique: B2mZ3HNHPdScII_SoFJmHA-1
Received: by mail-qv1-f69.google.com with SMTP id
 kc13-20020a056214410d00b00382bc805781so8792372qvb.12
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 02:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bmwnXvkmYDV2UFgwVlGPjFT8h4eTJqISaB74o5IEW0c=;
 b=Bx6Fe3qS0EBYg9P+8EP+tIgZyvylmjfZJ2x9Cem4Bi1VFuXlqC0BC5JGkTaDSQk8t2
 oRbjSlcuUGMufuKqJ6FDjIAfNLh7883B7dWxy6rjKNCndgDfQ//l1F+SiZLqX3zViGSo
 TdlhjRaFq7rcZKwmm3pH8Loj0//oJiS09oy5oE1cMcRN/eHg5I1Lv5ZC0p89VWpoEqng
 Qf+pRbfXJdLXi9xHtZ9y3WDWOMOkTWg59UbVL7rg4XVLlkQYoZtLOWGb6ZHXDhnILEys
 R4miv6iwhZ6W2K0B3B/RSFGEuZxpKssKN16zKnGiaUXFuutESoAhegT1im9oEMhPL0FL
 C3Kw==
X-Gm-Message-State: AOAM530ythcfzFlhEG111s/AdFWglmNrMBPyoPA8XIEcYNkwTkULLheS
 YEODYGpxKgjhGuQESymdd34+yhxUSQdHibl2wxFeZUi7dn1CTgAr91fZ7wnGnHXCI57im+eV3em
 UhI/P/clwkKSozqI7IsV/Dhoo5KIB52s=
X-Received: by 2002:a37:c05:: with SMTP id 5mr14546723qkm.495.1633427928296;
 Tue, 05 Oct 2021 02:58:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQwW0ltuFE08uXkjqyaPqo3wNTq/c7QtPwZH5JtHSiYH3RJ1Z+gfrFWwQUQ9mx/PxGqFjx1Kej/pTwj/wxGMk=
X-Received: by 2002:a37:c05:: with SMTP id 5mr14546709qkm.495.1633427928051;
 Tue, 05 Oct 2021 02:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211005080131.408506-1-eperezma@redhat.com>
 <20211005080131.408506-4-eperezma@redhat.com>
 <20211005040928-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211005040928-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 5 Oct 2021 11:58:12 +0200
Message-ID: <CAJaqyWdJbpSN8q5idvaYFr7eKAyj5yD36aOMpJ21roqc2ObxHg@mail.gmail.com>
Subject: Re: [PATCH 3/3] vdpa: Check for iova range at mappings changes
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Oct 5, 2021 at 10:14 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Oct 05, 2021 at 10:01:31AM +0200, Eugenio P=C3=A9rez wrote:
> > Check vdpa device range before updating memory regions so we don't add
> > any outside of it, and report the invalid change if any.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  include/hw/virtio/vhost-vdpa.h |  2 +
> >  hw/virtio/vhost-vdpa.c         | 68 ++++++++++++++++++++++++++--------
> >  hw/virtio/trace-events         |  1 +
> >  3 files changed, 55 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index a8963da2d9..c288cf7ecb 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -13,6 +13,7 @@
> >  #define HW_VIRTIO_VHOST_VDPA_H
> >
> >  #include "hw/virtio/virtio.h"
> > +#include "standard-headers/linux/vhost_types.h"
> >
> >  typedef struct VhostVDPAHostNotifier {
> >      MemoryRegion mr;
> > @@ -24,6 +25,7 @@ typedef struct vhost_vdpa {
> >      uint32_t msg_type;
> >      bool iotlb_batch_begin_sent;
> >      MemoryListener listener;
> > +    struct vhost_vdpa_iova_range iova_range;
> >      struct vhost_dev *dev;
> >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >  } VhostVDPA;
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index a1de6c7c9c..26d0258723 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -33,20 +33,34 @@ static Int128 vhost_vdpa_section_end(const MemoryRe=
gionSection *section)
> >      return llend;
> >  }
> >
> > -static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *s=
ection)
> > -{
> > -    return (!memory_region_is_ram(section->mr) &&
> > -            !memory_region_is_iommu(section->mr)) ||
> > -            memory_region_is_protected(section->mr) ||
> > -           /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > -            memory_region_is_ram_device(section->mr) ||
> > -           /*
> > -            * Sizing an enabled 64-bit BAR can cause spurious mappings=
 to
> > -            * addresses in the upper part of the 64-bit address space.=
  These
> > -            * are never accessed by the CPU and beyond the address wid=
th of
> > -            * some IOMMU hardware.  TODO: VDPA should tell us the IOMM=
U width.
> > -            */
> > -           section->offset_within_address_space & (1ULL << 63);
> > +static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *s=
ection,
> > +                                                uint64_t iova_min,
> > +                                                uint64_t iova_max)
> > +{
> > +    Int128 llend;
> > +    bool r =3D (!memory_region_is_ram(section->mr) &&
> > +              !memory_region_is_iommu(section->mr)) ||
> > +              memory_region_is_protected(section->mr) ||
> > +              /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > +              memory_region_is_ram_device(section->mr);
> > +    if (r) {
> > +        return true;
> > +    }
> > +
> > +    if (section->offset_within_address_space < iova_min) {
> > +        error_report("RAM section out of device range (min=3D%lu, addr=
=3D%lu)",
> > +                     iova_min, section->offset_within_address_space);
> > +        return true;
> > +    }
> > +
> > +    llend =3D vhost_vdpa_section_end(section);
> > +    if (int128_make64(llend) > iova_max) {
>
> I am puzzled by this.
> You are taking a Int128, converting to u64, converting
> back to Int128, and comparing to u64.
> Head spins. What is all this back and forth trying to achieve?
>

You are totally right, this series was extracted from a longer one
where I didn't use vhost_vdpa_section_end, but raw addresses. Then I
applied int128_make64 to the wrong variable, too fast.

To be sure we are on the same page, to do:

if (int128_ge(int128_make64(iova), llend)) {
    // error message
    return;
}

The same way as vhost_vdpa_listener_region_{add,del} would be ok?

Thanks!

> > +        error_report("RAM section out of device range (max=3D%lu, end =
addr=3D%lu)",
> > +                     iova_max, (uint64_t)int128_make64(llend));
> > +        return true;
> > +    }
> > +
> > +    return false;
> >  }
> >
> >  static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova, hwadd=
r size,
> > @@ -158,7 +172,8 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
> >      void *vaddr;
> >      int ret;
> >
> > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.fir=
st,
> > +                                            v->iova_range.last)) {
> >          return;
> >      }
> >
> > @@ -216,7 +231,8 @@ static void vhost_vdpa_listener_region_del(MemoryLi=
stener *listener,
> >      Int128 llend, llsize;
> >      int ret;
> >
> > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_range.fir=
st,
> > +                                            v->iova_range.last)) {
> >          return;
> >      }
> >
> > @@ -284,9 +300,24 @@ static void vhost_vdpa_add_status(struct vhost_dev=
 *dev, uint8_t status)
> >      vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
> >  }
> >
> > +static int vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> > +{
> > +    int ret;
> > +
> > +    ret =3D vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANGE, &v->iov=
a_range);
> > +    if (ret !=3D 0) {
> > +        return ret;
> > +    }
> > +
> > +    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> > +                                    v->iova_range.last);
> > +    return ret;
> > +}
> > +
> >  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error =
**errp)
> >  {
> >      struct vhost_vdpa *v;
> > +    int r;
> >      assert(dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_VDPA=
);
> >      trace_vhost_vdpa_init(dev, opaque);
> >
> > @@ -296,6 +327,11 @@ static int vhost_vdpa_init(struct vhost_dev *dev, =
void *opaque, Error **errp)
> >      v->listener =3D vhost_vdpa_memory_listener;
> >      v->msg_type =3D VHOST_IOTLB_MSG_V2;
> >
> > +    r =3D vhost_vdpa_get_iova_range(v);
> > +    if (unlikely(!r)) {
> > +        return r;
> > +    }
> > +
> >      vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> >                                 VIRTIO_CONFIG_S_DRIVER);
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 8ed19e9d0c..650e521e35 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int ind=
ex, int fd) "dev: %p index:
> >  vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p feature=
s: 0x%"PRIx64
> >  vhost_vdpa_set_owner(void *dev) "dev: %p"
> >  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, u=
int64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user=
_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> > +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t last) "d=
ev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
> >
> >  # virtio.c
> >  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsign=
ed out_num) "elem %p size %zd in_num %u out_num %u"
> > --
> > 2.27.0
>


