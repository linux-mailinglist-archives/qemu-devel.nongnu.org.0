Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AEF596B98
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 10:49:36 +0200 (CEST)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOEk3-0005Tc-9P
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 04:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oOEZL-0004q1-4j; Wed, 17 Aug 2022 04:38:31 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oOEZJ-0006Ag-AN; Wed, 17 Aug 2022 04:38:30 -0400
Received: from [192.168.16.116] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <den@openvz.org>) id 1oOEX9-00GAqg-Jh;
 Wed, 17 Aug 2022 10:37:26 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Denis V. Lunev" <den@openvz.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH 1/2] block: use bdrv_is_sg() helper instead of raw bs->sg
 reading
Date: Wed, 17 Aug 2022 10:37:35 +0200
Message-Id: <20220817083736.40981-2-den@openvz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220817083736.40981-1-den@openvz.org>
References: <20220817083736.40981-1-den@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

I believe that if the helper exists, it must be used always for reading
of the value. It breaks expectations in the other case.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Ronnie Sahlberg <ronniesahlberg@gmail.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Peter Lieven <pl@kamp.de>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/file-posix.c | 2 +-
 block/iscsi.c      | 2 +-
 block/raw-format.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..256de1f456 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1295,7 +1295,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
     }
 #endif
 
-    if (bs->sg || S_ISBLK(st.st_mode)) {
+    if (bdrv_is_sg(bs) || S_ISBLK(st.st_mode)) {
         int ret = hdev_get_max_hw_transfer(s->fd, &st);
 
         if (ret > 0 && ret <= BDRV_REQUEST_MAX_BYTES) {
diff --git a/block/iscsi.c b/block/iscsi.c
index d707d0b354..612de127e5 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -2065,7 +2065,7 @@ static void iscsi_refresh_limits(BlockDriverState *bs, Error **errp)
     uint64_t max_xfer_len = iscsilun->use_16_for_rw ? 0xffffffff : 0xffff;
     unsigned int block_size = MAX(BDRV_SECTOR_SIZE, iscsilun->block_size);
 
-    assert(iscsilun->block_size >= BDRV_SECTOR_SIZE || bs->sg);
+    assert(iscsilun->block_size >= BDRV_SECTOR_SIZE || bdrv_is_sg(bs));
 
     bs->bl.request_alignment = block_size;
 
diff --git a/block/raw-format.c b/block/raw-format.c
index 69fd650eaf..c7278e348e 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -463,7 +463,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    bs->sg = bs->file->bs->sg;
+    bs->sg = bdrv_is_sg(bs->file->bs);
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
         (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
     bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
@@ -489,7 +489,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    if (bs->sg && (s->offset || s->has_size)) {
+    if (bdrv_is_sg(bs) && (s->offset || s->has_size)) {
         error_setg(errp, "Cannot use offset/size with SCSI generic devices");
         return -EINVAL;
     }
-- 
2.32.0


