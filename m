Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D46D3AF9A2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:41:09 +0200 (CEST)
Received: from localhost ([::1]:37450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTXQ-0003Nm-Ki
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTCE-0001Pj-GB
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:14 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTCA-000654-HN
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:14 -0400
Received: by mail-pf1-x42a.google.com with SMTP id t32so3515920pfg.2
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gGg4VMcdZ5rhfpaP9NuMbgcNxZ47zeyC7JQnFmoSmmk=;
 b=rE1mPB+O0FysM7myJdsr5EkFossAGea9wvyGlPGKcUtS0Etx/wPba7W6+PzxRbRLbq
 9yXpfdK0zRNb7Q9d2b1ffNTBH6qdsVUGvFaX5qNodO+fG1r8YHTWzB2SkshVIMO6yw8O
 lrMv2VWmc3qHZuFJ1YKgtn0QWahhDsI3HlKEsFLjVaI9d8qAsG4a0qbOc7IK/4wKyE3h
 iuMP8QEjqBeYBkeJnz6+8k969y3iYruWAzt8c5mHQEYZbTqtspP0+XW+lMIsbKHl4KdF
 u+iW5tsgm2m97HFQLTsuz31/XSr4Ifa5+lAGA3uAn4QJpjpSZBnlDF4JSDtHiI17pjBW
 /kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gGg4VMcdZ5rhfpaP9NuMbgcNxZ47zeyC7JQnFmoSmmk=;
 b=fNxm0lgr+EhjG13jGo4/34oDdkdNZtZJnuxoG78xjRYQ3CTY7rtolPDtLHg8ODT9f2
 KiEnSVvna+2Q7w4Lv894RtuW/WW21FJJVmRta1zUwiCEWCyQA8EZyYvgMiTswuQBEcob
 tMLSIX6xOjoDquz/aOpYXa7hiTqzLY5eOxApE4zDMsFu+SYt7nO6B8+kMNAmZd4ab1ph
 lmnyCos/1PVLpWfUtAjMaVJ2KXDvXO84MZwH+lwWRzf8XE74aJNIZfY2MhCUk9nFmcAy
 23szw07FRmZY3KGqubXC2f7u7bftAQJJXp2Jpv4XKIxEtAMvotjBimEo0N2kpUQb/vmf
 enZg==
X-Gm-Message-State: AOAM532/FqMiOcH/UgZI+BQjofWcs511bxkJnwhiF8M21MT9dCstkdmx
 Tp5ZclAyonlSVapUj+usMZMF2ua7v6LqkQ==
X-Google-Smtp-Source: ABdhPJxVjYxv2D1XXO1GFmMURV8IiucYjh4iYdjUcCmW7gNdbt56nbghSu3tMeGOAwkb7NfbYoR4DA==
X-Received: by 2002:a62:1c86:0:b029:2fe:b583:6418 with SMTP id
 c128-20020a621c860000b02902feb5836418mr585783pfc.23.1624317549331; 
 Mon, 21 Jun 2021 16:19:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/29] tcg/riscv: Remove MO_BSWAP handling
Date: Mon, 21 Jun 2021 16:18:49 -0700
Message-Id: <20210621231849.1871164-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

TCG_TARGET_HAS_MEMORY_BSWAP is already unset for this backend,
which means that MO_BSWAP be handled by the middle-end and
will never be seen by the backend.  Thus the indexes used with
qemu_{ld,st}_helpers will always be zero.

Tidy the comments and asserts in tcg_out_qemu_{ld,st}_direct.
It is not that we do not handle bswap "yet", but never will.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 64 ++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index da7eecafc5..c16f96b401 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -852,37 +852,43 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     TCGMemOpIdx oi, uintptr_t ra)
  */
