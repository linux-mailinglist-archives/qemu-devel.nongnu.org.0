Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125E4BD8EE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:08:12 +0100 (CET)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5c3-0003Lx-Bk
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:08:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zo-0000Dr-DM
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:42 -0500
Received: from [2a00:1450:4864:20::436] (port=35606
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-00013F-6S
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:37 -0500
Received: by mail-wr1-x436.google.com with SMTP id v12so25926500wrv.2
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r8blyhj+o1PQzGuFaBU48Q/kv60nhZW403nGA4koXMo=;
 b=Pts+hHiMut9F//bV4m7Dchoe/4aQYfRgh0eBVKL8NT/Tz866ktkAYF7UTbivfd1NFj
 ppzXdSqie5YskpXOcw9aQfJw1vyZARPoCofpuboN2QG+IQfDoL+febR+RMhOsFenhqOz
 Ha7/Qi2sxfyQ7DQ8B0vh1kt58pmSjaWY8JvymnKgqbWSajt5nxUHdBcrlY2LEhdWa0We
 doMAokznKEK5pM+PdJt0qlm+D1VVZbQBnYo4AGNzKl7qK35ybQNha5l8nQd/p1aPfStZ
 yQ5KKnw0CvROSOyETcEfQu9B1P0NMrid18pnBzmUYD1w5x1aOlAkqxtj70DlCRQaiPwC
 s4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8blyhj+o1PQzGuFaBU48Q/kv60nhZW403nGA4koXMo=;
 b=ickkpmqELzS2XYXiZecNMJX/vT5O9fkauNpwBpReObX17lXeB/sYqkemkmhRn2huu6
 2JZ97fEXYdV/tHGkNN6H29+qM7B9FCCeglvCnfwuHQnP515XuE+mU17rzRnS5GZqX4YM
 UeOFB+JgmnlDMFW+jcrp8brSYrL8wysNL8j1xgO4nYO9NNYQ10aRsVkZ1c2s/z+tchNs
 YGa70Y7Hnf9ZT9iO4VkZ0xZ+0VnjjV2V8NiB3gNPUpsiYAlIgrMJSyfPmIvJMTElUJYr
 Qq0i3Hj5Ptup4pgpziYI1DZd8AlMUozR8X6h5C+qsB0UITgkleanaEi1sYRHFvnPxoR8
 HylA==
X-Gm-Message-State: AOAM531PXg5Pk36DewTAlwTBSgyAvEPCGR+J/rCMDD2wp1Oe2OtDTBZd
 nwpWW4bRJExSzr/Mc3RBBW4DB2KZvp88WQ==
X-Google-Smtp-Source: ABdhPJwA2VfJ2Et23AFGpxgCzMFYUxyN4ecVX/CW6nYstHoBVAamtD8/KBnbnjZUILJizX1Ry0HowQ==
X-Received: by 2002:adf:f68d:0:b0:1e1:db49:a721 with SMTP id
 v13-20020adff68d000000b001e1db49a721mr15101706wrp.297.1645435698684; 
 Mon, 21 Feb 2022 01:28:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/26] include: Move hardware version declarations to new
 qemu/hw-version.h
Date: Mon, 21 Feb 2022 09:27:54 +0000
Message-Id: <20220221092800.404870-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220208200856.3558249-6-peter.maydell@linaro.org
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
index 61808edc69f..7bcce3bceb0 100644
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
index 5181f86b82f..723cdcb004f 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -40,6 +40,7 @@ extern int madvise(char *, size_t, int);
 #include "qemu/error-report.h"
 #include "qemu/madvise.h"
 #include "qemu/mprotect.h"
+#include "qemu/hw-version.h"
 #include "monitor/monitor.h"
 
 static bool fips_enabled = false;
-- 
2.25.1


