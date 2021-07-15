Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6833C9F84
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 15:31:54 +0200 (CEST)
Received: from localhost ([::1]:51040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m41Sz-00081G-Ky
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 09:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m41R7-00077N-Nu
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:29:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m41R2-0006q8-UY
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626355791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G8lt4Ise1CBwTsz8E9hekxE6ViGLu/5KOKdOo/6nFIs=;
 b=Cb0d3hu5kL/q/tEDb79x5yO223lHIePKbf+nyKeqGEQpaxloauKBhTeRBMLrzXt0e0i0BQ
 XShngFRCjzr2Vy6LoY2nFymHFo9G+vab/bp6sOoAmAohXjUOb116gIHwn+svIBSxnvO2x7
 N/fyh9uk1Gds3OjKnJubZcio6ujHeno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-GtBR6qwwMAmq6xJDvsuqKQ-1; Thu, 15 Jul 2021 09:29:47 -0400
X-MC-Unique: GtBR6qwwMAmq6xJDvsuqKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99976804140;
 Thu, 15 Jul 2021 13:29:45 +0000 (UTC)
Received: from localhost (ovpn-114-184.ams2.redhat.com [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21D335D6B1;
 Thu, 15 Jul 2021 13:29:44 +0000 (UTC)
Date: Thu, 15 Jul 2021 14:29:44 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH 0/6] job: replace AioContext lock with job_mutex
Message-ID: <YPA4SBzoS+BdmueJ@stefanha-x1.localdomain>
References: <20210707165813.55361-1-eesposit@redhat.com>
 <YObVSuBjCEwSMvu7@stefanha-x1.localdomain>
 <6dadca95-632a-61fa-4a91-c2df25e19b52@redhat.com>
 <YOb31YOF8Q3t9RoK@stefanha-x1.localdomain>
 <629fb077-9d0a-7c33-0b2e-d055c0493005@redhat.com>
 <YO2QvuBqbw58fuo/@stefanha-x1.localdomain>
 <37a92342-37a1-151b-7fbd-31604a792938@virtuozzo.com>
 <YO3BjpNHumrPUab1@stefanha-x1.localdomain>
 <a19c12ab-6055-5ebd-6afd-1cee7ff20e13@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <a19c12ab-6055-5ebd-6afd-1cee7ff20e13@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h9E3XSSqGqfp8+HT"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--h9E3XSSqGqfp8+HT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 15, 2021 at 03:35:37PM +0300, Vladimir Sementsov-Ogievskiy wrot=
e:
> 13.07.2021 19:38, Stefan Hajnoczi wrote:
> > On Tue, Jul 13, 2021 at 06:18:39PM +0300, Vladimir Sementsov-Ogievskiy =
wrote:
> > > 13.07.2021 16:10, Stefan Hajnoczi wrote:
> > > > On Mon, Jul 12, 2021 at 10:41:46AM +0200, Emanuele Giuseppe Esposit=
o wrote:
> > > > >=20
> > > > >=20
> > > > > On 08/07/2021 15:04, Stefan Hajnoczi wrote:
> > > > > > On Thu, Jul 08, 2021 at 01:32:12PM +0200, Paolo Bonzini wrote:
> > > > > > > On 08/07/21 12:36, Stefan Hajnoczi wrote:
> > > > > > > > > What is very clear from this patch is that it
> > > > > > > > > is strictly related to the brdv_* and lower level calls, =
because
> > > > > > > > > they also internally check or even use the aiocontext loc=
k.
> > > > > > > > > Therefore, in order to make it work, I temporarly added s=
ome
> > > > > > > > > aiocontext_acquire/release pair around the function that
> > > > > > > > > still assert for them or assume they are hold and tempora=
rly
> > > > > > > > > unlock (unlock() - lock()).
> > > > > > > >=20
> > > > > > > > Sounds like the issue is that this patch series assumes Aio=
Context locks
> > > > > > > > are no longer required for calling the blk_*()/bdrv_*() API=
s? That is
> > > > > > > > not the case yet, so you had to then add those aio_context_=
lock() calls
> > > > > > > > back in elsewhere. This approach introduces unnecessary ris=
k. I think we
> > > > > > > > should wait until blk_*()/bdrv_*() no longer requires the c=
aller to hold
> > > > > > > > the AioContext lock before applying this series.
> > > > > > >=20
> > > > > > > In general I'm in favor of pushing the lock further down into=
 smaller and
> > > > > > > smaller critical sections; it's a good approach to make furth=
er audits
> > > > > > > easier until it's "obvious" that the lock is unnecessary.  I =
haven't yet
> > > > > > > reviewed Emanuele's patches to see if this is what he's doing=
 where he's
> > > > > > > adding the acquire/release calls, but that's my understanding=
 of both his
> > > > > > > cover letter and your reply.
> > > > > >=20
> > > > > > The problem is the unnecessary risk. We know what the goal is f=
or
> > > > > > blk_*()/bdrv_*() but it's not quite there yet. Does making chan=
ges in
> > > > > > block jobs help solve the final issues with blk_*()/bdrv_*()?
> > > > >=20
> > > > > Correct me if I am wrong, but it seems to me that the bdrv_*()/bl=
k_*()
> > > > > operation mostly take care of building, modifying and walking the=
 bds graph.
> > > > > So since graph nodes can have multiple AioContext, it makes sense=
 that we
> > > > > have a lock when modifying the graph, right?
> > > > >=20
> > > > > If so, we can simply try to replace the AioContext lock with a gr=
aph lock,
> > > > > or something like that. But I am not sure of this.
> > > >=20
> > > > Block graph manipulation (all_bdrv_states and friends) requires the=
 BQL.
> > > > It has always been this way.
> > > >=20
> > > > This raises the question: if block graph manipulation is already un=
der
> > > > the BQL and BlockDriver callbacks don't need the AioContext anymore=
, why
> > >=20
> > > I don't believe that block drivers are thread-safe now. They have som=
e mutexes.. But who make an audit of thread-safety?
> >=20
> > Emanuele :)
> >=20
> > FWIW I took a look at the stream, mirror, and backup jobs today and
> > couldn't find anything that's unsafe after this series. I was expecting
> > to find issues but I think Emanuele and Paolo have taken care of them.
>=20
>=20
> Hmm, do you mean that all jobs are thread-safe?
>=20
> Looking at the mirror, what protects s->ops_in_flight for example? It's a=
ccessed from job coroutines and from mirror_top filter write operation.

You're right. I missed the bdrv_mirror_top BlockDriver:

.pwrite_zeroes -> bdrv_mirror_top_pwrite_zeroes -> active_write_prepare -> =
QTAILQ_INSERT_TAIL(&s->ops_in_flight, op, next)

This is not thread-safe. A CoMutex is needed here to protect
MirrorBSDOpaque fields.

Stefan

--h9E3XSSqGqfp8+HT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDwOEgACgkQnKSrs4Gr
c8jEvAf6A7fAWgT/Qb6R2S4qE8y2640v46WBRbRK/eTKYGT0m/fM2RrZS/3njxxI
/2WMiymubMXHvBfdPLWfhSS2o4FuPUtVQ6aSaLGSC3ggoBHtMV/eZ1h5qBeN8KAR
C6Qha+fhMwUAfDK27wuLBdcJLTDVfF11ncAlnlmOvT9OIm5qq3VbvwEFy/CXDXAD
thZ8/5hqU1qwPGDcoi+yF57TawogmZGwfzfnZzU9BM9HtyCcJchI2JrJaqJEcgGh
48kN5rNx7JPVrXPwg6HT4pXN5/8FRfxlJYKiADk9o9xboa9FKjRf/eOn2t163sDH
Rruz26N8Qa9rkgdiRNaSzSg5EQba0w==
=nRWm
-----END PGP SIGNATURE-----

--h9E3XSSqGqfp8+HT--


