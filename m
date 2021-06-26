Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D83B4D48
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 08:58:40 +0200 (CEST)
Received: from localhost ([::1]:59394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx2H1-0000Ji-Iy
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 02:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1w0-0002cd-JL
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:56 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:42703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lx1vv-0000VK-JL
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 02:36:56 -0400
Received: by mail-pl1-x62a.google.com with SMTP id v13so5858186ple.9
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 23:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gGg4VMcdZ5rhfpaP9NuMbgcNxZ47zeyC7JQnFmoSmmk=;
 b=ri2lzw+mRDTFBPhn23qPUxbBQ8cWMcoTPZ13kdjw2wTAtJaZ2nzIuOlj4r7llWTZrO
 1I3N5sqyI9JpCaK8EzrZLsPXIQbuc2iIpTVCsmKmoFC0bIFAHZNz2WibCsnHHbopLBJN
 /I2uCmD0kcftcKqBPx24EPDq8Jm7autm9lGdDMjY2AKZspt/v9hgmxleTjN58J2upmoc
 T/8Jw8zn6RjmADppzUTTF4F8C9TERXbcg2wTIJQzIi+AM1fhYufnW1wzWSNhqFyJkQuo
 5W15Uzc6P5lSvOQJk32NCdFUnh+GHUfDwBFZqk4e5SFv4xy5sSZUajvQpKaMu0rGu6W8
 Wn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gGg4VMcdZ5rhfpaP9NuMbgcNxZ47zeyC7JQnFmoSmmk=;
 b=Gx/c29TS1OLmaica3FOGVmb4ofQG2n1DB0KhcTxe9MtcoJikiEDh5enCZWXEIkhCBU
 qyKP31ae3K1G/Xzk8G1UADIlQq/lvIj786t8Z5hjAUyOHtFG8ej4Y8BYgUkZvdJZUhNm
 RcSEzd7gVxWJKQFAiWuN82XQ5lDyEAd7kekXOCzKvxhZYI+N3MTI/21IOhk6pTWYquCa
 +NgHaBQaswrQG3eGozYDJTy1eBjEW2cl5OytMMG8V4JJ/hWmhmcfXCkAyTbLddcKbYUn
 GefOyvk6uLvNi5XNcdueZL/4bE+fQx7UOdj7h5yi/MVEy3bWEI2lXvvKPqGczfnqUJhU
 yx2g==
X-Gm-Message-State: AOAM530QWJLd7LjorwAIss8FBMLa6PY6V2JVzm+yZjERWEde90Y/88d1
 PRrotp1YB7A3QMkeXkYQtCVbk6hF0/AP/g==
X-Google-Smtp-Source: ABdhPJwBJvRTHvzjTUAGEiS5mcQJTIVuulW4PbIOl/sm2cOKyqCZkGd3gNy46tGkP3FCWLMtIj+qag==
X-Received: by 2002:a17:902:7615:b029:128:af2b:ffac with SMTP id
 k21-20020a1709027615b0290128af2bffacmr2373782pll.60.1624689410223; 
 Fri, 25 Jun 2021 23:36:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v9sm7724201pgq.54.2021.06.25.23.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 23:36:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/29] tcg/riscv: Remove MO_BSWAP handling
Date: Fri, 25 Jun 2021 23:36:31 -0700
Message-Id: <20210626063631.2411938-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210626063631.2411938-1-richard.henderson@linaro.org>
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
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


