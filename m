Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55041B6E9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 21:07:56 +0200 (CEST)
Received: from localhost ([::1]:40528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVISJ-0004GW-CV
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 15:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILX-0003hd-FY; Tue, 28 Sep 2021 15:00:56 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1mVILU-0000wb-WC; Tue, 28 Sep 2021 15:00:55 -0400
Received: by mail-ed1-x532.google.com with SMTP id v18so51374281edc.11;
 Tue, 28 Sep 2021 12:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/DkNwWvxafVKxi7Aow4THFM0b2VzbsJ30VMqID9tAV0=;
 b=j6hwuXNQZ85Fk8VqjgbF/Wgw5XPQEkAeDP1DbApheE+OMYmn524L8LD+1I4Bp549a0
 hIBRMSwquwQJRHWMZRcgzOxr8kg91PoVIeHb+K1tVP1/Oz/0FYxsCk/g/8tpwzYvfuRm
 Mu2xfhl2wmF/awesBvz1OUqqZciE4wUIO0wXDPpjKc4WDqo9nx+/LqO1jWnIw/RUPLta
 /HjbUTOR5My0szOU1M9LZjD7mtMbNuVHO5542kJFNCxgqGCvauSX4c3omlGcMgm3p1Nm
 2njIw4ivWYtO2+CdGMPDne0HKuwvccD9budYFpJpxWvByd4Pl1dJQemiR/Je9KHp5Y9P
 ioog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/DkNwWvxafVKxi7Aow4THFM0b2VzbsJ30VMqID9tAV0=;
 b=OFgZ73IYmIi0466q3Sq+9f0pv4npESgLoXLZnBhmoytmAEKuseDsoBi+54JIP8G+2D
 qs4iSPWUpDMN8NaMpuSb9+/TjzMbUBKP4Dox2G+skEp+V4dhmwMsS2+DyNUwxmKyAXZW
 TBxLOaURycLhNvzB8TKgUkU35OqQDUfx2MWspJU7yN7hbfJikwRerC+iSvI0MrEfiiFV
 BvLyDGfRg7VdT61ssAKQ3mzp31LATbBpVn2NKcCVgZ8VslumyHXMvPcok0gWBuK11ebD
 KiQyQxri1B19cap94bvRsc7pDXfGns+DF0wswCdRNrn4MXMHpz52QKepvb+eF1mdARRh
 m2hQ==
X-Gm-Message-State: AOAM532sQGgALB5ZHQedq1a1aoQp16Sv8l14iB6h8SDb/0dSoezWoug6
 ktIdC71rOX+Dwwgs1euQVvY=
X-Google-Smtp-Source: ABdhPJx7HpNj4+1oi18Yr3K4K2YJfFfph3RmfKM7oznmQF3noqNRFHbqnc/aSPBzpCcr31X7+QUd1Q==
X-Received: by 2002:a17:906:a246:: with SMTP id
 bi6mr8454838ejb.389.1632855650828; 
 Tue, 28 Sep 2021 12:00:50 -0700 (PDT)
Received: from neptune.lab ([46.39.229.233])
 by smtp.googlemail.com with ESMTPSA id f10sm4500330edu.70.2021.09.28.12.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 12:00:50 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Subject: [PATCH v12 3/7] [RISCV_PM] Support CSRs required for RISC-V PM
 extension except for the h-mode
Date: Tue, 28 Sep 2021 22:00:32 +0300
Message-Id: <20210928190036.4114438-4-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
References: <20210928190036.4114438-1-space.monkey.delivers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: baturo.alexey@gmail.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, Bin Meng <bin.meng@windriver.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 space.monkey.delivers@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
---
 target/riscv/cpu.c |   2 +
 target/riscv/cpu.h |  11 ++
 target/riscv/csr.c | 287 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 300 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7c626d89cd..6a95df559d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -370,6 +370,8 @@ static void riscv_cpu_reset(DeviceState *dev)
     env->mcause = 0;
     env->pc = env->resetvec;
     env->two_stage_lookup = false;
+    /* mmte is supposed to have pm.current hardwired to 1 */
+    env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
 #endif
     cs->exception_index = RISCV_EXCP_NONE;
     env->load_res = -1;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index cd86f5422f..c41a937a80 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -238,6 +238,17 @@ struct CPURISCVState {
 
     /* True if in debugger mode.  */
     bool debugger;
+
+    /*
+     * CSRs for PointerMasking extension
+     */
+    target_ulong mmte;
+    target_ulong mpmmask;
+    target_ulong mpmbase;
+    target_ulong spmmask;
+    target_ulong spmbase;
+    target_ulong upmmask;
+    target_ulong upmbase;
 #endif
 
     float_status fp_status;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 23fbbd3216..1bb5475de6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -192,6 +192,16 @@ static RISCVException hmode32(CPURISCVState *env, int csrno)
 
 }
 
+/* Checks if PointerMasking registers could be accessed */
+static RISCVException pointer_masking(CPURISCVState *env, int csrno)
+{
+    /* Check if j-ext is present */
+    if (riscv_has_ext(env, RVJ)) {
+        return RISCV_EXCP_NONE;
+    }
+    return RISCV_EXCP_ILLEGAL_INST;
+}
+
 static RISCVException pmp(CPURISCVState *env, int csrno)
 {
     if (riscv_feature(env, RISCV_FEATURE_PMP)) {
@@ -1401,6 +1411,270 @@ static RISCVException write_pmpaddr(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+/*
+ * Functions to access Pointer Masking feature registers
+ * We have to check if current priv lvl could modify
+ * csr in given mode
+ */
+static bool check_pm_current_disabled(CPURISCVState *env, int csrno)
+{
+    int csr_priv = get_field(csrno, 0x300);
+    int pm_current;
+    int cur_bit_pos;
+
+    /*
+     * If priv lvls differ that means we're accessing csr from higher priv lvl,
+     * so allow the access
+     */
+    if (env->priv != csr_priv) {
+        return false;
+    }
+    switch (env->priv) {
+    case PRV_M:
+        cur_bit_pos = M_PM_CURRENT;
+        break;
+    case PRV_S:
+        cur_bit_pos = S_PM_CURRENT;
+        break;
+    case PRV_U:
+        cur_bit_pos = U_PM_CURRENT;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    pm_current = get_field(env->mmte, cur_bit_pos);
+    /* It's same priv lvl, so we allow to modify csr only if pm.current==1 */
+    return !pm_current;
+}
+
+static RISCVException read_mmte(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val = env->mmte & MMTE_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mmte(CPURISCVState *env, int csrno,
+                                 target_ulong val)
+{
+    uint64_t mstatus;
+    target_ulong wpri_val = val & MMTE_MASK;
+
+    if (val != wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "MMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
+                      val, wpri_val);
+    }
+    /* for machine mode pm.current is hardwired to 1 */
+    wpri_val |= MMTE_M_PM_CURRENT;
+
+    /* hardwiring pm.instruction bit to 0, since it's not supported yet */
+    wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
+    env->mmte = wpri_val | PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_smte(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val = env->mmte & SMTE_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_smte(CPURISCVState *env, int csrno,
+                                 target_ulong val)
+{
+    target_ulong wpri_val = val & SMTE_MASK;
+
+    if (val != wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
+                      val, wpri_val);
+    }
+
+    /* if pm.current==0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    wpri_val |= (env->mmte & ~SMTE_MASK);
+    write_mmte(env, csrno, wpri_val);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_umte(CPURISCVState *env, int csrno,
+                                target_ulong *val)
+{
+    *val = env->mmte & UMTE_MASK;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_umte(CPURISCVState *env, int csrno,
+                                 target_ulong val)
+{
+    target_ulong wpri_val = val & UMTE_MASK;
+
+    if (val != wpri_val) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "UMTE: WPRI violation written 0x%lx vs expected 0x%lx\n",
+                      val, wpri_val);
+    }
+
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+
+    wpri_val |= (env->mmte & ~UMTE_MASK);
+    write_mmte(env, csrno, wpri_val);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_mpmmask(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->mpmmask;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mpmmask(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    env->mpmmask = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_spmmask(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->spmmask;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_spmmask(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current==0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->spmmask = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_upmmask(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->upmmask;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_upmmask(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current==0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->upmmask = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_mpmbase(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->mpmbase;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mpmbase(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    env->mpmbase = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_spmbase(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->spmbase;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_spmbase(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current==0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->spmbase = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_upmbase(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->upmbase;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_upmbase(CPURISCVState *env, int csrno,
+                                    target_ulong val)
+{
+    uint64_t mstatus;
+
+    /* if pm.current==0 we can't modify current PM CSRs */
+    if (check_pm_current_disabled(env, csrno)) {
+        return RISCV_EXCP_NONE;
+    }
+    env->upmbase = val;
+    env->mmte |= PM_EXT_DIRTY;
+
+    /* Set XS and SD bits, since PM CSRs are dirty */
+    mstatus = env->mstatus | MSTATUS_XS;
+    write_mstatus(env, csrno, mstatus);
+    return RISCV_EXCP_NONE;
+}
+
 #endif
 
 /*
@@ -1635,6 +1909,19 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_PMPADDR14] =  { "pmpaddr14", pmp, read_pmpaddr, write_pmpaddr },
     [CSR_PMPADDR15] =  { "pmpaddr15", pmp, read_pmpaddr, write_pmpaddr },
 
+    /* User Pointer Masking */
+    [CSR_UMTE]    =    { "umte",    pointer_masking, read_umte,    write_umte    },
+    [CSR_UPMMASK] =    { "upmmask", pointer_masking, read_upmmask, write_upmmask },
+    [CSR_UPMBASE] =    { "upmbase", pointer_masking, read_upmbase, write_upmbase },
+    /* Machine Pointer Masking */
+    [CSR_MMTE]    =    { "mmte",    pointer_masking, read_mmte,    write_mmte    },
+    [CSR_MPMMASK] =    { "mpmmask", pointer_masking, read_mpmmask, write_mpmmask },
+    [CSR_MPMBASE] =    { "mpmbase", pointer_masking, read_mpmbase, write_mpmbase },
+    /* Supervisor Pointer Masking */
+    [CSR_SMTE]    =    { "smte",    pointer_masking, read_smte,    write_smte    },
+    [CSR_SPMMASK] =    { "spmmask", pointer_masking, read_spmmask, write_spmmask },
+    [CSR_SPMBASE] =    { "spmbase", pointer_masking, read_spmbase, write_spmbase },
+
     /* Performance Counters */
     [CSR_HPMCOUNTER3]    = { "hpmcounter3",    ctr,    read_zero },
     [CSR_HPMCOUNTER4]    = { "hpmcounter4",    ctr,    read_zero },
-- 
2.30.2


