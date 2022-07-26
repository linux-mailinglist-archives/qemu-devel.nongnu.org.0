Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415AD581AE9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:20:16 +0200 (CEST)
Received: from localhost ([::1]:36030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGR2N-00049c-9x
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQuT-0000zB-AO; Tue, 26 Jul 2022 16:12:05 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:47166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQuO-00018y-OK; Tue, 26 Jul 2022 16:12:03 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 6510D2E0DC9;
 Tue, 26 Jul 2022 23:11:49 +0300 (MSK)
Received: from localhost.localdomain (172.31.44.48-vpn.dhcp.yndx.net
 [172.31.44.48])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ZssKVYgWJm-BlO04R6S; Tue, 26 Jul 2022 23:11:47 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658866307; bh=l1dAj8/T+N8f2HwYVHJFtuOrpxlSqqvlSb60sfAfO6I=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=ax2fVX/0GcR0xyAqhKFlauRCim5BoOKDoDqCpMBwR5DRcXTVulpdaqrHSPFpHGfWS
 dUgHUmfEowD5q3+ns8zxgmYXta7aPpLkctVGgT33z3T6ErB7EOvdpTP8gb/+9ynf9v
 HyeLpyKSlLlxGbhj+kSQ3l0tYU6YfEMqRQFYkRHs=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v7 for-7.2 00/15] block: cleanup backing and file handling
Date: Tue, 26 Jul 2022 23:11:19 +0300
Message-Id: <20220726201134.924743-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

That's the first part of
"[PATCH v5 00/45] Transactional block-graph modifying API",
updated and is fully reviewed by Hanna.

v7: add r-bs and rebase on master

Vladimir Sementsov-Ogievskiy (15):
  block: BlockDriver: add .filtered_child_is_backing field
  block: introduce bdrv_open_file_child() helper
  block/blklogwrites: don't care to remove bs->file child on failure
  test-bdrv-graph-mod: update test_parallel_perm_update test case
  tests-bdrv-drain: bdrv_replace_test driver: declare supports_backing
  test-bdrv-graph-mod: fix filters to be filters
  block: document connection between child roles and
    bs->backing/bs->file
  block/snapshot: stress that we fallback to primary child
  Revert "block: Let replace_child_noperm free children"
  Revert "block: Let replace_child_tran keep indirect pointer"
  Revert "block: Restructure remove_file_or_backing_child()"
  Revert "block: Pass BdrvChild ** to replace_child_noperm"
  block: Manipulate bs->file / bs->backing pointers in .attach/.detach
  block/snapshot: drop indirection around bdrv_snapshot_fallback_ptr
  block: refactor bdrv_remove_file_or_backing_child to bdrv_remove_child

 block.c                            | 435 ++++++++++-------------------
 block/blkdebug.c                   |   9 +-
 block/blklogwrites.c               |  11 +-
 block/blkreplay.c                  |   7 +-
 block/blkverify.c                  |   9 +-
 block/bochs.c                      |   7 +-
 block/cloop.c                      |   7 +-
 block/commit.c                     |   1 +
 block/copy-before-write.c          |   9 +-
 block/copy-on-read.c               |   9 +-
 block/crypto.c                     |  11 +-
 block/dmg.c                        |   7 +-
 block/filter-compress.c            |   8 +-
 block/mirror.c                     |   1 +
 block/parallels.c                  |   7 +-
 block/preallocate.c                |   9 +-
 block/qcow.c                       |   6 +-
 block/qcow2.c                      |   8 +-
 block/qed.c                        |   8 +-
 block/raw-format.c                 |   4 +-
 block/replication.c                |   8 +-
 block/snapshot-access.c            |   6 +-
 block/snapshot.c                   |  59 ++--
 block/throttle.c                   |   8 +-
 block/vdi.c                        |   7 +-
 block/vhdx.c                       |   7 +-
 block/vmdk.c                       |   7 +-
 block/vpc.c                        |   7 +-
 include/block/block-common.h       |  39 +++
 include/block/block-global-state.h |   3 +
 include/block/block_int-common.h   |  29 +-
 tests/unit/test-bdrv-drain.c       |  11 +-
 tests/unit/test-bdrv-graph-mod.c   | 104 ++++---
 33 files changed, 389 insertions(+), 479 deletions(-)

-- 
2.25.1


