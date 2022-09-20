Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA565BE681
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:56:52 +0200 (CEST)
Received: from localhost ([::1]:41532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacny-00083v-Pp
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYS-0000Wt-4W; Tue, 20 Sep 2022 06:32:40 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaYO-0004nn-Cn; Tue, 20 Sep 2022 06:32:38 -0400
Received: by mail-pj1-x102d.google.com with SMTP id fs14so2541684pjb.5;
 Tue, 20 Sep 2022 03:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ZHSXXrvKGvOeBkr3kvmXfRkaYT5BXJ2jlSjdZ0qnFeA=;
 b=VlyLJxSn617o6HLMczfHDJmTlWKIaPRVsejbgYnV+lH+H3C6Tm2Nf8badiH5dikSMM
 imeq+11iKNZPoyC10aK8vzRGGgmr/QGX2TpFcP/XKbJFTaweKIM0iWSDLFdeN1/a84dM
 T2aiLQy8qYaPHbLio/l0xWYlGzPxfs1r3UFsWyhjjyPsEV5GiBgoIyFAVCBm+XKhMnu5
 /b/i8R4rlviF3d4bX95eScy+zYgEs5eQDVHB4pHyZp7ydbLhkm9yUq8cuxiFjlPYYzGy
 isZs+ulUsVoH9qN78MrHJEf3aOxI1PalITsIFv4b2rboAPePKbWbaAXvk73OqUCoEvDE
 Y5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZHSXXrvKGvOeBkr3kvmXfRkaYT5BXJ2jlSjdZ0qnFeA=;
 b=ckEvQsOXiHzGBhRfqzMAZZk81AHRv7GPbzfD4ERoCDY6XnRpnZlC5tbid+VNk6iGwu
 MGlZ9fVEV9n2GLF9GM7hhO9jVLXMxv8GemGd6zijBXDm8PZAx7SiTL9aqUBKu5qFvi6+
 gaKBOfWFf2z3O+DPCDUkm/uLpZqTzsogzFbonOy9+a0+o6SWVVwboyDejVjZce9HNZpR
 qOu2jimtvJUV4ng7ROWJk8ACBzbPTCxW5ub1t7GIa0GDQj++qOlcKfGoXYLvhm+FUqwj
 BITqozDSbiZ2RdQWDN7CC4FrEhNS8ORI06M4CiVZvtqcdg4x23JCxJCM7hz3sgtUCNvN
 WZmA==
X-Gm-Message-State: ACrzQf1CNgaG36iTURBTMp6EpuTibA6Al9pkMGchqsao930rmPMIhXXN
 XE8FTbMNAQPuHj3/3y3SnNz4h3lDUj0=
X-Google-Smtp-Source: AMsMyM4wKRpA92T5o6nQwX9PfoyS174iiieUHz7fRviLRqF5/pas38C6zrsCTDBTj+Fc1Jx7PCWESg==
X-Received: by 2002:a17:90b:254b:b0:200:a860:5bf9 with SMTP id
 nw11-20020a17090b254b00b00200a8605bf9mr3102015pjb.176.1663669953907; 
 Tue, 20 Sep 2022 03:32:33 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:32:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>, Bandan Das <bsd@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Fam Zheng <fam@euphon.net>,
 Joel Stanley <joel@jms.id.au>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org
Subject: [PATCH v2 07/39] tests: Avoid using hardcoded /tmp in test cases
Date: Tue, 20 Sep 2022 18:31:27 +0800
Message-Id: <20220920103159.1865256-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Lots of test cases were written to use hardcoded /tmp directory for
temporary files. To avoid this, we update them to use g_dir_make_tmp()
or g_file_open_tmp() when appropriate.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- Use g_dir_make_tmp(), g_file_open_tmp() when appropriate

 tests/qtest/fuzz/generic_fuzz_configs.h |  4 ++--
 tests/qtest/ahci-test.c                 | 19 +++++++++++--------
 tests/qtest/aspeed_smc-test.c           |  5 ++---
 tests/qtest/boot-serial-test.c          |  9 +++++----
 tests/qtest/cxl-test.c                  | 15 ++++++---------
 tests/qtest/fdc-test.c                  |  5 +++--
 tests/qtest/fuzz/virtio_blk_fuzz.c      |  4 ++--
 tests/qtest/hd-geo-test.c               | 24 +++++++++++-------------
 tests/qtest/ide-test.c                  | 10 ++++++----
 tests/qtest/libqtest.c                  | 12 ++++++++----
 tests/qtest/migration-test.c            |  7 ++++---
 tests/qtest/pflash-cfi02-test.c         |  8 +++++---
 tests/qtest/qmp-test.c                  |  6 ++++--
 tests/qtest/vhost-user-blk-test.c       |  3 ++-
 tests/qtest/vhost-user-test.c           |  8 ++++----
 tests/qtest/virtio-blk-test.c           |  4 ++--
 tests/qtest/virtio-scsi-test.c          |  4 ++--
 tests/unit/test-image-locking.c         |  8 ++++----
 tests/unit/test-qga.c                   |  2 +-
 tests/vhost-user-bridge.c               |  3 +--
 20 files changed, 85 insertions(+), 75 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 0775e6702b..a825b78c14 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -20,8 +20,8 @@ typedef struct generic_fuzz_config {
 } generic_fuzz_config;
 
 static inline gchar *generic_fuzzer_virtio_9p_args(void){
-    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
-    g_assert_nonnull(g_mkdtemp(tmpdir));
+    g_autofree char *tmpdir = g_dir_make_tmp("qemu-fuzz.XXXXXX", NULL);
+    g_assert_nonnull(tmpdir);
 
     return g_strdup_printf("-machine q35 -nodefaults "
     "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index f1e510b0ac..00524f14c6 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -44,9 +44,9 @@
 #define TEST_IMAGE_SIZE_MB_SMALL 64
 
 /*** Globals ***/
-static char tmp_path[] = "/tmp/qtest.XXXXXX";
-static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
-static char mig_socket[] = "/tmp/qtest-migration.XXXXXX";
+static char *tmp_path;
+static char *debug_path;
+static char *mig_socket;
 static bool ahci_pedantic;
 static const char *imgfmt;
 static unsigned test_image_size_mb;
@@ -1437,10 +1437,10 @@ static void test_ncq_simple(void)
 
 static int prepare_iso(size_t size, unsigned char **buf, char **name)
 {
-    char cdrom_path[] = "/tmp/qtest.iso.XXXXXX";
+    g_autofree char *cdrom_path;
     unsigned char *patt;
     ssize_t ret;
-    int fd = mkstemp(cdrom_path);
+    int fd = g_file_open_tmp("qtest.iso.XXXXXX", &cdrom_path, NULL);
 
     g_assert(fd != -1);
     g_assert(buf);
@@ -1872,7 +1872,7 @@ int main(int argc, char **argv)
     }
 
     /* Create a temporary image */
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     if (have_qemu_img()) {
         imgfmt = "qcow2";
@@ -1889,12 +1889,12 @@ int main(int argc, char **argv)
     close(fd);
 
     /* Create temporary blkdebug instructions */
-    fd = mkstemp(debug_path);
+    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
     /* Reserve a hollow file to use as a socket for migration tests */
-    fd = mkstemp(mig_socket);
+    fd = g_file_open_tmp("qtest-migration.XXXXXX", &mig_socket, NULL);
     g_assert(fd >= 0);
     close(fd);
 
@@ -1947,8 +1947,11 @@ int main(int argc, char **argv)
 
     /* Cleanup */
     unlink(tmp_path);
+    g_free(tmp_path);
     unlink(debug_path);
+    g_free(debug_path);
     unlink(mig_socket);
+    g_free(mig_socket);
 
     return ret;
 }
diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 05ce941566..5e16b5c9a5 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -608,16 +608,15 @@ static void test_write_block_protect_bottom_bit(void)
     flash_reset();
 }
 
-static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
-
 int main(int argc, char **argv)
 {
+    g_autofree char *tmp_path;
     int ret;
     int fd;
 
     g_test_init(&argc, &argv, NULL);
 
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.m25p80.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, FLASH_SIZE);
     g_assert(ret == 0);
diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 2f99d71cab..ce6e3d3eb8 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -224,14 +224,14 @@ static bool check_guest_output(QTestState *qts, const testdef_t *test, int fd)
 static void test_machine(const void *data)
 {
     const testdef_t *test = data;
-    char serialtmp[] = "/tmp/qtest-boot-serial-sXXXXXX";
-    char codetmp[] = "/tmp/qtest-boot-serial-cXXXXXX";
+    g_autofree char *serialtmp;
+    char *codetmp;
     const char *codeparam = "";
     const uint8_t *code = NULL;
     QTestState *qts;
     int ser_fd;
 
-    ser_fd = mkstemp(serialtmp);
+    ser_fd = g_file_open_tmp("qtest-boot-serial-sXXXXXX", &serialtmp, NULL);
     g_assert(ser_fd != -1);
 
     if (test->kernel) {
@@ -246,7 +246,7 @@ static void test_machine(const void *data)
         ssize_t wlen;
         int code_fd;
 
-        code_fd = mkstemp(codetmp);
+        code_fd = g_file_open_tmp("qtest-boot-serial-cXXXXXX", &codetmp, NULL);
         g_assert(code_fd != -1);
         wlen = write(code_fd, code, test->codesize);
         g_assert(wlen == test->codesize);
@@ -264,6 +264,7 @@ static void test_machine(const void *data)
                       serialtmp, test->extra);
     if (code) {
         unlink(codetmp);
+        g_free(codetmp);
     }
 
     if (!check_guest_output(qts, test, ser_fd)) {
diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index 2e14da7dee..4f3ea76fa3 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -93,10 +93,9 @@ static void cxl_2root_port(void)
 static void cxl_t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D, tmpfs, tmpfs);
 
@@ -107,10 +106,9 @@ static void cxl_t3d(void)
 static void cxl_1pxb_2rp_2t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3D,
                     tmpfs, tmpfs, tmpfs, tmpfs);
@@ -122,10 +120,9 @@ static void cxl_1pxb_2rp_2t3d(void)
 static void cxl_2pxb_4rp_4t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T3D,
                     tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 52ade90a7d..1f9b99ad6d 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -68,7 +68,7 @@ enum {
     DSKCHG  = 0x80,
 };
 
-static char test_image[] = "/tmp/qtest.XXXXXX";
+static char *test_image;
 
 #define assert_bit_set(data, mask) g_assert_cmphex((data) & (mask), ==, (mask))
 #define assert_bit_clear(data, mask) g_assert_cmphex((data) & (mask), ==, 0)
@@ -608,7 +608,7 @@ int main(int argc, char **argv)
     int ret;
 
     /* Create a temporary raw image */
-    fd = mkstemp(test_image);
+    fd = g_file_open_tmp("qtest.XXXXXX", &test_image, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert(ret == 0);
@@ -640,6 +640,7 @@ int main(int argc, char **argv)
     /* Cleanup */
     qtest_end();
     unlink(test_image);
+    g_free(test_image);
 
     return ret;
 }
diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_blk_fuzz.c
index 236d078cc8..a9fb9ecf6c 100644
--- a/tests/qtest/fuzz/virtio_blk_fuzz.c
+++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
@@ -181,10 +181,10 @@ static void drive_destroy(void *path)
 static char *drive_create(void)
 {
     int fd, ret;
-    char *t_path = g_strdup("/tmp/qtest.XXXXXX");
+    char *t_path;
 
     /* Create a temporary raw image */
-    fd = mkstemp(t_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &t_path, NULL);
     g_assert_cmpint(fd, >=, 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert_cmpint(ret, ==, 0);
diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
index 413cf964c0..4793954c19 100644
--- a/tests/qtest/hd-geo-test.c
+++ b/tests/qtest/hd-geo-test.c
@@ -27,16 +27,16 @@
 
 static char *create_test_img(int secs)
 {
-    char *template = strdup("/tmp/qtest.XXXXXX");
+    char *template;
     int fd, ret;
 
-    fd = mkstemp(template);
+    fd = g_file_open_tmp("qtest.XXXXXX", &template, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, (off_t)secs * 512);
     close(fd);
 
     if (ret) {
-        free(template);
+        g_free(template);
         template = NULL;
     }
 
@@ -422,9 +422,8 @@ static MBRpartitions empty_mbr = { {false, 0, 0, 0, 0, 0, 0, 0, 0},
 
 static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
 {
-    const char *template = "/tmp/qtest.XXXXXX";
-    char *raw_path = strdup(template);
-    char *qcow2_path = strdup(template);
+    g_autofree char *raw_path;
+    char *qcow2_path;
     char cmd[100 + 2 * PATH_MAX];
     uint8_t buf[512] = {};
     int i, ret, fd, offset;
@@ -468,7 +467,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
         offset += 0x10;
     }
 
-    fd = mkstemp(raw_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &raw_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
@@ -478,7 +477,7 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     g_assert(ret == sizeof(buf));
     close(fd);
 
-    fd = mkstemp(qcow2_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &qcow2_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
@@ -506,7 +505,6 @@ static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
     free(qemu_img_abs_path);
 
     unlink(raw_path);
-    free(raw_path);
 
     return qcow2_path;
 }
@@ -714,7 +712,7 @@ static void test_override(TestArgs *args, CHSResult expected[])
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -867,7 +865,7 @@ static void test_override_scsi_hot_unplug(void)
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -927,7 +925,7 @@ static void test_override_virtio_hot_unplug(void)
 
     for (i = 0; i < args->n_drives; i++) {
         unlink(args->drives[i]);
-        free(args->drives[i]);
+        g_free(args->drives[i]);
     }
     g_free(args->drives);
     g_strfreev(args->argv);
@@ -987,7 +985,7 @@ test_add_done:
     for (i = 0; i < backend_last; i++) {
         if (img_file_name[i]) {
             unlink(img_file_name[i]);
-            free(img_file_name[i]);
+            g_free(img_file_name[i]);
         }
     }
 
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 5bcb75a7e5..25302be6dc 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -121,8 +121,8 @@ enum {
 static QPCIBus *pcibus = NULL;
 static QGuestAllocator guest_malloc;
 
-static char tmp_path[] = "/tmp/qtest.XXXXXX";
-static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
+static char *tmp_path;
+static char *debug_path;
 
 static QTestState *ide_test_start(const char *cmdline_fmt, ...)
 {
@@ -1015,12 +1015,12 @@ int main(int argc, char **argv)
     int ret;
 
     /* Create temporary blkdebug instructions */
-    fd = mkstemp(debug_path);
+    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
     /* Create a temporary raw image */
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert(ret == 0);
@@ -1049,7 +1049,9 @@ int main(int argc, char **argv)
 
     /* Cleanup */
     unlink(tmp_path);
+    g_free(tmp_path);
     unlink(debug_path);
+    g_free(debug_path);
 
     return ret;
 }
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7c9fc07de4..a0f28ddf8e 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -265,8 +265,10 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
 
     s = g_new(QTestState, 1);
 
-    socket_path = g_strdup_printf("/tmp/qtest-%d.sock", getpid());
-    qmp_socket_path = g_strdup_printf("/tmp/qtest-%d.qmp", getpid());
+    socket_path = g_strdup_printf("%s/qtest-%d.sock",
+                                  g_get_tmp_dir(), getpid());
+    qmp_socket_path = g_strdup_printf("%s/qtest-%d.qmp",
+                                      g_get_tmp_dir(), getpid());
 
     /* It's possible that if an earlier test run crashed it might
      * have left a stale unix socket lying around. Delete any
@@ -390,10 +392,12 @@ QTestState *qtest_initf(const char *fmt, ...)
 QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
 {
     int sock_fd_init;
-    char *sock_path, sock_dir[] = "/tmp/qtest-serial-XXXXXX";
+    g_autofree char *sock_dir;
+    char *sock_path;
     QTestState *qts;
 
-    g_assert_true(g_mkdtemp(sock_dir) != NULL);
+    sock_dir = g_dir_make_tmp("qtest-serial-XXXXXX", NULL);
+    g_assert_true(sock_dir != NULL);
     sock_path = g_strdup_printf("%s/sock", sock_dir);
 
     sock_fd_init = init_socket(sock_path);
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 55892b3798..9925691ead 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2435,7 +2435,6 @@ static bool kvm_dirty_ring_supported(void)
 
 int main(int argc, char **argv)
 {
-    char template[] = "/tmp/migration-test-XXXXXX";
     const bool has_kvm = qtest_has_accel("kvm");
     const bool has_uffd = ufd_version_check();
     const char *arch = qtest_get_arch();
@@ -2463,9 +2462,10 @@ int main(int argc, char **argv)
         return g_test_run();
     }
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("migration-test-XXXXXX", NULL);
     if (!tmpfs) {
-        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
+        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+                       strerror(errno));
     }
     g_assert(tmpfs);
 
@@ -2590,6 +2590,7 @@ int main(int argc, char **argv)
         g_test_message("unable to rmdir: path (%s): %s",
                        tmpfs, strerror(errno));
     }
+    g_free((gpointer)tmpfs);
 
     return ret;
 }
diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-test.c
index 7fce614b64..55890b7d95 100644
--- a/tests/qtest/pflash-cfi02-test.c
+++ b/tests/qtest/pflash-cfi02-test.c
@@ -56,7 +56,7 @@ typedef struct {
     QTestState *qtest;
 } FlashConfig;
 
-static char image_path[] = "/tmp/qtest.XXXXXX";
+static char *image_path;
 
 /*
  * The pflash implementation allows some parameters to be unspecified. We want
@@ -608,6 +608,7 @@ static void test_cfi_in_autoselect(const void *opaque)
 static void cleanup(void *opaque)
 {
     unlink(image_path);
+    g_free(image_path);
 }
 
 /*
@@ -635,16 +636,17 @@ static const FlashConfig configuration[] = {
 
 int main(int argc, char **argv)
 {
-    int fd = mkstemp(image_path);
+    int fd = g_file_open_tmp("qtest.XXXXXX", &image_path, NULL);
     if (fd == -1) {
         g_printerr("Failed to create temporary file %s: %s\n", image_path,
                    strerror(errno));
+        g_free(image_path);
         exit(EXIT_FAILURE);
     }
     if (ftruncate(fd, UNIFORM_FLASH_SIZE) < 0) {
         int error_code = errno;
         close(fd);
-        unlink(image_path);
+        cleanup(NULL);
         g_printerr("Failed to truncate file %s to %u MB: %s\n", image_path,
                    UNIFORM_FLASH_SIZE, strerror(error_code));
         exit(EXIT_FAILURE);
diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index bf7304c7dc..0fa00c12dc 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -161,12 +161,13 @@ static void test_qmp_protocol(void)
 
 /* Out-of-band tests */
 
-char tmpdir[] = "/tmp/qmp-test-XXXXXX";
+char *tmpdir;
 char *fifo_name;
 
 static void setup_blocking_cmd(void)
 {
-    if (!g_mkdtemp(tmpdir)) {
+    tmpdir = g_dir_make_tmp("qmp-test-XXXXXX", NULL);
+    if (!tmpdir) {
         g_error("g_mkdtemp: %s", strerror(errno));
     }
     fifo_name = g_strdup_printf("%s/fifo", tmpdir);
@@ -179,6 +180,7 @@ static void cleanup_blocking_cmd(void)
 {
     unlink(fifo_name);
     rmdir(tmpdir);
+    g_free(tmpdir);
 }
 
 static void send_cmd_that_blocks(QTestState *s, const char *id)
diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index a81c2a2715..07a4c2d500 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -841,7 +841,8 @@ static char *create_listen_socket(int *fd)
     char *path;
 
     /* No race because our pid makes the path unique */
-    path = g_strdup_printf("/tmp/qtest-%d-sock.XXXXXX", getpid());
+    path = g_strdup_printf("%s/qtest-%d-sock.XXXXXX",
+                           g_get_tmp_dir(), getpid());
     tmp_fd = mkstemp(path);
     g_assert_cmpint(tmp_fd, >=, 0);
     close(tmp_fd);
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index d7d6cfc9bd..4e1aae1794 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -482,8 +482,7 @@ static TestServer *test_server_new(const gchar *name,
         struct vhost_user_ops *ops)
 {
     TestServer *server = g_new0(TestServer, 1);
-    char template[] = "/tmp/vhost-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs;
 
     server->context = g_main_context_new();
     server->loop = g_main_loop_new(server->context, FALSE);
@@ -491,9 +490,10 @@ static TestServer *test_server_new(const gchar *name,
     /* run the main loop thread so the chardev may operate */
     server->thread = g_thread_new(NULL, thread_function, server->loop);
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("vhost-test-XXXXXX", NULL);
     if (!tmpfs) {
-        g_test_message("g_mkdtemp on path (%s): %s", template, strerror(errno));
+        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+                       strerror(errno));
     }
     g_assert(tmpfs);
 
diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.c
index dc5eed31c8..19c01f808b 100644
--- a/tests/qtest/virtio-blk-test.c
+++ b/tests/qtest/virtio-blk-test.c
@@ -49,10 +49,10 @@ static void drive_destroy(void *path)
 static char *drive_create(void)
 {
     int fd, ret;
-    char *t_path = g_strdup("/tmp/qtest.XXXXXX");
+    char *t_path;
 
     /* Create a temporary raw image */
-    fd = mkstemp(t_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &t_path, NULL);
     g_assert_cmpint(fd, >=, 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert_cmpint(ret, ==, 0);
diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.c
index 8ceb12aacd..073a89d535 100644
--- a/tests/qtest/virtio-scsi-test.c
+++ b/tests/qtest/virtio-scsi-test.c
@@ -268,7 +268,7 @@ static void test_iothread_attach_node(void *obj, void *data,
     QVirtioSCSIPCI *scsi_pci = obj;
     QVirtioSCSI *scsi = &scsi_pci->scsi;
     QVirtioSCSIQueues *vs;
-    char tmp_path[] = "/tmp/qtest.XXXXXX";
+    g_autofree char *tmp_path;
     int fd;
     int ret;
 
@@ -282,7 +282,7 @@ static void test_iothread_attach_node(void *obj, void *data,
     vs = qvirtio_scsi_init(scsi->vdev);
 
     /* Create a temporary qcow2 overlay*/
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
diff --git a/tests/unit/test-image-locking.c b/tests/unit/test-image-locking.c
index ba057bd66c..d09ff43fcb 100644
--- a/tests/unit/test-image-locking.c
+++ b/tests/unit/test-image-locking.c
@@ -76,10 +76,10 @@ static void check_locked_bytes(int fd, uint64_t perm_locks,
 static void test_image_locking_basic(void)
 {
     BlockBackend *blk1, *blk2, *blk3;
-    char img_path[] = "/tmp/qtest.XXXXXX";
+    g_autofree char *img_path;
     uint64_t perm, shared_perm;
 
-    int fd = mkstemp(img_path);
+    int fd = g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
     assert(fd >= 0);
 
     perm = BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
@@ -117,10 +117,10 @@ static void test_image_locking_basic(void)
 static void test_set_perm_abort(void)
 {
     BlockBackend *blk1, *blk2;
-    char img_path[] = "/tmp/qtest.XXXXXX";
+    g_autofree char *img_path;
     uint64_t perm, shared_perm;
     int r;
-    int fd = mkstemp(img_path);
+    int fd = g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
     assert(fd >= 0);
 
     perm = BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index a05a4628ed..b73d231cd5 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -59,7 +59,7 @@ fixture_setup(TestFixture *fixture, gconstpointer data, gchar **envp)
 
     fixture->loop = g_main_loop_new(NULL, FALSE);
 
-    fixture->test_dir = g_strdup("/tmp/qgatest.XXXXXX");
+    fixture->test_dir = g_strdup_printf("%s/qgatest.XXXXXX", g_get_tmp_dir());
     g_assert_nonnull(g_mkdtemp(fixture->test_dir));
 
     path = g_build_filename(fixture->test_dir, "sock", NULL);
diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index 9b1dab2f28..fecdf915e7 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -631,7 +631,6 @@ static void *notifier_thread(void *arg)
 static void
 vubr_host_notifier_setup(VubrDev *dev)
 {
-    char template[] = "/tmp/vubr-XXXXXX";
     pthread_t thread;
     size_t length;
     void *addr;
@@ -639,7 +638,7 @@ vubr_host_notifier_setup(VubrDev *dev)
 
     length = qemu_real_host_page_size() * VHOST_USER_BRIDGE_MAX_QUEUES;
 
-    fd = mkstemp(template);
+    fd = g_file_open_tmp("vubr-XXXXXX", NULL, NULL);
     if (fd < 0) {
         vubr_die("mkstemp()");
     }
-- 
2.34.1


