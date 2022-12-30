Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1F6593CE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 01:24:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pB2r7-00030C-Np; Thu, 29 Dec 2022 19:02:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2r2-0002xJ-Iu
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:33 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pB2qz-0002fG-9o
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 19:02:32 -0500
Received: by mail-pl1-x629.google.com with SMTP id g16so10694430plq.12
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 16:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2AYVfOigGNcWueyGcFEAyNre3J/WgPqkB4M4xEOEGc=;
 b=sIHIfodGP7l5hxQJ/RX0cdNtQwZCFEFhML628ZQj0AMZWbD8mflMl+79F8UtCoRQxE
 VZiJ68vnzHSZz2xEIBciFWyettPWj8pw/q0iOatQ1g12RwHyNILV/Cts3NZq2eHhGEcQ
 NsPPMltFhN5y6yD24zMKvbiBiKR2DEDo5N7iUgg10C7U7oBy2rf+QU2fQPik2Yj7pJeF
 apSDdBdW1+FZFvNOaiL/kmgonNz6TpeFQHMD6G1nBSRBh61RLuz7tE+GpilwiHKw0uTr
 XdrEsQrpvxIFCHyTxWHKRGW7qxxhX5lrsEUz/yzXdhIkPGTgim58dfMn6WKtLU5cs6pv
 7dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l2AYVfOigGNcWueyGcFEAyNre3J/WgPqkB4M4xEOEGc=;
 b=Tr4XsbKrGej+tvqknHbD+ghYrkteHk4yh1CoDfyJIYhQDSXGYLB2Y/oLVNIwBwNr1X
 hyFAgrPEQNsX/L0x4TKgTLT4St0m9dK35xld+x6phWZiC6kirQObXNeYdVeW+Pa19bV3
 owy71QmJnZzKPrE4u61u3uc9q1MvciCUwurNIYnfbs9pDc30SUSO1O+srrpq5cMloPbH
 U7S2hWwRR6CTYwSLMxXVQRYzGbrkPTx/mc/ISILRssGpactiJt1TO6iaFJQsLCZFcBO8
 csHKXmqeh6low4uDbFKxZRVPliQX77Cvl6uPfsHLhrbA4dKw+hXW9nS43VtFg2g0RXkt
 wfrQ==
X-Gm-Message-State: AFqh2kqFK/m9iGLwBFJlHIlrMHNjYrCesl/N91AXqN5+pCFjh3PqLcMw
 bXzB4vZFlpOXC2OOXr5tvzPEsdP1YUt5iCQu
X-Google-Smtp-Source: AMrXdXtDnui6DbgmRGBIQRH88OWAulUVg7CGIlzCV2X2cO0dT1FdK0oK/v9ZysnurCxWOgBk5+tLag==
X-Received: by 2002:a17:902:c943:b0:192:a3f5:18eb with SMTP id
 i3-20020a170902c94300b00192a3f518ebmr4349762pla.10.1672358545939; 
 Thu, 29 Dec 2022 16:02:25 -0800 (PST)
Received: from stoup.. (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903028e00b00192849e1d0asm7343953plr.116.2022.12.29.16.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 16:02:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL 03/47] tcg/s390x: Fix coding style
Date: Thu, 29 Dec 2022 16:01:37 -0800
Message-Id: <20221230000221.2764875-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230000221.2764875-1-richard.henderson@linaro.org>
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

We are going to modify this code, so fix its style first to avoid:

  ERROR: spaces required around that '*' (ctx:VxV)
  #281: FILE: tcg/s390x/tcg-target.c.inc:1224:
  +        uintptr_t mask = ~(0xffffull << i*16);
                                            ^

Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221130132654.76369-2-philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 33becd7694..f1d3907cd8 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -802,9 +802,9 @@ static bool maybe_out_small_movi(TCGContext *s, TCGType type,
     }
 
     for (i = 0; i < 4; i++) {
-        tcg_target_long mask = 0xffffull << i*16;
+        tcg_target_long mask = 0xffffull << i * 16;
         if ((uval & mask) == uval) {
-            tcg_out_insn_RI(s, lli_insns[i], ret, uval >> i*16);
+            tcg_out_insn_RI(s, lli_insns[i], ret, uval >> i * 16);
             return true;
         }
     }
@@ -1221,9 +1221,9 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     /* Try all 32-bit insns that can perform it in one go.  */
     for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = ~(0xffffull << i*16);
+        tcg_target_ulong mask = ~(0xffffull << i * 16);
         if (((val | ~valid) & mask) == mask) {
-            tcg_out_insn_RI(s, ni_insns[i], dest, val >> i*16);
+            tcg_out_insn_RI(s, ni_insns[i], dest, val >> i * 16);
             return;
         }
     }
@@ -1231,9 +1231,9 @@ static void tgen_andi(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     /* Try all 48-bit insns that can perform it in one go.  */
     if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = ~(0xffffffffull << i*32);
+            tcg_target_ulong mask = ~(0xffffffffull << i * 32);
             if (((val | ~valid) & mask) == mask) {
-                tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i*32);
+                tcg_out_insn_RIL(s, nif_insns[i], dest, val >> i * 32);
                 return;
             }
         }
@@ -1279,9 +1279,9 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
 
     /* Try all 32-bit insns that can perform it in one go.  */
     for (i = 0; i < 4; i++) {
-        tcg_target_ulong mask = (0xffffull << i*16);
+        tcg_target_ulong mask = (0xffffull << i * 16);
         if ((val & mask) != 0 && (val & ~mask) == 0) {
-            tcg_out_insn_RI(s, oi_insns[i], dest, val >> i*16);
+            tcg_out_insn_RI(s, oi_insns[i], dest, val >> i * 16);
             return;
         }
     }
@@ -1289,9 +1289,9 @@ static void tgen_ori(TCGContext *s, TCGType type, TCGReg dest, uint64_t val)
     /* Try all 48-bit insns that can perform it in one go.  */
     if (HAVE_FACILITY(EXT_IMM)) {
         for (i = 0; i < 2; i++) {
-            tcg_target_ulong mask = (0xffffffffull << i*32);
+            tcg_target_ulong mask = (0xffffffffull << i * 32);
             if ((val & mask) != 0 && (val & ~mask) == 0) {
-                tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i*32);
+                tcg_out_insn_RIL(s, oif_insns[i], dest, val >> i * 32);
                 return;
             }
         }
-- 
2.34.1


