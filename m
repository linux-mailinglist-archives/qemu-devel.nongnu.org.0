Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1AA31E0FA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:02:51 +0100 (CET)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTyE-0005Lc-Sm
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLl-0008Ss-AP
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:05 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLj-0007Oq-EH
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:23:05 -0500
Received: by mail-pg1-x532.google.com with SMTP id t26so9226755pgv.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cto0meToeqhl4dng/D5GTO+M9plTBCVNCtbljoyaQQ8=;
 b=iaORFVKeEW06UCQwJ+CdPX/yHo1aRdZtjNBfH0rI6bU3UOIX/r2FHZdyKECFUQ6eI8
 rE6rdi3Bwc+h+er9PwFuTbYQUv7mOYmBmRLsNjqTLPJtejHAAPaPlXFKuWddPKCGwiWW
 9IiGnY74ECe/Q9aQQB+MFwK1AZl0Dn0oF3Tw4mi8EnV79WwZPcSn0m7qkA4cjaacZZv3
 q+5p5P+5UEoN5FNm+cSEXtu45gLS39A+jurYuQqW4OwVTfB9sAl8S7aa9DCvF6ZPDNxB
 EsBjOXVkIZ8AaOV7TEKn12RdMNEQgimuAEzz9hhTMvPYiZtXZIZkqdJcY5SwrLAmpQe/
 qNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cto0meToeqhl4dng/D5GTO+M9plTBCVNCtbljoyaQQ8=;
 b=oD7Gk7p7jHkhTENOCg6UaM+x8iCXlGj13HZwR02Ko7/cwKmv6sIOcfx+pcv2VJ+55v
 hClHXF3KKfAd0HtXLEY9jWBvBpFtgIWQis5elblu0sGpdV4fJOXzox7l3I9bohGArzdf
 c4OUqyNaQaphTlFBk/ChNbzl0GWGI03rWYMr6AffvSkXaPEpCZo+yNJO1ynf5UtLnpTb
 MyrBr7y04Z9hiP3WsETwUYe1fcvIt2CPhur+UwqWi2cKdhBDmgdhU0sxXtSmOSO7YDn/
 VA31rwCpWYHHsAGvR4IvvYdxsnE/dKJbmvsyLeRssKDsw7w6dzfesCicz1FTu+oGVj/q
 a8Dw==
X-Gm-Message-State: AOAM5339zbY7rJRUqOlAhuaO9Gi+PcJMfMuUagktxuQT/T+6vKM0NxWl
 JeY3D+sfOqnjAM1GJSGoW8aUSfOM//x1IQ==
X-Google-Smtp-Source: ABdhPJx9lJauDYJRI8UQIDHG1JHsU42z99vbEmrMP6XFG96ve2/oQKcGxTFj3R3EWBD2YFAQhRi4sg==
X-Received: by 2002:a05:6a00:2ac:b029:1e9:3cb7:324a with SMTP id
 q12-20020a056a0002acb02901e93cb7324amr985906pfs.36.1613593381967; 
 Wed, 17 Feb 2021 12:23:01 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:23:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 34/71] tcg/tci: Hoist op_size checking into tci_args_*
Date: Wed, 17 Feb 2021 12:19:59 -0800
Message-Id: <20210217202036.1724901-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
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
index f6cc5a3ab0..6b63beea28 100644
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
 
@@ -423,10 +494,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
     for (;;) {
         TCGOpcode opc = tb_ptr[0];
-#if defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
-        uint8_t op_size = tb_ptr[1];
-        const uint8_t *old_code_ptr = tb_ptr;
-#endif
         TCGReg r0, r1, r2, r3;
         tcg_target_ulong t1;
         TCGCond condition;
@@ -476,7 +543,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_br:
             tci_args_l(&tb_ptr, &ptr);
-            tci_assert(tb_ptr == old_code_ptr + op_size);
             tb_ptr = ptr;
             continue;
         case INDEX_op_setcond_i32:
@@ -629,9 +695,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_brcond_i32:
             tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
             if (tci_compare32(regs[r0], regs[r1], condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
-                continue;
             }
             break;
 #if TCG_TARGET_REG_BITS == 32
@@ -652,7 +716,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             T1 = tci_uint64(regs[r1], regs[r0]);
             T2 = tci_uint64(regs[r3], regs[r2]);
             if (tci_compare64(T1, T2, condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
                 continue;
             }
@@ -786,9 +849,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_brcond_i64:
             tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
             if (tci_compare64(regs[r0], regs[r1], condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
-                continue;
             }
             break;
         case INDEX_op_ext32s_i64:
@@ -817,9 +878,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_goto_tb:
             tci_args_l(&tb_ptr, &ptr);
-            tci_assert(tb_ptr == old_code_ptr + op_size);
             tb_ptr = *(void **)ptr;
-            continue;
+            break;
 
         case INDEX_op_qemu_ld_i32:
             if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
@@ -997,6 +1057,5 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         default:
             g_assert_not_reached();
         }
-        tci_assert(tb_ptr == old_code_ptr + op_size);
     }
 }
-- 
2.25.1


