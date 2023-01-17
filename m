Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5325A66D799
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHh1K-0002vq-TO; Tue, 17 Jan 2023 03:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh0s-0002q8-1U
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:08:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pHh0p-0000Sf-Ih
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673942882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qpw/5/aIJktG9Q0OND3WGSL83i6tZBDG69a8KADEOQs=;
 b=UBOwW5mnaLX8/eAKuKZMH9k0HVJ7YS1yp/wfQinqfs0+c/XB5jzYZ7goG50e9aLsjzv+ld
 jyk8zCFPyEo2Zyy4oEfZkEoZC16uIHpWoUOVC62R2qtm4f04j5z6Io1mE9RybhDFIj1uJ8
 rKvjdzW5UdQ19JkmpdZi8Kj7qPLIYtY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468-sDwVsEc8N8CkeGmJ39EhKw-1; Tue, 17 Jan 2023 03:08:01 -0500
X-MC-Unique: sDwVsEc8N8CkeGmJ39EhKw-1
Received: by mail-ed1-f70.google.com with SMTP id
 t17-20020a056402525100b0049e0d2dd9b1so3828604edd.11
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qpw/5/aIJktG9Q0OND3WGSL83i6tZBDG69a8KADEOQs=;
 b=MlvQQNfa0/Q8l2OrRQ5IvJaPClZqETXzxSPi0cgWB43GWbxngBsXNWIcyTllkYf4eg
 /lQPImZrHFUPB6MnZ+AMcPSXzDbzzXa/ZJRLlW++lSvuKLiTtlyaHGZAevZyGnLEiTAR
 mAEkT/tg9PtzPY+ec6GskSVRHT2UbViBb39DJx7DM3GXKfc7J0/BTgNIJBlIxB9kWdvx
 QS/pSD2Gz4IP7eSWnFYHQ0AvmAZkekNNvpQuD1LvGk4/nDRumhkCgKcLyIvgsuqoqcpO
 aPZraqCGNGF+5rMbUjDZUSa4N6UfIG5DFIZhBtD+9OPOPLOigMm931mOX+OemiPejJoj
 EV6Q==
X-Gm-Message-State: AFqh2koy4TQQnIoq8t+YfUrgCsPPakgFnLkv98VvtbZzXeCatpuIQwrF
 81D4NjRdU1vfBybFulggAho/dcvIUXnGvJ7HAbYqXSK6XIaifsXxmYjpC4QvhU4VpAtfIlKIo6C
 T0WzzXaoYCIBt5DWPkBVPOUTHnuOwj0V9zT1xlUN1DLwzkbORmU51SfdxwmIQCMXrT7g=
X-Received: by 2002:a05:6402:454:b0:492:8c77:7dad with SMTP id
 p20-20020a056402045400b004928c777dadmr2139061edw.8.1673942879537; 
 Tue, 17 Jan 2023 00:07:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtHwpdgH84/wUjqURt7U9cfPll7ZyiV1S9NVAwLJaq3qojLcTdTUk+HAjI0FKzyHucPPjYEnQ==
X-Received: by 2002:a05:6402:454:b0:492:8c77:7dad with SMTP id
 p20-20020a056402045400b004928c777dadmr2139047edw.8.1673942879180; 
 Tue, 17 Jan 2023 00:07:59 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056402249800b0046ac460da13sm12490778eda.53.2023.01.17.00.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 00:07:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com
Subject: [PATCH 4/4] readconfig-test: add test for accelerator configuration
Date: Tue, 17 Jan 2023 09:07:45 +0100
Message-Id: <20230117080745.43247-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230117080745.43247-1-pbonzini@redhat.com>
References: <20230117080745.43247-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Test that invalid configurations do not cause a SIGSEGV, and cover a
valid configuration as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqtest.c        | 28 +++++++++++++++++-----
 tests/qtest/libqtest.h        | 12 ++++++++++
 tests/qtest/readconfig-test.c | 45 ++++++++++++++++++++++++++++-------
 3 files changed, 70 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 64ba98bc5853..53d766fe3fa5 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -402,6 +402,26 @@ static QTestState *G_GNUC_PRINTF(1, 0) qtest_spawn_qemu(const char *fmt, ...)
     return s;
 }
 
+QTestState *G_GNUC_PRINTF(1, 0) qtest_init_bare(const char *args)
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
@@ -459,12 +479,8 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
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
2.38.1


