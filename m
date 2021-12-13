Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C69472FF6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 16:01:15 +0100 (CET)
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwmpG-0000Op-Op
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 10:01:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwmhV-0008IR-JT
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:53:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mwmhQ-0001Dy-TS
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 09:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639407183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YyUAr5MyOfbiaY6R9D2xK/d5sCFgq/0XwAYicKBw0bQ=;
 b=Z2DduF72Ex4CcC7pzGP18HpKeSh0dMdUsC6VAIz+e+XOitLP/lGeEwR9fpolbgnzGNpZmW
 JEC+SIrfMdR2KTmhFhx4o5gqoeyyf/sDqleZuPOiwlvetmAeczX+gO4RSwYHKfLUVmHqR4
 CdcAM3VqQkGwvupen08/9sqIY0mYZoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-KsAmJSKeMdK8xoOmZh59VA-1; Mon, 13 Dec 2021 09:53:02 -0500
X-MC-Unique: KsAmJSKeMdK8xoOmZh59VA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5652D1006AA1;
 Mon, 13 Dec 2021 14:53:01 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E84AA5E24E;
 Mon, 13 Dec 2021 14:53:00 +0000 (UTC)
Date: Mon, 13 Dec 2021 14:52:59 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 0/6] Removal of Aiocontext lock and usage of subtree
 drains in aborted transactions
Message-ID: <YbdeS/q3L1mBmEyT@stefanha-x1.localdomain>
References: <20211213104014.69858-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211213104014.69858-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nNzSLwbMnDDa0Oqv"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nNzSLwbMnDDa0Oqv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2021 at 05:40:08AM -0500, Emanuele Giuseppe Esposito wrote:
> Hello everyone,
>=20
> As you know already, my current goal is to try to remove the AioContext l=
ock from the QEMU block layer.
> Currently the AioContext is used pretty much throughout the whole block l=
ayer, it is a little bit confusing to understand what it exactly protects, =
and I am starting to think that in some places it is being taken just becau=
se of the block API assumptions.
> For example, some functions like AIO_WAIT_WHILE() release the lock with t=
he assumption that it is always held, so all callers must take it just to a=
llow the function to release it.
>=20
> Removing the aiocontext lock is not a straightforward task: the first ste=
p is to understand which function is running in the main loop thus under th=
e BQL (Big Qemu Lock) and which is used by the iothreads. We call the forme=
r category global state (GS) and the latter I/O.
>=20
> The patch series "block layer: split block APIs in global state and I/O" =
aims to do that. Once we can at least (roughly) distinguish what is called =
by iothreads and what from the main loop, we can start analyzing what needs=
 protection and what doesn't. This series is particularly helpful because b=
y splitting the API we know where each function runs, so it helps us identi=
fying the cases where both the main loop and iothreads read/write the same =
value/field (and thus need protection) and cases where the same function is=
 used only by the main loop for example, so it shouldn't need protection.
> For example, if some BlockDriverState field is read by I/O threads but mo=
dified in a GS function, this has to be protected in some way.
>=20
> Another series I posted, "job: replace AioContext lock with job_mutex", p=
rovides a good example on how the AioContext lock can be removed and simply=
 replaced by a fine grained lock.
>=20
> Another way to have thread safety in the AioContext is to rely to the fac=
t that in some cases, writings to a field are always done in the main loop =
*and* under drains. In this way, we know that no request is coming to the I=
/O threads, so we can safely modify the fields.
>=20
> This is exactly what assert_bdrv_graph_writable() introduced in the block=
 API splitup (patch 9 in v5) is there for, even though it is currently not =
checking for drains but only for main loop.
>=20
> We could then use this assertion to effectively prove that some writes on=
 a field/list are safe, and completely get rid of the aiocontext lock.
