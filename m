Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECBF4B74A6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:22:12 +0100 (CET)
Received: from localhost ([::1]:53826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3Os-0005ve-P0
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:22:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK38D-0000yG-3s
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:57 -0500
Received: from [2607:f8b0:4864:20::733] (port=38822
 helo=mail-qk1-x733.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK38B-0002lH-3R
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:56 -0500
Received: by mail-qk1-x733.google.com with SMTP id n185so1391682qke.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9kM+hfKaNHkhAKW7qPhMom4aNnY+CTog/UjBQslxta0=;
 b=fuh7eB4Jn1cCvj4S8hW3js3zOa4O7UC5SarPdTohj4/q4hzch52f05TGW3r7uf/PRt
 bgYENFFZCJGf+iyG2ZrK0j0lrR7kgfeXB9sktgmrQDUVUwz95ogCd4W6ajhjK/j+2diX
 0Vj8QCYY1ECKZJKNYLb21arE/Q8DRdQg7rwet/OMvp5fJv0NvrdWnpkn3Hj35NTViU1e
 70Oi6bPcnN6obQ9ll+fiZ4mx73Zedp8sJyfGK8UU79MGv65E2K25y9x0VjWJt9yBf46u
 yOdrtZxWbooce1bz/GwahVuKfCaqWZtR9ZVdVPtUyfUzJhbd+yTUEHjsGtEgZ5fCHhUI
 0+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9kM+hfKaNHkhAKW7qPhMom4aNnY+CTog/UjBQslxta0=;
 b=lCw2iSkmE9ybWJaonE/MpX2wq8yZ+HboPb7TM2sAGGeT1mbVlF8A7d46D98M6FN0TU
 rVf5Tw0odbwFpeEcCVLwiBmBWHDWn+XjFAEDGEqjBegrE/LhwaZA3vTzuY7aYWFqvx9Z
 oCo8UKggNTeUY5/03zlZm9c+wQzNJS56uxTni6+EdC9N4tWaCHfWPPpa8ReQb92gtXGa
 fuyLtNmQ7Xou0bm76BFzs7ckz4pvpEL2mDsvYbIWj5Y/eLZhhyLcZaELVGWCyfjFGHWM
 SmNwm7Uh1hM3loLLkHNdtpJOhnqsWISkO5r9YWf8UnMpjE3wJxPbJT+/omAs733TYX/W
 goAw==
X-Gm-Message-State: AOAM533shZVL7kO5HzJjCOkThHxoJPAM+EXALKa1EwmuIndGlkDhyDG+
 RTfTmplIJekdz1AH8mUWSe7WEOR8P/HXuQ==
X-Google-Smtp-Source: ABdhPJw5jyrn6k+krYMhpYVlvk5l1E+RhbC8/ox22Qsxp2+cQwVWOXuwfFcHBS3swxKdFuxA23h0cQ==
X-Received: by 2002:a05:620a:8d7:: with SMTP id
 z23mr220784qkz.753.1644951893712; 
 Tue, 15 Feb 2022 11:04:53 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w10sm21364527qtj.73.2022.02.15.11.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:04:52 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/11] 9p: darwin: Compatibility for f/l*xattr
Date: Tue, 15 Feb 2022 14:04:23 -0500
Message-Id: <20220215190426.56130-9-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215190426.56130-1-wwcohen@gmail.com>
References: <20220215190426.56130-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::733
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x733.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
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
index 0e445b5d52..82399702b9 100644
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


