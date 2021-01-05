Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D832EB1F4
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:05:43 +0100 (CET)
Received: from localhost ([::1]:42790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqiF-0006X1-2t
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0t-0002rX-TV
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:55 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0r-0006iO-Ub
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:55 -0500
Received: by mail-pl1-x62a.google.com with SMTP id q4so57354plr.7
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sam4hUV/EzcXgGAJgfUtLyaqNJNq9uqdrP2iGsKVsYI=;
 b=nfb0yi4j7KUzFliBn3KDEDyE2nptEtrrGI0Y57352g+zIWM1TXeLp+55gbr0q6bSkk
 TDbv70DdMtX5Zrg5nDTPdytf7ulh/1n+cSLq7wAFSo9sECmTg1oMjPrgXpcjlsEie2qZ
 ekHoMk2S/ovV3a3JS2U2/m7PHCbyZP3nG8eZ7fP39XzI+BGdr6HjFA4NQNTCzPg4YQnF
 1lqWHmuRlGFQc2FG2fs/C9pnRVohOIRNFk86DxYTT3W/ms0GqP/G6ASH0lLGVTchBVCQ
 M3URo66QzxlmaDR5CtupMVFwbuX4IYkQLpPGDITVmCaf2+viG0HVz7MuBWfLxRXYd0n9
 Rn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sam4hUV/EzcXgGAJgfUtLyaqNJNq9uqdrP2iGsKVsYI=;
 b=FknBtlKh6uGy/AgObJ/MVLsfXYRsAR9qx1Z+38Ti2tKaPh06w9oUHgVU71q9jc9/qa
 FreFkedhwwv/hy/yGJUbwdk18e7B7AlrIsZTMY5W8bejKoiLEtnhh6aETgQ4wIGSfI4r
 EHIN8YRMbiYrP53Ey0me9eziL1txArq5RBEMFELUgslHltJyNALyBdQK++BddjkuquJC
 RKCxxhgGVgfTIGcLWjpLrYntiCfPwflHvEPITWOfBDaBe7V63Xz6PGuJA5k7dnW4vg/i
 63QFKm3nSPiK8Bt+7fpEBuuvIiANjYdzMncC3BikBeY8n3DxEQjHsF9saqmGlmhxCSDL
 h2TA==
X-Gm-Message-State: AOAM532LSGXbYwWeoA56m7kmfoOLTnwXplAa6A2gKCGvUw1CMFGaZ96I
 i1vsPCFpN9F4BP4wzjCbYvOeUX47y/wQLg==
X-Google-Smtp-Source: ABdhPJy8L5PxAReaZMWpBF2w7SjVY/WreX1aMq9Bd+P7IwNWt4PsaivOr5HuYIrmm6Q7CVFBAD+SSA==
X-Received: by 2002:a17:902:b584:b029:dc:1425:e5af with SMTP id
 a4-20020a170902b584b02900dc1425e5afmr343278pls.3.1609867252257; 
 Tue, 05 Jan 2021 09:20:52 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 34/43] tcg/riscv: Fix branch range checks
Date: Tue,  5 Jan 2021 07:19:41 -1000
Message-Id: <20210105171950.415486-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>
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


