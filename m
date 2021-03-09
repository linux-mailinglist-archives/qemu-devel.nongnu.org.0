Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A26332EE4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:20:16 +0100 (CET)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhtv-0004zd-Ue
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrN-0001HH-TM; Tue, 09 Mar 2021 12:09:30 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:40106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1lJfrC-0001DN-8v; Tue, 09 Mar 2021 12:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=cSppux1HTzoJTwnXt6L+1M1jkJgYs///JT3/jjsN6pU=; 
 b=J952r+oeRcrId7/WfEgzmkLaHlM3K5rvY4I5Odk+k4/Q/wZ0Sfos2yhx/1FqCTW5kiWTdbuzSqbSJjlcPowG6X4/Mk8yaSKPTPKe22D8uUz/YLbwuBIg07QFW69Cf+LnpW28wYt7tNppxaGnQuKZfk7byHSnRtpLQ/G5sHQHUJZvxqLHOVGm4DayVBGPUZVjg0vWvUSumPXvhdLwuwMaj8z0Vve3BNr6/IyaHPCDNET9BbnLabZmr80rd5zaXj2GJWmZCETnGJ2HmaNItP55Ho8QwvHK7A0aZ7DN7TvLTC886m+pVzrEZbncpQL/zzv81PZvTR0KQ3LUpkyLmLE1OA==;
Received: from [213.94.25.37] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lJfqn-0003Lq-S6; Tue, 09 Mar 2021 18:08:53 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1lJfqa-0005IT-Ju; Tue, 09 Mar 2021 18:08:40 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] block: Add bdrv_reopen_queue_free()
Date: Tue,  9 Mar 2021 18:08:27 +0100
Message-Id: <7dfe215838c2afbf44513ed32bea5a2cb6ffb472.1615309297.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615309297.git.berto@igalia.com>
References: <cover.1615309297.git.berto@igalia.com>
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
index 82271d9ccd..aa3d568fec 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -371,6 +371,7 @@ BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
 BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                     BlockDriverState *bs, QDict *options,
                                     bool keep_old_opts);
+void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue);
 int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp);
 int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
                               Error **errp);
diff --git a/block.c b/block.c
index 576b145cbf..03b36cd5df 100644
--- a/block.c
+++ b/block.c
@@ -3933,6 +3933,17 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
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
@@ -4020,10 +4031,7 @@ abort:
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


