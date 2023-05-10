Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14BF6FDDBA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:24:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwipQ-0002Dv-Q3; Wed, 10 May 2023 08:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipI-00027R-2D
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwipA-0007dD-R6
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=d7wzcKpSJJmA/aPut1xfCXyR7I73RzfJJXnAgJ3QonA=;
 b=bWKWYXf8S+k0Vv2HIFSgFMbA/RCVZPWirmLNi30NawKKPCeKK98pA6j29F/0eFZaSsk1FJ
 mm1QIiBZUmZQ6p07TFUPTxfhd5g5JJA2TOZAyMeX+QzC/IbCupbQX9eLsPWkW1LwrfzVyE
 meJkDbsgTO6DjK+RS1kDgkf1/NMKEZQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-Jyc-6ds_OoeB2rw5n6CB2g-1; Wed, 10 May 2023 08:21:37 -0400
X-MC-Unique: Jyc-6ds_OoeB2rw5n6CB2g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 905C4101A55C;
 Wed, 10 May 2023 12:21:36 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D224E18EC1;
 Wed, 10 May 2023 12:21:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 00/28] Block layer patches
Date: Wed, 10 May 2023 14:20:43 +0200
Message-Id: <20230510122111.46566-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The following changes since commit b2896c1b09878fd1c4b485b3662f8beecbe0fef4:

  Merge tag 'vfio-updates-20230509.0' of https://gitlab.com/alex.williamson/qemu into staging (2023-05-10 11:20:35 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 58a2e3f5c37be02dac3086b81bdda9414b931edf:

  block: compile out assert_bdrv_graph_readable() by default (2023-05-10 14:16:54 +0200)

----------------------------------------------------------------
Block layer patches

- Graph locking, part 3 (more block drivers)
- Compile out assert_bdrv_graph_readable() by default
- Add configure options for vmdk, vhdx and vpc
- Fix use after free in blockdev_mark_auto_del()
- migration: Attempt disk reactivation in more failure scenarios
- Coroutine correctness fixes

----------------------------------------------------------------
Emanuele Giuseppe Esposito (5):
      nbd: Mark nbd_co_do_establish_connection() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_get_allocated_file_size() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_get_info() and callers GRAPH_RDLOCK
      block: Mark bdrv_co_debug_event() GRAPH_RDLOCK
      block: Mark BlockDriver callbacks for amend job GRAPH_RDLOCK

Eric Blake (1):
      migration: Attempt disk reactivation in more failure scenarios

Kevin Wolf (18):
      block: Fix use after free in blockdev_mark_auto_del()
      iotests/nbd-reconnect-on-open: Fix NBD socket path
      qcow2: Don't call bdrv_getlength() in coroutine_fns
      block: Consistently call bdrv_activate() outside coroutine
      block: bdrv/blk_co_unref() for calls in coroutine context
      block: Don't call no_coroutine_fns in qmp_block_resize()
      iotests: Test resizing image attached to an iothread
      test-bdrv-drain: Don't modify the graph in coroutines
      graph-lock: Add GRAPH_UNLOCKED(_PTR)
      graph-lock: Fix GRAPH_RDLOCK_GUARD*() to be reader lock
      block: .bdrv_open is non-coroutine and unlocked
      nbd: Remove nbd_co_flush() wrapper function
      vhdx: Require GRAPH_RDLOCK for accessing a node's parent list
      mirror: Require GRAPH_RDLOCK for accessing a node's parent list
      block: Mark bdrv_query_bds_stats() and callers GRAPH_RDLOCK
      block: Mark bdrv_query_block_graph_info() and callers GRAPH_RDLOCK
      block: Mark bdrv_recurse_can_replace() and callers GRAPH_RDLOCK
      block: Mark bdrv_refresh_limits() and callers GRAPH_RDLOCK

Paolo Bonzini (1):
      block: add missing coroutine_fn annotations

Stefan Hajnoczi (2):
      aio-wait: avoid AioContext lock in aio_wait_bh_oneshot()
      block: compile out assert_bdrv_graph_readable() by default

Vladimir Sementsov-Ogievskiy (1):
      block: add configure options for excluding vmdk, vhdx and vpc

 meson_options.txt                                  |   8 ++
 configure                                          |   1 +
 block/coroutines.h                                 |   5 +-
 block/qcow2.h                                      |   4 +-
 include/block/aio-wait.h                           |   2 +-
 include/block/block-global-state.h                 |  19 +++-
 include/block/block-io.h                           |  23 +++--
 include/block/block_int-common.h                   |  37 +++----
 include/block/block_int-global-state.h             |   4 +-
 include/block/graph-lock.h                         |  20 ++--
 include/block/qapi.h                               |   7 +-
 include/sysemu/block-backend-global-state.h        |   5 +-
 block.c                                            |  25 ++++-
 block/amend.c                                      |   8 +-
 block/blkverify.c                                  |   5 +-
 block/block-backend.c                              |  10 +-
 block/crypto.c                                     |   8 +-
 block/graph-lock.c                                 |   3 +
 block/io.c                                         |  12 +--
 block/mirror.c                                     |  18 +++-
 block/nbd.c                                        |  50 +++++----
 block/parallels.c                                  |   6 +-
 block/qapi.c                                       |   6 +-
 block/qcow.c                                       |   6 +-
 block/qcow2-refcount.c                             |   2 +-
 block/qcow2.c                                      |  48 ++++-----
 block/qed.c                                        |  24 ++---
 block/quorum.c                                     |   4 +-
 block/raw-format.c                                 |   2 +-
 block/vdi.c                                        |   6 +-
 block/vhdx.c                                       |  15 +--
 block/vmdk.c                                       |  20 ++--
 block/vpc.c                                        |   6 +-
 blockdev.c                                         |  25 +++--
 hw/block/dataplane/virtio-blk.c                    |   3 +-
 hw/scsi/virtio-scsi-dataplane.c                    |   2 -
 migration/migration.c                              |  24 +++--
 qemu-img.c                                         |   2 +
 tests/unit/test-bdrv-drain.c                       | 112 ++++++++++++++-------
 util/aio-wait.c                                    |   2 +-
 block/meson.build                                  |  18 +++-
 meson.build                                        |   5 +
 scripts/meson-buildoptions.sh                      |  13 +++
 tests/qemu-iotests/tests/iothreads-resize          |  71 +++++++++++++
 tests/qemu-iotests/tests/iothreads-resize.out      |  11 ++
 tests/qemu-iotests/tests/nbd-reconnect-on-open     |   3 +-
 tests/qemu-iotests/tests/nbd-reconnect-on-open.out |   4 +-
 47 files changed, 474 insertions(+), 240 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/iothreads-resize
 create mode 100644 tests/qemu-iotests/tests/iothreads-resize.out


