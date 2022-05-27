Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CFF5366D4
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:09:55 +0200 (CEST)
Received: from localhost ([::1]:54030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuePK-0008Q4-JG
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM6-00032x-Ff
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:34 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM3-0001e7-Ho
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:06:33 -0400
Received: by mail-pg1-x52c.google.com with SMTP id 129so263063pgc.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8EukyEJ2NdcL1Bzv4PQEoX65kAE8P9PJZ28WXJxUaxs=;
 b=u5gWiSrunGsxtb1bTYGfG/7uKr4N/CarospbINO8GR6bfkIgksqwIcZ7r6xY9miG0I
 UYqSCIeRzO1UZx93Qu/Qs4KZiUsmrNy2f+nqRBVFiTEra9IDregVetZTHkUES6yp/kGj
 +I+gUrUVghOFPOyWrAl/mXKbYq6uzuUYA7sZOSJd98oeClzdbx1QjRvCvtodjOxcNJJn
 4QvIKg8lEQFL7HXqvO+7lo2V26HCWXlOAZJFiySMIRO3RBu5dn6dBT3luBS6jPmbpdNJ
 ze8O69VjY5MojkkIfzY4IivHmrqc4pSoNXjlkHqzfu+He/Fg3CxgIxTFwr4yB+jl7SBa
 Nf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8EukyEJ2NdcL1Bzv4PQEoX65kAE8P9PJZ28WXJxUaxs=;
 b=sH0TQYAfKUcxak7U+27rjZjOT/yaRL6iuDz1OHEKTguTROyaUqHPghz4bshPUIZIon
 7t1dd46bhTTCuhUF4k6jMWCcqjnPrgrkQva+BmmLtyf2dEOjSDNe3Vyl/FpwZTkXr8xI
 iJykBbuGLDneRk7GyPiISIDYrGzyZKRCkyPCiQOq+0kZmSyyRPfYH7/avctsyguseSev
 ZQnBh2c5+tEb9URzkRir0iKwV5IHkFVvXA3XuWHKVluka86g18lg13UGbAdMezuRUemS
 JURiyVLeHcwyCi5yTqJdAa52XPJjuNrqeG7OB0P4QOPg+st/D82PUeXEs0qSxESPmr1J
 0GFQ==
X-Gm-Message-State: AOAM531Zxpydp5c/PEIKX1PMnWP0b6QVUwC5dSBsnNoqZg5Ebj7nrvYe
 PRDjxmEKdZmHlIl3ZWqxQE9GavG20ZjgeQ==
X-Google-Smtp-Source: ABdhPJzdyAfkV9HwUNDsTGurZ1Iex5+bre/JZ9upk6pB8lO2sLC8TGtRl+hAjSEIAEMeDU+TbNxYsg==
X-Received: by 2002:a63:f0b:0:b0:3fb:b7a:757d with SMTP id
 e11-20020a630f0b000000b003fb0b7a757dmr8526755pgl.26.1653674789968; 
 Fri, 27 May 2022 11:06:29 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 06/15] target/arm: Rename sve_zcr_len_for_el to
 sve_vqm1_for_el
Date: Fri, 27 May 2022 11:06:14 -0700
Message-Id: <20220527180623.185261-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be used for both Normal and Streaming SVE, and the value
does not necessarily come from ZCR_ELx.  While we're at it, emphasize
the units in which the value is returned.

Patch produced by
    git grep -l sve_zcr_len_for_el | \
    xargs -n1 sed -i 's/sve_zcr_len_for_el/sve_vqm1_for_el/g'

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       |  2 +-
 target/arm/arch_dump.c |  2 +-
 target/arm/cpu.c       |  2 +-
 target/arm/gdbstub64.c |  2 +-
 target/arm/helper.c    | 12 ++++++------
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a86e8d6548..24cb48eea1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1132,7 +1132,7 @@ void aarch64_sync_64_to_32(CPUARMState *env);
 
 int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el);
 
 static inline bool is_a64(CPUARMState *env)
 {
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 0184845310..b1f040e69f 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -166,7 +166,7 @@ static off_t sve_fpcr_offset(uint32_t vq)
 
 static uint32_t sve_current_vq(CPUARMState *env)
 {
-    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+    return sve_vqm1_for_el(env, arm_current_el(env)) + 1;
 }
 
 static size_t sve_size_vq(uint32_t vq)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0621944167..1b5d535788 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -925,7 +925,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  vfp_get_fpcr(env), vfp_get_fpsr(env));
 
     if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
-        int j, zcr_len = sve_zcr_len_for_el(env, el);
+        int j, zcr_len = sve_vqm1_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
             bool eol;
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 596878666d..07a6746944 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -152,7 +152,7 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
          * We report in Vector Granules (VG) which is 64bit in a Z reg
          * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
          */
-        int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+        int vq = sve_vqm1_for_el(env, arm_current_el(env)) + 1;
         return gdb_get_reg64(buf, vq * 2);
     }
     default:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 93784cb073..84cb78d151 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6219,7 +6219,7 @@ int sve_exception_el(CPUARMState *env, int el)
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
     uint32_t len = cpu->sve_max_vq - 1;
@@ -6243,7 +6243,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
     int cur_el = arm_current_el(env);
-    int old_len = sve_zcr_len_for_el(env, cur_el);
+    int old_len = sve_vqm1_for_el(env, cur_el);
     int new_len;
 
     /* Bits other than [3:0] are RAZ/WI.  */
@@ -6254,7 +6254,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * Because we arrived here, we know both FP and SVE are enabled;
      * otherwise we would have trapped access to the ZCR_ELn register.
      */
-    new_len = sve_zcr_len_for_el(env, cur_el);
+    new_len = sve_vqm1_for_el(env, cur_el);
     if (new_len < old_len) {
         aarch64_sve_narrow_vq(env, new_len + 1);
     }
@@ -13667,7 +13667,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         if (sve_el != 0 && fp_el == 0) {
             zcr_len = 0;
         } else {
-            zcr_len = sve_zcr_len_for_el(env, el);
+            zcr_len = sve_vqm1_for_el(env, el);
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
         DP_TBFLAG_A64(flags, SVE_LEN, zcr_len);
@@ -14034,10 +14034,10 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      */
     old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
-               ? sve_zcr_len_for_el(env, old_el) : 0);
+               ? sve_vqm1_for_el(env, old_el) : 0);
     new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
-               ? sve_zcr_len_for_el(env, new_el) : 0);
+               ? sve_vqm1_for_el(env, new_el) : 0);
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-- 
2.34.1


