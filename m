Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F1C4CFF9B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:08:43 +0100 (CET)
Received: from localhost ([::1]:54208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRD6Q-00067B-Mq
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:08:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1983d8b0d6b013f025905c7d37e3f0261edc328b@lizzy.crudebyte.com>)
 id 1nRCgq-0000rI-GI
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:42:19 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:47275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1983d8b0d6b013f025905c7d37e3f0261edc328b@lizzy.crudebyte.com>)
 id 1nRCga-0004DK-BP
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=m3rxyJIWUSZsunwAVPLXFSOKT6ApHv/hF1xLM+mgQMU=; b=c+zU1
 RBYqDRDhiX5cB1m/b7e+ZvHAjkJuEGGiNKHaz13PceIVMzCIdzU+WzuH0XxtMpi1bKu+tQTPXdyID
 408fMeSL7BJidM2eCHfhDUoMXarAkDNT/ugQqHjqDEmd5T7JxAhRrRpVxjssiIodWOYxAQWOqF+uV
 5ntn8UfEJIXHuk/Ti0hH3fntdPKMYQiZe3PHI8C9iJOnvA1WScTOx0i8dP11y1XjTO7r4aPJ87xPY
 KQ3EfCx8SURqtviHbGD8jkPg+lC3GhdTqOntu1GqQcr5LS7AgQKT/esgTvh0C27C+a2xuixZqxcL/
 JBUO20ngqRGhC8hUgLHW4NMT2DsWg==;
Message-Id: <1983d8b0d6b013f025905c7d37e3f0261edc328b.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 12/19] 9pfs: move qemu_dirent_dup() from osdep -> 9p-util
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=1983d8b0d6b013f025905c7d37e3f0261edc328b@lizzy.crudebyte.com;
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

Function qemu_dirent_dup() is currently only used by 9pfs server, so move
it from project global header osdep.h to 9pfs specific header 9p-util.h.

Link: https://lore.kernel.org/qemu-devel/CAFEAcA_=HAUNomKD2wurSVaAHa5mrk22A1oHKLWUDjk7v6Khmg@mail.gmail.com/
Based-on: <20220227223522.91937-12-wwcohen@gmail.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
---
 hw/9pfs/9p-util.h    | 30 ++++++++++++++++++++++++++++++
 include/qemu/osdep.h | 13 -------------
 util/osdep.c         | 21 ---------------------
 3 files changed, 30 insertions(+), 34 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 73b08c5561..408d71c8f7 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -114,6 +114,36 @@ static inline off_t qemu_dirent_off(struct dirent *dent)
 #endif
 }
 
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
+static inline struct dirent *qemu_dirent_dup(struct dirent *dent)
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
+
 /*
  * As long as mknodat is not available on macOS, this workaround
  * using pthread_fchdir_np is needed. qemu_mknodat is defined in
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 7bcce3bceb..650ba1aa50 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -673,19 +673,6 @@ static inline int platform_does_not_support_system(const char *command)
 }
 #endif /* !HAVE_SYSTEM_FUNCTION */
 
-/**
- * Duplicate directory entry @dent.
- *
- * It is highly recommended to use this function instead of open coding
- * duplication of @c dirent objects, because the actual @c struct @c dirent
- * size may be bigger or shorter than @c sizeof(struct dirent) and correct
- * handling is platform specific (see gitlab issue #841).
- *
- * @dent - original directory entry to be duplicated
- * @returns duplicated directory entry which should be freed with g_free()
- */
-struct dirent *qemu_dirent_dup(struct dirent *dent);
-
 #ifdef __cplusplus
 }
 #endif
diff --git a/util/osdep.c b/util/osdep.c
index 723cdcb004..7c4deda6fe 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -33,7 +33,6 @@
 extern int madvise(char *, size_t, int);
 #endif
 
-#include <dirent.h>
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
@@ -619,23 +618,3 @@ writev(int fd, const struct iovec *iov, int iov_cnt)
     return readv_writev(fd, iov, iov_cnt, true);
 }
 #endif
-
-struct dirent *
-qemu_dirent_dup(struct dirent *dent)
-{
-    size_t sz = 0;
-#if defined _DIRENT_HAVE_D_RECLEN
-    /* Avoid use of strlen() if platform supports d_reclen. */
-    sz = dent->d_reclen;
-#endif
-    /*
-     * Test sz for zero even if d_reclen is available
-     * because some drivers may set d_reclen to zero.
-     */
-    if (sz == 0) {
-        /* Fallback to the most portable way. */
-        sz = offsetof(struct dirent, d_name) +
-                      strlen(dent->d_name) + 1;
-    }
-    return g_memdup(dent, sz);
-}
-- 
2.20.1


