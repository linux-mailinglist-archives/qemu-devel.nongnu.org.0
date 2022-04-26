Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0B450F6AD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 10:59:08 +0200 (CEST)
Received: from localhost ([::1]:40510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njH2J-0007ek-Pg
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 04:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGux-0006uW-Ds
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGur-0000d3-S7
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mt4Dwo5d1uyoLh80y129epnQLPmHPaI+RxaIAXCwU1Q=;
 b=F2eYEsQmlacpQpiHzBhv958UwFkDFFqSkLNgLgVKmqIBYF/woXGUCuV8obv3Ioo9cQKZ7m
 Lx7pcjvTHCJWx8DvD3uBRDApM0TR7ZLPjQtTa7BXFFuSGNjl7mxkkwUcxUnk6VEFFsHAvw
 gaQloCuQhqxYJsVJHVIYj57iYs4b5l0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-bY9y2uKtO_SMeILOb-NBxw-1; Tue, 26 Apr 2022 04:51:18 -0400
X-MC-Unique: bY9y2uKtO_SMeILOb-NBxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A573F29ABA06;
 Tue, 26 Apr 2022 08:51:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C6B44047D3B;
 Tue, 26 Apr 2022 08:51:17 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 0/8] Removal of AioContext lock,
 bs->parents and ->children: new rwlock
Date: Tue, 26 Apr 2022 04:51:06 -0400
Message-Id: <20220426085114.199647-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a new attempt to replace the need to take the AioContext lock to
protect graph modifications. In particular, we aim to remove
(or better, substitute) the AioContext around bdrv_replace_child_noperm,
since this function changes BlockDriverState's ->parents and ->children
lists.

In the previous version, we decided to discard using subtree_drains to
protect the nodes, for different reasons: for those unfamiliar with it,
please see https://patchew.org/QEMU/20220301142113.163174-1-eesposit@redhat.com/

In this new attempt, we introduce a custom rwlock implementation.
This is inspired from cpus-common.c implementation, and aims to
reduce cacheline bouncing by having per-aiocontext counter of readers.
All details and implementation of the lock are in patch 3.

We distinguish between writer (main loop, under BQL) that modifies the
graph, and readers (all other coroutines running in various AioContext),
that go through the graph edges, reading ->parents and->children.
The writer (main loop)  has an "exclusive" access, so it first waits for
current read to finish, and then prevents incoming ones from
entering while it has the exclusive access.
The readers (coroutines in multiple AioContext) are free to
access the graph as long the writer is not modifying the graph.
In case it is, they go in a CoQueue and sleep until the writer
is done.

Patch 1 and 2 are in preparation for the lock, and fix bugs or missing
cases that popped out while implementing this lock.
Patch 3-7 implement and use the graph and assertions.
Note that unfortunately assert_graph_readable is not very efficient,
because it iterates through the list of all AioContexts to get the total number of readers.
For now we will use it only for debugging purposes and to be sure all
places are properly protected, but eventually we might want to disable it.

Patch 8 is an example of usage: as you can see, it is not essential that
the right coroutine takes the rdlock, but just that it is taken
somewhere. Otherwise the writer is not aware of any readers, and can write
while others are reading.

Next step is the most complex one: figure where to put the rdlocks.
While wrlock is easy, rdlock should ideally be:
- not recursive, otherwise it is not very intuitive
- not everywhere, prefereably only on the top caller of recursion trees
- still manage to protect ->parents and ->children reads.

Luckly, most of the cases where we recursively go through a graph are
the BlockDriverState callback functions in block_int-common.h
In order to understand what to protect, I categorized the callbacks in
block_int-common.h depending on the type of function that calls them:

1) If the caller is a generated_co_wrapper, this function must be
   protected by rdlock. The reason is that generated_co_wrapper create
   coroutines that run in the given bs AioContext, so it doesn't matter
   if we are running in the main loop or not, the coroutine might run
   in an iothread.
2) If the caller calls it directly, and has the GLOBAL_STATE_CODE() macro,
   then the function is safe. The main loop is the writer and thus won't
   read and write at the same time.
3) If the caller calls it directly, but has not the GLOBAL_STATE_CODE()
   macro, then we need to check the callers and see case-by-case if the
   caller is in the main loop, if it needs to take the lock, or delegate
   this duty to its caller (to reduce the places where to take it).

I used the vrc script (https://github.com/bonzini/vrc) to get help finding
all the callers of a callback. Using its filter function, I can
omit all functions protected by the added lock to avoid having duplicates
when querying for new callbacks.


Emanuele Giuseppe Esposito (8):
  aio_wait_kick: add missing memory barrier
  coroutine-lock: release lock when restarting all coroutines
  block: introduce a lock to protect graph operations
  async: register/unregister aiocontext in graph lock list
  block.c: wrlock in bdrv_replace_child_noperm
  block: assert that graph read and writes are performed correctly
  graph-lock: implement WITH_GRAPH_RDLOCK_GUARD and GRAPH_RDLOCK_GUARD
    macros
  mirror: protect drains in coroutine with rdlock

 block.c                                |  39 ++++-
 block/block-backend.c                  |   6 +-
 block/graph-lock.c                     | 227 +++++++++++++++++++++++++
 block/meson.build                      |   1 +
 block/mirror.c                         |   6 +
 include/block/aio.h                    |   9 +
 include/block/block_int-common.h       |   8 +-
 include/block/block_int-global-state.h |  17 --
 include/block/block_int.h              |   1 +
 include/block/graph-lock.h             | 101 +++++++++++
 include/qemu/coroutine.h               |  10 ++
 util/aio-wait.c                        |   3 +-
 util/async.c                           |   4 +
 util/meson.build                       |   1 +
 util/qemu-coroutine-lock.c             |  26 ++-
 15 files changed, 413 insertions(+), 46 deletions(-)
 create mode 100644 block/graph-lock.c
 create mode 100644 include/block/graph-lock.h

-- 
2.31.1


