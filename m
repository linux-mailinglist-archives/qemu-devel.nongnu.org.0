Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81406F7A86
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:16:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujvR-0000qQ-Nj; Thu, 04 May 2023 21:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujv0-0000Xo-LS
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:39 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujux-00081X-VB
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:29 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1aad5245571so8039865ad.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248846; x=1685840846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aFHu1wXGTKi/8OHzVpdxexLxvjVZdWMnanU8CAAQbkg=;
 b=agYuLICf039HPmnNCrJvxh3em8Z20NTbqQE4vcxBVYWbOVE05pl7ae4QesHFJK/xLT
 wqzie4J/ucdqExX33x8aQBxET7hlF2ILMcYSAi02WEhu/ZzfGexqeDyNyerhRpUPaJ1C
 I5/rIrKXMkUayh90RUy8n7p1gkcX/TI7fAPBMdfqUKZvQze0mdXDAcnithOBPMs6YNfm
 6v9t5qrQIwxK6yibL1Bc+fyg+lI8SKzyHHZXllYSyFrak7G67o3BxwGnPpuW1Z2fibDA
 fioXfCeAkvT10VKFYrI2NNcWLYR+F5Z+ffphHm8lT+Va2vZlnzS3UW6MLoo2A5lcKYDl
 FYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248846; x=1685840846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aFHu1wXGTKi/8OHzVpdxexLxvjVZdWMnanU8CAAQbkg=;
 b=l1MAXEuNI0sLcK76jSOxMNky5LdjwE64M93db+SmYI+zITg04SYBmOPkyLqBlxqyVg
 Cz3VagLEIG7gxn3MOn9GSOJ2zgoe5Hs3bsITJP/siZq9y+LeG9EPFt3nXICo+zaaETxJ
 7Ga2UTrdcbkvhY7XvEsM9NsU10TY5TlYcDcpoSu6VSQiBx6CaOhtMYkVNEltw100azcY
 7CvnZ3AARIVA0pxk/nKWelut1WwQxK1A5wq/00NrqX3Dk4wlJ8zy4sabHnzqmIJaB/Sd
 n/7zVPLDq+oe3Lfv4CpdI8hQrfMxK5t+AgWY7KFaJT5Ti49fRsyd84Oyal7CmPcjKzSx
 4u1A==
X-Gm-Message-State: AC+VfDx6EXs18x0Ck+dcZwfF3cjC0rd+wwz+JRJm6MmP+02kkP3zIOt1
 lQLBKrylS+qRt0bW0DzseDKM4aOnIeZviw==
X-Google-Smtp-Source: ACHHUZ4NYVQKYQ1i3ZkbqHp9u24K3pBLVHEybnSfh6EOj184GzvJNujCUj+vDkm2FAzLu5hd2hGEzg==
X-Received: by 2002:a17:903:32c4:b0:1ac:3605:97ec with SMTP id
 i4-20020a17090332c400b001ac360597ecmr3436280plr.62.1683248846468; 
 Thu, 04 May 2023 18:07:26 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:26 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 72/89] target/riscv: Set MMU_2STAGE_BIT in riscv_cpu_mmu_index
Date: Fri,  5 May 2023 11:02:24 +1000
Message-Id: <20230505010241.21812-73-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Incorporate the virt_enabled and MPV checks into the cpu_mmu_index
function, so we don't have to keep doing it within tlb_fill and
subroutines.  This also elides a flush on changes to MPV.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-17-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-17-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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
-    }
-    if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
-        return MMUIdx_S_SUM;
+    if (!ifetch) {
+        if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
+            mode = get_field(env->mstatus, MSTATUS_MPP);
+            virt = get_field(env->mstatus, MSTATUS_MPV);
+        }
+        if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
+            mode = MMUIdx_S_SUM;
+        }
     }
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
index 4a4d852bd1..865ee9efda 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1294,7 +1294,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
     val = legalize_mpp(env, get_field(mstatus, MSTATUS_MPP), val);
 
     /* flush tlb on mstatus fields that affect VM */
-    if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPV)) {
+    if ((val ^ mstatus) & MSTATUS_MXR) {
         tlb_flush(env_cpu(env));
     }
     mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
@@ -1342,10 +1342,6 @@ static RISCVException write_mstatush(CPURISCVState *env, int csrno,
     uint64_t valh = (uint64_t)val << 32;
     uint64_t mask = MSTATUS_MPV | MSTATUS_GVA;
 
-    if ((valh ^ env->mstatus) & (MSTATUS_MPV)) {
-        tlb_flush(env_cpu(env));
-    }
-
     env->mstatus = (env->mstatus & ~mask) | (valh & mask);
 
     return RISCV_EXCP_NONE;
-- 
2.40.0


