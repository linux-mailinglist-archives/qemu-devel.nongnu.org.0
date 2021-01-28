Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2A43081A5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 00:03:17 +0100 (CET)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GJl-0000sB-Mw
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 18:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzh-0005r9-Hb
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:29 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:44300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzT-0008D1-VD
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:29 -0500
Received: by mail-pl1-x62b.google.com with SMTP id j11so1567727plt.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwvKJTzKdnYj9oOM3633KBBYzXxSt9lSc02L89Z+ers=;
 b=khozQ29PPFCHefYejhG2vCblf0hXQozIw4y0A1NL0fVE7fYzuL0xEm6PguNlMV0Urf
 qP19wZ+GhbigbEOIe1t1u64MIzfIWEzJAIchwbmlUWJpHfzSLK7J92n9cI9tXiviN8KB
 /FmvQEhQRCAcETLrdPA8N2qz7VUGNI4JLzpdM+Pr7syLXfATZ/Gath0hg6lGszW5p7uY
 YOlqzVyCihl79kDJSxhziRuMlqLEBAjXwV7s3B54v2Pb6hv9Pfnh7RH0hwSp1b9mpptJ
 jU2pI0BPJyKeoF+wqsGrTRs9sfXCNQ1R1doq+NQ0SMv0AOtXHuGd72NYps2qAhJMBrsI
 xyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwvKJTzKdnYj9oOM3633KBBYzXxSt9lSc02L89Z+ers=;
 b=Ho6r6HW/X5kqFIvAfiqwL+gnem9kJlSFfAZm0nnrk5kAJpBHg9CW0Xld3JdYRm/6jc
 izRDS515geO2sYuQYnEm1tjTszkDUHVusjcs3HQXHBzvZhw1DuNqwd/wLQZJQR73ZZpo
 2agVgDitv/T8EBnE2WYKez/Y8uWCynTphukPL5XKyKfoH00Aov73we2B3Xa1d7GQRlnj
 UElQRBuMxbORf0vEqjIzOEFDCnfGfy/CX3ZsuJz0Zatl6m3H/8cXkkpLN41pCigyAFgi
 eQLg1GY82DE+SSIIks6xRlUMyyfNbaZFxxkymzyck5qLpO7Hdf7KWN09jf/A7m51XfHG
 VqfA==
X-Gm-Message-State: AOAM532r40YoSGkTzNWa0DGcraDERJoFfxzkkpYD5ILjTzfXCEU0Ao+g
 1Rj/21vSoYY9fSQC+wZB0uuIi3s6h8he4OWw
X-Google-Smtp-Source: ABdhPJy9Hz4E1DU24UjAwg2qX5XLdYbnyfAVVTVqAe3dXbTCI3hHtHJECciAFdK7yBB4OPjU4y8Yug==
X-Received: by 2002:a17:902:9007:b029:df:f347:3cc3 with SMTP id
 a7-20020a1709029007b02900dff3473cc3mr1500700plp.41.1611873734393; 
 Thu, 28 Jan 2021 14:42:14 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/23] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
Date: Thu, 28 Jan 2021 12:41:36 -1000
Message-Id: <20210128224141.638790-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A proper syndrome is required to fill in the proper si_code.
Use page_get_flags to determine permission vs translation for user-only.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Use syndrome.h, arm_deliver_fault.
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


