Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1305642EA97
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:52:34 +0200 (CEST)
Received: from localhost ([::1]:37934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbI13-0005h0-3y
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHve-0005G1-11
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:46:58 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvb-0001vQ-Cm
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:46:57 -0400
Received: by mail-pf1-x42a.google.com with SMTP id c29so7710449pfp.2
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imMzEwzffguYBUQ7qDMj320171gAfM6afLGbzmWEZeA=;
 b=NN7b7D/OOlPhP5/KWXh7duUu/fj2Ez5lh7Mq4cmSbtMhLCKgj9gfpwT+q7TjFBMyfN
 GoqOtvYC1osW5h24ejHfiX98uTcDkMk8r4Uv3/NB4JA4IaCJHClhXfMRLCEbvPuMrqHi
 pKUf6WqSTXcgT4jyxK3rwGl4mzh7VvvrZwdxXX6AVRGUrzdYUz3k7tgHWU16lyykNWXo
 zGLsrX3vVzFJbK7Is9P0tdNOvUigGrHmTIeHSkkJQVHr4xuWKK0qrxD5ZH23GEvvBjgZ
 EYQGGHe85b4nSGBRJRmCbcU+gotz0rjt7MZS7Pr9+fot/M7PKM2vfw0SH2wZgXIayUN1
 jGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imMzEwzffguYBUQ7qDMj320171gAfM6afLGbzmWEZeA=;
 b=6e8NpnRYXhzl6I+MbZDCLdyCaN65p7NRctlTomtKfog4F2zcF7ZNun58F6cOcGtah8
 3GNM3WS5tYUpNokcUMi/BUW5vBwGsQnI3NhGiCK95SQWDq5XbHOfHGNy1VDivE6Rp4rG
 2b2QXOHkTw76mglOASayVdPrg+VpBSjKCdm6MFJ6vCpvZQJPPCVAibkWuL9iKzh+3rH+
 ZA9bK4D+6Yh2S0YOghZYIaTg9drLMb2vs5Z05ZCsy8RnCV+NtGOZh48jo8jKhSCET7qi
 I4zcb8U/XGMYcIqYNGHYQrk2gMzHSPtMERvMFpGTPPcbv3BQJLqLefdeb4QJTwwtmQYf
 utCA==
X-Gm-Message-State: AOAM531+mfUXrY5YdqipZTQfwrIKC6/ksecKWavNyamDko8988MRFakb
 uD/8NOTLxTOzvrLjYwEtJ0NELOElZdE5vOBv
X-Google-Smtp-Source: ABdhPJzkoUzkthMrHJkffol3IHhdHXToQG0IoThP9YedIONnEEpnIhhLSNpqa1dhNcNlRtDlwG+W+A==
X-Received: by 2002:a62:ea04:0:b0:44c:7370:e6d8 with SMTP id
 t4-20020a62ea04000000b0044c7370e6d8mr10345849pfh.18.1634284011971; 
 Fri, 15 Oct 2021 00:46:51 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:46:51 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 04/78] target/riscv: rvv-1.0: add mstatus VS field
Date: Fri, 15 Oct 2021 15:45:05 +0800
Message-Id: <20211015074627.3957162-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
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
 target/riscv/cpu.h        |  7 +++++++
 target/riscv/cpu_bits.h   |  1 +
 target/riscv/cpu_helper.c | 15 ++++++++++++++-
 target/riscv/csr.c        | 25 ++++++++++++++++++++++++-
 4 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8ded9da5623..b951e39602c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -338,6 +338,7 @@ int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_fp_enabled(CPURISCVState *env);
+bool riscv_cpu_vector_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_force_hs_excep_enabled(CPURISCVState *env);
@@ -383,6 +384,7 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
 #define TB_FLAGS_PRIV_MMU_MASK                3
 #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
 #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
+#define TB_FLAGS_MSTATUS_VS MSTATUS_VS
 
 typedef CPURISCVState CPUArchState;
 typedef RISCVCPU ArchCPU;
@@ -439,6 +441,7 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
 
 #ifdef CONFIG_USER_ONLY
     flags |= TB_FLAGS_MSTATUS_FS;
+    flags |= TB_FLAGS_MSTATUS_VS;
 #else
     flags |= cpu_mmu_index(env, 0);
     if (riscv_cpu_fp_enabled(env)) {
@@ -456,6 +459,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_FS,
                            get_field(env->mstatus_hs, MSTATUS_FS));
     }
+
+    if (riscv_cpu_vector_enabled(env)) {
+        flags |= env->mstatus & MSTATUS_VS;
+    }
 #endif
 
     *pflags = flags;
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 999187a9ee2..8c2fd35d2ef 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -343,6 +343,7 @@
 #define MSTATUS_UBE         0x00000040
 #define MSTATUS_MPIE        0x00000080
 #define MSTATUS_SPP         0x00000100
+#define MSTATUS_VS          0x00000600
 #define MSTATUS_MPP         0x00001800
 #define MSTATUS_FS          0x00006000
 #define MSTATUS_XS          0x00018000
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d41d5cd27c1..fedde9ea0de 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -104,12 +104,25 @@ bool riscv_cpu_fp_enabled(CPURISCVState *env)
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
     uint64_t sd = riscv_cpu_is_32bit(env) ? MSTATUS32_SD : MSTATUS64_SD;
     uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
                             MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
-                            MSTATUS64_UXL | sd;
+                            MSTATUS64_UXL | MSTATUS_VS | sd;
     bool current_virt = riscv_cpu_virt_enabled(env);
 
     g_assert(riscv_has_ext(env, RVH));
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 23fbbd32162..cc0131d7962 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -263,6 +263,7 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
 {
 #if !defined(CONFIG_USER_ONLY)
     env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_VS;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
     if (vs(env, csrno) >= 0) {
@@ -297,6 +298,13 @@ static RISCVException read_vxrm(CPURISCVState *env, int csrno,
 static RISCVException write_vxrm(CPURISCVState *env, int csrno,
                                  target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
     env->vxrm = val;
     return RISCV_EXCP_NONE;
 }
@@ -311,6 +319,13 @@ static RISCVException read_vxsat(CPURISCVState *env, int csrno,
 static RISCVException write_vxsat(CPURISCVState *env, int csrno,
                                   target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
     env->vxsat = val;
     return RISCV_EXCP_NONE;
 }
@@ -325,6 +340,13 @@ static RISCVException read_vstart(CPURISCVState *env, int csrno,
 static RISCVException write_vstart(CPURISCVState *env, int csrno,
                                    target_ulong val)
 {
+#if !defined(CONFIG_USER_ONLY)
+    if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+    env->mstatus |= MSTATUS_VS;
+#endif
+
     env->vstart = val;
     return RISCV_EXCP_NONE;
 }
@@ -508,7 +530,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
         MSTATUS_SPP | MSTATUS_FS | MSTATUS_MPRV | MSTATUS_SUM |
         MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
-        MSTATUS_TW;
+        MSTATUS_TW | MSTATUS_VS;
 
     if (!riscv_cpu_is_32bit(env)) {
         /*
@@ -521,6 +543,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     mstatus = (mstatus & ~mask) | (val & mask);
 
     dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
+            ((mstatus & MSTATUS_VS) == MSTATUS_VS) |
             ((mstatus & MSTATUS_XS) == MSTATUS_XS);
     if (riscv_cpu_is_32bit(env)) {
         mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
-- 
2.25.1


