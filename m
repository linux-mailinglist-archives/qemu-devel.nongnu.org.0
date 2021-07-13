Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904FE3C7112
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:12:42 +0200 (CEST)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3IDJ-0003hZ-2L
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3IBD-0002cP-6R
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3IBA-0005X7-Gb
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626181827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F7K9ybLe4u1QU+TsMbs1mSma/sv9Hb5DtHaS3Tx6ohE=;
 b=PeX19PPZloNiAxfhTHuyXGCWHr1dVxpNXk3orQbaG37P1QL7Sakys4l1ntByUV6YK/LdGe
 ACCPGU8ugB6gXfAjIgEj4OxwR7MwemeCy7axjSVyRzvMvLjbBJZT1JswHgsZhAXjS3sDjp
 1i5pRqQgtaaCnwHAZDXh39hmLdQuFg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-FkGQZXTvMySp8QNht_zVLg-1; Tue, 13 Jul 2021 09:10:25 -0400
X-MC-Unique: FkGQZXTvMySp8QNht_zVLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5268B802E66;
 Tue, 13 Jul 2021 13:10:24 +0000 (UTC)
Received: from localhost (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6976A60C05;
 Tue, 13 Jul 2021 13:10:23 +0000 (UTC)
Date: Tue, 13 Jul 2021 14:10:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Message-ID: <YO2QvuBqbw58fuo/@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
 <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
 <YOb31YOF8Q3t9RoK@stefanha-x1.localdomain>
 <629fb077-9d0a-7c33-0b2e-d055c0493005@redhat.com>
MIME-Version: 1.0
In-Reply-To: <629fb077-9d0a-7c33-0b2e-d055c0493005@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y1IOG8/AdzCW3Phf"
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
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--y1IOG8/AdzCW3Phf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 10:41:46AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> On 08/07/2021 15:04, Stefan Hajnoczi wrote:
> > On Thu, Jul 08, 2021 at 01:32:12PM +0200, Paolo Bonzini wrote:
> > > On 08/07/21 12:36, Stefan Hajnoczi wrote:
> > > > > What is very clear from this patch is that it
> > > > > is strictly related to the brdv_* and lower level calls, because
> > > > > they also internally check or even use the aiocontext lock.
> > > > > Therefore, in order to make it work, I temporarly added some
> > > > > aiocontext_acquire/release pair around the function that
> > > > > still assert for them or assume they are hold and temporarly
> > > > > unlock (unlock() - lock()).
> > > >=20
> > > > Sounds like the issue is that this patch series assumes AioContext =
locks
> > > > are no longer required for calling the blk_*()/bdrv_*() APIs? That =
is
> > > > not the case yet, so you had to then add those aio_context_lock() c=
alls
> > > > back in elsewhere. This approach introduces unnecessary risk. I thi=
nk we
> > > > should wait until blk_*()/bdrv_*() no longer requires the caller to=
 hold
> > > > the AioContext lock before applying this series.
> > >=20
> > > In general I'm in favor of pushing the lock further down into smaller=
 and
> > > smaller critical sections; it's a good approach to make further audit=
s
> > > easier until it's "obvious" that the lock is unnecessary.  I haven't =
yet
> > > reviewed Emanuele's patches to see if this is what he's doing where h=
e's
> > > adding the acquire/release calls, but that's my understanding of both=
 his
> > > cover letter and your reply.
> >=20
> > The problem is the unnecessary risk. We know what the goal is for
> > blk_*()/bdrv_*() but it's not quite there yet. Does making changes in
> > block jobs help solve the final issues with blk_*()/bdrv_*()?
>=20
> Correct me if I am wrong, but it seems to me that the bdrv_*()/blk_*()
> operation mostly take care of building, modifying and walking the bds gra=
ph.
> So since graph nodes can have multiple AioContext, it makes sense that we
> have a lock when modifying the graph, right?
>=20
> If so, we can simply try to replace the AioContext lock with a graph lock=
,
> or something like that. But I am not sure of this.

Block graph manipulation (all_bdrv_states and friends) requires the BQL.
It has always been this way.

This raises the question: if block graph manipulation is already under
the BQL and BlockDriver callbacks don't need the AioContext anymore, why
are aio_context_acquire() calls still needed in block jobs?

AIO_WAIT_WHILE() requires that AioContext is acquired according to its
documentation, but I'm not sure that's true anymore. Thread-safe/atomic
primitives are used by AIO_WAIT_WHILE(), so as long as the condition
being waited for is thread-safe too it should work without the
AioContext lock.

Back to my comment about unnecessary risk, pushing the lock down is a
strategy for exploring the problem, but I'm not sure those intermediate
commits need to be committed to qemu.git/master because of the time
required to review them and the risk of introducing (temporary) bugs.
Maybe there's a benefit to this patch series that I've missed?

Stefan

--y1IOG8/AdzCW3Phf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDtkL4ACgkQnKSrs4Gr
c8jjTwf+NU46tVsFKcImyMjRwabnPT/DNkeYqxKPq71h/G4QKPfwGWVdY549wO0Q
ToAxBDNAenlOcLMVScZVQB/5U+wSKasDmVDsNjy8OYfUb/AF4VzpBugC3AaqdEBI
R2Dv/yYjRr3pWmaYxhBTJoUHmg+4PzNxfe2pGUYNK9Je5+8nrM2YrJdXCvew24IK
kpSiJDzagXyj9QQ8xKi2gop+GGcnKuXu/7IK0+F+FmOMwTbMfYkhumwsnhMxsNa1
7FyLe0AXTcx+DiTvv5ZMNIDVqHTxoDQHp7Jx3lFvU1SVTz9Kyj3aeq+QuwwPHgaK
aTS0uEoCwANCxaeEE11ZHe0AhP4Gfw==
=BD10
-----END PGP SIGNATURE-----

--y1IOG8/AdzCW3Phf--


