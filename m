Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4964750F5DC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 10:55:04 +0200 (CEST)
Received: from localhost ([::1]:59414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njGyM-0001L3-O6
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 04:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGux-0006uT-GU
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGur-0000dD-Rt
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WGzY5fCDmcuo233jTOQ7/MqWha3GnCirdY9aw2kP2Uk=;
 b=jSko5UXpuwM8+hwwzD1W+cCgh+UwUQKmhf+yKP/58qkxx3PdCarJVoBMG8tos9DMqg5/ei
 +dnWxf5y+I2eByPPAImq/S3aoZKnA1dL1cCC0E96LtuzhfuA1J5izdJcGwmlz+Zr55Q9Ps
 eKMhsHW5Lp9s12walOg04stGT7Bq3iA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-jCeEHahmPNOEQm8U-tzZ6g-1; Tue, 26 Apr 2022 04:51:18 -0400
X-MC-Unique: jCeEHahmPNOEQm8U-tzZ6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49ECC1014A60;
 Tue, 26 Apr 2022 08:51:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 063EA40D2962;
 Tue, 26 Apr 2022 08:51:18 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 2/8] coroutine-lock: release lock when restarting all
 coroutines
Date: Tue, 26 Apr 2022 04:51:08 -0400
Message-Id: <20220426085114.199647-3-eesposit@redhat.com>
In-Reply-To: <20220426085114.199647-1-eesposit@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current implementation of qemu_co_queue_do_restart
does not releases the lock before calling aio_co_wake.
Most of the time this is fine, but if the coroutine
acquires the lock again then we have a deadlock.

Instead of duplicating code, use qemu_co_enter_next_impl, since
it implements exactly the same functionality that we
want.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/qemu/coroutine.h   | 10 ++++++++++
 util/qemu-coroutine-lock.c | 26 ++++++++++----------------
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index c828a95ee0..c49cdc21b4 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -220,6 +220,16 @@ bool qemu_co_queue_next(CoQueue *queue);
  */
 void qemu_co_queue_restart_all(CoQueue *queue);
 
+/**
+ * Empties the CoQueue; all coroutines are woken up.
+ * OK to run from coroutine and non-coroutine context.
+ * Unlocks lock before waking up each coroutine takes it again
+ * when done.
+ */
+#define qemu_co_queue_restart_all_lockable(queue, lock) \
+    qemu_co_queue_restart_all_impl(queue, QEMU_MAKE_LOCKABLE(lock))
+void qemu_co_queue_restart_all_impl(CoQueue *queue, QemuLockable *lock);
+
 /**
  * Removes the next coroutine from the CoQueue, and wake it up.  Unlike
  * qemu_co_queue_next, this function releases the lock during aio_co_wake
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 2669403839..17bb0d0c95 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -67,32 +67,26 @@ void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock)
     }
 }
 
-static bool qemu_co_queue_do_restart(CoQueue *queue, bool single)
+static void qemu_co_queue_do_restart(CoQueue *queue, QemuLockable *lock)
 {
-    Coroutine *next;
-
-    if (QSIMPLEQ_EMPTY(&queue->entries)) {
-        return false;
+    while (qemu_co_enter_next_impl(queue, lock)) {
+        /* nop */
     }
-
-    while ((next = QSIMPLEQ_FIRST(&queue->entries)) != NULL) {
-        QSIMPLEQ_REMOVE_HEAD(&queue->entries, co_queue_next);
-        aio_co_wake(next);
-        if (single) {
-            break;
-        }
-    }
-    return true;
 }
 
 bool qemu_co_queue_next(CoQueue *queue)
 {
-    return qemu_co_queue_do_restart(queue, true);
+    return qemu_co_enter_next_impl(queue, NULL);
 }
 
 void qemu_co_queue_restart_all(CoQueue *queue)
 {
-    qemu_co_queue_do_restart(queue, false);
+    qemu_co_queue_do_restart(queue, NULL);
+}
+
+void qemu_co_queue_restart_all_impl(CoQueue *queue, QemuLockable *lock)
+{
+    qemu_co_queue_do_restart(queue, lock);
 }
 
 bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock)
-- 
2.31.1


