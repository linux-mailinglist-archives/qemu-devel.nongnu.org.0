Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B8F50E35C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:36:21 +0200 (CEST)
Received: from localhost ([::1]:56426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizp6-0004B5-FJ
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgV-0006W0-Eo
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:32 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgT-0004hx-9h
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 bd19-20020a17090b0b9300b001d98af6dcd1so94333pjb.4
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cgH1nLMBp7dm1saUWSPVOv3Pj2nqgXKX1pYTbouhGLY=;
 b=EsnMLo7tCKfVqKoNvjdOBZY6ZlWcCxm8BWo/21jmVzb0AORQVUYe+qP30zoudIwypU
 xea0S1XUz2cckoXa6msLQUKjiyEjhQzA9pQVJc0bL0Fl+9Fq1V0iIqg2pEM3BZ6NVSrT
 SztZZbx+Uqoyj1IR4up3RLnDLS2V0tn5Vq9QGNivEBW83cuIZbIk1DU7tqwsdnZLU2Yb
 IPge+2OmHIwmElFqLO9u4X0MxXWvVlwZIKL4iPA/77v3nZCOLyl5p7ifkXIL1J0xNrTY
 pLa24AcI+liQ48sDUVPddjKrASeu9yq2zM2vXkacZKfsLBGzpfhjAq7zHuUPkGE5sMHk
 KW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cgH1nLMBp7dm1saUWSPVOv3Pj2nqgXKX1pYTbouhGLY=;
 b=TMcj9IKepiMFc8SmGb4hrLpefWun83GCJsMaeN1ouO/bgvQ8wgYRazlZELoqNoOKYj
 APOEMlS8gKL3aFXjE3RdR4UfQPwjBK/VoPu47wQ0Jz5ackuXf0WY5blXp1HiaT7N2/RL
 kFlEMAoF392pgJY9S3Osnn1L7oCqFwbyW4hl8VtinPz3VwSR8chRchURZrtDGi9Ez79Y
 b3uxkLDCjAQsA4Gop/A0/s0plPVsiqiMQjBqFQKzfU2N52srrqs4HwspvrKvCMduYAI4
 T4voaWIe4X1zZGNXLp+FMAJaKTRA3TeWM6QzrD4lqhrnycKNv2iYYJSaqoezM6y2pBYw
 THXg==
X-Gm-Message-State: AOAM531JZnsaRqHGA3OHKJx7LclQ5ePjSteBnHHfYW/stBaV2KPlS0TB
 8+sebUQ/LVsjCuzB7w40woSvUGwCKsM=
X-Google-Smtp-Source: ABdhPJz7+Utexi/OtniKH/v8bqHtMrhi6haKUsnWX+G325CwrQ3T7Bw6XkZ3V0YABldL6it8+5j+zw==
X-Received: by 2002:a17:902:8605:b0:15d:10dc:1c6f with SMTP id
 f5-20020a170902860500b0015d10dc1c6fmr5851453plo.4.1650896843951; 
 Mon, 25 Apr 2022 07:27:23 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 t1-20020a628101000000b0050d47199857sm2437968pfd.73.2022.04.25.07.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:27:23 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 3/9] hw/9pfs: Extract common stuff to 9p-local.h
Date: Mon, 25 Apr 2022 22:26:59 +0800
Message-Id: <20220425142705.2099270-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425142705.2099270-1-bmeng.cn@gmail.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guohuai Shi <guohuai.shi@windriver.com>

Some macros (e.g.: VIRTFS_META_DIR) are used by both Linux and macOS,
and will be used by the upcoming Windows support too, extract them
from 9p-local.c to 9p-local.h.

Note local_is_mapped_file_metadata()is changed to an inline function.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/9pfs/9p-local.h | 16 ++++++++++++++++
 hw/9pfs/9p-local.c | 14 --------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/hw/9pfs/9p-local.h b/hw/9pfs/9p-local.h
index 32c72749d9..55ea4b7883 100644
--- a/hw/9pfs/9p-local.h
+++ b/hw/9pfs/9p-local.h
@@ -13,6 +13,22 @@
 #ifndef QEMU_9P_LOCAL_H
 #define QEMU_9P_LOCAL_H
 
+#define VIRTFS_META_DIR ".virtfs_metadata"
+#define VIRTFS_META_ROOT_FILE VIRTFS_META_DIR "_root"
+
+#define ATTR_MAX 100
+
+typedef struct {
+    int mountfd;
+} LocalData;
+
+static inline bool local_is_mapped_file_metadata(FsContext *fs_ctx,
+                                                 const char *name)
+{
+    return
+        !strcmp(name, VIRTFS_META_DIR) || !strcmp(name, VIRTFS_META_ROOT_FILE);
+}
+
 int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
                         mode_t mode);
 int local_opendir_nofollow(FsContext *fs_ctx, const char *path);
diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index d42ce6d8b8..73beef84a9 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -53,10 +53,6 @@
 #define BTRFS_SUPER_MAGIC 0x9123683E
 #endif
 
-typedef struct {
-    int mountfd;
-} LocalData;
-
 int local_open_nofollow(FsContext *fs_ctx, const char *path, int flags,
                         mode_t mode)
 {
@@ -114,9 +110,6 @@ static void unlinkat_preserve_errno(int dirfd, const char *path, int flags)
     errno = serrno;
 }
 
-#define VIRTFS_META_DIR ".virtfs_metadata"
-#define VIRTFS_META_ROOT_FILE VIRTFS_META_DIR "_root"
-
 static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
 {
     int fd, o_mode = 0;
@@ -144,7 +137,6 @@ static FILE *local_fopenat(int dirfd, const char *name, const char *mode)
     return fp;
 }
 
-#define ATTR_MAX 100
 static void local_mapped_file_attr(int dirfd, const char *name,
                                    struct stat *stbuf)
 {
@@ -547,12 +539,6 @@ static off_t local_telldir(FsContext *ctx, V9fsFidOpenState *fs)
     return telldir(fs->dir.stream);
 }
 
-static bool local_is_mapped_file_metadata(FsContext *fs_ctx, const char *name)
-{
-    return
-        !strcmp(name, VIRTFS_META_DIR) || !strcmp(name, VIRTFS_META_ROOT_FILE);
-}
-
 static struct dirent *local_readdir(FsContext *ctx, V9fsFidOpenState *fs)
 {
     struct dirent *entry;
-- 
2.25.1


