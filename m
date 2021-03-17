Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC633F425
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:58 +0100 (CET)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYLx-0005xX-Hf
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCY-0005Gh-Io
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:14 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:44943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCQ-0007DQ-Ax
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:14 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso2156408oti.11
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TpmlYbNPO7F5/w02gLXULWpuaIOJTbsIcBvQlSSU3dc=;
 b=jMG9l2Zz8efmyFaYrutRjZONkWzG9uMcJ4YqOZzOOUwqWlkcU6evSj2dvyibJQXsHM
 9wlPYGgoSkj0tsmQP8Iq7qnZFNZ2vaNVqvehlprhmWi47ecFRS+eoxZ0uZjXOf0CXt1i
 P7JaZnGClzdeoiYcKdKOp9wsmmeXZ34sYv84ybT5bOb0L/hgALjKhcz6hDV2KoOV5Dol
 M30tWAQS8tGzSm4gOlExb64kZ2rgVvbsVoNv+l6OVmmEcG4S6rT6d7dDAFRIx4pR6+aa
 ukiApoXcS5JVmqftQ8hdVPwEXs5SHCtTbtrTqeUWWfC+AeHiSLAr8wb0Bl8tNDuWRZcM
 tPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TpmlYbNPO7F5/w02gLXULWpuaIOJTbsIcBvQlSSU3dc=;
 b=SWHNBi9Zd9KO+B9j5B9DtOv1VRVfZwV6ly0uwqmyxmXJ4oB9EFKpFwqRFVEsif10Om
 Z4Qn6iDAjhABAMmpLn+ckLXl9Ar5vhEZK20yd4QDRcRJYs99FCCQ/ExIxYHpewtBJC82
 RpRI7NtsamVMxoR2A1A3UmgJo7OyKSwFuLHWFUV7gceZRL6NeE0KnpKr5E/bAbaAiGXN
 QQjXosHBEIZC007eG3PSiP78+rCx0UPWLw0934l0+Iv/JBquvpFOUluqLJdaU9aDCslv
 zyX4FjDGpm6Tq2Ejgsxz9UvQFPSa8GmvAIF2OgEUB1Cq3rvFWm/tjxCWtj6XNKWqvvvD
 j0gw==
X-Gm-Message-State: AOAM533cVdtuO6uZTTqgvXoj0MGQtzPmggmaS91+kPZ8aWJRCEtqaJ+r
 VR98hl0/ajWJV8l3wkQH/hyo6LZgNsv0FrG5
X-Google-Smtp-Source: ABdhPJx4RofRHT7HB7Lc6kMAEyI4uvGzjy5OEiJowy2OfOw+oLHya7qHMfaonLhKQ97YikokxcZCGg==
X-Received: by 2002:a9d:6249:: with SMTP id i9mr3876797otk.166.1615995305203; 
 Wed, 17 Mar 2021 08:35:05 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/38] tcg/tci: Hoist op_size checking into tci_args_*
Date: Wed, 17 Mar 2021 09:34:25 -0600
Message-Id: <20210317153444.310566-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This performs the size check while reading the arguments,
which means that we don't have to arrange for it to be
done after the operation.  Which tidies all of the branches.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 14 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1aa63fae4d..b3e1c93ba8 100644
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
@@ -137,146 +137,217 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
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
 
@@ -425,10 +496,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
     for (;;) {
         TCGOpcode opc = tb_ptr[0];
-#if defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
-        uint8_t op_size = tb_ptr[1];
-        const uint8_t *old_code_ptr = tb_ptr;
-#endif
         TCGReg r0, r1, r2, r3;
         tcg_target_ulong t1;
         TCGCond condition;
@@ -478,7 +545,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_br:
             tci_args_l(&tb_ptr, &ptr);
-            tci_assert(tb_ptr == old_code_ptr + op_size);
             tb_ptr = ptr;
             continue;
         case INDEX_op_setcond_i32:
@@ -631,9 +697,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_brcond_i32:
             tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
             if (tci_compare32(regs[r0], regs[r1], condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
-                continue;
             }
             break;
 #if TCG_TARGET_REG_BITS == 32
@@ -654,7 +718,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             T1 = tci_uint64(regs[r1], regs[r0]);
             T2 = tci_uint64(regs[r3], regs[r2]);
             if (tci_compare64(T1, T2, condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
                 continue;
             }
@@ -788,9 +851,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_brcond_i64:
             tci_args_rrcl(&tb_ptr, &r0, &r1, &condition, &ptr);
             if (tci_compare64(regs[r0], regs[r1], condition)) {
-                tci_assert(tb_ptr == old_code_ptr + op_size);
                 tb_ptr = ptr;
-                continue;
             }
             break;
         case INDEX_op_ext32s_i64:
@@ -819,9 +880,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_goto_tb:
             tci_args_l(&tb_ptr, &ptr);
-            tci_assert(tb_ptr == old_code_ptr + op_size);
             tb_ptr = *(void **)ptr;
-            continue;
+            break;
 
         case INDEX_op_qemu_ld_i32:
             if (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS) {
@@ -999,6 +1059,5 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         default:
             g_assert_not_reached();
         }
-        tci_assert(tb_ptr == old_code_ptr + op_size);
     }
 }
-- 
2.25.1


