Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470C837C748
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:02:11 +0200 (CEST)
Received: from localhost ([::1]:56798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrJK-0001Vy-8A
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrAy-0007tf-GC
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:53:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrAe-0004iG-BR
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620834791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s2LtQ/HURu6Cg+gumGCDrO3/lIg021wQko+DVA/aph4=;
 b=jEX3lh2udxJGcs4Je38MKzQk55n2IJWeVEJtiW6QeTYZYGZ0Dc0Rork1uX3PFDGBJwlWNB
 d74v43slrk6KwqCaJRl0vX58xThR+3zwm++nj/gZBhTzncrfHiswZer4lBBizS7rK4ywlk
 XqEsf0DmG6wJyMyaCzsRASOJyPQqgbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-P2JMIPSWP5aLG7CJWCYZSw-1; Wed, 12 May 2021 11:53:07 -0400
X-MC-Unique: P2JMIPSWP5aLG7CJWCYZSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B15D8106BB2A;
 Wed, 12 May 2021 15:53:06 +0000 (UTC)
Received: from localhost (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D28C6091A;
 Wed, 12 May 2021 15:53:05 +0000 (UTC)
Date: Wed, 12 May 2021 16:53:04 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 4/6] progressmeter: protect with a mutex
Message-ID: <YJv54J32rxqjGhP8@stefanha-x1.localdomain>
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-5-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210510085941.22769-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zWghNzOESOTUuR5q"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--zWghNzOESOTUuR5q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 10:59:39AM +0200, Emanuele Giuseppe Esposito wrote:
> Progressmeter is protected by the AioContext mutex, which
> is taken by the block jobs and their caller (like blockdev).
>=20
> We would like to remove the dependency of block layer code on the
> AioContext mutex, since most drivers and the core I/O code are already
> not relying on it.
>=20
> The simplest thing to do is to add a mutex to be able to provide
> an accurate snapshot of the progress values to the caller.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c                    | 33 +++++++++++++++++++++++++--------
>  include/qemu/progress_meter.h | 31 +++++++++++++++++++++++++++++++
>  job-qmp.c                     |  8 ++++++--
>  job.c                         |  3 +++
>  qemu-img.c                    |  9 ++++++---
>  5 files changed, 71 insertions(+), 13 deletions(-)

Unlike the next two patches where I had comments, here adding the lock
makes sense to me - the point of the progress meter is to report numbers
to the monitor thread so thread-safety is a key part of the API's value.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--zWghNzOESOTUuR5q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCb+eAACgkQnKSrs4Gr
c8i4XwgAqW0MTHhH/PTpItmlauW9wegtfzxWDMfkyykSUFPDxknsSlcMiXELgV6p
xSBxRXYrii5O4xaAK05EfZ30FIbiE/7qHs8JNiG39rz8CC6ZvRUKt2xwNK7nLPFS
VFK3JRKIdz2rAfcxQidSKUxrkG4rAnC6Em0FHxnT+uP5LqfYa3jQqZ136xaFPQQ6
gCvOY+CTjyxch7G57w6fmdzsuo8g5iUjPnJQb7fDM173s/BMvNXZ6A0Vn53FdKfL
LwcWAR+AzMkfEcedbILGSKFCvzg1wxnGnEw5Ha6lyTjGdIrQHcrzFOfBmzhCj4ce
54fLFVm30NBtYbv+RtnzzvqIcAF+xQ==
=YKpr
-----END PGP SIGNATURE-----

--zWghNzOESOTUuR5q--


