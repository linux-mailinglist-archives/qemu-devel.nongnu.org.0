Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FD74B702D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:32:53 +0100 (CET)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0l2-0002dY-Fr
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:32:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK0fI-0003lC-4M
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:26:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK0fE-0001bL-2m
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644942411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5zVHW8Wa7G3Hzkr8Lj29+WtfvQrMl4IZkfnFMsX+ys=;
 b=ZxIuHwb8+SUEis8dS4hXWOQul0iPcmpP7VbSvUgDvo4ugNl+LJDqHJ5kErC+zCtjqUNH+I
 K9wYaWzyPcneLQwmciuIYw5FCKFOZLIV20JLzWKqnJyVkVLY+6cTOPB3GXkzYC5DflPNRu
 A06BNorvhTUvx0dBP16j47EQapRkd6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-_70nNyXLPwiot4EbcK0AJA-1; Tue, 15 Feb 2022 11:26:50 -0500
X-MC-Unique: _70nNyXLPwiot4EbcK0AJA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74339814243;
 Tue, 15 Feb 2022 16:26:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE1A810A48D2;
 Tue, 15 Feb 2022 16:26:47 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 mst@redhat.com, thuth@redhat.com, berrange@redhat.com, quintela@redhat.com
Subject: [PATCH 1/3] tests/x86: Use 'pc' machine type for old hardware tests
Date: Tue, 15 Feb 2022 16:25:35 +0000
Message-Id: <20220215162537.605030-6-dgilbert@redhat.com>
In-Reply-To: <20220215162537.605030-1-dgilbert@redhat.com>
References: <20220215162537.605030-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

For tests that rely on old hardware, e.g. floppies or IDE drives,
explicitly select the 'pc' machine type.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/fdc-test.c    |  2 +-
 tests/qtest/hd-geo-test.c | 12 +++++++++---
 tests/qtest/i440fx-test.c |  2 +-
 tests/qtest/ide-test.c    |  3 ++-
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 8f6eee84a4..b0d40012e6 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -598,7 +598,7 @@ int main(int argc, char **argv)
     /* Run the tests */
     g_test_init(&argc, &argv, NULL);
 
-    qtest_start("-device floppy,id=floppy0");
+    qtest_start("-machine pc -device floppy,id=floppy0");
     qtest_irq_intercept_in(global_qtest, "ioapic");
     qtest_add_func("/fdc/cmos", test_cmos);
     qtest_add_func("/fdc/no_media_on_start", test_no_media_on_start);
diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 771eaa741b..3554b5d500 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -178,9 +178,15 @@ static int append_arg(int argc, char *argv[], int argv_sz, char *arg)
 
 static int setup_common(char *argv[], int argv_sz)
 {
+    int new_argc;
     memset(cur_ide, 0, sizeof(cur_ide));
-    return append_arg(0, argv, argv_sz,
-                      g_strdup("-nodefaults"));
+    new_argc = append_arg(0, argv, argv_sz,
+                          g_strdup("-nodefaults"));
+    new_argc = append_arg(new_argc, argv, argv_sz,
+                          g_strdup("-machine"));
+    new_argc = append_arg(new_argc, argv, argv_sz,
+                          g_strdup("pc"));
+    return new_argc;
 }
 
 static void setup_mbr(int img_idx, MBRcontents mbr)
@@ -697,7 +703,7 @@ static void test_override(TestArgs *args, CHSResult expected[])
 
     joined_args = g_strjoinv(" ", args->argv);
 
-    qts = qtest_init(joined_args);
+    qts = qtest_initf("-machine pc %s", joined_args);
     fw_cfg = pc_fw_cfg_init(qts);
 
     read_bootdevices(fw_cfg, expected);
diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
index 1f57d9684b..6d7d4d8d8f 100644
--- a/tests/qtest/i440fx-test.c
+++ b/tests/qtest/i440fx-test.c
@@ -35,7 +35,7 @@ static QPCIBus *test_start_get_bus(const TestData *s)
 {
     char *cmdline;
 
-    cmdline = g_strdup_printf("-smp %d", s->num_cpus);
+    cmdline = g_strdup_printf("-machine pc -smp %d", s->num_cpus);
     qtest_start(cmdline);
     g_free(cmdline);
     return qpci_new_pc(global_qtest, NULL);
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 3f8081e77d..84935578fb 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -128,10 +128,11 @@ static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
 static QTestState *ide_test_start(const char *cmdline_fmt, ...)
 {
     QTestState *qts;
+    g_autofree char *full_fmt = g_strdup_printf("-machine pc %s", cmdline_fmt);
     va_list ap;
 
     va_start(ap, cmdline_fmt);
-    qts = qtest_vinitf(cmdline_fmt, ap);
+    qts = qtest_vinitf(full_fmt, ap);
     va_end(ap);
 
     pc_alloc_init(&guest_malloc, qts, 0);
-- 
2.35.1


