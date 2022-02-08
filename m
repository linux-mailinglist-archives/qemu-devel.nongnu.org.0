Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9995F4AE29E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:37:48 +0100 (CET)
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXFD-0000nr-5G
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:37:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWna-00033C-5t
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:09:18 -0500
Received: from [2a00:1450:4864:20::336] (port=51049
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHWnT-00066o-3y
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 15:09:12 -0500
Received: by mail-wm1-x336.google.com with SMTP id m26so87662wms.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 12:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=D31fWlApiNdJKj9pWF83rHnBapTQ9Q4E45VDFHt714s=;
 b=bGpHLsp+PvLEoDTGev5zrlJZ2jVx0RLw7r85mieSasWgGYUlL+goHvW+mC/gWUuljc
 1L4Skdq7GNw6/DfYcTX/mV4yCJFQ4YQIbMWStMB0w0GUGfy+3glkAjHndnAKctVxPHqO
 7iCZ2UR1LnlVSSzcvBQVOb5rrFs/l3eZnonmXkDlod89+DmP6Us/2l72JgCkv1OPklkI
 KbLUFBZi76t0t58RcRM9pfS+KZDDo5/2gENs9fipLqEwVOl6mYMwznL8xm7yoUiEbLBN
 c26yvHCH6tFFPW6wEQD7DwBH+91C1UndBsD1CCetk22pVLdkLMpAzkiJPMt+21DgPG4f
 c03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D31fWlApiNdJKj9pWF83rHnBapTQ9Q4E45VDFHt714s=;
 b=w3qlj1Qf8bk85wHfQf02ghT5ZZlKcu3cyF0tJSudLVFKKtSFCpuZecpE/gZGb0lOaw
 GFzJzHkqay9zx33sOXQ1zPigUOwkeiq0IdHSMWOD02Ve/uYxowscgtoIJLiJpYAlTKX8
 Eewjwku4MIhI1zRiuFPmexneTtQbhdKnrkz3KlzGUGEDT4WZDZ+cvx1tRkdVHrfsV6d0
 J5zPUuN/e7+GtNHXYLiMyDjIOSCxKibNugO8B6hfUN6I/mkMHZPlg3asZ4/J+siJE/gB
 Qms505Dc3MmrDXlRyOoHhQvrdRDboroo/m+giesFL6ChxicK8bzYGQBp0xBEcKpKuE2Z
 2OHA==
X-Gm-Message-State: AOAM530DjLxKkJa9tGQVMU5ELxVa8UZKwEK6wmJNqD0CrZ1x+4I8zmYs
 pOj5oWCFi4iu4bvVj3i1nlTovK5VBdXiqQ==
X-Google-Smtp-Source: ABdhPJyEYj80E9ulI7MMV0bOj5640Ob4yeL0ZlZhxH93/IG0nMb5hCQYJd2M1Bb5jKWYh5I8zyNVdg==
X-Received: by 2002:a05:600c:ac6:: with SMTP id
 c6mr2456726wmr.65.1644350942010; 
 Tue, 08 Feb 2022 12:09:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r2sm4098170wmq.24.2022.02.08.12.09.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 12:09:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] include: Move hardware version declarations to new
 qemu/hw-version.h
Date: Tue,  8 Feb 2022 20:08:56 +0000
Message-Id: <20220208200856.3558249-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208200856.3558249-1-peter.maydell@linaro.org>
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "hardware version" machinery (qemu_set_hw_version(),
qemu_hw_version(), and the QEMU_HW_VERSION define) is used by fewer
than 10 files.  Move it out from osdep.h into a new
qemu/hw-version.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/hw-version.h | 27 +++++++++++++++++++++++++++
 include/qemu/osdep.h      | 16 ----------------
 hw/arm/nseries.c          |  1 +
 hw/ide/core.c             |  1 +
 hw/scsi/megasas.c         |  1 +
 hw/scsi/scsi-bus.c        |  1 +
 hw/scsi/scsi-disk.c       |  1 +
 softmmu/vl.c              |  1 +
 target/i386/cpu.c         |  1 +
 target/s390x/cpu_models.c |  1 +
 util/osdep.c              |  1 +
 11 files changed, 36 insertions(+), 16 deletions(-)
 create mode 100644 include/qemu/hw-version.h

