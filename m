Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0742F8914
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 00:03:05 +0100 (CET)
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Y7U-0000Gu-LW
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 18:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsJ-0003nM-KF
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:23 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:47068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsC-0005HF-4N
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:23 -0500
Received: by mail-pf1-x42c.google.com with SMTP id w2so6387161pfc.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ag2kKkF2C6qi/FIsLVctK/0CDxQoX8dZZ8rQ2H49Ggg=;
 b=RMZ8WirJTLlQAkxfN7eeHO/oagdgYHAAbW6NEu+iTKJ76HXJ89l0L+Oruiil3w0L6o
 6uFT0xML2KItKLRleptMbWNVd2Q6fFlbPiiz7/bcTtV64YD2gQUqW26ucALoa37oAlAg
 CD2JAZxA3od2hCxjVkaWKEGt/Rb5JBXwbms6zfDMpNYNYPaJIF5MZkdGHDzWTDvfETpw
 0MJ/FIm3AZdjjoZWHn3DlAgi89IEOSN/H3kdS925nP0HiDWcz5GI0BHKl+dc47cUhtA+
 nzZ/+IlH81aF8aBoAOOksmo5k0lEyfVLhNPxU9BuwbVTpmidYWUEGv/zRnOumIW2tXX+
 rojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ag2kKkF2C6qi/FIsLVctK/0CDxQoX8dZZ8rQ2H49Ggg=;
 b=e4ePCjl/tdA9W7nUV5U5b8xeZA23z2qoKwAAZ1ct0K7qIfrJg7ltToNMkypdytufQL
 /+L3c61MjsOJL2D+LoLOCe9ijscvoAiqMkXNsF2AQmalj1WmQxMMofAQHz1SuZP6P9r7
 bKHHdRkZ3PkomMFV6m7l3OCQHhUQ40aVvbAtL0SQuL1RHHFVIFQMyCg0A/aLc84QHwRa
 oUMOUoTicvrANK0NaoiA2uCUHSGSa2HydRoA6RNee6/OO7JMYpJxbtV+Efd2oNwwH0cq
 OkU+M+ZWRSFbTe8P+xZ0PNnNvtxm1LkdLKOmGfqwFw3BfPC2iW0E2IwhbOq7HekQ1vrV
 ljxg==
X-Gm-Message-State: AOAM533rKb4fBZA2GIoubN+SUQzW1kCsPUjeaBVZW5NJ06teN8clEoyH
 ShGUQQoA2GKnGpxUenLcQFJqUViL8JpvAY/K
X-Google-Smtp-Source: ABdhPJywB2cx8PPDH52lHqX7oPN8cbRCZQm2hK5rCFT5isUvNFb+bVbfShVughr0HhtEar2UuMNm7Q==
X-Received: by 2002:a62:3386:0:b029:1ae:8580:99da with SMTP id
 z128-20020a6233860000b02901ae858099damr14821902pfz.61.1610750834718; 
 Fri, 15 Jan 2021 14:47:14 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/21] linux-user/aarch64: Pass syndrome to EXC_*_ABORT
Date: Fri, 15 Jan 2021 12:46:40 -1000
Message-Id: <20210115224645.1196742-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
index bbe9fefca8..7811440c68 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "qemu/guest-random.h"
+#include "target/arm/syndrome.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -75,7 +76,7 @@
 void cpu_loop(CPUARMState *env)
 {
     CPUState *cs = env_cpu(env);
-    int trapnr;
+    int trapnr, ec, fsc;
     abi_long ret;
     target_siginfo_t info;
 
@@ -116,9 +117,26 @@ void cpu_loop(CPUARMState *env)
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
index b35dc8a011..31015749fd 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -151,21 +151,24 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
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


