Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91498645AC1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:23:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uKg-0007Xu-KR; Wed, 07 Dec 2022 08:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKe-0007X1-Bs
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKc-0006PH-9K
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TS0upcXIaoQ1IY8CvO43PrkRgILr0MoOHME6IjZmm1U=;
 b=S1EU+SZbQwIrPNJxj7nM/10QDsesmnmiXb/QQkeYPTf60flreLM2EqepVsH3Zhe0OmSqKd
 a6xeqSHjmMZgPkZULjJN6PSGyacu6YS2jTjYlFxb4gqT+ZW83HVv/ONf6P/gtX1ckxHpbB
 M9OH1GsbpxjftuKmFlz+Gq9ASFaVrd0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-7LFiYM5ZPe6jC0FJYgoT1Q-1; Wed, 07 Dec 2022 08:19:22 -0500
X-MC-Unique: 7LFiYM5ZPe6jC0FJYgoT1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECF91185A79C;
 Wed,  7 Dec 2022 13:19:21 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96C431121314;
 Wed,  7 Dec 2022 13:19:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 00/18] block: Introduce a block graph rwlock
Date: Wed,  7 Dec 2022 14:18:20 +0100
Message-Id: <20221207131838.239125-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series supersedes the first half of Emanuele's "Protect the block
layer with a rwlock: part 1". It introduces the basic infrastructure for
protecting the block graph (specifically parent/child links) with a
rwlock. Actually taking the reader lock in all necessary places is left
for future series.

Compared to Emanuele's series, this one adds patches to make use of
clang's Thread Safety Analysis (TSA) feature in order to statically
check at compile time that the places where we assert that we hold the
lock actually do hold it. Once we cover all relevant places, the check
can be extended to verify that all accesses of bs->children and
bs->parents hold the lock.

For reference, here is the more detailed version of our plan in
Emanuele's words from his series:

    The aim is to replace the current AioContext lock with much
    fine-grained locks, aimed to protect only specific data. Currently
    the AioContext lock is used pretty much everywhere, and it's not
    even clear what it is protecting exactly.

    The aim of the rwlock is to cover graph modifications: more
    precisely, when a BlockDriverState parent or child list is modified
    or read, since it can be concurrently accessed by the main loop and
    iothreads.

    The main assumption is that the main loop is the only one allowed to
    perform graph modifications, and so far this has always been held by
    the current code.

    The rwlock is inspired from cpus-common.c implementation, and aims
    to reduce cacheline bouncing by having per-aiocontext counter of
    readers.  All details and implementation of the lock are in patch 2.

    We distinguish between writer (main loop, under BQL) that modifies
    the graph, and readers (all other coroutines running in various
    AioContext), that go through the graph edges, reading ->parents
    and->children.  The writer (main loop)  has an "exclusive" access,
    so it first waits for current read to finish, and then prevents
    incoming ones from entering while it has the exclusive access.  The
    readers (coroutines in multiple AioContext) are free to access the
    graph as long the writer is not modifying the graph.  In case it is,
    they go in a CoQueue and sleep until the writer is done.

In this and following series, we try to follow the following locking
pattern:

- bdrv_co_* functions that call BlockDriver callbacks always expect
  the lock to be taken, therefore they assert.

- blk_co_* functions are called from external code outside the block
  layer, which should not have to care about the block layer's
  internal locking. Usually they also call blk_wait_while_drained().
  Therefore they take the lock internally.

The long term goal of this series is to eventually replace the
AioContext lock, so that we can get rid of it once and for all.

Emanuele Giuseppe Esposito (7):
  graph-lock: Implement guard macros
  async: Register/unregister aiocontext in graph lock list
  block: wrlock in bdrv_replace_child_noperm
  block: remove unnecessary assert_bdrv_graph_writable()
  block: assert that graph read and writes are performed correctly
  block-coroutine-wrapper.py: introduce annotations that take the graph
    rdlock
  block: use co_wrapper_mixed_bdrv_rdlock in functions taking the rdlock

Kevin Wolf (10):
  block: Factor out bdrv_drain_all_begin_nopoll()
  Import clang-tsa.h
  clang-tsa: Add TSA_ASSERT() macro
  clang-tsa: Add macros for shared locks
  configure: Enable -Wthread-safety if present
  test-bdrv-drain: Fix incorrrect drain assumptions
  block: Fix locking in external_snapshot_prepare()
  graph-lock: TSA annotations for lock/unlock functions
  Mark assert_bdrv_graph_readable/writable() GRAPH_RD/WRLOCK
  block: GRAPH_RDLOCK for functions only called by co_wrappers

Paolo Bonzini (1):
  graph-lock: Introduce a lock to protect block graph operations

 configure                              |   1 +
 block/coroutines.h                     |  19 +-
 include/block/aio.h                    |   9 +
 include/block/block-common.h           |   9 +-
 include/block/block-global-state.h     |   1 +
 include/block/block-io.h               |  53 +++--
 include/block/block_int-common.h       |  24 +--
 include/block/block_int-global-state.h |  17 --
 include/block/block_int.h              |   1 +
 include/block/graph-lock.h             | 280 +++++++++++++++++++++++++
 include/qemu/clang-tsa.h               | 114 ++++++++++
 block.c                                |  24 ++-
 block/graph-lock.c                     | 275 ++++++++++++++++++++++++
 block/io.c                             |  21 +-
 blockdev.c                             |   4 +
 stubs/graph-lock.c                     |  10 +
 tests/unit/test-bdrv-drain.c           |  18 ++
 util/async.c                           |   4 +
 scripts/block-coroutine-wrapper.py     |  12 ++
 block/meson.build                      |   1 +
 stubs/meson.build                      |   1 +
 21 files changed, 820 insertions(+), 78 deletions(-)
 create mode 100644 include/block/graph-lock.h
 create mode 100644 include/qemu/clang-tsa.h
 create mode 100644 block/graph-lock.c
 create mode 100644 stubs/graph-lock.c

-- 
2.38.1


