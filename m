Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390755EE110
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:58:13 +0200 (CEST)
Received: from localhost ([::1]:34634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZRr-0002JM-9w
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odYFo-0005QC-4S; Wed, 28 Sep 2022 10:41:40 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odYFj-0006fM-PT; Wed, 28 Sep 2022 10:41:38 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so1912445pjl.0; 
 Wed, 28 Sep 2022 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sTIk1fAg45F4xpTrCDT3spGtsuW6MAwdTmFUIYVkoCg=;
 b=Pd1LHzyvUlW6Cp+9dWR+R9BOcA/7uoxbnjcIjEeiKhQeKsAZfaB2+AJ93xByEuQDe6
 6H0k0YhgaPqvWRBdhoc9m8L9KTxApzQXL4EoHotJLR1hpYv4qIoMVgIUmWOT7BgXY0+t
 gNz5jT31pCr6+6/pSt9kNzl8kDyEJ28epylaL2M4FCvGFB3Ep4325Tgpqa6Arc8aL5nT
 7suTMBMCp1IXzQYa1psA7ec5iYptK9h2q0hAz9ku9gghR1th91Je7ivH4DFXR48RjDm+
 I5vY4sXNONEOJCUL77muPuiJmFMYnnaSSXXrvdEas5Zf09feC070cKIf51mqEHP63k4f
 bIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sTIk1fAg45F4xpTrCDT3spGtsuW6MAwdTmFUIYVkoCg=;
 b=ocZ9X79/b5+q3LgcTgPbwX1Hp+eNY3ZryDHkLMeBvacNzixfdAyGiF//RW36KvYXQi
 PFCYcdDoZa9jKncC9fXnIuI+pVbipV+K9LWYlCgJQSiuYHE1AUKhHPyHIU1LYkWF+bFn
 73asWMEOGkMMlfRMSoTxcSI+EYpnaSfJIfVg/j1Tj/2/vIpacKgkCgNcZa+MTQwPfiYr
 IiV0oLH6MiKhxJpdsEAXfB6s5yEo+usev2Fe3RUd3V9CggtYzIFVJl6VBJiVFWbrF+vJ
 9Gl9uWDpTndkIfv1jeVyheiE0qX1R2vqhnkxNqxCv/EvLJLSDNJyeM/X4Frp4hwzI7kr
 kIaQ==
X-Gm-Message-State: ACrzQf0LF7D5bPWBDsIKg4xux/MtNQNVoPv+u8nu1tR9cAkdHdE2jQbC
 PQOVJE/zYGNp5scPxtE4AXZBwLzxXCQ=
X-Google-Smtp-Source: AMsMyM5wqWXDsYKTQrxyGgmjd5IJVnWPEsk577Iu3EoQpZ6mHKShyYRIA9IEY8zedtHyoxS+P8vTBQ==
X-Received: by 2002:a17:903:2411:b0:178:5653:ecda with SMTP id
 e17-20020a170903241100b001785653ecdamr170136plo.166.1664376093156; 
 Wed, 28 Sep 2022 07:41:33 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 w187-20020a6262c4000000b005546fe4b127sm4075906pfb.78.2022.09.28.07.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 07:41:32 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] block: Refactor get_tmp_filename()
Date: Wed, 28 Sep 2022 22:41:25 +0800
Message-Id: <20220928144125.1997128-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928144125.1997128-1-bmeng.cn@gmail.com>
References: <20220928144125.1997128-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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
platform specific implementations inside the function, and the use
of snprintf is really undesirable.

The function name is also misleading. It creates a temporary file,
not just a filename.

Refactor this routine by changing its name and signature to:

    char *create_tmp_file(Error **errp)

and use g_file_open_tmp() for a consistent implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v5:
- minor change in the commit message
- add some notes in the function comment block
- add g_autofree for tmp_filename

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
 block.c                          | 45 ++++++++++++--------------------
 block/vvfat.c                    |  7 +++--
 3 files changed, 20 insertions(+), 34 deletions(-)

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
index 582c205307..bd3006d85d 100644
--- a/block.c
+++ b/block.c
@@ -860,35 +860,25 @@ int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo)
 
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
+        error_setg(errp, "%s", err->message);
+        return NULL;
     }
     close(fd);
-    return 0;
-#endif
+    return g_steal_pointer(&name);
 }
 
 /*
@@ -3714,8 +3704,7 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
                                                    QDict *snapshot_options,
                                                    Error **errp)
 {
-    /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
-    char *tmp_filename = g_malloc0(PATH_MAX + 1);
+    g_autofree char *tmp_filename = NULL;
     int64_t total_size;
     QemuOpts *opts = NULL;
     BlockDriverState *bs_snapshot = NULL;
@@ -3734,9 +3723,8 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
     }
 
     /* Create the temporary image */
-    ret = get_tmp_filename(tmp_filename, PATH_MAX + 1);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "Could not get temporary filename");
+    tmp_filename = create_tmp_file(errp);
+    if (!tmp_filename) {
         goto out;
     }
 
@@ -3770,7 +3758,6 @@ static BlockDriverState *bdrv_append_temp_snapshot(BlockDriverState *bs,
 
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
 
-- 
2.34.1


