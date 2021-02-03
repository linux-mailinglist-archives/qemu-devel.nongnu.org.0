Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6B430DD63
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:58:59 +0100 (CET)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JcQ-0007F1-H3
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7Jb2-0006ND-3q
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:57:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7Jb0-0007Fu-Ka
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612364249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fxroF4jgsU9z1g8oyhxDdelIkB75a8QTQ8rvL2/L5Cg=;
 b=RE6+6tOQLDYfY63gdrDT5s/ljHHZcNLQz8A2ojpnZ+1EggKhoWerpVFtT6rOk4Qb+JNWSP
 C8O5A/SoNGazuXvxaBjaxAHiKR3yo0PCYbM/iiHtEgxFDTMaMVF/gBtHFc9GNFN7bq77pG
 WS4DKt35uYCMvr/hY660mQ9Fj57GEfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-Q5CMaSxUOHuXSfji019WsQ-1; Wed, 03 Feb 2021 09:57:25 -0500
X-MC-Unique: Q5CMaSxUOHuXSfji019WsQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 845D9107ACF5;
 Wed,  3 Feb 2021 14:57:24 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D35F5C241;
 Wed,  3 Feb 2021 14:57:24 +0000 (UTC)
Date: Wed, 3 Feb 2021 14:57:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtiofsd: vu_dispatch locking should never fail
Message-ID: <20210203145723.GF74271@stefanha-x1.localdomain>
References: <20210129155312.595980-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210129155312.595980-1-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w3uUfsyyY1Pqa/ej"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: qemu-devel@nongnu.org, Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--w3uUfsyyY1Pqa/ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 04:53:12PM +0100, Greg Kurz wrote:
> pthread_rwlock_rdlock() and pthread_rwlock_wrlock() can fail if a
> deadlock condition is detected or the current thread already owns
> the lock. They can also fail, like pthread_rwlock_unlock(), if the
> mutex wasn't properly initialized. None of these are ever expected
> to happen with fv_VuDev::vu_dispatch_rwlock.
>=20
> Some users already check the return value and assert, some others
> don't. Introduce rdlock/wrlock/unlock wrappers that just do the
> former and use them everywhere.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

What is the purpose of this commit:
1. Code cleanup/consistency?
2. Helps debug an issue that doesn't occur in production but you hit
   during development?
3. Needed to diagnose a real-world issue? How do you reproduce it?

I wanted to check to make sure I'm not missing an issue you found with
production workloads.

> @@ -645,8 +662,7 @@ static void *fv_queue_thread(void *opaque)
>              break;
>          }
>          /* Mutual exclusion with virtio_loop() */
> -        ret =3D pthread_rwlock_rdlock(&qi->virtio_dev->vu_dispatch_rwloc=
k);
> -        assert(ret =3D=3D 0); /* there is no possible error case */
> +        vu_dispatch_wrlock(qi->virtio_dev);

s/vu_dispatch_wrlock/vu_dispatch_rdlock/ ?

--w3uUfsyyY1Pqa/ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAaudMACgkQnKSrs4Gr
c8iP1Qf/dP+fCj1Zj5o51UWH4KxWXk1ywUrW0nZvmg1CWSbs2WaXADhYwfykoRmG
SL1g7yphgPHRh1CuJUKU9AC4rjXwZiiRpbmV1NsYu1xS29sOrHVkvvTXkvpql6JJ
EK086oCHKAKzaFxKdojoifOON/eNRueK1iB9oySTQcz5htuzN7hoOB/9HgUQE/0Z
aWkNQbsVuGg20vXOKvmxvdgOkKr/OD3kyXkDCAxUeiUkQIOstV9pVPa8LAMBkCUd
Vn+hVTogWtN7A6T/D5ObA9mBvcdwBur7vxA+3thtfWe8cFh3u7mLx5zot1LHWfI6
ksN/olBJ49oO0hNPguxvzpo52LiunQ==
=kS/R
-----END PGP SIGNATURE-----

--w3uUfsyyY1Pqa/ej--


