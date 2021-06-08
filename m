Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3654639F3DE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 12:43:42 +0200 (CEST)
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZCu-0001Rn-Sw
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 06:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqZ9q-0005QM-Dg
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lqZ9n-0006Ky-Lz
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 06:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623148826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LvRj7qy2WbCybqRKM9wDHTTaaV1FpaBS6GfWCzQZDKA=;
 b=jFS2b0QcBXUtg9Z+GWuUQnqHSVbqzzAZJdJOD/hD2T2GsHJUm3D2Qu9jc20BB2w0sPO/FB
 KDtUMHVZpM+JPrFWl3L6zg/L49yBj7D3cF2+rSjEZYbRktIySvWSsBZfp6H6eZHVZAYK0u
 upVhy35l7fHznBQYRJQ8XXgNzuV/tY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-RZ1L6C6XN6upcfUnFY9MEA-1; Tue, 08 Jun 2021 06:40:23 -0400
X-MC-Unique: RZ1L6C6XN6upcfUnFY9MEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C90D18015F5;
 Tue,  8 Jun 2021 10:40:21 +0000 (UTC)
Received: from localhost (ovpn-114-153.ams2.redhat.com [10.36.114.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58B91100164C;
 Tue,  8 Jun 2021 10:40:20 +0000 (UTC)
Date: Tue, 8 Jun 2021 11:40:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH 00/11] hw/nvme: reimplement all multi-aio commands
 with custom aiocbs
Message-ID: <YL9JFPGsunA62KS0@stefanha-x1.localdomain>
References: <20210604065237.873228-1-its@irrelevant.dk>
MIME-Version: 1.0
In-Reply-To: <20210604065237.873228-1-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EiJAQ7rKvUK97D+E"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--EiJAQ7rKvUK97D+E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 08:52:26AM +0200, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> This series reimplements flush, dsm, copy, zone reset and format nvm to
> allow cancellation. I posted an RFC back in March ("hw/block/nvme:
> convert ad-hoc aio tracking to aiocb") and I've applied some feedback
> from Stefan and reimplemented the remaining commands.
>=20
> The basic idea is to define custom AIOCBs for these commands. The custom
> AIOCB takes care of issuing all the "nested" AIOs one by one instead of
> blindly sending them off simultaneously without tracking the returned
> aiocbs.
>=20
> I've kept the RFC since I'm still new to using the block layer like
> this. I was hoping that Stefan could find some time to look over this -
> this is a huge series, so I don't expect non-nvme folks to spend a large
> amount of time on it, but I would really like feedback on my approach in
> the reimplementation of flush and format. Those commands are special in
> that may issue AIOs to multiple namespaces and thus, to multiple block
> backends. Since this device does not support iothreads, I've opted for
> simply always returning the main loop aio context, but I wonder if this
> is acceptable or not. It might be the case that this should contain an
> assert of some kind, in case someone starts adding iothread support.

This approach looks fine to me. Vladimir mentioned coroutines, which
have simpler code for sequential I/O, but don't support cancellation.
Since cancellation is the point of this series I think sticking to the
aio approach makes sense.

Regarding coroutine cancellation, it's a hard to add since there is
already a lot of coroutine code that's not written with cancellation in
mind.

I think I would approach it by adding a .cancel_cb() field to Coroutine
that does nothing by default (because existing code doesn't support
cancellation and we must wait for the operation to complete). Cases the
do support cancellation would install a .cancel_cb() across yield that
causes the operation that coroutine is waiting on to complete early.

An alternative approach is to re-enter the coroutine, but this requires
all yield points in QEMU to check for cancellation. I don't think this
is practical because converting all the code would be hard.

Anyway, the aio approach looks fine.

Stefan

--EiJAQ7rKvUK97D+E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC/SRMACgkQnKSrs4Gr
c8gcJgf+NfNCVN8C3DrMYaK2DEBHkpV/z6rQPm8vQ3Msil76eyPlg5YL4q1KcCNq
K9efkd6w47xHdlSCpsUNe5uwA2n9CMDGjOrS8EQwi2EJF46NC0IulhozDJ9wKsfm
VHBm9YJSMJQfbQNd5eFrr1PnzWGyV3D/KmelN0Dokq00Rayc+NKFzaG7YmNdNz0s
Qt+HrJvS9LOG5rVCXPih5cWHcRKoZWHO6W2LDP7dI94KhEQqv5e/SbYuQPowgkZx
TkDkghSA6gapd/U/6mhacQMuCrnZCdloH4FLt3ahZbZtZD5hC+pWnAztu3EDCGQJ
vY5vyTOJ8wy9iAq0G0WH1nMjirgVgQ==
=QO22
-----END PGP SIGNATURE-----

--EiJAQ7rKvUK97D+E--


