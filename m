Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1BB3F8354
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 09:47:45 +0200 (CEST)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJA6y-0005ht-F5
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 03:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mJA5P-0004JR-EJ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 03:46:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mJA5M-0001gQ-UI
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 03:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629963963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+y3pBIRmhhw3lhLpgCcb5cuQSPAOspEOJ6tI649ldcE=;
 b=JEwHM2Pgkt9OkBpPh4IVANz1vOmjQe7eylqHgdNZ2mzklS37UxAwnuWqzNICL2N4WKE3dD
 1t15fTAT9FkJ6r7ipFK4wAd9mDzZ4zIN2CuW74fS5o8lOAje2D9sgknVRgFb2sf9lqF2IV
 x8Ct6FnY9Uaq39O0QUGdwFqAVg915Do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-aMUUxO2YOqaT0bKpb-_hWQ-1; Thu, 26 Aug 2021 03:45:56 -0400
X-MC-Unique: aMUUxO2YOqaT0bKpb-_hWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2791AC73A0;
 Thu, 26 Aug 2021 07:45:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8E6860843;
 Thu, 26 Aug 2021 07:45:49 +0000 (UTC)
Date: Thu, 26 Aug 2021 08:45:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH] hw/virtio: Do not access vring cache if queue is not
 ready
Message-ID: <YSdGrBA9LxQeshfv@stefanha-x1.localdomain>
References: <20210825200953.1684541-1-philmd@redhat.com>
 <9ea6cdbd-4ad0-f10c-5229-a68e31fa90c2@redhat.com>
 <8cf6fe34-284b-7681-58a4-bccb8849f75f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8cf6fe34-284b-7681-58a4-bccb8849f75f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l46+u+YoUojc58kF"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Cheolwoo Myung <cwmyung@snu.ac.kr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--l46+u+YoUojc58kF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2021 at 12:50:34AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 8/25/21 10:36 PM, Philippe Mathieu-Daud=E9 wrote:
> > On 8/25/21 10:09 PM, Philippe Mathieu-Daud=E9 wrote:
> >> Do not intent to access the vring MemoryRegion cache if
> >> the queue is not ready (no vring available).
> >>
> >> This fixes issue #301:
> >>
> >>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:77: void add=
ress_space_stw_le_cached(MemoryRegionCache *, hwaddr, uint16_t, MemTxAttrs,=
 MemTxResult *):
