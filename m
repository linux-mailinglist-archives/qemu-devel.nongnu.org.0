Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DE945877F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 01:51:27 +0100 (CET)
Received: from localhost ([::1]:47388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moxYN-0006zG-0V
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 19:51:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWX-00049p-Gc
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:33 -0500
Received: from [2607:f8b0:4864:20::82e] (port=37722
 helo=mail-qt1-x82e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWV-0000xd-OP
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:33 -0500
Received: by mail-qt1-x82e.google.com with SMTP id f20so15071959qtb.4
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 16:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zcMIBtIRje8FHwrfkPF9thMagQnucgcETi34ZcFHWNQ=;
 b=hfy0KqMgETqsTRrR4MWt2u6fQSxzZA3jNhqFUvyn4gbRC5+LZt+wnY0OR9GWzLB33e
 4WTbULhdJqpalISPwIujy6rwiDSgy1h8oDNBdNT60FeKPJ4wyNoZWlWVAtS13QSTly9k
 az4b1tueSm5rzdIfnMZm93liC7MnvQquoWrmelzOHHtNKY47ya9dHSftARQYO0OtBKtC
 9DE83NOQw6SKxyY02JbWPMxx/lsctYGP1JubDaj6ncKREUBrSTYpSpMkwWt9O9rczPui
 z4jqBy/mF9eONWKaUh877yzgRvIck3lET1jOQXB8g4Q90f4OqkI5C7RjjJh1wSLRyc7v
 0ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zcMIBtIRje8FHwrfkPF9thMagQnucgcETi34ZcFHWNQ=;
 b=CvDxElmESDeAupnB+CIiIKzxozF4/fL5NHITVgoMTWql+EC5qx93XGyj0f4R8Ayu17
 PRtoU18uSSe4Y3U/ZOzeGfvD2r+ATkvzesHCUpL/zvWuEHtHtRyL9Ung3HkhKcD3eqbU
 5EFHgaZRzwwhf+U54QHn2SoChy0mdpNk3bDiYaFxYN/1MtcKDBy/Dj9aeyYiphG/G0nS
 lpO/ekATDvOiZQV3wJFK6EmfIBS3G9V+2V0O/E9uPlF4+LSZ99gqUZWf+PapVYkke5GW
 zQnV6H+qslYeULW8s1hWPm4ilPcHGxDgAy5l0LvOd8HylwqLlfT4FNL3XALYrtBmq2YU
 QV6g==
X-Gm-Message-State: AOAM532yKGqRd5QB6x1JmjlmeP70RlaFwDMEydCUMoR59W7ofF/fQvn+
 76lPjb0lDpajsbyo42DyS12HMepRrqfC3w==
X-Google-Smtp-Source: ABdhPJzcbQiLPYdper7XJoNkNQi3lAW3pgPRNOnVQhnSd7fsedwNLMsP00K1RGLEJ5S3yq2sV5YS3Q==
X-Received: by 2002:ac8:202:: with SMTP id k2mr27013059qtg.398.1637542170865; 
 Sun, 21 Nov 2021 16:49:30 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id x17sm3651745qta.66.2021.11.21.16.49.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Nov 2021 16:49:30 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/11] 9p: darwin: Compatibility for f/l*xattr
Date: Sun, 21 Nov 2021 19:49:10 -0500
Message-Id: <20211122004913.20052-9-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122004913.20052-1-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82e.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>
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
2.34.0


