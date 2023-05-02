Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C26F44EC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 15:22:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptpvR-00073s-Qy; Tue, 02 May 2023 09:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ptpvL-00072U-Dy
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ptpvJ-0007ra-5l
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683033604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fGVklx9CdfvOhMG8evo/8EfQSW2qxZF5lAkrucGYcTQ=;
 b=DFgOewXercj1vY2d+0ZCYX7949eT5oeT8+EnrodtG+Ny8V0j1k3FcwhefEv618jfUJG0/+
 HFbm4CKzwXr09L5wRo4GdXKIqt6dnXo7lIWsUje3n4LrQm2gsnwDyw9KJVNE7lhSdnyGJm
 pR7C2ovabQeZyHiaaEG4uMwk6YlHGLI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-Y31MKCByMBe1jCFod_G6kw-1; Tue, 02 May 2023 09:19:59 -0400
X-MC-Unique: Y31MKCByMBe1jCFod_G6kw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 107073828886;
 Tue,  2 May 2023 13:19:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1880C15BAD;
 Tue,  2 May 2023 13:19:53 +0000 (UTC)
Date: Tue, 2 May 2023 15:19:52 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
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
Message-ID: <ZFEN+KY8JViTDtv/@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-5-stefanha@redhat.com>
 <ZEvWv8dF78Jpb6CQ@redhat.com> <20230501150934.GA14869@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YXC5ZjyIo1QEPFar"
