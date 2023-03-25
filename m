Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422006C8DA9
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 12:53:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg2SY-0006XR-4h; Sat, 25 Mar 2023 07:53:22 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2SW-0006VD-2Y
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:53:20 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2ST-0007t8-SJ
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:53:19 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-54184571389so82304277b3.4
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 04:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4rfLgFNzYBP18XOZQ9r8lBQXEnzeUKDygCPE/LFPAk=;
 b=Uj9g1ktA5pWp4TpigFAGpZDJ40HJuuBGdBt39PcbKiD2YR0j7tLQkiWasaua4DOIy1
 1aKTKhjJ+tY4S8nqvt3d9L1rHRqewx4nNmgeAd/c7iNOKWsXukoU2zTVETE0Oc5QMqr5
 zVMZe0Rop+yO1fxeXlKZLyNnigPy4y5+nq2SEMbFn1ZTvzROVQkDxKz95avgLo2G3Sn1
 yXT4clx7K60v5+l7WWHHTlWypFHhkQtKLGrLnJmiquy2T6+H2hMBFjsS4lA1aZlYr5yi
 XswSnmQoTQ0qyxfsolJS4hhHOHLMipZamKmvEOvCZCxh2yuqdRuUi+EqANcZT3JJIcFI
 CJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b4rfLgFNzYBP18XOZQ9r8lBQXEnzeUKDygCPE/LFPAk=;
 b=2Ajym3by3RuLohoDq3BJHt8W4WyTyL1DDqb7nmgbpgObwyE+ahBPYud/2JQUI7/ld6
 AcLuabpgYZK+UXOxvAiSBBUG3QxVBrFNqNZmRG4sQ3RGu/IsNtWqGRj/JAydOEre4VAn
 tCI/pYh+n/4dsMellyXE4PFjY6tePh/119ASBoCuEuMRTOFhAi/h1g8p9kcYSQlLzqzw
 nbfGF6IhA4KgZjlg2gLDrYQgfyCCMjGNxDd6dVh8Z/129ovm+eg1ll+WQZv3qbX3Nyu8
 eibWfICtwqohJ3ycIhlcINNTPKSoXkYYvN9no11Bt8S87XmMiVvL7DNyjeD/EFmKKo7A
 k04g==
X-Gm-Message-State: AAQBX9eczRfVEoxX9udTRhTYd2QRxgweNnwTiV405mHtmpz/Vm1UCw7B
 D3nJjVJhxyHgRTuVByIHPllTWKtlZov3eXwwckw=
X-Google-Smtp-Source: AKy350Yi4SAePNRJRWkI83rJpPRmv1gdDdL94w0WjaWGrqsBq5qg4Bj2WnjiD3DeL4EEvBMr6C9Tww==
X-Received: by 2002:a17:90b:298:b0:240:c4c:59ea with SMTP id
 az24-20020a17090b029800b002400c4c59eamr11732915pjb.11.1679741683043; 
 Sat, 25 Mar 2023 03:54:43 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 14/25] target/riscv: Introduce mmuidx_2stage
Date: Sat, 25 Mar 2023 03:54:18 -0700
Message-Id: <20230325105429.1142530-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Move and rename riscv_cpu_two_stage_lookup, to match
the other mmuidx_* functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu.h        |  1 -
 target/riscv/internals.h  |  5 +++++
 target/riscv/cpu_helper.c | 17 ++++++-----------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f03ff1f10c..b6bcfb3834 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -586,7 +586,6 @@ void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
-bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 4aa1cb409f..b5f823c7ec 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -51,6 +51,11 @@ static inline bool mmuidx_sum(int mmu_idx)
     return (mmu_idx & 3) == MMUIdx_S_SUM;
 }
 
+static inline bool mmuidx_2stage(int mmu_idx)
+{
+    return mmu_idx & MMU_2STAGE_BIT;
+}
+
 /* share data between vector helpers and decode code */
 FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index cb260b88ea..8a124888cd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -603,11 +603,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
     }
 }
 
-bool riscv_cpu_two_stage_lookup(int mmu_idx)
-{
-    return mmu_idx & MMU_2STAGE_BIT;
-}
-
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
 {
     CPURISCVState *env = &cpu->env;
@@ -791,7 +786,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
 
     /* MPRV does not affect the virtual-machine load/store
        instructions, HLV, HLVX, and HSV. */
-    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+    if (mmuidx_2stage(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
     }
 
@@ -1177,7 +1172,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 
     env->badaddr = addr;
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
-                            riscv_cpu_two_stage_lookup(mmu_idx);
+                            mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1203,7 +1198,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     }
     env->badaddr = addr;
     env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
-                            riscv_cpu_two_stage_lookup(mmu_idx);
+                            mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1255,7 +1250,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
     /* MPRV does not affect the virtual-machine load/store
        instructions, HLV, HLVX, and HSV. */
-    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+    if (mmuidx_2stage(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
     } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
                get_field(env->mstatus, MSTATUS_MPRV)) {
@@ -1267,7 +1262,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
     pmu_tlb_fill_incr_ctr(cpu, access_type);
     if (riscv_cpu_virt_enabled(env) ||
-        ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
+        ((mmuidx_2stage(mmu_idx) || two_stage_lookup) &&
          access_type != MMU_INST_FETCH)) {
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
@@ -1365,7 +1360,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         raise_mmu_exception(env, address, access_type, pmp_violation,
                             first_stage_error,
                             riscv_cpu_virt_enabled(env) ||
-                                riscv_cpu_two_stage_lookup(mmu_idx),
+                                mmuidx_2stage(mmu_idx),
                             two_stage_indirect_error);
         cpu_loop_exit_restore(cs, retaddr);
     }
-- 
2.34.1