> >>   Assertion `addr < cache->len && 2 <=3D cache->len - addr' failed.
> >>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
> >>   (gdb) bt
> >>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
> >>   #4  0x0000555558f2a122 in address_space_stw_le_cached (cache=3D0x613=
00010bb70, addr=3D516, val=3D0, attrs=3D..., result=3D0x0) at include/exec/=
memory_ldst_cached.h.inc:77
> >>   #5  0x0000555558f2964c in stw_le_phys_cached (cache=3D0x61300010bb70=
, addr=3D516, val=3D0) at include/exec/memory_ldst_phys.h.inc:109
> >>   #6  0x0000555558f28da8 in virtio_stw_phys_cached (vdev=3D0x62d00004e=
680, cache=3D0x61300010bb70, pa=3D516, value=3D0) at include/hw/virtio/virt=
io-access.h:196
> >>   #7  0x0000555558f287dc in vring_set_avail_event (vq=3D0x7fff5d23e800=
, val=3D0) at hw/virtio/virtio.c:428
> >>   #8  0x0000555558efabb7 in virtio_queue_split_set_notification (vq=3D=
0x7fff5d23e800, enable=3D1) at hw/virtio/virtio.c:437
> >>   #9  0x0000555558ef9f3c in virtio_queue_set_notification (vq=3D0x7fff=
5d23e800, enable=3D1) at hw/virtio/virtio.c:498
> >>   #10 0x0000555558c94786 in virtio_blk_handle_vq (s=3D0x62d00004e680, =
vq=3D0x7fff5d23e800) at hw/block/virtio-blk.c:795
> >>   #11 0x0000555558cb96c2 in virtio_blk_data_plane_handle_output (vdev=
=3D0x62d00004e680, vq=3D0x7fff5d23e800) at hw/block/dataplane/virtio-blk.c:=
165
> >>   #12 0x0000555558f35937 in virtio_queue_notify_aio_vq (vq=3D0x7fff5d2=
3e800) at hw/virtio/virtio.c:2323
> >>   #13 0x0000555558f264b3 in virtio_queue_host_notifier_aio_read (n=3D0=
x7fff5d23e87c) at hw/virtio/virtio.c:3532
> >>   #14 0x0000555559a9cd3e in aio_dispatch_handler (ctx=3D0x613000063000=
, node=3D0x60d000008f40) at util/aio-posix.c:329
> >>   #15 0x0000555559a963ae in aio_dispatch_handlers (ctx=3D0x61300006300=
0) at util/aio-posix.c:372
> >>   #16 0x0000555559a95f82 in aio_dispatch (ctx=3D0x613000063000) at uti=
l/aio-posix.c:382
> >>
> >> and  #302:
> >>
> >>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t=
 address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemT=
xResult *):
> >>   Assertion `addr < cache->len && 2 <=3D cache->len - addr' failed.
> >>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
> >>   0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
> >>   (gdb) bt
> >>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
> >>   #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=3D0x61=
300010a7c0, addr=3D134, attrs=3D..., result=3D0x0) at include/exec/memory_l=
dst_cached.h.inc:30
> >>   #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=3D0x61300010a7c=
0, addr=3D134) at include/exec/memory_ldst_phys.h.inc:67
> >>   #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=3D0x62d00003=
a680, cache=3D0x61300010a7c0, pa=3D134) at include/hw/virtio/virtio-access.=
h:166
> >>   #7  0x0000555558f300ea in vring_avail_ring (vq=3D0x7fffdd55d8a0, i=
=3D65) at hw/virtio/virtio.c:326
> >>   #8  0x0000555558f33b10 in vring_get_used_event (vq=3D0x7fffdd55d8a0)=
 at hw/virtio/virtio.c:332
> >>   #9  0x0000555558f33677 in virtio_split_should_notify (vdev=3D0x62d00=
003a680, vq=3D0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
> >>   #10 0x0000555558f1859f in virtio_should_notify (vdev=3D0x62d00003a68=
0, vq=3D0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
> >>   #11 0x0000555558f188cc in virtio_notify (vdev=3D0x62d00003a680, vq=
=3D0x7fffdd55d8a0) at hw/virtio/virtio.c:2565
> >>   #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=3D0x62d00003=
a680, vq=3D0x7fffdd55d8a0) at hw/input/virtio-input.c:100
> >>   #13 0x0000555558f16df7 in virtio_queue_notify (vdev=3D0x62d00003a680=
, n=3D1) at hw/virtio/virtio.c:2363
> >>   #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=3D0x62d000=
032400, addr=3D7, val=3D0, size=3D1) at hw/virtio/virtio-pci.c:1369
> >>   #15 0x0000555558b80b04 in memory_region_write_accessor (mr=3D0x62d00=
0033190, addr=3D7, value=3D0x7fffffff8eb0, size=3D1, shift=3D0, mask=3D255,=
 attrs=3D...) at softmmu/memory.c:492
