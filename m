Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DEE42D6CA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 12:08:31 +0200 (CEST)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maxf3-0006lI-Nb
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 06:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maxbK-0004d3-Ln
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 06:04:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1maxbE-0005Hz-M8
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 06:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634205871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pyBuscxL0uho4LXk6bpAqqaMDDpP7m5Klo68M0PqjQU=;
 b=I+zfZB5NA8RItUx36EiBcxIxJqlgmV3RpmtL8CTrOcF12kywie3BAxfEl/hXwpylk659qD
 IkA3AjoLIdb1W2HEU0K/o7FfyyuId2N/bPGSkIHu1oW0YVYMfwXESvwE9hfYqKPaJDfgzb
 1xjX4THS6XaPXeqNOMS6S2BOiiIo/bE=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-oAfHUrpWM1Sduha3tpB2Vw-1; Thu, 14 Oct 2021 06:04:30 -0400
X-MC-Unique: oAfHUrpWM1Sduha3tpB2Vw-1
Received: by mail-lf1-f70.google.com with SMTP id
 x33-20020a0565123fa100b003fcfd99073dso4040095lfa.6
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 03:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pyBuscxL0uho4LXk6bpAqqaMDDpP7m5Klo68M0PqjQU=;
 b=lHZLX1+/4nnGcF7tLoPOUan+P11sI9am20kJhTO4oxhSGjQ93qFUm2CoBPBLVrIC9e
 sJaEkT4Tpskkic2rJjdklEL4A9+3Mz/x0LW8+AaQNjr2R+OiAT0CCRIadZnf9ydZCI9j
 9Q5c2Po/KLd0FTwm1OR5Tut4Ha2zIyv6nDdbWMa30UW7R2ZPx+iy4Bz4+SAXhrU2D9PI
 2sO6ybP9CcZzEahA1JVaHEHDoYArpbXQR79b3flS0KEusQ0EEtXrAXRz7Ds6eIpIAC8W
 ySMlvuC35WyOj+tjLZUoBoZiVu+Tbk/QyYqCdN9A+j2QKCZaveTQxQt18UvCoCHWfFe4
 601A==
X-Gm-Message-State: AOAM530QVPRi5hEhupLVxouG+hXLIxWIxG5V5tP4q94N6BnJYd/uSEFY
 71mQJd409FqKh7XCeePFZr2AsPxFn5ADa7tQF7Y5tQQw28wpyUqpkiyKOgioU79Cse7s9kjsB8y
 JC9xMeRKJLHXmuA1gW8VfarHe2vqQT+E=
X-Received: by 2002:a2e:a603:: with SMTP id v3mr5169051ljp.369.1634205869116; 
 Thu, 14 Oct 2021 03:04:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpncFX24seAqJNaHqnLPTsLKzARGVGCSe0x4l9r9yRFCTURucuAzmKzp1buoiM2ZEe8fEZBGnPyFseHWRXODY=
X-Received: by 2002:a2e:a603:: with SMTP id v3mr5169017ljp.369.1634205868812; 
 Thu, 14 Oct 2021 03:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211012140710.804529-1-eperezma@redhat.com>
 <20211012140710.804529-4-eperezma@redhat.com>
 <CACGkMEsGDoWuE0WEq7P-S5V5XiLPCZcVAszQFHDLsLDZEAAh5A@mail.gmail.com>
 <CAJaqyWdW+JarVW6tOfM6rYHh2fb=whGHFdwmFy0AMcLqukOrpg@mail.gmail.com>
 <CACGkMEv1P3MiRYENsDfx-iarEiv7Bik-qTaYUEAAmAUV1nEfWg@mail.gmail.com>
 <CAJaqyWfU2KAULXkNPNPOo+824Kx2z5ibo-Gr6q2FNoOCpThQ8Q@mail.gmail.com>
