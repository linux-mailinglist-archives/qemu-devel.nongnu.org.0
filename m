Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C066F4AD4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:03:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptwDC-0004Zi-KH; Tue, 02 May 2023 16:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptwD8-0004ZP-6b
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:02:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptwD6-0007V6-04
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683057771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7lfhqttiODmbNxuxzmQIGPLL6DVlwheJNNJYYd5PHZI=;
 b=EOLMSaKUWpd8bV54Im6gwlyZWL/pbbEqJO16MQFDHumYdbWvueNwt5zYhnSXf75bKwu3u1
 plUHszGbosIZN5t7uy/ZIdLT4B9tFrU8haquqFOr+5ZIuv+W3efwbnp+/rnKt6kzdGMOtf
 oGV9nVzeY8Mw0na5B9eMS3Fv14WT25I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-8i9sxkcoOrucqmHkxzDdSA-1; Tue, 02 May 2023 16:02:47 -0400
X-MC-Unique: 8i9sxkcoOrucqmHkxzDdSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C708A101A531;
 Tue,  2 May 2023 20:02:46 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B65FF63F5B;
 Tue,  2 May 2023 20:02:45 +0000 (UTC)
Date: Tue, 2 May 2023 16:02:43 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
 eesposit@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Zhengui Li <lizhengui@huawei.com>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>
Subject: Re: [PATCH v4 04/20] virtio-scsi: stop using aio_disable_external()
 during unplug
Message-ID: <20230502200243.GD535070@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-5-stefanha@redhat.com>
 <ZEvWv8dF78Jpb6CQ@redhat.com> <20230501150934.GA14869@fedora>
 <ZFEN+KY8JViTDtv/@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KLJLJshWTSqDDVpb"
Content-Disposition: inline
In-Reply-To: <ZFEN+KY8JViTDtv/@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--KLJLJshWTSqDDVpb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 03:19:52PM +0200, Kevin Wolf wrote:
> Am 01.05.2023 um 17:09 hat Stefan Hajnoczi geschrieben:
> > On Fri, Apr 28, 2023 at 04:22:55PM +0200, Kevin Wolf wrote:
> > > Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > > > This patch is part of an effort to remove the aio_disable_external()
> > > > API because it does not fit in a multi-queue block layer world where
> > > > many AioContexts may be submitting requests to the same disk.
> > > >=20
> > > > The SCSI emulation code is already in good shape to stop using
> > > > aio_disable_external(). It was only used by commit 9c5aad84da1c
> > > > ("virtio-scsi: fixed virtio_scsi_ctx_check failed when detaching sc=
si
> > > > disk") to ensure that virtio_scsi_hotunplug() works while the guest
> > > > driver is submitting I/O.
> > > >=20
> > > > Ensure virtio_scsi_hotunplug() is safe as follows:
> > > >=20
> > > > 1. qdev_simple_device_unplug_cb() -> qdev_unrealize() ->
> > > >    device_set_realized() calls qatomic_set(&dev->realized, false) so
> > > >    that future scsi_device_get() calls return NULL because they exc=
lude
> > > >    SCSIDevices with realized=3Dfalse.
> > > >=20
> > > >    That means virtio-scsi will reject new I/O requests to this
> > > >    SCSIDevice with VIRTIO_SCSI_S_BAD_TARGET even while
> > > >    virtio_scsi_hotunplug() is still executing. We are protected aga=
inst
> > > >    new requests!
> > > >=20
> > > > 2. Add a call to scsi_device_purge_requests() from scsi_unrealize()=
 so
> > > >    that in-flight requests are cancelled synchronously. This ensures
> > > >    that no in-flight requests remain once qdev_simple_device_unplug=
_cb()
> > > >    returns.
> > > >=20
> > > > Thanks to these two conditions we don't need aio_disable_external()
> > > > anymore.
> > > >=20
> > > > Cc: Zhengui Li <lizhengui@huawei.com>
> > > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > >=20
> > > qemu-iotests 040 starts failing for me after this patch, with what lo=
oks
> > > like a use-after-free error of some kind.
> > >=20
> > > (gdb) bt
> > > #0  0x000055b6e3e1f31c in job_type (job=3D0xe3e3e3e3e3e3e3e3) at ../j=
ob.c:238
> > > #1  0x000055b6e3e1cee5 in is_block_job (job=3D0xe3e3e3e3e3e3e3e3) at =
=2E./blockjob.c:41
> > > #2  0x000055b6e3e1ce7d in block_job_next_locked (bjob=3D0x55b6e72b757=
0) at ../blockjob.c:54
> > > #3  0x000055b6e3df6370 in blockdev_mark_auto_del (blk=3D0x55b6e74af0a=
0) at ../blockdev.c:157
> > > #4  0x000055b6e393e23b in scsi_qdev_unrealize (qdev=3D0x55b6e7c04d40)=
 at ../hw/scsi/scsi-bus.c:303
