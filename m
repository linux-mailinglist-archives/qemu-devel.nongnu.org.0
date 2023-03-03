Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A94E6A92D2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:43:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zC-00083h-FT; Fri, 03 Mar 2023 03:41:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z4-0007ol-G1
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:46 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z2-0007uA-PE
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:46 -0500
Received: by mail-pl1-x62d.google.com with SMTP id a9so1945392plh.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832903;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udjSUvUDm4pjtAf1qYFNISrlvK5Da5pynRSkd3iyEqA=;
 b=pB2DrIy99M/uZGUJRxhuuzPyTLGjKsGS/k2szid8CSjFlmakAHwvRhrqK92TLvumxu
 HPmaYIjgGe947mx5Ex6cr36bZ0gn1sabN6dHps8BCdWlC75Qjzg24eCVL6zK/g2EzMkz
 jqJbOvLhZaXkRpsDNe/oOk/brYfOtBTQNX3KwAtnBUEG8DBx0SxNZH87xW2QF0bNYS5t
 kFAuK15coLEiWdBmUBraumSKW7BgUihmn+0r250STXcvO5bQE39hOnWHvp2swyqShtkY
 1FM/mMQEcQ5DgjX6+0ZTPupVnKKEssj+XHzjyZdRnNhzPJJe4ucKlSy+p5MHPrvPmZ0s
 sl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832903;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udjSUvUDm4pjtAf1qYFNISrlvK5Da5pynRSkd3iyEqA=;
 b=RP42+jjoUdnqc0aTB6Nszo7S8aXRcmh+cOt3O536dM2GVilOCpBockSNi5t5RdnyiM
 avme9CBDTdAIPSKz1I0l6EmOEF/M9xf7g8ZjgmnIIT55kj3zFZGBhzSzzecuY9ZTNA74
 rD8LPKEzqdpbR4/uAVLrQPS7dxJo7iIoAobY0k/COzCMhwVnSmVNVPm6+/2VV1v+beBO
 ewh/Kbm2kAuHUtWVjyoBdkEX9u7otp0WTkp+7ikYVzvhNE5aRPcZPmvDaaMdALtqMu30
 RTMigCNVHSxmEKBrrZXQNLqq/J8dOw6E28uA2RyPUy2Mn7Tk1yH4lnyqO2tyQrvobfYR
 Hz8g==
X-Gm-Message-State: AO0yUKXigL0To1Cswj8sPBfySLEObs6X6HrX1dTEavCPNzzQmscvpujx
 DDRDXCexmeAXsY3ZgL/RAf0vog==
X-Google-Smtp-Source: AK7set8dvZe968iOXMeDwPWMEBVvmAMX4eYUA4ow/1ILc5MVlBZMEd1xmxka8l/KiKunZYSXSr4UCw==
X-Received: by 2002:a05:6a20:a00e:b0:cc:9643:1f8f with SMTP id
 p14-20020a056a20a00e00b000cc96431f8fmr1447953pzj.13.1677832903449; 
 Fri, 03 Mar 2023 00:41:43 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 p24-20020a63c158000000b004e8f7f23c4bsm966866pgi.76.2023.03.03.00.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:43 -0800 (PST)
Subject: [PULL 18/59] target/riscv: Simplify check for Zve32f and Zve64f
Date: Fri,  3 Mar 2023 00:36:59 -0800
Message-Id: <20230303083740.12817-19-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

V/Zve64f depend on Zve32f, so we can only check Zve32f in these cases.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-9-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu_helper.c               | 2 +-
 target/riscv/csr.c                      | 3 +--
 target/riscv/insn_trans/trans_rvv.c.inc | 8 ++------
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 3a9472a2ff..a24a9fdeb9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -51,7 +51,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
     *pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
     *cs_base = 0;
 
-    if (riscv_has_ext(env, RVV) || cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
+    if (cpu->cfg.ext_zve32f) {
         /*
          * If env->vl equals to VLMAX, we can use generic vector operation
          * expanders (GVEC) to accerlate the vector operations.
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1b0a0c1693..5b757c8b82 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -93,8 +93,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
 
-    if (env->misa_ext & RVV ||
-        cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
+    if (cpu->cfg.ext_zve32f) {
 #if !defined(CONFIG_USER_ONLY)
         if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index bbb5c3a7b5..6f7ecf1a68 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -173,9 +173,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs1, TCGv s2)
 {
     TCGv s1, dst;
 
-    if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f ||
-          s->cfg_ptr->ext_zve64f)) {
+    if (!require_rvv(s) || !s->cfg_ptr->ext_zve32f) {
         return false;
     }
 
@@ -210,9 +208,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv s1, TCGv s2)
 {
     TCGv dst;
 
-    if (!require_rvv(s) ||
-        !(has_ext(s, RVV) || s->cfg_ptr->ext_zve32f ||
-          s->cfg_ptr->ext_zve64f)) {
+    if (!require_rvv(s) || !s->cfg_ptr->ext_zve32f) {
         return false;
     }
 
-- 
2.39.2


