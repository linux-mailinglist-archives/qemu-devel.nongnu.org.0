Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC313E06F0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:49:28 +0200 (CEST)
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBL1D-000564-PT
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mBIv4-0006pI-KC
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:35:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mBIux-0004pw-0S
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628091287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=38b0bsdVaVYonen54oEaKknq8kDqRb5NZkTklLdqoc0=;
 b=WZN7eguFNyM5E75xyYsBP3+Eu1Ebg/0kBKY2J5Nqf5BcFqhEL8BF02vY9K9DGYC3lKdVxg
 fGWSv8h+yZSANBqFsFEWwId1q9WTYxaMgTorqyGCLCabJy8v5fPri02769DbR6e6fDlZRt
 6yySvPPzr6dNtVCb7Tx6pGezhpXe8yY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-8WL6ebT7M7OKe0W9iXeoOQ-1; Wed, 04 Aug 2021 11:34:43 -0400
X-MC-Unique: 8WL6ebT7M7OKe0W9iXeoOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89271871827;
 Wed,  4 Aug 2021 15:34:42 +0000 (UTC)
Received: from localhost (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99AB718432;
 Wed,  4 Aug 2021 15:34:38 +0000 (UTC)
Date: Wed, 4 Aug 2021 16:34:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] hw/char/virtio-serial-bus: fix: Unpop throttled
 VirtQueueElement to queue before discard vq data
Message-ID: <YQqzjSCapCPVxVlm@stefanha-x1.localdomain>
References: <2904D378-AA27-4510-A3C8-7E2E34DF37EF@kingsoft.com>
 <330EE4BB-DE8D-4D4A-9E6E-08E50BDA5E45@kingsoft.com>
 <918AA6D7-F6C6-4A0E-8E65-6C7ECF148304@kingsoft.com>
 <abe0d719-20e2-ebf3-c61a-c1778a461d5c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <abe0d719-20e2-ebf3-c61a-c1778a461d5c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DDpwzaW7kmc+ExhQ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: AIERPATIJIANG1 =?utf-8?B?W+iJvuWwlOW4leaPkOaxn8K36Zi/5biD6YO96LWb5Lmw?=
 =?utf-8?B?5o+QXQ==?= <AIERPATIJIANG1@kingsoft.com>,
 "amit@kernel.org" <amit@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DDpwzaW7kmc+ExhQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 02, 2021 at 05:01:14PM +0200, Laurent Vivier wrote:
