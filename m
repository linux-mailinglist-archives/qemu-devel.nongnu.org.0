Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9B14C3541
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:02:13 +0100 (CET)
Received: from localhost ([::1]:44918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJNU-0000WX-BT
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:02:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNIzx-0000Z4-DN
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:37:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nNIzv-0003NQ-S0
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645727871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MrKuDEU/6LjpVnJf1BPKI/F7HDjtqs4rOhpxMKDt7fk=;
 b=f4q1HB4g9bDTSPVTtEpiAmhqoQJl61HL8FljwkDmwJsfRMPm99XzoE7NpddxfoY23oXGFD
 6MMFgFEqwl3Zh/ae82DejQBZPVOETI2NGcvu2TXiHZ93o3cKbRLAXRTXf3icPAyWRaYDRh
 6+YB3/YEhJHPOyLo3ykVjTQZ8fr/Wm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-gcB0kXxrPpCTWkJhikYWxw-1; Thu, 24 Feb 2022 13:37:48 -0500
X-MC-Unique: gcB0kXxrPpCTWkJhikYWxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDF8F1091DA1;
 Thu, 24 Feb 2022 18:37:46 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5F622B476;
 Thu, 24 Feb 2022 18:37:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 03/12] osdep.h: move qemu_build_not_reached()
Date: Thu, 24 Feb 2022 22:36:52 +0400
Message-Id: <20220224183701.608720-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220224183701.608720-1-marcandre.lureau@redhat.com>
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Move the macro and declaration so it can use glib in the following
patch.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h | 16 ----------------
 include/qemu/osdep.h    | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 0a5e67fb970e..a2d2d48dcf34 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -151,22 +151,6 @@
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
index 7bcce3bceb0f..fb72b0006d5c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -157,6 +157,22 @@ extern "C" {
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
2.35.1.273.ge6ebfd0e8cbb


