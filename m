Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B939E472A7D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:43:58 +0100 (CET)
Received: from localhost ([::1]:46732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwioH-0005YC-C8
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:43:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mwilb-0002qA-Ls
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:41:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mwilT-0007iP-3r
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639392060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+6SbqTFnVLm/saAoMchL/sazVtvugsCmwkYRBTDOp7U=;
 b=TeJ/UBGC64kFwjd7nvVdr9JAM9LPBy6dGVbMcfjnWUx+DCUfyOXhWJ7Gp5Wj/qb2RHlcES
 JAc0FO25ke9ts8A4P9HKinHHjNOdVBnQpEXdUpvT1PF/MqclB9bE70ntLE7HP4ms4Cpen3
 6v9cXCXAdDPvhSzfc0Of9XrRx7IHKlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-sYRGAtt9N_Osndxgtd4JCA-1; Mon, 13 Dec 2021 05:40:59 -0500
X-MC-Unique: sYRGAtt9N_Osndxgtd4JCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BE5381EE60;
 Mon, 13 Dec 2021 10:40:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E2737AB44;
 Mon, 13 Dec 2021 10:40:16 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 0/6] Removal of Aiocontext lock and usage of subtree
 drains in aborted transactions
Date: Mon, 13 Dec 2021 05:40:08 -0500
Message-Id: <20211213104014.69858-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello everyone,

As you know already, my current goal is to try to remove the AioContext lock from the QEMU block layer.
Currently the AioContext is used pretty much throughout the whole block layer, it is a little bit confusing to understand what it exactly protects, and I am starting to think that in some places it is being taken just because of the block API assumptions.
For example, some functions like AIO_WAIT_WHILE() release the lock with the assumption that it is always held, so all callers must take it just to allow the function to release it.

Removing the aiocontext lock is not a straightforward task: the first step is to understand which function is running in the main loop thus under the BQL (Big Qemu Lock) and which is used by the iothreads. We call the former category global state (GS) and the latter I/O.

The patch series "block layer: split block APIs in global state and I/O" aims to do that. Once we can at least (roughly) distinguish what is called by iothreads and what from the main loop, we can start analyzing what needs protection and what doesn't. This series is particularly helpful because by splitting the API we know where each function runs, so it helps us identifying the cases where both the main loop and iothreads read/write the same value/field (and thus need protection) and cases where the same function is used only by the main loop for example, so it shouldn't need protection.
For example, if some BlockDriverState field is read by I/O threads but modified in a GS function, this has to be protected in some way.

Another series I posted, "job: replace AioContext lock with job_mutex", provides a good example on how the AioContext lock can be removed and simply replaced by a fine grained lock.

Another way to have thread safety in the AioContext is to rely to the fact that in some cases, writings to a field are always done in the main loop *and* under drains. In this way, we know that no request is coming to the I/O threads, so we can safely modify the fields.

This is exactly what assert_bdrv_graph_writable() introduced in the block API splitup (patch 9 in v5) is there for, even though it is currently not checking for drains but only for main loop.

We could then use this assertion to effectively prove that some writes on a field/list are safe, and completely get rid of the aiocontext lock.
However, this is not an easy task: for example, if we look at the ->children and ->parents lists in BlockDriverState we can see that they are modified in BQL functions, but also read in I/O.
We therefore ideally need to add some drains (because in the current state assert_bdrv_graph_writable() with drains would fail).

The main function that modifies the ->children and ->parent lists is bdrv_replace_child_noperm.
So ideally we would like to drain both the old_bs and new_bs (the function moves a BdrvChild from one bs to another, modifying the respective lists).

A couple of question to answer:

- which drain to use? My answer would be bdrv_subtree_drain_* class of functions, because it takes care of draining the whole graph of the node, while bdrv_drained_* does not cover the child of the given node.
This theoretically simplifies the draining requirements, as we can just invoke subtree_drain_* on the two bs that are involved in bdrv_replace_child_noperm, and we should guarantee that the write is safe.

- where to add these drains? Inside the function or delegate to the caller?
According to d736f119da (and my unit tests), it is safe to modify the graph even side a bdrv_subtree_drained_begin/end() section.
Therefore, wrapping each call of bdrv_replace_child_noperm with a subtree_drain_begin/end is (or seems) perfectly valid.

Problems met so far (mostly solved):

