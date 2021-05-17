Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531A3382BC7
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:08:26 +0200 (CEST)
Received: from localhost ([::1]:47820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lic2r-00076a-Cp
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libra-0005EH-MS
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:46 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1librV-0003JW-4T
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:46 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q5so6093420wrs.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sd+8rlQTZ1aQWmKwzm10sDs8kTu4DF8a2ZaQBsZHL+s=;
 b=Ef65eCcW+UYXksgChEGOj7hbYMyBJyAD0mcVItG0bhbFrVCDWE6FJxqYPn9NQBtfQB
 aDvaN3AFxquafO9h5zyoFm7F9H3i4AhJ4HVZrz9ypjLPcPKnA6dfXPiRuZrVLuifeFZ8
 cvpS83M38CKWHzipB7ns7t1svqI3jbMbifJjA3Du77akusC3lR2WUXQ6XOAB8+O2TUHK
 auFqH8huq0gFksLNTHrJaVS9POX/ZRoaa9EnicNBuqgaAu8cnrEwDiu3eLFeu8zd5fmC
 /0Rcak/mkpWlq7frlfqatsSLxdhHmsSyQr51p/YpkLqRgX4F7VPPxvPcIUDqf0bWyTr8
 +l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sd+8rlQTZ1aQWmKwzm10sDs8kTu4DF8a2ZaQBsZHL+s=;
 b=aEDdHA8vy19M/CS3qW+siXBtf87dnl9e4lwr/BZPY5am5FndboJXJHe3NPxMa1xiXv
 p307A5Wx0TNJOINcfLz8tyMDK9LXskOtf+/wPONVcU1nvAG7rzMwAi+1wUZwwopXUm96
 vz6u27PHNKygBYQZaLOOO9x1lMCVNtI/AywRx+sBhVK9rU4uljkB43j5G1Z5K+1E2I9D
 b5R7IMJkGJY22SM3+cNn/6s0wvilmYBG7mBnCnJTFYey8gsAhRQWefJxrrN8IV89YFny
 QGn9Dke/6ATatUEm2PySVKPov4+SCRSLctFUSCoUPG9jzELOPgtqh56I14ulSu/l+qPG
 Ekbg==
X-Gm-Message-State: AOAM530aQJOF2rS+WnyiySDZeuSKQjf48pVH4bEY5kqlz9YkyORQFlgU
 f+hLb3iybNdLz1vy1/kEf3x37mkN9I8UnQ==
X-Google-Smtp-Source: ABdhPJwQyaKdsUaWI3uJSHGdeYnG2iypDW3Iu9cqX48JnACSPkGTMnx1Fsl7uu4Qr6wgpAOXL3RE4w==
X-Received: by 2002:adf:df8d:: with SMTP id z13mr30592907wrl.267.1621252599559; 
 Mon, 17 May 2021 04:56:39 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id z66sm22158561wmc.4.2021.05.17.04.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:56:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 14/15] softmmu/cpus: Extract QMP command handlers to
 cpus-qmp.c
Date: Mon, 17 May 2021 13:55:24 +0200
Message-Id: <20210517115525.1088693-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qmp_memsave() and qmp_pmemsave() call cpu_memory_rw_debug()
and cpu_physical_memory_read(), which are target specific
prototypes. To be able to build softmmu/cpus.c once for
all targets, extract the QMP commands handlers to a new
file which will be built per target.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus-qmp.c  | 115 ++++++++++++++++++++++++++++++++++++++++++++
 softmmu/cpus.c      |  89 ----------------------------------
 softmmu/meson.build |   1 +
 3 files changed, 116 insertions(+), 89 deletions(-)
 create mode 100644 softmmu/cpus-qmp.c

