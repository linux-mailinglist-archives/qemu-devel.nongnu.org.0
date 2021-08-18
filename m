Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A64B3F0D79
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:38:43 +0200 (CEST)
Received: from localhost ([::1]:33742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTGk-0003Ne-3P
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7h-0005lo-AG
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:21 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7f-0005iz-N0
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:21 -0400
Received: by mail-pl1-x630.google.com with SMTP id l11so2673228plk.6
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+U0KsNEvHwE3GkrSYf995PkcGQk0Ki7THUCDOfcXQAU=;
 b=iXI+M9xYljG+sw2vUV32d0yZyvTFVLbjBsiNcH6FgxD6uZ/DcHv8FqRQoW6W7PMAxT
 pDo+XhNfQOgPlkZ8PLj6LREErixoQnRzzGVrJhC+eFExJx1JqcEd2LcEbcb3Db/Ic9ba
 hlPyXWZrhkH2DZdrYn56futSVzoCK0OVMSG5DOkCD4GGTY+p47ITEwrR5RIlwtSydyuq
 IzMZ7Izz9DSA1CcMwO0xKBKcM0p7ZxxvQ732uZxpZZATkFr3QFqVb4DwsCnUT+UCIeQR
 nDKpnVMfSWNMn4TIHemJhnRqPA2lOtfTBygAaRxa3P01vx377NJrWH9klBzRC/xH1au7
 T7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+U0KsNEvHwE3GkrSYf995PkcGQk0Ki7THUCDOfcXQAU=;
 b=s+b/yLxY9ws23AtwJ0zD8Pp8F5U5FT3JRxegV5yPDJXQZaGxcNm6tG29rWlqoxrTrf
 1so/f4/Otio8zXjopL1PTa9Nb53gTbDq1Jl7qyw+B6UW7iC7w12pIbu0xx82qj/ghi3i
 QCJhMgogCs7RO9EcvrwLaiBnkdPFu0RoN9fRBtMQ9DmU8TH06cE3PhPytSuawNiRTfuE
 kDjJcFFWWC1uZzW1EHLN0FHCgnx0dBpNieZHET8z+Fdqw1Tj13PTAm/JYBCRsY6uvl0m
 HHZ8jBjkHx2XFEs5RxWa0uJXOcNUBsStiKQW0zhmQxoEGzE/ftJhzy+7brzFJVP4Vi0y
 f9OQ==
X-Gm-Message-State: AOAM5316eEqDsjAPmVtWg5u0VGrFCw7VxR85Y15rbxX/0gSKIozABZXt
 B0qzC5QDQGAV7O64TPiwe0biEQCzbdGggA==
X-Google-Smtp-Source: ABdhPJxGBnjwof0NrrNv9dGHpEle630fZ6GHTVh5ihljmuD+y84PeiDR4mN68HJ4RyTWaqcbTO4qKQ==
X-Received: by 2002:a17:90a:29a5:: with SMTP id
 h34mr7515078pjd.69.1629322158365; 
 Wed, 18 Aug 2021 14:29:18 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/14] tcg/arm: Support armv4t in tcg_out_goto and
 tcg_out_call
Date: Wed, 18 Aug 2021 11:29:02 -1000
Message-Id: <20210818212912.396794-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

ARMv4T has BX as its only interworking instruction.  In order
to support testing of different architecture revisions with a
qemu binary that may have been built for, say ARMv6T2, fill in
the blank required to make calls to helpers in thumb mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 49 ++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 0578f9749b..87df812bb5 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1211,7 +1211,8 @@ static inline void tcg_out_st8(TCGContext *s, int cond,
         tcg_out_st8_12(s, cond, rd, rn, offset);
 }
 
-/* The _goto case is normally between TBs within the same code buffer, and
+/*
+ * The _goto case is normally between TBs within the same code buffer, and
  * with the code buffer limited to 16MB we wouldn't need the long case.
  * But we also use it for the tail-call to the qemu_ld/st helpers, which does.
  */
@@ -1219,38 +1220,56 @@ static void tcg_out_goto(TCGContext *s, int cond, const tcg_insn_unit *addr)
 {
     intptr_t addri = (intptr_t)addr;
     ptrdiff_t disp = tcg_pcrel_diff(s, addr);
+    bool arm_mode = !(addri & 1);
 
-    if ((addri & 1) == 0 && disp - 8 < 0x01fffffd && disp - 8 > -0x01fffffd) {
+    if (arm_mode && disp - 8 < 0x01fffffd && disp - 8 > -0x01fffffd) {
         tcg_out_b_imm(s, cond, disp);
         return;
     }
-    tcg_out_movi_pool(s, cond, TCG_REG_PC, addri);
+
+    /* LDR is interworking from v5t. */
+    if (arm_mode || use_armv5t_instructions) {
+        tcg_out_movi_pool(s, cond, TCG_REG_PC, addri);
+        return;
+    }
+
+    /* else v4t */
+    tcg_out_movi32(s, COND_AL, TCG_REG_TMP, addri);
+    tcg_out_bx_reg(s, COND_AL, TCG_REG_TMP);
 }
 
-/* The call case is mostly used for helpers - so it's not unreasonable
- * for them to be beyond branch range */
+/*
+ * The call case is mostly used for helpers - so it's not unreasonable
+ * for them to be beyond branch range.
+ */
 static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
 {
     intptr_t addri = (intptr_t)addr;
     ptrdiff_t disp = tcg_pcrel_diff(s, addr);
+    bool arm_mode = !(addri & 1);
 
     if (disp - 8 < 0x02000000 && disp - 8 >= -0x02000000) {
-        if (addri & 1) {
-            /* Use BLX if the target is in Thumb mode */
-            if (!use_armv5t_instructions) {
-                tcg_abort();
-            }
-            tcg_out_blx_imm(s, disp);
-        } else {
+        if (arm_mode) {
             tcg_out_bl_imm(s, COND_AL, disp);
+            return;
         }
-    } else if (use_armv7_instructions) {
+        if (use_armv5t_instructions) {
+            tcg_out_blx_imm(s, disp);
+            return;
+        }
+    }
+
+    if (use_armv5t_instructions) {
         tcg_out_movi32(s, COND_AL, TCG_REG_TMP, addri);
         tcg_out_blx_reg(s, COND_AL, TCG_REG_TMP);
-    } else {
+    } else if (arm_mode) {
         /* ??? Know that movi_pool emits exactly 1 insn.  */
-        tcg_out_dat_imm(s, COND_AL, ARITH_ADD, TCG_REG_R14, TCG_REG_PC, 0);
+        tcg_out_mov_reg(s, COND_AL, TCG_REG_R14, TCG_REG_PC);
         tcg_out_movi_pool(s, COND_AL, TCG_REG_PC, addri);
+    } else {
+        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, addri);
+        tcg_out_mov_reg(s, COND_AL, TCG_REG_R14, TCG_REG_PC);
+        tcg_out_bx_reg(s, COND_AL, TCG_REG_TMP);
     }
 }
 
-- 
2.25.1


