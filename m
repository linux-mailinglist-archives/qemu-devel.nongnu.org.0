Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1DD46FC59
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:10:28 +0100 (CET)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvaz5-0001Pw-R4
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:10:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamY-0003Mb-4O
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:30 -0500
Received: from [2607:f8b0:4864:20::531] (port=46041
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamP-0006BU-Ui
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:24 -0500
Received: by mail-pg1-x531.google.com with SMTP id 133so7357989pgc.12
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p7JtYkg6Pt7iS16IMaRV9lesJTf5A9qgUYIJbiyTYgk=;
 b=O/1e+ZgpNfPELdx0yMp9+nNpCBlA/ReLQBtf0VoAzrtNnf2Anr91KrlOpX9gyk6NjU
 DRx843IXQss3FRWK8E5+oOE/u5vJtIUyU9HC3MmO7rOWpI7cgnOPlbOah0y6Sh2O3muz
 9fdKHAdl6cwZyXSIbLgV3ksYMscEwj8vRjciQt4uHHwQuxq1YBpgh+CZrpDutBvVJPvG
 tYa42Du5pKwEE8uT1qKrJR528gikpN6BDZRvKIUCeHq6otajrB7KSFbVjM5vfMKxZeAG
 p8C0OfSDPxRQFztP3XV5cmhuXF7nD9yt3fc1+4+aeH1EYPnFzG95AnX3B7NUKkipZtSA
 CrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p7JtYkg6Pt7iS16IMaRV9lesJTf5A9qgUYIJbiyTYgk=;
 b=tlHG3OzURPCZmob6elTejh3TvdXC5JSUHQSmrElL8ytetgrtxG7in9gMVgGPdufllr
 Rg94Gjx/m5UF9Fe55qC1oZiaoVuR+56BI5oTE38NZZ6FY00TV68No7pUrsPo1IV7pDjm
 5g0y9rB3ieTMdr5FcbBX9ezmNT9G9fB/d0PbGpmDkGTUjhrk6xrG7D8YpoepEUTvU1Vq
 gGE86hJQPPJyvvZXzmqfMOatYjVEfxGgvgxS/ZCKn8vVEpJxIHixbQs718qMe9ZOvWWc
 zjNW08XjKPW3XT4zTxbxHnHn+5VKn97YOctAxrDtmdiqo78WLUw2P2VZbKfAUdranhj3
 ibcg==
X-Gm-Message-State: AOAM530+db1+fdzTkuUJDCXxOJXnYUZR/KkpZ+pYs2p5vVfRO/Jhn/11
 IfI+20rh5OL3PhTY1AFxXt2Erd7tzoAWl5Ul
X-Google-Smtp-Source: ABdhPJwq40rxVNFJLQKsoyFue+m4C7dF2f75+n8noWGMO9f3vjgDEn4yf3s/J2GsN5f72L40YMpSOQ==
X-Received: by 2002:a65:6243:: with SMTP id q3mr38889317pgv.593.1639123040526; 
 Thu, 09 Dec 2021 23:57:20 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:20 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 03/77] target/riscv: rvv-1.0: add mstatus VS field
Date: Fri, 10 Dec 2021 15:55:49 +0800
Message-Id: <20211210075704.23951-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
index 5ea2004ae0..48b8f61210 100644
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
index 9913fa9f77..72a716c999 100644
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
index 9eeed38c7e..8803fe0b14 100644
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
index 9f41954894..9b5bd5d7b4 100644
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
2.31.1