> However, this is not an easy task: for example, if we look at the ->child=
ren and ->parents lists in BlockDriverState we can see that they are modifi=
ed in BQL functions, but also read in I/O.
> We therefore ideally need to add some drains (because in the current stat=
e assert_bdrv_graph_writable() with drains would fail).
>=20
> The main function that modifies the ->children and ->parent lists is bdrv=
_replace_child_noperm.
> So ideally we would like to drain both the old_bs and new_bs (the functio=
n moves a BdrvChild from one bs to another, modifying the respective lists)=
.
>=20
> A couple of question to answer:
>=20
> - which drain to use? My answer would be bdrv_subtree_drain_* class of fu=
nctions, because it takes care of draining the whole graph of the node, whi=
le bdrv_drained_* does not cover the child of the given node.
> This theoretically simplifies the draining requirements, as we can just i=
nvoke subtree_drain_* on the two bs that are involved in bdrv_replace_child=
_noperm, and we should guarantee that the write is safe.

Off-topic: I don't understand the difference between the effects of
bdrv_drained_begin() and bdrv_subtree_drained_begin(). Both call
aio_disable_external(aio_context) and aio_poll(). bdrv_drained_begin()
only polls parents and itself, while bdrv_subtree_drained_begin() also
polls children. But why does that distinction matter? I wouldn't know
when to use one over the other.

On-topic: aio_disable_external() does not notify the AioContext. We
probably get away with it since the AioContext lock is currently held,
but it will be necessary to notify the AioContext so it disables
external handlers when the lock is not held:

  static inline void aio_disable_external(AioContext *ctx)
  {
      qatomic_inc(&ctx->external_disable_cnt);
      <--- missing aio_notify() since the AioContext needs to
           re-evaluate handlers
  }

> - where to add these drains? Inside the function or delegate to the calle=
r?
> According to d736f119da (and my unit tests), it is safe to modify the gra=
ph even side a bdrv_subtree_drained_begin/end() section.
> Therefore, wrapping each call of bdrv_replace_child_noperm with a subtree=
_drain_begin/end is (or seems) perfectly valid.
>=20
> Problems met so far (mostly solved):
>=20
> 1) consider that the drains use BDRV_WAIT_WHILE, which in turns unlocks t=
he AioContext lock. This can create problems because not all caller take th=
e lock, but could be easily fixed by introducing BDRV_WAIT_WHILE_UNLOCKED a=
nd bdrv_subtree_drain_begin/end_unlocked functions, but when running unit t=
ests it is easy to find cases where the aiocontext is not always held. For =
example, in test_blockjob_common_drain_node (tests/unit/test-bdrv-drain.c):
>=20
>     blk_insert_bs(blk_target, target, &error_abort);
>     [...]
>     aio_context_acquire(ctx);
>     tjob =3D block_job_create("job0", &test_job_driver, NULL, src,
>                             0, BLK_PERM_ALL,
>                             0, 0, NULL, NULL, &error_abort);
>=20
> Both functions eventually call bdrv_replace_child_noperm, but none one wi=
th the aiocontext lock held, another without.
> In this case the solution is easy and helpful for our goal, since we are =
reducing the area that the aiocontext lock covers.
>=20
> 2) Some tests like tests/unit/test-bdrv-drain.c do not expect additional =
drains. Therefore we might have cases where a specific drain callback (in t=
his case used for testing) is called way before it is expected to do so, be=
cause of the additional subtree drains.
> Again also here we can simply modify the test to use the specific callbac=
k only when we actually need to use it. The test I am referring to is test_=
detach_by_driver_cb().

I'm not sure what this means but some tests make assumptions about
internals. They are fragile. Modifying the test sounds reasonable.

