Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF5D31A57D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:36:35 +0100 (CET)
Received: from localhost ([::1]:54812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAeF0-00081Y-Gh
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVh-00028y-MB
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:45 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVa-0007td-UH
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:45 -0500
Received: by mail-pg1-x535.google.com with SMTP id t25so260566pga.2
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+5hZcB3mFjnWG5tCYVBAVH8vDfhhkDYHCqbXJC4msCo=;
 b=GtQ9tGDzfX//z1tZrGnr4M0HenudlN48lmOguoujGKTgVc19m1m/SlpvKBoqqCiXI5
 KXcZCGgpi4GXncaAz9CtnsAQr5G6f9JUAST+PhvBZhm6cSZITDTjvIdrgsySaSCQUZUm
 4UXrwSU2llZkj7W2K2DpC4qPo59mRfuCoODbcLafDpDPc4R1aWGPgZoMvWA/9/uZHpiA
 WBoCEYMs3mFJJAbo1jx06/yicE4bH8x+IZKnKzH7gEhEEe807zilzPiP8x7T+yEvZv5W
 qoOekpX0zHDRByFoqO8T5eGjbU4KRMCZ4kWFnOjy7EjBOINUuCVShdYPPrxZvD4wjizy
 9w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+5hZcB3mFjnWG5tCYVBAVH8vDfhhkDYHCqbXJC4msCo=;
 b=oesnK6KjvkUgjcYR8FCBci9rHaJ1UpSWtWkBm2RFLj3e86dLq03EwP+XMjbI8C67Ud
 edtFgQdmj/ZcGt+n4Y/AyOXeLpc1S10WijoKxcBE/vEH5MololMIZgJv51Gi8cy8PJOQ
 36ejVPjlU+0C7qUFKoCzSLasXhNwPjUVzDTLYQfSz6FES1eZiwW6L0zX1miSurOrEubJ
 LPQOTa08pL2HOIzUPrZTozwgMLZmgb0M482BNiKSuT4oi0BL0g+AbnDS2LIUAEhUBEMd
 szJdOo1ZceLIvzA+J8H752QJ2kw3znpt9NZyZF5X2LbKcN2UUcw6oWUzPnr1ism4l4/q
 odlA==
X-Gm-Message-State: AOAM531j+HXH9tvRPrls5SM0lq2K+Kzus7ukBvp1/8OO1pLAuTGnL5Ml
 y6ItSX2/BdhU221hNBeA9e1LtSHKOFKqvg==
X-Google-Smtp-Source: ABdhPJylgiitpXfKFUDtCLIuq31oCAEu+ppN2vIbgdolvj7a8WSWzfB9AL35G0nATFyJGgkyqdT1tQ==
X-Received: by 2002:a63:1611:: with SMTP id w17mr4431324pgl.330.1613155776661; 
 Fri, 12 Feb 2021 10:49:36 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 26/31] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
Date: Fri, 12 Feb 2021 10:48:57 -0800
Message-Id: <20210212184902.1251044-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A proper syndrome is required to fill in the proper si_code.
Use page_get_flags to determine permission vs translation for user-only.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 24 +++++++++++++++++++++---
 target/arm/tlb_helper.c       | 15 +++++++++------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 42b9c15f53..4e43906e66 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -23,6 +23,7 @@
 #include "cpu_loop-common.h"
 #include "qemu/guest-random.h"
 #include "hw/semihosting/common-semi.h"
+#include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -76,7 +77,7 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
+    int trapnr, ec, fsc;
     abi_long ret;
     target_siginfo_t info;
 
@@ -117,9 +118,26 @@ void cpu_loop(CPUARMState *env)
         case EXCP_DATA_ABORT:
             info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
-            /* XXX: check env->error_code */
-            info.si_code = TARGET_SEGV_MAPERR;
             info._sifields._sigfault._addr = env->exception.vaddress;
+
+            /* We should only arrive here with EC in {DATAABORT, INSNABORT}. */
+            ec = syn_get_ec(env->exception.syndrome);
+            assert(ec == EC_DATAABORT || ec == EC_INSNABORT);
+
+            /* Both EC have the same format for FSC, or close enough. */
+            fsc = extract32(env->exception.syndrome, 0, 6);
+            switch (fsc) {
+            case 0x04 ... 0x07: /* Translation fault, level {0-3} */
+                info.si_code = TARGET_SEGV_MAPERR;
+                break;
+            case 0x09 ... 0x0b: /* Access flag fault, level {1-3} */
+            case 0x0d ... 0x0f: /* Permission fault, level {1-3} */
+                info.si_code = TARGET_SEGV_ACCERR;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_DEBUG:
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index df85079d9f..9609333cbd 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -154,21 +154,24 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       bool probe, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
 
 #ifdef CONFIG_USER_ONLY
-    cpu->env.exception.vaddress = address;
-    if (access_type == MMU_INST_FETCH) {
-        cs->exception_index = EXCP_PREFETCH_ABORT;
+    int flags = page_get_flags(useronly_clean_ptr(address));
+    if (flags & PAGE_VALID) {
+        fi.type = ARMFault_Permission;
     } else {
-        cs->exception_index = EXCP_DATA_ABORT;
+        fi.type = ARMFault_Translation;
     }
-    cpu_loop_exit_restore(cs, retaddr);
+
+    /* now we have a real cpu fault */
+    cpu_restore_state(cs, retaddr, true);
+    arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
 #else
     hwaddr phys_addr;
     target_ulong page_size;
     int prot, ret;
     MemTxAttrs attrs = {};
-    ARMMMUFaultInfo fi = {};
     ARMCacheAttrs cacheattrs = {};
 
     /*
-- 
2.25.1