In-Reply-To: <CAJaqyWfU2KAULXkNPNPOo+824Kx2z5ibo-Gr6q2FNoOCpThQ8Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 14 Oct 2021 18:04:18 +0800
Message-ID: <CACGkMEs-qMg9OEXGrNiB5kxQ9g=Cn2rhGDc=BtVWSRBf3i=emw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] vdpa: Check for iova range at mappings changes
To: Eugenio Perez Martin <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 14, 2021 at 4:08 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Thu, Oct 14, 2021 at 9:02 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Thu, Oct 14, 2021 at 1:57 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Thu, Oct 14, 2021 at 5:30 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Tue, Oct 12, 2021 at 10:07 PM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
> > > > >
> > > > > Check vdpa device range before updating memory regions so we don'=
t add
> > > > > any outside of it, and report the invalid change if any.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  include/hw/virtio/vhost-vdpa.h |  2 ++
> > > > >  hw/virtio/vhost-vdpa.c         | 62 +++++++++++++++++++++++++---=
------
> > > > >  hw/virtio/trace-events         |  1 +
> > > > >  3 files changed, 49 insertions(+), 16 deletions(-)
> > > > >
> > > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/v=
host-vdpa.h
> > > > > index a8963da2d9..c288cf7ecb 100644
> > > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > > @@ -13,6 +13,7 @@
> > > > >  #define HW_VIRTIO_VHOST_VDPA_H
> > > > >
> > > > >  #include "hw/virtio/virtio.h"
> > > > > +#include "standard-headers/linux/vhost_types.h"
> > > > >
> > > > >  typedef struct VhostVDPAHostNotifier {
> > > > >      MemoryRegion mr;
> > > > > @@ -24,6 +25,7 @@ typedef struct vhost_vdpa {
> > > > >      uint32_t msg_type;
> > > > >      bool iotlb_batch_begin_sent;
> > > > >      MemoryListener listener;
> > > > > +    struct vhost_vdpa_iova_range iova_range;
> > > > >      struct vhost_dev *dev;
> > > > >      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> > > > >  } VhostVDPA;
> > > > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > > > index be7c63b4ba..dbf773d032 100644
> > > > > --- a/hw/virtio/vhost-vdpa.c
> > > > > +++ b/hw/virtio/vhost-vdpa.c
> > > > > @@ -37,20 +37,34 @@ static Int128 vhost_vdpa_section_end(const Me=
moryRegionSection *section)
> > > > >      return llend;
> > > > >  }
> > > > >
> > > > > -static bool vhost_vdpa_listener_skipped_section(MemoryRegionSect=
ion *section)
> > > > > -{
> > > > > -    return (!memory_region_is_ram(section->mr) &&
> > > > > -            !memory_region_is_iommu(section->mr)) ||
> > > > > -            memory_region_is_protected(section->mr) ||
> > > > > -           /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > > > > -            memory_region_is_ram_device(section->mr) ||
> > > > > -           /*
> > > > > -            * Sizing an enabled 64-bit BAR can cause spurious ma=
ppings to
> > > > > -            * addresses in the upper part of the 64-bit address =
space.  These
> > > > > -            * are never accessed by the CPU and beyond the addre=
ss width of
> > > > > -            * some IOMMU hardware.  TODO: VDPA should tell us th=
e IOMMU width.
> > > > > -            */
> > > > > -           section->offset_within_address_space & (1ULL << 63);
> > >
> > > [1]
> > >
> > > > > +static bool vhost_vdpa_listener_skipped_section(MemoryRegionSect=
ion *section,
> > > > > +                                                uint64_t iova_mi=
n,
> > > > > +                                                uint64_t iova_ma=
x)
> > > > > +{
> > > > > +    Int128 llend;
> > > > > +
> > > > > +    if ((!memory_region_is_ram(section->mr) &&
> > > > > +         !memory_region_is_iommu(section->mr)) ||
> > > > > +        memory_region_is_protected(section->mr) ||
> > > > > +        /* vhost-vDPA doesn't allow MMIO to be mapped  */
> > > > > +        memory_region_is_ram_device(section->mr)) {
> > > > > +        return true;
> > > > > +    }
> > > > > +
> > > > > +    if (section->offset_within_address_space < iova_min) {
> > > > > +        error_report("RAM section out of device range (min=3D%lu=
, addr=3D%lu)",
> > > > > +                     iova_min, section->offset_within_address_sp=
ace);
> > > > > +        return true;
> > > > > +    }
> > > > > +
> > > > > +    llend =3D vhost_vdpa_section_end(section);
> > > > > +    if (int128_gt(llend, int128_make64(iova_max))) {
> > > > > +        error_report("RAM section out of device range (max=3D%lu=
, end addr=3D%lu)",
> > > > > +                     iova_max, int128_get64(llend));
> > > > > +        return true;
> > > > > +    }
> > > > > +
> > > > > +    return false;
> > > > >  }
> > > > >
> > > > >  static int vhost_vdpa_dma_map(struct vhost_vdpa *v, hwaddr iova,=
 hwaddr size,
> > > > > @@ -162,7 +176,8 @@ static void vhost_vdpa_listener_region_add(Me=
moryListener *listener,
> > > > >      void *vaddr;
> > > > >      int ret;
> > > > >
> > > > > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > > > > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_ran=
ge.first,
> > > > > +                                            v->iova_range.last))=
 {
> > > > >          return;
> > > > >      }
> > > > >
> > > > > @@ -220,7 +235,8 @@ static void vhost_vdpa_listener_region_del(Me=
moryListener *listener,
> > > > >      Int128 llend, llsize;
> > > > >      int ret;
> > > > >
> > > > > -    if (vhost_vdpa_listener_skipped_section(section)) {
> > > > > +    if (vhost_vdpa_listener_skipped_section(section, v->iova_ran=
ge.first,
> > > > > +                                            v->iova_range.last))=
 {
> > > > >          return;
> > > > >      }
> > > > >
> > > > > @@ -288,6 +304,19 @@ static void vhost_vdpa_add_status(struct vho=
st_dev *dev, uint8_t status)
> > > > >      vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
> > > > >  }
> > > > >
> > > > > +static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
> > > > > +{
> > > > > +    int ret =3D vhost_vdpa_call(v->dev, VHOST_VDPA_GET_IOVA_RANG=
E,
> > > > > +                              &v->iova_range);
> > > > > +    if (ret !=3D 0) {
> > > > > +        v->iova_range.first =3D 0;
> > > > > +        v->iova_range.last =3D MAKE_64BIT_MASK(0, 63);
> > > >
> > > > Nit:
> > > >
> > > > ULLONG_MAX?
> > > >
> > >
> > > It should be ULLONG_MAX >> 1 to match the previous limit [1],
> >
> > I think they don't conflict. We just want to preserve the default iova
> > range as what the kernel did. Kernel will give ULLONG_MAX if
> > get_iova_range() is not implemented by the device?
> >
>
> Right, so each one understood a different "previous limit" then :). I

Yes.

> will replace it with UINT64_MAX if you are ok with that.

Fine with me.

Thanks

>
> Thanks!
>
> >
> > > and
> > > trusting that uint64_t is effectively unsigned long long. I see a 63
> > > bits mask immediately with MAKE_64BIT_MASK (once I remember the
> > > parameter order), but I find it harder to see it with (ULLONG_MAX >>
> > > 1).
> > >
> > > If you prefer the _MAX options, I would say it is better to stick wit=
h
> > > (UINT64_MAX >> 1) or (HWADDR_MAX >> 1), because of this in
> > > CODING_STYLE.rst:
> > >
> > > "If you're using "int" or "long", odds are good that there's a better
> > > type. ...", "In the event that you require a specific width, use a
> > > standard type like int32_t, uint32_t, uint64_t, etc", "Use hwaddr for
> > > guest physical addresses".
> > >
> > > Does it make sense to you?
> >
> > If I was not wrong, we can use UINT64_MAX.
> >
> > Thanks
> >
> > >
> > > Thanks!
> > >
> > > > Others look good.
> > > >
> > > > Thanks
> > > >
> > > > > +    }
> > > > > +
> > > > > +    trace_vhost_vdpa_get_iova_range(v->dev, v->iova_range.first,
> > > > > +                                    v->iova_range.last);
> > > > > +}
> > > > > +
> > > > >  static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, =
Error **errp)
> > > > >  {
> > > > >      struct vhost_vdpa *v;
> > > > > @@ -300,6 +329,7 @@ static int vhost_vdpa_init(struct vhost_dev *=
dev, void *opaque, Error **errp)
> > > > >      v->listener =3D vhost_vdpa_memory_listener;
> > > > >      v->msg_type =3D VHOST_IOTLB_MSG_V2;
> > > > >
> > > > > +    vhost_vdpa_get_iova_range(v);
> > > > >      vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
> > > > >                                 VIRTIO_CONFIG_S_DRIVER);
> > > > >
> > > > > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > > > > index 8ed19e9d0c..650e521e35 100644
> > > > > --- a/hw/virtio/trace-events
> > > > > +++ b/hw/virtio/trace-events
> > > > > @@ -52,6 +52,7 @@ vhost_vdpa_set_vring_call(void *dev, unsigned i=
nt index, int fd) "dev: %p index:
> > > > >  vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p f=
eatures: 0x%"PRIx64
> > > > >  vhost_vdpa_set_owner(void *dev) "dev: %p"
> > > > >  vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_a=
ddr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p des=
c_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"P=
RIx64
> > > > > +vhost_vdpa_get_iova_range(void *dev, uint64_t first, uint64_t la=
st) "dev: %p first: 0x%"PRIx64" last: 0x%"PRIx64
> > > > >
> > > > >  # virtio.c
> > > > >  virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, =
unsigned out_num) "elem %p size %zd in_num %u out_num %u"
> > > > > --
> > > > > 2.27.0
> > > > >
> > > >
> > >
> >
>


