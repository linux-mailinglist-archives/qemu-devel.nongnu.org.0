Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F05FC7B1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:49:20 +0200 (CEST)
Received: from localhost ([::1]:53332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oid2s-00052w-96
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnW-0004yc-4h
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oicnT-0006jJ-FR
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QqveO/aqglIimPwR8DhhgAfvf0vgvXxNcRV5shjf3iA=;
 b=BnsLpo0tpNbSc0ueCGB/+SXUN4W0XCSbqeCJA7dUBYjS3bW7fsUqofNEu13JRERRyNUrhu
 oaRUOkTDGmFmO86bF9IgAI6b6Uh9N5wnweqmFC5pt5CFFsToYhFanYREtotDuKGA9ln7qd
 IKpJJQxR/lUWaDPdiDzGVbym84SS1OQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-lnSKTmGgM9uv1lXE6QVjqA-1; Wed, 12 Oct 2022 10:33:21 -0400
X-MC-Unique: lnSKTmGgM9uv1lXE6QVjqA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF8A2959740
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 14:33:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AB112144B20;
 Wed, 12 Oct 2022 14:33:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>
Subject: [PULL 01/16] qtest: "-display none" is set in qtest_init()
Date: Wed, 12 Oct 2022 16:33:01 +0200
Message-Id: <20221012143316.988561-2-thuth@redhat.com>
In-Reply-To: <20221012143316.988561-1-thuth@redhat.com>
References: <20221012143316.988561-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juan Quintela <quintela@redhat.com>

So we don't need to set anywhere else.

Signed-off-by: Juan Quintela <quintela@redhat.com>
[thuth: Drop changes in tests/qtest/fuzz/ since the fuzzers still need this]
Message-Id: <20220902165126.1482-2-quintela@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/bios-tables-test.c      | 2 +-
 tests/qtest/fuzz-lsi53c895a-test.c  | 2 +-
 tests/qtest/fuzz-megasas-test.c     | 2 +-
 tests/qtest/fuzz-sb16-test.c        | 6 +++---
 tests/qtest/fuzz-sdcard-test.c      | 6 +++---
 tests/qtest/fuzz-virtio-scsi-test.c | 2 +-
 tests/qtest/fuzz-xlnx-dp-test.c     | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 2ebeb530b2..e6096e7f73 100644
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
index 434c16bf42..392a7ae7ed 100644
--- a/tests/qtest/fuzz-lsi53c895a-test.c
+++ b/tests/qtest/fuzz-lsi53c895a-test.c
@@ -21,7 +21,7 @@ static void test_lsi_do_msgout_cancel_req(void)
         return;
     }
 
-    s = qtest_init("-M q35 -m 2G -display none -nodefaults "
+    s = qtest_init("-M q35 -m 2G -nodefaults "
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
index add2a2ad39..fc445b1871 100644
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
-- 
2.31.1