diff --git a/softmmu/cpus-qmp.c b/softmmu/cpus-qmp.c
new file mode 100644
index 00000000000..7b613028225
--- /dev/null
+++ b/softmmu/cpus-qmp.c
@@ -0,0 +1,115 @@
+/*
+ * QEMU System Emulator
+ *
+ * Copyright (c) 2003-2008 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/exec-all.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qapi-commands-machine.h"
+#include "monitor/monitor.h"
+#include "hw/nmi.h"
+
+void qmp_memsave(int64_t addr, int64_t size, const char *filename,
+                 bool has_cpu, int64_t cpu_index, Error **errp)
+{
+    FILE *f;
+    uint32_t l;
+    CPUState *cpu;
+    uint8_t buf[1024];
+    int64_t orig_addr = addr, orig_size = size;
+
+    if (!has_cpu) {
+        cpu_index = 0;
+    }
+
+    cpu = qemu_get_cpu(cpu_index);
+    if (cpu == NULL) {
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cpu-index",
+                   "a CPU number");
+        return;
+    }
+
+    f = fopen(filename, "wb");
+    if (!f) {
+        error_setg_file_open(errp, errno, filename);
+        return;
+    }
+
+    while (size != 0) {
+        l = sizeof(buf);
+        if (l > size) {
+            l = size;
+        }
+        if (cpu_memory_rw_debug(cpu, addr, buf, l, 0) != 0) {
+            error_setg(errp, "Invalid addr 0x%016" PRIx64 "/size %" PRId64
+                             " specified", orig_addr, orig_size);
+            goto exit;
+        }
+        if (fwrite(buf, 1, l, f) != l) {
+            error_setg(errp, QERR_IO_ERROR);
+            goto exit;
+        }
+        addr += l;
+        size -= l;
+    }
+
+exit:
+    fclose(f);
+}
+
+void qmp_pmemsave(int64_t addr, int64_t size, const char *filename,
+                  Error **errp)
+{
+    FILE *f;
+    uint32_t l;
+    uint8_t buf[1024];
+
+    f = fopen(filename, "wb");
+    if (!f) {
+        error_setg_file_open(errp, errno, filename);
+        return;
+    }
+
+    while (size != 0) {
+        l = sizeof(buf);
+        if (l > size) {
+            l = size;
+        }
+        cpu_physical_memory_read(addr, buf, l);
+        if (fwrite(buf, 1, l, f) != l) {
+            error_setg(errp, QERR_IO_ERROR);
+            goto exit;
+        }
+        addr += l;
+        size -= l;
+    }
+
+exit:
+    fclose(f);
+}
+
+void qmp_inject_nmi(Error **errp)
+{
+    nmi_monitor_handle(monitor_get_cpu_index(monitor_cur()), errp);
+}
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index a7ee431187a..e3810135166 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -24,20 +24,14 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
-#include "monitor/monitor.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-machine.h"
-#include "qapi/qapi-commands-misc.h"
 #include "qapi/qapi-events-run-state.h"
-#include "qapi/qmp/qerror.h"
 #include "exec/gdbstub.h"
 #include "sysemu/hw_accel.h"
-#include "exec/exec-all.h"
 #include "qemu/thread.h"
 #include "qemu/plugin.h"
 #include "sysemu/cpus.h"
 #include "qemu/guest-random.h"
-#include "hw/nmi.h"
 #include "sysemu/replay.h"
 #include "sysemu/runstate.h"
 #include "sysemu/cpu-timers.h"
@@ -720,86 +714,3 @@ void list_cpus(const char *optarg)
     cpu_list();
 #endif
 }
-
-void qmp_memsave(int64_t addr, int64_t size, const char *filename,
-                 bool has_cpu, int64_t cpu_index, Error **errp)
-{
-    FILE *f;
-    uint32_t l;
-    CPUState *cpu;
-    uint8_t buf[1024];
-    int64_t orig_addr = addr, orig_size = size;
-
-    if (!has_cpu) {
-        cpu_index = 0;
-    }
-
-    cpu = qemu_get_cpu(cpu_index);
-    if (cpu == NULL) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cpu-index",
-                   "a CPU number");
-        return;
-    }
-
-    f = fopen(filename, "wb");
-    if (!f) {
-        error_setg_file_open(errp, errno, filename);
-        return;
-    }
-
-    while (size != 0) {
-        l = sizeof(buf);
-        if (l > size)
-            l = size;
-        if (cpu_memory_rw_debug(cpu, addr, buf, l, 0) != 0) {
-            error_setg(errp, "Invalid addr 0x%016" PRIx64 "/size %" PRId64
-                             " specified", orig_addr, orig_size);
-            goto exit;
-        }
-        if (fwrite(buf, 1, l, f) != l) {
-            error_setg(errp, QERR_IO_ERROR);
-            goto exit;
-        }
-        addr += l;
-        size -= l;
-    }
-
-exit:
-    fclose(f);
-}
-
-void qmp_pmemsave(int64_t addr, int64_t size, const char *filename,
-                  Error **errp)
-{
-    FILE *f;
-    uint32_t l;
-    uint8_t buf[1024];
-
-    f = fopen(filename, "wb");
-    if (!f) {
-        error_setg_file_open(errp, errno, filename);
-        return;
-    }
-
-    while (size != 0) {
-        l = sizeof(buf);
-        if (l > size)
-            l = size;
-        cpu_physical_memory_read(addr, buf, l);
-        if (fwrite(buf, 1, l, f) != l) {
-            error_setg(errp, QERR_IO_ERROR);
-            goto exit;
-        }
-        addr += l;
-        size -= l;
-    }
-
-exit:
-    fclose(f);
-}
-
-void qmp_inject_nmi(Error **errp)
-{
-    nmi_monitor_handle(monitor_get_cpu_index(monitor_cur()), errp);
-}
-
diff --git a/softmmu/meson.build b/softmmu/meson.build
index d8e03018abf..5e578b20e6c 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -2,6 +2,7 @@
   'arch_init.c',
   'balloon.c',
   'cpus.c',
+  'cpus-qmp.c',
   'cpu-throttle.c',
   'datadir.c',
   'globals.c',
-- 
2.26.3


