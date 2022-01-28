Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0894A03CB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 23:36:21 +0100 (CET)
Received: from localhost ([::1]:56076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDZqt-0005bl-Tr
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 17:36:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>)
 id 1nDZok-0003yq-Jw; Fri, 28 Jan 2022 17:34:06 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:60956)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>)
 id 1nDZoh-0002RF-1M; Fri, 28 Jan 2022 17:34:06 -0500
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 02BF972C8FA;
 Sat, 29 Jan 2022 01:33:59 +0300 (MSK)
Received: from beacon.altlinux.org (unknown [193.43.10.9])
 by imap.altlinux.org (Postfix) with ESMTPSA id D3EBC4A46F0;
 Sat, 29 Jan 2022 01:33:58 +0300 (MSK)
From: Vitaly Chikunov <vt@altlinux.org>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Sat, 29 Jan 2022 01:33:26 +0300
Message-Id: <20220128223326.927132-1-vt@altlinux.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable
 autolearn_force=no
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
Cc: Vitaly Chikunov <vt@altlinux.org>, qemu-stable@nongnu.org, ldv@altlinux.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

`struct dirent' returned from readdir(3) could be shorter than
`sizeof(struct dirent)', thus memcpy of sizeof length will overread
into unallocated page causing SIGSEGV. Example stack trace:

 #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 + 0x497eed)
 #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64 + 0x4982e9)
 #2  0x0000555555eb7983 coroutine_trampoline (/usr/bin/qemu-system-x86_64 + 0x963983)
 #3  0x00007ffff73e0be0 n/a (n/a + 0x0)

While fixing, provide a helper for any future `struct dirent' cloning.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
Cc: qemu-stable@nongnu.org
Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
---
Tested on x86-64 Linux.

Changes since v1:
- Update commentary text.
- Remove hanging of g_malloc "errors".
- Simplify qemu_dirent_dup.

 hw/9pfs/codir.c      |  3 +--
 include/qemu/osdep.h | 13 +++++++++++++
 util/osdep.c         | 16 ++++++++++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

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
index 42a0a4986a..0bc7ec1e22 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -33,6 +33,7 @@
 extern int madvise(char *, size_t, int);
 #endif
 
+#include <dirent.h>
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
@@ -615,3 +616,18 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
     return readv_writev(fd, iov, iov_cnt, true);
 }
 #endif
+
+struct dirent *
+qemu_dirent_dup(struct dirent *dent)
+{
+#if defined _DIRENT_HAVE_D_RECLEN
+    /* Avoid use of strlen() if there's d_reclen. */
+    const size_t sz = dent->d_reclen;
+#else
+    /* Fallback to a most portable way. */
+    const size_t sz = offsetof(struct dirent, d_name) +
+                      strlen(dent->d_name) + 1;
+#endif
+    struct dirent *dst = g_malloc(sz);
+    return memcpy(dst, dent, sz);
+}
-- 
2.33.0


