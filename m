Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820874CFE16
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:21:57 +0100 (CET)
Received: from localhost ([::1]:59688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCNA-0001V6-HE
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:21:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b5989326f558faedd2511f29459112cced2ca8f5@lizzy.crudebyte.com>)
 id 1nRBtB-0005bL-J7
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:50:57 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:56571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b5989326f558faedd2511f29459112cced2ca8f5@lizzy.crudebyte.com>)
 id 1nRBt6-00039N-Gm
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=yCG8mfUuZb4ASX+9n9SbWhBnUD8nd9nbfeLYRBwUpm4=; b=Tvc//
 xwWBQf9iC5eXcTYiTyIlWVXpuE8POh9ruRgj5RNMNkq5GFvD+oSartctghNvzXnyCILhRG+YZ7UKa
 LjbFMr+IKaHo6ZVxDMBqpwEd93ZxUZYhq1l5q5wwEWWjLl+uqE6TXctK9ZYvXtNtqFBJRt7qPuAor
 ujDeBLeTRg/qh23MFzx3QjSVsf7muy+Dd6+4Dlgcdg0w2h0wYcDYfTaT/22zivHmAXktmwNcbC4jm
 U3MEAaFajLtORlN3nJhiEQaW/r5qT+mRnVE8J5GeJqqOskv2Rqg+/Lu/xebsJdxe7XolDxEjLofnm
 5um57UJwtNJEdVn+7VHCWnRdai1DA==;
Message-Id: <b5989326f558faedd2511f29459112cced2ca8f5.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 08/19] 9p: darwin: Compatibility for f/l*xattr
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=b5989326f558faedd2511f29459112cced2ca8f5@lizzy.crudebyte.com;
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
index a48da32f04..be8dc1a43a 100644
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


