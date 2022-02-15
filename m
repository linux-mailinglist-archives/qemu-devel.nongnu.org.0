Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35B54B7493
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:13:35 +0100 (CET)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3GY-0000SJ-Rx
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:13:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK38C-0000wG-DO
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:56 -0500
Received: from [2607:f8b0:4864:20::f29] (port=34783
 helo=mail-qv1-xf29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK389-0002l0-2U
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:56 -0500
Received: by mail-qv1-xf29.google.com with SMTP id fh9so55522qvb.1
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axA+qxXpY8sKbyRbqVq801h3dnGKdNQsigejBH57FZ8=;
 b=PyhSs4o0+mg3EVtKmV1zwXy6vtt8FL8syRdNhaa84qO5No9p/1WhOUlAxDsf5rUKxv
 fKbhYE5dB+lpsigRji6fsqqg7l81dnt3PI6ebXwX8Pb/1nJ86n5rXtUJotKnfuBksp6N
 zxjTLDDBtqEJTNHkOM6ybU9FUgcCinRFGnSYWbuWDHtbU8dvbo0DUlN2Fetrly53A8n+
 WRuNYdpn5JzBukaC0UjDQvp7bRkY8uVOlIpask8IJvo3XO1sgvy7AogRVsjYs2r1MQIA
 NJGFXTmjWnhgNZXK5ly6dp1akBT+KL3Ikc4ovc483v8KHfc/fSL3oXDq4ixBAOS4qpiy
 v0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axA+qxXpY8sKbyRbqVq801h3dnGKdNQsigejBH57FZ8=;
 b=fwfoluBDPnxpDiAzuUAFhk8O26aFoxsDrQ6pggdyUj57L0lSNNedfhs6GaWmUGnVom
 t1hXBUK6xh9rER5tSwW+mVNqD5nHfZ8ucC95sombJ6WRl3XGgn46rAtS8SL8I/fy/rJ8
 0OXZy4Wcqe25zfuuykJWe/WI/CcVfquohlb6vrKLMEaXvN5mHlwi48/wsRO8s1f8Rgpz
 GTT6Pw0fXpi56ael9BnOrWiErvRRKthafc93irCKt1Ttvmv42mKPpcQSF6eXt20PU7/B
 lpqvO2NghWzAoIXt5x1WX4ZA5m6YP9fOmfSxiGQEUJ5KpAf6pN0sAkUNRvBVw3yKOMB0
 20Aw==
X-Gm-Message-State: AOAM5307FCRhrynsZS9cTJu363JqgEloI2CXeSCSPqROXxf2rxMWP9Iv
 c8yi+ajHesEAOIA1AfA8XMTmaCFDFARHBg==
X-Google-Smtp-Source: ABdhPJw3pBy2MaFf25fIbdCqiUS0BwdzIwVV4h6dC2LO561ahexuSE6BIRAY/GCW0Oun76SIAmh6TA==
X-Received: by 2002:a0c:ed23:: with SMTP id u3mr441793qvq.74.1644951891723;
 Tue, 15 Feb 2022 11:04:51 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w10sm21364527qtj.73.2022.02.15.11.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:04:51 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/11] 9p: darwin: *xattr_nofollow implementations
Date: Tue, 15 Feb 2022 14:04:22 -0500
Message-Id: <20220215190426.56130-8-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215190426.56130-1-wwcohen@gmail.com>
References: <20220215190426.56130-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf29.google.com
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


