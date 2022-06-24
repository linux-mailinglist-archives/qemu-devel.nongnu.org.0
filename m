Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239FA55A3A5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:36:07 +0200 (CEST)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4qyE-00013Z-7B
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrt-0008Rr-Jl; Fri, 24 Jun 2022 17:29:33 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:54334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o4qrp-0004Px-Qx; Fri, 24 Jun 2022 17:29:32 -0400
Received: from myt5-4c5921969858.qloud-c.yandex.net
 (myt5-4c5921969858.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3b1a:0:640:4c59:2196])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 038272E3067;
 Sat, 25 Jun 2022 00:29:19 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt5-4c5921969858.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 FkOyUBjipj-TIJq697q; Sat, 25 Jun 2022 00:29:18 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1656106158; bh=hlEvO6mx+VaOTbBCv9562Zi/SzjSbiNN0iWHwRWIZkE=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=gziRttZFQqWH3Cy5wxhO4iXg+TkBdPYKupRLVFMVWiADifGo6cIeu9Jc8fVFg2m4l
 ivFeRxW7aH/eWQfNvHFFzDjjIbbI4AW9qRB+l/WZ6D9gi3ovYZ05/zakIN2+Pb6O5y
 W687DaeS/qRP9CdGzGzrUOcoy6BhxxfKo2Oh5BT4=
Authentication-Results: myt5-4c5921969858.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b64c::1:2c])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KXs24KJ458-TIMSKCGr; Sat, 25 Jun 2022 00:29:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v6 00/15] block: cleanup backing and file handling
Date: Sat, 25 Jun 2022 00:28:15 +0300
Message-Id: <20220624212830.316919-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

That's the first part of
"[PATCH v5 00/45] Transactional block-graph modifying API",
updated and almost reviewed.

On commit (15) is added to original scope of
"block: cleanup backing and file handling", as it's related.

01: add Hanna's r-b
02: - mention snapshot-access in commit msg
    - return ret in compress_open instead of EINVAL
    - add Hanna's r-b
03: add Hanna's r-b
04: - add case in commit msg
    - fix comments
05: - fix type in commit msg
    - add Hanna's r-b
06: add Hanna's r-b
07: wording improvements
08: - fix wording
    - add Hanna's r-b

09: I add the description, whey we allow a degradation. Still,
    up to maintainers: it's OK to merge 09-13 into one bit commit

13: - fix s/|/||/
    - improve comment
    - more readable logic when handle filters in bdrv_child_cb_attach()
    - don't keep **child indirection, move to just returning a child ptr
      (honestly, I didn't analyze all the callers do they need this int value. Do you think it's needed?)
    - handle snapshot-access.c
14: get rid of _ptr
15: update comment

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


