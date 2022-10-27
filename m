Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C661008A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:43:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7fn-00017D-Lx; Thu, 27 Oct 2022 14:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7fj-000155-2d
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7fh-0002K1-12
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vP64XI9msx3Z8k69tCxoqusJqhkZGYxF1ru2sLaKCXI=;
 b=i4b0TXcu8yk6HLifIAVeTvTpTgLvs5hCl22KdP6k4wGBKnpwNhVXxLd4ItEjrqAkatjNaD
 DirGAQaChZnVKYtnlnwj0qfgDErpeIxdEiCkU5Bv/H355G83wdFcBZ03fnMbSkSP7U+H5A
 rFmpcQWTb/K62yX0SuPcsIJBe6htKqI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-BDuJneq9MbucLogaWAyHDg-1; Thu, 27 Oct 2022 14:32:03 -0400
X-MC-Unique: BDuJneq9MbucLogaWAyHDg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4AC587A9F5;
 Thu, 27 Oct 2022 18:32:01 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F6E31121339;
 Thu, 27 Oct 2022 18:31:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 03/58] block: Refactor get_tmp_filename()
Date: Thu, 27 Oct 2022 20:30:51 +0200
Message-Id: <20221027183146.463129-4-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

At present there are two callers of get_tmp_filename() and they are
inconsistent.

One does:

    /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
    char *tmp_filename = g_malloc0(PATH_MAX + 1);
    ...
    ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);

while the other does:

    s->qcow_filename = g_malloc(PATH_MAX);
    ret = get_tmp_filename(s->qcow_filename, PATH_MAX);

As we can see different 'size' arguments are passed. There are also
platform specific implementations inside the function, and the use
of snprintf is really undesirable.

The function name is also misleading. It creates a temporary file,
not just a filename.

Refactor this routine by changing its name and signature to:

    char *create_tmp_file(Error **errp)

and use g_get_tmp_dir() / g_mkstemp() for a consistent implementation.

While we are here, add some comments to mention that /var/tmp is
preferred over /tmp on non-win32 hosts.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20221010040432.3380478-2-bin.meng@windriver.com>
[kwolf: Fixed incorrect errno negation and iotest 051]
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h |  2 +-
 block.c                          | 56 +++++++++++++++++---------------
 block/vvfat.c                    |  7 ++--
 tests/qemu-iotests/051           |  3 +-
 tests/qemu-iotests/051.out       |  2 +-
 tests/qemu-iotests/051.pc.out    |  2 +-
 6 files changed, 38 insertions(+), 34 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..d7c0a7e96f 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
 }
 
 int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
-int get_tmp_filename(char *filename, int size);
+char *create_tmp_file(Error **errp);
 void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
                                       QDict *options);
 
diff --git a/block.c b/block.c
index 66a35b3982..c8374dac4f 100644
--- a/block.c
+++ b/block.c
@@ -861,35 +861,42 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
 
 /*
  * Create a uniquely-named empty temporary file.
- * Return 0 upon success, otherwise a negative errno value.
+ * Return the actual file name used upon success, otherwise NULL.
+ * This string should be freed with g_free() when not needed any longer.
+ *
+ * Note: creating a temporary file for the caller to (re)open is
+ * inherently racy. Use g_file_open_tmp() instead whenever practical.
  */