> > > #5  0x000055b6e3db0d0e in device_set_realized (obj=3D0x55b6e7c04d40, =
value=3Dfalse, errp=3D0x55b6e497c918 <error_abort>) at ../hw/core/qdev.c:599
> > > #6  0x000055b6e3dba36e in property_set_bool (obj=3D0x55b6e7c04d40, v=
=3D0x55b6e7d7f290, name=3D0x55b6e41bd6d8 "realized", opaque=3D0x55b6e7246d2=
0, errp=3D0x55b6e497c918 <error_abort>)
> > >     at ../qom/object.c:2285
> > > #7  0x000055b6e3db7e65 in object_property_set (obj=3D0x55b6e7c04d40, =
name=3D0x55b6e41bd6d8 "realized", v=3D0x55b6e7d7f290, errp=3D0x55b6e497c918=
 <error_abort>) at ../qom/object.c:1420
> > > #8  0x000055b6e3dbd84a in object_property_set_qobject (obj=3D0x55b6e7=
c04d40, name=3D0x55b6e41bd6d8 "realized", value=3D0x55b6e74c1890, errp=3D0x=
55b6e497c918 <error_abort>)
> > >     at ../qom/qom-qobject.c:28
> > > #9  0x000055b6e3db8570 in object_property_set_bool (obj=3D0x55b6e7c04=
d40, name=3D0x55b6e41bd6d8 "realized", value=3Dfalse, errp=3D0x55b6e497c918=
 <error_abort>) at ../qom/object.c:1489
