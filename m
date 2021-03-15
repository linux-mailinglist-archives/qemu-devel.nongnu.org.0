Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2DD33AF4E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:54:55 +0100 (CET)
Received: from localhost ([::1]:49124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjw6-0000Ta-Dc
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLjuO-00080W-RI
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:53:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLjuN-0005NM-7N
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615801986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ht+catxC0msfSw1tStBYzqYfZ2d+2eRATBGHrJT6cv0=;
 b=AN8zSRNzX5Zf8/327SnvFgTDqmsV0J/0w1u2hcjHg1D4G9x/qFZIKLm3xNxM81LCTK7wDK
 kRlRXMf1agFWPKBhjNpAxVDTNIDX5C6DzH1YT+bAHyAkUV1Eq4WRL4qNB9RuOEGY2sRCrn
 t9H/g3Rw5mqiJNvFygiZFetPjHi2aSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-5lcFOY-TOqGGSXWiVWPFhg-1; Mon, 15 Mar 2021 05:53:03 -0400
X-MC-Unique: 5lcFOY-TOqGGSXWiVWPFhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCC29760CC;
 Mon, 15 Mar 2021 09:53:02 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6643A1F07C;
 Mon, 15 Mar 2021 09:53:02 +0000 (UTC)
Date: Mon, 15 Mar 2021 09:53:01 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 6/8] tools/virtiofsd/buffer.c: replaced a calloc call
 with GLib's g_try_new0
Message-ID: <YE8ufa1o62ArBkrN@stefanha-x1.localdomain>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-7-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210314032324.45142-7-ma.mandourr@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="boG6JHBD9r9sJV2c"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--boG6JHBD9r9sJV2c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 14, 2021 at 05:23:22AM +0200, Mahmoud Mandour wrote:
> Replaced a call to calloc() and its respective free() call
> with GLib's g_try_new0() and g_free() calls.
>=20
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tools/virtiofsd/buffer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--boG6JHBD9r9sJV2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBPLn0ACgkQnKSrs4Gr
c8h3cggAgA9SPw3bKRmEC42Wjh0E77dGWf02L7wTGQwPM2JKeJMSSJ7mCn4uSlG4
NYN3yB3hbxTAjQIsOgF2CwLwtV3leTqkNW9BC7HsXcZU3caPqibp/j1G7EEOzpN6
1kvoRe+8/QtjLWKG4t5UHufjwzWVCY+GK46C1m2s8z06UNJD7eYNWIPaErX0esMQ
7IzpLo603YqrLPPjE4HxcgCwn6MGF94giV0phvhnvzEgqoelSw6oxYA2jB0GTyZ6
9xWPi00pYGinaBsoWWLpJqQAs9QjiHvLHdFDL3e2f31yjmUQQILG/p2EBGf0nH0x
JSppHPb21UKCXC5S/LiYMJ1YLmL9tA==
=O4B6
-----END PGP SIGNATURE-----

--boG6JHBD9r9sJV2c--


