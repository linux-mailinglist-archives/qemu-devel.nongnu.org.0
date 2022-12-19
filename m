Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FD66510F1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:09:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Jct-0001VO-PO; Mon, 19 Dec 2022 12:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Jcr-0001RW-Dm
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:08:29 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Jcp-0008EH-EW
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:08:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id bg10so6927419wmb.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWmFA2W38I7w2kRnI6UYlXE2qkCTQg0mxTJlq43TbYg=;
 b=GP5AdSYgmSETsrJsGabHdLBtnNDfXNRvR9hpT4b3pBvTvAiQ4XHALEZVSy85iOECvz
 Mqcf3FzK7FqTrF4U6Hon5LgAf9rKKpFLQCkNbWdIfJeLsyYIwjpWMt3hROtGoLXuWjvM
 SGhLfGeKIBITlwRvG82BXfSdNUJ48sbqvkkNnAwqxPXTifh0K0Sqjh1GmfMOisheGp4N
 hbi8uU2aok5EoFVm9W1Vkx9FP9h9uJKkX/szRMTXLnD0o9Nhpab4MWMBGlYpjdWs2Apy
 RWP9TzrsiJdtx4ziVkubJq+yKdVLnVGOZ+azJ0yffAwCa6IQZVHSeJStDssOBMLJxN86
 GGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nWmFA2W38I7w2kRnI6UYlXE2qkCTQg0mxTJlq43TbYg=;
 b=HARy7AandWNMjIRX6dgGbF7+u/YGkwaPZfTnYj4mrpN2Pzgm84unKDF8IV6xHqyzBT
 89mEZrQt+yi5aMdQu5gHWbqceGQhKpELtNY01mgcyl8///CfRfMWrBYok6mArkhGZjzM
 jnw7V97EpS6/Mrv05mlPJjiqMWT/RmMLluUwzTKZZS5FnbN+4a2UoUhvwep8aoNCvWW3
 3sPuuNRDPnankt2DKyubnfOjNHUBqO9JhRhZZGHSVNXNQwkpQ2z9uWmYVetIztMKXgaK
 wah6dX4oK1CJUl25w4l60uJe6+Y/FY8FWfLBtZazvI/lmCvvRUoXrOsZhVn80i3BmzI9
 YssA==
X-Gm-Message-State: ANoB5pkNIj/yG5jw03ywjoUXYG6E74J7WNamdkHiHF1pBOUh0ydP0Pw/
 U2og82Us11rbC4v+gnMVKVqGAgQuAXeQz852+BI=
X-Google-Smtp-Source: AA0mqf7Z08Mw8fMzcG4uBZ7AhIOedUd3JO5iYSMG75RI36S2tXc55pdzTVFwowmCLp00ITdeYrmaYQ==
X-Received: by 2002:a1c:f216:0:b0:3cf:87c6:890e with SMTP id
 s22-20020a1cf216000000b003cf87c6890emr34905826wmc.27.1671469705898; 
 Mon, 19 Dec 2022 09:08:25 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a05600c221300b003a3170a7af9sm12882818wml.4.2022.12.19.09.08.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 09:08:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH 3/5] accel/tcg: Restrict 'qapi-commands-machine.h' to system
 emulation
Date: Mon, 19 Dec 2022 18:08:04 +0100
Message-Id: <20221219170806.60580-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219170806.60580-1-philmd@linaro.org>
References: <20221219170806.60580-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Rename 'hmp.c' as 'monitor.c' and move the QMP functions from
cpu-exec.c (which is always compiled) to monitor.c (which is only
compiled when system-emulation is selected).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cpu-exec.c  |  88 +----------------------------------
 accel/tcg/hmp.c       |  14 ------
 accel/tcg/internal.h  |   3 ++
 accel/tcg/meson.build |   2 +-
 accel/tcg/monitor.c   | 105 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 111 insertions(+), 101 deletions(-)
 delete mode 100644 accel/tcg/hmp.c
 create mode 100644 accel/tcg/monitor.c

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 298149ed07..5a7825dce1 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -20,7 +20,6 @@
 #include "qemu/osdep.h"
 #include "qemu/qemu-print.h"
 #include "qapi/error.h"
