Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042605A6C85
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 20:45:07 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6ET-0004dl-Ul
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 14:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A2-0007L1-6f
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT69z-00054l-2d
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0egD9Eogz8rPxc55iTt5FN1zSnqy/4Dc/efaDL748E=;
 b=Th+OCmghaEIvtCb4cgoKExEQJOR2OZLQdLcdVdtPkPKxJUobW+GwqBTBM6MAkrLsC01ZAV
 BuZUFpv8AlciGwdqFPmfz9LoNkW8m/VEmNIy00Mwv7lkuno6RTz0WsgN2XOCdo9hoNPKz5
 HZw98YvRWT9/IdDY0fjwuHTZtTZf67I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-C5cNcV-nM4-OXq9AUUhjqg-1; Tue, 30 Aug 2022 14:40:19 -0400
X-MC-Unique: C5cNcV-nM4-OXq9AUUhjqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2520B101AA47;
 Tue, 30 Aug 2022 18:40:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1E3A1410DD5;
 Tue, 30 Aug 2022 18:40:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 02/23] tests/qtest: Use g_mkdtemp()
Date: Tue, 30 Aug 2022 20:39:51 +0200
Message-Id: <20220830184012.77978-3-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Windows does not provide a mkdtemp() API, but glib does.
Replace mkdtemp() call with the glib version.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220824094029.1634519-3-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
 tests/qtest/cdrom-test.c                | 2 +-
 tests/qtest/cxl-test.c                  | 6 +++---
 tests/qtest/ivshmem-test.c              | 4 ++--
 tests/qtest/libqos/virtio-9p.c          | 4 ++--
 tests/qtest/libqtest.c                  | 2 +-
 tests/qtest/migration-test.c            | 4 ++--
 tests/qtest/qmp-test.c                  | 4 ++--
 tests/qtest/vhost-user-test.c           | 4 ++--
 tests/unit/test-qga.c                   | 2 +-
 10 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 004c701915..0775e6702b 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -21,7 +21,7 @@ typedef struct generic_fuzz_config {
 
 static inline gchar *generic_fuzzer_virtio_9p_args(void){
     char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
-    g_assert_nonnull(mkdtemp(tmpdir));
+    g_assert_nonnull(g_mkdtemp(tmpdir));
 
     return g_strdup_printf("-machine q35 -nodefaults "
     "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index a7766a9e65..26a2400181 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -52,7 +52,7 @@ static int prepare_image(const char *arch, char *isoimage)
         perror("Error creating temporary iso image file");
         return -1;
     }
-    if (!mkdtemp(srcdir)) {
+    if (!g_mkdtemp(srcdir)) {
         perror("Error creating temporary directory");
         goto cleanup;
     }
diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index 2133e973f4..4e6d285061 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -95,7 +95,7 @@ static void cxl_t3d(void)
     char template[] = "/tmp/cxl-test-XXXXXX";
     const char *tmpfs;
 
-    tmpfs = mkdtemp(template);
+    tmpfs = g_mkdtemp(template);
 
     g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D, tmpfs, tmpfs);
 
@@ -109,7 +109,7 @@ static void cxl_1pxb_2rp_2t3d(void)
     char template[] = "/tmp/cxl-test-XXXXXX";
     const char *tmpfs;
 
-    tmpfs = mkdtemp(template);
+    tmpfs = g_mkdtemp(template);
 
     g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3D,
                     tmpfs, tmpfs, tmpfs, tmpfs);
@@ -124,7 +124,7 @@ static void cxl_2pxb_4rp_4t3d(void)
     char template[] = "/tmp/cxl-test-XXXXXX";
     const char *tmpfs;
 
-    tmpfs = mkdtemp(template);
+    tmpfs = g_mkdtemp(template);
 
     g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T3D,
                     tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index e23a97fa8e..9611d05eb5 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -481,8 +481,8 @@ int main(int argc, char **argv)
     tmpshmem = mmap(0, TMPSHMSIZE, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
     g_assert(tmpshmem != MAP_FAILED);
     /* server */
-    if (mkdtemp(dir) == NULL) {
-        g_error("mkdtemp: %s", g_strerror(errno));
+    if (g_mkdtemp(dir) == NULL) {
+        g_error("g_mkdtemp: %s", g_strerror(errno));
     }
     tmpdir = dir;
     tmpserver = g_strconcat(tmpdir, "/server", NULL);
diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index 70aea8bf62..ae9b0a20e2 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -48,9 +48,9 @@ void virtio_9p_create_local_test_dir(void)
      */
     char *template = concat_path(pwd, "qtest-9p-local-XXXXXX");
 
-    local_test_path = mkdtemp(template);
+    local_test_path = g_mkdtemp(template);
     if (!local_test_path) {
-        g_test_message("mkdtemp('%s') failed: %s", template, strerror(errno));
+        g_test_message("g_mkdtemp('%s') failed: %s", template, strerror(errno));
     }
 
     g_assert(local_test_path != NULL);
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index ad6860d774..7c9fc07de4 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -393,7 +393,7 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
     char *sock_path, sock_dir[] = "/tmp/qtest-serial-XXXXXX";
     QTestState *qts;
 
-    g_assert_true(mkdtemp(sock_dir) != NULL);
+    g_assert_true(g_mkdtemp(sock_dir) != NULL);
     sock_path = g_strdup_printf("%s/sock", sock_dir);
 
     sock_fd_init = init_socket(sock_path);
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f63edd0bc8..60f3d4e9d2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2452,9 +2452,9 @@ int main(int argc, char **argv)
         return g_test_run();
     }
 
-    tmpfs = mkdtemp(template);
+    tmpfs = g_mkdtemp(template);
     if (!tmpfs) {
-        g_test_message("mkdtemp on path (%s): %s", template, strerror(errno));
+        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
     }
     g_assert(tmpfs);
 
diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index 9a42480cef..bf7304c7dc 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -166,8 +166,8 @@ char *fifo_name;
 
 static void setup_blocking_cmd(void)
 {
-    if (!mkdtemp(tmpdir)) {
-        g_error("mkdtemp: %s", strerror(errno));
+    if (!g_mkdtemp(tmpdir)) {
+        g_error("g_mkdtemp: %s", strerror(errno));
     }
     fifo_name = g_strdup_printf("%s/fifo", tmpdir);
     if (mkfifo(fifo_name, 0666)) {
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 8bf390be20..d7d6cfc9bd 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -491,9 +491,9 @@ static TestServer *test_server_new(const gchar *name,
     /* run the main loop thread so the chardev may operate */
     server->thread = g_thread_new(NULL, thread_function, server->loop);
 
-    tmpfs = mkdtemp(template);
+    tmpfs = g_mkdtemp(template);
     if (!tmpfs) {
-        g_test_message("mkdtemp on path (%s): %s", template, strerror(errno));
+        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
     }
     g_assert(tmpfs);
 
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index b27c77a695..a05a4628ed 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -60,7 +60,7 @@ fixture_setup(TestFixture *fixture, gconstpointer data, gchar **envp)
     fixture->loop = g_main_loop_new(NULL, FALSE);
 
     fixture->test_dir = g_strdup("/tmp/qgatest.XXXXXX");
-    g_assert_nonnull(mkdtemp(fixture->test_dir));
+    g_assert_nonnull(g_mkdtemp(fixture->test_dir));
 
     path = g_build_filename(fixture->test_dir, "sock", NULL);
     cwd = g_get_current_dir();
-- 
2.31.1


