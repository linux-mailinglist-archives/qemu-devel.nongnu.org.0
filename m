Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943535F56A7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 16:46:00 +0200 (CEST)
Received: from localhost ([::1]:47296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og5ep-0005PN-2J
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 10:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1og5G5-0004NW-JX
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 10:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1og5G3-0007ks-5J
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 10:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664979620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4l7fQGpm8PtgeTozS+O+nPvUkTy13M6/dRoHZ6edZ+4=;
 b=a3b17tuX4OomUD6gAmXhG7vG3bbj5OiUmFHe+hZFOd/U4OwS+CttvUcCikIDEb8acFoQ4M
 uqI5gzJr4WHsUPxmq5xf/V2anKlGTzGCDsVqLOQ2QaYnB3pXgTzmMnqAdyjD2B1AGz8xGf
 oBnHPX/qHh+hWXTMbyI5pD/aSeKLdj0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-BPFSJpfwP9Gwm_A0KReMtg-1; Wed, 05 Oct 2022 10:20:17 -0400
X-MC-Unique: BPFSJpfwP9Gwm_A0KReMtg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2653E85A583;
 Wed,  5 Oct 2022 14:20:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 503DE49BB67;
 Wed,  5 Oct 2022 14:20:15 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alberto Faria <afaria@redhat.com>
Subject: [PATCH] coroutine: Make qemu_coroutine_self() return NULL if not in
 coroutine
Date: Wed,  5 Oct 2022 15:20:06 +0100
Message-Id: <20221005142006.926013-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

qemu_coroutine_self() is used in several places outside of coroutine
context (mostly in qcow2 tracing calls).

Ensure qemu_coroutine_self() works properly when not called from
coroutine context, returning NULL in that case, and remove its
coroutine_fn annotation.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 include/qemu/coroutine.h     |  5 +++--
 util/coroutine-sigaltstack.c |  4 ++--
 util/coroutine-ucontext.c    | 18 +++++++++---------
 util/coroutine-win32.c       |  9 +--------
 4 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index e55b36f49a..0b9c8b8dac 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -95,9 +95,10 @@ void coroutine_fn qemu_coroutine_yield(void);
 AioContext *qemu_coroutine_get_aio_context(Coroutine *co);
 
 /**
- * Get the currently executing coroutine
+ * Get the currently executing coroutine, or NULL if not called from coroutine
+ * context
  */
-Coroutine *coroutine_fn qemu_coroutine_self(void);
+Coroutine *qemu_coroutine_self(void);
 
 /**
  * Return whether or not currently inside a coroutine
diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
index e2690c5f41..d9d90187a8 100644
--- a/util/coroutine-sigaltstack.c
+++ b/util/coroutine-sigaltstack.c
@@ -289,9 +289,9 @@ CoroutineAction qemu_coroutine_switch(Coroutine *from_, Coroutine *to_,
 
 Coroutine *qemu_coroutine_self(void)
 {
-    CoroutineThreadState *s = coroutine_get_thread_state();
+    CoroutineThreadState *s = pthread_getspecific(thread_state_key);
 
-    return s->current;
+    return s && s->current->caller ? s->current : NULL;
 }
 
 bool qemu_in_coroutine(void)
diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
index ddc98fb4f8..d1dfe0dae5 100644
--- a/util/coroutine-ucontext.c
+++ b/util/coroutine-ucontext.c
@@ -320,18 +320,18 @@ qemu_coroutine_switch(Coroutine *from_, Coroutine *to_,
 Coroutine *qemu_coroutine_self(void)
 {
     Coroutine *self = get_current();
-    CoroutineUContext *leaderp = get_ptr_leader();
 
-    if (!self) {
-        self = &leaderp->base;
-        set_current(self);
-    }
+    if (self && self->caller) {
 #ifdef CONFIG_TSAN
-    if (!leaderp->tsan_co_fiber) {
-        leaderp->tsan_co_fiber = __tsan_get_current_fiber();
-    }
+        CoroutineUContext *leaderp = get_ptr_leader();
+        if (!leaderp->tsan_co_fiber) {
+            leaderp->tsan_co_fiber = __tsan_get_current_fiber();
+        }
 #endif
-    return self;
+        return self;
+    } else {
+        return NULL;
+    }
 }
 
 bool qemu_in_coroutine(void)
diff --git a/util/coroutine-win32.c b/util/coroutine-win32.c
index 7db2e8f8c8..97a593da7a 100644
--- a/util/coroutine-win32.c
+++ b/util/coroutine-win32.c
@@ -91,14 +91,7 @@ Coroutine *qemu_coroutine_self(void)
 {
     Coroutine *current = get_current();
 
-    if (!current) {
-        CoroutineWin32 *leader = get_ptr_leader();
-
-        current = &leader->base;
-        set_current(current);
-        leader->fiber = ConvertThreadToFiber(NULL);
-    }
-    return current;
+    return current && current->caller ? current : NULL;
 }
 
 bool qemu_in_coroutine(void)
-- 
2.37.3


