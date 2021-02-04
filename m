Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7209530EA52
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:40:43 +0100 (CET)
Received: from localhost ([::1]:33640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UZW-0007eE-EA
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjY-0005uO-FM
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:00 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjW-00045o-Af
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:00 -0500
Received: by mail-pg1-x529.google.com with SMTP id o63so1032807pgo.6
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRHyPEsiO/sbh2eomZAl+YTq7kTrdOg7LphtzyHDt9Q=;
 b=yzc4UVefamkKi+ZzdmNdqpcq9Psk5AuBGV8oyF07TIyPmTBuvP0E9uft+IAI5BZ/Ni
 ZST3rOYH4qikDDiRmyNvny4Er8BDDapl6qHoSyGtAgwtBmqS164YJ8hJV1YGXZnShceN
 5l6naum+iOLLA8KERYnYQ1/N4RiStVZCbNPgUV0GV/NCoN87tQVHhmT8qPzVNWdTZHGY
 DHX4m3LeJJVz1V4c5AQHNL7MX+IWCmbQ8QexlhFufO4qnjYnAbXDmf3jwKaoorURNHZA
 LPUrxsD+gewVuQf1294oSYb3T33MELH4Glzerc8Wg+dTNJXv+xw9Qr0naWqqv5uAnA6n
 H8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRHyPEsiO/sbh2eomZAl+YTq7kTrdOg7LphtzyHDt9Q=;
 b=Qk7zehllhru8acLUZdVj08BxEMooUZr4k3JIqnRm9BT4l4tcWpuMRwwaOlJ723Rw78
 OfFOfR8M/ri0o46Ga4R1oCOJz7losOuxqGRx32ihBLryKWVsnuxBLsx6YlQnD1O5bsXR
 IEg86a6UOihq0PhUjPbGqWTaseqEtlL1dMluDJtTgH2zCVSJxEom7z8REUmHMYxlDVZs
 3Bdx36rLWtg1XQtHvxCvo5AutxV7M7bDo7oDfpQs+391oIyF/g68DZUA6V/ttPIseZvy
 1+2ZdMmsFzYU5OwqFW4UoirZRqjKkEmZg4ONhDHLIefCt+brI0j8yhJbJs867EIeu/ri
 enLA==
X-Gm-Message-State: AOAM531d7skKxWpBiB99z1K+7XBJ6QZkYwWndWc9+IB3r6StIaFe5yzq
 xGh4VReqfXb+NaeVaCoYImmF1JdVb/pkb4Tg
X-Google-Smtp-Source: ABdhPJxWwxUNln4P6Zyqx3HMvW9kmEsjj1MaheX7lbDbYHf0MlA7vuDA/Lrwz+s4bcV9hZyCBhDBcA==
X-Received: by 2002:a62:3503:0:b029:1aa:6f15:b9fe with SMTP id
 c3-20020a6235030000b02901aa6f15b9femr5740085pfa.65.1612403216691; 
 Wed, 03 Feb 2021 17:46:56 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 59/93] tcg/tci: Hoist op_size checking into tci_args_*
Date: Wed,  3 Feb 2021 15:44:35 -1000
Message-Id: <20210204014509.882821-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This performs the size check while reading the arguments,
which means that we don't have to arrange for it to be
done after the operation.  Which tidies all of the branches.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 14 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index a1846825ea..3dc89ed829 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -24,7 +24,7 @@
 #if defined(CONFIG_DEBUG_TCG)
 # define tci_assert(cond) assert(cond)
 #else
-# define tci_assert(cond) ((void)0)
+# define tci_assert(cond) ((void)(cond))
 #endif
 
 #include "qemu-common.h"
@@ -135,146 +135,217 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   s = signed ldst offset
  */
 
