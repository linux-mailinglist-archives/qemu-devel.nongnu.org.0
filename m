Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7F32E9C24
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:38:29 +0100 (CET)
Received: from localhost ([::1]:50742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwToK-0005gJ-Eu
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwTlN-0003sQ-My
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:35:30 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:43635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwTlL-0005yj-7f
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:35:25 -0500
Received: by mail-pf1-x42e.google.com with SMTP id c12so16819138pfo.10
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 09:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nSzBZtUK2LkfTKeonDTNF1AsDJCvjcDNLNACAlJxGQs=;
 b=YhIswXX2MtMi5K2dtSOi/Q2wJThkCXl7Tfk65eSO0fMLL8PLll36ZBsEklbmNXugVZ
 Stvmmff2YnC41t9utvZu3xTYkzXA4uvw+14++ZnDaeSE2wM7FOKW3YRZv90wYqY6vC3G
 J/pESBjgnty5YYwGEuuhahBqIi9tIOXC0sIhGEpiMFVCA+g2Fam0Vu4mB/2y3AMFZA9F
 Du7zazwDzqM1u5MAZwG9UsgsrIIwKRe4DgVZHSn0l05evLkPrqNLfA1QyMPPHRczMJw5
 9JGudWQMTS+Ul3HKRSsf9ZdsX6sYi2W+f3ncVNhcaVDK+5tU6uSL0g1wB49bvFZuEqY4
 z/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nSzBZtUK2LkfTKeonDTNF1AsDJCvjcDNLNACAlJxGQs=;
 b=rZGzjj7dw/2ltHBW4Qp2PZ1y7i0MLorASikn+2xyB1KyB2NlGE9NDS/bB/NQydwvHs
 jF8ZMlKaE/vDixh06+xyUyMEazneSNr3C6v3LYvoY/xDLZSiAhgi52qNhcNCoFo5lltI
 oBLd+7+4jmZIXU9dFUvzvdYLldHUvTfOHrDmFxgj3Rn7F2bp+CkJ9b5EAKBntanPMGdC
 NkFj94OVBAOvfRdKGTsgNWJ49A3IDtB/4t5qIx1VMX+9yqnzTTeR/NWCqggwFjaHvWfS
 0otFH5HhO/bBlz2Z3RHbH6Is0UFCuBUuluJbdvKFnIU//nIOCR2VQRy0kiJYpggsMd4R
 7iDQ==
X-Gm-Message-State: AOAM533z7EAV4+eEmP55EeYvxYWj9akLldillB0MyCNibDMdSReYaj7b
 +l4Li7W4iWuP8yLvLEFQ5b0QhQZN8eLRbw==
X-Google-Smtp-Source: ABdhPJyEJIQsyC0vacVfTCrSubfpdB/GKPl1B03DpE5hh/ypTA80P2iqwI+SuNOC1oxeJUFzAG4FTA==
X-Received: by 2002:a05:6a00:a88:b029:19e:4ba8:bbe4 with SMTP id
 b8-20020a056a000a88b029019e4ba8bbe4mr67430423pfl.41.1609781721641; 
 Mon, 04 Jan 2021 09:35:21 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a131sm50706933pfd.171.2021.01.04.09.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 09:35:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] tcg/riscv: Fix illegal shift instructions
Date: Mon,  4 Jan 2021 07:35:14 -1000
Message-Id: <20210104173515.198921-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104173515.198921-1-richard.henderson@linaro.org>
References: <20210104173515.198921-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: peter.maydell@linaro.org, Zihao Yu <yuzihao@ict.ac.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zihao Yu <yuzihao@ict.ac.cn>

Out-of-range shifts have undefined results, but must not trap.
Mask off immediate shift counts to solve this problem.

This bug can be reproduced by running the following guest instructions:

  xor %ecx,%ecx
  sar %cl,%eax
  cmovne %edi,%eax

After optimization, the tcg opcodes of the sar are

  movi_i32 tmp3,$0xffffffffffffffff  pref=all
  sar_i32 tmp3,eax,tmp3              dead: 2  pref=all
  mov_i32 cc_dst,eax                 sync: 0  dead: 1 pref=0xffc0300
  mov_i32 cc_src,tmp3                sync: 0  dead: 0 1  pref=all
  movi_i32 cc_op,$0x31               sync: 0  dead: 0  pref=all

The sar_i32 opcode is a shift by -1, which unmasked generates

  0x200808d618:  fffa5b9b          illegal

Signed-off-by: Zihao Yu <yuzihao@ict.ac.cn>
Message-Id: <20201216081206.9628-1-yuzihao@ict.ac.cn>
[rth: Reworded the patch description.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index d536f3ccc1..4089e29cd9 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1462,14 +1462,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_shl_i32:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SLLIW, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SLLIW, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_reg(s, OPC_SLLW, a0, a1, a2);
         }
         break;
     case INDEX_op_shl_i64:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SLLI, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SLLI, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_reg(s, OPC_SLL, a0, a1, a2);
         }
@@ -1477,14 +1477,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_shr_i32:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SRLIW, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SRLIW, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_reg(s, OPC_SRLW, a0, a1, a2);
         }
         break;
     case INDEX_op_shr_i64:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SRLI, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SRLI, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_reg(s, OPC_SRL, a0, a1, a2);
         }
@@ -1492,14 +1492,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_sar_i32:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SRAIW, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SRAIW, a0, a1, a2 & 0x1f);
         } else {
             tcg_out_opc_reg(s, OPC_SRAW, a0, a1, a2);
         }
         break;
     case INDEX_op_sar_i64:
         if (c2) {
-            tcg_out_opc_imm(s, OPC_SRAI, a0, a1, a2);
+            tcg_out_opc_imm(s, OPC_SRAI, a0, a1, a2 & 0x3f);
         } else {
             tcg_out_opc_reg(s, OPC_SRA, a0, a1, a2);
         }
-- 
2.25.1


