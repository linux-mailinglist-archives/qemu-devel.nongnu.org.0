Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA395AB6F3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 18:55:18 +0200 (CEST)
Received: from localhost ([::1]:56108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU9wq-0007k1-Ru
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 12:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tM-00024h-I1
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oU9tK-0003Q3-MW
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 12:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662137498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z3Tkn7R4cNXiiHZfZ5wWpatbVjeMZNFEvFn12EThIVw=;
 b=OKhqhOjkJrYgExSPcRptYfEYnoTtTRe6MYmGW0cVkRD1RQ6p5zo7p1Mpjg5UmJKO5Zp5B6
 fSu9vQeUptulMdMsiKE4u2hETMet+1Cddr7k98AsP7WRJoom76apTUAxqNnLLyEMsHFn31
 9dmVfJ7/P8g/aJuvzSvN+PgEbODMYgI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-WxF3LXclMxiNb0meGNxDyg-1; Fri, 02 Sep 2022 12:51:35 -0400
X-MC-Unique: WxF3LXclMxiNb0meGNxDyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CCA380A0B9;
 Fri,  2 Sep 2022 16:51:34 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4211F2026D4C;
 Fri,  2 Sep 2022 16:51:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>
Subject: [PATCH 1/8] qtest: "-display none" is set in qtest_init()
Date: Fri,  2 Sep 2022 18:51:19 +0200
Message-Id: <20220902165126.1482-2-quintela@redhat.com>
In-Reply-To: <20220902165126.1482-1-quintela@redhat.com>
References: <20220902165126.1482-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

So we don't need to set anywhere else.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/bios-tables-test.c      | 2 +-
 tests/qtest/fuzz-lsi53c895a-test.c  | 2 +-
 tests/qtest/fuzz-megasas-test.c     | 2 +-
 tests/qtest/fuzz-sb16-test.c        | 6 +++---
 tests/qtest/fuzz-sdcard-test.c      | 6 +++---
 tests/qtest/fuzz-virtio-scsi-test.c | 2 +-
 tests/qtest/fuzz-xlnx-dp-test.c     | 2 +-
 tests/qtest/fuzz/generic_fuzz.c     | 3 +--
 tests/qtest/fuzz/i440fx_fuzz.c      | 2 +-
 tests/qtest/fuzz/qos_fuzz.c         | 2 +-
 10 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 36783966b0..9c68f3658a 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -725,7 +725,7 @@ static char *test_acpi_create_args(test_data *data, const char *params,
         }
     } else {
         args = g_strdup_printf("-machine %s %s -accel tcg "
-            "-net none -display none %s "
+            "-net none %s "
             "-drive id=hd0,if=none,file=%s,format=raw "
             "-device %s,drive=hd0 ",
              data->machine, data->tcg_only ? "" : "-accel kvm",
diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
index b23d3ecf45..137e0bb79b 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -21,7 +21,7 @@ static void test_lsi_do_msgout_cancel_req(void)
         return;
     }
 
-    s = qtest_init("-M q35 -m 4G -display none -nodefaults "
+    s = qtest_init("-M q35 -m 4G -nodefaults "
                    "-device lsi53c895a,id=scsi "
                    "-device scsi-hd,drive=disk0 "
                    "-drive file=null-co://,id=disk0,if=none,format=raw");
diff --git a/tests/qtest/fuzz-megasas-test.c b/tests/qtest/fuzz-megasas-test.c
index 287fe19fc7..8d7ed3723a 100644
--- a/tests/qtest/fuzz-megasas-test.c
+++ b/tests/qtest/fuzz-megasas-test.c
@@ -40,7 +40,7 @@ static void test_lp1878263_megasas_zero_iov_cnt(void)
  */
 static void test_gitlab_issue521_megasas_sgl_ovf(void)
 {
-    QTestState *s = qtest_init("-display none -m 32M -machine q35 "
+    QTestState *s = qtest_init("-m 32M -machine q35 "
                                "-nodefaults -device megasas "
                                "-device scsi-cd,drive=null0 "
                                "-blockdev "
diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
index a65826b943..dd1b4b307f 100644
--- a/tests/qtest/fuzz-sb16-test.c
+++ b/tests/qtest/fuzz-sb16-test.c
@@ -15,7 +15,7 @@
  */
 static void test_fuzz_sb16_0x1c(void)
 {
-    QTestState *s = qtest_init("-M q35 -display none "
+    QTestState *s = qtest_init("-M q35 "
                                "-device sb16,audiodev=snd0 "
                                "-audiodev none,id=snd0");
     qtest_outw(s, 0x22c, 0x41);
@@ -27,7 +27,7 @@ static void test_fuzz_sb16_0x1c(void)
 
 static void test_fuzz_sb16_0x91(void)
 {
-    QTestState *s = qtest_init("-M pc -display none "
+    QTestState *s = qtest_init("-M pc "
                                "-device sb16,audiodev=none "
                                "-audiodev id=none,driver=none");
     qtest_outw(s, 0x22c, 0xf141);
@@ -43,7 +43,7 @@ static void test_fuzz_sb16_0x91(void)
  */
 static void test_fuzz_sb16_0xd4(void)
 {
-    QTestState *s = qtest_init("-M pc -display none "
+    QTestState *s = qtest_init("-M pc "
                                "-device sb16,audiodev=none "
                                "-audiodev id=none,driver=none");
     qtest_outb(s, 0x22c, 0x41);
diff --git a/tests/qtest/fuzz-sdcard-test.c b/tests/qtest/fuzz-sdcard-test.c
index e7fd818148..cd134cdf55 100644
--- a/tests/qtest/fuzz-sdcard-test.c
+++ b/tests/qtest/fuzz-sdcard-test.c
@@ -18,7 +18,7 @@ static void oss_fuzz_29225(void)
 {
     QTestState *s;
 
-    s = qtest_init(" -display none -m 512m -nodefaults -nographic"
+    s = qtest_init(" -m 512m -nodefaults -nographic"
                    " -device sdhci-pci,sd-spec-version=3"
                    " -device sd-card,drive=d0"
                    " -drive if=none,index=0,file=null-co://,format=raw,id=d0");
@@ -61,7 +61,7 @@ static void oss_fuzz_36217(void)
 {
     QTestState *s;
 
-    s = qtest_init(" -display none -m 32 -nodefaults -nographic"
+    s = qtest_init(" -m 32 -nodefaults -nographic"
                    " -device sdhci-pci,sd-spec-version=3 "
                    "-device sd-card,drive=d0 "
                    "-drive if=none,index=0,file=null-co://,format=raw,id=d0");
@@ -95,7 +95,7 @@ static void oss_fuzz_36391(void)
 {
     QTestState *s;
 
-    s = qtest_init(" -display none -m 512M -nodefaults -nographic"
+    s = qtest_init(" -m 512M -nodefaults -nographic"
                    " -device sdhci-pci,sd-spec-version=3"
                    " -device sd-card,drive=drv"
                    " -drive if=none,index=0,file=null-co://,format=raw,id=drv");
diff --git a/tests/qtest/fuzz-virtio-scsi-test.c b/tests/qtest/fuzz-virtio-scsi-test.c
index 71c91b0356..e37b48b2cc 100644
--- a/tests/qtest/fuzz-virtio-scsi-test.c
+++ b/tests/qtest/fuzz-virtio-scsi-test.c
@@ -19,7 +19,7 @@ static void test_mmio_oob_from_memory_region_cache(void)
 {
     QTestState *s;
 
-    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
+    s = qtest_init("-M pc-q35-5.2 -m 512M "
                    "-device virtio-scsi,num_queues=8,addr=03.0 ");
 
     qtest_outl(s, 0xcf8, 0x80001811);
diff --git a/tests/qtest/fuzz-xlnx-dp-test.c b/tests/qtest/fuzz-xlnx-dp-test.c
index 51e9a37300..e8c483965f 100644
--- a/tests/qtest/fuzz-xlnx-dp-test.c
+++ b/tests/qtest/fuzz-xlnx-dp-test.c
@@ -14,7 +14,7 @@
  */
 static void test_fuzz_xlnx_dp_0x3ac(void)
 {
-    QTestState *s = qtest_init("-M xlnx-zcu102 -display none ");
+    QTestState *s = qtest_init("-M xlnx-zcu102 ");
     qtest_readl(s, 0xfd4a03ac);
     qtest_quit(s);
 }
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index afc1d20355..94b00288d9 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -981,8 +981,7 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
     if (!getenv("QEMU_FUZZ_ARGS")) {
         usage();
     }
-    g_string_append_printf(cmd_line, " -display none \
-                                      -machine accel=qtest, \
+    g_string_append_printf(cmd_line, " -machine accel=qtest, \
                                       -m 512M %s ", getenv("QEMU_FUZZ_ARGS"));
     return cmd_line;
 }
diff --git a/tests/qtest/fuzz/i440fx_fuzz.c b/tests/qtest/fuzz/i440fx_fuzz.c
index b17fc725df..f2c729493f 100644
--- a/tests/qtest/fuzz/i440fx_fuzz.c
+++ b/tests/qtest/fuzz/i440fx_fuzz.c
@@ -157,7 +157,7 @@ static void i440fx_fuzz_qos_fork(QTestState *s,
 }
 
 static const char *i440fx_qtest_argv = TARGET_NAME " -machine accel=qtest"
-                                       " -m 0 -display none";
+                                       " -m 0";
 static GString *i440fx_argv(FuzzTarget *t)
 {
     return g_string_new(i440fx_qtest_argv);
diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
index 3a3d9c16dd..fd431849a5 100644
--- a/tests/qtest/fuzz/qos_fuzz.c
+++ b/tests/qtest/fuzz/qos_fuzz.c
@@ -85,7 +85,7 @@ static GString *qos_build_main_args(void)
     }
     /* Prepend the arguments that we need */
     g_string_prepend(cmd_line,
-            TARGET_NAME " -display none -machine accel=qtest -m 64 ");
+            TARGET_NAME " -machine accel=qtest -m 64 ");
     return cmd_line;
 }
 
-- 
2.37.2


