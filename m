Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9069A508AE1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:36:41 +0200 (CEST)
Received: from localhost ([::1]:51772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBRg-00049Q-Lb
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhANN-0007fl-UC
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhANM-0004ef-EO
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sU7F/DAl1CE+Ri1yaIY1sraoHu5DBzMx7fbgXfTkU8Q=;
 b=K9Ke4oqR+T6Z2KBIygq041dRmWzxSc7m00LT4PFf3b7noqhVT50nyLRj9pDuBZYYbemlLI
 osbM7Z6/eGQ9Q2ohpUl9iYwxum2RjNTC99DiYLfLBEox0NlU8Oe2YhgfqFSo7ptmDvroDB
 FlHtBPReis8Zr67I/KsdFn5X9dVtwJI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-EWH_cYLxP2iFmw3M6R--Iw-1; Wed, 20 Apr 2022 09:28:06 -0400
X-MC-Unique: EWH_cYLxP2iFmw3M6R--Iw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FAA73820F64
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:28:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56BCB140EBD5;
 Wed, 20 Apr 2022 13:28:05 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 18/41] osdep.h: move qemu_build_not_reached()
Date: Wed, 20 Apr 2022 17:26:01 +0400
Message-Id: <20220420132624.2439741-19-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Move the macro and declaration so it can use glib in the following
patch (it already depends on glib anyway for !optimize)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h | 16 ----------------
 include/qemu/osdep.h    | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index d9359859d435..c13bc8b58652 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -156,22 +156,6 @@
 #define QEMU_ALWAYS_INLINE
 #endif
 
-/**
- * qemu_build_not_reached()
- *
- * The compiler, during optimization, is expected to prove that a call
- * to this function cannot be reached and remove it.  If the compiler
- * supports QEMU_ERROR, this will be reported at compile time; otherwise
- * this will be reported at link time due to the missing symbol.
- */
-extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
-    qemu_build_not_reached_always(void);
-#if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
-#define qemu_build_not_reached()  qemu_build_not_reached_always()
-#else
-#define qemu_build_not_reached()  g_assert_not_reached()
-#endif
-
 /**
  * In most cases, normal "fallthrough" comments are good enough for
  * switch-case statements, but sometimes the compiler has problems
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index a7332947107a..848916f5165c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -169,6 +169,22 @@ extern "C" {
 #define assert(x)  g_assert(x)
 #endif
 
+/**
+ * qemu_build_not_reached()
+ *
+ * The compiler, during optimization, is expected to prove that a call
+ * to this function cannot be reached and remove it.  If the compiler
+ * supports QEMU_ERROR, this will be reported at compile time; otherwise
+ * this will be reported at link time due to the missing symbol.
+ */
+extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
+    qemu_build_not_reached_always(void);
+#if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
+#define qemu_build_not_reached()  qemu_build_not_reached_always()
+#else
+#define qemu_build_not_reached()  g_assert_not_reached()
+#endif
+
 /*
  * According to waitpid man page:
  * WCOREDUMP
-- 
2.35.1.693.g805e0a68082a


