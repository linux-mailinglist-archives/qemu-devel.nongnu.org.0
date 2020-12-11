Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FF62D7CAB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:19:47 +0100 (CET)
Received: from localhost ([::1]:50380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knm54-000622-U8
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluG-0003YY-Re
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlu8-00024R-LN
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NnM6dYlYZRgd2ExH9w41QSV9/yrt19fOVsd+vEwELuw=;
 b=do8ve7+e+CRUSWnMCjuyp21GCTZo9KQg62hb9n47IqPZgFAm1CiS+HWZPqJcZilhaZgEab
 Z9PCth48zR9mCIG7m0rJ8OIfYC6xk2Ax60KMfr4Di1rNqR5ImwGSTWvCe3LfcjEsLEhExu
 GXnu4iFOZp1VGu1ea8AyDVna1ktGXy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-JenYioVRM5GCif73l6RSbQ-1; Fri, 11 Dec 2020 12:08:23 -0500
X-MC-Unique: JenYioVRM5GCif73l6RSbQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B51CB800D53;
 Fri, 11 Dec 2020 17:08:22 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 945D05D71D;
 Fri, 11 Dec 2020 17:08:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/34] block/throttle-groups: Use lock guard macros
Date: Fri, 11 Dec 2020 18:07:41 +0100
Message-Id: <20201211170812.228643-4-kwolf@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/throttle-groups.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Message-Id: <20201203075055.127773-4-ganqixin@huawei.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/throttle-groups.c | 48 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/block/throttle-groups.c b/block/throttle-groups.c
index e2f2813c0f..abd16ed9db 100644
--- a/block/throttle-groups.c
+++ b/block/throttle-groups.c
@@ -546,7 +546,7 @@ void throttle_group_register_tgm(ThrottleGroupMember *tgm,
     tgm->aio_context = ctx;
     qatomic_set(&tgm->restart_pending, 0);
 
-    qemu_mutex_lock(&tg->lock);
+    QEMU_LOCK_GUARD(&tg->lock);
     /* If the ThrottleGroup is new set this ThrottleGroupMember as the token */
     for (i = 0; i < 2; i++) {
         if (!tg->tokens[i]) {
@@ -565,8 +565,6 @@ void throttle_group_register_tgm(ThrottleGroupMember *tgm,
     qemu_co_mutex_init(&tgm->throttled_reqs_lock);
     qemu_co_queue_init(&tgm->throttled_reqs[0]);
     qemu_co_queue_init(&tgm->throttled_reqs[1]);
-
-    qemu_mutex_unlock(&tg->lock);
 }
 
 /* Unregister a ThrottleGroupMember from its group, removing it from the list,
@@ -594,25 +592,25 @@ void throttle_group_unregister_tgm(ThrottleGroupMember *tgm)
     /* Wait for throttle_group_restart_queue_entry() coroutines to finish */
     AIO_WAIT_WHILE(tgm->aio_context, qatomic_read(&tgm->restart_pending) > 0);
 
-    qemu_mutex_lock(&tg->lock);
-    for (i = 0; i < 2; i++) {
-        assert(tgm->pending_reqs[i] == 0);
-        assert(qemu_co_queue_empty(&tgm->throttled_reqs[i]));
-        assert(!timer_pending(tgm->throttle_timers.timers[i]));
-        if (tg->tokens[i] == tgm) {
-            token = throttle_group_next_tgm(tgm);
-            /* Take care of the case where this is the last tgm in the group */
-            if (token == tgm) {
-                token = NULL;
+    WITH_QEMU_LOCK_GUARD(&tg->lock) {
+        for (i = 0; i < 2; i++) {
+            assert(tgm->pending_reqs[i] == 0);
+            assert(qemu_co_queue_empty(&tgm->throttled_reqs[i]));
+            assert(!timer_pending(tgm->throttle_timers.timers[i]));
+            if (tg->tokens[i] == tgm) {
+                token = throttle_group_next_tgm(tgm);
+                /* Take care of the case where this is the last tgm in the group */
+                if (token == tgm) {
+                    token = NULL;
+                }
+                tg->tokens[i] = token;
             }
-            tg->tokens[i] = token;
         }
-    }
 
-    /* remove the current tgm from the list */
-    QLIST_REMOVE(tgm, round_robin);
-    throttle_timers_destroy(&tgm->throttle_timers);
-    qemu_mutex_unlock(&tg->lock);
+        /* remove the current tgm from the list */
+        QLIST_REMOVE(tgm, round_robin);
+        throttle_timers_destroy(&tgm->throttle_timers);
+    }
 
     throttle_group_unref(&tg->ts);
     tgm->throttle_state = NULL;
@@ -638,14 +636,14 @@ void throttle_group_detach_aio_context(ThrottleGroupMember *tgm)
     assert(qemu_co_queue_empty(&tgm->throttled_reqs[1]));
 
     /* Kick off next ThrottleGroupMember, if necessary */
-    qemu_mutex_lock(&tg->lock);
-    for (i = 0; i < 2; i++) {
-        if (timer_pending(tt->timers[i])) {
-            tg->any_timer_armed[i] = false;
-            schedule_next_request(tgm, i);
+    WITH_QEMU_LOCK_GUARD(&tg->lock) {
+        for (i = 0; i < 2; i++) {
+            if (timer_pending(tt->timers[i])) {
+                tg->any_timer_armed[i] = false;
+                schedule_next_request(tgm, i);
+            }
         }
     }
-    qemu_mutex_unlock(&tg->lock);
 
     throttle_timers_detach_aio_context(tt);
     tgm->aio_context = NULL;
-- 
2.29.2


