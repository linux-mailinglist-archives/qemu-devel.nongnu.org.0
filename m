Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837F33923C3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:29:04 +0200 (CEST)
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3tX-0006bl-LZ
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3Ff-00068R-2p
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:56 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FU-0004e6-Ov
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:50 -0400
Received: by mail-pf1-x431.google.com with SMTP id y15so2194350pfn.13
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KggNdH/EFsJ3T1kmCx5Td3eZBoTdhzd36Y4s4qQekSU=;
 b=arbrUCu7Zshk+oAH4EDP9DYGwWaQV9VYDzeVS/oA3sK9I35yEhihDSJ66nG8KRDPyf
 9UMICYeDBLbckwpHxFdtOLX2foVeAy60VrM5YGvNc/iVsIv1wqlhWd03OnPDceU/RgS9
 r0EcGE5oLVGQLtq2Ud7Z/oKFkqqV6A6PgOAcitt4VSGkxZFYj2agDYk2XCUiAy2N7klj
 c4EcEBkzAVPdLLntTDn+s7QX2F4Aql/70IPJzi3cJv1FRaM9cVcHjIaEjvxO2/c/2HNQ
 r9jB2sfLfeEFYnFDpcpSwOsULsuxbgvzxgYGtT8RkDr9PR7mJjWTlwTFgVkrZUAYDitu
 jbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KggNdH/EFsJ3T1kmCx5Td3eZBoTdhzd36Y4s4qQekSU=;
 b=IDu0HBCMnLfjxvvlBq9IF0CYGkvGoK1xV3MgcGCR0BuFe59zGAicms4MYUEz8QI1Vp
 UDP4JBPFYrzF2O0qU4pRkvCea5vSRJ6barJffhY8a92F4ymo17eiM1wLjwA+QE/mCqIS
 YsenTnTQYtB1je1XDt2hWLS4SgeJw1U+ppsRYnKbZLuOAxTmnm1q9mlCV7cv8ifdSLIP
 UHesObKMN12dXt/C0ce1O5aXgi4QAW9B4Y/g8rkPNy9f73kIkW5F/nOyaNFERqbViTzJ
 LziFycYzAJJLVpZd+TBBeKnUSrVLymmYIE+96W4/CZ9z4Q4Q9+Goo2QpkbqH3w/efk5H
 LqbA==
X-Gm-Message-State: AOAM533LQOt2HoJ26jopHAifnLNHJVNDmU8h4kIOs2BDmbXYlCfPMDCr
 eoeT7os30VVyoaXniSOKE+G4U5GaJoHkzw==
X-Google-Smtp-Source: ABdhPJwbwiuzl7D4AKAOPf94JPcuC4GUOWGVqyJYs9M1xOlHGAAoQG34D5QA2ZC4Enou4PeU1tt9kQ==
X-Received: by 2002:aa7:9a8e:0:b029:2e7:e3fd:4fa4 with SMTP id
 w14-20020aa79a8e0000b02902e7e3fd4fa4mr923249pfi.63.1622072856793; 
 Wed, 26 May 2021 16:47:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/31] target/mips: Fold jazz behaviour into
 mips_cpu_do_transaction_failed
Date: Wed, 26 May 2021 16:47:09 -0700
Message-Id: <20210526234710.125396-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Add a flag to MIPSCPUClass in order to avoid needing to
replace mips_tcg_ops.do_transaction_failed.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20210227232519.222663-2-richard.henderson@linaro.org>
---
 target/mips/cpu-qom.h       |  3 +++
 hw/mips/jazz.c              | 35 +++--------------------------------
 target/mips/tcg/op_helper.c |  3 ++-
 3 files changed, 8 insertions(+), 33 deletions(-)

diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index 826ab13019..dda0c911fa 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -47,6 +47,9 @@ struct MIPSCPUClass {
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
     const struct mips_def_t *cpu_def;
+
+    /* Used for the jazz board to modify mips_cpu_do_transaction_failed. */
+    bool no_data_aborts;
 };
 
 
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index dba2088ed1..1e1cf8154e 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -119,30 +119,6 @@ static const MemoryRegionOps dma_dummy_ops = {
 #define MAGNUM_BIOS_SIZE                                                       \
         (BIOS_SIZE < MAGNUM_BIOS_SIZE_MAX ? BIOS_SIZE : MAGNUM_BIOS_SIZE_MAX)
 
-#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
-static void (*real_do_transaction_failed)(CPUState *cpu, hwaddr physaddr,
-                                          vaddr addr, unsigned size,
-                                          MMUAccessType access_type,
-                                          int mmu_idx, MemTxAttrs attrs,
-                                          MemTxResult response,
-                                          uintptr_t retaddr);
-
-static void mips_jazz_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-                                            vaddr addr, unsigned size,
-                                            MMUAccessType access_type,
-                                            int mmu_idx, MemTxAttrs attrs,
-                                            MemTxResult response,
-                                            uintptr_t retaddr)
-{
-    if (access_type != MMU_INST_FETCH) {
-        /* ignore invalid access (ie do not raise exception) */
-        return;
-    }
-    (*real_do_transaction_failed)(cs, physaddr, addr, size, access_type,
-                                  mmu_idx, attrs, response, retaddr);
-}
-#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
-
 static void mips_jazz_init(MachineState *machine,
                            enum jazz_model_e jazz_model)
 {
@@ -151,7 +127,7 @@ static void mips_jazz_init(MachineState *machine,
     int bios_size, n;
     Clock *cpuclk;
     MIPSCPU *cpu;
-    CPUClass *cc;
+    MIPSCPUClass *mcc;
     CPUMIPSState *env;
     qemu_irq *i8259;
     rc4030_dma *dmas;
@@ -198,8 +174,6 @@ static void mips_jazz_init(MachineState *machine,
      * However, we can't simply add a global memory region to catch
      * everything, as this would make all accesses including instruction
      * accesses be ignored and not raise exceptions.
-     * So instead we hijack the do_transaction_failed method on the CPU, and
-     * do not raise exceptions for data access.
      *
      * NOTE: this behaviour of raising exceptions for bad instruction
      * fetches but not bad data accesses was added in commit 54e755588cf1e9
@@ -209,11 +183,8 @@ static void mips_jazz_init(MachineState *machine,
      * we could replace this hijacking of CPU methods with a simple global
      * memory region that catches all memory accesses, as we do on Malta.
      */
-    cc = CPU_GET_CLASS(cpu);
-#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
-    real_do_transaction_failed = cc->tcg_ops->do_transaction_failed;
-    cc->tcg_ops->do_transaction_failed = mips_jazz_do_transaction_failed;
-#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
+    mcc = MIPS_CPU_GET_CLASS(cpu);
+    mcc->no_data_aborts = true;
 
     /* allocate RAM */
     memory_region_add_subregion(address_space, 0, machine->ram);
diff --git a/target/mips/tcg/op_helper.c b/target/mips/tcg/op_helper.c
index ce1549c985..fafbf1faca 100644
--- a/target/mips/tcg/op_helper.c
+++ b/target/mips/tcg/op_helper.c
@@ -409,11 +409,12 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     MemTxResult response, uintptr_t retaddr)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
+    MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(cpu);
     CPUMIPSState *env = &cpu->env;
 
     if (access_type == MMU_INST_FETCH) {
         do_raise_exception(env, EXCP_IBE, retaddr);
-    } else {
+    } else if (!mcc->no_data_aborts) {
         do_raise_exception(env, EXCP_DBE, retaddr);
     }
 }
-- 
2.25.1


