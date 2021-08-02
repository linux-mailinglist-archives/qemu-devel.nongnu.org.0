Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3F53DD381
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 12:02:22 +0200 (CEST)
Received: from localhost ([::1]:32796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAUm5-0000sy-0w
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 06:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mAUkE-000814-5R
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:00:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mAUk8-0007Mi-GX
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627898418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=biMvM93BXBwmOJPro1lMOCzu8PQXmHffmvb9lTUWagQ=;
 b=C0ZjsI850uwxhfVNZTi8xv9OzEMTGzJVmDuwoBmR1Cu9rjcPIUmHpxfH5XIbwHdhgab0BH
 PS5AUhk55DRukYCitZ6uOYjTZoJuoxnFua+ca5vQf6kMQ/odgPWG5ZMxIIVAqjF2xTn0sF
 PtK0dj+qyt56E4vKDcM/PPGAlk4zVNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-CAzB7_P0Piy6pTJm0zNFMw-1; Mon, 02 Aug 2021 06:00:16 -0400
X-MC-Unique: CAzB7_P0Piy6pTJm0zNFMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3076107ACF5;
 Mon,  2 Aug 2021 10:00:14 +0000 (UTC)
Received: from localhost (unknown [10.39.194.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81223226E8;
 Mon,  2 Aug 2021 10:00:10 +0000 (UTC)
Date: Mon, 2 Aug 2021 11:00:09 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: lvivier@redhat.com
Subject: Re: [PATCH] hw/char/virtio-serial-bus: fix: Unpop throttled
 VirtQueueElement to queue before discard vq data
Message-ID: <YQfCKVCuMADQG6k1@stefanha-x1.localdomain>
References: <2904D378-AA27-4510-A3C8-7E2E34DF37EF@kingsoft.com>
 <330EE4BB-DE8D-4D4A-9E6E-08E50BDA5E45@kingsoft.com>
 <918AA6D7-F6C6-4A0E-8E65-6C7ECF148304@kingsoft.com>
MIME-Version: 1.0
In-Reply-To: <918AA6D7-F6C6-4A0E-8E65-6C7ECF148304@kingsoft.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4ZShekuSjji9PVLv"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: AIERPATIJIANG1@kingsoft.com, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "amit@kernel.org" <amit@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--4ZShekuSjji9PVLv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 30, 2021 at 01:58:41AM +0000, AIERPATIJIANG1 [=E8=89=BE=E5=B0=
=94=E5=B8=95=E6=8F=90=E6=B1=9F=C2=B7=E9=98=BF=E5=B8=83=E9=83=BD=E8=B5=9B=E4=
=B9=B0=E6=8F=90] wrote:
> Ports enter a "throttled" state when writing to the chardev would block.
> The current output VirtQueueElement is kept around until the chardev
> becomes writable again.
>=20
> Because closing the virtio serial device does not reset the queue, we can=
not
> directly discard this element,  otherwise the control variables of the fr=
ont
> and back ends of the queue are inconsistent such as used_index. We should=
 unpop the
> VirtQueueElement to queue, let discard_vq_data process it.

Laurent: Ping

>=20
> The test environment:
> kernel: linux-5.12
> Qemu command:
> Qemu-system-x86 -machine pc,accel=3Dkvm \
>     -cpu host,host-phys-bits \
>     -smp 4 \
>     -m 4G \
>     -kernel ./kernel \
>     -display none \
>     -nodefaults \
>     -serial mon:stdio \
>     -append "panic=3D1 no_timer_check noreplace-smp rootflags=3Ddata=3Dor=
dered rootfstype=3Dext4 console=3DttyS0 reboot=3Dk root=3D/dev/vda1 rw" \
>     -drive id=3Dos,file=3D./disk,if=3Dnone \
>     -device virtio-blk-pci,drive=3Dos \
>     -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,addr=3D0x4 =
\
>     -chardev socket,id=3Dcharchannel0,path=3D/tmp/char-dev-test,server,no=
wait \
>   -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchan=
nel0,id=3Dchannel0,name=3Dorg.qemu.guest_agent.0
>=20
> full up virtio queue after VM started:
> Cat /large-file > /dev/vport1p1
>=20
> Host side:
> Open and close character device sockets repeatedly
>=20
> After awhile we can=E2=80=99t write any request to /dev/vport1p1 at VM si=
de, VM kernel soft lockup at drivers/char/virtio_console.c: __send_to_port
>=20
>=20
> Signed-off-by: Arafatms <aierpatijiang1@kingsoft.com>
>=20
> diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> index dd6bc27b3b..36236defdf 100644
> --- a/hw/char/virtio-serial-bus.c
> +++ b/hw/char/virtio-serial-bus.c
> @@ -150,8 +150,12 @@ static void discard_vq_data(VirtQueue *vq, VirtIODev=
ice *vdev)
>=20
> static void discard_throttle_data(VirtIOSerialPort *port)
> {
> +    if (!virtio_queue_ready(port->ovq)) {
> +        return;
> +    }
> +
>      if (port->elem) {
> -        virtqueue_detach_element(port->ovq, port->elem, 0);
> +        virtqueue_unpop(port->ovq, port->elem, 0);
>          g_free(port->elem);
>          port->elem =3D NULL;
>      }
>=20
>=20
>=20

--4ZShekuSjji9PVLv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEHwikACgkQnKSrs4Gr
c8hrmAf/T6GA1NjgdTXWgChymO4VBXDcRuL4QxNtfLXSXNLaCeeNzizFOJAYAMWy
X2u0/YSCIJRE4pe/6UCfV58WiMm0Qd1C1xHx6HGNs4vvnAKRRcsWZHjmXI7n1qGl
bIDQFLYMKYkpheLAIpe3OdUrze/jcBFa8dtR97Bj55KiWT0JI7WDyEQAIkZjwdpS
3z5I/zDHvrxBp7diFtSOmwvO09z6TgqEuJbqnt78+JqOec0n3HK7LJjbq+Rv/Pyc
iR/p3ZuwjtrPci91uLBsSx1xkMFEQwUXNnzSGj90KtiDumDZerfQFgVPIAhLSC9J
ppB9VbhwVJSgDLdnUQeuGgonbiIFGQ==
=M+qm
-----END PGP SIGNATURE-----

--4ZShekuSjji9PVLv--


