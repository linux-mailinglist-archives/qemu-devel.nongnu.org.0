Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A6D4BA65B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:48:33 +0100 (CET)
Received: from localhost ([::1]:42338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjxI-0007Rl-Ke
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:48:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e64e27d5cb103b7764f1a05b6eda7e7fedd517c5@lizzy.crudebyte.com>)
 id 1nKjtx-0006Kw-Tk
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:45:06 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:42757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e64e27d5cb103b7764f1a05b6eda7e7fedd517c5@lizzy.crudebyte.com>)
 id 1nKjtq-0005TX-Fl
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=ibq2v8nsektk29gBgTOlpX79uTXZm/dDVAofuhI8Ulc=; b=PPcxV
 wh51Av87wPC+adhbn3h5tRTp9n6bIZpRFcpZGAUpo40GPfU/UhWoB0AIti09J5oY2xF0jNt2TUPyd
 vmwIgodTAvsVg0hUKu1Q9pI63MSkrTM6yuaVDUg79cvN03QAoF/WVPGHgx7zdWwBZ5bZ4gdNe4JSt
 pIKfxv/3Ft1lrRC3zIBQxN9FjcX/gQKVf1Fdxyx4tTKkqfe6WwEcz+n38v0D1GHt8YoTv1VimOurp
 i8MxrXxbmOE3h6goJe4PqPs5+tueLxog8sWvCfqdwdA61g8lxppP8SW7cuL6uGfGo4mJrOqA/i+0/
 q7JAmIbHTNbU0f3AmrI7DjjjokWNw==;
Message-Id: <e64e27d5cb103b7764f1a05b6eda7e7fedd517c5.1645114783.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1645114783.git.qemu_oss@crudebyte.com>
References: <cover.1645114783.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 17 Feb 2022 17:19:44 +0100
Subject: [PULL v2 5/5] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e64e27d5cb103b7764f1a05b6eda7e7fedd517c5@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Vitaly Chikunov <vt@altlinux.org>