Content-Disposition: inline
In-Reply-To: <20230501150934.GA14869@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--YXC5ZjyIo1QEPFar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 01.05.2023 um 17:09 hat Stefan Hajnoczi geschrieben:
> On Fri, Apr 28, 2023 at 04:22:55PM +0200, Kevin Wolf wrote:
> > Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > > This patch is part of an effort to remove the aio_disable_external()
> > > API because it does not fit in a multi-queue block layer world where
> > > many AioContexts may be submitting requests to the same disk.
> > >=20
> > > The SCSI emulation code is already in good shape to stop using
> > > aio_disable_external(). It was only used by commit 9c5aad84da1c
> > > ("virtio-scsi: fixed virtio_scsi_ctx_check failed when detaching scsi
> > > disk") to ensure that virtio_scsi_hotunplug() works while the guest
> > > driver is submitting I/O.
> > >=20
> > > Ensure virtio_scsi_hotunplug() is safe as follows:
> > >=20
> > > 1. qdev_simple_device_unplug_cb() -> qdev_unrealize() ->
> > >    device_set_realized() calls qatomic_set(&dev->realized, false) so
> > >    that future scsi_device_get() calls return NULL because they exclu=
de
> > >    SCSIDevices with realized=3Dfalse.
> > >=20
> > >    That means virtio-scsi will reject new I/O requests to this
> > >    SCSIDevice with VIRTIO_SCSI_S_BAD_TARGET even while
> > >    virtio_scsi_hotunplug() is still executing. We are protected again=
st
> > >    new requests!
> > >=20
> > > 2. Add a call to scsi_device_purge_requests() from scsi_unrealize() so
> > >    that in-flight requests are cancelled synchronously. This ensures
> > >    that no in-flight requests remain once qdev_simple_device_unplug_c=
b()
> > >    returns.
> > >=20
> > > Thanks to these two conditions we don't need aio_disable_external()
> > > anymore.
> > >=20
> > > Cc: Zhengui Li <lizhengui@huawei.com>
> > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > Reviewed-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> >=20
> > qemu-iotests 040 starts failing for me after this patch, with what looks
> > like a use-after-free error of some kind.
> >=20
> > (gdb) bt
> > #0  0x000055b6e3e1f31c in job_type (job=3D0xe3e3e3e3e3e3e3e3) at ../job=
=2Ec:238
> > #1  0x000055b6e3e1cee5 in is_block_job (job=3D0xe3e3e3e3e3e3e3e3) at ..=
/blockjob.c:41
> > #2  0x000055b6e3e1ce7d in block_job_next_locked (bjob=3D0x55b6e72b7570)=
 at ../blockjob.c:54
> > #3  0x000055b6e3df6370 in blockdev_mark_auto_del (blk=3D0x55b6e74af0a0)=
 at ../blockdev.c:157
> > #4  0x000055b6e393e23b in scsi_qdev_unrealize (qdev=3D0x55b6e7c04d40) a=
t ../hw/scsi/scsi-bus.c:303
> > #5  0x000055b6e3db0d0e in device_set_realized (obj=3D0x55b6e7c04d40, va=
lue=3Dfalse, errp=3D0x55b6e497c918 <error_abort>) at ../hw/core/qdev.c:599
> > #6  0x000055b6e3dba36e in property_set_bool (obj=3D0x55b6e7c04d40, v=3D=
0x55b6e7d7f290, name=3D0x55b6e41bd6d8 "realized", opaque=3D0x55b6e7246d20, =
errp=3D0x55b6e497c918 <error_abort>)
> >     at ../qom/object.c:2285
> > #7  0x000055b6e3db7e65 in object_property_set (obj=3D0x55b6e7c04d40, na=
me=3D0x55b6e41bd6d8 "realized", v=3D0x55b6e7d7f290, errp=3D0x55b6e497c918 <=
error_abort>) at ../qom/object.c:1420
> > #8  0x000055b6e3dbd84a in object_property_set_qobject (obj=3D0x55b6e7c0=
4d40, name=3D0x55b6e41bd6d8 "realized", value=3D0x55b6e74c1890, errp=3D0x55=
b6e497c918 <error_abort>)
> >     at ../qom/qom-qobject.c:28
> > #9  0x000055b6e3db8570 in object_property_set_bool (obj=3D0x55b6e7c04d4=
0, name=3D0x55b6e41bd6d8 "realized", value=3Dfalse, errp=3D0x55b6e497c918 <=
error_abort>) at ../qom/object.c:1489
> > #10 0x000055b6e3daf2b5 in qdev_unrealize (dev=3D0x55b6e7c04d40) at ../h=
w/core/qdev.c:306
> > #11 0x000055b6e3db509d in qdev_simple_device_unplug_cb (hotplug_dev=3D0=
x55b6e81c3630, dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../hw/core/q=
dev-hotplug.c:72
> > #12 0x000055b6e3c520f9 in virtio_scsi_hotunplug (hotplug_dev=3D0x55b6e8=
1c3630, dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../hw/scsi/virtio-s=
csi.c:1065
> > #13 0x000055b6e3db4dec in hotplug_handler_unplug (plug_handler=3D0x55b6=
e81c3630, plugged_dev=3D0x55b6e7c04d40, errp=3D0x7ffec5519200) at ../hw/cor=
e/hotplug.c:56
> > #14 0x000055b6e3a28f84 in qdev_unplug (dev=3D0x55b6e7c04d40, errp=3D0x7=
ffec55192e0) at ../softmmu/qdev-monitor.c:935
> > #15 0x000055b6e3a290fa in qmp_device_del (id=3D0x55b6e74c1760 "scsi0", =
errp=3D0x7ffec55192e0) at ../softmmu/qdev-monitor.c:955
> > #16 0x000055b6e3fb0a5f in qmp_marshal_device_del (args=3D0x7f61cc005eb0=
, ret=3D0x7f61d5a8ae38, errp=3D0x7f61d5a8ae40) at qapi/qapi-commands-qdev.c=
:114
> > #17 0x000055b6e3fd52e1 in do_qmp_dispatch_bh (opaque=3D0x7f61d5a8ae08) =
at ../qapi/qmp-dispatch.c:128
> > #18 0x000055b6e4007b9e in aio_bh_call (bh=3D0x55b6e7dea730) at ../util/=
async.c:155
> > #19 0x000055b6e4007d2e in aio_bh_poll (ctx=3D0x55b6e72447c0) at ../util=
/async.c:184
> > #20 0x000055b6e3fe3b45 in aio_dispatch (ctx=3D0x55b6e72447c0) at ../uti=
l/aio-posix.c:421
> > #21 0x000055b6e4009544 in aio_ctx_dispatch (source=3D0x55b6e72447c0, ca=
llback=3D0x0, user_data=3D0x0) at ../util/async.c:326
> > #22 0x00007f61ddc14c7f in g_main_dispatch (context=3D0x55b6e7244b20) at=
 ../glib/gmain.c:3454
