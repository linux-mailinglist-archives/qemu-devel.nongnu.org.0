Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD09C6F8AF0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:27:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vS-0000lq-PY; Fri, 05 May 2023 17:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vO-0000ix-TW
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:11 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vK-0004VO-IS
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:10 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso15659655e9.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321902; x=1685913902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bbEpaIXXaTgQeWDYcOIlkZ67YetPKNrTK/y3Em/irY=;
 b=wbHIUEm89CNyzcB3l5mPbcVXeuPl9l2q6/P7EW+gXW0dT1W8qPA/ibQ2KSY8ytXaxC
 HEZip7nBE6vzmF1Wto33UtcCHjYO2DGGunm+YVQjXdowuqY4GOuCTX16cfqo4PlM/a6S
 WiayI6mVbM8ZdtQEzJvft2uJAdXyyGQbzZFlx4jT8vLUuwH3ePGM0Uzzh3H3eR3eLWuQ
 Taz87ViPx7mn85BviitQiSf2iGqj+9VntCxkVviNZW6ADFOKOrkqwsZXjNqmh0TEvxU2
 QsUtsJFHP179m/VfXrhtHeF6MzB6dBIK31RqwtLGFj5G8QXzNxhR9E+t7+3A9Eyn3AGI
 lrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321902; x=1685913902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1bbEpaIXXaTgQeWDYcOIlkZ67YetPKNrTK/y3Em/irY=;
 b=WicaaaLFJII/irJFvFUTjOfCHZhs/8hwJSPsU3G4CcJeD/dYfaLPb2cLQ/bUoxqiHS
 4GyB110VdrGgTWHfTb4HiE1L7+hrbnt8orxJqcTlfxxCjPzFzIQQuvcsELbkJHSdpaQq
 0FYcoCrzn/vi7fl1+JlKpng7qRz2A5/2y4NY1NMp1z8wI2zSFXnpCZ/rPC+3SmopO7S6
 meXENkho/j1c0+NR+WazmSKKuLh5PXgEqlvr7udfTP6T+hUcYTFeTxJh2H3n6W0Bkgov
 yrXw4m4UxIcwk0sL+gDFUQ6u0km7HNJRWfqIKhHHsslmIJxsSqVDZX/OlI4I92VFUNn2
 Nn3Q==
X-Gm-Message-State: AC+VfDx5PCQg7af+ybHPXyKywaY6DUiqGzRz4n8wzxPiQmg1Q4I6QYbK
 jiD87+VfwOHiwywOI92RTH5CN8X2AW6wee4UxHtA5Q==
X-Google-Smtp-Source: ACHHUZ6rWqjJWKy0k8Jc2aeFy4GV+BPbIsPLmqG6LVmzQRkHDnLFdaAD25xHVsHNhJRtw4WaE5UALQ==
X-Received: by 2002:a1c:7408:0:b0:3f3:2ba9:94d1 with SMTP id
 p8-20020a1c7408000000b003f32ba994d1mr1975102wmc.20.1683321902562; 
 Fri, 05 May 2023 14:25:02 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:25:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 25/42] tcg/aarch64: Introduce HostAddress
Date: Fri,  5 May 2023 22:24:30 +0100
Message-Id: <20230505212447.374546-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Collect the 3 potential parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st}_direct to use it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 86 +++++++++++++++++++++++++-----------
 1 file changed, 59 insertions(+), 27 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ecbf6564fc..d8d464e4a0 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1587,6 +1587,12 @@ static void tcg_out_adr(TCGContext *s, TCGReg rd, const void *target)
     tcg_out_insn(s, 3406, ADR, rd, offset);
 }
 