-int get_tmp_filename(char *filename, int size)
+char *create_tmp_file(Error **errp)
 {
-#ifdef _WIN32
-    char temp_dir[MAX_PATH];
-    /* GetTempFileName requires that its output buffer (4th param)
-       have length MAX_PATH or greater.  */
-    assert(size >= MAX_PATH);
-    return (GetTempPath(MAX_PATH, temp_dir)
-            && GetTempFileName(temp_dir, "qem", 0, filename)
-            ? 0 : -GetLastError());
-#else
     int fd;
     const char *tmpdir;
-    tmpdir = getenv("TMPDIR");
-    if (!tmpdir) {
+    g_autofree char *filename = NULL;
+
+    tmpdir = g_get_tmp_dir();
+#ifndef _WIN32
+    /*
+     * See commit 69bef79 ("block: use /var/tmp instead of /tmp for -snapshot")
+     *
+     * This function is used to create temporary disk images (like -snapshot),
+     * so the files can become very large. /tmp is often a tmpfs where as
+     * /var/tmp is usually on a disk, so more appropriate for disk images.
+     */
+    if (!g_strcmp0(tmpdir, "/tmp")) {
         tmpdir = "/var/tmp";
     }
-    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
-        return -EOVERFLOW;
-    }
-    fd = mkstemp(filename);
+#endif
+
+    filename = g_strdup_printf("%s/vl.XXXXXX", tmpdir);
+    fd = g_mkstemp(filename);
     if (fd < 0) {
-        return -errno;
+        error_setg_errno(errp, errno, "Could not open temporary file '%s'",
+                         filename);
+        return NULL;
     }
     close(fd);
-    return 0;
-#endif
+
+    return g_steal_pointer(&filename);
 }
 
 /*
@@ -3715,8 +3722,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
                                                    QDict *snapshot_options,
                                                    Error **errp)
 {
-    /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
-    char *tmp_filename = g_malloc0(PATH_MAX + 1);
+    g_autofree char *tmp_filename = NULL;
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
@@ -3735,9 +3741,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     }
 
     /* Create the temporary image */
-    ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "Could not get temporary filename");
+    tmp_filename = create_tmp_file(errp);
+    if (!tmp_filename) {
         goto out;
     }
 
@@ -3771,7 +3776,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
 
 out:
     qobject_unref(snapshot_options);
-    g_free(tmp_filename);
     return bs_snapshot;
 }
 
diff --git a/block/vvfat.c b/block/vvfat.c
index d6dd919683..f9bf8406d3 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3146,10 +3146,9 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
 
     array_init(&(s->commits), sizeof(commit_t));
 
-    s->qcow_filename = g_malloc(PATH_MAX);
-    ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "can't create temporary file");
+    s->qcow_filename = create_tmp_file(errp);
+    if (!s->qcow_filename) {
+        ret = -ENOENT;
         goto err;
     }
 
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index f1a506518b..4c079b11e3 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -375,7 +375,8 @@ if [ "${VALGRIND_QEMU_VM}" == "y" ]; then
     _casenotrun "Valgrind needs a valid TMPDIR for itself"
 fi
 VALGRIND_QEMU_VM= \
-TMPDIR=/nonexistent run_qemu -drive driver=null-co,snapshot=on
+TMPDIR=/nonexistent run_qemu -drive driver=null-co,snapshot=on |
+    sed -e "s#'[^']*/vl\.[A-Za-z0-9]\{6\}'#SNAPSHOT_PATH#g"
 
 # Using snapshot=on together with read-only=on
 echo "info block" |
diff --git a/tests/qemu-iotests/051.out b/tests/qemu-iotests/051.out
index 441f83e41a..e5ddb03bda 100644
--- a/tests/qemu-iotests/051.out
+++ b/tests/qemu-iotests/051.out
@@ -459,7 +459,7 @@ wrote 4096/4096 bytes at offset 0
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Testing: -drive driver=null-co,snapshot=on
-QEMU_PROG: -drive driver=null-co,snapshot=on: Could not get temporary filename: No such file or directory
+QEMU_PROG: -drive driver=null-co,snapshot=on: Could not open temporary file SNAPSHOT_PATH: No such file or directory
 
 Testing: -drive file=TEST_DIR/t.qcow2,snapshot=on,read-only=on,if=none,id=drive0
 QEMU X.Y.Z monitor - type 'help' for more information
diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.out
index 063e4fc584..bade1ff3b9 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -539,7 +539,7 @@ wrote 4096/4096 bytes at offset 0
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Testing: -drive driver=null-co,snapshot=on
-QEMU_PROG: -drive driver=null-co,snapshot=on: Could not get temporary filename: No such file or directory
+QEMU_PROG: -drive driver=null-co,snapshot=on: Could not open temporary file SNAPSHOT_PATH: No such file or directory
 
 Testing: -drive file=TEST_DIR/t.qcow2,snapshot=on,read-only=on,if=none,id=drive0
 QEMU X.Y.Z monitor - type 'help' for more information
-- 
2.37.3


