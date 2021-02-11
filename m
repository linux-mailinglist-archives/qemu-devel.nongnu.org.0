Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6169B318C4A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:44:17 +0100 (CET)
Received: from localhost ([::1]:48762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACGW-0003Z8-DH
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZO-0008SY-O8
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:42 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZC-000063-CO
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:42 -0500
Received: by mail-wm1-x32c.google.com with SMTP id i9so5657731wmq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wZUolxBc97njL0lUBedVjqcYfU8uIXWcGrJqQadqG7M=;
 b=IoONwXUwGjSsPuAjYcgychdX4rQmHYitaIMggLllmI04rABdVQ/JUxpI38cQdQTe71
 4ap99bYqnGxp5Fl2SvQT9zomqx0E9UGQkMYkYVqjuSbP+riOSXbK0zJwt6ZXck+plHS7
 qBGm3diggWfhQPkov9l5G/SSwNMO1s+CVTIkzwio5fwwZe0uTUYp0Dx/ECCZpD4sT3kg
 PA8e2DEAjKFSyeJBo8NOViblePHU5NWzjlPvEzfktPZnzp2+2Mjqfi09Ab9C9g3cxZHh
 BM2yby0arozvQW6XuY5ni3Zuh0L4dmr/P6ihQtD7VZJ0RpmPAc0vpUt7hnYpZtdsYpsr
 c+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wZUolxBc97njL0lUBedVjqcYfU8uIXWcGrJqQadqG7M=;
 b=WVTI5rxlw4rqQUBtLPGl6uRHypEqBBgbmYYX/UimxVSXH9BHrojEA9UaTTuJ4XZXmU
 HvapuNIx9/1mvP42ilSlwESvxXGTYvhH6+qPPnlQsCDyvd99WaAo1qFgN2lqcNGB9lEE
 tPoRD0M06OH6WWBAOkzV9qabH44tYGNcxM5nnJx11uN8BqZh8CSarfciB0C1vJgaK2IW
 guMKWOXduNiXga38bPTOHDOFJSC+zdpbPqwnv6VcGjWFv+JvwRA+1NJp4nghIc/sEFym
 NGvLaklLz14qHyD6avra8o2sFjhNYcXMvDjsxPwQeO/2Dm0DNXZqStJ20kegHqQrhT58
 2E8w==
X-Gm-Message-State: AOAM533K9jod3v/lJRVfQWAvARfPFmZbEG/H6g/lAOW6f37vxyXCQSR5
 k0vcbT0kZ1qI6xgLLUaEGPxwuIRmyRz6Ig==
X-Google-Smtp-Source: ABdhPJwzU2unVxIDLEVOjBl5e53MnqDF0FdvY1DevZLVbBdnuzn5jsZMEVPOCnFGcJ0fnys7UiiVQQ==
X-Received: by 2002:a1c:6402:: with SMTP id y2mr4985436wmb.43.1613048369120;
 Thu, 11 Feb 2021 04:59:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/45] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
Date: Thu, 11 Feb 2021 12:58:50 +0000
Message-Id: <20210211125900.22777-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

A proper syndrome is required to fill in the proper si_code.
Use page_get_flags to determine permission vs translation for user-only.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-27-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 24 +++++++++++++++++++++---
 target/arm/tlb_helper.c       | 15 +++++++++------
 2 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 42b9c15f536..4e43906e66a 100644
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
index df85079d9f0..9609333cbdf 100644
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
2.20.1


