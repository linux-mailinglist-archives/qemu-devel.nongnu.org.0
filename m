Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0060C2849FC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 12:01:46 +0200 (CEST)
Received: from localhost ([::1]:53172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPjmy-0005jX-UK
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 06:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kPjkR-0004KY-At
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 05:59:08 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:41733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kPjkN-0004Hr-9T
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 05:59:05 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.121])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DAD966280112;
 Tue,  6 Oct 2020 11:58:52 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 6 Oct 2020
 11:58:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0048afa39c4-ddd5-4508-9255-030d4fa49dfa,
 ABBA5CC1B3A583228A496F54FDB0659883642288) smtp.auth=groug@kaod.org
Date: Tue, 6 Oct 2020 11:58:50 +0200
From: Greg Kurz <groug@kaod.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost: Ignore vrings in dirty log when using a vIOMMU
Message-ID: <20201006115850.11f06b8e@bahia.lan>
In-Reply-To: <20201005101414-mutt-send-email-mst@kernel.org>
References: <160105498386.68108.2145229309875282336.stgit@bahia.lan>
 <20200928062343.GA501872@yekko.fritz.box>
 <20200928093718.334774b2@bahia.lan>
 <20201005101414-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 2d8bc93f-5f35-48c5-80be-f1cba419e46b
X-Ovh-Tracer-Id: 4601552920851880355
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrgeeggddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeelteetkeevhfelgfevkefgudfffeekgfehgeefheelleejudeugfffieekleegnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepjhgrshhofigrnhhgsehrvgguhhgrthdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 05:58:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <laurent@vivier.eu>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Oct 2020 10:18:03 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Sep 28, 2020 at 09:37:18AM +0200, Greg Kurz wrote:
> > On Mon, 28 Sep 2020 16:23:43 +1000
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >=20
> > > On Fri, Sep 25, 2020 at 07:29:43PM +0200, Greg Kurz wrote:
> > > > When a vIOMMU is present, any address comming from the guest is an =
IO
> > > > virtual address, including those of the vrings. The backend's acces=
ses
> > > > to the vrings happen through vIOMMU translation : the backend hence
> > > > only logs the final guest physical address, not the IO virtual one.
> > > > It thus doesn't make sense to make room for the vring addresses in =
the
> > > > dirty log in this case.
> > > >=20
> > > > This fixes a crash of the source when migrating a guest using in-ke=
rnel
> > > > vhost-net and iommu_platform=3Don on POWER, because DMA regions are=
 put
> > > > at very high addresses and the resulting log size is likely to cause
> > > > g_malloc0() to abort.
> > > >=20
> > > > BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1879349
> > > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > >=20
> > > I'm a little confused as to what's going on here.  Obviously
> > > allocating dirty bitmaps in IOVA space doesn't make much sense.
> > > But.. in all cases isn't the ring ending up in guest memory, whether
> > > translated or not.  So why do specific addresses of the ring make a
> > > difference in *any* case.
> > >=20
> >=20
> > I admit I'm a bit surprised as well... I can't think of a scenario
> > where the address of the used ring would be higher than the guest
> > memory... Maybe MST can shed some light here ?
>=20
> So the original idea was that vring itself is specified in
> terms of HVA as opposed to rest of stuff which is specified
> in terms of GPA.

The vring itself is indeed described in term of HVA (vq->used) but
when it comes to the dirty log, QEMU passes the GPA of the used
structure to the vhost backend:

=46rom vhost_virtqueue_set_addr():

    addr.log_guest_addr =3D vq->used_phys;
                              ^^ GPA ^^
    addr.flags =3D enable_log ? (1 << VHOST_VRING_F_LOG) : 0;
    r =3D dev->vhost_ops->vhost_set_vring_addr(dev, &addr);

And the sizing of the bitmap computed in vhost_get_log_size() is
also based on this GPA:

    for (i =3D 0; i < dev->nvqs; ++i) {
        struct vhost_virtqueue *vq =3D dev->vqs + i;

        if (!vq->used_phys && !vq->used_size) {
            continue;
        }

        uint64_t last =3D vq->used_phys + vq->used_size - 1;
                            ^^ GPA ^^
        log_size =3D MAX(log_size, last / VHOST_LOG_CHUNK + 1);
    }