`struct dirent' returned from readdir(3) could be shorter (or longer)
than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
into unallocated page causing SIGSEGV. Example stack trace:

 #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 + 0x497eed)
 #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64 + 0x4982e9)
 #2  0x0000555555eb7983 coroutine_trampoline (/usr/bin/qemu-system-x86_64 + 0x963983)
 #3  0x00007ffff73e0be0 n/a (n/a + 0x0)

While fixing this, provide a helper for any future `struct dirent' cloning.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
Cc: qemu-stable@nongnu.org
Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Dmitry V. Levin <ldv@altlinux.org>
Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
Tested-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Acked-by: Greg Kurz <groug@kaod.org>
Tested-by: Vitaly Chikunov <vt@altlinux.org>
Message-Id: <20220216181821.3481527-1-vt@altlinux.org>
[C.S. - Fix typo in source comment. ]
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-synth.c   | 18 +++++++++++++++---
 hw/9pfs/9p-synth.h   |  5 +++++
 hw/9pfs/codir.c      |  3 +--
 include/qemu/osdep.h | 13 +++++++++++++
 util/osdep.c         | 21 +++++++++++++++++++++
 5 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index b38088e066..7a7cd5c5ba 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -182,7 +182,12 @@ static int synth_opendir(FsContext *ctx,
     V9fsSynthOpenState *synth_open;
     V9fsSynthNode *node = *(V9fsSynthNode **)fs_path->data;
 
-    synth_open = g_malloc(sizeof(*synth_open));
+    /*
+     * V9fsSynthOpenState contains 'struct dirent' which have OS-specific
+     * properties, thus it's zero cleared on allocation here and below
+     * in synth_open.
+     */
+    synth_open = g_new0(V9fsSynthOpenState, 1);
     synth_open->node = node;
     node->open_count++;
     fs->private = synth_open;
@@ -220,7 +225,14 @@ static void synth_rewinddir(FsContext *ctx, V9fsFidOpenState *fs)
 static void synth_direntry(V9fsSynthNode *node,
                                 struct dirent *entry, off_t off)
 {
-    strcpy(entry->d_name, node->name);
+    size_t sz = strlen(node->name) + 1;
+    /*
+     * 'entry' is always inside of V9fsSynthOpenState which have NAME_MAX
+     * back padding. Ensure we do not overflow it.
+     */
+    g_assert(sizeof(struct dirent) + NAME_MAX >=
+             offsetof(struct dirent, d_name) + sz);
+    memcpy(entry->d_name, node->name, sz);
     entry->d_ino = node->attr->inode;
     entry->d_off = off + 1;
 }
@@ -266,7 +278,7 @@ static int synth_open(FsContext *ctx, V9fsPath *fs_path,
     V9fsSynthOpenState *synth_open;
     V9fsSynthNode *node = *(V9fsSynthNode **)fs_path->data;
 
-    synth_open = g_malloc(sizeof(*synth_open));
+    synth_open = g_new0(V9fsSynthOpenState, 1);
     synth_open->node = node;
     node->open_count++;
     fs->private = synth_open;
diff --git a/hw/9pfs/9p-synth.h b/hw/9pfs/9p-synth.h
index 036d7e4a5b..eeb246f377 100644
--- a/hw/9pfs/9p-synth.h
+++ b/hw/9pfs/9p-synth.h
@@ -41,6 +41,11 @@ typedef struct V9fsSynthOpenState {
     off_t offset;
     V9fsSynthNode *node;
     struct dirent dent;
+    /*
+     * Ensure there is enough space for 'dent' above, some systems have a
+     * d_name size of just 1, which would cause a buffer overrun.
+     */
+    char dent_trailing_space[NAME_MAX];
 } V9fsSynthOpenState;
 
 int qemu_v9fs_synth_mkdir(V9fsSynthNode *parent, int mode,
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 032cce04c4..c0873bde16 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -143,8 +143,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         } else {
             e = e->next = g_malloc0(sizeof(V9fsDirEnt));
         }
-        e->dent = g_malloc0(sizeof(struct dirent));
-        memcpy(e->dent, dent, sizeof(struct dirent));
+        e->dent = qemu_dirent_dup(dent);
 
         /* perform a full stat() for directory entry if requested by caller */
         if (dostat) {
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index d1660d67fa..ce12f64853 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -805,6 +805,19 @@ static inline int platform_does_not_support_system(const char *command)
 }
 #endif /* !HAVE_SYSTEM_FUNCTION */
 
+/**
+ * Duplicate directory entry @dent.
+ *
+ * It is highly recommended to use this function instead of open coding
+ * duplication of @c dirent objects, because the actual @c struct @c dirent
+ * size may be bigger or shorter than @c sizeof(struct dirent) and correct
+ * handling is platform specific (see gitlab issue #841).
+ *
+ * @dent - original directory entry to be duplicated
+ * @returns duplicated directory entry which should be freed with g_free()
+ */
+struct dirent *qemu_dirent_dup(struct dirent *dent);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/util/osdep.c b/util/osdep.c
index 42a0a4986a..67fbf22778 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -33,6 +33,7 @@
 extern int madvise(char *, size_t, int);
 #endif
 
+#include <dirent.h>
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
@@ -615,3 +616,23 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
     return readv_writev(fd, iov, iov_cnt, true);
 }
 #endif
+
+struct dirent *
+qemu_dirent_dup(struct dirent *dent)
+{
+    size_t sz = 0;
+#if defined _DIRENT_HAVE_D_RECLEN
+    /* Avoid use of strlen() if platform supports d_reclen. */
+    sz = dent->d_reclen;
+#endif
+    /*
+     * Test sz for zero even if d_reclen is available
+     * because some drivers may set d_reclen to zero.
+     */
+    if (sz == 0) {
+        /* Fallback to the most portable way. */
+        sz = offsetof(struct dirent, d_name) +
+                      strlen(dent->d_name) + 1;
+    }
+    return g_memdup(dent, sz);
+}
-- 
2.20.1


