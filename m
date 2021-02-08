Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383F8312929
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:05:40 +0100 (CET)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wrr-0004RJ-8T
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRo-0001ik-OI
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:44 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRh-0005sk-KJ
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:44 -0500
Received: by mail-pl1-x630.google.com with SMTP id 8so7004276plc.10
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRHyPEsiO/sbh2eomZAl+YTq7kTrdOg7LphtzyHDt9Q=;
 b=X7PiBnB8GJWeHdO6UjB8VDz2hxdjAKcqnbMeBvQuOVwueHwrfnFTIshM7GQ3EI+7Wx
 ZjayPtvteTpLJJKVkZiukCHpv7tCwtTF2AImWPTpRjw5e65dl/ujji58NWyoG+8Wy4gn
 Zf6waWijlZlr/QzVMV7SNDda3mOlW1+L36FdZTSAx6R3X4FO6Liru+Z8CYHvTFDwI+2t
 sc4yRVZhEV/l/wQxYni9TrcrOagYwh4KIb1rCd3My4XJBVhvDS/Eha+npDZH/tWHT5nP
 V6M9LpoakZoRmzQ+f49jBJVdqAYelirFn18rOs8101CeoanOaSpU/OCteWTy9yhuqCdl
 EkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRHyPEsiO/sbh2eomZAl+YTq7kTrdOg7LphtzyHDt9Q=;
 b=tMTNodXnIZyIsGF/wtfG6TXLfEbw61UWLZYgiPpV9ndjvu1PE7RzAt3zlJf/KUonGy
 9TogXC9LFw1yBCQ8n6ZpvzJHPji8mqir3V5GYMwbpoXBBEddss59g3X/KHUFfnUbNRW3
 McM+uK2DnHYXpzb1IrKLGeoEzNWfwRlJ+YbfuZc06TN16eOlRykwXU0RfJn4aqYRYee8
 G150BUum9UhAn3OaYxN8zHXxPTTpP3q83I/t+jlN5dw+nTFad66T50ad84dKo1UoWl/1
 x+2EkbK1k9qYSC2UhawEWnsDDRo4q1EQdvCkDVsTt1V5dmG7y3uOKDhycf6kFC28NRpX
 KpeQ==
X-Gm-Message-State: AOAM53298lBOzmGL3ixEmBeicNlfqtwCfxaFNR6Ogxy5dMTHHaOogPSm
 GHiZXg61do+5zcJ315rX0RsXoH4IMndWXA==
X-Google-Smtp-Source: ABdhPJzDiMZIcBmaH5MCQ9lHYt9QmQ4EizX14DaUZKz8m9lMsBTdDxw8NLpem1nyWKRMdbU33z8xqw==
X-Received: by 2002:a17:90a:ad81:: with SMTP id
 s1mr14655918pjq.9.1612751916230; 
 Sun, 07 Feb 2021 18:38:36 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 34/70] tcg/tci: Hoist op_size checking into tci_args_*
Date: Sun,  7 Feb 2021 18:37:16 -0800
Message-Id: <20210208023752.270606-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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