With platform_iommu=3Doff, I couldn't find a case where this second
loop in vhost_get_log_size() increases the log size actually... and
when platform_iommu=3Don, vq->used_phys is a GIOVA that my other patches
you've already merged in the kernel explicitly ignore when it comes to
the dirty log... So it really seems that this loop is useless for the
general case. If it is there to address some corner case, I guess it
deserves a comment at the very least.

Cheers,

--
Greg

> This way we wanted to support e.g. migration by vhost writing into
> qemu address space, qemu copying data to guest memory.
>=20
>=20
>=20
>=20
> > > > ---
> > > >  hw/virtio/vhost.c |   38 ++++++++++++++++++++++++--------------
> > > >  1 file changed, 24 insertions(+), 14 deletions(-)
> > > >=20
> > > > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > > > index 1a1384e7a642..0b83d6b8e65e 100644
> > > > --- a/hw/virtio/vhost.c
> > > > +++ b/hw/virtio/vhost.c
> > > > @@ -106,6 +106,20 @@ static void vhost_dev_sync_region(struct vhost=
_dev *dev,
> > > >      }
> > > >  }
> > > > =20
> > > > +static int vhost_dev_has_iommu(struct vhost_dev *dev)
> > > > +{
> > > > +    VirtIODevice *vdev =3D dev->vdev;
> > > > +
> > > > +    /*
> > > > +     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> > > > +     * incremental memory mapping API via IOTLB API. For platform =
that
> > > > +     * does not have IOMMU, there's no need to enable this feature
> > > > +     * which may cause unnecessary IOTLB miss/update trnasactions.
> > > > +     */
> > > > +    return vdev->dma_as !=3D &address_space_memory &&
> > > > +           virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > > > +}
> > > > +
> > > >  static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
> > > >                                     MemoryRegionSection *section,
> > > >                                     hwaddr first,
> > > > @@ -130,6 +144,11 @@ static int vhost_sync_dirty_bitmap(struct vhos=
t_dev *dev,
> > > >                                range_get_last(reg->guest_phys_addr,
> > > >                                               reg->memory_size));
> > > >      }
> > > > +
> > > > +    if (vhost_dev_has_iommu(dev)) {
> > > > +        return 0;
> > > > +    }
> > > > +
> > > >      for (i =3D 0; i < dev->nvqs; ++i) {
> > > >          struct vhost_virtqueue *vq =3D dev->vqs + i;
> > > > =20
> > > > @@ -172,6 +191,11 @@ static uint64_t vhost_get_log_size(struct vhos=
t_dev *dev)
> > > >                                         reg->memory_size);
> > > >          log_size =3D MAX(log_size, last / VHOST_LOG_CHUNK + 1);
> > > >      }
> > > > +
> > > > +    if (vhost_dev_has_iommu(dev)) {
> > > > +        return log_size;
> > > > +    }
> > > > +
> > > >      for (i =3D 0; i < dev->nvqs; ++i) {
> > > >          struct vhost_virtqueue *vq =3D dev->vqs + i;
> > > > =20
> > > > @@ -287,20 +311,6 @@ static inline void vhost_dev_log_resize(struct=
 vhost_dev *dev, uint64_t size)
> > > >      dev->log_size =3D size;
> > > >  }
> > > > =20
> > > > -static int vhost_dev_has_iommu(struct vhost_dev *dev)
> > > > -{
> > > > -    VirtIODevice *vdev =3D dev->vdev;
> > > > -
> > > > -    /*
> > > > -     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> > > > -     * incremental memory mapping API via IOTLB API. For platform =
that
> > > > -     * does not have IOMMU, there's no need to enable this feature
> > > > -     * which may cause unnecessary IOTLB miss/update trnasactions.
> > > > -     */
> > > > -    return vdev->dma_as !=3D &address_space_memory &&
> > > > -           virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > > > -}
> > > > -
> > > >  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
> > > >                                hwaddr *plen, bool is_write)
> > > >  {
> > > >=20
> > > >=20
> > >=20
> >=20
>=20
>=20


