Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D9843F95B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:04:18 +0200 (CEST)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgNoA-0008C2-0s
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjh-0004HC-C6
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:59:41 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNjf-0004Tq-L3
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:59:41 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 x1-20020a17090a530100b001a1efa4ebe6so7013046pjh.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UToNhrOkdLW/O50mnkSNHsTzkmzprqfEOkoEklS/wLk=;
 b=UgXq1LLep7Pt/jnRmv7myzeiO6SHOk1pHhe0FPEmz6bdzxSi/ZLYcquLpBfl/CJEHP
 cX0pZAjkggjqDsDvq88dDnUSB/WabWTt4CnpUAhNu+Jd7GpnGWGYxD7A+9jnHrlSRwo+
 T5g71w9YzgZsvA+TJBPLyo+ZN4KR+GGo/aPSpof35hyjXahyaY4j9av3W0wSLAecLDzV
 YrrfQbWBJhNxsfR+4RAv8mv6kyf5U++f9pgc8VlU8XVNeH/xpDOBMoXthkdY/AHLKwby
 rsr6H5ECebvot3MEOr37QzzX/2C/xbgeEj32zfM28+bfD//DjO+QyChIfBkuqcVixo3Y
 iVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UToNhrOkdLW/O50mnkSNHsTzkmzprqfEOkoEklS/wLk=;
 b=ICgizecmEIc+u7YdYCP+bz8keob4Ykm+kVjA1yHWLXCtrKWdMx+cDd9rfRW/CdoV3S
 baTrw7Pzn2PKx8z4hU3L7og7/+ejayY8PECOr3HRB1sHmrFvckrl0V3C6aZ5iPg0E9c6
 o+J7Gg7OlPuxTL/ERpECpd0xfIHP9OC2SrkqWgco5zgCN/MhPFV4QDuspE4YsZwC6p+e
 dZTghaOU7/9oT/B20liZD4iR2q1mjahqQQnSdNN1rPs4KV9ZelyjGVADRpDdCKgZqtxi
 ksQQgM2/mW//w2ub0HBoPiLfF/LGyTKxNPnNynkHdz1cZM43W37YijDV9gyJx8xaITE6
 yv5Q==
X-Gm-Message-State: AOAM531mZFAx269ylbdBVouoRjKY9EmBX5p55afhlTBZf49dR3Yy4khV
 1/TGtXnKgfsDHthRJP0DE891+kvN7Hy3S1PX
X-Google-Smtp-Source: ABdhPJyJYW/KsznpyOhpYCOzitpvWNZF17XkfheOFUYcnrYlmPUXlYl0wqYHwIrPkdexNY9l2Sxvyw==
X-Received: by 2002:a17:90a:ba03:: with SMTP id
 s3mr10039543pjr.116.1635497978216; 
 Fri, 29 Oct 2021 01:59:38 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.01.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 01:59:37 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 03/76] target/riscv: rvv-1.0: add mstatus VS field
Date: Fri, 29 Oct 2021 16:58:08 +0800
Message-Id: <20211029085922.255197-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 20 +++++++++++++++++++-
 target/riscv/csr.c        | 12 +++++++++++-
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5ea2004ae02..48b8f612109 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -352,6 +352,7 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
+bool riscv_cpu_vector_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
@@ -395,6 +396,7 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 #define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
+#define TB_FLAGS_MSTATUS_VS MSTATUS_VS
 
 typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 9913fa9f778..72a716c9990 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -375,6 +375,7 @@
 #define MSTATUS_UBE         0x00000040
 #define MSTATUS_MPIE        0x00000080
 #define MSTATUS_SPP         0x00000100
+#define MSTATUS_VS          0x00000600
 #define MSTATUS_MPP         0x00001800
 #define MSTATUS_FS          0x00006000
 #define MSTATUS_XS          0x00018000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f30ff672f8c..5789c2e9690 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -90,12 +90,17 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
 #ifdef CONFIG_USER_ONLY
     flags |= TB_FLAGS_MSTATUS_FS;
+    flags |= TB_FLAGS_MSTATUS_VS;
 #else
     flags |= cpu_mmu_index(env, 0);
     if (riscv_cpu_fp_enabled(env)) {
         flags |= env->mstatus & MSTATUS_FS;
     }
 
+    if (riscv_cpu_vector_enabled(env)) {
+        flags |= env->mstatus & MSTATUS_VS;
+    }
+
     if (riscv_has_ext(env, RVH)) {
         if (env->priv == PRV_M ||
             (env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
@@ -189,11 +194,24 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
     return false;
 }
 
+/* Return true is vector support is currently enabled */
+bool riscv_cpu_vector_enabled(CPURISCVState *env)
+{
+    if (env->mstatus & MSTATUS_VS) {
+        if (riscv_cpu_virt_enabled(env) && !(env->mstatus_hs & MSTATUS_VS)) {
+            return false;
+        }
+        return true;
+    }
+
+    return false;
+}
+
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env)
 {
     uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
-                            MSTATUS64_UXL;
+                            MSTATUS64_UXL | MSTATUS_VS;
     bool current_virt = riscv_cpu_virt_enabled(env);
 
     g_assert(riscv_has_ext(env, RVH));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9f41954894d..9b5bd5d7b49 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -273,6 +273,7 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
 {
 #if !defined(CONFIG_USER_ONLY)
     env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_VS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
     if (vs(env, csrno) >= 0) {
@@ -307,6 +308,9 @@ static RISCVException read_vxrm(CPURISCVState *env, int csrno,
 static RISCVException write_vxrm(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    env->mstatus |= MSTATUS_VS;
+#endif
     env->vxrm = val;
     return RISCV_EXCP_NONE;
 }
@@ -321,6 +325,9 @@ static RISCVException read_vxsat(CPURISCVState *env, int csrno,
 static RISCVException write_vxsat(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    env->mstatus |= MSTATUS_VS;
+#endif
     env->vxsat = val;
     return RISCV_EXCP_NONE;
 }
@@ -335,6 +342,9 @@ static RISCVException read_vstart(CPURISCVState *env, int csrno,
 static RISCVException write_vstart(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    env->mstatus |= MSTATUS_VS;
+#endif
     env->vstart = val;
     return RISCV_EXCP_NONE;
 }
@@ -535,7 +545,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
         MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
-        MSTATUS_TW;
+        MSTATUS_TW | MSTATUS_VS;
 
     if (riscv_cpu_mxl(env) != MXL_RV32) {
         /*
-- 
2.25.1


