Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319EF5EC643
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:33:53 +0200 (CEST)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBeh-0000RU-QB
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odAEL-0006sk-8O; Tue, 27 Sep 2022 09:02:33 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odAEJ-0001uC-9e; Tue, 27 Sep 2022 09:02:32 -0400
Received: by mail-pg1-x534.google.com with SMTP id s206so9364922pgs.3;
 Tue, 27 Sep 2022 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=T5SDTVqVEaz4x4vfwq9kUhyd/fGb+nmlcTRJGBUVFS0=;
 b=DXo3xjL4Hq/r+8CUPUXGVBRWl3tGICMZ7O8ZGPfkC8Q5Uq2U4YGPX3bzvXv+pcFMSC
 7L0a/fEf/8dqaZKdG5WaBvSLCuQisw2wGgUCjcANKHW3M/FIPa+g6zXC3ENCX5kd+rh7
 FIgk9iu7iZz1byWmDIotF4a+I4LYcFJU2Z7OxdNtd+mQu3hufqlpTIm/Vi42O8V7/RuP
 rJ01sYtlUStjskWjxle0YkIaiopl/ZBnrlbk5kCWW2sLKRIDAI0DhYBxpvDrMsAR2OWK
 24ksoBdJjfDjzHy9xSPBmza7W4weJ0Dh4YMTZmQVKSlkKHTju2PFUIoYb0Yw0wVSiG0b
 Ylkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=T5SDTVqVEaz4x4vfwq9kUhyd/fGb+nmlcTRJGBUVFS0=;
 b=Hwi3Ho+De7SvAXhzBYLoKQjBd9QkplUyWs5gH1GK6mKitG5ZEiOK7e9lxGUqtu4kVK
 KBYScIXwmOaNKPcq2nkbYcgBmPvui/XS815CFyUNeJWcKktAAbDQB5XiW8suOy4FlIBr
 +1e18Jijr/yGnPZM5jrGK2UMCcO382zl9FgMSrWZltAGKGSS+bB7crqSkyAk8KwwiyiO
 9t+ye7944r6YOMAfrMVhSQJwwrremjhstvcuOrzh2aTctD/xK3HwpZ35FRFXrOWWtTun
 PnbCz8hM/8w1OtvrC14fSvEyRyFvGd5/74MqigBQZ+pcrLnc7/LzanPfn4yHAorj8egn
 O13A==
X-Gm-Message-State: ACrzQf01QM8CRNwJU0hzcOxFEUvrJd82brqbS4UBxG6sCxZ+evwMiNu8
 phFhzg2Vw4C55UXJ89RYTU0=
X-Google-Smtp-Source: AMsMyM70TqzUfcskP+HfpVsDJPGEppXI969RgbULPMviJmmmugIg5JmPm5zZB84TlvfoKjupH7jANA==
X-Received: by 2002:a63:fa4d:0:b0:43c:7fa:95f7 with SMTP id
 g13-20020a63fa4d000000b0043c07fa95f7mr23999064pgk.48.1664283749259; 
 Tue, 27 Sep 2022 06:02:29 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a170902cec200b00176a715653dsm1477808plg.145.2022.09.27.06.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 06:02:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v4] block: Refactor get_tmp_filename()
Date: Tue, 27 Sep 2022 21:02:23 +0800
Message-Id: <20220927130224.1982931-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
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

The function name is also misleading. It creates a temporary file,
not just a filename.

Refactor this routine by changing its name and signature to:

    char *create_tmp_file(Error **errp)

and use g_file_open_tmp() for a consistent implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v4:
- Rename the function to create_tmp_file() and take "Error **errp" as
  a parameter, so that callers can pass errp all the way down to this
  routine.
- Commit message updated to reflect the latest change

Changes in v3:
- Do not use errno directly, instead still let get_tmp_filename() return
  a negative number to indicate error

Changes in v2:
- Use g_autofree and g_steal_pointer

 include/block/block_int-common.h |  2 +-
 block.c                          | 47 ++++++++++++--------------------
 block/vvfat.c                    |  7 ++---
 3 files changed, 21 insertions(+), 35 deletions(-)

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
index bc85f46eed..b33bd774ae 100644
--- a/block.c
+++ b/block.c
@@ -860,38 +860,27 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
 
 /*
  * Create a uniquely-named empty temporary file.
- * Return 0 upon success, otherwise a negative errno value.
+ * Return the actual file name used upon success, otherwise NULL.
+ * This string should be freed with g_free() when not needed any longer.
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
+    g_autofree char *name = NULL;
+    g_autoptr(GError) err = NULL;
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
+    fd = g_file_open_tmp("vl.XXXXXX", &name, &err);
     if (fd < 0) {
-        return -errno;
+        error_setg_errno(errp, -ENOENT, "%s", err->message);
+        return NULL;
     }
     if (close(fd) != 0) {
-        unlink(filename);
-        return -errno;
+        unlink(name);
+        error_setg_errno(errp, -errno, "Could not close the temporary file");
+        return NULL;
     }
-    return 0;
-#endif
+
+    return g_steal_pointer(&name);
 }
 
 /*
@@ -3717,8 +3706,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
                                                    QDict *snapshot_options,
                                                    Error **errp)
 {
-    /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
-    char *tmp_filename = g_malloc0(PATH_MAX + 1);
+    char *tmp_filename = NULL;
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
@@ -3737,9 +3725,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     }
 
     /* Create the temporary image */
-    ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "Could not get temporary filename");
+    tmp_filename = create_tmp_file(errp);
+    if (!tmp_filename) {
         goto out;
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
 
-- 
2.34.1


