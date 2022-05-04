Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1966551A260
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:38:17 +0200 (CEST)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG8u-0006t1-5C
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwn-0000v8-6I
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwk-0007I2-JQ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLs/ZyOmTap6tSoe0X8sZsyHCHNLeD5jO0y/BaAN5Uo=;
 b=fqSjv00vhtDKWdrJXObWrwxK7Lf3Rjg9mjBuHssZ4UGL18GcZdzSnQ3HlCb6/4GJPrEtjo
 2WMN56Wp3UBfv6dJwf4QOtklF/z266c0oMVj+61cy8BX1FXyCo0tYuJQn0mMXxvH5KSEKl
 kiTjviO602rkkvRsa6i7CfwYMAs3F7I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-A-edhbaSMZ-g1fMyii9IOg-1; Wed, 04 May 2022 10:25:40 -0400
X-MC-Unique: A-edhbaSMZ-g1fMyii9IOg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A46A5801E80;
 Wed,  4 May 2022 14:25:39 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 254D7402189;
 Wed,  4 May 2022 14:25:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 13/13] coroutine-win32: use QEMU_DEFINE_STATIC_CO_TLS()
Date: Wed,  4 May 2022 16:25:22 +0200
Message-Id: <20220504142522.167506-14-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

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
Message-Id: <20220307153853.602859-4-stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 util/coroutine-win32.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/util/coroutine-win32.c b/util/coroutine-win32.c
index c196f956d2..7db2e8f8c8 100644
--- a/util/coroutine-win32.c
+++ b/util/coroutine-win32.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/coroutine_int.h"
+#include "qemu/coroutine-tls.h"
 
 typedef struct
 {
@@ -33,8 +34,8 @@ typedef struct
     CoroutineAction action;
 } CoroutineWin32;
 
-static __thread CoroutineWin32 leader;
-static __thread Coroutine *current;
+QEMU_DEFINE_STATIC_CO_TLS(CoroutineWin32, leader);
+QEMU_DEFINE_STATIC_CO_TLS(Coroutine *, current);
 
 /* This function is marked noinline to prevent GCC from inlining it
  * into coroutine_trampoline(). If we allow it to do that then it
@@ -51,7 +52,7 @@ qemu_coroutine_switch(Coroutine *from_, Coroutine *to_,
     CoroutineWin32 *from = DO_UPCAST(CoroutineWin32, base, from_);
     CoroutineWin32 *to = DO_UPCAST(CoroutineWin32, base, to_);
 
-    current = to_;
+    set_current(to_);
 
     to->action = action;
     SwitchToFiber(to->fiber);
@@ -88,14 +89,21 @@ void qemu_coroutine_delete(Coroutine *co_)
 
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


