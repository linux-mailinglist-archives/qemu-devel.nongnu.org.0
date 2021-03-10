Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8942333F8D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:47:12 +0100 (CET)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJzB9-0005Yi-QI
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJz9p-0004Y1-TL
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:45:49 -0500
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:56432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lJz9k-0008IK-TC
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:45:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.111])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id AFAC824BD79;
 Wed, 10 Mar 2021 14:45:32 +0100 (CET)
Received: from kaod.org (37.59.142.102) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 10 Mar
 2021 14:45:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004ded3ec91-fbe0-4491-84d1-a10979dce06f,
 E3A1B1521FC7554C2CCDA0AC48C2D83995993578) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 10 Mar 2021 14:45:25 +0100
From: Greg Kurz <groug@kaod.org>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH 2/4] vhost-user: Convert slave channel to QIOChannelSocket
Message-ID: <20210310144525.40935330@bahia.lan>
In-Reply-To: <YEiw/v3vhB7y6ve3@redhat.com>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-3-groug@kaod.org>
 <YEeRgY2WEFSw+1qG@stefanha-x1.localdomain>
 <20210309212322.3ab5809d@bahia.lan> <YEiw/v3vhB7y6ve3@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 7db98f0a-4cdc-44d4-b658-58dd63b03834
X-Ovh-Tracer-Id: 14806709678315510054
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqheftdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelueetheegheefteevveelvdfhueeuudegudegtedufeeutdekkeeugeejgfetvdenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepmhhsthesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=178.33.105.233; envelope-from=groug@kaod.org;
 helo=2.mo52.mail-out.ovh.net
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Mar 2021 11:43:58 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Mar 09, 2021 at 09:23:22PM +0100, Greg Kurz wrote:
> > On Tue, 9 Mar 2021 15:17:21 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > > On Mon, Mar 08, 2021 at 01:31:39PM +0100, Greg Kurz wrote:
> > > > +    g_autofree int *fd =3D NULL;
> > > > +    size_t fdsize =3D 0;
> > > > +    int i;
> > > > =20
> > > >      /* Read header */
> > > >      iov.iov_base =3D &hdr;
> > > >      iov.iov_len =3D VHOST_USER_HDR_SIZE;
> > > > =20
> > > >      do {
> > > > -        size =3D recvmsg(u->slave_fd, &msgh, 0);
> > > > -    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAI=
N));
> > > > +        size =3D qio_channel_readv_full(ioc, &iov, 1, &fd, &fdsize=
, NULL);
> > > > +    } while (size =3D=3D QIO_CHANNEL_ERR_BLOCK);
> > >=20
> > > Is it possible to leak file descriptors and fd[] memory if we receive=
 a
> > > short message and then loop around? qio_channel_readv_full() will
> > > overwrite &fd and that's how the leak occurs.
> > >=20
> >=20
> > qio_channel_readv_full() only returns QIO_CHANNEL_ERR_BLOCK when the
> > channel is non-blocking mode and no data is available. Under the hood,
> > this translates to this code in qio_channel_socket_readv():
> >=20
> >  retry:
> >     ret =3D recvmsg(sioc->fd, &msg, sflags);
> >     if (ret < 0) {
> >         if (errno =3D=3D EAGAIN) {
> >             return QIO_CHANNEL_ERR_BLOCK;
> >         }
> >         if (errno =3D=3D EINTR) {
> >             goto retry;
> >         }
> >=20
> >         error_setg_errno(errp, errno,
> >                          "Unable to read from socket");
> >         return -1;
> >     }
> >=20
> > This is strictly equivalent to what we currently have. This cannot
> > leak file descriptors because we would only loop until the first
> > byte of real data is available and ancillary data cannot fly without
> > real data, i.e. no file descriptors when recvmsg() returns EAGAIN.
>=20
> Yep, EAGAIN will only happen if you have no data AND no FDs.
>=20
> >=20
> > > On the other hand, it looks like ioc is in blocking mode. I'm not sure
> > > QIO_CHANNEL_ERR_BLOCK can occur?
> > >=20
> >=20
> > You're right but the existing code is ready to handle the non-blocking
> > case, so I just kept this behavior.
>=20
> The existing code is *not* handling the non-blocking case in any
> useful way IMHO. It will block execution of this QEMU thread, and
> sit in a tight loop burning CPU in the EAGAIN case.
>=20
> Handling non-blocking means using an I/O watch with the event loop
> to be notified when something becomes ready.
>=20

Hmm... slave_read() is a handler registered with qemu_set_fd_handler().
Isn't it already the case then ? Can the first call to recvmsg() even
return EAGAIN actually ?

> I notice the code that follows is also doing
>=20
>=20
>     if (size !=3D VHOST_USER_HDR_SIZE) {
>         error_report("Failed to read from slave.");
>         goto err;
>     }
>=20
> which is also dubious because it assumes the previous recvmsg is
> guaranteed to return VHOST_USER_HDR_SIZE bytes of data in a single
> call.
>=20

Yeah this is broken since recvmsg() doesn't guarantee full reads.

> It does at least look like the code is intentionally blocking
> execution fo the QEMU thread until the expected amount of I/O
> is receieved.
>=20
> Given this, you should remove the while loop entirely and
> just call
>=20
>    qio_channel_readv_full_all()
>=20
> this will block execution until *all* the requestd data bytes
> are read. It will re-try the recvmsg in the event of a partial
> data read, and will intelligently wait in poll() on EAGAIN.
>=20

Thanks for the suggestion !

> >=20
> > > > @@ -1500,8 +1479,8 @@ static void slave_read(void *opaque)
> > > > =20
> > > >      /* Read payload */
> > > >      do {
> > > > -        size =3D read(u->slave_fd, &payload, hdr.size);
> > > > -    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAI=
N));
> > > > +        size =3D qio_channel_read(ioc, (char *) &payload, hdr.size=
, NULL);
> > > > +    } while (size =3D=3D QIO_CHANNEL_ERR_BLOCK);
> > >=20
> > > Same question here.
> >=20
> > This also ends up in qio_channel_socket_readv().
>=20
>=20
>=20
> Regards,
> Daniel


