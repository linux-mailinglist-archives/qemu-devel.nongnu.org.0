Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AE92D5A12
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:14:28 +0100 (CET)
Received: from localhost ([::1]:38882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKq1-0002KC-LA
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:14:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKRA-0001kC-P1
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:44 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKR2-00079S-Hu
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:44 -0500
Received: by mail-wm1-x335.google.com with SMTP id a3so4988956wmb.5
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jq/Nxsg8TpCNavQIVD6Yyy7eznP6/KgHKTR5ueVPo7E=;
 b=AQioI0Kr0Xu0P61rD6yQjFBIATrpSqa+jDmzfWhDT0If4kOrarBeCK4IYmqDKy16eV
 ojGl8MBT8dTesdJNTaM1V43H5n61z72aCPqOdhXBy+c+81oZT02ogIR0zEOnm1kw4z30
 L32p50+WUIsVzCAMv2OPJI64kn4hvsOnNpFDn46TDDyD0+70e+Oqqe/919jqaWgXDa9C
 luyqQatP1wn0+6gG46pFE67eXOnDvbCUrfZvajfwkgNv0bmbhq6R09YeYl3V6nY2ekBf
 raXU/51P6TQiJWOeNil3OMPvNfHPeXarvueQSjpl5hUT4zxe/VajF9qTxLcGJGfy4TS4
 PIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jq/Nxsg8TpCNavQIVD6Yyy7eznP6/KgHKTR5ueVPo7E=;
 b=UITUtO3pxo5NsDNv8G/J0YEpGaKqGNsMR/31bpFN0m1HrXp3wdKdZH4gY7YLqZ4ydJ
 jTDg6lXGretjf7FEBBqZSo2rKhpDSV+/jD2fYqM84g3d8rUbsch+JQ04qASIf2sFZZU8
 Ado65OmNjPDx+4xEyTtE7IznNiMakiQBqPzEDxZrV/14ua2iSBs0V3rykvIUYvqDPSiL
 JBKGrpZPyhAKLXDjr1OE9FvI+C8YQSJyekjBjqLnuQ5+M+WWvL5oKc4xfe/3jyz8vsB/
 pqT0evSFcHDL4zf7Di01seByRWjzKDmpBIlOMXaZh8xRDfZ1oWewX/G35yeA/cYfeKZ2
 U+jw==
X-Gm-Message-State: AOAM531BuM/Gd04PEss4KWM1FMhdZvCA2LZBBmp27YuicwHbc1AmuoRv
 zN1KF3qVxavOFu9yW4e308caQCBtBXQ4nA==
X-Google-Smtp-Source: ABdhPJyd5c/Ao6C/IBJWtvesqEy7kKOUBZTPGqKG31/P6TfdlOvQY0QXCWbIPtYfXU19Zq0nVQ0D5Q==
X-Received: by 2002:a1c:6506:: with SMTP id z6mr7754594wmb.55.1607600914757;
 Thu, 10 Dec 2020 03:48:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/36] target/arm: Implement CCR_S.TRD behaviour for SG insns
Date: Thu, 10 Dec 2020 11:47:52 +0000
Message-Id: <20201210114756.16501-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

v8.1M introduces a new TRD flag in the CCR register, which enables
checking for stack frame integrity signatures on SG instructions.
Add the code in the SG insn implementation for the new behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201119215617.29887-24-peter.maydell@linaro.org
---
 target/arm/m_helper.c | 86 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 0bdd3cc10e9..643dcafb83d 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1999,6 +1999,64 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     return true;
 }
 
+static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
+                                   uint32_t addr, uint32_t *spdata)
+{
+    /*
+     * Read a word of data from the stack for the SG instruction,
+     * writing the value into *spdata. If the load succeeds, return
+     * true; otherwise pend an appropriate exception and return false.
+     * (We can't use data load helpers here that throw an exception
+     * because of the context we're called in, which is halfway through
+     * arm_v7m_cpu_do_interrupt().)
+     */
+    CPUState *cs = CPU(cpu);
+    CPUARMState *env = &cpu->env;
+    MemTxAttrs attrs = {};
+    MemTxResult txres;
+    target_ulong page_size;
+    hwaddr physaddr;
+    int prot;
+    ARMMMUFaultInfo fi = {};
+    ARMCacheAttrs cacheattrs = {};
+    uint32_t value;
+
+    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &physaddr,
+                      &attrs, &prot, &page_size, &fi, &cacheattrs)) {
+        /* MPU/SAU lookup failed */
+        if (fi.type == ARMFault_QEMU_SFault) {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...SecureFault during stack word read\n");
+            env->v7m.sfsr |= R_V7M_SFSR_AUVIOL_MASK | R_V7M_SFSR_SFARVALID_MASK;
+            env->v7m.sfar = addr;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+        } else {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...MemManageFault during stack word read\n");
+            env->v7m.cfsr[M_REG_S] |= R_V7M_CFSR_DACCVIOL_MASK |
+                R_V7M_CFSR_MMARVALID_MASK;
+            env->v7m.mmfar[M_REG_S] = addr;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, false);
+        }
+        return false;
+    }
+    value = address_space_ldl(arm_addressspace(cs, attrs), physaddr,
+                              attrs, &txres);
+    if (txres != MEMTX_OK) {
+        /* BusFault trying to read the data */
+        qemu_log_mask(CPU_LOG_INT,
+                      "...BusFault during stack word read\n");
+        env->v7m.cfsr[M_REG_NS] |=
+            (R_V7M_CFSR_PRECISERR_MASK | R_V7M_CFSR_BFARVALID_MASK);
+        env->v7m.bfar = addr;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
+        return false;
+    }
+
+    *spdata = value;
+    return true;
+}
+
 static bool v7m_handle_execute_nsc(ARMCPU *cpu)
 {
     /*
@@ -2055,6 +2113,34 @@ static bool v7m_handle_execute_nsc(ARMCPU *cpu)
      */
     qemu_log_mask(CPU_LOG_INT, "...really an SG instruction at 0x%08" PRIx32
                   ", executing it\n", env->regs[15]);
+
+    if (cpu_isar_feature(aa32_m_sec_state, cpu) &&
+        !arm_v7m_is_handler_mode(env)) {
+        /*
+         * v8.1M exception stack frame integrity check. Note that we
+         * must perform the memory access even if CCR_S.TRD is zero
+         * and we aren't going to check what the data loaded is.
+         */
+        uint32_t spdata, sp;
+
+        /*
+         * We know we are currently NS, so the S stack pointers must be
+         * in other_ss_{psp,msp}, not in regs[13]/other_sp.
+         */
+        sp = v7m_using_psp(env) ? env->v7m.other_ss_psp : env->v7m.other_ss_msp;
+        if (!v7m_read_sg_stack_word(cpu, mmu_idx, sp, &spdata)) {
+            /* Stack access failed and an exception has been pended */
+            return false;
+        }
+
+        if (env->v7m.ccr[M_REG_S] & R_V7M_CCR_TRD_MASK) {
+            if (((spdata & ~1) == 0xfefa125a) ||
+                !(env->v7m.control[M_REG_S] & 1)) {
+                goto gen_invep;
+            }
+        }
+    }
+
     env->regs[14] &= ~1;
     env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_SFPA_MASK;
     switch_v7m_security_state(env, true);
-- 
2.20.1


