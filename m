Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91F6DF443
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 13:53:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmYtd-0005cR-B3; Wed, 12 Apr 2023 07:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtD-0004v0-3V
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:51 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmYtB-0002Rd-0g
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 07:43:50 -0400
Received: by mail-wr1-x431.google.com with SMTP id v6so10561142wrv.8
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681299827; x=1683891827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4Zsigsmxtifc1mTfNj4Cc3gPaSn9A3+wFQ54BAyMXU=;
 b=U4A9LEu4gse6uImkH9lAKhvjWvKPgcFYdtbvkjFBqOpydp4ZzGnI/GufNqLCK53CvA
 zJPP1FIH36U63Liy1dzWhD1yEcEOoc1nzOzhMWyoON97TWmmE/guenzIv+n5nysIRiIh
 +VQPhTv0lF711vRdCbPCkNnzo3vf3LPOLhTNjW+ht+y/g9T3eRvnNrfUbH9Af2bKBgmi
 hDmmkg6otQl5s9FPPNBXQ7hX9Fqv/v5eo1x9PxCWhrZ/3K8WHg47sfuH6RrEs+Jomhx6
 jv8tJDzW9YDtKEV26QebxKyz9yz7QmCw086D6pjsn8SrPsZsMksEA3P6B6ppTihPji1h
 tlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681299827; x=1683891827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a4Zsigsmxtifc1mTfNj4Cc3gPaSn9A3+wFQ54BAyMXU=;
 b=6sVPR+C/5Q+ABx2dgLkcPBJxpI27O+fARccWQUZQfxtidEpvzYlWpRBr8r2fmSQ30+
 xtxoKXqR0GWCOnEe9b80dpNVTMBw7bv21sIl0kU+5SVrXk9WkJg6JdMS3Y6lJwzR9438
 jWgsg05jRotfMdrZV7YGYZCuk4LZsjX48lT7GR6veCgte6YGwlaoUsxe65Ug6yhIzmt7
 TV7TLxFosM7rM1hatoOXTowJgEoU+a5N8OA0LMBGUW0tCAun/zTdzPgzTddaYrz9iKpu
 aiZUoxg3nYn3AfLqsy7irU08Yxuu6yrgHSZA4kIiMLnA4KvwwgMdHaY2pB6yUC3vQ4SY
 GO7Q==
X-Gm-Message-State: AAQBX9eRVNrkPu6+uQL1PBmnURdwJcx6vNRsdhZoMoLM3euRYT6ho+rr
 oYauyszg/R+HH3BMm6GtnkJqVGJLKr5UlpAjezQqa10N
X-Google-Smtp-Source: AKy350bwARQ6ZiR+R5ksTsBGQFYoZSKeyLz0exk5D04VqeOTW7zxEl+ZQ1oVdE/RW+lz+ragiZrGKQ==
X-Received: by 2002:adf:f1cc:0:b0:2f0:23bf:da7d with SMTP id
 z12-20020adff1cc000000b002f023bfda7dmr8837713wro.29.1681299827355; 
 Wed, 12 Apr 2023 04:43:47 -0700 (PDT)
Received: from stoup.hotel.gast (ip-037-024-010-236.um08.pools.vodafone-ip.de.
 [37.24.10.236]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d4289000000b002d21379bcabsm16980826wrq.110.2023.04.12.04.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 04:43:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 14/25] target/riscv: Introduce mmuidx_2stage
Date: Wed, 12 Apr 2023 13:43:22 +0200
Message-Id: <20230412114333.118895-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230412114333.118895-1-richard.henderson@linaro.org>
References: <20230412114333.118895-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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

Move and rename riscv_cpu_two_stage_lookup, to match
the other mmuidx_* functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-15-richard.henderson@linaro.org>
---
 target/riscv/cpu.h        |  1 -
 target/riscv/internals.h  |  5 +++++
 target/riscv/cpu_helper.c | 20 ++++++--------------
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 35cf2e2691..d1f888a790 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -581,7 +581,6 @@ target_ulong riscv_cpu_get_geilen(CPURISCVState *env);
 void riscv_cpu_set_geilen(CPURISCVState *env, target_ulong geilen);
 bool riscv_cpu_vector_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
-bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                MMUAccessType access_type,
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
index 57bb19c76e..9dfd1d739b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -591,11 +591,6 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
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
@@ -779,7 +774,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
      * MPRV does not affect the virtual-machine load/store
      * instructions, HLV, HLVX, and HSV.
      */
-    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+    if (mmuidx_2stage(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
     }
 
@@ -1175,8 +1170,7 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 
     env->badaddr = addr;
-    env->two_stage_lookup = env->virt_enabled ||
-                            riscv_cpu_two_stage_lookup(mmu_idx);
+    env->two_stage_lookup = env->virt_enabled || mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1201,8 +1195,7 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
         g_assert_not_reached();
     }
     env->badaddr = addr;
-    env->two_stage_lookup = env->virt_enabled ||
-                            riscv_cpu_two_stage_lookup(mmu_idx);
+    env->two_stage_lookup = env->virt_enabled || mmuidx_2stage(mmu_idx);
     env->two_stage_indirect_lookup = false;
     cpu_loop_exit_restore(cs, retaddr);
 }
@@ -1256,7 +1249,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
      * MPRV does not affect the virtual-machine load/store
      * instructions, HLV, HLVX, and HSV.
      */
-    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+    if (mmuidx_2stage(mmu_idx)) {
         mode = get_field(env->hstatus, HSTATUS_SPVP);
     } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
                get_field(env->mstatus, MSTATUS_MPRV)) {
@@ -1268,7 +1261,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
     pmu_tlb_fill_incr_ctr(cpu, access_type);
     if (env->virt_enabled ||
-        ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
+        ((mmuidx_2stage(mmu_idx) || two_stage_lookup) &&
          access_type != MMU_INST_FETCH)) {
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
@@ -1366,8 +1359,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         raise_mmu_exception(env, address, access_type, pmp_violation,
                             first_stage_error,
-                            env->virt_enabled ||
-                                riscv_cpu_two_stage_lookup(mmu_idx),
+                            env->virt_enabled || mmuidx_2stage(mmu_idx),
                             two_stage_indirect_error);
         cpu_loop_exit_restore(cs, retaddr);
     }
-- 
2.34.1


