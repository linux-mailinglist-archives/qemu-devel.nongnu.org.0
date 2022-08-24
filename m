Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215AE59F715
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:06:26 +0200 (CEST)
Received: from localhost ([::1]:33088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnHF-0002bp-5i
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmsc-0001L6-2E; Wed, 24 Aug 2022 05:40:58 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmsa-0001Ho-1g; Wed, 24 Aug 2022 05:40:57 -0400
Received: by mail-pl1-x635.google.com with SMTP id c2so15200937plo.3;
 Wed, 24 Aug 2022 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=UXKRju1FGFN9DPiFZ4J+hFGTgwWa8qqlnkHV2v3j370=;
 b=H75A5dn2AgcFzIemjLr66iiTva3GHNNLzQ2BqKqEOqymi/V9I9hNPP+jPXbauTFtpD
 lt2vzI9GKKbj8+Q9a4joEw+z0TtKwxnMea2/D5f1a0xMRY7FSd07R0zmHePNlklYJ2JS
 Szuh/Ao9ywa6TWQZ4jXFflmeqvQwkrA11V/yn8y77QKNnHLMLJwjXFqRzuu63mUXsbRW
 JKiPqbvnpSxbOGmaQtJus5U7uZ9rXI8HTAd0v9SvbxJMLbzs1ABvT2WX1PE5IOgzQD4m
 CzQzCAhHGF4ZZBvDVVZJTm2r6mdSSmSKiEZMqOUfYbFMB5mixLqySMaPI5NlsXyFD2gn
 37sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=UXKRju1FGFN9DPiFZ4J+hFGTgwWa8qqlnkHV2v3j370=;
 b=q7x3j7bGS1ZSLgHA4J+0eLMINHJxI5gYJo007rVNpWSDG3+tkSCm/GoM2E1NAeVJ6q
 EdZzpl0mvAJ/p9sP8/SfaoRfnvT3BcFK+chPtkf329aIBkqUp8rkgBwzyL6F4753VabI
 9CeE9mXfN8WgYfwPoPXpxcfZrZfF3pud+C9fJJXB/Ek6MHugVt7kRQfLKk1auXm7NtsG
 G1q9N8cg855n7mCLj1CUvv/u4WzdeR+cxTaVfTXz3rmQ3sQ9TufOwbzYW0x3E7T2HsYB
 nCUz4ApWKuXmNdj9GLVslRxlx3Ko1mERIldy3ozZVsqdIIYAGJKxNhCqGyvdXMdvKv6c
 VZkg==
X-Gm-Message-State: ACgBeo2u+sUceZmGpuYNhDzl8GAKkCk7c4/8kX5iHcbkLYvvR5A/nt3l
 mBhY5eiyAhyO0VB0SIBogj3tgN7AaO0=
X-Google-Smtp-Source: AA6agR6aFBd6Ct7J3zKfU/Rxwxz5UguxZ2dUU+5JppZ9BjXc75nNr2MK9jtT1QIIg6o75yc8NqYmoQ==
X-Received: by 2002:a17:90a:f0c9:b0:1fa:e017:7d13 with SMTP id
 fa9-20020a17090af0c900b001fae0177d13mr7486488pjb.128.1661334054042; 
 Wed, 24 Aug 2022 02:40:54 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:40:53 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH 02/51] tests/qtest: Use g_mkdtemp()
Date: Wed, 24 Aug 2022 17:39:40 +0800
Message-Id: <20220824094029.1634519-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Windows does not provide a mkdtemp() API, but glib does.
Replace mkdtemp() call with the glib version.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
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
index 520a5f917c..52988b86eb 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2450,9 +2450,9 @@ int main(int argc, char **argv)
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
2.34.1


