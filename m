Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B2A3736A7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:57:49 +0200 (CEST)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leDLo-0008BB-T1
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leDKC-0007K3-R6
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:56:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leDK7-0005po-Kt
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620204963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GeWponiQKAhk1fQ+7s/yJw+uj0d0ouNRjzXRcqz60Cs=;
 b=aAh8bTXqo/BHqbWd1y5n8iaMtrIVtbhpffFAMQAQS8JDvmuKZ+z4ex3ZbtIXCKjmkNpmEz
 oiBCm1iV5hmopKopQzui8kOlA0BzjHJ4r1LgeyyHFdQdZyFnf6CWJneAaWLD24rOCxW660
 yYHXseKIR76sBBCtqxfAR/ExwpjdKYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-lnuyKjk3OYao44Hmi57UnQ-1; Wed, 05 May 2021 04:55:59 -0400
X-MC-Unique: lnuyKjk3OYao44Hmi57UnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50592107ACF6;
 Wed,  5 May 2021 08:55:58 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF02C5054E;
 Wed,  5 May 2021 08:55:52 +0000 (UTC)
Date: Wed, 5 May 2021 09:55:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 2/8] block: protect write threshold QMP commands from
 concurrent requests
Message-ID: <YJJdl+wNvxgl83Km@stefanha-x1.localdomain>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-3-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210419085541.22310-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lB3Hv0ycDSnnCtfA"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--lB3Hv0ycDSnnCtfA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 10:55:35AM +0200, Emanuele Giuseppe Esposito wrote:
> For simplicity, use bdrv_drained_begin/end to avoid concurrent
> writes to the write threshold, or reading it while it is being set.
> qmp_block_set_write_threshold is protected by the BQL.
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  block/write-threshold.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/block/write-threshold.c b/block/write-threshold.c
> index 63040fa4f2..77c74bdaa7 100644
> --- a/block/write-threshold.c
> +++ b/block/write-threshold.c
> @@ -111,7 +111,6 @@ void qmp_block_set_write_threshold(const char *node_n=
ame,
>                                     Error **errp)
>  {
>      BlockDriverState *bs;
> -    AioContext *aio_context;
> =20
>      bs =3D bdrv_find_node(node_name);
>      if (!bs) {
> @@ -119,10 +118,8 @@ void qmp_block_set_write_threshold(const char *node_=
name,
>          return;
>      }
> =20
> -    aio_context =3D bdrv_get_aio_context(bs);
> -    aio_context_acquire(aio_context);
> -
> +    /* Avoid a concurrent write_threshold_disable.  */
> +    bdrv_drained_begin(bs);

Is there documentation that says it's safe to call
bdrv_drained_begin(bs) without the AioContext acquired? AIO_WAIT_WHILE()
contradicts this:

  The caller's thread must be the IOThread that owns @ctx or the main loop
  thread (with @ctx acquired exactly once).
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

--lB3Hv0ycDSnnCtfA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSXZcACgkQnKSrs4Gr
c8jdVwgAwBsSD0GuqJun3IQQgxsT2iJT12eNxUfqGOHitKM4xUGeHkuA13cibuo7
b1kPDGn0ZyPYlqmXiK9NxGT2Pw46hXtTyUZQ0Rs3oJjKv+zWVPkkGViXSR2nTH7q
0gR3Raqk+tZAUKy20TmGkqJijoy5wu7sSqR/JxRwC+xS3seBlgSzVkGsAlGANb9u
iGa5Jb2BHL+gYm4rtQju5bGH2t6d9NYGP3uZOPh4y8a/5zstjzUPVqlDZjQAHtDA
rfv20X+mXjNIMNK/4xekDWHhP0tIDyCFvk6m0GpHnSEJ4urGskLQFiYDw89xC5wC
zRQFLFUheei/nT37L7uN9erUVqEtwQ==
=fFGe
-----END PGP SIGNATURE-----

--lB3Hv0ycDSnnCtfA--


