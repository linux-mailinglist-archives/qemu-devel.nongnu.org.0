Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04BF30579A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:00:22 +0100 (CET)
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hcb-0006ZD-NU
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:00:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4hXq-0007ut-A7
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:55:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4hXo-0000Il-AL
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 04:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611741323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuPdsf0uHIljSG9Nzfpqv+nnFv7ukQAoQSktRwPuMyY=;
 b=S1u26LQ4/uKRlVFk4IDiPjFIg3157fxnySS9ue9uAKS40LMRze7/8ySXSlIV9twOZG8mTm
 QBBQ1g4BuTTWW4UtlFybGZao5wFZQJ8l2bfSOvKyRD2X6WculLaVFzzLKbZpSt/u/4sf1l
 5B/728OTPDDwjcqsa7J+D1Ch/rN7IYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-59p4p1_8NIi56BM7-HubfQ-1; Wed, 27 Jan 2021 04:55:19 -0500
X-MC-Unique: 59p4p1_8NIi56BM7-HubfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5ECCDCE648;
 Wed, 27 Jan 2021 09:55:18 +0000 (UTC)
Received: from thuth.com (ovpn-112-136.ams2.redhat.com [10.36.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB08B5D9C6;
 Wed, 27 Jan 2021 09:55:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 9/9] libqtest: Rework qtest_rsp()
Date: Wed, 27 Jan 2021 10:54:44 +0100
Message-Id: <20210127095444.114495-10-thuth@redhat.com>
In-Reply-To: <20210127095444.114495-1-thuth@redhat.com>
References: <20210127095444.114495-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

qtest_rsp() is used in two different ways: (1) return some arguments
to caller, which the caller must free, and (2) return no arguments to
caller.  Passing non-zero @expected_args gets you (1), and passing
zero gets you (2).

Having "the return value must be freed" depend on an argument this way
is less than ideal.

Provide separate functions for the two ways: (1) qtest_rsp_args()
takes @expected_args (possibly zero), and returns that number of
arguments.  Caller must free the return value always.  (2) qtest_rsp()
assumes zero, and returns nothing.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210126151649.2220902-1-armbru@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqtest.c | 50 ++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 5249a628cc..fd043b0570 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -503,7 +503,7 @@ static GString *qtest_client_socket_recv_line(QTestState *s)
     return line;
 }
 