diff --git a/include/qemu/hw-version.h b/include/qemu/hw-version.h
new file mode 100644
index 00000000000..730a8c904d9
--- /dev/null
+++ b/include/qemu/hw-version.h
@@ -0,0 +1,27 @@
+/*
+ * QEMU "hardware version" machinery
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#ifndef QEMU_HW_VERSION_H
+#define QEMU_HW_VERSION_H
+
+/*
+ * Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
+ * instead of QEMU_VERSION, so setting hw_version on MachineClass
+ * is no longer mandatory.
+ *
+ * Do NOT change this string, or it will break compatibility on all
+ * machine classes that don't set hw_version.
+ */
+#define QEMU_HW_VERSION "2.5+"
+
+/* QEMU "hardware version" setting. Used to replace code that exposed
+ * QEMU_VERSION to guests in the past and need to keep compatibility.
+ * Do not use qemu_hw_version() in new code.
+ */
+void qemu_set_hw_version(const char *);
+const char *qemu_hw_version(void);
+
+#endif
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index e36f62a254e..650ba1aa505 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -534,22 +534,6 @@ static inline void qemu_timersub(const struct timeval *val1,
 
 void qemu_set_cloexec(int fd);
 
-/* Starting on QEMU 2.5, qemu_hw_version() returns "2.5+" by default
- * instead of QEMU_VERSION, so setting hw_version on MachineClass
- * is no longer mandatory.
- *
- * Do NOT change this string, or it will break compatibility on all
- * machine classes that don't set hw_version.
- */
-#define QEMU_HW_VERSION "2.5+"
-
-/* QEMU "hardware version" setting. Used to replace code that exposed
- * QEMU_VERSION to guests in the past and need to keep compatibility.
- * Do not use qemu_hw_version() in new code.
- */
-void qemu_set_hw_version(const char *);
-const char *qemu_hw_version(void);
-
 void fips_set_state(bool requested);
 bool fips_get_state(void);
 
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index af3164c5519..9c1cafae86b 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -24,6 +24,7 @@
 #include "chardev/char.h"
 #include "qemu/cutils.h"
 #include "qemu/bswap.h"
+#include "qemu/hw-version.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/ide/core.c b/hw/ide/core.c
index e28f8aad611..33463d9b8f2 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -29,6 +29,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/timer.h"
+#include "qemu/hw-version.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/dma.h"
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index cd43945827c..d5dfb412bac 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -28,6 +28,7 @@
 #include "hw/pci/msix.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
+#include "qemu/hw-version.h"
 #include "hw/scsi/scsi.h"
 #include "scsi/constants.h"
 #include "trace.h"
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 4057e04ce89..b2e2bc3c96c 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -3,6 +3,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/hw-version.h"
 #include "hw/qdev-properties.h"
 #include "hw/scsi/scsi.h"
 #include "migration/qemu-file-types.h"
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 9c0dc7b9468..3666b8d9468 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -25,6 +25,7 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "qemu/hw-version.h"
 #include "hw/scsi/scsi.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5e1b35ba489..1fe028800fd 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -36,6 +36,7 @@
 #include "qemu-version.h"
 #include "qemu/cutils.h"
 #include "qemu/help_option.h"
+#include "qemu/hw-version.h"
 #include "qemu/uuid.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e6368004..c9954df4a74 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/units.h"
 #include "qemu/cutils.h"
 #include "qemu/qemu-print.h"
+#include "qemu/hw-version.h"
 #include "cpu.h"
 #include "tcg/helper-tcg.h"
 #include "sysemu/reset.h"
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 11e06cc51fa..17ae771939b 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -19,6 +19,7 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/module.h"
+#include "qemu/hw-version.h"
 #include "qemu/qemu-print.h"
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/sysemu.h"
diff --git a/util/osdep.c b/util/osdep.c
index 72b678ca2e3..7c4deda6feb 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -39,6 +39,7 @@ extern int madvise(char *, size_t, int);
 #include "qemu/error-report.h"
 #include "qemu/madvise.h"
 #include "qemu/mprotect.h"
+#include "qemu/hw-version.h"
 #include "monitor/monitor.h"
 
 static bool fips_enabled = false;
-- 
2.25.1