> > #23 g_main_context_dispatch (context=3D0x55b6e7244b20) at ../glib/gmain=
=2Ec:4172
> > #24 0x000055b6e400a7e8 in glib_pollfds_poll () at ../util/main-loop.c:2=
90
> > #25 0x000055b6e400a0c2 in os_host_main_loop_wait (timeout=3D0) at ../ut=
il/main-loop.c:313
> > #26 0x000055b6e4009fa2 in main_loop_wait (nonblocking=3D0) at ../util/m=
ain-loop.c:592
> > #27 0x000055b6e3a3047b in qemu_main_loop () at ../softmmu/runstate.c:731
> > #28 0x000055b6e3dab27d in qemu_default_main () at ../softmmu/main.c:37
> > #29 0x000055b6e3dab2b8 in main (argc=3D24, argv=3D0x7ffec55196a8) at ..=
/softmmu/main.c:48
> > (gdb) p jobs
> > $4 =3D {lh_first =3D 0x0}
>=20
> I wasn't able to reproduce this with gcc 13.1.1 or clang 16.0.1:
>=20
>   $ tests/qemu-iotests/check -qcow2 040
>=20
> Any suggestions on how to reproduce the issue?

It happens consistently for me with the same command line, both with gcc
and clang.

gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-4)
clang version 15.0.7 (Fedora 15.0.7-2.fc37)

Maybe there is a semantic merge conflict? I have applied the series on
top of master (05d50ba2d4) and my block branch (88f81f7bc8).

Kevin

--YXC5ZjyIo1QEPFar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmRRDfgACgkQfwmycsiP
L9Y3GRAAvRZ6+kD/AtNTvIukd+aeUv2vJhX2aEdXyjX3LKPe/VI+W1xE+g5PTbKs
oJePLOmjUPGvu2SRyquYTMW10Ap0+syE+iiEM4O7KaAmrM3pEdfxOdo782IAVy+o
61Ro0DyE8Is1MzLXswSckkArZq5xuiV4PSKBEL/B+Th+GzSCc8+Z8btZhj4hjNN1
KMBQnSSSaGagMLENz0DLHTZADfSRGqASNCO3Gc4DhcK/RiJwD7ScWy6PkptZEsjx
1k6G7aIoa55X0qeqCsvcYUUNpAGzh2SGf+DaJ7IL36DPmQhuAvXffFFV98qrc1Yh
MN8kV9/ZEL6fFVXD5QUv7sPy+2Nw760s8dv6NXyorwxqtV56ljkYcn7idbO2+HZn
bmcgMQRBbVw8FdzXxDc1k53Bb0LhW0f/0A2iqn+GIwJXZq2IdEJ6sL+N43IN6L/L
IJ8b+jrNvuVGD56cyY024FiJVfFEtyeLhN4QSbWgjmsy3TWAw4jZ28ZfSbpVI7ST
d3H/j+LZkCQft65xjA09j/7mOd1qSPJjkykUY5uAiBssipogL6nj9aGJc0pkaxGB
s5otr6zCgghfprNe+qsA+X4H/So09BjbFC1R3AomFNtJapWzvc0zzyB08HIpPho8
7yr7sTZINUS0aFOr8IG6fPrFR9p8ZNHtVvEIBRKtQMi3uV1Ca+M=
=xmD/
-----END PGP SIGNATURE-----

--YXC5ZjyIo1QEPFar--