-static void * const qemu_ld_helpers[16] = {
-    [MO_UB]   = helper_ret_ldub_mmu,
-    [MO_SB]   = helper_ret_ldsb_mmu,
-    [MO_LEUW] = helper_le_lduw_mmu,
-    [MO_LESW] = helper_le_ldsw_mmu,
-    [MO_LEUL] = helper_le_ldul_mmu,
+static void * const qemu_ld_helpers[8] = {
+    [MO_UB] = helper_ret_ldub_mmu,
+    [MO_SB] = helper_ret_ldsb_mmu,
+#ifdef HOST_WORDS_BIGENDIAN
+    [MO_UW] = helper_be_lduw_mmu,
+    [MO_SW] = helper_be_ldsw_mmu,
+    [MO_UL] = helper_be_ldul_mmu,
 #if TCG_TARGET_REG_BITS == 64
-    [MO_LESL] = helper_le_ldsl_mmu,
+    [MO_SL] = helper_be_ldsl_mmu,
 #endif
-    [MO_LEQ]  = helper_le_ldq_mmu,
-    [MO_BEUW] = helper_be_lduw_mmu,
-    [MO_BESW] = helper_be_ldsw_mmu,
-    [MO_BEUL] = helper_be_ldul_mmu,
+    [MO_Q]  = helper_be_ldq_mmu,
+#else
+    [MO_UW] = helper_le_lduw_mmu,
+    [MO_SW] = helper_le_ldsw_mmu,
+    [MO_UL] = helper_le_ldul_mmu,
 #if TCG_TARGET_REG_BITS == 64
-    [MO_BESL] = helper_be_ldsl_mmu,
+    [MO_SL] = helper_le_ldsl_mmu,
+#endif
+    [MO_Q]  = helper_le_ldq_mmu,
 #endif
-    [MO_BEQ]  = helper_be_ldq_mmu,
 };
 
 /* helper signature: helper_ret_st_mmu(CPUState *env, target_ulong addr,
  *                                     uintxx_t val, TCGMemOpIdx oi,
  *                                     uintptr_t ra)
  */
-static void * const qemu_st_helpers[16] = {
-    [MO_UB]   = helper_ret_stb_mmu,
-    [MO_LEUW] = helper_le_stw_mmu,
-    [MO_LEUL] = helper_le_stl_mmu,
-    [MO_LEQ]  = helper_le_stq_mmu,
-    [MO_BEUW] = helper_be_stw_mmu,
-    [MO_BEUL] = helper_be_stl_mmu,
-    [MO_BEQ]  = helper_be_stq_mmu,
+static void * const qemu_st_helpers[4] = {
+    [MO_8]   = helper_ret_stb_mmu,
+#ifdef HOST_WORDS_BIGENDIAN
+    [MO_16] = helper_be_stw_mmu,
+    [MO_32] = helper_be_stl_mmu,
+    [MO_64] = helper_be_stq_mmu,
+#else
+    [MO_16] = helper_le_stw_mmu,
+    [MO_32] = helper_le_stl_mmu,
+    [MO_64] = helper_le_stq_mmu,
+#endif
 };
 
 /* We don't support oversize guests */
@@ -997,7 +1003,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_movi(s, TCG_TYPE_PTR, a2, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, a3, (tcg_target_long)l->raddr);
 
-    tcg_out_call(s, qemu_ld_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
+    tcg_out_call(s, qemu_ld_helpers[opc & MO_SSIZE]);
     tcg_out_mov(s, (opc & MO_SIZE) == MO_64, l->datalo_reg, a0);
 
     tcg_out_goto(s, l->raddr);
@@ -1042,7 +1048,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_movi(s, TCG_TYPE_PTR, a3, oi);
     tcg_out_movi(s, TCG_TYPE_PTR, a4, (tcg_target_long)l->raddr);
 
-    tcg_out_call(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SSIZE)]);
+    tcg_out_call(s, qemu_st_helpers[opc & MO_SIZE]);
 
     tcg_out_goto(s, l->raddr);
     return true;
@@ -1052,10 +1058,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
                                    TCGReg base, MemOp opc, bool is_64)
 {
-    const MemOp bswap = opc & MO_BSWAP;
-
-    /* We don't yet handle byteswapping, assert */
-    g_assert(!bswap);
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & (MO_SSIZE)) {
     case MO_UB:
@@ -1139,10 +1143,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
                                    TCGReg base, MemOp opc)
 {
-    const MemOp bswap = opc & MO_BSWAP;
-
-    /* We don't yet handle byteswapping, assert */
-    g_assert(!bswap);
+    /* Byte swapping is left to middle-end expansion. */
+    tcg_debug_assert((opc & MO_BSWAP) == 0);
 
     switch (opc & (MO_SSIZE)) {
     case MO_8:
-- 
2.25.1


