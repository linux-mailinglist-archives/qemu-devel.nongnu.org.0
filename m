Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE4368F444
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:20:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPo7G-00044q-32; Wed, 08 Feb 2023 12:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo7C-0003sZ-Bj
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pPo79-0001Do-Np
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675876810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JRoAe9ECLPd8dIco7IoMD9qC7H0WOGm1xgJWWsd7V30=;
 b=VHaD9b8wU6PoiOj0gRFrzrHwkvmaxbSDrc5b62M9DST36dJpKla58UQ+rZUFGrYJ10rNHh
 KsxWDzCMqcprqUHG5ri/0cGurKsaH2immJ+Zfea/gbulrHyFn9Ri5FFwQJyKw/Cxgdlv63
 LcIvRuM5r6Ujs/f7DRyYhXWyX1b3R/0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619--QbbN_iSOfKhotgYP0AYAQ-1; Wed, 08 Feb 2023 12:19:54 -0500
X-MC-Unique: -QbbN_iSOfKhotgYP0AYAQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 s3-20020a50ab03000000b0049ec3a108beso12740239edc.7
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 09:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JRoAe9ECLPd8dIco7IoMD9qC7H0WOGm1xgJWWsd7V30=;
 b=rVz0b3AT6SBIgW5bpuKKX7rVS5JjGUmluPQWYFhMBE5GJe5rsOWjq/vjQuOQatinhN
 UJNKYObLvK3reLbxmfI8y1I+EbGTlb0PlpAWrxU02PtjWKf8+JhX5jUITyidpw6x4H2j
 qMlD8voLk0HdPftFI2/M4emnGvKzu3Bty5cpT9sfo+H7oxi4ztN8r5EYmCWcNEPIZPS2
 47F6xBL0sarpa6aGWV8t9tCUG7IsjmpmuLdHCrErWx4q3BkJM/WlNS64NFNxkv3AANJ7
 ASH7jiQXPNmEOr/dBS7qh57P3mx54qvRbRgdpOsgC1YvWf42jjRpzDJHjx+oDw2fFiEQ
 DuQw==
X-Gm-Message-State: AO0yUKX+3lGlizlbbmMCEAqkDwz4Jq9d3v0LcjjEkqSw2ANzQYjznmC4
 DNeJ4pakr8UqdKNgFkvUo76KDXUDJzE/276MMsVRE0T0R6Y0Cs4ViTr7QoQqxY/cUY6IPZ44H7b
 X/4fA9jaTPZcD+dpPpZv6+00nD1KF0KqvrH172eslQydK32KDfzfrOs63d7LkZ4K/oozSf7cp
X-Received: by 2002:a50:d7cd:0:b0:4a0:af87:b3ab with SMTP id
 m13-20020a50d7cd000000b004a0af87b3abmr7970793edj.36.1675876788598; 
 Wed, 08 Feb 2023 09:19:48 -0800 (PST)
X-Google-Smtp-Source: AK7set/ztC8DvRzx+dQRZZSHl8UroLCyiZKC0mr8PCo1Ft8Zlpp4QUEdN+5xgZ/vz+23qcjLdCNH7g==
X-Received: by 2002:a50:d7cd:0:b0:4a0:af87:b3ab with SMTP id
 m13-20020a50d7cd000000b004a0af87b3abmr7970774edj.36.1675876788217; 
 Wed, 08 Feb 2023 09:19:48 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a50d683000000b004aabb714230sm3695347edi.35.2023.02.08.09.19.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 09:19:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/11] readconfig-test: add test for accelerator configuration
Date: Wed,  8 Feb 2023 18:19:18 +0100
Message-Id: <20230208171922.95048-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208171922.95048-1-pbonzini@redhat.com>
References: <20230208171922.95048-1-pbonzini@redhat.com>
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
index ce5f235e25f1..4fba2bb27f06 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -420,6 +420,26 @@ static QTestState *G_GNUC_PRINTF(1, 2) qtest_spawn_qemu(const char *fmt, ...)
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


