Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390A44FE02
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 05:57:01 +0100 (CET)
Received: from localhost ([::1]:35134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmU3A-0000KQ-Ig
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 23:57:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmU0Z-0004uU-I3; Sun, 14 Nov 2021 23:54:19 -0500
Received: from mga17.intel.com ([192.55.52.151]:4456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mmU0T-0008Nv-Pf; Sun, 14 Nov 2021 23:54:18 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="214101230"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; d="scan'208";a="214101230"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 20:54:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; d="scan'208";a="644710424"
Received: from yadong-antec.sh.intel.com ([10.239.158.125])
 by fmsmga001.fm.intel.com with ESMTP; 14 Nov 2021 20:54:07 -0800
From: yadong.qi@intel.com
To: qemu-block@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 stefanha@redhat.com, fam@euphon.net, mst@redhat.com
Subject: [PATCH 0/2] support BLKSECDISCARD
Date: Mon, 15 Nov 2021 12:51:58 +0800
Message-Id: <20211115045200.3567293-1-yadong.qi@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=yadong.qi@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: kai.z.wang@intel.com, yadong.qi@intel.com, luhai.chen@intel.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yadong Qi <yadong.qi@intel.com>

Support BLKSECDISCARD passthrough for raw host_device backend.

For virtio-blk device:
    Add new virtio feature: VIRTIO_BLK_F_SECDISCARD.
    Add new virtio command: VIRTIO_BLK_T_SECDISCARD.

Usage:
    qemu-system-x86_64 \
    ... \
    -drive file=/dev/mmcblk0p2,if=none,format=raw,discard=on,secdiscard=on,id=sd0 \
    -device virtio-blk-pci,drive=sd0,id=sd0_vblk \
    ...

Yadong Qi (2):
  block:hdev: support BLKSECDISCARD
  virtio-blk: support BLKSECDISCARD

 block.c                                     | 46 +++++++++++++++++++
 block/blkdebug.c                            |  5 ++-
 block/blklogwrites.c                        |  6 ++-
 block/blkreplay.c                           |  5 ++-
 block/block-backend.c                       | 15 ++++---
 block/copy-before-write.c                   |  5 ++-
 block/copy-on-read.c                        |  5 ++-
 block/coroutines.h                          |  6 ++-
 block/file-posix.c                          | 50 ++++++++++++++++++---
 block/filter-compress.c                     |  5 ++-
 block/io.c                                  |  5 ++-
 block/mirror.c                              |  5 ++-
 block/nbd.c                                 |  3 +-
 block/nvme.c                                |  3 +-
 block/preallocate.c                         |  5 ++-
 block/qcow2-refcount.c                      |  4 +-
 block/qcow2.c                               |  3 +-
 block/raw-format.c                          |  5 ++-
 block/throttle.c                            |  5 ++-
 hw/block/virtio-blk.c                       | 24 ++++++++--
 hw/ide/core.c                               |  1 +
 hw/nvme/ctrl.c                              |  3 +-
 hw/scsi/scsi-disk.c                         |  2 +-
 include/block/block.h                       | 13 +++++-
 include/block/block_int.h                   |  2 +-
 include/block/raw-aio.h                     |  4 +-
 include/standard-headers/linux/virtio_blk.h |  4 ++
 include/sysemu/block-backend.h              |  1 +
 tests/unit/test-block-iothread.c            |  9 ++--
 29 files changed, 195 insertions(+), 54 deletions(-)

-- 
2.25.1


