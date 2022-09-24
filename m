Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3D45E8C08
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 14:03:05 +0200 (CEST)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc3s7-0004Am-QT
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 08:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc3bU-0004zE-07; Sat, 24 Sep 2022 07:45:52 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc3bS-0003ka-9P; Sat, 24 Sep 2022 07:45:51 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e67so2501574pgc.12;
 Sat, 24 Sep 2022 04:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=CSJpyFiQfhsfNodb4hdYZGfoHLbFXB1eKMyoXO2bJv4=;
 b=ENzLyiJHRCclrCSxtMZAIVbhNCO3PXN8yX7UBzVbZb5mbvWwm5r5dUJNlFzKNiKWFr
 8iCvFTvA2VaiqCnLQE5eBABrtJ8B7dETEOAp5LIJlx8u0+8FwDkrl/ztnQ9uERqA1vRD
 IWvs2nsCZjaEvDq9c8UY9QCR12t+HOprRQYHRs+bRwWk6nFcg9FdoiKgSvdUdfBSyNPf
 /SwmoCEyyLBJK8s29vZnPBNJoMS6spxCoYZjf5pPe/9dWOwFuLS8ybc2uip+zn7kEfLE
 5lupUZayJe9HLMrF4YEx6Ypqgmrp7qfVo7UZ2OxAUIdjmrNc0oBjawzFylizqtH8sECh
 j/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=CSJpyFiQfhsfNodb4hdYZGfoHLbFXB1eKMyoXO2bJv4=;
 b=poGqaajl4rF72mcXp3cLL9m4L7JtbURt9mWv025lK3TSoxfz0TzL7+BvAMLmdtLsWL
 TyReBs6Ry2b5y3sKkhbHWU7zCZfCYPpVEX9VqTI0r+owF65X+QBdzA82eAWag7HazFOV
 TgxtIkEMoHaW/3PrmEFpyWC+bXrB8GM3anLp3In2ErnP6e3/7zux7MwfPUEpAQ0H+lpI
 TDmoAskXzIS+fn3A2c+NkP3au/R1bcWpENv8nbnEgZBbqEBYppJAhtNUu0tYylJtOpxF
 5gvR1b5v791AB66OqBNwdOdHqwwhSGoEcVzR0msT1M0rkb9w2I1IR+gud7qmwNh0RrGI
 g//g==
X-Gm-Message-State: ACrzQf0amZ7hF2AcDvaM+N7Vhtle+XYBpucjc4vqMDcip7Z1RRP7Q671
 KFMs7q8Tovxxj+IGc1VEFP6OMrhflO4=
X-Google-Smtp-Source: AMsMyM5cSCQUd9PpwT+BPB0YmYL/wUoU/cAgcd6Et7KvszJEmspHmVxSg6r9GS5PsSd2xtVvsDGS6Q==
X-Received: by 2002:a63:188:0:b0:43c:22e9:2d10 with SMTP id
 130-20020a630188000000b0043c22e92d10mr9596208pgb.12.1664019948644; 
 Sat, 24 Sep 2022 04:45:48 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 s1-20020aa78bc1000000b0054a15345162sm8018963pfd.207.2022.09.24.04.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 04:45:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2] block: Refactor get_tmp_filename()
Date: Sat, 24 Sep 2022 19:45:44 +0800
Message-Id: <20220924114544.1906498-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52d.google.com
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

    char *get_tmp_filename(void)

and use g_file_open_tmp() for a consistent implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- Use g_autofree and g_steal_pointer

 include/block/block_int-common.h |  2 +-
 block.c                          | 42 ++++++++++----------------------
 block/vvfat.c                    |  8 +++---
 3 files changed, 18 insertions(+), 34 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..ea69a9349c 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -1230,7 +1230,7 @@ static inline BlockDriverState *child_bs(BdrvChild *child)
 }
 
 int bdrv_check_request(int64_t offset, int64_t bytes, Error **errp);
-int get_tmp_filename(char *filename, int size);
+char *get_tmp_filename(void);
 void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
                                       QDict *options);
 
diff --git a/block.c b/block.c
index bc85f46eed..4e7a795566 100644
--- a/block.c
+++ b/block.c
@@ -860,38 +860,23 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
 
 /*
  * Create a uniquely-named empty temporary file.
- * Return 0 upon success, otherwise a negative errno value.
+ * Return the actual name used upon success, otherwise NULL.
+ * The called function is responsible for freeing it.
  */
-int get_tmp_filename(char *filename, int size)
+char *get_tmp_filename(void)
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
+    g_autofree char *filename = NULL;
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
+    fd = g_file_open_tmp("vl.XXXXXX", &filename, NULL);
     if (fd < 0) {
-        return -errno;
+        return NULL;
     }
     if (close(fd) != 0) {
         unlink(filename);
-        return -errno;
+        return NULL;
     }
-    return 0;
-#endif
+    return g_steal_pointer(&filename);
 }
 
 /*
@@ -3717,8 +3702,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
                                                    QDict *snapshot_options,
                                                    Error **errp)
 {
-    /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
-    char *tmp_filename = g_malloc0(PATH_MAX + 1);
+    char *tmp_filename = NULL;
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
@@ -3737,9 +3721,9 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     }
 
     /* Create the temporary image */
-    ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "Could not get temporary filename");
+    tmp_filename = get_tmp_filename();
+    if (!tmp_filename) {
+        error_setg_errno(errp, errno, "Could not get temporary filename");
         goto out;
     }
 
diff --git a/block/vvfat.c b/block/vvfat.c
index d6dd919683..135fafb166 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -3146,10 +3146,10 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
 
     array_init(&(s->commits), sizeof(commit_t));
 
-    s->qcow_filename = g_malloc(PATH_MAX);
-    ret = get_tmp_filename(s->qcow_filename, PATH_MAX);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "can't create temporary file");
+    s->qcow_filename = get_tmp_filename();
+    if (!s->qcow_filename) {
+        error_setg_errno(errp, errno, "can't create temporary file");
+        ret = -errno;
         goto err;
     }
 
-- 
2.34.1


