Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFFA63D745
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:54:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NWu-0004oc-5a; Wed, 30 Nov 2022 08:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NWq-0004m7-83
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:53:36 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NWl-0003dY-Fr
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:53:35 -0500
Received: by mail-wr1-x432.google.com with SMTP id w15so13998288wrl.9
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d2D8gJ+u9rseKSVrwYnsWFuYWA6EcjaA0owyEfm4plA=;
 b=CWevHTtwLkk3ujn5/M50yn4UCM4w0Rna3JRUWm7pyqGr5o+HM4XziNLjDYAzbtK9GK
 D1ZrHfwhAd4V0Hy5jyFn5p0IeQvumH3Bw9IDnGXgjGmNLz4/UFMCedfsDjsNFSuXCD5S
 5bEF8TlozJwkfVZEPlF+4ST8CKkocHVEB+9h4lEvJmqakXo2bgC1qyQ14OYOLRKCAjcu
 ixJAWf3JtW2x0X/Ld6vFO3L24oFRz7RnhwRmKWSF6adL2u3RwkQPdyiGZtFdMR+634Wd
 sts4t+QQy821JKef208+3flN7RoBJwAMYWZdwSGYLPmoyyaBX+w9YORevMSwYbFQRnJd
 xOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d2D8gJ+u9rseKSVrwYnsWFuYWA6EcjaA0owyEfm4plA=;
 b=NNOd4Mmc4sf92EAybua1O4f0ps9TSa1LWhIwFkMWAu5CyKba0ob+gckvbhMDZlcLgC
 l0A+xl/g+ZlZNto910sd/wGqdRNyw05ITv3h3IoEpisA2AYCa61YDUb5o2J9tRTJMHRR
 9YDgxe7YKYr87LGzWF0OVII2mpry7AdbTWjuZNkwZOgYnBTzGSTy0/R3W+/E2n/m4REF
 ZTZCDRA8du99mC7N5u4lNXVlwqyefwWhWBhtf/+fbjCdxK2CW2+Xs6KdwzQunNdSniY9
 XKfueLqtgqKj5h1TLZA0ik69u/27K5emkLYbO5rI/PMWZWgDNmLCTTWSsYF+14N4sywG
 OQZA==
X-Gm-Message-State: ANoB5pmNTcEtE5yPHO18ySqiwmWRLo1WkhhZj89I1iYpFW9GyeQ+WFd9
 spIsj4k8Owu2cdklaW+Ob+3iDZmaUwVh/FUl
X-Google-Smtp-Source: AA0mqf6OD69mcXcrZXq2FQy9mwEXfDwUO1sfJDSCK71qUz2xI+8mSKcdnFOlx20Xl6S195YOxiMzBA==
X-Received: by 2002:adf:f7c8:0:b0:236:720a:e391 with SMTP id
 a8-20020adff7c8000000b00236720ae391mr30615553wrq.368.1669816384585; 
 Wed, 30 Nov 2022 05:53:04 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a5d5543000000b0022cc0a2cbecsm1689153wrw.15.2022.11.30.05.53.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:53:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH-for-8.0 4/5] cpu: Move cpu_abort() to common code
Date: Wed, 30 Nov 2022 14:52:40 +0100
Message-Id: <20221130135241.85060-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130135241.85060-1-philmd@linaro.org>
References: <20221130135241.85060-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

This code is not target-specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu.c         | 38 --------------------------------------
 cpus-common.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/cpu.c b/cpu.c
index 385e72e140..d6936a536b 100644
--- a/cpu.c
+++ b/cpu.c
@@ -31,11 +31,9 @@
 #endif
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
-#include "sysemu/replay.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
 #include "exec/translate-all.h"
-#include "exec/log.h"
 #include "hw/core/accel-cpu.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
@@ -270,42 +268,6 @@ void cpu_single_step(CPUState *cpu, int enabled)
     }
 }
 
-void cpu_abort(CPUState *cpu, const char *fmt, ...)
-{
-    va_list ap;
-    va_list ap2;
-
-    va_start(ap, fmt);
-    va_copy(ap2, ap);
-    fprintf(stderr, "qemu: fatal: ");
-    vfprintf(stderr, fmt, ap);
-    fprintf(stderr, "\n");
-    cpu_dump_state(cpu, stderr, CPU_DUMP_FPU | CPU_DUMP_CCOP);
-    if (qemu_log_separate()) {
-        FILE *logfile = qemu_log_trylock();
-        if (logfile) {
-            fprintf(logfile, "qemu: fatal: ");
-            vfprintf(logfile, fmt, ap2);
-            fprintf(logfile, "\n");
-            cpu_dump_state(cpu, logfile, CPU_DUMP_FPU | CPU_DUMP_CCOP);
-            qemu_log_unlock(logfile);
-        }
-    }
-    va_end(ap2);
-    va_end(ap);
-    replay_finish();
-#if defined(CONFIG_USER_ONLY)
-    {
-        struct sigaction act;
-        sigfillset(&act.sa_mask);
-        act.sa_handler = SIG_DFL;
-        act.sa_flags = 0;
-        sigaction(SIGABRT, &act, NULL);
-    }
-#endif
-    abort();
-}
-
 /* physical memory access (slow version, mainly for debug) */
 #if defined(CONFIG_USER_ONLY)
 int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
diff --git a/cpus-common.c b/cpus-common.c
index 8fdb34740e..38af2ab840 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -21,9 +21,11 @@
 #include "qemu/main-loop.h"
 #include "exec/cpu-common.h"
 #include "exec/memory.h"
+#include "exec/log.h"
 #include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
 #include "sysemu/cpus.h"
+#include "sysemu/replay.h"
 #include "qemu/lockable.h"
 #include "trace/trace-root.h"
 
@@ -485,3 +487,39 @@ void cpu_breakpoint_remove_all(CPUState *cpu, int mask)
         }
     }
 }
+
+void cpu_abort(CPUState *cpu, const char *fmt, ...)
+{
+    va_list ap;
+    va_list ap2;
+
+    va_start(ap, fmt);
+    va_copy(ap2, ap);
+    fprintf(stderr, "qemu: fatal: ");
+    vfprintf(stderr, fmt, ap);
+    fprintf(stderr, "\n");
+    cpu_dump_state(cpu, stderr, CPU_DUMP_FPU | CPU_DUMP_CCOP);
+    if (qemu_log_separate()) {
+        FILE *logfile = qemu_log_trylock();
+        if (logfile) {
+            fprintf(logfile, "qemu: fatal: ");
+            vfprintf(logfile, fmt, ap2);
+            fprintf(logfile, "\n");
+            cpu_dump_state(cpu, logfile, CPU_DUMP_FPU | CPU_DUMP_CCOP);
+            qemu_log_unlock(logfile);
+        }
+    }
+    va_end(ap2);
+    va_end(ap);
+    replay_finish();
+#if defined(CONFIG_USER_ONLY)
+    {
+        struct sigaction act;
+        sigfillset(&act.sa_mask);
+        act.sa_handler = SIG_DFL;
+        act.sa_flags = 0;
+        sigaction(SIGABRT, &act, NULL);
+    }
+#endif
+    abort();
+}
-- 
2.38.1