+static void check_size(const uint8_t *start, const uint8_t **tb_ptr)
+{
+    const uint8_t *old_code_ptr = start - 2;
+    uint8_t op_size = old_code_ptr[1];
+    tci_assert(*tb_ptr == old_code_ptr + op_size);
+}
+
 static void tci_args_l(const uint8_t **tb_ptr, void **l0)
 {
+    const uint8_t *start = *tb_ptr;
+
     *l0 = (void *)tci_read_label(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rr(const uint8_t **tb_ptr,
                         TCGReg *r0, TCGReg *r1)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_ri(const uint8_t **tb_ptr,
                         TCGReg *r0, tcg_target_ulong *i1)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *i1 = tci_read_i32(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 #if TCG_TARGET_REG_BITS == 64
 static void tci_args_rI(const uint8_t **tb_ptr,
                         TCGReg *r0, tcg_target_ulong *i1)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *i1 = tci_read_i(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 #endif
 
 static void tci_args_rrm(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, TCGMemOpIdx *m2)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *m2 = tci_read_i32(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrr(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, TCGReg *r2)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrs(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, int32_t *i2)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *i2 = tci_read_s32(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrcl(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGCond *c2, void **l3)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *c2 = tci_read_b(tb_ptr);
     *l3 = (void *)tci_read_label(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrc(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGCond *c3)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *c3 = tci_read_b(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrm(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGMemOpIdx *m3)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *m3 = tci_read_i32(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrbb(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                            TCGReg *r2, uint8_t *i3, uint8_t *i4)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *i3 = tci_read_b(tb_ptr);
     *i4 = tci_read_b(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrrm(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                            TCGReg *r2, TCGReg *r3, TCGMemOpIdx *m4)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *r3 = tci_read_r(tb_ptr);
     *m4 = tci_read_i32(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 #if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrr(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *r3 = tci_read_r(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrrcl(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGCond *c4, void **l5)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *r3 = tci_read_r(tb_ptr);
     *c4 = tci_read_b(tb_ptr);
     *l5 = (void *)tci_read_label(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrrrc(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *r3 = tci_read_r(tb_ptr);
     *r4 = tci_read_r(tb_ptr);
     *c5 = tci_read_b(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 
 static void tci_args_rrrrrr(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
 {
+    const uint8_t *start = *tb_ptr;
+
     *r0 = tci_read_r(tb_ptr);
     *r1 = tci_read_r(tb_ptr);
     *r2 = tci_read_r(tb_ptr);
     *r3 = tci_read_r(tb_ptr);
     *r4 = tci_read_r(tb_ptr);
     *r5 = tci_read_r(tb_ptr);
+
+    check_size(start, tb_ptr);
 }
 #endif
 
@@ -440,10 +511,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
     for (;;) {
         TCGOpcode opc = tb_ptr[0];
-#if defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
-        uint8_t op_size = tb_ptr[1];
-        const uint8_t *old_code_ptr = tb_ptr;
-#endif
         TCGReg r0, r1, r2, r3;
         tcg_target_ulong t1;
         TCGCond condition;
@@ -493,7 +560,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_br:
             tci_args_l(&tb_ptr, &ptr);
-            tci_assert(tb_ptr == old_code_ptr + op_size);
             tb_ptr = ptr;
             continue;
         case INDEX_op_setcond_i32:
@@ -646,9 +712,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_brcond_i32:
             tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
             if (tci_compare32(regs[r0], regs[r1], condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
-                continue;
             }
             break;
 #if TCG_TARGET_REG_BITS == 32
@@ -669,7 +733,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             T1 = tci_uint64(regs[r1], regs[r0]);
             T2 = tci_uint64(regs[r3], regs[r2]);
             if (tci_compare64(T1, T2, condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
                 continue;
             }
@@ -803,9 +866,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_brcond_i64:
             tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
             if (tci_compare64(regs[r0], regs[r1], condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
-                continue;
             }
             break;
         case INDEX_op_ext32s_i64:
@@ -834,9 +895,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_goto_tb:
             tci_args_l(&tb_ptr, &ptr);
-            tci_assert(tb_ptr == old_code_ptr + op_size);
             tb_ptr = *(void **)ptr;
-            continue;
+            break;
 
         case INDEX_op_qemu_ld_i32:
             if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
@@ -1014,6 +1074,5 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         default:
             g_assert_not_reached();
         }
-        tci_assert(tb_ptr == old_code_ptr + op_size);
     }
 }
-- 
2.25.1


