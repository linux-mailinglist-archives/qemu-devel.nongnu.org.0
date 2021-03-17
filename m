Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1A033F6E5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:32:50 +0100 (CET)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMa2J-0008Ad-Nh
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lMZmj-0003cq-VX; Wed, 17 Mar 2021 13:16:42 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:38055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lMZmg-0006rW-Mn; Wed, 17 Mar 2021 13:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=7khUvFnCDnslH076ISP3CzVoltD9gEYo23FjVqThzo0=; 
 b=kXRLTdfltAGr4jZ1AjAJKckLUfNRzoT58KK4hbyakEdz45apfKQinxJ3ZX1kVisCNMDPnpfe8PtdcqsnRDsjAp3lD4CcgYVEc6o12Ry5be+NiDyUDDq5fpCc14m4hIJTeZXLUZMQz+Y3MtrddNbqviI/qivkXD6NVc3A2ndbeY/z6eci/fNrt62tEfFQtqaMnLv8zOqH808xqKZy8XB4wKVZZkjsLkjsq+2kFbg27WUDIPgu3X+LsDe2lrgXckrc0VMDm/fSFBYzCOcALcxfI1f2PYCq1Pu6VV+21K68CbB5mhWidiAqlegmmUcOUPVn+v7f0sZY9l4htkEPtVg53g==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lMZmd-0003ux-OS; Wed, 17 Mar 2021 18:16:35 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1lMZmQ-0007RW-Bv; Wed, 17 Mar 2021 18:16:22 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/6] block: Add bdrv_reopen_queue_free()
Date: Wed, 17 Mar 2021 18:15:52 +0100
Message-Id: <187591f3bc69425bb8741fdc4a46f8fbe5b4d36e.1616000692.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616000692.git.berto@igalia.com>
References: <cover.1616000692.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the code to free a BlockReopenQueue to a separate function.
It will be used in a subsequent patch.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 include/block/block.h |  1 +
 block.c               | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 8d5b3ecebd..5eb1e4cab9 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -385,6 +385,7 @@ BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
 BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                     BlockDriverState *bs, QDict *options,
                                     bool keep_old_opts);
+void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue);
 int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp);
 int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
                               Error **errp);
diff --git a/block.c b/block.c
index 95d8246d92..764cdbec7d 100644
--- a/block.c
+++ b/block.c
@@ -3985,6 +3985,17 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                    NULL, 0, keep_old_opts);
 }
 
+void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue)
+{
+    if (bs_queue) {
+        BlockReopenQueueEntry *bs_entry, *next;
+        QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
+            g_free(bs_entry);
+        }
+        g_free(bs_queue);
+    }
+}
+
 /*
  * Reopen multiple BlockDriverStates atomically & transactionally.
  *
@@ -4088,10 +4099,7 @@ abort:
     }
 
 cleanup:
-    QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
-        g_free(bs_entry);
-    }
-    g_free(bs_queue);
+    bdrv_reopen_queue_free(bs_queue);
 
     return ret;
 }
-- 
2.20.1


