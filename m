Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914276DF420
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:47:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYti-0006Lz-Kz; Wed, 12 Apr 2023 07:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtD-0004vj-U0
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:53 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtC-0002Or-3O
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id e7so494153wrc.12
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299829; x=1683891829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fc7ZqB0501n3cQfOjNTftlZU8unqltEwwtjDsL6xclU=;
 b=CnCsJy3yNooYT9AkA2kepFNlR146UK7RsPYjW4Rz720wOJJQHAcHjpBfjtz/3IbP0y
 Bq5IE097CecxHpxRMiYhyJVHcIz2dzaMfhaCqFg+1XFQXqBD8D6F6OHjGjaNPvLQ7eEN
 07WEHo5Wq3e0lrsbQm+A4ysa/17C+klJX2TD7qksLzpn0uM4ustSpSMJV6QwZbeklX4U
 7mQhrHl42vugLPgh1YHMDedXSJ/t105dHT+qpnhsYwRGB+9vgPQ665tCQWNFiEGgsa9S
 UtEA5PznDPPFOmM3xUq8oyKEQQ+wJBJ6PnIjvt775k6r4DayWg1Z/gXLjt9jwFIMwETY
 Gwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299829; x=1683891829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fc7ZqB0501n3cQfOjNTftlZU8unqltEwwtjDsL6xclU=;
 b=SRTfyM3Gjh4Ixu5mjUmrbON/NPFfCKPqHn6ab79ebldAlEAH34BlQ8mg4v0P7mjg5I
 MgBfln7RdXfOa6b8cCE+Yj8oUWK5oBCqXr+MAGY4GItaO1siR1KCWtM6+e2fiWC5LKfF
 IlNtxTNIoimJ1RJdD+qAOUzl6nGhJ4IMy55dQZ1HWLVRUNAi6lrjfCD9wKHxTddDThPH
 Uj2CVp6M6jydvMdicM1d3jBa4a9H3W8n7kISC+AcH8U9rog8EU6Xfdy1eOr53Tqe0/D2
 aMA0i871LOnSTkVR0ujL0clIYTVZDARzAefhhulq8MtzhJrJrLl2hkqH2kzYZWQHDG5l
 +iRA==
X-Gm-Message-State: AAQBX9cH6uKcYi9eAGsrqYwVAL+F5ir4pXPyN2/rtekdInBgGszoLXJX
 GePnq8VXO/hLSyuticfwAZInoJEx6w8d7YBWQVpTzT17
X-Google-Smtp-Source: AKy350a/hOvYlcMMPfQkRGJLCbiZ24/CjIak8NMlcbut6+1dF7bHaRN2LAcF2iu9cXqErTAC5eL+bg==
X-Received: by 2002:a5d:50c1:0:b0:2ef:b5a0:35e8 with SMTP id
 f1-20020a5d50c1000000b002efb5a035e8mr10364496wrt.20.1681299829356; 
 Wed, 12 Apr 2023 04:43:49 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 16/25] target/riscv: Set MMU_2STAGE_BIT in
 riscv_cpu_mmu_index
Date: Wed, 12 Apr 2023 13:43:24 +0200
Message-Id: <20230412114333.118895-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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

Incorporate the virt_enabled and MPV checks into the cpu_mmu_index
function, so we don't have to keep doing it within tlb_fill and
subroutines.  This also elides a flush on changes to MPV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-17-richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 49 ++++++++++++++-------------------------
 target/riscv/csr.c        |  6 +----
 2 files changed, 18 insertions(+), 37 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index ccba3c45e7..baa4b3a1d2 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -37,19 +37,21 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifdef CONFIG_USER_ONLY
     return 0;
 #else
-    if (ifetch) {
-        return env->priv;
-    }
+    bool virt = env->virt_enabled;
+    int mode = env->priv;
 
     /* All priv -> mmu_idx mapping are here */
-    int mode = env->priv;
-    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
-        mode = get_field(env->mstatus, MSTATUS_MPP);
+    if (!ifetch) {
+        if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+            mode = get_field(env->mstatus, MSTATUS_MPP);
+            virt = get_field(env->mstatus, MSTATUS_MPV);
+        }
+        if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
+            mode = MMUIdx_S_SUM;
+        }
     }
-    if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
-        return MMUIdx_S_SUM;
-    }
-    return mode;
+
+    return mode | (virt ? MMU_2STAGE_BIT : 0);
 #endif
 }
 
@@ -1162,7 +1164,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 
     env->badaddr = addr;
-    env->two_stage_lookup = env->virt_enabled || mmuidx_2stage(mmu_idx);
+    env->two_stage_lookup = mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1187,7 +1189,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         g_assert_not_reached();
     }
     env->badaddr = addr;
-    env->two_stage_lookup = env->virt_enabled || mmuidx_2stage(mmu_idx);
+    env->two_stage_lookup = mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1225,7 +1227,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     int prot, prot2, prot_pmp;
     bool pmp_violation = false;
     bool first_stage_error = true;
-    bool two_stage_lookup = false;
+    bool two_stage_lookup = mmuidx_2stage(mmu_idx);
     bool two_stage_indirect_error = false;
     int ret = TRANSLATE_FAIL;
     int mode = mmu_idx;
@@ -1237,24 +1239,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
-    /*
-     * MPRV does not affect the virtual-machine load/store
-     * instructions, HLV, HLVX, and HSV.
-     */
-    if (mmuidx_2stage(mmu_idx)) {
-        ;
-    } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
-               get_field(env->mstatus, MSTATUS_MPRV)) {
-        mode = get_field(env->mstatus, MSTATUS_MPP);
-        if (riscv_has_ext(env, RVH) && get_field(env->mstatus, MSTATUS_MPV)) {
-            two_stage_lookup = true;
-        }
-    }
-
     pmu_tlb_fill_incr_ctr(cpu, access_type);
-    if (env->virt_enabled ||
-        ((mmuidx_2stage(mmu_idx) || two_stage_lookup) &&
-         access_type != MMU_INST_FETCH)) {
+    if (two_stage_lookup) {
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
                                    &env->guest_phys_fault_addr, access_type,
@@ -1350,8 +1336,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         return false;
     } else {
         raise_mmu_exception(env, address, access_type, pmp_violation,
-                            first_stage_error,
-                            env->virt_enabled || mmuidx_2stage(mmu_idx),
+                            first_stage_error, two_stage_lookup,
                             two_stage_indirect_error);
         cpu_loop_exit_restore(cs, retaddr);
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 124be448dc..211acad5ae 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1270,7 +1270,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     val = legalize_mpp(env, get_field(mstatus, MSTATUS_MPP), val);
 
     /* flush tlb on mstatus fields that affect VM */
-    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPV)) {
+    if ((val ^ mstatus) & MSTATUS_MXR) {
         tlb_flush(env_cpu(env));
     }
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
@@ -1318,10 +1318,6 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
     uint64_t valh = (uint64_t)val << 32;
     uint64_t mask = MSTATUS_MPV | MSTATUS_GVA;
 
-    if ((valh ^ env->mstatus) & (MSTATUS_MPV)) {
-        tlb_flush(env_cpu(env));
-    }
-
     env->mstatus = (env->mstatus & ~mask) | (valh & mask);
 
     return RISCV_EXCP_NONE;
-- 
2.34.1


