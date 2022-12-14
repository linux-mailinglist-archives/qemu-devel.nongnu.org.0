Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D87C64CB85
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 14:46:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S4d-00045O-Se; Wed, 14 Dec 2022 08:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4R-00041N-0U
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S4N-0003Le-VP
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aAlQeYTSW0yiaZhSi1clCUo1/keX3odbcVDWzTUrBMM=;
 b=RlG+sk0e7tr3GBspujC87PUusDhG+f26OVXkcbzQfUZ+wUPJDwXnni3X1y0QVviA5gmEht
 bEwSW/rhcTjkLIeTxEh5w8lNqsmZGsruH1ccjfCV7fcfWxx3q7qtFDGmwLMLiwCH7FsSfF
 eK2FF9ze6T4Tlsxdh6s0/+/XUWqpySo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-D5SUMzXjMO68xQiT8MtGog-1; Wed, 14 Dec 2022 08:45:08 -0500
X-MC-Unique: D5SUMzXjMO68xQiT8MtGog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93F502A2AD6F;
 Wed, 14 Dec 2022 13:45:08 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDD1314171BE;
 Wed, 14 Dec 2022 13:45:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 00/51] Block layer patches
Date: Wed, 14 Dec 2022 14:44:02 +0100
Message-Id: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

The following changes since commit 5204b499a6cae4dfd9fe762d5e6e82224892383b:

  mailmap: Fix Stefan Weil author email (2022-12-13 15:56:57 -0500)

are available in the Git repository at:

  https://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 2ad19e5dc950d4b340894846b9e71c0b20f9a1cc:

  block: GRAPH_RDLOCK for functions only called by co_wrappers (2022-12-14 13:13:07 +0100)

----------------------------------------------------------------
Block layer patches

- Code cleanups around block graph modification
- Simplify drain
- coroutine_fn correctness fixes, including splitting generated
  coroutine wrappers into co_wrapper (to be called only from
  non-coroutine context) and co_wrapper_mixed (both coroutine and
  non-coroutine context)
- Introduce a block graph rwlock

----------------------------------------------------------------
Emanuele Giuseppe Esposito (21):
      block-io: introduce coroutine_fn duplicates for bdrv_common_block_status_above callers
      block-copy: add coroutine_fn annotations
      nbd/server.c: add coroutine_fn annotations
      block-backend: replace bdrv_*_above with blk_*_above
      block/vmdk: add coroutine_fn annotations
      block: avoid duplicating filename string in bdrv_create
      block: distinguish between bdrv_create running in coroutine and not
      block: bdrv_create_file is a coroutine_fn
      block: rename generated_co_wrapper in co_wrapper_mixed
      block-coroutine-wrapper.py: introduce co_wrapper
      block-coroutine-wrapper.py: support functions without bs arg
      block-coroutine-wrapper.py: support also basic return types
      block: convert bdrv_create to co_wrapper
      block/dirty-bitmap: convert coroutine-only functions to co_wrapper
      graph-lock: Implement guard macros
      async: Register/unregister aiocontext in graph lock list
      block: wrlock in bdrv_replace_child_noperm
      block: remove unnecessary assert_bdrv_graph_writable()
      block: assert that graph read and writes are performed correctly
      block-coroutine-wrapper.py: introduce annotations that take the graph rdlock
      block: use co_wrapper_mixed_bdrv_rdlock in functions taking the rdlock

Kevin Wolf (25):
      qed: Don't yield in bdrv_qed_co_drain_begin()
      test-bdrv-drain: Don't yield in .bdrv_co_drained_begin/end()
      block: Revert .bdrv_drained_begin/end to non-coroutine_fn
      block: Remove drained_end_counter
      block: Inline bdrv_drain_invoke()
      block: Fix locking for bdrv_reopen_queue_child()
      block: Drain individual nodes during reopen
      block: Don't use subtree drains in bdrv_drop_intermediate()
      stream: Replace subtree drain with a single node drain
      block: Remove subtree drains
      block: Call drain callbacks only once
      block: Remove ignore_bds_parents parameter from drain_begin/end.
      block: Drop out of coroutine in bdrv_do_drained_begin_quiesce()
      block: Don't poll in bdrv_replace_child_noperm()
      block: Remove poll parameter from bdrv_parent_drained_begin_single()
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

Vladimir Sementsov-Ogievskiy (4):
      block: Inline bdrv_detach_child()
      block: drop bdrv_remove_filter_or_cow_child
      block: bdrv_refresh_perms(): allow external tran
      block: refactor bdrv_list_refresh_perms to allow any list of nodes

 docs/devel/block-coroutine-wrapper.rst |   6 +-
 configure                              |   1 +
 block/block-gen.h                      |  11 +-
 block/coroutines.h                     |  21 +-
 include/block/aio.h                    |   9 +
 include/block/block-common.h           |  27 ++-
 include/block/block-copy.h             |   5 +-
 include/block/block-global-state.h     |  15 +-
 include/block/block-io.h               | 136 +++++------
 include/block/block_int-common.h       |  49 ++--
 include/block/block_int-global-state.h |  17 --
 include/block/block_int-io.h           |  12 -
 include/block/block_int.h              |   1 +
 include/block/dirty-bitmap.h           |  10 +-
 include/block/graph-lock.h             | 280 +++++++++++++++++++++++
 include/qemu/clang-tsa.h               | 114 ++++++++++
 include/sysemu/block-backend-io.h      |  77 ++++---
 block.c                                | 404 ++++++++++++++++++---------------
 block/block-backend.c                  |  25 +-
 block/block-copy.c                     |  21 +-
 block/commit.c                         |   4 +-
 block/crypto.c                         |   2 +-
 block/dirty-bitmap.c                   |  88 +------
 block/graph-lock.c                     | 275 ++++++++++++++++++++++
 block/io.c                             | 367 ++++++++++--------------------
 block/parallels.c                      |   2 +-
 block/qcow.c                           |   2 +-
 block/qcow2.c                          |   4 +-
 block/qed.c                            |  28 ++-
 block/raw-format.c                     |   2 +-
 block/replication.c                    |   6 -
 block/stream.c                         |  26 ++-
 block/throttle.c                       |   8 +-
 block/vdi.c                            |   2 +-
 block/vhdx.c                           |   2 +-
 block/vmdk.c                           |  38 ++--
 block/vpc.c                            |   2 +-
 blockdev.c                             |  17 +-
 blockjob.c                             |   2 +-
 nbd/server.c                           |  47 ++--
 stubs/graph-lock.c                     |  10 +
 tests/unit/test-bdrv-drain.c           | 387 +++++++++----------------------
 util/async.c                           |   4 +
 scripts/block-coroutine-wrapper.py     | 133 ++++++++---
 block/meson.build                      |   2 +
 stubs/meson.build                      |   1 +
 46 files changed, 1575 insertions(+), 1127 deletions(-)
 create mode 100644 include/block/graph-lock.h
 create mode 100644 include/qemu/clang-tsa.h
 create mode 100644 block/graph-lock.c
 create mode 100644 stubs/graph-lock.c


