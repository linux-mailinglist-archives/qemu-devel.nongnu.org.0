Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDE13CD0EC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:32:27 +0200 (CEST)
Received: from localhost ([::1]:51674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PdS-0008OG-S1
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5PbJ-0006wJ-UU
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:30:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m5PbH-0001tW-GH
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626687009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=864hEMEyFPO4B7Y5ZEIfmrw8K7pJ0NFM4ps+YZWPZ80=;
 b=iGvMgOn2PZ4rOUMrnvZhexFoHXaWToZDTmSHwGgOZpkR8dZ+H4I0qwSJdA0LQnKTr4eWTK
 6E7WcZO+eguRCm2jFSCqrvRi1bFO7AokV7cpqo53w6uciARmhem4ajhY9JhH5ISsUDRzAK
 MuNFS5XIO02nYcXcHO25b3FBn95BrBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-hbeJv68lOseGKRZr0Eds7g-1; Mon, 19 Jul 2021 05:30:08 -0400
X-MC-Unique: hbeJv68lOseGKRZr0Eds7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7567C10A92A3;
 Mon, 19 Jul 2021 09:29:40 +0000 (UTC)
Received: from localhost (ovpn-113-42.ams2.redhat.com [10.36.113.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85B8827C3D;
 Mon, 19 Jul 2021 09:29:39 +0000 (UTC)
Date: Mon, 19 Jul 2021 10:29:38 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Message-ID: <YPVGAqQlf0UDmsf0@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
 <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
 <YOb31YOF8Q3t9RoK@stefanha-x1.localdomain>
 <629fb077-9d0a-7c33-0b2e-d055c0493005@redhat.com>
 <YO2QvuBqbw58fuo/@stefanha-x1.localdomain>
 <YPGkhtRrhc144vT7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YPGkhtRrhc144vT7@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="27pzDBfKKBN9mvdH"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--27pzDBfKKBN9mvdH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 16, 2021 at 05:23:50PM +0200, Kevin Wolf wrote:
> Am 13.07.2021 um 15:10 hat Stefan Hajnoczi geschrieben:
> > AIO_WAIT_WHILE() requires that AioContext is acquired according to its
> > documentation, but I'm not sure that's true anymore. Thread-safe/atomic
> > primitives are used by AIO_WAIT_WHILE(), so as long as the condition
> > being waited for is thread-safe too it should work without the
> > AioContext lock.
>=20
> Polling something in a different AioContext from the main thread still
> temporarily drops the lock, which crashes if it isn't locked. I'm not
> sure if the documentation claims that the lock is needed in more cases,
> I guess you could interpret it either way.

I'm claiming that the lock doesn't need to be dropped in that case
anymore - as long as the condition we're polling is thread-safe. :)

Have I missed something that still need locking?

We could temporarily introduce an AIO_WAIT_WHILE_UNLOCKED() macro so
that callers can be converted individually.

Stefan

--27pzDBfKKBN9mvdH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmD1RgIACgkQnKSrs4Gr
c8jBWQf/QEzGweXTR/ydtEQQ7vtIoSlyTsB7TZn9aKYPxC+nYjioJpsPbM8H/pu4
amxRPC9OwTN4dGXoGGX1OSr1fjje9xlPfywoJfUMODS68VeT7CanRcoNwzO1uKiD
fgRTfD+1BRjBDTtrUiAOJN/HOh+sNP0xPMuGIbhPQAx5bNCwASia6SfXxBK4ocSW
GIqWYvxeEm5gVkQJmEcWtuoeu05/RMAKlRdL38cjocy1773raL1ABtMnL3h9lZ4O
GH/Oa63Mz0sFp6tbaxi1nRP8C0C7v3+RmA0ciOHYtaETiDjdTwZW35BGgm6G/FYh
OXFOuT5FFPufudjvBw5nF+ZqfTufdg==
=S5yW
-----END PGP SIGNATURE-----

--27pzDBfKKBN9mvdH--


