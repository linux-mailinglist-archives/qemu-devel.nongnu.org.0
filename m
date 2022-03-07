Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8B44D0373
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:52:56 +0100 (CET)
Received: from localhost ([::1]:57078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFfL-0001FF-CV
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRFSW-0001se-FU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:39:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRFSU-0004Fj-UI
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646667578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtPyu4SE08yqpJyQZ1vSYghMG9hrA1SFpeRBeHQXJcE=;
 b=DgYY5uN3JQxuyPXMAogt6w9rVTyUkvvl8Ljx89+49Ol6jcFaUroFNW0tatuh/XPI7LlEFy
 PZYCDKD4emfJ1KcyWuRuTrH2byUm7nmIwJhv9b5KV2HsMex3tocLfNsD0sbkMcTkMj11oh
 TkPHwR6QUqasI7046xDOL34FL0Q7ec8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-Zucy5zwaOtWELFOPLrBDCQ-1; Mon, 07 Mar 2022 10:39:35 -0500
X-MC-Unique: Zucy5zwaOtWELFOPLrBDCQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDF9251DC;
 Mon,  7 Mar 2022 15:39:33 +0000 (UTC)
Received: from localhost (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E8A77DE58;
 Mon,  7 Mar 2022 15:39:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] coroutine-win32: use QEMU_DEFINE_STATIC_CO_TLS()
Date: Mon,  7 Mar 2022 15:38:53 +0000
Message-Id: <20220307153853.602859-4-stefanha@redhat.com>
In-Reply-To: <20220307153853.602859-1-stefanha@redhat.com>
References: <20220307153853.602859-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thread-Local Storage variables cannot be used directly from coroutine
code because the compiler may optimize TLS variable accesses across
qemu_coroutine_yield() calls. When the coroutine is re-entered from
another thread the TLS variables from the old thread must no longer be
used.

Use QEMU_DEFINE_STATIC_CO_TLS() for the current and leader variables.

I think coroutine-win32.c could get away with __thread because the
variables are only used in situations where either the stale value is
correct (current) or outside coroutine context (loading leader when
current is NULL). Due to the difficulty of being sure that this is
really safe in all scenarios it seems worth converting it anyway.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/coroutine-win32.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/util/coroutine-win32.c b/util/coroutine-win32.c
index de6bd4fd3e..c02a62c896 100644
--- a/util/coroutine-win32.c
+++ b/util/coroutine-win32.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/coroutine_int.h"
+#include "qemu/coroutine-tls.h"
 
 typedef struct
 {
@@ -34,8 +35,8 @@ typedef struct
     CoroutineAction action;
 } CoroutineWin32;
 
-static __thread CoroutineWin32 leader;
-static __thread Coroutine *current;
+QEMU_DEFINE_STATIC_CO_TLS(CoroutineWin32, leader);
+QEMU_DEFINE_STATIC_CO_TLS(Coroutine *, current);
 
 /* This function is marked noinline to prevent GCC from inlining it
  * into coroutine_trampoline(). If we allow it to do that then it
@@ -52,7 +53,7 @@ qemu_coroutine_switch(Coroutine *from_, Coroutine *to_,
     CoroutineWin32 *from = DO_UPCAST(CoroutineWin32, base, from_);
     CoroutineWin32 *to = DO_UPCAST(CoroutineWin32, base, to_);
 
-    current = to_;
+    set_current(to_);
 
     to->action = action;
     SwitchToFiber(to->fiber);
@@ -89,14 +90,21 @@ void qemu_coroutine_delete(Coroutine *co_)
 
 Coroutine *qemu_coroutine_self(void)
 {
+    Coroutine *current = get_current();
+
     if (!current) {
-        current = &leader.base;
-        leader.fiber = ConvertThreadToFiber(NULL);
+        CoroutineWin32 *leader = get_ptr_leader();
+
+        current = &leader->base;
+        set_current(current);
+        leader->fiber = ConvertThreadToFiber(NULL);
     }
     return current;
 }
 
 bool qemu_in_coroutine(void)
 {
+    Coroutine *current = get_current();
+
     return current && current->caller;
 }
-- 
2.35.1


