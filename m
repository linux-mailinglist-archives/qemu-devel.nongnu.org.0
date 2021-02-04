Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D481E30EFC8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:39:06 +0100 (CET)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7b6P-0006ol-VA
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:39:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7b4s-00067Y-UC
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:37:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7b4r-0006xn-7y
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612431448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8J0dhXTTfyGDgl5VGIreoomGlyVCSjvuATHZrpCn+c0=;
 b=Qa6CgLSBDDCEs3+IIYN9fOsc+GOmdpLTPwo8wwvruWOCLS7+zzwS0SPde8k6QiVsicBQH0
 NnLvKTkthdogcsHysbzphhlPmKXy9N99QI8dwJeTFiV06X8IJsfmuyVah/mAx2Y9Z6q/lg
 2rraaPHZDV+wem84Yf2nCIjm4uUueNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-9pVhh7gkO1CRWtUk9a2bnw-1; Thu, 04 Feb 2021 04:37:26 -0500
X-MC-Unique: 9pVhh7gkO1CRWtUk9a2bnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F75E801960;
 Thu,  4 Feb 2021 09:37:25 +0000 (UTC)
Received: from localhost (ovpn-115-89.ams2.redhat.com [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D831D131EF;
 Thu,  4 Feb 2021 09:37:21 +0000 (UTC)
Date: Thu, 4 Feb 2021 09:37:20 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2] virtiofsd: vu_dispatch locking should never fail
Message-ID: <20210204093720.GA344659@stefanha-x1.localdomain>
References: <20210203182434.93870-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210203182434.93870-1-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 03, 2021 at 07:24:34PM +0100, Greg Kurz wrote:
> pthread_rwlock_rdlock() and pthread_rwlock_wrlock() can fail if a
> deadlock condition is detected or the current thread already owns
> the lock. They can also fail, like pthread_rwlock_unlock(), if the
> mutex wasn't properly initialized. None of these are ever expected
> to happen with fv_VuDev::vu_dispatch_rwlock.
>=20
> Some users already check the return value and assert, some others
> don't. Introduce rdlock/wrlock/unlock wrappers that just do the
> former and use them everywhere for improved consistency and
> robustness.
>=20
> This is just cleanup. It doesn't fix any actual issue.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>=20
> v2: - open-code helpers instead of defining them with a macro (Vivek, Ste=
fan)
>     - fixed rd/wr typo in fv_queue_thread() (Stefan)
>     - make it clear in the changelog this is just cleanup (Stefan)
>=20
>  tools/virtiofsd/fuse_virtio.c | 49 +++++++++++++++++++++++++----------
>  1 file changed, 35 insertions(+), 14 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAbwFAACgkQnKSrs4Gr
c8gbjAf9GblB8eefDQi5Z4Mw1lenpQ0Ymi0VLwcAAfpMn5X3wNFDIe6lb49XsGHO
XQSql+SWtVSwDtmS8b7WAX164atl3z647Ga/OJ+6Q7Ptj+fmNjrFe2qUXiNQlNnz
uczXb4KVljuV/0Kal3YAVUkMDSFxWfUnU3swaL9GkTK+AIWv3+1XjcZBZlzGR1sw
5fdbEa1a2xqAJoncnKXs3OPqDmjkdXHbXMtLWmV1jPJCEAHShk6Xk8iKasC0izdT
dYJkL3a2Sec7eOcgwIjdY3iZ6DaOavDqU1ONZoeIRb0sObAnQ9GQGp6P8HrX8BcQ
pRn5XV/SbgY9GXtvqRgxAJpE/4Pakw==
=Uj6s
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--


