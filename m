Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 940C2511824
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:11:45 +0200 (CEST)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njhSK-0006qh-NS
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njhPK-0001eg-Nm; Wed, 27 Apr 2022 09:08:38 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njhPI-0002aL-RM; Wed, 27 Apr 2022 09:08:38 -0400
Received: by mail-ej1-x630.google.com with SMTP id r13so3300120ejd.5;
 Wed, 27 Apr 2022 06:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Iyt1paqFfa8bnLZuJAmu5jpXWlW+M1vy8wgJwjJ1CY=;
 b=n4P0YXuFXVHRO3WWI0GE3j4nYVVGc8ZCswMKGtkS1duMhZ3pYU7gGZWLUKRrqEXXcq
 GM2hW0+iUSCsWEOdM1AyzaOvjIdpDtqdbb8/mhRiBte+6UyJh8g6ZHgb1hT4CU/Ho7VB
 zM016QvSENDaoOIEDuMFg8HW+zGBnC6QhWgncIT5V574w8Yu08hEcq5GQ1bj4Dyacbgr
 M46r/4l51URKWMvHV/1yeEQ0Fs2CTyEqxMqdjI2boPCr8Lhr4vv7SVI3qY/Y83Xojtkr
 S/E0m3dZ4HCvZPLVcN4oL3fiuTxW8aTAolH985M2yemcaPIhlMESK+dndN8yod9bWssn
 8INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2Iyt1paqFfa8bnLZuJAmu5jpXWlW+M1vy8wgJwjJ1CY=;
 b=64hMAYTCBuTn6M/qO9Pso6nJI6b9XEeaj9V9vKvn/2JOtM5r49ZOjL2xApUSqSarXo
 7g8HtInU3YH6Ok4VA4A04CGLgpPToviMzwfBL7kg/hnk7636szrQTUeg3hlgM2xY9mvt
 EGdYhUTYq98lHg0h6RihnOVTsWD4qFDV0j2V+vnXbGBvcpxPLrnHhdkDeWgRWGTLHJKT
 V+y1o7E2g/ehzcIZCJNBiNjBV78NdaEETUGj3ZyWXceGmTOjuNtVi1Dvi96Z77yWJACN
 KSgIPozHA2wMXMpj4fTO0ACf8UN4KI52UILT169T5XqN/ldn2B59LKa+8Ih50Enpg2a1
 fSqA==
X-Gm-Message-State: AOAM533Bgql+RfABfZYg/0cVxvTuiMThWyzIJkvfiTYM+k5o0SUE6eBh
 IWq95N4syk7FZggaWFrj5GEbC+2cywiJDA==
X-Google-Smtp-Source: ABdhPJz1dr6p63jcA2cZFUTj1w9eBCpk9WlYvlHw9YtJeCyWfuXeoLZ2p0lifXSUzDtWTAdqLCi4wA==
X-Received: by 2002:a17:907:7fa5:b0:6f3:80b1:ef1d with SMTP id
 qk37-20020a1709077fa500b006f380b1ef1dmr18410189ejc.141.1651064914957; 
 Wed, 27 Apr 2022 06:08:34 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170906654800b006f38daa8447sm4712447ejn.145.2022.04.27.06.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 06:08:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] coroutine-lock: qemu_co_queue_restart_all is a
 coroutine-only qemu_co_enter_all
Date: Wed, 27 Apr 2022 15:08:30 +0200
Message-Id: <20220427130830.150180-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427130830.150180-1-pbonzini@redhat.com>
References: <20220427130830.150180-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_co_queue_restart_all is basically the same as qemu_co_enter_all
but without a QemuLockable argument.  That's perfectly fine, but only as
long as the function is marked coroutine_fn.  If used outside coroutine
context, qemu_co_queue_wait will attempt to take the lock and that
is just broken: if you are calling qemu_co_queue_restart_all outside
coroutine context, the lock is going to be a QemuMutex which cannot be
taken twice by the same thread.

The patch adds the marker to qemu_co_queue_restart_all and to its sole
non-coroutine_fn caller; it then reimplements the function in terms of
qemu_co_enter_all_impl, to remove duplicated code and to clarify that the
latter also works in coroutine context.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/io.c                 |  2 +-
 include/qemu/coroutine.h   |  7 ++++---
 util/qemu-coroutine-lock.c | 21 ++++++---------------
 3 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/block/io.c b/block/io.c
index 9769ec53b0..789e6373d5 100644
--- a/block/io.c
+++ b/block/io.c
@@ -751,7 +751,7 @@ void bdrv_drain_all(void)
  *
  * This function should be called when a tracked request is completing.
  */
-static void tracked_request_end(BdrvTrackedRequest *req)
+static void coroutine_fn tracked_request_end(BdrvTrackedRequest *req)
 {
     if (req->serialising) {
         qatomic_dec(&req->bs->serialising_in_flight);
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index e5954635f6..43df7a7e66 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -216,10 +216,11 @@ void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock);
 bool coroutine_fn qemu_co_queue_next(CoQueue *queue);
 
 /**
- * Empties the CoQueue; all coroutines are woken up.
- * OK to run from coroutine and non-coroutine context.
+ * Empties the CoQueue and queues the coroutine to run after
+ * the currently-running coroutine yields.
+ * Used from coroutine context, use qemu_co_enter_all outside.
  */
-void qemu_co_queue_restart_all(CoQueue *queue);
+void coroutine_fn qemu_co_queue_restart_all(CoQueue *queue);
 
 /**
  * Removes the next coroutine from the CoQueue, and wake it up.  Unlike
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 5b0342faed..9ad24ab1af 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -67,21 +67,6 @@ void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuLockable *lock)
     }
 }
 
-void qemu_co_queue_restart_all(CoQueue *queue)
-{
-    Coroutine *next;
-
-    if (QSIMPLEQ_EMPTY(&queue->entries)) {
-        return false;
-    }
-
-    while ((next = QSIMPLEQ_FIRST(&queue->entries)) != NULL) {
-        QSIMPLEQ_REMOVE_HEAD(&queue->entries, co_queue_next);
-        aio_co_wake(next);
-    }
-    return true;
-}
-
 bool qemu_co_enter_next_impl(CoQueue *queue, QemuLockable *lock)
 {
     Coroutine *next;
@@ -115,6 +100,12 @@ void qemu_co_enter_all_impl(CoQueue *queue, QemuLockable *lock)
     }
 }
 
+void coroutine_fn qemu_co_queue_restart_all(CoQueue *queue)
+{
+    /* No unlock/lock needed in coroutine context.  */
+    qemu_co_enter_all_impl(queue, NULL);
+}
+
 bool qemu_co_queue_empty(CoQueue *queue)
 {
     return QSIMPLEQ_FIRST(&queue->entries) == NULL;
-- 
2.35.1