+typedef struct {
+    TCGReg base;
+    TCGReg index;
+    TCGType index_ext;
+} HostAddress;
+
 #ifdef CONFIG_SOFTMMU
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     MemOpIdx oi, uintptr_t ra)
@@ -1796,32 +1802,31 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
-                                   TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   TCGReg data_r, HostAddress h)
 {
     switch (memop & MO_SSIZE) {
     case MO_UB:
-        tcg_out_ldst_r(s, I3312_LDRB, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRB, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_SB:
         tcg_out_ldst_r(s, ext ? I3312_LDRSBX : I3312_LDRSBW,
-                       data_r, addr_r, otype, off_r);
+                       data_r, h.base, h.index_ext, h.index);
         break;
     case MO_UW:
-        tcg_out_ldst_r(s, I3312_LDRH, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRH, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_SW:
         tcg_out_ldst_r(s, (ext ? I3312_LDRSHX : I3312_LDRSHW),
-                       data_r, addr_r, otype, off_r);
+                       data_r, h.base, h.index_ext, h.index);
         break;
     case MO_UL:
-        tcg_out_ldst_r(s, I3312_LDRW, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRW, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_SL:
-        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRSWX, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_UQ:
-        tcg_out_ldst_r(s, I3312_LDRX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_LDRX, data_r, h.base, h.index_ext, h.index);
         break;
     default:
         g_assert_not_reached();
@@ -1829,21 +1834,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp memop, TCGType ext,
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
-                                   TCGReg data_r, TCGReg addr_r,
-                                   TCGType otype, TCGReg off_r)
+                                   TCGReg data_r, HostAddress h)
 {
     switch (memop & MO_SIZE) {
     case MO_8:
-        tcg_out_ldst_r(s, I3312_STRB, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRB, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_16:
-        tcg_out_ldst_r(s, I3312_STRH, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRH, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_32:
-        tcg_out_ldst_r(s, I3312_STRW, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRW, data_r, h.base, h.index_ext, h.index);
         break;
     case MO_64:
-        tcg_out_ldst_r(s, I3312_STRX, data_r, addr_r, otype, off_r);
+        tcg_out_ldst_r(s, I3312_STRX, data_r, h.base, h.index_ext, h.index);
         break;
     default:
         g_assert_not_reached();
@@ -1855,6 +1859,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 {
     MemOp memop = get_memop(oi);
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    HostAddress h;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
@@ -1863,8 +1868,14 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     tcg_insn_unit *label_ptr;
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 1);
-    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
-                           TCG_REG_X1, addr_type, addr_reg);
+
+    h = (HostAddress){
+        .base = TCG_REG_X1,
+        .index = addr_reg,
+        .index_ext = addr_type
+    };
+    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg, h);
+
     add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
@@ -1873,12 +1884,19 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
     if (USE_GUEST_BASE) {
-        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
-                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
+        h = (HostAddress){
+            .base = TCG_REG_GUEST_BASE,
+            .index = addr_reg,
+            .index_ext = addr_type
+        };
     } else {
-        tcg_out_qemu_ld_direct(s, memop, data_type, data_reg,
-                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
+        h = (HostAddress){
+            .base = addr_reg,
+            .index = TCG_REG_XZR,
+            .index_ext = TCG_TYPE_I64
+        };
     }
+    tcg_out_qemu_ld_direct(s, memop, data_type, data_reg, h);
 #endif /* CONFIG_SOFTMMU */
 }
 
@@ -1887,6 +1905,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
 {
     MemOp memop = get_memop(oi);
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    HostAddress h;
 
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((memop & MO_BSWAP) == 0);
@@ -1895,8 +1914,14 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     tcg_insn_unit *label_ptr;
 
     tcg_out_tlb_read(s, addr_reg, memop, &label_ptr, get_mmuidx(oi), 0);
-    tcg_out_qemu_st_direct(s, memop, data_reg,
-                           TCG_REG_X1, addr_type, addr_reg);
+
+    h = (HostAddress){
+        .base = TCG_REG_X1,
+        .index = addr_reg,
+        .index_ext = addr_type
+    };
+    tcg_out_qemu_st_direct(s, memop, data_reg, h);
+
     add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
@@ -1905,12 +1930,19 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
         tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
     if (USE_GUEST_BASE) {
-        tcg_out_qemu_st_direct(s, memop, data_reg,
-                               TCG_REG_GUEST_BASE, addr_type, addr_reg);
+        h = (HostAddress){
+            .base = TCG_REG_GUEST_BASE,
+            .index = addr_reg,
+            .index_ext = addr_type
+        };
     } else {
-        tcg_out_qemu_st_direct(s, memop, data_reg,
-                               addr_reg, TCG_TYPE_I64, TCG_REG_XZR);
+        h = (HostAddress){
+            .base = addr_reg,
+            .index = TCG_REG_XZR,
+            .index_ext = TCG_TYPE_I64
+        };
     }
+    tcg_out_qemu_st_direct(s, memop, data_reg, h);
 #endif /* CONFIG_SOFTMMU */
 }
 
-- 
2.34.1


