Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E76A43323A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:29:36 +0200 (CEST)
Received: from localhost ([::1]:35478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclR9-00039t-5A
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mclP4-0001b0-3D
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:27:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mclP1-0003mt-FR
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634635641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Can5RtAxV+JYdQfPGi2pKoz8r8wuA9P2sGC60BUa0wA=;
 b=DpxNHeOjbe8PGv1Alr9eL72Bn2CHY7PSbs8epcovzxeBNLyQYhP2eWyQr3EwJnEuHNKs/m
 KzbNC4sKf3jUAwWrUtIAeeGRdOlNBytRxcisUQG0jst1Ci8BsLZOCS0s3FUQ3dsvSM/9kk
 Zt+s9F2s0OHfTZdc1BchqUJLB63+4sI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-zBmu7luANU2Ol9SA_Jf9BQ-1; Tue, 19 Oct 2021 05:27:18 -0400
X-MC-Unique: zBmu7luANU2Ol9SA_Jf9BQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBAAE8066F1;
 Tue, 19 Oct 2021 09:27:16 +0000 (UTC)
Received: from localhost (unknown [10.39.195.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F89C694B4;
 Tue, 19 Oct 2021 09:27:16 +0000 (UTC)
Date: Tue, 19 Oct 2021 10:27:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] block/file-posix: Fix return value translation for AIO
 discards.
Message-ID: <YW6Pc1h0JaTNg2j5@stefanha-x1.localdomain>
References: <20211018180753.2436008-1-ari@tuxera.com>
 <3fee8956-34e5-435d-7a99-f3eb95c649f9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3fee8956-34e5-435d-7a99-f3eb95c649f9@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SkTzzBV00EELR5bD"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Emil Karlson <jkarlson@tuxera.com>, Hanna Reitz <hreitz@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Ari Sundholm <ari@tuxera.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--SkTzzBV00EELR5bD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 05:40:13AM +0200, Philippe Mathieu-Daud=E9 wrote:
> +Stefan
>=20
> On 10/18/21 20:07, Ari Sundholm wrote:
> > AIO discards regressed as a result of the following commit:
> > =090dfc7af2 block/file-posix: Optimize for macOS
> >=20
> > When trying to run blkdiscard within a Linux guest, the request would
> > fail, with some errors in dmesg:
> >=20
> > ---- [ snip ] ----
> > [    4.010070] sd 2:0:0:0: [sda] tag#0 FAILED Result: hostbyte=3DDID_OK
> > driverbyte=3DDRIVER_SENSE
> > [    4.011061] sd 2:0:0:0: [sda] tag#0 Sense Key : Aborted Command
> > [current]
> > [    4.011061] sd 2:0:0:0: [sda] tag#0 Add. Sense: I/O process
> > terminated
> > [    4.011061] sd 2:0:0:0: [sda] tag#0 CDB: Unmap/Read sub-channel 42
> > 00 00 00 00 00 00 00 18 00
> > [    4.011061] blk_update_request: I/O error, dev sda, sector 0
> > ---- [ snip ] ----
> >=20
> > This turns out to be a result of a flaw in changes to the error value
> > translation logic in handle_aiocb_discard(). The default return value
> > may be left untranslated in some configurations, and the wrong variable
> > is used in one translation.
> >=20
> > Fix both issues.
>=20
> Worth including:
>=20
> Cc: qemu-stable@nongnu.org
> Fixes: 0dfc7af2b28 ("block/file-posix: Optimize for macOS")
>=20
> > Signed-off-by: Ari Sundholm <ari@tuxera.com>
> > Signed-off-by: Emil Karlson <jkarlson@tuxera.com>
> > ---
> >  block/file-posix.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index 53be0bdc1b..6def2a4cba 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1807,7 +1807,7 @@ static int handle_aiocb_copy_range(void *opaque)
> >  static int handle_aiocb_discard(void *opaque)
> >  {
> >      RawPosixAIOData *aiocb =3D opaque;
> > -    int ret =3D -EOPNOTSUPP;
> > +    int ret =3D -ENOTSUP;
> >      BDRVRawState *s =3D aiocb->bs->opaque;
> > =20
> >      if (!s->has_discard) {
> > @@ -1829,7 +1829,7 @@ static int handle_aiocb_discard(void *opaque)
> >  #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
> >          ret =3D do_fallocate(s->fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_K=
EEP_SIZE,
> >                             aiocb->aio_offset, aiocb->aio_nbytes);
> > -        ret =3D translate_err(-errno);
> > +        ret =3D translate_err(ret);
> >  #elif defined(__APPLE__) && (__MACH__)
> >          fpunchhole_t fpunchhole;
> >          fpunchhole.fp_flags =3D 0;
> >=20
>=20

Thanks for the fix!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--SkTzzBV00EELR5bD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFuj3MACgkQnKSrs4Gr
c8hRywf8Cq0ku2uLQIWisun1WYSP1G/lPQGKfrrJE2maCBk6vBQ4w/Sjs7TQhjeG
ZyEl/hXi0SrElmLtPqzPM7b7jHdfDhlTQ35lpO37noL0Lt1HEkKp/F33nHea1bDz
8aUS7Q3ryYOs4xKfIMKf3lGphDbTHa/6rdekEcn83DlymmYKRbz8YyhVyzAwgpyY
7lxfbgYQ9jk7ESTGCTdEjBriGKf5wFL8ddApB89dXpLTOdrDSugLrHkK12T54pbc
cv8zG/DxvpCOEeju0uc3hmwTTX+zgPiBTaCPqhbf6s7LocIV09y7krJwHEsqvVzJ
pcEhfdpPq58Sraczl/iJOabZnmmHTQ==
=B4C6
-----END PGP SIGNATURE-----

--SkTzzBV00EELR5bD--


