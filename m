Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8560F2D99A0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:19:37 +0100 (CET)
Received: from localhost ([::1]:59918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koohM-0003wC-I4
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSl-0002N1-1O
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:34 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSU-00041n-Rv
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:04:28 -0500
Received: by mail-ot1-x342.google.com with SMTP id a109so15759084otc.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cOhvs0ghq8muGX3iEeRtFXrjJiLy3u5yfl5gf+ftseU=;
 b=DugRX87tAwJ4ZhsF0NikzXI95oQ+vkzCv0IZKKaZ4bg5+6CE77GhX6d0bNAXrF54rN
 vjNAtuiTOwogrGWJ3pCCMe1u6QfLgp84xJWZec8V7Ar/Y82u/vAjafPMqZIsBWxosfLq
 RS8BiUPLf1ZxoSMJInnjlONnDl6sDVDmZGUgqkvlm0KU/uHcuTrluUMRNPQsFCiIJbVC
 ke2lLcow6+je8a1fPERTEKxXRSNHZw+kRWXmddVegM6ZvEcsCFf8KTKdO4+Gtm9IaWJu
 Wdb9xBj7IzPYctOC0U90hm53vC5FqjVSagud5coW3d3d6k2qAuJ+woeHqIqvT6/H9Eyx
 SkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cOhvs0ghq8muGX3iEeRtFXrjJiLy3u5yfl5gf+ftseU=;
 b=XkbZylWrHXT4Y0ZU6J1MM0nXiwoOVjkuvmsWYKmK7cfSK/b3x6esJiWO6rS/M/MLrR
 LbQ2RPO7u2RVquCxWbovwC0Ntf4VS0k11BNTFaGiJEi+UQ5+oMg7x88qA9oYf0A09v6R
 vaHRW0UBYoP2/WfZKNapoRCxgiPh1Op7YkrAtWQYUhgLo2E/813tRNcSQSFnRKY2C3VH
 NjEXsjX9jg3KRug6jTVEIfuNGLQFE5HnVPHky9lqV86+oG92I/f9mzUCR09R87QZWjzg
 1LQt3jTmLfJ0mKXbj2sOscMqK8C80RdA6OMS0gugjnXYrmBp7BzFxhcivS0Rsze9dJT3
 lEcw==
X-Gm-Message-State: AOAM531s6Uy5z7yPFLmJXXsVAvZtc8SqvJ9xrQh3+Y5f1r97iEG4h4mv
 SvxdiIiSXDG9uTImX9ALPv5PQ0lhy5HVoHE3
X-Google-Smtp-Source: ABdhPJwA7oAmiBCc0RdQIQDO2R8l5+MS1juEINyYIFPlBkC1/PXAqSQzM53BFS9xdvNc1jgjuf0h2A==
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr11273698otb.303.1607954653170; 
 Mon, 14 Dec 2020 06:04:13 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.04.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:04:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 34/43] tcg/riscv: Fix branch range checks
Date: Mon, 14 Dec 2020 08:03:05 -0600
Message-Id: <20201214140314.18544-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The offset even checks were folded into the range check incorrectly.
By offsetting by 1, and not decrementing the width, we silently
allowed out of range branches.

Assert that the offset is always even instead.  Move tcg_out_goto
down into the CONFIG_SOFTMMU block so that it is not unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 025e3cd0bb..195c3eff03 100644
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


