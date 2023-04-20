Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BF06E8FB3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:13:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHm-00011N-TM; Thu, 20 Apr 2023 06:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHd-0000vZ-82
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHP-00081U-HI
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ow3suq6HdZlApb8kGTHqFnMSXt0DgvQ5TW/+sGgzB5Q=;
 b=GDUklUUZN4FvOjWYfhJyiNbBziQvmoHl+YvgPZYUDqcYZfzhB9HwfuzncQAtgvtGMx6haJ
 a9nd/Jpv+stqKkd4NDRWye074q9KY2HUiu0t+cAlNBupcSaCSZYOb3ggDRzfopqvxQ1S87
 gtUnIF7OgZmmrBq1G9pa2dMc5EEjMoQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-aaYJJ3swPSyCmN4Ve9OnCg-1; Thu, 20 Apr 2023 06:12:36 -0400
X-MC-Unique: aaYJJ3swPSyCmN4Ve9OnCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3F4C2823814;
 Thu, 20 Apr 2023 10:12:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3B095AB7A;
 Thu, 20 Apr 2023 10:12:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 12/23] softmmu/qtest: Move the target-specific pseries RTAS
 code out of qtest.c
Date: Thu, 20 Apr 2023 12:12:05 +0200
Message-Id: <20230420101216.786304-13-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ideally, qtest.c should be independent from target specific code, so
we only have to compile it once for all targets. Thus start improving
the situation by moving the pseries related code to hw/ppc/spapr_rtas.c
instead and allow target code to register a callback handler for such
target specific commands.

Message-Id: <20230411183418.1640500-2-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/sysemu/qtest.h |  4 ++++
 hw/ppc/spapr_rtas.c    | 29 +++++++++++++++++++++++++++++
 softmmu/qtest.c        | 39 +++++++++++++--------------------------
 3 files changed, 46 insertions(+), 26 deletions(-)

diff --git a/include/sysemu/qtest.h b/include/sysemu/qtest.h
index 4c53537ef3..85f05b0e46 100644
--- a/include/sysemu/qtest.h
+++ b/include/sysemu/qtest.h
@@ -14,6 +14,7 @@
 #ifndef QTEST_H
 #define QTEST_H
 
+#include "chardev/char.h"
 
 extern bool qtest_allowed;
 
@@ -22,6 +23,9 @@ static inline bool qtest_enabled(void)
     return qtest_allowed;
 }
 
+void qtest_send_prefix(CharBackend *chr);
+void G_GNUC_PRINTF(2, 3) qtest_sendf(CharBackend *chr, const char *fmt, ...);
+void qtest_set_command_cb(bool (*pc_cb)(CharBackend *chr, gchar **words));
 bool qtest_driver(void);
 
 void qtest_server_init(const char *qtest_chrdev, const char *qtest_log, Error **errp);
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 3f664ea02c..7df21581c2 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -33,6 +33,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
+#include "sysemu/qtest.h"
 #include "kvm_ppc.h"
 
 #include "hw/ppc/spapr.h"
@@ -548,6 +549,32 @@ uint64_t qtest_rtas_call(char *cmd, uint32_t nargs, uint64_t args,
     return H_PARAMETER;
 }
 
+static bool spapr_qtest_callback(CharBackend *chr, gchar **words)
+{
+    if (strcmp(words[0], "rtas") == 0) {
+        uint64_t res, args, ret;
+        unsigned long nargs, nret;
+        int rc;
+
+        rc = qemu_strtoul(words[2], NULL, 0, &nargs);
+        g_assert(rc == 0);
+        rc = qemu_strtou64(words[3], NULL, 0, &args);
+        g_assert(rc == 0);
+        rc = qemu_strtoul(words[4], NULL, 0, &nret);
+        g_assert(rc == 0);
+        rc = qemu_strtou64(words[5], NULL, 0, &ret);
+        g_assert(rc == 0);
+        res = qtest_rtas_call(words[1], nargs, args, nret, ret);
+
+        qtest_send_prefix(chr);
+        qtest_sendf(chr, "OK %"PRIu64"\n", res);
+
+        return true;
+    }
+
+    return false;
+}
+
 void spapr_rtas_register(int token, const char *name, spapr_rtas_fn fn)
 {
     assert((token >= RTAS_TOKEN_BASE) && (token < RTAS_TOKEN_MAX));
@@ -630,6 +657,8 @@ static void core_rtas_register_types(void)
                         rtas_ibm_nmi_register);
     spapr_rtas_register(RTAS_IBM_NMI_INTERLOCK, "ibm,nmi-interlock",
                         rtas_ibm_nmi_interlock);
