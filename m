Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D364AAEDE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:37:59 +0100 (CET)
Received: from localhost ([::1]:36602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeve-00028H-2u
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:37:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepi-0004TU-Cv
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:50 -0500
Received: from [2607:f8b0:4864:20::52a] (port=33470
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGepg-0002Nr-8g
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:31:49 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 77so6223829pgc.0
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 02:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aVBv6wXuSbvaamtrblJpDcCL0BFzSBoSOUStalUh64I=;
 b=iDqTqcAcJUrN6B7JmxYsW/Or4AhFTMD0r05xC4UO8D8pljCPLTaDbUCv+F0zG1TUIi
 3GAy4mo7g2vEO19J1rlHikP6z7KhEuqhoXCANjHk8sdlS5kqPkzxZ9sNsSDbiue2t7Hj
 qwrv6Wfauz1o6K5PapaVFdHJF6BZCvtPQRbs7DcOPHEN0qEXJ0IdyvgqpVWLQ0wMxaoO
 4IXu4aTRlODnn3d3J+pFz3CJ6VQY9Hy/l4V2RsyHvYkHSC/GmaAD7vxpd0Z/bsXpvFXO
 bA4MZGSGEChLK320h8pb3pyLVNrcs/RPVZagnq3xOxy9CwdHFnhYHGhzFx29sSOkBQ04
 L40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aVBv6wXuSbvaamtrblJpDcCL0BFzSBoSOUStalUh64I=;
 b=pCJffqVSM59x8C1BpIjcE7o+xQrMKe0+XVJhggcay7AUYY7yqzC0RL8y+jr73v3OQA
 S/ONnkY19fHWN52Ms1XJ3UfTR7Hj4Z0DFnQK8UJLQ5oStA9Gdqz6LgE4p3a0jArHx1EB
 OeoCjGz9BwhxneK3DQpzt9+B6UqpNEIfGr3HfHtv1LmNKbx+yRkwiuPD9eboCZzX8B6i
 DZipfULiTDgxIMMPhFYTG6JbbS+MMNMywD1gbx1e/VhW93Fx51jNTMs5asA9q3aG36ez
 x/RVMU5jwsS4FA8RkZ/tYa6qIkIxq1OPjWRRRytW5sLnUVr/DI+UaAf5EoptdyJT5Blz
 pEaw==
X-Gm-Message-State: AOAM530O0g7buzD4PAGrrc1XMkYtpUeI2vPbC/BYXostXMdGNppITNi6
 EXEqO8u8gMmRUS0NjAaYNfo2vFmwJzE405Ah
X-Google-Smtp-Source: ABdhPJxLcBDtsfKfFioFDD4YBicZYviDKkxX/jsJD4+DjcU/sTaZPk0/bzB8GOObPpvUjsoL/hZA6Q==
X-Received: by 2002:a63:8049:: with SMTP id j70mr931477pgd.295.1644143506756; 
 Sun, 06 Feb 2022 02:31:46 -0800 (PST)
Received: from localhost.localdomain ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id s2sm5605937pgl.21.2022.02.06.02.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 02:31:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/6] tcg/sparc: Add scratch argument to tcg_out_movi_int
Date: Sun,  6 Feb 2022 21:31:33 +1100
Message-Id: <20220206103138.36105-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206103138.36105-1-richard.henderson@linaro.org>
References: <20220206103138.36105-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to control exactly what scratch register is
used for loading the constant.  Also, fix a theoretical problem
in recursing through tcg_out_movi, which may provide a different
value for in_prologue.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc/tcg-target.c.inc | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index 0c062c60eb..8c3671f56a 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -414,7 +414,8 @@ static void tcg_out_movi_imm13(TCGContext *s, TCGReg ret, int32_t arg)
 }
 
 static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
-                             tcg_target_long arg, bool in_prologue)
+                             tcg_target_long arg, bool in_prologue,
+                             TCGReg scratch)
 {
     tcg_target_long hi, lo = (int32_t)arg;
     tcg_target_long test, lsb;
@@ -471,22 +472,25 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
     /* A 64-bit constant decomposed into 2 32-bit pieces.  */
     if (check_fit_i32(lo, 13)) {
         hi = (arg - lo) >> 32;
-        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
+        tcg_out_movi_int(s, TCG_TYPE_I32, ret, hi, in_prologue, scratch);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
         tcg_out_arithi(s, ret, ret, lo, ARITH_ADD);
     } else {
+        tcg_debug_assert(scratch != TCG_REG_G0);
         hi = arg >> 32;
-        tcg_out_movi(s, TCG_TYPE_I32, ret, hi);
-        tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_T2, lo);
+        tcg_out_movi_int(s, TCG_TYPE_I32, ret, hi, in_prologue, scratch);
+        tcg_out_movi_int(s, TCG_TYPE_I32, scratch, lo, in_prologue, TCG_REG_G0);
         tcg_out_arithi(s, ret, ret, 32, SHIFT_SLLX);
-        tcg_out_arith(s, ret, ret, TCG_REG_T2, ARITH_OR);
+        tcg_out_arith(s, ret, ret, scratch, ARITH_OR);
     }
 }
 
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
-    tcg_out_movi_int(s, type, ret, arg, false);
+    /* When outputting to T2, we have no scratch available. */
+    TCGReg scratch = ret != TCG_REG_T2 ? TCG_REG_T2 : TCG_REG_G0;
+    tcg_out_movi_int(s, type, ret, arg, false, scratch);
 }
 
 static void tcg_out_ldst_rr(TCGContext *s, TCGReg data, TCGReg a1,
@@ -837,7 +841,7 @@ static void tcg_out_call_nodelay(TCGContext *s, const tcg_insn_unit *dest,
     } else {
         uintptr_t desti = (uintptr_t)dest;
         tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                         desti & ~0xfff, in_prologue);
+                         desti & ~0xfff, in_prologue, TCG_REG_O7);
         tcg_out_arithi(s, TCG_REG_O7, TCG_REG_T1, desti & 0xfff, JMPL);
     }
 }
@@ -1013,7 +1017,8 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
 #ifndef CONFIG_SOFTMMU
     if (guest_base != 0) {
-        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base, true);
+        tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_GUEST_BASE_REG, guest_base,
+                         true, TCG_REG_T1);
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
 #endif
-- 
2.25.1


