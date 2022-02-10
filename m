Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A60A4B11EB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 16:45:07 +0100 (CET)
Received: from localhost ([::1]:49736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIBd4-0000pf-3k
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 10:45:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9WZ-00034V-5k
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:25 -0500
Received: from [2607:f8b0:4864:20::82a] (port=34646
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9WW-0004HH-5l
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:14 -0500
Received: by mail-qt1-x82a.google.com with SMTP id g4so4513809qto.1
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 05:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axA+qxXpY8sKbyRbqVq801h3dnGKdNQsigejBH57FZ8=;
 b=G4ANToTONn4/nY8Zv5ObXqrnE5+OsD/pYNzG+m39T46pV+OBoAhpEuUAMf4aXCR6kr
 uhzdMW/N9yNd//iz156MIF1U2VQHSlyJTJYTDrp97FpZhQTPi9WZcVL9OpstD0Z31bs9
 1uxJphRdjTCW5tSfKT0gXhD34jDkQrZ35Xpd0Ug36dv1HvopAP+/n+8agGc9M2C1N0Nt
 zC8n2LQrC1hX4Yl3FbtmQWnCWfxr3LY8+i1uH9zFKenKO3eAkn2Xy6qlAcYYAnVoBJPG
 ZNwpuKWEZAHll94dj0zGpDUmOT3fRBecUTow6lX+2myzl1llw3vrAFKmgVdtfUW6M9X/
 /vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axA+qxXpY8sKbyRbqVq801h3dnGKdNQsigejBH57FZ8=;
 b=tgMuFAYpZAVCfKimaD24Ebr6fZ3/dc9depeL+LaUZbMBmgoic54YbJC4CVoZOggLtk
 yiI1qrj2kpLsK6ZPM6yAO+QAl75K2fftCb9D9vMVfN0zR4XtTDX1xMlrs2qP+Pe89qM5
 dhny1vkbOD1tUsYTY3n0c31tKDKcB48EPiFt87FbavpBEN6h4kUJMUz4GSX4u9eTzfkl
 jiCr+v7laZCUCykhBEk4OjtvrvRDOyzO3aBZju6xYoJTeclMA310dmZRf4ZoAibZ0njg
 wnQZr33Dvrq4E/UNxVzFa7Txg+LgB1i+N9GFnJ3TgHRyDTRpq2xRHopFw2gagJAec2GO
 +1Vg==
X-Gm-Message-State: AOAM532ZVVgBJHwipFRLrJAcdyoxSig2hv7IBFkxSKSGtTPDbvBnZCbD
 TGt7QVsNbvTB/nYDkZnpRXtBngwgpzkbiA==
X-Google-Smtp-Source: ABdhPJxA+hL98RJDam7c9UpoNgKkRks+8hKEvTXAPe1E1QzQV+4+Bf+DKIbfvAFHUuWYB7gBd5AEoQ==
X-Received: by 2002:a05:622a:488:: with SMTP id
 p8mr4829409qtx.97.1644499811013; 
 Thu, 10 Feb 2022 05:30:11 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id t1sm11289616qtc.48.2022.02.10.05.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:30:10 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/11] 9p: darwin: *xattr_nofollow implementations
Date: Thu, 10 Feb 2022 08:29:42 -0500
Message-Id: <20220210132946.2303-8-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210132946.2303-1-wwcohen@gmail.com>
References: <20220210132946.2303-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82a.google.com
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

This implements the darwin equivalent of the functions that were
moved to 9p-util(-linux) earlier in this series in the new
9p-util-darwin file.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-util-darwin.c | 64 ++++++++++++++++++++++++++++++++++++++++
 hw/9pfs/meson.build      |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 hw/9pfs/9p-util-darwin.c

diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
new file mode 100644
index 0000000000..cdb4c9e24c
--- /dev/null
+++ b/hw/9pfs/9p-util-darwin.c
@@ -0,0 +1,64 @@
+/*
+ * 9p utilities (Darwin Implementation)
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/xattr.h"
+#include "9p-util.h"
+
+ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char *name,
+                             void *value, size_t size)
+{
+    int ret;
+    int fd = openat_file(dirfd, filename,
+                         O_RDONLY | O_PATH_9P_UTIL | O_NOFOLLOW, 0);
+    if (fd == -1) {
+        return -1;
+    }
+    ret = fgetxattr(fd, name, value, size, 0, 0);
+    close_preserve_errno(fd);
+    return ret;
+}
+
+ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
+                              char *list, size_t size)
+{
+    int ret;
+    int fd = openat_file(dirfd, filename,
+                         O_RDONLY | O_PATH_9P_UTIL | O_NOFOLLOW, 0);
+    if (fd == -1) {
+        return -1;
+    }
+    ret = flistxattr(fd, list, size, 0);
+    close_preserve_errno(fd);
+    return ret;
+}
+
+ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
+                                const char *name)
+{
+    int ret;
+    int fd = openat_file(dirfd, filename, O_PATH_9P_UTIL | O_NOFOLLOW, 0);
+    if (fd == -1) {
+        return -1;
+    }
+    ret = fremovexattr(fd, name, 0);
+    close_preserve_errno(fd);
+    return ret;
+}
+
+int fsetxattrat_nofollow(int dirfd, const char *filename, const char *name,
+                         void *value, size_t size, int flags)
+{
+    int ret;
+    int fd = openat_file(dirfd, filename, O_PATH_9P_UTIL | O_NOFOLLOW, 0);
+    if (fd == -1) {
+        return -1;
+    }
+    ret = fsetxattr(fd, name, value, size, 0, flags);
+    close_preserve_errno(fd);
+    return ret;
+}
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 1b28e70040..12443b6ad5 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -14,6 +14,7 @@ fs_ss.add(files(
   'coxattr.c',
 ))
 fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
+fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-- 
2.34.1


