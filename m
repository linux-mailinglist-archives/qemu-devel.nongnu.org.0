Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D527A37382D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 11:54:45 +0200 (CEST)
Received: from localhost ([::1]:48678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEEu-00044c-TN
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 05:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEDs-0003Wo-3Q
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEDo-0006h5-JA
 for qemu-devel@nongnu.org; Wed, 05 May 2021 05:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620208416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lRhuNNdtfJXiF0ddBIZ+VGKLVPEz11L+usv+AZO97ec=;
 b=NkRuhbDHn1WS0WXJs+vn/PehFuAKB5c4r5r9xgLyRF2Y4ZEZG0KWhCo+WwQ++yc0oKxWrN
 dwPIRe8DfQxmnhEd/La48W9kkevKdXo3uebMyHYuzudaVT9HDRqCm0dIlhaSlcrDRP9pHN
 v8VjLsUPsZ8Nfz8PPpMjIZGh2dtGigU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-IxnaA48HNdmnYV8lxum9oA-1; Wed, 05 May 2021 05:53:32 -0400
X-MC-Unique: IxnaA48HNdmnYV8lxum9oA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E99341006C86;
 Wed,  5 May 2021 09:53:30 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 595AC5D9C0;
 Wed,  5 May 2021 09:53:30 +0000 (UTC)
Date: Wed, 5 May 2021 10:53:29 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v2 5/8] block: add a few more notes on locking
Message-ID: <YJJrGWHOXXdD+mOZ@stefanha-x1.localdomain>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-6-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210419085541.22310-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g4Q4O++x2oXPVz0g"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--g4Q4O++x2oXPVz0g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 10:55:38AM +0200, Emanuele Giuseppe Esposito wrote:
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  include/block/block_int.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/block/block_int.h b/include/block/block_int.h
> index a1aad5ad2d..67a0777e12 100644
> --- a/include/block/block_int.h
> +++ b/include/block/block_int.h
> @@ -154,7 +154,9 @@ struct BlockDriver {
>       */
>      bool supports_backing;
> =20
> -    /* For handling image reopen for split or non-split files */
> +    /* For handling image reopen for split or non-split files.  Called
> +     * with no I/O pending.

Does "Called with no I/O pending" mean "Called in a drained section"?

> +     */
>      int (*bdrv_reopen_prepare)(BDRVReopenState *reopen_state,
>                                 BlockReopenQueue *queue, Error **errp);
>      void (*bdrv_reopen_commit)(BDRVReopenState *reopen_state);
> @@ -168,6 +170,7 @@ struct BlockDriver {
>      /* Protocol drivers should implement this instead of bdrv_open */
>      int (*bdrv_file_open)(BlockDriverState *bs, QDict *options, int flag=
s,
>                            Error **errp);
> +    /* Called from main thread.  */
>      void (*bdrv_close)(BlockDriverState *bs);
> =20
> =20
> --=20
> 2.30.2
>=20

--g4Q4O++x2oXPVz0g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSaxkACgkQnKSrs4Gr
c8id4wf8DciUI4tp1gXawmz6WNwBxG744OTSqLUTqRxJQxQwH5qhH7aoeqgSrWEH
nODqkTQgwxvImKdRP6BKiDnc0R+UpC+qwH49ZqH7wGSELEpFMpjFIbZWoM/LW+u1
ejRASKPY6S35LzE3N0Waa06qkg4W4OwF2aEkS8wMxZgKJToiu42or+O47iW9OXoh
GUGB6wYwEbbRymxkySsQgSAm+Ix3Fx+tcTNSe7MoX4q9CYvJdsHuxoyTu/lGVtWc
ukWZX7uS1s4cd0e2ykhGNvAWpjBQYfsM8TTNiqIyzLnvKRCEO4UX2MCbJY5t9btG
Ekw1ifY87c+4w7L6LwQsU0gXzJDUxA==
=6/Ar
-----END PGP SIGNATURE-----

--g4Q4O++x2oXPVz0g--