> > > #10 0x000055b6e3daf2b5 in qdev_unrealize (dev=3D0x55b6e7c04d40) at ..=
/hw/core/qdev.c:306
> > > #11 0x000055b6e3db509d in qdev_simple_device_unplug_cb (hotplug_dev=
=3D0x55b6e81c3630, dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../hw/co=
re/qdev-hotplug.c:72
> > > #12 0x000055b6e3c520f9 in virtio_scsi_hotunplug (hotplug_dev=3D0x55b6=
e81c3630, dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../hw/scsi/virtio=
-scsi.c:1065
> > > #13 0x000055b6e3db4dec in hotplug_handler_unplug (plug_handler=3D0x55=
b6e81c3630, plugged_dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../hw/c=
ore/hotplug.c:56
> > > #14 0x000055b6e3a28f84 in qdev_unplug (dev=3D0x55b6e7c04d40, errp=3D0=
x7ffec55192e0) at ../softmmu/qdev-monitor.c:935
> > > #15 0x000055b6e3a290fa in qmp_device_del (id=3D0x55b6e74c1760 "scsi0"=
, errp=3D0x7ffec55192e0) at ../softmmu/qdev-monitor.c:955
> > > #16 0x000055b6e3fb0a5f in qmp_marshal_device_del (args=3D0x7f61cc005e=
b0, ret=3D0x7f61d5a8ae38, errp=3D0x7f61d5a8ae40) at qapi/qapi-commands-qdev=
=2Ec:114
> > > #17 0x000055b6e3fd52e1 in do_qmp_dispatch_bh (opaque=3D0x7f61d5a8ae08=
) at ../qapi/qmp-dispatch.c:128
> > > #18 0x000055b6e4007b9e in aio_bh_call (bh=3D0x55b6e7dea730) at ../uti=
l/async.c:155
> > > #19 0x000055b6e4007d2e in aio_bh_poll (ctx=3D0x55b6e72447c0) at ../ut=
il/async.c:184
> > > #20 0x000055b6e3fe3b45 in aio_dispatch (ctx=3D0x55b6e72447c0) at ../u=
til/aio-posix.c:421
> > > #21 0x000055b6e4009544 in aio_ctx_dispatch (source=3D0x55b6e72447c0, =
callback=3D0x0, user_data=3D0x0) at ../util/async.c:326
> > > #22 0x00007f61ddc14c7f in g_main_dispatch (context=3D0x55b6e7244b20) =
at ../glib/gmain.c:3454
> > > #23 g_main_context_dispatch (context=3D0x55b6e7244b20) at ../glib/gma=
in.c:4172
> > > #24 0x000055b6e400a7e8 in glib_pollfds_poll () at ../util/main-loop.c=
:290
> > > #25 0x000055b6e400a0c2 in os_host_main_loop_wait (timeout=3D0) at ../=
util/main-loop.c:313
> > > #26 0x000055b6e4009fa2 in main_loop_wait (nonblocking=3D0) at ../util=
/main-loop.c:592
> > > #27 0x000055b6e3a3047b in qemu_main_loop () at ../softmmu/runstate.c:=
731
> > > #28 0x000055b6e3dab27d in qemu_default_main () at ../softmmu/main.c:37
> > > #29 0x000055b6e3dab2b8 in main (argc=3D24, argv=3D0x7ffec55196a8) at =
=2E./softmmu/main.c:48
> > > (gdb) p jobs
> > > $4 =3D {lh_first =3D 0x0}
> >=20
> > I wasn't able to reproduce this with gcc 13.1.1 or clang 16.0.1:
> >=20
> >   $ tests/qemu-iotests/check -qcow2 040
> >=20
> > Any suggestions on how to reproduce the issue?
>=20
> It happens consistently for me with the same command line, both with gcc
> and clang.
>=20
> gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-4)
> clang version 15.0.7 (Fedora 15.0.7-2.fc37)
>=20
> Maybe there is a semantic merge conflict? I have applied the series on
> top of master (05d50ba2d4) and my block branch (88f81f7bc8).

I can't find 88f81f7bc8 but rebased on repo.or.cz/qemu/kevin.git block
(4514dac7f2e9) and the test passes here.

I rebased on qemu.git/master (05d50ba2d4) and it also passes.

Please let me know if the following tree (a0ff680a72f6) works on your
machine:
https://gitlab.com/stefanha/qemu/-/tree/remove-aio_disable_external

Thanks,
Stefan

--KLJLJshWTSqDDVpb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRRbGMACgkQnKSrs4Gr
c8iL5Af+MRYfwim9BEWCQ+OFF9rPydT4E+bBnTgMftUJz8XcaxXz5sDzpq3sXhvM
UXDSMHg1/RY38aMEGGT1kPtlxI3zUO3pwNckFeU3rpqa22dI1yxMwI92Rn29LLIk
8txmNTd4eG89Vgvvl3zrqV/budvInTRmy7ZtMgMnNJ+SGAMxWWtakCZlBQzw7WBh
946sfiub2lvQKnvBgQJJLCOfVs3drSqV9+4IdzkpGwjN5fruVe3WhKC98Ha88ACF
L4cpa9MvlMyJvrxmPdB2uL8Eyn1mV3uLVi8Z0nRwiy4/mtahrGMZ3jkEJNi3Zn12
qpT/iMyl9DjsAj5nh2ElduicM7QFgw==
=9x4Q
-----END PGP SIGNATURE-----

--KLJLJshWTSqDDVpb--


