Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D516E42CFCF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 03:06:13 +0200 (CEST)
Received: from localhost ([::1]:60444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mapCG-0001Xr-Vx
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 21:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIo-0004A8-Je
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:50 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:33430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIi-0004ty-Al
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:50 -0400
Received: by mail-qk1-x72c.google.com with SMTP id l7so3902493qkk.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 16:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mxmkAfiWWbatcHjMuwTQ1jtLYAJ25C50o7Sp15K/pSM=;
 b=A3dThu9iWfrvQnd8VsGuQKY09+NQvUP3KcSAGBk2lDOc6msod+kphnmxMWPYwuAKsy
 SJLCIxbswO4AV4kbbg5yfUbRHLoDEJCPbGz0ZKnkc0nwVQv+cLgs93rrqFNsfXagdCky
 eVKNNNVbwdJfR+capUqD7XL4wAo5i98dyh+OzeMiN6sjq7i7YPk3PaNE7FlfKUj2hqA5
 /a/Zk54rUKElUfzeoRbf/3P1A2N9fy2cEnGlnpROcOKGxrO2MF314k7GtpJGCFDGKYEf
 fuPT3VXiPnzOU623YrzNHfeVyAOrIiNvUIUMGihQuQRETQ+voJCXOFP7NTJNC4mLswpc
 oNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mxmkAfiWWbatcHjMuwTQ1jtLYAJ25C50o7Sp15K/pSM=;
 b=O+F/KY8Qi2ZeTUerR92NuLu95GvYjynA0zMhyeZjwIG2M8eZfjyyyU+7G41gEg4B9E
 edBvIpnujJXcw6RwuPaIF3tN5iZ6PKDat4oAYjUaZY7mqgb0v44XaBqUjm4fdWh4ZeTK
 KKrHwY684IFa8tUxBRgbqAqhpYLes4CSIegymI2Sjk6aD3HkAE7QVAdnOTFVc4gIcZ6X
 ElKzn0G/gmA9EkYL25aJNO/Js/xWvfmgwmCnRS4/rAt01FwqadTWrSDv9MWTXm9sU1nI
 qLtOCFmsYc0KiTtW8CgRq4ms+oZVNt18E1Z9rfcDwvsACTxtVcjdS8ues4oiz6QJYNlm
 JfFg==
X-Gm-Message-State: AOAM531mdyhDP63UY76Hvhd6TEws9rYX2ewKayudbf69s6dx8nNZjPOY
 2q1ZjGuzabhHLUMhzAyeWsbe84WKE6XLcw==
X-Google-Smtp-Source: ABdhPJzy8mrPG9HtF9ixKjIvtfQxBxceJKw1ouxQ69ubb5oFwvH5n1S+Q9mwsr/Bk7ZGgbwUHsb6Jg==
X-Received: by 2002:ae9:dd82:: with SMTP id r124mr1834080qkf.234.1634166282633; 
 Wed, 13 Oct 2021 16:04:42 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w11sm778680qta.50.2021.10.13.16.04.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 16:04:42 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] 9p: darwin: Compatibility for f/l*xattr
Date: Wed, 13 Oct 2021 19:04:02 -0400
Message-Id: <20211013230405.32170-9-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013230405.32170-1-wwcohen@gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:55:22 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

On darwin `fgetxattr` takes two extra optional arguments,
and the l* variants are not defined (in favor of an extra
flag to the regular variants.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
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
2.33.0