-#include "qapi/qapi-commands-machine.h"
 #include "qapi/type-helpers.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "trace.h"
@@ -64,8 +63,8 @@ typedef struct SyncClocks {
 #define MAX_DELAY_PRINT_RATE 2000000000LL
 #define MAX_NB_PRINTS 100
 
-static int64_t max_delay;
-static int64_t max_advance;
+int64_t max_delay;
+int64_t max_advance;
 
 static void align_clocks(SyncClocks *sc, CPUState *cpu)
 {
@@ -1071,86 +1070,3 @@ void tcg_exec_unrealizefn(CPUState *cpu)
     tlb_destroy(cpu);
     g_free(cpu->tb_jmp_cache);
 }
-
-#ifndef CONFIG_USER_ONLY
-
-static void dump_drift_info(GString *buf)
-{
-    if (!icount_enabled()) {
-        return;
-    }
-
-    g_string_append_printf(buf, "Host - Guest clock  %"PRIi64" ms\n",
-                           (cpu_get_clock() - icount_get()) / SCALE_MS);
-    if (icount_align_option) {
-        g_string_append_printf(buf, "Max guest delay     %"PRIi64" ms\n",
-                               -max_delay / SCALE_MS);
-        g_string_append_printf(buf, "Max guest advance   %"PRIi64" ms\n",
-                               max_advance / SCALE_MS);
-    } else {
-        g_string_append_printf(buf, "Max guest delay     NA\n");
-        g_string_append_printf(buf, "Max guest advance   NA\n");
-    }
-}
-
-HumanReadableText *qmp_x_query_jit(Error **errp)
-{
-    g_autoptr(GString) buf = g_string_new("");
-
-    if (!tcg_enabled()) {
-        error_setg(errp, "JIT information is only available with accel=tcg");
-        return NULL;
-    }
-
-    dump_exec_info(buf);
-    dump_drift_info(buf);
-
-    return human_readable_text_from_str(buf);
-}
-
-HumanReadableText *qmp_x_query_opcount(Error **errp)
-{
-    g_autoptr(GString) buf = g_string_new("");
-
-    if (!tcg_enabled()) {
-        error_setg(errp, "Opcode count information is only available with accel=tcg");
-        return NULL;
-    }
-
-    tcg_dump_op_count(buf);
-
-    return human_readable_text_from_str(buf);
-}
-
-#ifdef CONFIG_PROFILER
-
-int64_t dev_time;
-
-HumanReadableText *qmp_x_query_profile(Error **errp)
-{
-    g_autoptr(GString) buf = g_string_new("");
-    static int64_t last_cpu_exec_time;
-    int64_t cpu_exec_time;
-    int64_t delta;
-
-    cpu_exec_time = tcg_cpu_exec_time();
-    delta = cpu_exec_time - last_cpu_exec_time;
-
-    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
-                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
-    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
-                           delta, delta / (double)NANOSECONDS_PER_SECOND);
-    last_cpu_exec_time = cpu_exec_time;
-    dev_time = 0;
-
-    return human_readable_text_from_str(buf);
-}
-#else
-HumanReadableText *qmp_x_query_profile(Error **errp)
-{
-    error_setg(errp, "Internal profiler not compiled");
-    return NULL;
-}
-#endif
-
-#endif /* !CONFIG_USER_ONLY */
diff --git a/accel/tcg/hmp.c b/accel/tcg/hmp.c
deleted file mode 100644
index bb67941420..0000000000
--- a/accel/tcg/hmp.c
+++ /dev/null
@@ -1,14 +0,0 @@
-#include "qemu/osdep.h"
-#include "qemu/error-report.h"
-#include "qapi/error.h"
-#include "qapi/qapi-commands-machine.h"
-#include "exec/exec-all.h"
-#include "monitor/monitor.h"
-
-static void hmp_tcg_register(void)
-{
-    monitor_register_hmp_info_hrt("jit", qmp_x_query_jit);
-    monitor_register_hmp_info_hrt("opcount", qmp_x_query_opcount);
-}
-
-type_init(hmp_tcg_register);
diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 6edff16fb0..130d7fd564 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -64,4 +64,7 @@ static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
 #endif
 }
 
