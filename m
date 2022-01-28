Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1030749F05E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:12:32 +0100 (CET)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFoV-0001pa-6S
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:12:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZO-0003a0-JN
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:55 -0500
Received: from [2607:f8b0:4864:20::731] (port=44563
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZK-0005Nq-P0
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:53 -0500
Received: by mail-qk1-x731.google.com with SMTP id c189so4231051qkg.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axA+qxXpY8sKbyRbqVq801h3dnGKdNQsigejBH57FZ8=;
 b=lpaSVeHWwUIid5LYeGtf/se2i/J9JWD9yC2v4nYzmXtQG8eObT2VJ2KHMEXo60xjr5
 WmLJ96CjGOo4tP0RxuhVIOi/COv/75RUAm2KuPOkyjr+ET+cu7W67jX+mJEsKim7owcZ
 CSjtZn5edEwaNYvvqz387vn3rmEEc5LOK4e4FtlKXDPtl9222zC0pfkgT8Q7EZ9ux+4d
 ZtcNqWAj1R38+Iu8qaE4AGmMd8RsUmLka8zle8RkQHFhQAM9cM0tTMmaxk/hBWPxDttc
 UXjvH77glEMv03LoR0XUxc3AFLSub2ld0C4fe9oumtRAx4SNDsYyCcwt3WvllsXenBbB
 n6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axA+qxXpY8sKbyRbqVq801h3dnGKdNQsigejBH57FZ8=;
 b=qCA4X4QidPm+nRo9wFj8cVLwxDo0mAGLerJNmp4tklnynhEQUKud2RKPnK98UkkTAJ
 61oOXYLeh9XoWSatJB50EKMp7yiSwUhsxSSib6B3yUlpGFuVikUbZRAOQ9qkkjV4Fyfz
 5JGYIbaZqu+hhBha1iz3snYSw5xkS8nAnKe/C4bYG3Z8dmXAdIpoMkSOxgOy/stcdcD2
 HEcjckkR2J5eDR9oM8L4C9jirKZOBpgfe3+Mj0iGGnFsIxLV8r549USC3hByTMQOxZmT
 p7CtIvy3mU9ey/b3aJZVoQFTbHRtc6qYABpG7pT/K98lGRnVOZqpCttzmH/nJlcfR6jW
 F9+g==
X-Gm-Message-State: AOAM531OvR7AtXpUwUyR7eTcA00tQF0BzCvjj7ydGx7qECCx0ZF3dnoR
 o4/HESO6ouNZZqYy9abUIZdLJzSJdk3y6Q==
X-Google-Smtp-Source: ABdhPJzsr2o8Zh5Shmi/StuFgFfMzMYvglNuaVlfhwWWh2Wk+yEYXevLsGRPLQ8k5x5n8Uknb32XTQ==
X-Received: by 2002:a05:620a:2a07:: with SMTP id
 o7mr4355067qkp.274.1643331392917; 
 Thu, 27 Jan 2022 16:56:32 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id d8sm2182003qtd.70.2022.01.27.16.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 16:56:32 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/11] 9p: darwin: *xattr_nofollow implementations
Date: Thu, 27 Jan 2022 19:56:07 -0500
Message-Id: <20220128005611.87185-8-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128005611.87185-1-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x731.google.com
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


