Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAAA27A798
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 08:35:16 +0200 (CEST)
Received: from localhost ([::1]:60752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMmkl-0007Tc-71
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 02:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kMmjD-0006Q9-AX
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 02:33:39 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53431 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kMmj9-0008Rv-2p
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 02:33:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4C0CQ76YkRz9sSJ; Mon, 28 Sep 2020 16:33:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1601274799;
 bh=ITLREggAh4PGqLtAXcvlaTKws4QHnttnhRpgvWJXmS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=meqDv+M8hxLXjdiEiYDeo902GntZE0DFrMgHLlwwnZbyFeD4Zn5q6dOUJLHh4SZs+
 5W5qACDmOtmWGEd5L8YWswalaftzqE8LE+12q7vJ4QS4bdL/ZakLM0PMokCG4AwW/6
 kkFSuluFEfA26XdiTfzFy/2yKxE+8XRSDTTkXDhM=
Date: Mon, 28 Sep 2020 16:23:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] vhost: Ignore vrings in dirty log when using a vIOMMU
Message-ID: <20200928062343.GA501872@yekko.fritz.box>
References: <160105498386.68108.2145229309875282336.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <160105498386.68108.2145229309875282336.stgit@bahia.lan>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.078,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2020 at 07:29:43PM +0200, Greg Kurz wrote:
> When a vIOMMU is present, any address comming from the guest is an IO
> virtual address, including those of the vrings. The backend's accesses
> to the vrings happen through vIOMMU translation : the backend hence
> only logs the final guest physical address, not the IO virtual one.
> It thus doesn't make sense to make room for the vring addresses in the
> dirty log in this case.
>=20
> This fixes a crash of the source when migrating a guest using in-kernel
> vhost-net and iommu_platform=3Don on POWER, because DMA regions are put
> at very high addresses and the resulting log size is likely to cause
> g_malloc0() to abort.
>=20
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1879349
> Signed-off-by: Greg Kurz <groug@kaod.org>

I'm a little confused as to what's going on here.  Obviously
allocating dirty bitmaps in IOVA space doesn't make much sense.
But.. in all cases isn't the ring ending up in guest memory, whether
translated or not.  So why do specific addresses of the ring make a
difference in *any* case.

> ---
>  hw/virtio/vhost.c |   38 ++++++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 1a1384e7a642..0b83d6b8e65e 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -106,6 +106,20 @@ static void vhost_dev_sync_region(struct vhost_dev *=
dev,
>      }
>  }
> =20
> +static int vhost_dev_has_iommu(struct vhost_dev *dev)
> +{
> +    VirtIODevice *vdev =3D dev->vdev;
> +
> +    /*
> +     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> +     * incremental memory mapping API via IOTLB API. For platform that
> +     * does not have IOMMU, there's no need to enable this feature
> +     * which may cause unnecessary IOTLB miss/update trnasactions.
> +     */
> +    return vdev->dma_as !=3D &address_space_memory &&
> +           virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> +}
> +
>  static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
>                                     MemoryRegionSection *section,
>                                     hwaddr first,
> @@ -130,6 +144,11 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev =
*dev,
>                                range_get_last(reg->guest_phys_addr,
>                                               reg->memory_size));
>      }
> +
> +    if (vhost_dev_has_iommu(dev)) {
> +        return 0;
> +    }
> +
>      for (i =3D 0; i < dev->nvqs; ++i) {
>          struct vhost_virtqueue *vq =3D dev->vqs + i;
> =20
> @@ -172,6 +191,11 @@ static uint64_t vhost_get_log_size(struct vhost_dev =
*dev)
>                                         reg->memory_size);
>          log_size =3D MAX(log_size, last / VHOST_LOG_CHUNK + 1);
>      }
> +
> +    if (vhost_dev_has_iommu(dev)) {
> +        return log_size;
> +    }
> +
>      for (i =3D 0; i < dev->nvqs; ++i) {
>          struct vhost_virtqueue *vq =3D dev->vqs + i;
> =20
> @@ -287,20 +311,6 @@ static inline void vhost_dev_log_resize(struct vhost=
_dev *dev, uint64_t size)
>      dev->log_size =3D size;
>  }
> =20
> -static int vhost_dev_has_iommu(struct vhost_dev *dev)
> -{
> -    VirtIODevice *vdev =3D dev->vdev;
> -
> -    /*
> -     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> -     * incremental memory mapping API via IOTLB API. For platform that
> -     * does not have IOMMU, there's no need to enable this feature
> -     * which may cause unnecessary IOTLB miss/update trnasactions.
> -     */
> -    return vdev->dma_as !=3D &address_space_memory &&
> -           virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> -}
> -
>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
>                                hwaddr *plen, bool is_write)
>  {
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9xgW0ACgkQbDjKyiDZ
s5IL8w//Uf1RV4h+wJcixaDGyaoK0AfEDKYa2x7bw/wJNF9cCGaLtZEdiUY7Ved1
b3dFtMUO5FVeGYY8GhbehGcVRGp7B3xGpxCmWoVF8dWEiDfs0+B2vlzlOP46K9md
lpc4oHkV+W8b4BXpYb34Vpib3i1b5AsBpvLkBYHm3JUnDtq1z3HDS5COkX04PC5b
y63ROF3KsqFpQsYcZ7aY4cAQT3r+CYSWiiVi5nxKWag/GOEeIPkRrviLzsxPbiJP
xU+64H+eYmrLqoP6unv2LELlIZUdWUlEOCdbBtcYSUPGRoYzGxEVf8TdCT+G1Wk/
UnDLkWp/MxydEGpTEcsho8UX0TE9M9k6gxwAtgQ/zp3boUzMxXY0IurmdbYMwTG/
OxizQmsX69fXYx/jfN5JuWZXf+oIDn5mF87j6cQXXNnL4KsnNDdqqdqJl+nmWoDk
Wewzjk8404u7VIn2WbE2yz9/4+HvqM9V20vvhVYFUukkSbLb8Re9Aqv3dz96SAZh
0h7p8l5vJKZ/XMsI6fhc471PQKc5Dqy1gGY54PTY1tpyBQfw3mJaaeNCrgOlVTMt
GQDy+C2vLyFinZSurzvF0TNNlqKjCGswsbEf5KLSr17o4QH1hwgBZnzuHNUqJmk8
nSCCFp7RrHHDgdU1TKcw6l4l5QvGVWt4NU1rSHfh/ZxzxVyB22k=
=Trzw
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--

