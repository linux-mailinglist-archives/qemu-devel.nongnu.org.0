Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C1C4C8DB4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:29:09 +0100 (CET)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3Uy-0003QN-Nb
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:29:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3NX-0000RW-S1
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:21:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nP3NT-00072Q-6i
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:21:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646144481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iwSfTeencrjAy04FVT3lWzn/gzpVq7q9LXPiWIOu0GI=;
 b=FqBOISsd3vlBAcEgw10E0bjHQrHTjPP2h11UJtbrhvGZ9v6bVSiBEKmdqHv1uJbPoK6Ah2
 vceHzmtFLQ3YgzecJ3z+QH9RsIDuvN3oqJJ7aNVe4ldaavfYrF62ao36A0a7cGCC6Mk+bx
 /CZU7awhMEgMuGCieBtkVytTMVoDkak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-ztS8D9X_PTelpOWcCZb8tQ-1; Tue, 01 Mar 2022 09:21:18 -0500
X-MC-Unique: ztS8D9X_PTelpOWcCZb8tQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90CC4801DDB;
 Tue,  1 Mar 2022 14:21:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF2108497D;
 Tue,  1 Mar 2022 14:21:15 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 0/5] Removal of AioContext lock,
 bs->parents and ->children: proof of concept
Date: Tue,  1 Mar 2022 09:21:08 -0500
Message-Id: <20220301142113.163174-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This serie tries to provide a proof of concept and a clear explanation
on why we need to use drains (and more precisely subtree_drains)
to replace the aiocontext lock, especially to protect BlockDriverState
->children and ->parent lists.

Just a small recap on the key concepts:
* We split block layer APIs in "global state" (GS), "I/O", and
"global state or I/O".
  GS are running in the main loop, under BQL, and are the only
  one allowed to modify the BlockDriverState graph.

  I/O APIs are thread safe and can run in any thread

  "global state or I/O" are essentially all APIs that use
  BDRV_POLL_WHILE. This is because there can be only 2 threads
  that can use BDRV_POLL_WHILE: main loop and the iothread that
  runs the aiocontext.

* Drains allow the caller (either main loop or iothread running
the context) to wait all in_flights requests and operations
of a BDS: normal drains target a given node and is parents, while
subtree ones also include the subgraph of the node. Siblings are
not affected by any of these two kind of drains.
After bdrv_drained_begin, no more request is allowed to come
from the affected nodes. Therefore the only actor left working
on a drained part of the graph should be the main loop.

What do we intend to do
-----------------------
We want to remove the AioContext lock. It is not 100% clear on how
many things we are protecting with it, and why.
As a starter, we want to protect BlockDriverState ->parents and
->children lists, since they are read by main loop and I/O but
only written by main loop under BQL. The function that modifies
these lists is bdrv_replace_child_common().

How do we want to do it
-----------------------
We individuated as ideal subtitute of AioContext lock
the subtree_drain API. The reason is simple: draining prevents the iothread to read or write the nodes, so once the main loop finishes
executing bdrv_drained_begin() on the interested graph, we are sure that
the iothread is not going to look or even interfere with that part of the graph.
We are also sure that the only two actors that can look at a specific
BlockDriverState in any given context are the main loop and the
iothread running the AioContext (ensured by "global state or IO" logic).

Why use _subtree_ instead of normal drain
-----------------------------------------
A simple drain "blocks" a given node and all its parents.
But it doesn't touch the child.
This means that if we use a simple drain, a child can always
keep processing requests, and eventually end up calling itself
bdrv_drained_begin, ending up reading the parents node while the main loop
is modifying them. Therefore a subtree drain is necessary.

Possible scenarios
-------------------
Keeping in mind that we can only have an iothread and the main loop
draining on a certain node, we could have:

main loop successfully drains and then iothread tries to drain:
  impossible scenario, as iothread is already stopped once main
  successfully drains.

iothread successfully drains and then main loop drains:
  should not be a problem, as:
  1) the iothread should be already "blocked" by its own drain
  2) main loop would still wait for it to completely block
  There is the issue of mirror overriding such scenario to avoid
  having deadlocks, but that is handled in the next section.

main loop and iothread try to drain together:
  As above, this case doens't really matter. As long as
  bdrv_drained_begin invariant is respected, the main loop will
  continue only once the iothread is "blocked" on that part of the graph.

A note on iothread draining
---------------------------
Theoretically draining from an iothread should not be possible,
as the iothread would be scheduling a bh in the main loop waiting
for itself to stop, even though it is not yet stopped since it is waiting for the bh.

This is what would happen in the tests in patch 5 if .drained_poll
was not implemented.

Therefore, one solution is to use .drained_poll callback in BlockJobDriver.
This callback overrides the default job poll() behavior, and
allows the polling condition to stop waiting for the job.
It is actually used only in mirror.
This however breaks bdrv_drained_begin invariant, because the
iothread is not really blocked on that node but continues running.
In order to fix this, patch 4 allows the polling condition to be
used only by the iothread, and not the main loop too, preventing
the drain to return before the iothread is effectively stopped.
This is also shown in the tests in patch 5. If the fix in patch
4 is removed, then the main loop drain will return earlier and
allow the iothread to run and drain together.

The other patches in this serie are cherry-picked from the various
series I already sent, and are included here just to allow
subtree_drained_begin/end_unlocked implementation.

Emanuele Giuseppe Esposito (5):
  aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
  introduce BDRV_POLL_WHILE_UNLOCKED
  block/io.c: introduce bdrv_subtree_drained_{begin/end}_unlocked
  child_job_drained_poll: override polling condition only when in home
    thread
  test-bdrv-drain: ensure draining from main loop stops iothreads

 block/io.c                   |  48 ++++++--
 blockjob.c                   |   3 +-
 include/block/aio-wait.h     |  15 ++-
 include/block/block.h        |   7 ++
 tests/unit/test-bdrv-drain.c | 218 +++++++++++++++++++++++++++++++++++
 5 files changed, 274 insertions(+), 17 deletions(-)

-- 
2.31.1


