Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5632049F063
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:16:52 +0100 (CET)
Received: from localhost ([::1]:52198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFsh-0005v2-FP
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:16:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZQ-0003cF-NL
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:56 -0500
Received: from [2607:f8b0:4864:20::833] (port=39587
 helo=mail-qt1-x833.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZK-0005Nx-W0
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:55 -0500
Received: by mail-qt1-x833.google.com with SMTP id e16so3983958qtq.6
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dyXbaUWI87vEvaFm/j8XyKL35nbeKiTA9OSzqHDk2PA=;
 b=da1t2IGGyvkCDVhPm6P9ivoN7mCGKBaRostnJZoJVduSpBFG8JENZDN8Ndem6ZiY/U
 hgy/UtYVa/28a7s9qsUV0vSPxw1YpMlVS1Om7xydPEpTCOyC5sw7YKbvHiIBHnUc+wg/
 EJIijMXBstdVwFGxtfasw7mGVsU8XsCD7HeIRv9meipkE+RHPVAUSSsg06svpjDKEN94
 1kQEqUaRE+op6pAIxNAIzkS13NmvxMeZa157cwAnvKUiCcD4ZywuIAFhmlFVKvg0rqOz
 ECnOeR5QSR34xB95pfiIXPIq9NagRHUpwTOBIEuKS1ls7FRhoGCL9HHFpc15IGhHZDDV
 81mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyXbaUWI87vEvaFm/j8XyKL35nbeKiTA9OSzqHDk2PA=;
 b=mA06+26r6imO5PBJx1XCmlBU0fjimOjB9NV1d+1X6VUaDFlxV5yjPBur6e31M5i5+C
 KCMzUBRFqVeJEwp6UakR2z3TePi1Up84xVeWSuCEIUrLR3mx0PrdXPDK6Tb+xNgLvfo9
 bcqmhsW0RU1fJQs73FiKO+ocvzxdbhlUvQWTG1w/+3hwU3fvx+pUDi5IyP3hUl5R8VFR
 5myMdcyd2MFIUEd8ZrA0NW64yh2gAwrmKEamllezUARh6qmX7FE04xHnknkNoeXO97pi
 aQe/pRK9qpUOcyhpDtDC+2Fls/n3dy/6GB9yNAKyB6tZ3NzP7sPSgom95O3hzIiv+M6U
 3jfw==
X-Gm-Message-State: AOAM531PQFAlBWGsgswx4ng+P+EPJSeLx2ud1vIGpqcb9d/kTDfaPyZZ
 1jddPaw+uSpE3Kx+ZXnfntunoEaaKDBN6w==
X-Google-Smtp-Source: ABdhPJypzcyLjCc+aPYXcTfhJ42fovqNpJFpE8x41fyaKCxEL3NbiWDjnkKTFAe2zGzOVBtQ7NBL4g==
X-Received: by 2002:a05:622a:58d:: with SMTP id
 c13mr4616177qtb.297.1643331394148; 
 Thu, 27 Jan 2022 16:56:34 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id d8sm2182003qtd.70.2022.01.27.16.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 16:56:33 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/11] 9p: darwin: Compatibility for f/l*xattr
Date: Thu, 27 Jan 2022 19:56:08 -0500
Message-Id: <20220128005611.87185-9-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128005611.87185-1-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::833
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
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
---
 hw/9pfs/9p-local.c | 12 ++++++++----
 hw/9pfs/9p-util.h  | 17 +++++++++++++++++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 1a5e3eed73..2bfff79b12 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -781,16 +781,20 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
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
index 627baebaba..38ef8b289d 100644
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
2.34.1


