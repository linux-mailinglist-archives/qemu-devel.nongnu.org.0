Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE1A4CD544
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:36:40 +0100 (CET)
Received: from localhost ([::1]:45574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ86p-0003AZ-Fs
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:36:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <41e44bc8e4e96608f89fdeca6e62f0b10261e731@lizzy.crudebyte.com>)
 id 1nQ7s9-0006Ce-18
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:21:33 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <41e44bc8e4e96608f89fdeca6e62f0b10261e731@lizzy.crudebyte.com>)
 id 1nQ7s7-0001R5-Jj
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:21:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=ecDSm2KPo+CRggTbcmt7kTibk+zlTy8+C8rBHzZ84Mc=; b=A/YG0
 0c/Vceqr5sU2en/DwnsDOOlaZ5Y2MWOgQui4/3pl2rmNAP6tm502guzzDqWjJu51jYUoKsuQrrkqS
 MO/6dEGQCd45GT7jKCM7KxD5HBqVMgEi1mLXY8BhP3ZvfbzNyYuhN/AVjU1nAZUPtOYgrIg4YiqRX
 LEeiTMSJpB4mRlKDF37NEk0Dj0ZAU4F9nR840ueSAR4LRqLkpSVe5fWr1pULQLrz6HHiP4QLAiTH4
 rdjBu3yS2w/QU9LcH9zu5QtbGjdnlRybGWKzyLS+cwZGVazF4nigiAAaoH51/W9Od/lD4Axq+xG2q
 tFspnxlGz77p1A0CwgvElLR82lqMw==;
Message-Id: <41e44bc8e4e96608f89fdeca6e62f0b10261e731.1646396869.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646396869.git.qemu_oss@crudebyte.com>
References: <cover.1646396869.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 04 Mar 2022 13:27:49 +0100
Subject: [PULL 08/19] 9p: darwin: Compatibility for f/l*xattr
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=41e44bc8e4e96608f89fdeca6e62f0b10261e731@lizzy.crudebyte.com;
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

From: Keno Fischer <keno@juliacomputing.com>

On darwin `fgetxattr` takes two extra optional arguments,
and the l* variants are not defined (in favor of an extra
flag to the regular variants.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Message-Id: <20220227223522.91937-9-wwcohen@gmail.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-local.c | 12 ++++++++----
 hw/9pfs/9p-util.h  | 17 +++++++++++++++++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index f3272f0b43..a0d08e5216 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -790,16 +790,20 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
         mode_t tmp_mode;
         dev_t tmp_dev;
 
-        if (fgetxattr(fd, "user.virtfs.uid", &tmp_uid, sizeof(uid_t)) > 0) {
+        if (qemu_fgetxattr(fd, "user.virtfs.uid",
+                           &tmp_uid, sizeof(uid_t)) > 0) {
             stbuf->st_uid = le32_to_cpu(tmp_uid);
         }
-        if (fgetxattr(fd, "user.virtfs.gid", &tmp_gid, sizeof(gid_t)) > 0) {
+        if (qemu_fgetxattr(fd, "user.virtfs.gid",
+                           &tmp_gid, sizeof(gid_t)) > 0) {
             stbuf->st_gid = le32_to_cpu(tmp_gid);
         }
-        if (fgetxattr(fd, "user.virtfs.mode", &tmp_mode, sizeof(mode_t)) > 0) {
+        if (qemu_fgetxattr(fd, "user.virtfs.mode",
+                           &tmp_mode, sizeof(mode_t)) > 0) {
             stbuf->st_mode = le32_to_cpu(tmp_mode);
         }
-        if (fgetxattr(fd, "user.virtfs.rdev", &tmp_dev, sizeof(dev_t)) > 0) {
+        if (qemu_fgetxattr(fd, "user.virtfs.rdev",
+                           &tmp_dev, sizeof(dev_t)) > 0) {
             stbuf->st_rdev = le64_to_cpu(tmp_dev);
         }
     } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 2b9ac74291..9abff79884 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -19,6 +19,23 @@
 #define O_PATH_9P_UTIL 0
 #endif
 
+#ifdef CONFIG_DARWIN
+#define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
+#define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
+#define qemu_llistxattr(...) listxattr(__VA_ARGS__, XATTR_NOFOLLOW)
+#define qemu_lremovexattr(...) removexattr(__VA_ARGS__, XATTR_NOFOLLOW)
+static inline int qemu_lsetxattr(const char *path, const char *name,
+                                 const void *value, size_t size, int flags) {
+    return setxattr(path, name, value, size, 0, flags | XATTR_NOFOLLOW);
+}
+#else
+#define qemu_fgetxattr fgetxattr
+#define qemu_lgetxattr lgetxattr
+#define qemu_llistxattr llistxattr
+#define qemu_lremovexattr lremovexattr
+#define qemu_lsetxattr lsetxattr
+#endif
+
 static inline void close_preserve_errno(int fd)
 {
     int serrno = errno;
-- 
2.20.1


