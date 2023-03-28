Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DACB6CCDC7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 00:59:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGo-0006vo-3k; Tue, 28 Mar 2023 18:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGl-0006uf-GN
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:23 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGj-00075P-J8
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:23 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so14243993pjt.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kdNM442/mFduh1g9/nonfQEYYKdwqbZiYT+039FpfZE=;
 b=h/7+et9rY4Xzj9XSdbjw2B0hXRBR1JlBBinSXQl33QqVgYPgobV8A/J7nOfut7P8V1
 H53EZ4/xRJVG8eadmqQ2dVXGkfRyW3HwGYd/rAt+Fg65s2FUYq0SCUexgXIGgRVfoanD
 5C2nhlNzqdoJVTMmXWHIrZ9x7XlohmDcfuz8YcXtNwMLCXiKp6f974n1rk9CZJBiRGVb
 wCwZwMIvLmemtF0m900EjmqXjL3R/yDBbLEAO5y4aMz7NGZEd+mPM6cV5qkosnFSKmI+
 EwyLomHh8ke8rejI1+5tZE6mXv8Fcr/Tb96AIlZTFKEz9YK6ASvZ3uQdJTfDHd5A2e5d
 J47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kdNM442/mFduh1g9/nonfQEYYKdwqbZiYT+039FpfZE=;
 b=EaGYD3M9edIyk+59m3ItgYuB+Yr53h7aiSkS+ttDOPd5nfID21ry5jA7dagT0/yVUP
 Z++UwDwD78Irb1mbt4WOEiC9j4GfrcbWiyLXwzpLB78qJxC+FGCCyLCl3pVT/4CIhsBJ
 LwkVoeAHhn0xxeK/gl4WTa3UkmzILt+abTijXZPW4Gq2EtY8aDUL5g8pZGwgGc5cgknY
 P4xxxYL1l9BnU6rfR/p51D1XbKV7xCu9rbomNZO629yP0KIvibiCZFAHH9mLa8ZGw3J3
 VnRacwmkf9bnI1EZAVGcmsK8dif4n+/fmmtmV1NaKXwsJ673I8gaVoGDJs6qOY+jOll8
 5NgA==
X-Gm-Message-State: AAQBX9fC1Ji47S/aV+2PIGUh+bPpw2rNeVfd/f57ZIaUJekft9D5EUyy
 nO0mGL48iSXpa6bzA4uaY8ab4kLu9WkfJMY5Qxg=
X-Google-Smtp-Source: AKy350Z+clzWEdkaO/UVl+GmD+2C3JizfFj7zbTNo9lYPT77w9/PI1+R8hDykrOeOlrPwx/eMMDPWQ==
X-Received: by 2002:a17:902:f1d3:b0:19c:dd49:9bf8 with SMTP id
 e19-20020a170902f1d300b0019cdd499bf8mr122791plc.28.1680044300092; 
 Tue, 28 Mar 2023 15:58:20 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 13/15] softmmu: Restrict cpu_check_watchpoint / address_matches
 to TCG accel
Date: Tue, 28 Mar 2023 15:58:04 -0700
Message-Id: <20230328225806.2278728-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Both cpu_check_watchpoint() and cpu_watchpoint_address_matches()
are specific to TCG system emulation. Declare them in "tcg-cpu-ops.h"
to be sure accessing them from non-TCG code is a compilation error.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230328173117.15226-2-philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h         | 37 ------------------------------
 include/hw/core/tcg-cpu-ops.h | 43 +++++++++++++++++++++++++++++++++++
 target/arm/tcg/mte_helper.c   |  1 +
 target/arm/tcg/sve_helper.c   |  1 +
 target/s390x/tcg/mem_helper.c |  1 +
 5 files changed, 46 insertions(+), 37 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 821e937020..ce312745d5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -970,17 +970,6 @@ static inline void cpu_watchpoint_remove_by_ref(CPUState *cpu,
 static inline void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
 {
 }
-
-static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                                        MemTxAttrs atr, int fl, uintptr_t ra)
-{
-}
-
-static inline int cpu_watchpoint_address_matches(CPUState *cpu,
-                                                 vaddr addr, vaddr len)
-{
-    return 0;
-}
 #else
 int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                           int flags, CPUWatchpoint **watchpoint);
@@ -988,32 +977,6 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
                           vaddr len, int flags);
 void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
 void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
-
-/**
- * cpu_check_watchpoint:
- * @cpu: cpu context
- * @addr: guest virtual address
- * @len: access length
- * @attrs: memory access attributes
- * @flags: watchpoint access type
- * @ra: unwind return address
- *
- * Check for a watchpoint hit in [addr, addr+len) of the type
- * specified by @flags.  Exit via exception with a hit.
- */
-void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                          MemTxAttrs attrs, int flags, uintptr_t ra);
-
-/**
- * cpu_watchpoint_address_matches:
- * @cpu: cpu context
- * @addr: guest virtual address
- * @len: access length
- *
- * Return the watchpoint flags that apply to [addr, addr+len).
- * If no watchpoint is registered for the range, the result is 0.
- */
-int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
 #endif
 
 /**
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 20e3c0ffbb..0ae08df47e 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -175,4 +175,47 @@ struct TCGCPUOps {
 
 };
 
+#if defined(CONFIG_USER_ONLY)
+
+static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                                        MemTxAttrs atr, int fl, uintptr_t ra)
+{
+}
+
+static inline int cpu_watchpoint_address_matches(CPUState *cpu,
+                                                 vaddr addr, vaddr len)
+{
+    return 0;
+}
+
+#else
+
+/**
+ * cpu_check_watchpoint:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ * @attrs: memory access attributes
+ * @flags: watchpoint access type
+ * @ra: unwind return address
+ *
+ * Check for a watchpoint hit in [addr, addr+len) of the type
+ * specified by @flags.  Exit via exception with a hit.
+ */
+void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                          MemTxAttrs attrs, int flags, uintptr_t ra);
+
+/**
+ * cpu_watchpoint_address_matches:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ *
+ * Return the watchpoint flags that apply to [addr, addr+len).
+ * If no watchpoint is registered for the range, the result is 0.
+ */
+int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
+
+#endif
+
 #endif /* TCG_CPU_OPS_H */
diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index fee3c7eb96..a4f3f92bc0 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -25,6 +25,7 @@
 #include "exec/ram_addr.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 9a8951afa4..ccf5e5beca 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -27,6 +27,7 @@
 #include "tcg/tcg.h"
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
+#include "hw/core/tcg-cpu-ops.h"
 
 
 /* Return a value for NZCV as per the ARM PredTest pseudofunction.
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index b93dbd3dad..8b58b8d88d 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -26,6 +26,7 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "hw/core/tcg-cpu-ops.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
 #include "trace.h"
-- 
2.34.1


