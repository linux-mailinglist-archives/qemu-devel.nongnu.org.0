Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2B50A16E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:01:56 +0200 (CEST)
Received: from localhost ([::1]:47776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXNa-0003PM-M8
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCu-0003Vk-Mu
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:50:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCs-00068O-7z
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1axO1VEjYNC6DMkddrlCDlXenaHgfxLrHwLvn2ubuA=;
 b=SjdFoF8NI0W8yMMo1Wg5b34dp2R14RMvS7Gs+hxmHD28fHqMPf9tkU5RbM3cwrzIDo3nPP
 stUlGKlwIxnifh01KRrEMrdAZSml3RIrPMGFkdAkHdQwZAuhZ3ciPUQQhIYiVhY13NX/8y
 Pg7vuCFd4QMr/C/zM5Gxq9fAbwPahBw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-wRxDRIYkMAabMPWseCNlnQ-1; Thu, 21 Apr 2022 09:50:46 -0400
X-MC-Unique: wRxDRIYkMAabMPWseCNlnQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E397583396A;
 Thu, 21 Apr 2022 13:50:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D38840C1438;
 Thu, 21 Apr 2022 13:50:44 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 12/30] osdep.h: move qemu_build_not_reached()
Date: Thu, 21 Apr 2022 17:49:22 +0400
Message-Id: <20220421134940.2887768-13-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Move the macro and declaration so it can use glib in the following
patch (it already depends on glib anyway for !optimize)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-19-marcandre.lureau@redhat.com>
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
2.36.0


