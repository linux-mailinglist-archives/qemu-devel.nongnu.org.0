Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301246A0FCB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 19:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVGhH-0006lT-EW; Thu, 23 Feb 2023 13:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhF-0006jt-Ly
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pVGhD-0002rc-7Z
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 13:52:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677178317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Dv06wkQCEXkGah7qFOwDCn1x/gCwBgA3rUHSoF+OfPg=;
 b=NAGQkBI+prqqa+lQY0y6l4rzLrXlx70tUqnJQIjq5jqUzl6teBaHYF6t9YYWyQLG/furQd
 XGqeKaS+DmEosagnTqe0cTZNtgEIFHWEBxonGfMAvPUCBdvNpxnIBWydU4TuAr7c1vlos6
 u5ilsw64W6ieTN9fyAta4dPCSZX53Ps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-OQfaGmpcPE6oSoFeHIQHIg-1; Thu, 23 Feb 2023 13:51:52 -0500
X-MC-Unique: OQfaGmpcPE6oSoFeHIQHIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CF2F85A5A3;
 Thu, 23 Feb 2023 18:51:51 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E52171121314;
 Thu, 23 Feb 2023 18:51:50 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 00/29] Block layer patches
Date: Thu, 23 Feb 2023 19:51:17 +0100
Message-Id: <20230223185146.306454-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2023-02-21 11:28:31 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 0f385a2420d2c3f8ae7ed65fbe2712027664059e:

  block/rbd: Add support for layered encryption (2023-02-23 19:49:35 +0100)

----------------------------------------------------------------
Block layer patches

- Lock the graph, part 2 (BlockDriver callbacks)
- virtio-scsi: fix SCSIDevice hot unplug with IOThread
- rbd: Add support for layered encryption

----------------------------------------------------------------
Emanuele Giuseppe Esposito (5):
      block/qed: add missing graph rdlock in qed_need_check_timer_entry
      block: Mark bdrv_co_flush() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_pdiscard() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_copy_range() GRAPH_RDLOCK
      block: Mark bdrv_co_is_inserted() and callers GRAPH_RDLOCK

Kevin Wolf (18):
      block: Make bdrv_can_set_read_only() static
      mirror: Fix access of uninitialised fields during start
      block: Mark bdrv_co_truncate() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_block_status() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_ioctl() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_pwrite_zeroes() and callers GRAPH_RDLOCK
      block: Mark read/write in block/io.c GRAPH_RDLOCK
      block: Mark public read/write functions GRAPH_RDLOCK
      block: Mark bdrv_co_pwrite_sync() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_do_pwrite_zeroes() GRAPH_RDLOCK
      block: Mark preadv_snapshot/snapshot_block_status GRAPH_RDLOCK
      block: Mark bdrv_co_create() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_io_(un)plug() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_eject/lock_medium() and callers GRAPH_RDLOCK
      block: Mark bdrv_(un)register_buf() GRAPH_RDLOCK
      block: Mark bdrv_co_delete_file() and callers GRAPH_RDLOCK
      block: Mark bdrv_*_dirty_bitmap() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_refresh_total_sectors() and callers GRAPH_RDLOCK

Or Ozeri (3):
      block/rbd: Remove redundant stack variable passphrase_len
      block/rbd: Add luks-any encryption opening option
      block/rbd: Add support for layered encryption

Stefan Hajnoczi (3):
      scsi: protect req->aiocb with AioContext lock
      dma-helpers: prevent dma_blk_cb() vs dma_aio_cancel() race
      virtio-scsi: reset SCSI devices from main loop thread

 qapi/block-core.json               |  27 +++++-
 block/coroutines.h                 |   2 +-
 block/qcow2.h                      |  27 ++++--
 block/qed.h                        |  45 +++++----
 include/block/block-copy.h         |   6 +-
 include/block/block-global-state.h |  14 +--
 include/block/block-io.h           | 110 ++++++++++++----------
 include/block/block_int-common.h   | 173 ++++++++++++++++++----------------
 include/block/block_int-io.h       |  53 ++++++-----
 include/block/dirty-bitmap.h       |  12 +--
 include/hw/virtio/virtio-scsi.h    |  11 ++-
 include/sysemu/block-backend-io.h  |   7 +-
 block.c                            |  12 ++-
 block/backup.c                     |   3 +
 block/blkdebug.c                   |  19 ++--
 block/blklogwrites.c               |  35 ++++---
 block/blkreplay.c                  |  24 +++--
 block/blkverify.c                  |   5 +-
 block/block-backend.c              |  39 +++++---
 block/block-copy.c                 |  32 ++++---
 block/bochs.c                      |   2 +-
 block/commit.c                     |   5 +-
 block/copy-before-write.c          |  33 ++++---
 block/copy-on-read.c               |  44 +++++----
 block/create.c                     |   9 +-
 block/crypto.c                     |  16 ++--
 block/dirty-bitmap.c               |   2 +
 block/file-posix.c                 |  27 +++---
 block/file-win32.c                 |   7 +-
 block/filter-compress.c            |  36 ++++---
 block/io.c                         | 108 +++++++++++++--------
 block/iscsi.c                      |  28 +++---
 block/mirror.c                     |  59 ++++++++----
 block/parallels.c                  |  33 +++----
 block/preallocate.c                |  38 ++++----
 block/qcow.c                       |  46 +++++----
 block/qcow2-cluster.c              |  17 ++--
 block/qcow2.c                      | 136 +++++++++++++++------------
 block/qed-check.c                  |   3 +-
 block/qed-table.c                  |  10 +-
 block/qed.c                        | 101 ++++++++++----------
 block/quorum.c                     |  62 +++++++-----
 block/raw-format.c                 |  76 ++++++++-------
 block/rbd.c                        | 188 ++++++++++++++++++++++++++++++++++---
 block/replication.c                |  18 ++--
 block/snapshot-access.c            |   8 +-
 block/stream.c                     |  40 ++++----
 block/throttle.c                   |  36 ++++---
 block/vdi.c                        |  11 +--
 block/vhdx.c                       |  18 ++--
 block/vmdk.c                       | 132 ++++++++++++--------------
 block/vpc.c                        |  11 +--
 hw/scsi/scsi-disk.c                |  23 +++--
 hw/scsi/scsi-generic.c             |  11 ++-
 hw/scsi/virtio-scsi.c              | 169 ++++++++++++++++++++++++++-------
 qemu-img.c                         |   8 +-
 softmmu/dma-helpers.c              |  12 ++-
 tests/unit/test-bdrv-drain.c       |  20 ++--
 tests/unit/test-block-iothread.c   |   3 +-
 59 files changed, 1355 insertions(+), 907 deletions(-)


