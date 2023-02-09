Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B86903F0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 10:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ3L2-0005ei-5l; Thu, 09 Feb 2023 04:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQ3Ky-0005dl-Fg
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:35:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pQ3Kw-0007AV-9t
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 04:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675935325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHrGjYGftXRAjmJOOTXHLF6oyC09PQpeciTj4MeMkGM=;
 b=WFDr1k4ugRZZkvQsM7MbWlyndJ2T8eXU3tdccaNoEoVD5qQHB+22yCGAzoq3rdbdtbDWiC
 tWhxb6xh31F9mog0wFWfiNARXp+2dnEhYUdezorbgzRtHb1I8oiePR7zRrSP4r7e/tXyKY
 CO7Yde0w9GTKVT2+4gXJTBEJh5zeuDM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-353-nv4MuzvfPTaSOD2qbv3CYQ-1; Thu, 09 Feb 2023 04:35:24 -0500
X-MC-Unique: nv4MuzvfPTaSOD2qbv3CYQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 fd23-20020a056402389700b004aaa054d189so1095228edb.11
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 01:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gHrGjYGftXRAjmJOOTXHLF6oyC09PQpeciTj4MeMkGM=;
 b=ZjtwBHhNQ2fJlRAwE9gb/dd7uwlBYEi66rBIHLvlf5QaZ1aorGjzKaoFPqR/L3QSNq
 jcVcgzoz1N41Q7EgL9xd3g0r64Ff/dVGrqyQClDOC5ZDH88OC6GrQMym07TQTMfway5P
 8oZwUR0lxur6eZy3Kntr3foSxIUrAajO62/oxeFPQSfIFxIQrTwc3JjDddT4zOHr26tN
 ujqlYQ9Igrq2xYuuJ6FYrK4hA4bFwjvstPLwjxnzCMfMn+AJ5eviCvzxK+VRtpUcs1AM
 47ualVIs5HmChvMiXLwC2ViKLtUB4BP+EPORGVREaEM1YePJ5rFwCULnfny7nn1xKo/I
 Mu4A==
X-Gm-Message-State: AO0yUKVr8NuffBkIId119E/y5qEgGI7osMj+/V2sUEruMl3YkAgYX0/d
 WS6Cv8ynGLScHdtZWZ2FaQlhn/9qVD/A2gVg+F05ZUB8d9D5elmRTZ25Ak57LUvXkM+1AlrVa7q
 wwDEnDeh9LyQ+ZO4LXZizlTBCB4IajsbNNxC6WleCpL68BsNl4NnEw9eLyOQPSedTGh4D7hNP
X-Received: by 2002:a50:d744:0:b0:4aa:a4dd:aab2 with SMTP id
 i4-20020a50d744000000b004aaa4ddaab2mr10644129edj.11.1675935322753; 
 Thu, 09 Feb 2023 01:35:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/fJkc8Riw7eM5INDLniZDC1n6Ly1hs4NVNancyRPWoyD56vUSAoiuCRFG4G91Iq0ZWnFQE5w==
X-Received: by 2002:a50:d744:0:b0:4aa:a4dd:aab2 with SMTP id
 i4-20020a50d744000000b004aaa4ddaab2mr10644112edj.11.1675935322432; 
 Thu, 09 Feb 2023 01:35:22 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a50d749000000b00495f4535a33sm496101edj.74.2023.02.09.01.35.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 01:35:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/11] readconfig-test: add test for accelerator
 configuration
Date: Thu,  9 Feb 2023 10:35:14 +0100
Message-Id: <20230209093514.177999-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209093514.177999-1-pbonzini@redhat.com>
References: <20230209093514.177999-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Test that it does not cause a SIGSEGV, and cover a valid configuration
as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqtest.c        | 28 +++++++++++++++++-----
 tests/qtest/libqtest.h        | 12 ++++++++++
 tests/qtest/readconfig-test.c | 45 ++++++++++++++++++++++++++++-------
 3 files changed, 70 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index ce5f235e25f1..5f9d7440781c 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -420,6 +420,26 @@ static QTestState *G_GNUC_PRINTF(1, 2) qtest_spawn_qemu(const char *fmt, ...)
     return s;
 }
 