+
+    qtest_set_command_cb(spapr_qtest_callback);
 }
 
 type_init(core_rtas_register_types)
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 26852996b5..09126df38a 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -29,10 +29,6 @@
 #include "qemu/module.h"
 #include "qemu/cutils.h"
 #include "qom/object_interfaces.h"
-#include CONFIG_DEVICES
-#ifdef CONFIG_PSERIES
-#include "hw/ppc/spapr_rtas.h"
-#endif
 
 #define MAX_IRQ 256
 
@@ -263,7 +259,7 @@ static int hex2nib(char ch)
     }
 }
 
-static void qtest_send_prefix(CharBackend *chr)
+void qtest_send_prefix(CharBackend *chr)
 {
     if (!qtest_log_fp || !qtest_opened) {
         return;
@@ -302,8 +298,7 @@ static void qtest_send(CharBackend *chr, const char *str)
     qtest_server_send(qtest_server_send_opaque, str);
 }
 
-static void G_GNUC_PRINTF(2, 3) qtest_sendf(CharBackend *chr,
-                                           const char *fmt, ...)
+void qtest_sendf(CharBackend *chr, const char *fmt, ...)
 {
     va_list ap;
     gchar *buffer;
@@ -361,6 +356,15 @@ static void qtest_clock_warp(int64_t dest)
     qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
 }
 
+static bool (*process_command_cb)(CharBackend *chr, gchar **words);
+
+void qtest_set_command_cb(bool (*pc_cb)(CharBackend *chr, gchar **words))
+{
+    assert(!process_command_cb);  /* Switch to a list if we need more than one */
+
+    process_command_cb = pc_cb;
+}
+
 static void qtest_process_command(CharBackend *chr, gchar **words)
 {
     const gchar *command;
@@ -717,25 +721,6 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         qtest_sendf(chr, "OK big\n");
 #else
         qtest_sendf(chr, "OK little\n");
-#endif
-#ifdef CONFIG_PSERIES
-    } else if (strcmp(words[0], "rtas") == 0) {
-        uint64_t res, args, ret;
-        unsigned long nargs, nret;
-        int rc;
-
-        rc = qemu_strtoul(words[2], NULL, 0, &nargs);
-        g_assert(rc == 0);
-        rc = qemu_strtou64(words[3], NULL, 0, &args);
-        g_assert(rc == 0);
-        rc = qemu_strtoul(words[4], NULL, 0, &nret);
-        g_assert(rc == 0);
-        rc = qemu_strtou64(words[5], NULL, 0, &ret);
-        g_assert(rc == 0);
-        res = qtest_rtas_call(words[1], nargs, args, nret, ret);
-
-        qtest_send_prefix(chr);
-        qtest_sendf(chr, "OK %"PRIu64"\n", res);
 #endif
     } else if (qtest_enabled() && strcmp(words[0], "clock_step") == 0) {
         int64_t ns;
@@ -777,6 +762,8 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         qtest_send_prefix(chr);
         qtest_sendf(chr, "OK %"PRIi64"\n",
                     (int64_t)qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+    } else if (process_command_cb && process_command_cb(chr, words)) {
+        /* Command got consumed by the callback handler */
     } else {
         qtest_send_prefix(chr);
         qtest_sendf(chr, "FAIL Unknown command '%s'\n", words[0]);
-- 
2.31.1


