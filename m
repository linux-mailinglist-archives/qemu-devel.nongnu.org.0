Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870D53B78C2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:37:38 +0200 (CEST)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJY9-0000uq-H2
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwl-0004JR-2k
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:59 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwT-000345-67
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:58 -0400
Received: by mail-pl1-x634.google.com with SMTP id i4so24834plt.12
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gGg4VMcdZ5rhfpaP9NuMbgcNxZ47zeyC7JQnFmoSmmk=;
 b=dLYUDXdf0ws/tBwTOExLWMVQMtTG+svLnICiTQmeT4gSIpSHixW4oc6VlBb/9pRz6z
 Cx1xpoj5PKxzYszSMJXQh5m5Ueh2W8We/78HOlIigVtdv7audH4I+KKu9iwjYGULPfpU
 XaqGxVWBNVKBHbiLKmIssfsC8xn9K5J9LB2IRkx3Ej/rmRBx/TjKhMhCvYYFT4gl8PKw
 J78tfhDSibmt3Ib+kOOEISnnEOkI5KQMxMfcVqNMjZbFG0+8Ce//ltZrVSacoO5f1RcE
 DJXnaOOurr7CMAh8Bja9hEAAoZ5usvOnW/awvOa+wLEOjTKO/An2gyTwc9561LtKFkQi
 5gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gGg4VMcdZ5rhfpaP9NuMbgcNxZ47zeyC7JQnFmoSmmk=;
 b=PaldBWXKhsMexNEq8Fs/sQ9j9fwxoXpmAv2yPEeKYL6vEUpjNaoEqWyp395x/aeMHF
 6yPpqatELipsRDyKJUDky1i+aqYG12ZJQJgoW60y0AQpDcZlyWWqz3wZmIOQFLgPBHRI
 1jFjzaIHUeM7DNayBv+hkVMtLvdS2d9biPNX8FzzAelmNDOwDZH7whGqPisQNubWXg6J
 E60P3rLU/lWn1XDt1bnURziJAGVyQv0fUMp5RMqeXsoeHObGtEKoSGNsVTPXKs44Zz+Y
 a/9uLsW2A4412jIvxPxVgx1V5cArGmGYmMXpq2MGPpqTaKQj2G6ecJd2gapGjEBryUJU
 L9yg==
X-Gm-Message-State: AOAM532xl9agdJRr6Gi0L8a3r8EOAR7mDfUAhtX9sGfoD9tcJz5pnCe6
 Nmemd/iJQq3gfJqzhV+zMASC2h5la/U5AA==
X-Google-Smtp-Source: ABdhPJxtolohp3hG6t1UOhpebNcHRXctEYAm7RuNRVUvyZLe61Sn5DgBm8DZjkzvH+K0erILJ54a6A==
X-Received: by 2002:a17:902:7c18:b029:117:e575:473e with SMTP id
 x24-20020a1709027c18b0290117e575473emr29054929pll.37.1624993120065; 
 Tue, 29 Jun 2021 11:58:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 63/63] tcg/riscv: Remove MO_BSWAP handling
Date: Tue, 29 Jun 2021 11:54:55 -0700
Message-Id: <20210629185455.3131172-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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


