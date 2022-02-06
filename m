Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4739F4AB1FC
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:18:33 +0100 (CET)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGnzU-0006FM-Cl
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:18:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp6-000115-Cf
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:51 -0500
Received: from [2607:f8b0:4864:20::f2f] (port=37676
 helo=mail-qv1-xf2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp4-0001Qe-Rc
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:48 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id a19so3179343qvm.4
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SfDmPYg4RTmB3VAHnPteuLcf45MmDDEEAkNdkij4Il4=;
 b=Lvb5B8j/VF/BXw2ifBTX5J8FbJtaNNOeaRc9cMpt/tu1EV8nDIUnzOx9pLl68JVdOz
 9zYxvRgi7ErZ125DJ6hEylZct1EkU2nsS545MRrVLY7lX/GpBdyaYJhakru7FDWI44AC
 ul8T6H6cLab5iqGRGWwrydloqW8XCX0IqpzkFzNllqaQac+WoYmqqDnCT5TPBG7OOlQ5
 s95MoOHVw4UM4SG8BWGOdAyueFJ1xjt189ZxMszHdJrSpp4Ra52ALuiVOcisVwgj01zY
 KflNZYVKJGLsXwBjhJsi2kkf+kd24cgpsFEITdOn0XVBxp8prwa7yUXsvU9YyclLXFjd
 UVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SfDmPYg4RTmB3VAHnPteuLcf45MmDDEEAkNdkij4Il4=;
 b=g8ZhYbqpWtVg/qLtsEEdRv7iFRkoys/6580Eyn6o0mFeS02qBHl2/2NESbD6r14VtL
 NpTWHW8us2TXIDBqScG48wZ/DlUYSMCWR2GuIgiSchQ3U7jWAPTaEZ2clGWUsXZHKS4a
 TCMg2c3t21sUIHL7UYUjSAFmtg4RiTxrmiGyrzI1VcAiYeYSBXv2HY34cGANTNAJopLz
 OTlne1mK7SxYhhibHBFHM9t5nGd6iX23e7AIyOa6tY9K3TXbFtCwA9ttoRuvH8FHI098
 4KI4RsRC5Br7vwAX90fKenJ7Aehgf/91LAqwsDn4KcWuxhwDLfOPBXOlb5vnVnbc7ajn
 QHEQ==
X-Gm-Message-State: AOAM532UR9HM3mV2gZy8VLIUO/DBDFFUnY6WUUbqNX7QhEHU8YpDeAow
 VBITh98jV1UNCw299RE+Ei6VQ+sNsGKw/A==
X-Google-Smtp-Source: ABdhPJywUyBqyDCPyIX4wwcPa3BQiTDUceqaBc9GpZNidKDrtQd3/gtfrrLUrWp3nTjxXImoUIQazg==
X-Received: by 2002:a05:6214:411d:: with SMTP id
 kc29mr1721177qvb.65.1644178065602; 
 Sun, 06 Feb 2022 12:07:45 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j11sm4625999qtj.74.2022.02.06.12.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 12:07:45 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/11] 9p: darwin: *xattr_nofollow implementations
Date: Sun,  6 Feb 2022 15:07:15 -0500
Message-Id: <20220206200719.74464-8-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220206200719.74464-1-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf2f.google.com
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
2.32.0 (Apple Git-132)