> >>
> >> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> >> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/301
> >> BugLink: https://bugs.launchpad.net/qemu/+bug/1910941
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302
> >> BugLink: https://bugs.launchpad.net/qemu/+bug/1913510
> >> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >> ---
> >> Could be more readable to use virtio_queue_ready()
> >>
> >> RFC because I have no clue about this hot path code,
> >> I simply looked at the backtraces.
> >> ---
> >>  hw/virtio/virtio.c | 82 +++++++++++++++++++++++++++++++++++++--------=
-
> >>  1 file changed, 66 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> >> index 874377f37a7..be1ec9e05ef 100644
> >> --- a/hw/virtio/virtio.c
> >> +++ b/hw/virtio/virtio.c
> >> @@ -289,26 +289,38 @@ static VRingMemoryRegionCaches *vring_get_region=
_caches(struct VirtQueue *vq)
> >>  /* Called within rcu_read_lock().  */
> >>  static inline uint16_t vring_avail_flags(VirtQueue *vq)
> >>  {
> >> -    VRingMemoryRegionCaches *caches =3D vring_get_region_caches(vq);
> >> -    hwaddr pa =3D offsetof(VRingAvail, flags);
> >> +    VRingMemoryRegionCaches *caches;
> >> +    hwaddr pa;
> >> =20
> >> +    if (unlikely(!vq->vring.avail)) {
> >> +        return 0;
> >> +    }
> >> +
> >> +    caches =3D vring_get_region_caches(vq);
> >>      if (!caches) {
> >>          return 0;
> >>      }
> >> =20
> >> +    pa =3D offsetof(VRingAvail, flags);
> >>      return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
> >>  }
> >> =20
> >>  /* Called within rcu_read_lock().  */
> >>  static inline uint16_t vring_avail_idx(VirtQueue *vq)
> >>  {
> >> -    VRingMemoryRegionCaches *caches =3D vring_get_region_caches(vq);
> >> -    hwaddr pa =3D offsetof(VRingAvail, idx);
> >> +    VRingMemoryRegionCaches *caches;
> >> +    hwaddr pa;
> >> =20
> >> +    if (unlikely(!vq->vring.avail)) {
> >> +        return 0;
> >> +    }
> >> +
> >> +    caches =3D vring_get_region_caches(vq);
> >>      if (!caches) {
> >>          return 0;
> >>      }
> >> =20
> >> +    pa =3D offsetof(VRingAvail, idx);
> >>      vq->shadow_avail_idx =3D virtio_lduw_phys_cached(vq->vdev, &cache=
s->avail, pa);
> >>      return vq->shadow_avail_idx;
> >>  }
> >> @@ -316,13 +328,19 @@ static inline uint16_t vring_avail_idx(VirtQueue=
 *vq)
> >>  /* Called within rcu_read_lock().  */
> >>  static inline uint16_t vring_avail_ring(VirtQueue *vq, int i)
> >>  {
> >> -    VRingMemoryRegionCaches *caches =3D vring_get_region_caches(vq);
> >> -    hwaddr pa =3D offsetof(VRingAvail, ring[i]);
> >> +    VRingMemoryRegionCaches *caches;
> >> +    hwaddr pa;
> >> =20
> >> +    if (unlikely(!vq->vring.avail)) {
> >> +        return 0;
> >> +    }
> >> +
> >> +    caches =3D vring_get_region_caches(vq);
> >>      if (!caches) {
> >>          return 0;
> >>      }
> >> =20
> >> +    pa =3D offsetof(VRingAvail, ring[i]);
> >>      return virtio_lduw_phys_cached(vq->vdev, &caches->avail, pa);
> >>  }
> >=20
> > Self-NAck.
> >=20
> > While the previous part could be OK, what follows is crap (checking
> > avail instead of used) so please disregard this patch.
>=20
> Previous part is also crap :/

The topic reminds me of:

  commit abdd16f4681cc4d6bf84990227b5c9b98e869ccd
  Author: Stefan Hajnoczi <stefanha@redhat.com>
  Date:   Fri Feb 7 10:46:19 2020 +0000

      virtio: gracefully handle invalid region caches

Stefan

--l46+u+YoUojc58kF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEnRqwACgkQnKSrs4Gr
c8jgBQf/QvjgIUSBEVBtpx+QirmGOlGxfSJgRJrqh0cL6EYXeIwW6DLf4PLtV10Z
BxrdXUdXG3A9FMRTPwOvg4k2ADU5FxXheoLFQ/BcRAtj5sin6KF6LS/mULSeh54y
0w8dMeDD3HevkPmMdGWAuqugJalFCMG6EdHu+CkPa7Yjk84eOS3CqmqA2jrtSw/M
N0P4akNo7FFnyqDLXYHQ9UmI9RJkoDqVGKNoM0qphxEZ6WEt18lff8lOGC0382rM
rBRVgH1GRo8XqUls/kKA31U8tpiKHjtJWsAXs/uQOPzyt8XnjWZhBuh/06Z65SQj
Uo8eiUFld0p5jm8XPEgSJELT7eEsYg==
=fqVJ
-----END PGP SIGNATURE-----

--l46+u+YoUojc58kF--