+extern int64_t max_delay;
+extern int64_t max_advance;
+
 #endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 75e1dffb4d..d645c38112 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -16,7 +16,7 @@ specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
   'cputlb.c',
-  'hmp.c',
+  'monitor.c',
 ))
 
 tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
new file mode 100644
index 0000000000..4d01c0a825
--- /dev/null
+++ b/accel/tcg/monitor.c
@@ -0,0 +1,105 @@
+/*
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ *
+ *  QEMU TCG monitor
+ *
+ *  Copyright (c) 2003-2005 Fabrice Bellard
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/type-helpers.h"
+#include "qapi/qapi-commands-machine.h"
+#include "monitor/monitor.h"
+#include "sysemu/cpus.h"
+#include "sysemu/cpu-timers.h"
+#include "sysemu/tcg.h"
+#include "internal.h"
+
+
+static void dump_drift_info(GString *buf)
+{
+    if (!icount_enabled()) {
+        return;
+    }
+
+    g_string_append_printf(buf, "Host - Guest clock  %"PRIi64" ms\n",
+                           (cpu_get_clock() - icount_get()) / SCALE_MS);
+    if (icount_align_option) {
+        g_string_append_printf(buf, "Max guest delay     %"PRIi64" ms\n",
+                               -max_delay / SCALE_MS);
+        g_string_append_printf(buf, "Max guest advance   %"PRIi64" ms\n",
+                               max_advance / SCALE_MS);
+    } else {
+        g_string_append_printf(buf, "Max guest delay     NA\n");
+        g_string_append_printf(buf, "Max guest advance   NA\n");
+    }
+}
+
+HumanReadableText *qmp_x_query_jit(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+
+    if (!tcg_enabled()) {
+        error_setg(errp, "JIT information is only available with accel=tcg");
+        return NULL;
+    }
+
+    dump_exec_info(buf);
+    dump_drift_info(buf);
+
+    return human_readable_text_from_str(buf);
+}
+
+HumanReadableText *qmp_x_query_opcount(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+
+    if (!tcg_enabled()) {
+        error_setg(errp, "Opcode count information is only available with accel=tcg");
+        return NULL;
+    }
+
+    tcg_dump_op_count(buf);
+
+    return human_readable_text_from_str(buf);
+}
+
+#ifdef CONFIG_PROFILER
+
+int64_t dev_time;
+
+HumanReadableText *qmp_x_query_profile(Error **errp)
+{
+    g_autoptr(GString) buf = g_string_new("");
+    static int64_t last_cpu_exec_time;
+    int64_t cpu_exec_time;
+    int64_t delta;
+
+    cpu_exec_time = tcg_cpu_exec_time();
+    delta = cpu_exec_time - last_cpu_exec_time;
+
+    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
+                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
+    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
+                           delta, delta / (double)NANOSECONDS_PER_SECOND);
+    last_cpu_exec_time = cpu_exec_time;
+    dev_time = 0;
+
+    return human_readable_text_from_str(buf);
+}
+#else
+HumanReadableText *qmp_x_query_profile(Error **errp)
+{
+    error_setg(errp, "Internal profiler not compiled");
+    return NULL;
+}
+#endif
+
+static void hmp_tcg_register(void)
+{
+    monitor_register_hmp_info_hrt("jit", qmp_x_query_jit);
+    monitor_register_hmp_info_hrt("opcount", qmp_x_query_opcount);
+}
+
+type_init(hmp_tcg_register);
-- 
2.38.1


