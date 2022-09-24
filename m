Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73AB5E8E82
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 18:37:10 +0200 (CEST)
Received: from localhost ([::1]:45548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc89N-0001cf-9e
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 12:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc84X-0006iN-Qq; Sat, 24 Sep 2022 12:32:09 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc84W-00032l-2P; Sat, 24 Sep 2022 12:32:09 -0400
Received: by mail-pg1-x529.google.com with SMTP id 78so2896648pgb.13;
 Sat, 24 Sep 2022 09:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=3fLBdcZhhNl2zLIB1Zmo9u57fzLjjJc5+MN69nxRVsA=;
 b=nDTi21WdB/6UAtLLHa87i3ebK90raDzqpN+Ae2WiFi+AIb5SX78LpABEmcScr07Z9P
 jPmjjjy1Z55Wsk0+pLOMAq1QsrReTvY2KyU6nwUDiIR+GyS+2h47wh+gJT82PEBmLze7
 F8pnLWJNh/nWiIYX4HQsy5ihifAnrTstkfN562j/hfx4YSLZDHUEewtjOPLZYo/FMdI+
 rfZLZ3wiUSPAGY7fj9FJXG7RnqPj+CvMmbpP45vautBA9Z9pSaBMvOP60Xu5O0ApDniE
 93ge0sHqtMwcR1csiHDzlOSTBpld6DiKm6c0mi5gg0ysNOesaInoGVkmJw3H0R+gVrE4
 jMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=3fLBdcZhhNl2zLIB1Zmo9u57fzLjjJc5+MN69nxRVsA=;
 b=W4YycoPJdCNemSitQsSAW8Nfshj92AZWyN0nKe3Wh8HEyLu8jYyQMIe9KVdjrzhETz
 1VAUqM3MOtoiS7338KhM4P5anKa5KaBHnCqyaTV+WDtaycTokjNbxfb/8n8tFV/MbLdY
 /CToJv+8BwA5sFUIx6qB4KMYko7eh4AdYwvGWWstJDb4hmwExmff7quhcQWouNTW/JjZ
 PAXwuPU+bcMw6QAHvINBCIY0yk4PZ3u8HclWJ87YDqTsr39JESpjGA8dtj8CM580dtkz
 aoRAZltZo8G7rA8cO1nybik4gq6Y08OBCY3edpEdbTfgQ8jcw3UaxSe9awC8xiFiliXi
 KZqQ==
X-Gm-Message-State: ACrzQf1uEHCHYKZ/yIPROCJe2LzHBXushNOLo89vkUzAT4ThG6VBWrJp
 My7MdqcYIoqGnTjEuDwGKXo=
X-Google-Smtp-Source: AMsMyM520tgXcRs0Ci33T9giCXofa3gSh+mULCdTXf+AaYUtDgBU+kO/Drt8keQ4OakvZ4f6528/rg==
X-Received: by 2002:a05:6a00:21c8:b0:52e:3404:eba5 with SMTP id
 t8-20020a056a0021c800b0052e3404eba5mr15080298pfj.67.1664037125999; 
 Sat, 24 Sep 2022 09:32:05 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 30-20020a17090a195e00b0020036e008bcsm3584870pjh.4.2022.09.24.09.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 09:32:05 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3] block: Refactor get_tmp_filename()
Date: Sun, 25 Sep 2022 00:32:00 +0800
Message-Id: <20220924163200.1910807-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x529.google.com
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
platform specific implementations inside the function, and this use
of snprintf is really undesirable.

Refactor this routine by changing its signature to:

    int get_tmp_filename(char **filename)

and use g_file_open_tmp() for a consistent implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v3:
- Do not use errno directly, instead still let get_tmp_filename() return
  a negative number to indicate error

Changes in v2:
- Use g_autofree and g_steal_pointer

 include/block/block_int-common.h |  2 +-
 block.c                          | 36 ++++++++++----------------------
 block/vvfat.c                    |  3 +--
 3 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..eb30193198 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
 }
 
 int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
-int get_tmp_filename(char *filename, int size);
+int get_tmp_filename(char **filename);
 void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
                                       QDict *options);
 
diff --git a/block.c b/block.c
index bc85f46eed..55ad257241 100644
--- a/block.c
+++ b/block.c
@@ -861,37 +861,24 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
 /*
  * Create a uniquely-named empty temporary file.
  * Return 0 upon success, otherwise a negative errno value.
+ * The caller function is responsible for freeing *filename.
  */
-int get_tmp_filename(char *filename, int size)
+int get_tmp_filename(char **filename)
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
+    g_autofree char *name = NULL;
     int fd;
-    const char *tmpdir;
-    tmpdir = getenv("TMPDIR");
-    if (!tmpdir) {
-        tmpdir = "/var/tmp";
-    }
-    if (snprintf(filename, size, "%s/vl.XXXXXX", tmpdir) >= size) {
-        return -EOVERFLOW;
-    }
-    fd = mkstemp(filename);
+
+    fd = g_file_open_tmp("vl.XXXXXX", &name, NULL);
     if (fd < 0) {
-        return -errno;
+        return -ENOENT;
     }
     if (close(fd) != 0) {
-        unlink(filename);
+        unlink(name);
         return -errno;
     }
+
+    *filename = g_steal_pointer(&name);
     return 0;
-#endif
 }
 
 /*
@@ -3717,8 +3704,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
                                                    QDict *snapshot_options,
                                                    Error **errp)
 {
-    /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
-    char *tmp_filename = g_malloc0(PATH_MAX + 1);
+    char *tmp_filename = NULL;
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
@@ -3737,7 +3723,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     }
 
     /* Create the temporary image */
-    ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
+    ret = get_tmp_filename(&tmp_filename);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "Could not get temporary filename");
         goto out;
diff --git a/block/vvfat.c b/block/vvfat.c
index d6dd919683..43f42fd1ea 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3146,8 +3146,7 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
 
     array_init(&(s->commits), sizeof(commit_t));
 
-    s->qcow_filename = g_malloc(PATH_MAX);
-    ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
+    ret = get_tmp_filename(&s->qcow_filename);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "can't create temporary file");
         goto err;
-- 
2.34.1


