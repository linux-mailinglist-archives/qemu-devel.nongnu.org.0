Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4598049ED68
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:31:52 +0100 (CET)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDCMw-00011s-Qm
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:31:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>) id 1nDCJg-0007Ou-Ba
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:28:29 -0500
Received: from vmicros1.altlinux.org ([194.107.17.57]:44974)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>) id 1nDCJe-0001ht-9I
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 16:28:28 -0500
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 7EDBB72C8FA;
 Fri, 28 Jan 2022 00:28:23 +0300 (MSK)
Received: from beacon.altlinux.org (unknown [193.43.10.9])
 by imap.altlinux.org (Postfix) with ESMTPSA id 648F44A46F0;
 Fri, 28 Jan 2022 00:28:23 +0300 (MSK)
From: Vitaly Chikunov <vt@altlinux.org>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Subject: [PATCH] 9pfs: Fix segfault in do_readdir_many caused by struct dirent
 overread
Date: Fri, 28 Jan 2022 00:27:34 +0300
Message-Id: <20220127212734.218900-1-vt@altlinux.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Vitaly Chikunov <vt@altlinux.org>, ldv@altlinux.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

`struct dirent' returned from readdir(3) could be shorter than
`sizeof(struct dirent)', thus memcpy of sizeof length will overread
into unallocated page causing SIGSEGV. Example stack trace:

 #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 + 0x497eed)
 #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64 + 0x4982e9)
 #2  0x0000555555eb7983 coroutine_trampoline (/usr/bin/qemu-system-x86_64 + 0x963983)
 #3  0x00007ffff73e0be0 n/a (n/a + 0x0)

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
---
Tested on x86-64 Linux.

 hw/9pfs/codir.c      |  7 +++++--
 include/qemu/osdep.h |  6 ++++++
 util/osdep.c         | 23 +++++++++++++++++++++++
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index 032cce04c4..ea7f5e6578 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -143,8 +143,11 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         } else {
             e = e->next = g_malloc0(sizeof(V9fsDirEnt));
         }
-        e->dent = g_malloc0(sizeof(struct dirent));
-        memcpy(e->dent, dent, sizeof(struct dirent));
+        e->dent = qemu_dirent_dup(dent);
+        if (!e->dent) {
+            err = -errno;
+            break;
+        }
 
         /* perform a full stat() for directory entry if requested by caller */
         if (dostat) {
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index d1660d67fa..b54d22db04 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -805,6 +805,12 @@ static inline int platform_does_not_support_system(const char *command)
 }
 #endif /* !HAVE_SYSTEM_FUNCTION */
 
+/**
+ * Actual 'struct dirent' size may be bigger or shorter than
+ * sizeof(struct dirent) in many cases.
+ */
+struct dirent *qemu_dirent_dup(struct dirent *dent);
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/util/osdep.c b/util/osdep.c
index 42a0a4986a..e39d1071fd 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -33,6 +33,7 @@
 extern int madvise(char *, size_t, int);
 #endif
 
+#include <dirent.h>
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
@@ -615,3 +616,25 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
     return readv_writev(fd, iov, iov_cnt, true);
 }
 #endif
+
+struct dirent *
+qemu_dirent_dup(struct dirent *dent)
+{
+    struct dirent *dst;
+#if defined _DIRENT_HAVE_D_RECLEN
+    /* Avoid use of strlen() if there's d_reclen. */
+    dst = g_malloc(dent->d_reclen);
+#else
+    /* Fallback to a most portable way. */
+    const size_t reclen = offsetof(struct dirent, d_name) + strlen(dent->d_name) + 1;
+
+    dst = g_malloc(reclen);
+#endif
+    if (!dst)
+        return NULL;
+#ifdef _DIRENT_HAVE_D_RECLEN
+    return memcpy(dst, dent, dent->d_reclen);
+#else
+    return memcpy(dst, dent, reclen);
+#endif
+}
-- 
2.33.0


