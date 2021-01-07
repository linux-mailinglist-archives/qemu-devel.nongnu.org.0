Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207F2EE745
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:54:39 +0100 (CET)
Received: from localhost ([::1]:48824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcIo-000883-Du
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhd-0001Zo-JG
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:13 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbhS-0001iI-3N
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:16:09 -0500
Received: by mail-pf1-x436.google.com with SMTP id x126so4565703pfc.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sam4hUV/EzcXgGAJgfUtLyaqNJNq9uqdrP2iGsKVsYI=;
 b=skTYE0F0Zg0fkMENp0zyuOx4fQsQUWNTzohnhTFE2u7AJcuBh7LPDLKLcodru9eS8Q
 4GSgjCc2HWTH23ntldSaXFoWKd8b/3N/dSZNdOe7/iJ9jlDNXqkBdduSsdlWeb5ZJp5i
 8qhUq4CKWqd3eflJKAQYUV+dLia3PLAVkGYYE3GObE9Fzzx9bvtAU+IEmtgqv7tQaKOT
 /GjhqeY+elo7u4wng/jUJSE8pAmfq2WdP+YdHk4WvYNMK8bHyQqfyZwwRnvRu9d7pu7Z
 aPgcpnxaZO/3UjGZqP8wU3Md0IKZlGKH4tcDOIvZ8BJcgr9dPClOf/14mXrabXOMLjrs
 cBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sam4hUV/EzcXgGAJgfUtLyaqNJNq9uqdrP2iGsKVsYI=;
 b=J16QI1MRghbp4epx/55IVu9uqvGh1+vrpCisTMCxR91QzUyhwCdssk7iloRL0ZNBfT
 CvwP2RNrn0Hp4WOaMfofoZfyxXwy28qELWAbuL19ELjjLAyCvOl51Y4g+YA0kcJNM0zV
 OxqBrFlVNnnsRI6PdcerpV5ZnPd80aqcJM5wUiONa/yrdfOQlgfZR+EB2+QTPAyBMiRb
 Y1Ddbje3uYtkxW3LAuHlyQR5zF3vLDJ9CGzCvr97LpNLQeRHE1HJMt2wcfU9pDgIXhmQ
 5eLwL9rNLir4Fbhkep2Z8pKCw8T6QTo88RqjVN8z3ywn2rfgbcx2S80kaC5Vd05dbCok
 SIZw==
X-Gm-Message-State: AOAM530NyfXvut/Q4tO/D731ZlygXi9rhwLWvG8eau4Hx3LGcPWoA8nu
 J9b+OX/65u7IH6DhHxHzYdXhuz45MfECzA==
X-Google-Smtp-Source: ABdhPJyHfVqP5mDdD7Qn+o+/qsGe4kA11rd9f1i8Wn7xQjYcDOmcFSzRgtbkrWZX6usZUIfOvZZI+A==
X-Received: by 2002:a62:33c5:0:b029:1a1:c2f2:d771 with SMTP id
 z188-20020a6233c50000b02901a1c2f2d771mr3644961pfz.29.1610050557258; 
 Thu, 07 Jan 2021 12:15:57 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/47] tcg/riscv: Fix branch range checks
Date: Thu,  7 Jan 2021 10:14:39 -1000
Message-Id: <20210107201448.1152301-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The offset even checks were folded into the range check incorrectly.
By offsetting by 1, and not decrementing the width, we silently
allowed out of range branches.

Assert that the offset is always even instead.  Move tcg_out_goto
down into the CONFIG_SOFTMMU block so that it is not unused.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 0518595742..5b4c500a4b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -429,7 +429,8 @@ static bool reloc_sbimm12(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
 {
     intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
 
-    if (offset == sextreg(offset, 1, 12) << 1) {
+    tcg_debug_assert((offset & 1) == 0);
+    if (offset == sextreg(offset, 0, 12)) {
         code_ptr[0] |= encode_sbimm12(offset);
         return true;
     }
@@ -441,7 +442,8 @@ static bool reloc_jimm20(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
 {
     intptr_t offset = (intptr_t)target - (intptr_t)code_ptr;
 
-    if (offset == sextreg(offset, 1, 20) << 1) {
+    tcg_debug_assert((offset & 1) == 0);
+    if (offset == sextreg(offset, 0, 20)) {
         code_ptr[0] |= encode_ujimm20(offset);
         return true;
     }
@@ -854,28 +856,21 @@ static void tcg_out_setcond2(TCGContext *s, TCGCond cond, TCGReg ret,
     g_assert_not_reached();
 }
 
-static inline void tcg_out_goto(TCGContext *s, tcg_insn_unit *target)
-{
-    ptrdiff_t offset = tcg_pcrel_diff(s, target);
-    tcg_debug_assert(offset == sextreg(offset, 1, 20) << 1);
-    tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, offset);
-}
-
 static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
 {
     TCGReg link = tail ? TCG_REG_ZERO : TCG_REG_RA;
     ptrdiff_t offset = tcg_pcrel_diff(s, arg);
     int ret;
 
-    if (offset == sextreg(offset, 1, 20) << 1) {
+    tcg_debug_assert((offset & 1) == 0);
+    if (offset == sextreg(offset, 0, 20)) {
         /* short jump: -2097150 to 2097152 */
         tcg_out_opc_jump(s, OPC_JAL, link, offset);
-    } else if (TCG_TARGET_REG_BITS == 32 ||
-        offset == sextreg(offset, 1, 31) << 1) {
+    } else if (TCG_TARGET_REG_BITS == 32 || offset == (int32_t)offset) {
         /* long jump: -2147483646 to 2147483648 */
         tcg_out_opc_upper(s, OPC_AUIPC, TCG_REG_TMP0, 0);
         tcg_out_opc_imm(s, OPC_JALR, link, TCG_REG_TMP0, 0);
-        ret = reloc_call(s->code_ptr - 2, arg);\
+        ret = reloc_call(s->code_ptr - 2, arg);
         tcg_debug_assert(ret == true);
     } else if (TCG_TARGET_REG_BITS == 64) {
         /* far jump: 64-bit */
@@ -962,6 +957,13 @@ QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS < TARGET_LONG_BITS);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
 QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
 
+static void tcg_out_goto(TCGContext *s, tcg_insn_unit *target)
+{
+    tcg_out_opc_jump(s, OPC_JAL, TCG_REG_ZERO, 0);
+    bool ok = reloc_jimm20(s->code_ptr - 1, target);
+    tcg_debug_assert(ok);
+}
+
 static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
                              TCGReg addrh, TCGMemOpIdx oi,
                              tcg_insn_unit **label_ptr, bool is_load)
-- 
2.25.1


