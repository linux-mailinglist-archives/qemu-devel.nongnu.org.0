Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CACD6C8DB5
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 12:58:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg2X8-0005Je-Fx; Sat, 25 Mar 2023 07:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2X4-0005IS-6Y
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:58:02 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pg2X2-0002Oa-5q
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 07:58:01 -0400
Received: by mail-il1-x132.google.com with SMTP id h11so2212299ild.11
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 04:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679745479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rf4S3mwv8AELOJo2z5tbqU/yZWUjpW3yyw5sksbl4rs=;
 b=N9/92Bm/Js+8buTyoILBgtcOPKuITFYnOlZ1U/o/5dRR7pAt/j0YoM+d+lhadOxkIR
 HIGlbwoUcVNthXxGBIZkQJr/6bWWrFBsvNL//OsKBsU3G3sXQyWlkSJyChVe106SXcd2
 hlSRmPZD3yCKMiD2KrsTa+2JCriTOA4z08WXkAmPXxJT7mJcqbLrZRfpdv1Qk0gJ5YHV
 0jHtUS6oXmjI4+Fc0mllgX4dsliCGe0XNVTnmyLD6kM4ESY9wgmCiysQG8MO2Mr/3ydT
 6JD5UO2rJdN62LnSR0L4du7sQiDEoBJvO6wfjin3RlQPNSiG9cKFnLm6e0hHrTDD1/O6
 So5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679745479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rf4S3mwv8AELOJo2z5tbqU/yZWUjpW3yyw5sksbl4rs=;
 b=EA0/FXbV0kCyyDRGsbFUP7Vt575/hbTJYK9Dtu4g3ssZRe9PE1ROdh1WN5at1JqH2L
 JPUb/HXcgBTpMpB/75jPKuU9idswwyjY/hbHqO9ZrNCQT9+yFxKAGxhn9fuQXaQOK8zd
 nzf4g2QV2LalEYuKxkSyzMFEg9UcdNTiBkKRxdpcuUCEC3e5oiRlxgklnxJ3AOl2TV2Z
 KvZHl4wN9ohCvg8LFxniQIkUjnsK8EXcfC9wsAR8CypZyhZ5yyC/Ww+zA7OLvFM1XG7H
 St7C+JGW/stJZP+V02mnE7c4x8lGiYvQSjztNitGbJQ5buPnsUIojH68WwnF1E1kQEcq
 xcqQ==
X-Gm-Message-State: AAQBX9ds2uvjBcBYgcBY7a+xgCSQOl8gdWYSR8oFlXIBM24wdDLJxiur
 Hv7oiLynXoYo2mpGAxETdwnU85sqUleAoGXHcKM=
X-Google-Smtp-Source: AKy350YLGrGUDxkHTc7IbQc0MTqCBbLAbXdVhs2WWGO3GEMN1lS4xRVpEKLFU+cgFy68qKm4WirxNw==
X-Received: by 2002:a17:90b:1e4f:b0:23f:4dfd:4fc1 with SMTP id
 pi15-20020a17090b1e4f00b0023f4dfd4fc1mr6425620pjb.43.1679741684964; 
 Sat, 25 Mar 2023 03:54:44 -0700 (PDT)
Received: from stoup.. ([2602:ae:1544:6601:790a:6e23:4a91:70a])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a17090a2d8e00b0023af4eb597csm1234684pjd.52.2023.03.25.03.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Mar 2023 03:54:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, palmer@dabbelt.com,
 zhiwei_liu@linux.alibaba.com, fei2.wu@intel.com
Subject: [PATCH v6 16/25] target/riscv: Set MMU_2STAGE_BIT in
 riscv_cpu_mmu_index
Date: Sat, 25 Mar 2023 03:54:20 -0700
Message-Id: <20230325105429.1142530-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Incorporate the virt_enabled and MPV checks into the cpu_mmu_index
function, so we don't have to keep doing it within tlb_fill and
subroutines.  This also elides a flush on changes to MPV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu_helper.c | 50 +++++++++++++--------------------------
 target/riscv/csr.c        |  6 +----
 2 files changed, 18 insertions(+), 38 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0adfd4a12b..6c42f9c6fd 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -37,19 +37,21 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #ifdef CONFIG_USER_ONLY
     return 0;
 #else
-    if (ifetch) {
-        return env->priv;
-    }
+    bool virt = riscv_cpu_virt_enabled(env);
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
 
@@ -1165,8 +1167,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 
     env->badaddr = addr;
-    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
-                            mmuidx_2stage(mmu_idx);
+    env->two_stage_lookup = mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1191,8 +1192,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         g_assert_not_reached();
     }
     env->badaddr = addr;
-    env->two_stage_lookup = riscv_cpu_virt_enabled(env) ||
-                            mmuidx_2stage(mmu_idx);
+    env->two_stage_lookup = mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1230,7 +1230,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     int prot, prot2, prot_pmp;
     bool pmp_violation = false;
     bool first_stage_error = true;
-    bool two_stage_lookup = false;
+    bool two_stage_lookup = mmuidx_2stage(mmu_idx);
     bool two_stage_indirect_error = false;
     int ret = TRANSLATE_FAIL;
     int mode = mmu_idx;
@@ -1242,22 +1242,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
-    /* MPRV does not affect the virtual-machine load/store
-       instructions, HLV, HLVX, and HSV. */
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
-    if (riscv_cpu_virt_enabled(env) ||
-        ((mmuidx_2stage(mmu_idx) || two_stage_lookup) &&
-         access_type != MMU_INST_FETCH)) {
+    if (two_stage_lookup) {
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
                                    &env->guest_phys_fault_addr, access_type,
@@ -1352,9 +1338,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         return false;
     } else {
         raise_mmu_exception(env, address, access_type, pmp_violation,
-                            first_stage_error,
-                            riscv_cpu_virt_enabled(env) ||
-                                mmuidx_2stage(mmu_idx),
+                            first_stage_error, two_stage_lookup,
                             two_stage_indirect_error);
         cpu_loop_exit_restore(cs, retaddr);
     }
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b79758a606..1b635373c6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1246,7 +1246,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     RISCVMXL xl = riscv_cpu_mxl(env);
 
     /* flush tlb on mstatus fields that affect VM */
-    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPV)) {
+    if ((val ^ mstatus) & MSTATUS_MXR) {
         tlb_flush(env_cpu(env));
     }
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
@@ -1294,10 +1294,6 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
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


