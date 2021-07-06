Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518193BCE84
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 13:26:14 +0200 (CEST)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0jDR-00068G-Da
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 07:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0jBW-0003Lo-NG
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 07:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0jBO-0000hQ-AU
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 07:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625570645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y09AgW3opNoxOB+wgC79ShDM6m6z7IyBXNTolDQl6aU=;
 b=bNNhExs0TfQqHQdlow8sQ4qpJPfQ7J8pV0zklODxWLs2c5nn5t0LMrBtzs8U63R9pef5Jn
 70dIPD54L96KqwN2yY3ctcy0TKXbAbFfmwf1VT6ZXCXRv84rouu27ulTx7/cxQoHAjw2tF
 FZt0bZknBDiRHB2W1DPaGsaUC65VfVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-zo17VrccPeimnrBFeHkODw-1; Tue, 06 Jul 2021 07:24:04 -0400
X-MC-Unique: zo17VrccPeimnrBFeHkODw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C760F193F568;
 Tue,  6 Jul 2021 11:23:47 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-253.ams2.redhat.com [10.36.113.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8888360CC9;
 Tue,  6 Jul 2021 11:23:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 2/6] block: Add bdrv_reopen_queue_free()
Date: Tue,  6 Jul 2021 13:23:36 +0200
Message-Id: <20210706112340.223334-3-kwolf@redhat.com>
In-Reply-To: <20210706112340.223334-1-kwolf@redhat.com>
References: <20210706112340.223334-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

Move the code to free a BlockReopenQueue to a separate function.
It will be used in a subsequent patch.

[ kwolf: Also free explicit_options and options, and explicitly
  qobject_ref() the value when it continues to be used. This avoids
  memory leaks as we saw them in two recent patches. ]

Signed-off-by: Alberto Garcia <berto@igalia.com>
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
index acd35cb0cb..ee9b46e95e 100644
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