> On 30/07/2021 03:58, AIERPATIJIANG1 [=E8=89=BE=E5=B0=94=E5=B8=95=E6=8F=90=
=E6=B1=9F=C2=B7=E9=98=BF=E5=B8=83=E9=83=BD=E8=B5=9B=E4=B9=B0=E6=8F=90] wrot=
e:
> > Ports enter a "throttled" state when writing to the chardev would block=
.
> > The current output VirtQueueElement is kept around until the chardev
> > becomes writable again.
> >=20
> > Because closing the virtio serial device does not reset the queue, we c=
annot
> > directly discard this element,  otherwise the control variables of the =
front
> > and back ends of the queue are inconsistent such as used_index. We shou=
ld unpop the
> > VirtQueueElement to queue, let discard_vq_data process it.
> >=20
> > The test environment:
> > kernel: linux-5.12
> > Qemu command:
> > Qemu-system-x86 -machine pc,accel=3Dkvm \
> >     -cpu host,host-phys-bits \
> >     -smp 4 \
> >     -m 4G \
> >     -kernel ./kernel \
> >     -display none \
> >     -nodefaults \
> >     -serial mon:stdio \
> >     -append "panic=3D1 no_timer_check noreplace-smp rootflags=3Ddata=3D=
ordered rootfstype=3Dext4 console=3DttyS0 reboot=3Dk root=3D/dev/vda1 rw" \
> >     -drive id=3Dos,file=3D./disk,if=3Dnone \
> >     -device virtio-blk-pci,drive=3Dos \
> >     -device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.0,addr=3D0x=
4 \
> >     -chardev socket,id=3Dcharchannel0,path=3D/tmp/char-dev-test,server,=
nowait \
> >   -device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharch=
annel0,id=3Dchannel0,name=3Dorg.qemu.guest_agent.0
> >=20
> > full up virtio queue after VM started:
> > Cat /large-file > /dev/vport1p1
> >=20
> > Host side:
> > Open and close character device sockets repeatedly
> >=20
> > After awhile we can=E2=80=99t write any request to /dev/vport1p1 at VM =
side, VM kernel soft lockup at drivers/char/virtio_console.c: __send_to_por=
t
> >=20
> >=20
> > Signed-off-by: Arafatms <aierpatijiang1@kingsoft.com>
> >=20
> > diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
> > index dd6bc27b3b..36236defdf 100644
> > --- a/hw/char/virtio-serial-bus.c
> > +++ b/hw/char/virtio-serial-bus.c
> > @@ -150,8 +150,12 @@ static void discard_vq_data(VirtQueue *vq, VirtIOD=
evice *vdev)
> >=20
> > static void discard_throttle_data(VirtIOSerialPort *port)
> > {
> > +    if (!virtio_queue_ready(port->ovq)) {
> > +        return;
> > +    }
>=20
> Why do we need to check virtio_queue_ready() now?

I'm not sure why this is necessary either. We don't need the vring to be
functional, we're just trying to clean up our internal state.

> > +
> >      if (port->elem) {
> > -        virtqueue_detach_element(port->ovq, port->elem, 0);
> > +        virtqueue_unpop(port->ovq, port->elem, 0);
> >          g_free(port->elem);
> >          port->elem =3D NULL;
> >      }
> >=20
>=20
> It seems the problem you report can only happen when the port is closed f=
rom the host side
> (because from the guest side I guess the cleanup is done by the guest dri=
ver).
>=20
> Stefan, you have introduced the function discard_throttle_data() in:
>=20
>   d4c19cdeeb2f ("virtio-serial: add missing virtio_detach_element() call"=
)
>=20
> do you remember why you prefered to use virtqueue_detach_element() rather=
 than
> virtqueue_unpop() (or virtqueue_discard() at this time, see 27e57efe32f5 =
("virtio: rename
> virtqueue_discard to virtqueue_unpop"))

I don't remember. virtqueue_unpop() cannot handle out-of-order element
processing, but it seems safe to use here since port->elem is the last
element we pop off ovq.

It's probably just a bug in my commit d4c19cdeeb2f. I may have thought
the virtqueue is never touched again after reset (true), close (false),
and remove port (false?).

Please add:

  Fixes: d4c19cdeeb2f ("virtio-serial: add missing virtio_detach_element() =
call")

Stefan

--DDpwzaW7kmc+ExhQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEKs40ACgkQnKSrs4Gr
c8iekwf/b07V5MRcvAMWKZyoFyNm0o0it4ye00tN868/mds/MqZeICQ3add1y21/
onwii9lFD1X5/zlEZ2jcxGK7nht5e0oNaxpPqYi6wRXKJdEnoVcNnJuATvSScIa4
rdFWgQWQKRv9Xkx8d+LBatVNntewTnE0eHNogi5y58pSrToxhsGNCj67F3DLQWQ6
3GgPSp9FhKstzLqHf8PJhf2g4cMQP85NPaXKkq8qTpXZvQVDzyIjUseZ6krHCQL8
KVaJmK44TBocIbzFo0iTCfReyxCkqUKxQ57GXNYNhuA1vcZ7/rFshGyvgF9zhx0N
Kr8GqFXu1EmG+YMRPk/kYZguN8IOjg==
=wD4/
-----END PGP SIGNATURE-----

--DDpwzaW7kmc+ExhQ--


