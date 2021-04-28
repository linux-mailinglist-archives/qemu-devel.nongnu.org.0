Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CC636D4F6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 11:48:20 +0200 (CEST)
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbgnr-00067E-6n
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 05:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbgmo-0005aO-2L
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbgmi-0002Sg-Vy
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619603227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u6a9ylRq9BICQUgg5VvF0nIZEP8X8G0s7/JuE07ck6U=;
 b=hOPzn0z/8CeNnERVZ4iWxpxJXvDPl511KNECD3Tq7jTQNzqecKKWNacQ8L0p+Re+vlEdrF
 qPhDlK9JdraHFmSqiyUEZNjlol5eDsMRZVYBYMiyLpiBjtEH5gOFf7/uLp2mNZll8LE7ob
 TceUm6PIhz+x2I1S4TY5YSGZ/FVdlI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-YGV2RDFROsyf_8tGvbZIow-1; Wed, 28 Apr 2021 05:47:05 -0400
X-MC-Unique: YGV2RDFROsyf_8tGvbZIow-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 499BC189DF41;
 Wed, 28 Apr 2021 09:47:04 +0000 (UTC)
Received: from localhost (ovpn-115-54.ams2.redhat.com [10.36.115.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7F986C330;
 Wed, 28 Apr 2021 09:47:03 +0000 (UTC)
Date: Wed, 28 Apr 2021 10:46:57 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 0/2] block/export: Fix crash on error after iothread
 conflict
Message-ID: <YIkvEcMGbDrJRbos@stefanha-x1.localdomain>
References: <20210422145335.65814-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422145335.65814-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="b7gpwnyqEkkiBKa2"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--b7gpwnyqEkkiBKa2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 04:53:33PM +0200, Max Reitz wrote:
> Hi,
>=20
> By passing the @iothread option to block-export-add, the new export can
> be moved to the given iothread.  This may conflict with an existing
> parent of the node in question.  How this conflict is resolved, depends
> on @fixed-iothread: If that option is true, the error is fatal and
> block-export-add fails.  If it is false, the error is ignored and the
> node stays in its original iothread.
>=20
> However, in the implementation, the ignored error is still in *errp, and
> so if a second error occurs afterwards and tries to put something into
> *errp, that will fail an assertion.
>=20
> To really ignore the error, we have to free it and clear *errp (with an
> ERRP_GUARD()).
>=20
> Patch 1 is the fix, patch 2 a regression test.
>=20
>=20
> Max Reitz (2):
>   block/export: Free ignored Error
>   iotests/307: Test iothread conflict for exports
>=20
>  block/export/export.c      |  4 ++++
>  tests/qemu-iotests/307     | 15 +++++++++++++++
>  tests/qemu-iotests/307.out |  8 ++++++++
>  3 files changed, 27 insertions(+)
>=20
> --=20
> 2.30.2
>=20

Thanks for fixing this!

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--b7gpwnyqEkkiBKa2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCJLxEACgkQnKSrs4Gr
c8jO8Qf/Z/x5ZLHvl0k4BLat68mpJbG5LDiPfoYzuTnz2giAtDeYVcSIzuZzButV
/VhouRstAHi6AJPn0Nx/xZ0BKMlVXG2NFYNeO/xyztofy8zURIzyRo291JybtH4f
eGvNav9URy3XlQIudrQGp1seDKMjvod9IF0fT6lXCug3zjI6kwFiGoYtZF6tliWp
FQpnsoh0UpQQLzXZniZUw2CTIOwRUx8It3hgYjXBcdulURvpAKKOJyqciNaUm+2I
2tu6s4vDDy/J6lcFjD5R0UMBpenqGEi9zgQDsL09UNe25YSY/jOXYkmfKkJN+dmf
8cjVei7JaJWQ88a3rjqg7tpvr/04cA==
=i7z3
-----END PGP SIGNATURE-----

--b7gpwnyqEkkiBKa2--


