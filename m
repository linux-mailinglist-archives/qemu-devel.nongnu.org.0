Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8974AB1FE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:18:34 +0100 (CET)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGnzV-0006HT-AR
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:18:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp8-000118-28
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:51 -0500
Received: from [2607:f8b0:4864:20::829] (port=35622
 helo=mail-qt1-x829.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp6-0001R5-Hr
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:49 -0500
Received: by mail-qt1-x829.google.com with SMTP id j12so10416235qtr.2
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cz8XpkPOdA2WQMQ3HZuTliXREPjA7/5mOjW7Wh5oezE=;
 b=JtjEJcB3WU50O3pYVJrjsC+/ormf6Y0Ur5+zTY0wcWh/LCzw/iELCdJ+uk6VS58vB8
 7gVvVRzn1PpCxRnkRbT6Ou1l88pH2003KsjWGeZIhy+l+IJwoYSEd4xybDDFLpLF07uH
 MQ0evJwUavsQIBkwpkRHSol2mrrlk+zt5OHllt1y57it5u9vcjReAk+HKI4QgACDyBgC
 aTZTSK/d7c/JCHG3CbS/e20hdsllvNp5eu9guttujNVcFgQC+UH5zmreVw6nGW0XbGxJ
 WchGu5cxYGzyZcTT9MbJP39IpJJNEEQeopk710Mwc4ZqKh1MEpTcTnWzf0O2uSKd2rZG
 Wm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cz8XpkPOdA2WQMQ3HZuTliXREPjA7/5mOjW7Wh5oezE=;
 b=KTUcoKKven0k9eE0yDnZRCdN44r6aNpdASHG0Si1wP1YAnjBgx2RYElyl3dbXFfL1e
 f361L9PMUxY5e1a+Mojpd71UqbGJeOgMH9OVSkivBrmH9ivzKbkAzu8+xOqIsxXEr0n0
 IUYhLSHrRnLHBV3wy2QlFodAg/essb+3P1QiR40CUgN3FL+colIe43KB+aDXXproK7FB
 ro4kr6/5wKGNW0L1/kveR/zVwOdRLp58i8012XvFfbWVGI2SrDO7fb8HgQusFTdBn4P2
 LJwhMljt6ehtNE9UlYtaebb4BOuVKgNhPi+RPRqPRHRjMfJnnMHWiL/NM85iLv6vBDxD
 dzrg==
X-Gm-Message-State: AOAM533VDTzp8EN4mlIZTSrwD023vMUJJNWD8/fMtrbM2/oXZ/mWkGxV
 R/k8+V/+v8h4C1nNWI2/MhPYWCigzuMlcg==
X-Google-Smtp-Source: ABdhPJyN8P252CxKGH8873bDqMSfjN8KKQHanb77y6YKZwYBOkxGQ+CH3+DOEwUN6gsfh0amAji0Lg==
X-Received: by 2002:a05:622a:1389:: with SMTP id
 o9mr5999021qtk.192.1644178067356; 
 Sun, 06 Feb 2022 12:07:47 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j11sm4625999qtj.74.2022.02.06.12.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 12:07:46 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/11] 9p: darwin: Compatibility for f/l*xattr
Date: Sun,  6 Feb 2022 15:07:16 -0500
Message-Id: <20220206200719.74464-9-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220206200719.74464-1-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::829
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
index 7137a28109..ea3ded5fca 100644
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
index 3b9c485414..8e610ad224 100644
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
2.32.0 (Apple Git-132)