>=20
> 3) Transactions. I am currently struggling a lot with this, and need a li=
ttle bit of help trying to figure out what is happening.
> Basically the test test_update_perm_tree() in tests/unit/test-bdrv-graph-=
mod.c tests for permissions, but indirectly calls also the abort() procedur=
e of the transactions.
>=20
> The test performs the following (ignoring the permissions):
> 1. create a blockbackend blk
> 2. create a BlockdriverState "node" and "filter"
> 3. create BdrvChild edge "root" that represents blk -> node
> 4. create BdrvChild edge "child" that represents filter -> node
>=20
> Current graph:
> blk ------ root -------v
>                       node
> filter --- child ------^
>=20
> 5a. bdrv_append: modify "root" child to point blk -> filter
> 5b. bdrv_append: create BdrvChild edge "backing" that represents filter -=
> node (redundant edge)
> 5c. bdrv_append: refresh permissions, and as expected make bdrv_append fa=
il.
>=20
> Current graph:
> blk ------- root --------v
>                        filter
> node <---- child --------+
>  ^-------- backing ------+
>=20
> At this point, the transaction procedure takes place to undo everything, =
and firstly it restores the BdrvChild "root" to point again to node, and th=
en deletes "backing".
> The problem here is that despite d736f119da, in this case in bdrv_replace=
_child_abort() moving an edge under subtree_drain* has side effects, leavin=
g the quiesce_counter, recursive_counter and parent_counter of the various =
bs in the graph are not to zero. This is obviously due to edge movement bet=
ween subtree_drained_begin and end, but I am not sure why the drain_saldo m=
echanism implemented in bdrv_replace_child_noperm is not effective in this =
case.
>=20
> The failure is actually on the next step of the aborted transaction, bdrv=
_attach_child_common_abort(), but the root cause
> is due to the non-zero counters left by bdrv_replace_child_abort().
>=20
> Error message:
> test-bdrv-graph-mod: ../block/io.c:63: bdrv_parent_drained_end_single_no_=
poll: Assertion `c->parent_quiesce_counter > 0' failed.
>=20
> It is worth mentioning also that I know a way to fix this case,
> and it is simply to not call
> bdrv_subtree_drained_begin/end_unlocked(s->child->bs);
> where s->child->bs is the filter bs in bdrv_replace_child_abort().
> In this specific case, it would work correctly, leaving all counters
> to zero once the drain ends, but I think it is not correct when/if
> the BdrvChild is pointing into another separated graph, because we
> would need to drain also that.
>=20
> I even tried to reproduce this case with an unit test, but adding subtree=
_drain_begin/end around bdrv_append does not reproduce this issue.
>=20
> So the questions in this RFC are:
> - is this the right approach to remove the aiocontext lock? I think so

Yes, I think using drained sections to quiesce I/O is the right choice.

> - are there better options?

I/O needs to quiesce, at least in some cases, so I don't think we can
avoid drained sections. It may be possible to implement other solutions
on a case-by-case basis, but it would be more complex and still wouldn't
get rid of some of the drained sections that are definitely needed.

> - most importantly, any idea or suggestion on why this happens,
>   and why when adding drains the quiesce counters are not properly restor=
ed in abort()?

Maybe Kevin has an idea here. He wrote bdrv_subtree_drained_begin().

Stefan

--nNzSLwbMnDDa0Oqv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3XksACgkQnKSrs4Gr
c8izNAf/b38uSy3PDirGdq51ZVjm/TDtYG+wKiMohCXZO6wHlp5Jm/bvfajFNLVO
/t1UsoTkPb8GiCTYFTffYhBOLqRRvuL0M/a3KFgnXEPOdP97iMG8CUjcpLfQ5gFQ
4tljsjjdTBQHeMMxoCIWe5ubYbC3mp1FNHWahVDsVleVh/Ll+Ue2YXLpYrXJUsUg
vXo6V266TCPmVDfqTu7zgNSpGOVig7gjD4t7IHMq4e4um9TRjtTvCWCn/rg2zqH1
v0BDtcP82P5l0twaxfMg3Pr0MP2jaQT76VVn/7D1SxzOg1XnSDouci7d7i5unqcV
Rt9qkNoeTHzWjWh4JDjQvbP1p76a4w==
=HW3d
-----END PGP SIGNATURE-----

--nNzSLwbMnDDa0Oqv--


