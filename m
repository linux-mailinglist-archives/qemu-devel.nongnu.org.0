Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91266EE2CE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:21:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIUn-0006Es-Gn; Tue, 25 Apr 2023 09:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUk-0006Dm-Pv
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUj-0006WC-1L
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2L3Lect2HOFJ7xqSrdtJwgT0kWFY+q8sbYMhK5Pz7Y0=;
 b=Oj8IFuHPc+zU5x/LnSnAT6YZuY8uXcyNYs33ddWtakpe1LzmoFAC6r6VkFe+GrP7L+W7vQ
 g636WOQUGuQlNVJzcDs+59lHrwEUNGt3Um5xEbY6vI7iSz6gzK8GqrHf08RULD9nmK6g3R
 dOudU19Tmw82t2vP5TwNsTYFdhBrJJA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-hb4VcLiGNkCdxsoLyorwUQ-1; Tue, 25 Apr 2023 09:14:04 -0400
X-MC-Unique: hb4VcLiGNkCdxsoLyorwUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 726E3811E7C;
 Tue, 25 Apr 2023 13:14:04 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0C5D40C2064;
 Tue, 25 Apr 2023 13:14:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 00/25] Block layer patches
Date: Tue, 25 Apr 2023 15:13:34 +0200
Message-Id: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit ac5f7bf8e208cd7893dbb1a9520559e569a4677c:

  Merge tag 'migration-20230424-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-24 15:00:39 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 8c1e8fb2e7fc2cbeb57703e143965a4cd3ad301a:

  block/monitor: Fix crash when executing HMP commit (2023-04-25 15:11:57 +0200)

----------------------------------------------------------------
Block layer patches

- Protect BlockBackend.queued_requests with its own lock
- Switch to AIO_WAIT_WHILE_UNLOCKED() where possible
- AioContext removal: LinuxAioState/LuringState/ThreadPool
- Add more coroutine_fn annotations, use bdrv/blk_co_*
- Fix crash when execute hmp_commit

----------------------------------------------------------------
Emanuele Giuseppe Esposito (4):
      linux-aio: use LinuxAioState from the running thread
      io_uring: use LuringState from the running thread
      thread-pool: use ThreadPool from the running thread
      thread-pool: avoid passing the pool parameter every time

Paolo Bonzini (9):
      vvfat: mark various functions as coroutine_fn
      blkdebug: add missing coroutine_fn annotation
      mirror: make mirror_flush a coroutine_fn, do not use co_wrappers
      nbd: mark more coroutine_fns, do not use co_wrappers
      9pfs: mark more coroutine_fns
      qemu-pr-helper: mark more coroutine_fns
      tests: mark more coroutine_fns
      qcow2: mark various functions as coroutine_fn and GRAPH_RDLOCK
      vmdk: make vmdk_is_cid_valid a coroutine_fn

Stefan Hajnoczi (10):
      block: make BlockBackend->quiesce_counter atomic
      block: make BlockBackend->disable_request_queuing atomic
      block: protect BlockBackend->queued_requests with a lock
      block: don't acquire AioContext lock in bdrv_drain_all()
      block: convert blk_exp_close_all_type() to AIO_WAIT_WHILE_UNLOCKED()
      block: convert bdrv_graph_wrlock() to AIO_WAIT_WHILE_UNLOCKED()
      block: convert bdrv_drain_all_begin() to AIO_WAIT_WHILE_UNLOCKED()
      hmp: convert handle_hmp_command() to AIO_WAIT_WHILE_UNLOCKED()
      monitor: convert monitor_cleanup() to AIO_WAIT_WHILE_UNLOCKED()
      block: add missing coroutine_fn to bdrv_sum_allocated_file_size()

Wang Liang (1):
      block/monitor: Fix crash when executing HMP commit

Wilfred Mallawa (1):
      include/block: fixup typos

 block/qcow2.h                     | 15 +++++-----
 hw/9pfs/9p.h                      |  4 +--
 include/block/aio-wait.h          |  2 +-
 include/block/aio.h               |  8 ------
 include/block/block_int-common.h  |  2 +-
 include/block/raw-aio.h           | 33 +++++++++++++++-------
 include/block/thread-pool.h       | 15 ++++++----
 include/sysemu/block-backend-io.h |  5 ++++
 backends/tpm/tpm_backend.c        |  4 +--
 block.c                           |  2 +-
 block/blkdebug.c                  |  4 +--
 block/block-backend.c             | 45 ++++++++++++++++++------------
 block/export/export.c             |  2 +-
 block/file-posix.c                | 45 ++++++++++++------------------
 block/file-win32.c                |  4 +--
 block/graph-lock.c                |  2 +-
 block/io.c                        |  2 +-
 block/io_uring.c                  | 23 ++++++++++------
 block/linux-aio.c                 | 29 ++++++++++++--------
 block/mirror.c                    |  4 +--
 block/monitor/block-hmp-cmds.c    | 10 ++++---
 block/qcow2-bitmap.c              |  2 +-
 block/qcow2-cluster.c             | 21 ++++++++------
 block/qcow2-refcount.c            |  8 +++---
 block/qcow2-snapshot.c            | 25 +++++++++--------
 block/qcow2-threads.c             |  3 +-
 block/qcow2.c                     | 27 +++++++++---------
 block/vmdk.c                      |  2 +-
 block/vvfat.c                     | 58 ++++++++++++++++++++-------------------
 hw/9pfs/codir.c                   |  6 ++--
 hw/9pfs/coth.c                    |  3 +-
 hw/ppc/spapr_nvdimm.c             |  6 ++--
 hw/virtio/virtio-pmem.c           |  3 +-
 monitor/hmp.c                     |  2 +-
 monitor/monitor.c                 |  4 +--
 nbd/server.c                      | 48 ++++++++++++++++----------------
 scsi/pr-manager.c                 |  3 +-
 scsi/qemu-pr-helper.c             | 25 ++++++++---------
 tests/unit/test-thread-pool.c     | 14 ++++------
 util/thread-pool.c                | 25 ++++++++---------
 40 files changed, 283 insertions(+), 262 deletions(-)


