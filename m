Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CC23C242E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:18:57 +0200 (CEST)
Received: from localhost ([::1]:55324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qPA-0000zx-AL
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pzJ-0005BN-R4
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pzH-0003kK-Hq
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JpJ+xjd4g2bUbv3ELs/t5+yykVShs76fsStHBeUH3OM=;
 b=etb2dnctt0xy5R7TfJZ62BuDz6uptDTTCxt9AJoetN2b7yJrBTxdS2G4FgYlWAoOV/uDQu
 gzSiM8Jx8k+kF22XxvSouLhSwsNUL9xKfnAj3zjKyD1xhzAFk2CxRGidb4jjmniW26KGMN
 PsCUjsbxzdJOQYdWDkHX5QeHQ9v+9z4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-h4-wD6wvNT6oHsZEwO-Kgw-1; Fri, 09 Jul 2021 08:52:09 -0400
X-MC-Unique: h4-wD6wvNT6oHsZEwO-Kgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6896D100C660;
 Fri,  9 Jul 2021 12:52:08 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF88C60843;
 Fri,  9 Jul 2021 12:52:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/28] block: Add bdrv_reopen_queue_free()
Date: Fri,  9 Jul 2021 14:50:31 +0200
Message-Id: <20210709125035.191321-25-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

Move the code to free a BlockReopenQueue to a separate function.
It will be used in a subsequent patch.

[ kwolf: Also free explicit_options and options, and explicitly
  qobject_ref() the value when it continues to be used. This makes
  future memory leaks less likely. ]

Signed-off-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210708114709.206487-3-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |  1 +
 block.c               | 22 ++++++++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 7ec77ecb1a..6d42992985 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -386,6 +386,7 @@ BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
 BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                     BlockDriverState *bs, QDict *options,
                                     bool keep_old_opts);
+void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue);
 int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp);
 int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
                               Error **errp);
diff --git a/block.c b/block.c
index ce96585575..a26465e3da 100644
--- a/block.c
+++ b/block.c
@@ -4095,6 +4095,19 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
                                    NULL, 0, keep_old_opts);
 }
 
+void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue)
+{
+    if (bs_queue) {
+        BlockReopenQueueEntry *bs_entry, *next;
+        QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
+            qobject_unref(bs_entry->state.explicit_options);
+            qobject_unref(bs_entry->state.options);
+            g_free(bs_entry);
+        }
+        g_free(bs_queue);
+    }
+}
+
 /*
  * Reopen multiple BlockDriverStates atomically & transactionally.
  *
@@ -4197,15 +4210,10 @@ abort:
         if (bs_entry->prepared) {
             bdrv_reopen_abort(&bs_entry->state);
         }
-        qobject_unref(bs_entry->state.explicit_options);
-        qobject_unref(bs_entry->state.options);
     }
 
 cleanup:
-    QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
-        g_free(bs_entry);
-    }
-    g_free(bs_queue);
+    bdrv_reopen_queue_free(bs_queue);
 
     return ret;
 }
@@ -4573,6 +4581,8 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     /* set BDS specific flags now */
     qobject_unref(bs->explicit_options);
     qobject_unref(bs->options);
+    qobject_ref(reopen_state->explicit_options);
+    qobject_ref(reopen_state->options);
 
     bs->explicit_options   = reopen_state->explicit_options;
     bs->options            = reopen_state->options;
-- 
2.31.1


