Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C22E60E855
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:06:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onlct-00078X-P8; Wed, 26 Oct 2022 14:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlck-000638-Bo
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onlci-00070e-LI
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666810771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/18YyRywffHNhsyvHx4AyjY7kfpJ7ZfNJb/6QrwbewA=;
 b=IOXCmcg78otCiuPWUVONf00cYQpe9TQpX1cmAXkovo/WQB0eol5ZPWsE0rKePLvg7GUbJY
 PSRDC6Q4juWhbT/Gtg3iaNfEe8PU8nQSyirNlT0WWizNYgonU0/Eg4bRR06CRonu7DGx+Y
 qb/qNvcn44q36r4kAqTYsm6+06yMkeI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-LORDXktTPFOnsL3xHo3C6A-1; Wed, 26 Oct 2022 14:59:28 -0400
X-MC-Unique: LORDXktTPFOnsL3xHo3C6A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F093B811E67;
 Wed, 26 Oct 2022 18:59:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C6562166B2B;
 Wed, 26 Oct 2022 18:59:26 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Thomas Huth <thuth@redhat.com>,
 integration@gluster.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Xie Changlong <xiechanglong.d@gmail.com>,
 Jeff Cody <codyprime@gmail.com>, John Snow <jsnow@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>
Subject: [PULL 01/13] coroutine: add flag to re-queue at front of CoQueue
Date: Wed, 26 Oct 2022 14:58:34 -0400
Message-Id: <20221026185846.120544-2-stefanha@redhat.com>
In-Reply-To: <20221026185846.120544-1-stefanha@redhat.com>
References: <20221026185846.120544-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When a coroutine wakes up it may determine that it must re-queue.
Normally coroutines are pushed onto the back of the CoQueue, but for
fairness it may be necessary to push it onto the front of the CoQueue.

Add a flag to specify that the coroutine should be pushed onto the front
of the CoQueue. A later patch will use this to ensure fairness in the
bounce buffer CoQueue used by the blkio BlockDriver.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20221013185908.1297568-2-stefanha@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/coroutine.h   | 15 +++++++++++++--
 util/qemu-coroutine-lock.c |  9 +++++++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index aae33cce17..608fe45dcf 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -198,14 +198,25 @@ typedef struct CoQueue {
  */
 void qemu_co_queue_init(CoQueue *queue);
 
+typedef enum {
+    /*
+     * Enqueue at front instead of back. Use this to re-queue a request when
+     * its wait condition is not satisfied after being woken up.
+     */
+    CO_QUEUE_WAIT_FRONT = 0x1,
+} CoQueueWaitFlags;
+
 /**
  * Adds the current coroutine to the CoQueue and transfers control to the
  * caller of the coroutine.  The mutex is unlocked during the wait and
  * locked again afterwards.
  */
 #define qemu_co_queue_wait(queue, lock) \
-    qemu_co_queue_wait_impl(queue, QEMU_MAKE_LOCKABLE(lock))
-void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock);
+    qemu_co_queue_wait_impl(queue, QEMU_MAKE_LOCKABLE(lock), 0)
+#define qemu_co_queue_wait_flags(queue, lock, flags) \
+    qemu_co_queue_wait_impl(queue, QEMU_MAKE_LOCKABLE(lock), (flags))
+void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock,
+                                          CoQueueWaitFlags flags);
 
 /**
  * Removes the next coroutine from the CoQueue, and queue it to run after
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 15c82d9348..45c6b57374 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -39,10 +39,15 @@ void qemu_co_queue_init(CoQueue *queue)
     QSIMPLEQ_INIT(&queue->entries);
 }
 
-void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock)
+void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock,
+                                          CoQueueWaitFlags flags)
 {
     Coroutine *self = qemu_coroutine_self();
-    QSIMPLEQ_INSERT_TAIL(&queue->entries, self, co_queue_next);
+    if (flags & CO_QUEUE_WAIT_FRONT) {
+        QSIMPLEQ_INSERT_HEAD(&queue->entries, self, co_queue_next);
+    } else {
+        QSIMPLEQ_INSERT_TAIL(&queue->entries, self, co_queue_next);
+    }
 
     if (lock) {
         qemu_lockable_unlock(lock);
-- 
2.37.3


