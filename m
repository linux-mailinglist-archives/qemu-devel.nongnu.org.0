Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7A72D7CC1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:25:25 +0100 (CET)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmAW-0006Lp-AJ
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluJ-0003ZX-JI
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlu9-00025D-AM
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GM0EIEy4CkX7YJmc8u/hwt0dMlsfVX2LCZh1LZVuEw=;
 b=PBpsI2KAADAaRFOIXr4YeHUd4EkZpfiixriej0QMxDAiLxlcvWqwPxZqf7l4JyPt3KgQwa
 3AVo2j9TuRf4VfaaS/9ZgBIZdkoSxuL/J3miLXIAEUeea7dP4qF0li1UkOfvOFBFaZIiKo
 gEhr4clOb2UpvVk9XKjRYj+1D/Myg5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-_6fgInrCPzGFeAhrTOXiZA-1; Fri, 11 Dec 2020 12:08:25 -0500
X-MC-Unique: _6fgInrCPzGFeAhrTOXiZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EDF2858182;
 Fri, 11 Dec 2020 17:08:24 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CC515D731;
 Fri, 11 Dec 2020 17:08:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/34] block/iscsi: Use lock guard macros
Date: Fri, 11 Dec 2020 18:07:42 +0100
Message-Id: <20201211170812.228643-5-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Gan Qixin <ganqixin@huawei.com>

Replace manual lock()/unlock() calls with lock guard macros
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/iscsi.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Message-Id: <20201203075055.127773-5-ganqixin@huawei.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/iscsi.c | 50 ++++++++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index e30a7e3606..7d4b3b56d5 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -322,25 +322,23 @@ iscsi_aio_cancel(BlockAIOCB *blockacb)
     IscsiAIOCB *acb = (IscsiAIOCB *)blockacb;
     IscsiLun *iscsilun = acb->iscsilun;
 
-    qemu_mutex_lock(&iscsilun->mutex);
+    WITH_QEMU_LOCK_GUARD(&iscsilun->mutex) {
 
-    /* If it was cancelled or completed already, our work is done here */
-    if (acb->cancelled || acb->status != -EINPROGRESS) {
-        qemu_mutex_unlock(&iscsilun->mutex);
-        return;
-    }
+        /* If it was cancelled or completed already, our work is done here */
+        if (acb->cancelled || acb->status != -EINPROGRESS) {
+            return;
+        }
 
-    acb->cancelled = true;
+        acb->cancelled = true;
 
-    qemu_aio_ref(acb); /* released in iscsi_abort_task_cb() */
+        qemu_aio_ref(acb); /* released in iscsi_abort_task_cb() */
 
-    /* send a task mgmt call to the target to cancel the task on the target */
-    if (iscsi_task_mgmt_abort_task_async(iscsilun->iscsi, acb->task,
-                                         iscsi_abort_task_cb, acb) < 0) {
-        qemu_aio_unref(acb); /* since iscsi_abort_task_cb() won't be called */
+        /* send a task mgmt call to the target to cancel the task on the target */
+        if (iscsi_task_mgmt_abort_task_async(iscsilun->iscsi, acb->task,
+                                             iscsi_abort_task_cb, acb) < 0) {
+            qemu_aio_unref(acb); /* since iscsi_abort_task_cb() won't be called */
+        }
     }
-
-    qemu_mutex_unlock(&iscsilun->mutex);
 }
 
 static const AIOCBInfo iscsi_aiocb_info = {
@@ -375,22 +373,22 @@ static void iscsi_timed_check_events(void *opaque)
 {
     IscsiLun *iscsilun = opaque;
 
-    qemu_mutex_lock(&iscsilun->mutex);
+    WITH_QEMU_LOCK_GUARD(&iscsilun->mutex) {
+        /* check for timed out requests */
+        iscsi_service(iscsilun->iscsi, 0);
 
-    /* check for timed out requests */
-    iscsi_service(iscsilun->iscsi, 0);
+        if (iscsilun->request_timed_out) {
+            iscsilun->request_timed_out = false;
+            iscsi_reconnect(iscsilun->iscsi);
+        }
 
-    if (iscsilun->request_timed_out) {
-        iscsilun->request_timed_out = false;
-        iscsi_reconnect(iscsilun->iscsi);
+        /*
+         * newer versions of libiscsi may return zero events. Ensure we are
+         * able to return to service once this situation changes.
+         */
+        iscsi_set_events(iscsilun);
     }
 
-    /* newer versions of libiscsi may return zero events. Ensure we are able
-     * to return to service once this situation changes. */
-    iscsi_set_events(iscsilun);
-
-    qemu_mutex_unlock(&iscsilun->mutex);
-
     timer_mod(iscsilun->event_timer,
               qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + EVENT_INTERVAL);
 }
-- 
2.29.2