+QTestState *qtest_init_bare(const char *args)
+{
+    QTestState *s = qtest_spawn_qemu("%s", args);
+
+    /*
+     * Stopping QEMU for debugging is not supported on Windows.
+     *
+     * Using DebugActiveProcess() API can suspend the QEMU process,
+     * but gdb cannot attach to the process. Using the undocumented
+     * NtSuspendProcess() can suspend the QEMU process and gdb can
+     * attach to the process, but gdb cannot resume it.
+     */
+#ifndef _WIN32
+    if (getenv("QTEST_STOP")) {
+        kill(s->qemu_pid, SIGSTOP);
+    }
+#endif
+    return s;
+}
+
 QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 {
     QTestState *s;
@@ -477,12 +497,8 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     }
 
     /*
-     * Stopping QEMU for debugging is not supported on Windows.
-     *
-     * Using DebugActiveProcess() API can suspend the QEMU process,
-     * but gdb cannot attach to the process. Using the undocumented
-     * NtSuspendProcess() can suspend the QEMU process and gdb can
-     * attach to the process, but gdb cannot resume it.
+     * Stopping QEMU for debugging is not supported on Windows;
+     * see qtest_init_bare for more information.
      */
 #ifndef _WIN32
     if (getenv("QTEST_STOP")) {
diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
index fcf1c3c3b36f..7ca7df26a2c0 100644
--- a/tests/qtest/libqtest.h
+++ b/tests/qtest/libqtest.h
@@ -23,6 +23,18 @@
 
 typedef struct QTestState QTestState;
 
+/**
+ * qtest_init_bare:
+ * @extra_args: other arguments to pass to QEMU.  CAUTION: these
+ * arguments are subject to word splitting and shell evaluation.
+ *
+ * Return a QTestState instance without automatically creating any
+ * sockets for QMP and qtest communication.
+ *
+ * Returns: #QTestState instance.
+ */
+QTestState *qtest_init_bare(const char *args);
+
 /**
  * qtest_initf:
  * @fmt: Format for creating other arguments to pass to QEMU, formatted
diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c
index 9ef870643dcd..4c11883e36eb 100644
--- a/tests/qtest/readconfig-test.c
+++ b/tests/qtest/readconfig-test.c
@@ -19,13 +19,11 @@
 #include "qapi/qmp/qstring.h"
 #include "qemu/units.h"
 
-static QTestState *qtest_init_with_config(const char *cfgdata)
+static char *qtest_write_config(const char *cfgdata)
 {
     GError *error = NULL;
-    g_autofree char *args = NULL;
     int cfgfd = -1;
-    g_autofree char *cfgpath = NULL;
-    QTestState *qts;
+    char *cfgpath;
     ssize_t ret;
 
     cfgfd = g_file_open_tmp("readconfig-test-XXXXXX", &cfgpath, &error);
@@ -38,13 +36,14 @@ static QTestState *qtest_init_with_config(const char *cfgdata)
         unlink(cfgpath);
     }
     g_assert_cmpint(ret, ==, strlen(cfgdata));
+    return cfgpath;
+}
 
-    args = g_strdup_printf("-nodefaults -machine none -readconfig %s", cfgpath);
-
-    qts = qtest_init(args);
-
+static QTestState *qtest_init_with_config(const char *cfgdata)
+{
+    g_autofree char *cfgpath = qtest_write_config(cfgdata);
+    QTestState *qts = qtest_initf("-nodefaults -machine none -readconfig %s", cfgpath);
     unlink(cfgpath);
-
     return qts;
 }
 
@@ -176,6 +175,32 @@ static void test_object_rng(void)
     qtest_quit(qts);
 }
 
+static void test_valid_accel(void)
+{
+    const char *cfgdata =
+        "[accel]\n"
+        "accel = \"qtest\"\n";
+
+    QTestState *qts = qtest_init_with_config(cfgdata);
+    qtest_quit(qts);
+}
+
+static void test_invalid_accel(void)
+{
+    const char *cfgdata =
+        "[accel]\n"
+        "foo = \"bar\"\n";
+
+    g_autofree char *cfgpath = qtest_write_config(cfgdata);
+    g_autofree char *args = g_strdup_printf("-nodefaults -machine none -readconfig %s", cfgpath);
+    QTestState *qts = qtest_init_bare(args);
+
+    qtest_set_expected_status(qts, 1);
+    qtest_wait_qemu(qts);
+    g_free(qts);
+    unlink(cfgpath);
+}
+
 int main(int argc, char *argv[])
 {
     const char *arch;
@@ -192,6 +217,8 @@ int main(int argc, char *argv[])
 #endif
 
     qtest_add_func("readconfig/object-rng", test_object_rng);
+    qtest_add_func("readconfig/invalid-accel", test_invalid_accel);
+    qtest_add_func("readconfig/valid-accel", test_valid_accel);
 
     return g_test_run();
 }
-- 
2.39.1