1) consider that the drains use BDRV_WAIT_WHILE, which in turns unlocks the AioContext lock. This can create problems because not all caller take the lock, but could be easily fixed by introducing BDRV_WAIT_WHILE_UNLOCKED and bdrv_subtree_drain_begin/end_unlocked functions, but when running unit tests it is easy to find cases where the aiocontext is not always held. For example, in test_blockjob_common_drain_node (tests/unit/test-bdrv-drain.c):

    blk_insert_bs(blk_target, target, &error_abort);
    [...]
    aio_context_acquire(ctx);
    tjob = block_job_create("job0", &test_job_driver, NULL, src,
                            0, BLK_PERM_ALL,
                            0, 0, NULL, NULL, &error_abort);

Both functions eventually call bdrv_replace_child_noperm, but none one with the aiocontext lock held, another without.
In this case the solution is easy and helpful for our goal, since we are reducing the area that the aiocontext lock covers.

2) Some tests like tests/unit/test-bdrv-drain.c do not expect additional drains. Therefore we might have cases where a specific drain callback (in this case used for testing) is called way before it is expected to do so, because of the additional subtree drains.
Again also here we can simply modify the test to use the specific callback only when we actually need to use it. The test I am referring to is test_detach_by_driver_cb().

3) Transactions. I am currently struggling a lot with this, and need a little bit of help trying to figure out what is happening.
Basically the test test_update_perm_tree() in tests/unit/test-bdrv-graph-mod.c tests for permissions, but indirectly calls also the abort() procedure of the transactions.

The test performs the following (ignoring the permissions):
1. create a blockbackend blk
2. create a BlockdriverState "node" and "filter"
3. create BdrvChild edge "root" that represents blk -> node
4. create BdrvChild edge "child" that represents filter -> node

Current graph:
blk ------ root -------v
                      node
filter --- child ------^

5a. bdrv_append: modify "root" child to point blk -> filter
5b. bdrv_append: create BdrvChild edge "backing" that represents filter -> node (redundant edge)
5c. bdrv_append: refresh permissions, and as expected make bdrv_append fail.

Current graph:
blk ------- root --------v
                       filter
node <---- child --------+
 ^-------- backing ------+

At this point, the transaction procedure takes place to undo everything, and firstly it restores the BdrvChild "root" to point again to node, and then deletes "backing".
The problem here is that despite d736f119da, in this case in bdrv_replace_child_abort() moving an edge under subtree_drain* has side effects, leaving the quiesce_counter, recursive_counter and parent_counter of the various bs in the graph are not to zero. This is obviously due to edge movement between subtree_drained_begin and end, but I am not sure why the drain_saldo mechanism implemented in bdrv_replace_child_noperm is not effective in this case.

The failure is actually on the next step of the aborted transaction, bdrv_attach_child_common_abort(), but the root cause
is due to the non-zero counters left by bdrv_replace_child_abort().

Error message:
test-bdrv-graph-mod: ../block/io.c:63: bdrv_parent_drained_end_single_no_poll: Assertion `c->parent_quiesce_counter > 0' failed.

It is worth mentioning also that I know a way to fix this case,
and it is simply to not call
bdrv_subtree_drained_begin/end_unlocked(s->child->bs);
where s->child->bs is the filter bs in bdrv_replace_child_abort().
In this specific case, it would work correctly, leaving all counters
to zero once the drain ends, but I think it is not correct when/if
the BdrvChild is pointing into another separated graph, because we
would need to drain also that.

I even tried to reproduce this case with an unit test, but adding subtree_drain_begin/end around bdrv_append does not reproduce this issue.

So the questions in this RFC are:
- is this the right approach to remove the aiocontext lock? I think so
- are there better options?
- most importantly, any idea or suggestion on why this happens,
  and why when adding drains the quiesce counters are not properly restored in abort()?

This series is based on "job: replace AioContext lock with job_mutex".

Based-on: <20211104145334.1346363-1-eesposit@redhat.com>

Thank you in advance,
Emanuele

Emanuele Giuseppe Esposito (6):
  tests/unit/test-bdrv-drain.c: graph setup functions can't run in
    coroutines
  introduce BDRV_POLL_WHILE_UNLOCKED
  block/io.c: introduce bdrv_subtree_drained_{begin/end}_unlocked
  block.c: add subtree_drains where needed
  test-bdrv-drain.c: adapt test to the new subtree drains
  block/io.c: enable assert_bdrv_graph_writable

 block.c                            |  24 +++++
 block/io.c                         |  36 ++++++--
 include/block/block-global-state.h |   5 ++
 include/block/block-io.h           |   2 +
 tests/unit/test-bdrv-drain.c       | 136 ++++++++++++++++++-----------
 5 files changed, 145 insertions(+), 58 deletions(-)

-- 
2.31.1


