Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FDD3B93FD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:32:41 +0200 (CEST)
Received: from localhost ([::1]:54902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyygC-0001jB-GF
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZi-0004Yw-E0
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:58 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZS-00089P-BO
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:58 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 p17-20020a17090b0111b02901723ab8d11fso4171216pjz.1
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TJZF8LWW+S/evT7bkuT0HfWov+1lUwCTXAU5MMH8g9E=;
 b=pqpfExdd9ILT2SiRxYpTlokLdbQMiKqjgAySps1UuI3DN0chCCiv5UAyQ7hAwc1FP+
 mg7z3/JBGh7vgcPgEIHIVUFdmw/maGZxMUsKCun/4BuqnY6k/wNEnvFaCp1AsPJ21gYC
 vhuGSo6aTTPbpOzsIIOvhsJLNBqlverPt1t6YrJunA/4wo4w0khVrGFUxPpCIw/ocdX2
 BCOmxadi78rd4jjiJdk/ZzoEyGfRSErB236oJoagWPkXybt7553JQ0lk+YzXS0ZDl+Ug
 Tkox6wtQfns8e55fxoAnyhKe139i57gt5PqIdNl7aegaC/ApziOlo0pNDdJs7/7X3FSH
 jM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TJZF8LWW+S/evT7bkuT0HfWov+1lUwCTXAU5MMH8g9E=;
 b=e4vcouGJGZbkky92beMp3PXaAABXGCfy/DFh0DtdgdVjKPmuA2p+2+r8NyB58PGGvZ
 PDEP1KkJeHdE0GJVrCJUq03GB+qVhTOZ5C0bjLzFjGbnUlhR0llqL/ImLweAp7LVSpgB
 WZdgrcHLWMrJmFKZmct59waKkoirppjFXUCzk/3Dczg5PS9gsn3GWDqBbzEM/Slx2JQf
 Pkfv9uqWlVosmKhqiPgfTkcNMoJ1q3ZyV4O02/EUA1eiQF57OfNX7AOyyzX3XpbAzjTk
 YfS4ZcOcXAXW92g+YQjQue4fHnBKVxnk5ohek4TP3Dd+BZ2UtF39XgjoHV9tUBp5tK42
 78qg==
X-Gm-Message-State: AOAM53095rK4nPenQyHkxCFYkT8gbsQAZIGPMABoKezsAC66zGO2b4oH
 yRcuiHOrJo8CvX4sciqnUCZX3wYbJncM/w==
X-Google-Smtp-Source: ABdhPJzCFkxWmPi4NHLKJqemSMUQK6hDWGg7w/sZTQvLDfUUlu5AQPX+epeVqbl6ondEOLkw9bi0vg==
X-Received: by 2002:a17:90a:a087:: with SMTP id
 r7mr10756966pjp.84.1625153140620; 
 Thu, 01 Jul 2021 08:25:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/17] accel/tcg: Move tb_lookup to cpu-exec.c
Date: Thu,  1 Jul 2021 08:25:23 -0700
Message-Id: <20210701152537.3330420-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we've moved helper_lookup_tb_ptr, the only user
of tb-lookup.h is cpu-exec.c; merge the contents in.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-lookup.h | 49 -------------------------------------------
 accel/tcg/cpu-exec.c  | 31 ++++++++++++++++++++++++++-
 2 files changed, 30 insertions(+), 50 deletions(-)
 delete mode 100644 accel/tcg/tb-lookup.h

diff --git a/accel/tcg/tb-lookup.h b/accel/tcg/tb-lookup.h
deleted file mode 100644
index 9c9e0079da..0000000000
--- a/accel/tcg/tb-lookup.h
+++ /dev/null
@@ -1,49 +0,0 @@
-/*
- * Copyright (C) 2017, Emilio G. Cota <cota@braap.org>
- *
- * License: GNU GPL, version 2 or later.
- *   See the COPYING file in the top-level directory.
- */
-#ifndef EXEC_TB_LOOKUP_H
-#define EXEC_TB_LOOKUP_H
-
-#ifdef NEED_CPU_H
-#include "cpu.h"
-#else
-#include "exec/poison.h"
-#endif
-
-#include "exec/exec-all.h"
-#include "tb-hash.h"
-
-/* Might cause an exception, so have a longjmp destination ready */
-static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
-                                          target_ulong cs_base,
-                                          uint32_t flags, uint32_t cflags)
-{
-    TranslationBlock *tb;
-    uint32_t hash;
-
-    /* we should never be trying to look up an INVALID tb */
-    tcg_debug_assert(!(cflags & CF_INVALID));
-
-    hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
-
-    if (likely(tb &&
-               tb->pc == pc &&
-               tb->cs_base == cs_base &&
-               tb->flags == flags &&
-               tb->trace_vcpu_dstate == *cpu->trace_dstate &&
-               tb_cflags(tb) == cflags)) {
-        return tb;
-    }
-    tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
-    if (tb == NULL) {
-        return NULL;
-    }
-    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
-    return tb;
-}
-
-#endif /* EXEC_TB_LOOKUP_H */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index fb6668606f..0d92698030 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -40,7 +40,6 @@
 #include "sysemu/replay.h"
 #include "exec/helper-proto.h"
 #include "tb-hash.h"
-#include "tb-lookup.h"
 #include "tb-context.h"
 #include "internal.h"
 
@@ -146,6 +145,36 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
+/* Might cause an exception, so have a longjmp destination ready */
+static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
+                                          target_ulong cs_base,
+                                          uint32_t flags, uint32_t cflags)
+{
+    TranslationBlock *tb;
+    uint32_t hash;
+
+    /* we should never be trying to look up an INVALID tb */
+    tcg_debug_assert(!(cflags & CF_INVALID));
+
+    hash = tb_jmp_cache_hash_func(pc);
+    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
+
+    if (likely(tb &&
+               tb->pc == pc &&
+               tb->cs_base == cs_base &&
+               tb->flags == flags &&
+               tb->trace_vcpu_dstate == *cpu->trace_dstate &&
+               tb_cflags(tb) == cflags)) {
+        return tb;
+    }
+    tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
+    if (tb == NULL) {
+        return NULL;
+    }
+    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
+    return tb;
+}
+
 /**
  * helper_lookup_tb_ptr: quick check for next tb
  * @env: current cpu state
-- 
2.25.1


