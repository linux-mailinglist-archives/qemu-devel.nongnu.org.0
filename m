Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EF33755F0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 16:50:40 +0200 (CEST)
Received: from localhost ([::1]:35678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefKp-0006vb-CF
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 10:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefIG-0004zl-Mm
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:48:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefID-00086b-5l
 for qemu-devel@nongnu.org; Thu, 06 May 2021 10:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620312476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DAAAhqHp6EmAwbmCy8WbYsEfie2d/LRd4SnbYGYWy8E=;
 b=ZdXgr7rs1E4bKBinS3OmCx7zycxw5TiF5X42kp9dY3dxRwLwerjkBvcmDVYBLQ6PrvTV3w
 rMrM6yQgEhXLIwrgWCCSVpeSf0yh80ViWzNxIu2q3yAuiSrrZ5JnF6HHXP5w/L0wQsdJld
 9AMKF6AH4JWVA5u0O3a8Ad3GjhMuq8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-DZ0vEP29NVqYOxApg85_qQ-1; Thu, 06 May 2021 10:47:52 -0400
X-MC-Unique: DZ0vEP29NVqYOxApg85_qQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85FD51008077;
 Thu,  6 May 2021 14:47:51 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 232CC5C277;
 Thu,  6 May 2021 14:47:20 +0000 (UTC)
Date: Thu, 6 May 2021 15:47:19 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 06/23] hw/block/dataplane/virtio-blk: Avoid dynamic stack
 allocation
Message-ID: <YJQBd+lnvQnbK0XH@stefanha-x1.localdomain>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-7-philmd@redhat.com>
 <YJOuesiuqgQugO+Q@stefanha-x1.localdomain>
 <124ddeb2-ca4a-c551-19ad-d1125451226f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <124ddeb2-ca4a-c551-19ad-d1125451226f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Vc4NIKc8AIDTKkid"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Vc4NIKc8AIDTKkid
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 11:01:47AM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 5/6/21 10:53 AM, Stefan Hajnoczi wrote:
> > On Wed, May 05, 2021 at 11:10:30PM +0200, Philippe Mathieu-Daud=E9 wrot=
e:
> >> Use autofree heap allocation instead of variable-length
> >> array on the stack.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> >> ---
> >>  hw/block/dataplane/virtio-blk.c | 7 ++++---
> >>  1 file changed, 4 insertions(+), 3 deletions(-)
> >=20
> > Why?
>=20
> The motivation behind removing all variable-length allocations
> (and adding CPPFLAG+=3D-Wvla at the end) is to avoid security
> vulnerabilities such CVE-2021-3527.

I see. Please mention it in the commit description. There could be other
reasons for this change, like minimizing stack usage, so I wasn't sure
why.

> > This is a performance-critical code path and BITS_TO_LONGS(nvqs) is
> > small.
>=20
> OK, having looked better at nvqs, I suppose this is preferred:
>=20
> -- >8 --
> @@ -60,7 +60,7 @@ static void notify_guest_bh(void *opaque)
>  {
>      VirtIOBlockDataPlane *s =3D opaque;
>      unsigned nvqs =3D s->conf->num_queues;
> -    unsigned long bitmap[BITS_TO_LONGS(nvqs)];
> +    unsigned long bitmap[BITS_TO_LONGS(VIRTIO_QUEUE_MAX)];
>      unsigned j;
>=20
>      memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
> ---
>=20
> Would that work for you?

It's a little risky since s->batch_notify_vqs does not have
sizeof(bitmap). That makes uninitialized data and buffer overflows more
likely. Your example has the bug:

  memcpy(bitmap, s->batch_notify_vqs, sizeof(bitmap));
                                      ^^^^^^^^^^^^^^
  Accesses beyond the end of s->batch_notify_vqs[].

Can we eliminate bitmap[] entirely by using bitops.h APIs on
s->batch_notify_vqs instead?

Stefan

--Vc4NIKc8AIDTKkid
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCUAXcACgkQnKSrs4Gr
c8hCEwgAlT6OptGs4DHn9OifMcVdmQ0voS52qjVnDloG3VgJ1Hdo385T5OWOeOyd
i7ir/9JQiS3PHSPaa9xiWJYyql+wSTef4uqwV0MRVp237vd7c7upweCVT7ZRQiNa
1h9Dw5YenjySK7AGkdURzpH8A2bdyCPr6Fmqe/NhC9lF85WnGRO3hUI+ssC1Oy5v
uFkPhH6pH8n2olWrvkWAXOUT6u2SHnU//GUI796m6NYvduuXuE+ZkGXs323f9tOt
uhEj/+ygxSRc+62dpDMnrDN82m5Hu6mlVmQpOCmVTvZ91P+xv3taZ/U2Ro57JgMj
yMnuzPYR49OL8tEV6f/nLrgy5KDooQ==
=ZqHi
-----END PGP SIGNATURE-----

--Vc4NIKc8AIDTKkid--


