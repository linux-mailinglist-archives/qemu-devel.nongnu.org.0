Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3773FEFE0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:10:17 +0200 (CEST)
Received: from localhost ([::1]:38572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLoM4-0000ZX-JR
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLoKM-0007m8-3D
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mLoKK-0002oh-1X
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 11:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630595306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WRwrw1EGldqtZ74VFQMnq3iBfJtSEKHMJEiDpfBthgo=;
 b=X36VcU9LpkuH6clZkj1dzhsl02v2ejh00uq0GqDE9lREvnrEBnsDaUbYNm8Oko+/qbh+9U
 ohirFgEkM30wjlPtPHOsgCK9UkYn+w25DNks/snGAqcGKupPyS1QlbNxpXhijap8eW/VuS
 Apetm06sxGo/cXATRzdV3sseStDfTic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-6a26dvelP9C_VlXG8udydw-1; Thu, 02 Sep 2021 11:08:25 -0400
X-MC-Unique: 6a26dvelP9C_VlXG8udydw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75092DF8A3
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 15:08:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 550C317A98;
 Thu,  2 Sep 2021 15:08:20 +0000 (UTC)
Date: Thu, 2 Sep 2021 16:08:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH 3/3] hw/virtio: Have virtqueue_get_avail_bytes() pass
 caches arg to callees
Message-ID: <YTDo42fZ9gjGoMLT@stefanha-x1.localdomain>
References: <20210826172658.2116840-1-philmd@redhat.com>
 <20210826172658.2116840-4-philmd@redhat.com>
 <20210901155538.vbtxakrtbjwon3pt@steredhat>
 <YTC/savtIjlbzFsO@stefanha-x1.localdomain>
 <20210902130954.sdzkzfyeflc6sc4s@steredhat>
MIME-Version: 1.0
In-Reply-To: <20210902130954.sdzkzfyeflc6sc4s@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mKBTNy0hubPC6LuJ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--mKBTNy0hubPC6LuJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 03:09:54PM +0200, Stefano Garzarella wrote:
> On Thu, Sep 02, 2021 at 01:12:33PM +0100, Stefan Hajnoczi wrote:
> > On Wed, Sep 01, 2021 at 05:55:38PM +0200, Stefano Garzarella wrote:
> > > On Thu, Aug 26, 2021 at 07:26:58PM +0200, Philippe Mathieu-Daud=E9 wr=
ote:
> > > > Both virtqueue_packed_get_avail_bytes() and
> > > > virtqueue_split_get_avail_bytes() access the region cache, but
> > > > their caller also does. Simplify by having virtqueue_get_avail_byte=
s
> > > > calling both with RCU lock held, and passing the caches as argument=
.
> > > >
> > > > Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > > > ---
> > > > RFC because I'm not sure this is safe enough
> > >=20
> > > It seems safe to me.
> > >=20
> > > While reviewing I saw that vring_get_region_caches() has
> > > /* Called within rcu_read_lock().  */ comment, but it seems to me
> > > that we
> > > call that function in places where we haven't acquired it, which shou=
ldn't
> > > be a problem, but should we remove that comment?
> >=20
> > Do you have specific examples? That sounds worrying because the caller
> > can't do much with the returned pointer if it was fetched outside the
> > RCU read lock.
> >=20
>=20
> One was the virtqueue_get_avail_bytes(), but Phil is fixing it in this
> patch.
>=20
> Should we fix it in a separate patch to backport to stable branches?
>=20
> Other suspicious places seem to be these:
> - virtqueue_packed_fill_desc()

This seems to be safe in practice: only
hw/net/virtio-net.c:virtio_net_receive_rcu() calls it via
virtqueue_flush(). virtqueue_flush() needs a doc comment indicating that
it must be called under the RCU read lock though.

> - virtqueue_packed_drop_all()

This looks broken.

Stefan

--mKBTNy0hubPC6LuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEw6OMACgkQnKSrs4Gr
c8jFvAgAr8oEP6UD8/0/DulxzynSV+MBl54zxtYNWGcRVwRYsrJWE2LWviWR33bI
yBVAVsakBjRSJouiVnxFNfSaWONdAJ0PfjDl/DtgmYR8aFwHuVZIQLEHITfx47Qh
V3/m5Peu45Jtv1TwuYNmbxZxOiR93UL0VTyIG5/+BROg6PHrEYidVgnFNDPgLFRT
+fMq7Mvzc4hVfC6XBOz7zYk0OIfVyERmeVH6wKk4lwUSlrBh78vMu0AbXH9Iv3JJ
XgbZj6sRKhzKV/EIuGcWJK8QwVwaUEg7Wygj9tWeuhlZiRtm3NVQuPxGKflwZ/Rq
jE4dlCGAytG+640DxilnEKQzHj4zAA==
=f4+A
-----END PGP SIGNATURE-----

--mKBTNy0hubPC6LuJ--


