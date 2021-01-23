Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359733017F1
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 20:00:01 +0100 (CET)
Received: from localhost ([::1]:48662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3O8e-0007Dv-9Z
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 14:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Nzd-0005IW-9i
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:41 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3Nzb-0008HK-9k
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:41 -0500
Received: by mail-pl1-x62b.google.com with SMTP id t6so5178814plq.1
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w2ogJZM2za2je2RMQYG7Dr+ReH/Y4veEnOKOQS9UGe4=;
 b=m+EOdmZoPA3eICWYfZm1TMpZm/KfhM6x5cUIsxv82lNzKtam6uy405M1rWo6Ts82mb
 1zmdG43W+DB/H8tlp5xUL8JQxeuSv+u91HsE2mf5aFJ1jic8xd0adusRHYpa8TJNetUD
 IjL6KpDsKajMG8LwcK3wrqfK0MjlPtPk9y9HILnpKPGDuVMRnm8dNihn8tC2ZY1Su8w1
 NMNnIOHtYJhgGDk9EaALnDpk0XptFgfXB0IVFXWtwPgtCYpGO4cG4xjfYlQzOeV5NjfN
 VuCTlOVN9TX3kEERHosmv899S7eakF6CmMeGqHoWfm/qGV/Z9kImmN6PN/Y/yNRSG9GK
 gQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w2ogJZM2za2je2RMQYG7Dr+ReH/Y4veEnOKOQS9UGe4=;
 b=sx0jIUIlb6of6tCicF0mu5NabNSfOmoFSaBS3sMymXezlnCWdFQt/xA8WBf3fFfcjV
 KJrTab+d7eBwDVIEbuWsVDBPR/ikZs38+9+WMOtzpGr2jx+IBoC5wNphkRg/vBJ3oFfT
 P9cYg+lPF0dyHPyvkrDou+EkTww9Cmd/WLZbC7krmcJnKWXThH2MrByX0RsGRMJWKJvc
 MpZHtVwcKjafjoXdxFdsZ7G/0UvSgbrHlYI798Fk3yZGwDHXc6lvkw1t1rHq6IB2hEE0
 CoFX0z2aN7HALl6guuDM2QuCIiimlVGAbtDjsJ4SGV+WKT89Yd/geYEHCchd7HApOkWS
 2xiA==
X-Gm-Message-State: AOAM531oE/midlPmHXQj9MrxXsGtF8X9Kfau5/TloZap0NOIAEhvql8/
 MbyRAbgswId/m1VX+kzPqj/jzSLID5TIyg==
X-Google-Smtp-Source: ABdhPJzwJtjA+HsyAaDuTnfLRczKSpssHKVf16t8mHesdgEZM59VVM0k+qPcJ6+04lZQI9UC740Big==
X-Received: by 2002:a17:902:8503:b029:dc:44f:62d8 with SMTP id
 bj3-20020a1709028503b02900dc044f62d8mr987366plb.34.1611427835769; 
 Sat, 23 Jan 2021 10:50:35 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j19sm5018614pfn.14.2021.01.23.10.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:50:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] accel/tcg: Restrict tb_gen_code() from other accelerators
Date: Sat, 23 Jan 2021 08:50:17 -1000
Message-Id: <20210123185020.1766324-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123185020.1766324-1-richard.henderson@linaro.org>
References: <20210123185020.1766324-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

tb_gen_code() is only called within TCG accelerator, declare it locally.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210117164813.4101761-4-f4bug@amsat.org>
[rth: Adjust vs changed tb_flush_jmp_cache patch.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      | 18 ++++++++++++++++++
 include/exec/exec-all.h   |  5 -----
 accel/tcg/cpu-exec.c      |  1 +
 accel/tcg/translate-all.c |  1 +
 4 files changed, 20 insertions(+), 5 deletions(-)
 create mode 100644 accel/tcg/internal.h

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
new file mode 100644
index 0000000000..06b341fceb
--- /dev/null
+++ b/accel/tcg/internal.h
@@ -0,0 +1,18 @@
+/*
+ * Internal execution defines for qemu
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef ACCEL_TCG_INTERNAL_H
+#define ACCEL_TCG_INTERNAL_H
+
+#include "exec/exec-all.h"
+
+TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
+                              target_ulong cs_base, uint32_t flags,
+                              int cflags);
+
+#endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 1e3e7cf8e7..3acc7c2943 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -64,11 +64,6 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
 
 void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
 void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
-TranslationBlock *tb_gen_code(CPUState *cpu,
-                              target_ulong pc, target_ulong cs_base,
-                              uint32_t flags,
-                              int cflags);
-
 void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
 void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
 void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8053aa3f11..37d17c8e88 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -41,6 +41,7 @@
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
+#include "internal.h"
 
 /* -icount align implementation. */
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 5bd0e267c8..73fef47148 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -60,6 +60,7 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
+#include "internal.h"
 
 /* #define DEBUG_TB_INVALIDATE */
 /* #define DEBUG_TB_FLUSH */
-- 
2.25.1


