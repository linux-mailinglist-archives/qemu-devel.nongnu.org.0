Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F2962C032
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:56:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImo-0000dN-TX; Wed, 16 Nov 2022 08:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-0000bV-8l
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImc-0007yX-Mo
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hzuVg1JoQt1Jv9OxtU1sf1xQ6cxH/J5SAqaUbLqo/0o=;
 b=SeSCWpqy9INPiOv9HxLCtsPQfZaADV/uKS64hqhcICqQKJBMbtVajHeUYN1xV1d/oibJyO
 bO6DP4XVKTL0FEouZLpbdGb5gJrSDyevI2ULa93l1lmQHpRF3zyLkimRV/ds5/muiIBdYD
 T0ZvKxCIv0srBh8BWUfTYiNlHEtY2Ls=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-ltocguKLP5W-tlU7ADZAfA-1; Wed, 16 Nov 2022 08:48:52 -0500
X-MC-Unique: ltocguKLP5W-tlU7ADZAfA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21FAD833A0D;
 Wed, 16 Nov 2022 13:48:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C58F449BB60;
 Wed, 16 Nov 2022 13:48:51 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 00/20] Protect the block layer with a rwlock: part 1
Date: Wed, 16 Nov 2022 08:48:30 -0500
Message-Id: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This serie is the first of four series that aim to introduce and use a new
graph rwlock in the QEMU block layer.
The aim is to replace the current AioContext lock with much fine-grained locks,
aimed to protect only specific data.
Currently the AioContext lock is used pretty much everywhere, and it's not
even clear what it is protecting exactly.

The aim of the rwlock is to cover graph modifications: more precisely,
when a BlockDriverState parent or child list is modified or read, since it can
be concurrently accessed by the main loop and iothreads.

The main assumption is that the main loop is the only one allowed to perform
graph modifications, and so far this has always been held by the current code.

The rwlock is inspired from cpus-common.c implementation, and aims to
reduce cacheline bouncing by having per-aiocontext counter of readers.
All details and implementation of the lock are in patch 1.

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

In this first serie, my aim is to introduce the lock (patches 1-3,6), cover the
main graph writer (patch 4), define assertions (patch 5) and start using the
read lock in the generated_co_wrapper functions (7-20).
Such functions recursively traverse the BlockDriverState graph, so they must
take the graph rdlock.

We distinguish two cases related to the generated_co_wrapper (often shortened
to g_c_w):
- qemu_in_coroutine(), which means the function is already running in a
  coroutine. This means we don't take the lock, because the coroutine must
  have taken it when it started
- !qemu_in_coroutine(), which means we need to create a new coroutine that
  performs the operation requested. In this case we take the rdlock as soon as
  the coroutine starts, and release only before finishing.

In this and following series, we try to follow the following locking pattern:
- bdrv_co_* functions that call BlockDriver callbacks always expect the lock
  to be taken, therefore they assert.
- blk_co_* functions usually call blk_wait_while_drained(), therefore they must
  take the lock internally. Therefore we introduce generated_co_wrapper_blk,
  which does not take the rdlock when starting the coroutine.

The long term goal of this series is to eventually replace the AioContext lock,
so that we can get rid of it once and for all.

This serie is based on v4 of "Still more coroutine and various fixes in block layer".

Based-on: <20221116122241.2856527-1-eesposit@redhat.com>

Thank you,
Emanuele

Emanuele Giuseppe Esposito (19):
  graph-lock: introduce BdrvGraphRWlock structure
  async: register/unregister aiocontext in graph lock list
  block.c: wrlock in bdrv_replace_child_noperm
  block: remove unnecessary assert_bdrv_graph_writable()
  block: assert that graph read and writes are performed correctly
  graph-lock: implement WITH_GRAPH_RDLOCK_GUARD and GRAPH_RDLOCK_GUARD
    macros
  block-coroutine-wrapper.py: take the graph rdlock in bdrv_* functions
  block-backend: introduce new generated_co_wrapper_blk annotation
  block-gen: assert that {bdrv/blk}_co_truncate is always called with
    graph rdlock taken
  block-gen: assert that bdrv_co_{check/invalidate_cache} are always
    called with graph rdlock taken
  block-gen: assert that bdrv_co_pwrite is always called with graph
    rdlock taken
  block-gen: assert that bdrv_co_pwrite_{zeros/sync} is always called
    with graph rdlock taken
  block-gen: assert that bdrv_co_pread is always called with graph
    rdlock taken
  block-gen: assert that {bdrv/blk}_co_flush is always called with graph
    rdlock taken
  block-gen: assert that bdrv_co_{read/write}v_vmstate are always called
    with graph rdlock taken
  block-gen: assert that bdrv_co_pdiscard is always called with graph
    rdlock taken
  block-gen: assert that bdrv_co_common_block_status_above is always
    called with graph rdlock taken
  block-gen: assert that bdrv_co_ioctl is always called with graph
    rdlock taken
  block-gen: assert that nbd_co_do_establish_connection is always called
    with graph rdlock taken

Paolo Bonzini (1):
  block: introduce a lock to protect graph operations

 block.c                                |  15 +-
 block/backup.c                         |   3 +
 block/block-backend.c                  |  10 +-
 block/block-copy.c                     |  10 +-
 block/graph-lock.c                     | 255 +++++++++++++++++++++++++
 block/io.c                             |  15 ++
 block/meson.build                      |   1 +
 block/mirror.c                         |  20 +-
 block/nbd.c                            |   1 +
 block/stream.c                         |  32 ++--
 include/block/aio.h                    |   9 +
 include/block/block-common.h           |   1 +
 include/block/block_int-common.h       |  36 +++-
 include/block/block_int-global-state.h |  17 --
 include/block/block_int-io.h           |   2 +
 include/block/block_int.h              |   1 +
 include/block/graph-lock.h             | 180 +++++++++++++++++
 include/sysemu/block-backend-io.h      |  69 +++----
 qemu-img.c                             |   4 +-
 scripts/block-coroutine-wrapper.py     |  13 +-
 tests/unit/test-bdrv-drain.c           |   2 +
 util/async.c                           |   4 +
 util/meson.build                       |   1 +
 23 files changed, 615 insertions(+), 86 deletions(-)
 create mode 100644 block/graph-lock.c
 create mode 100644 include/block/graph-lock.h

-- 
2.31.1