-static gchar **qtest_rsp(QTestState *s, int expected_args)
+static gchar **qtest_rsp_args(QTestState *s, int expected_args)
 {
     GString *line;
     gchar **words;
@@ -539,25 +539,27 @@ redo:
     g_assert(words[0] != NULL);
     g_assert_cmpstr(words[0], ==, "OK");
 
-    if (expected_args) {
-        for (i = 0; i < expected_args; i++) {
-            g_assert(words[i] != NULL);
-        }
-    } else {
-        g_strfreev(words);
-        words = NULL;
+    for (i = 0; i < expected_args; i++) {
+        g_assert(words[i] != NULL);
     }
 
     return words;
 }
 
+static void qtest_rsp(QTestState *s)
+{
+    gchar **words = qtest_rsp_args(s, 0);
+
+    g_strfreev(words);
+}
+
 static int qtest_query_target_endianness(QTestState *s)
 {
     gchar **args;
     int big_endian;
 
     qtest_sendf(s, "endianness\n");
-    args = qtest_rsp(s, 1);
+    args = qtest_rsp_args(s, 1);
     g_assert(strcmp(args[1], "big") == 0 || strcmp(args[1], "little") == 0);
     big_endian = strcmp(args[1], "big") == 0;
     g_strfreev(args);
@@ -892,14 +894,14 @@ bool qtest_get_irq(QTestState *s, int num)
 void qtest_module_load(QTestState *s, const char *prefix, const char *libname)
 {
     qtest_sendf(s, "module_load %s %s\n", prefix, libname);
-    qtest_rsp(s, 0);
+    qtest_rsp(s);
 }
 
 static int64_t qtest_clock_rsp(QTestState *s)
 {
     gchar **words;
     int64_t clock;
-    words = qtest_rsp(s, 2);
+    words = qtest_rsp_args(s, 2);
     clock = g_ascii_strtoll(words[1], NULL, 0);
     g_strfreev(words);
     return clock;
@@ -926,13 +928,13 @@ int64_t qtest_clock_set(QTestState *s, int64_t val)
 void qtest_irq_intercept_out(QTestState *s, const char *qom_path)
 {
     qtest_sendf(s, "irq_intercept_out %s\n", qom_path);
-    qtest_rsp(s, 0);
+    qtest_rsp(s);
 }
 
 void qtest_irq_intercept_in(QTestState *s, const char *qom_path)
 {
     qtest_sendf(s, "irq_intercept_in %s\n", qom_path);
-    qtest_rsp(s, 0);
+    qtest_rsp(s);
 }
 
 void qtest_set_irq_in(QTestState *s, const char *qom_path, const char *name,
@@ -942,13 +944,13 @@ void qtest_set_irq_in(QTestState *s, const char *qom_path, const char *name,
         name = "unnamed-gpio-in";
     }
     qtest_sendf(s, "set_irq_in %s %s %d %d\n", qom_path, name, num, level);
-    qtest_rsp(s, 0);
+    qtest_rsp(s);
 }
 
 static void qtest_out(QTestState *s, const char *cmd, uint16_t addr, uint32_t value)
 {
     qtest_sendf(s, "%s 0x%x 0x%x\n", cmd, addr, value);
-    qtest_rsp(s, 0);
+    qtest_rsp(s);
 }
 
 void qtest_outb(QTestState *s, uint16_t addr, uint8_t value)
@@ -973,7 +975,7 @@ static uint32_t qtest_in(QTestState *s, const char *cmd, uint16_t addr)
     unsigned long value;
 
     qtest_sendf(s, "%s 0x%x\n", cmd, addr);
-    args = qtest_rsp(s, 2);
+    args = qtest_rsp_args(s, 2);
     ret = qemu_strtoul(args[1], NULL, 0, &value);
     g_assert(!ret && value <= UINT32_MAX);
     g_strfreev(args);
@@ -1000,7 +1002,7 @@ static void qtest_write(QTestState *s, const char *cmd, uint64_t addr,
                         uint64_t value)
 {
     qtest_sendf(s, "%s 0x%" PRIx64 " 0x%" PRIx64 "\n", cmd, addr, value);
-    qtest_rsp(s, 0);
+    qtest_rsp(s);
 }
 
 void qtest_writeb(QTestState *s, uint64_t addr, uint8_t value)
@@ -1030,7 +1032,7 @@ static uint64_t qtest_read(QTestState *s, const char *cmd, uint64_t addr)
     uint64_t value;
 
     qtest_sendf(s, "%s 0x%" PRIx64 "\n", cmd, addr);
-    args = qtest_rsp(s, 2);
+    args = qtest_rsp_args(s, 2);
     ret = qemu_strtou64(args[1], NULL, 0, &value);
     g_assert(!ret);
     g_strfreev(args);
@@ -1082,7 +1084,7 @@ void qtest_memread(QTestState *s, uint64_t addr, void *data, size_t size)
     }
 
     qtest_sendf(s, "read 0x%" PRIx64 " 0x%zx\n", addr, size);
-    args = qtest_rsp(s, 2);
+    args = qtest_rsp_args(s, 2);
 
     for (i = 0; i < size; i++) {
         ptr[i] = hex2nib(args[1][2 + (i * 2)]) << 4;
@@ -1098,7 +1100,7 @@ uint64_t qtest_rtas_call(QTestState *s, const char *name,
 {
     qtest_sendf(s, "rtas %s %u 0x%"PRIx64" %u 0x%"PRIx64"\n",
                 name, nargs, args, nret, ret);
-    qtest_rsp(s, 0);
+    qtest_rsp(s);
     return 0;
 }
 
@@ -1134,7 +1136,7 @@ void qtest_bufwrite(QTestState *s, uint64_t addr, const void *data, size_t size)
     qtest_sendf(s, "b64write 0x%" PRIx64 " 0x%zx ", addr, size);
     s->ops.send(s, bdata);
     s->ops.send(s, "\n");
-    qtest_rsp(s, 0);
+    qtest_rsp(s);
     g_free(bdata);
 }
 
@@ -1144,7 +1146,7 @@ void qtest_bufread(QTestState *s, uint64_t addr, void *data, size_t size)
     size_t len;
 
     qtest_sendf(s, "b64read 0x%" PRIx64 " 0x%zx\n", addr, size);
-    args = qtest_rsp(s, 2);
+    args = qtest_rsp_args(s, 2);
 
     g_base64_decode_inplace(args[1], &len);
     if (size != len) {
@@ -1174,14 +1176,14 @@ void qtest_memwrite(QTestState *s, uint64_t addr, const void *data, size_t size)
     }
 
     qtest_sendf(s, "write 0x%" PRIx64 " 0x%zx 0x%s\n", addr, size, enc);
-    qtest_rsp(s, 0);
+    qtest_rsp(s);
     g_free(enc);
 }
 
 void qtest_memset(QTestState *s, uint64_t addr, uint8_t pattern, size_t size)
 {
     qtest_sendf(s, "memset 0x%" PRIx64 " 0x%zx 0x%02x\n", addr, size, pattern);
-    qtest_rsp(s, 0);
+    qtest_rsp(s);
 }
 
 void qtest_qmp_assert_success(QTestState *qts, const char *fmt, ...)
-- 
2.27.0


