Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194B77D83D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 11:08:18 +0200 (CEST)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ht74K-00082Q-T7
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 05:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33412)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1ht73o-0007Xo-53
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 05:07:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1ht73n-0006FL-Az
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 05:07:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38398)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1ht73n-0006F0-59
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 05:07:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0598BC028353
 for <qemu-devel@nongnu.org>; Thu,  1 Aug 2019 09:07:42 +0000 (UTC)
Received: from localhost (ovpn-116-232.ams2.redhat.com [10.36.116.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26A3A600F8;
 Thu,  1 Aug 2019 09:07:38 +0000 (UTC)
Date: Thu, 1 Aug 2019 10:07:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190801090738.GA15179@stefanha-x1.localdomain>
References: <20190726091103.23503-1-stefanha@redhat.com>
 <20190726091103.23503-5-stefanha@redhat.com>
 <20190731172716.GK3203@work-vm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline
In-Reply-To: <20190731172716.GK3203@work-vm>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 01 Aug 2019 09:07:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 4/5] virtiofsd: drop lo_dirp->fd field
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2019 at 06:27:16PM +0100, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > fdopendir(3) takes ownership of the file descriptor.  The presence of
> > the lo_dirp->fd field could lead to someone incorrectly adding a
> > close(d->fd) cleanup call in the future.
> >=20
> > Do not store the file descriptor in struct lo_dirp since it is unused.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>=20
>=20
> Thanks, applied; note:
>   a) This looks like it can go into upstream libfuse
>   b) I think we're probably leaking DIR *'s if we do an lo_shutdown;
> I've added that to my todo

FUSE_DESTROY is current broken, it leaks resources and is not
thread-safe.  It's something I'll tackle in multithreading preparation
part 3.

Stefan

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1Cq8AACgkQnKSrs4Gr
c8grRQf+LLnWRgrw2EwmjFKKptITHvEbhARQ4I7CDX5Zt5GONfH4qg9rG23XHM90
X/Nv4RLb+jYQfvtVtIz4ZSFm8gN+GosioguRp1rMQD07eQ8xyVAoShUfFTixeiKi
YN2+fyHBYpbCziWr60RRVkimdDnI6sqjSqT0pdf7mYuv+CRX+0rxdPh3DRBYv3x8
nU6cokgfSruGC1KAtyGvui5U2uRAHogmStHCCF90UCbJy73tQ4pld4zcoRcAWD6V
OMOa/NrWW27jz4eqygDt+QRlWHkX8Rxv+viN+0jII4gIc581EXu3IsszRitz2kqr
yyk8a7HE0ViTfdbc+qb6VwbpwTbO5g==
=qQqT
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--

