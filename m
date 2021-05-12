Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACB937C61E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:50:05 +0200 (CEST)
Received: from localhost ([::1]:59560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgr7c-0000cb-VU
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgr2y-0006ew-B7
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:45:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgr2o-0000Oy-DC
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620834305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6fryYKZjBUvcsY+wdKjK32hFu/Xz/bMDYgYD+szHsEI=;
 b=Xq8ZhZ0VfXQBqo+ACU/JOqSjAglt1nzzWoOr2ScPOmaZP2VTyOmEcBeherJGIRq+Jw7a/I
 5OXvFbENE1N4Lo3b/y0YY0WfobYneQnGAeQkMT1UAwEJZrYhxrx/WzSWEwdupL1zH0WoGm
 wg1rQnlYtmZzqT0Ny9LqV7y+lVFshR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-skhcaHp7NTSQDbKoJSl8Bg-1; Wed, 12 May 2021 11:45:03 -0400
X-MC-Unique: skhcaHp7NTSQDbKoJSl8Bg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7B5E1009465;
 Wed, 12 May 2021 15:45:01 +0000 (UTC)
Received: from localhost (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3630C5D6AC;
 Wed, 12 May 2021 15:45:01 +0000 (UTC)
Date: Wed, 12 May 2021 16:44:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 5/6] co-shared-resource: protect with a mutex
Message-ID: <YJv3+y42z0Ld1nY0@stefanha-x1.localdomain>
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-6-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210510085941.22769-6-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nJNVInJjSJRN/GUy"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nJNVInJjSJRN/GUy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 10:59:40AM +0200, Emanuele Giuseppe Esposito wrote:
> co-shared-resource is currently not thread-safe, as also reported
> in co-shared-resource.h. Add a QemuMutex because co_try_get_from_shres
> can also be invoked from non-coroutine context.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  util/qemu-co-shared-resource.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)

Hmm...this thread-safety change is more fine-grained than I was
expecting. If we follow this strategy basically any data structure used
by coroutines needs its own fine-grained lock (like Java's Object base
class which has its own lock).

I'm not sure I like it since callers may still need coarser grained
locks to protect their own state or synchronize access to multiple
items of data. Also, some callers may not need thread-safety.

Can the caller to be responsible for locking instead (e.g. using
CoMutex)?

> diff --git a/util/qemu-co-shared-resource.c b/util/qemu-co-shared-resourc=
e.c
> index 1c83cd9d29..c455d02a1e 100644
> --- a/util/qemu-co-shared-resource.c
> +++ b/util/qemu-co-shared-resource.c
> @@ -32,6 +32,7 @@ struct SharedResource {
>      uint64_t available;
> =20
>      CoQueue queue;
> +    QemuMutex lock;

Please add a comment indicating what this lock protects.

Thread safety should also be documented in the header file so API users
know what to expect.

--nJNVInJjSJRN/GUy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCb9/sACgkQnKSrs4Gr
c8gGcQf/XvW6glaozb9KFXyMRFwDfO4IOgfJMBsmAZh7vW1rNl+Up0fbEOQ7CjRA
arzSvhwyuBrNjZimZoo8mnqiydh0po5vWDPeRcbjBPZqI1Vf3luNiYfhVlSzPXxd
YuF6jyJh/ODTYWHqw/xwMGJub240esP4cURRsaZP28w/qskTJH8wYwb2Re65XbKs
Cb5a3yJztSqwmUqwZ+jiEk7EM8OAAI9yyTBUkUi0NlWBoaq+XUxDvF+3Fy8Us1jU
c1dbvnrmpKcgs7EKw/W3wO/vFH9dQNCvrxUjeO8UDesHN7wYTuHtZiRZKy9a0szt
1l0eT88xPP8TNDZEX1qbS1ciQUYvIg==
=2z6+
-----END PGP SIGNATURE-----

--nJNVInJjSJRN/GUy--


