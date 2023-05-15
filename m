Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A90C703042
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:43:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZKe-0006Fx-9v; Mon, 15 May 2023 10:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJz-0005Pz-AM
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:08 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJo-00060O-9A
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:07 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1aaea43def7so88216655ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161414; x=1686753414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=StcC3iugyCuMy6suZA8eRiPDdLMl9BrRBxet+P7NYKE=;
 b=oTg1MZbUdvG9e3Wg310VVv3I4mrqcVpYF5FpAURh3rnS2khQbFYNyl43X2I63fNafH
 9bR6eTiK9O9GqR+mEjTWWzfROiUEZPmLK2YZqV13TJwOkGZR+hja6J01CoSECIVknj46
 YVqlfWoWM0KduXkjZ3D/WXaqTyE6perwSOKxh6ebqX7AThIXnlE1FQlqIXr2qLDN+45g
 jTYysn65XeTrT4dG3PRvgrEeEDvLTs3c57oNPRrBd1l9mgo8dT4cW48o4gA8ZCCfe6+I
 m5efjds/qGFixo3ISI8J1SbgBxVnfloFN7HzI+i2ogS3kxsJgO2ZVDxYMytkxPoWI03K
 gj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161414; x=1686753414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=StcC3iugyCuMy6suZA8eRiPDdLMl9BrRBxet+P7NYKE=;
 b=i2UnAaCNxb5cTxRign9NL7owyKwq7repRGz+VMlXcsm3qj47CDhcuRfzh+QEaMohPA
 49f1yffm9IIqSBfXd8DChUnHl8lqE8l+l/WVw3Lg9TP6c18ge1UnMilN6cjBmeappoJ4
 am5nXDc/M7oiSCiSM2K2zuq9eYDb1HK+rhYII1+4UKGBFjkGxN/xVXItNm1P8U1l2+HC
 plA+YRm17W2hJeWQXZeyckrwFugp8Gl23zGnaYCzxylTVpDhDxTnxCsoZkFp9vu65mQA
 yyK2RfDQnU73aNt3URC26Kag8bF/HVEeQCOwbByMA5ge3CL4GR08m9uxJ48w1m5Vl5kX
 Orlg==
X-Gm-Message-State: AC+VfDwPZexJ7mS4oIWfxQl82zYEkyoJ5nLgssFhn2/gnozcqqC91YGC
 FDHOWMA1KbhjtJvy09AIIleZn+Pr9IIP1YXCF4k=
X-Google-Smtp-Source: ACHHUZ5TcUuOWfwlV6n5UMjCs7fV8YpN2oe8Ri0n8zPEboteCKIsyAB+9UpVNhqhjt9xIzUzyzUnng==
X-Received: by 2002:a17:902:a609:b0:1ac:946e:4690 with SMTP id
 u9-20020a170902a60900b001ac946e4690mr22778533plq.49.1684161413995; 
 Mon, 15 May 2023 07:36:53 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 46/54] tcg/riscv: Use atom_and_align_for_opc
Date: Mon, 15 May 2023 07:33:05 -0700
Message-Id: <20230515143313.734053-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 37870c89fc..1fc1a9199b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -910,8 +910,11 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    TCGAtomAlign aa;
+    unsigned a_mask;
+
+    aa = atom_and_align_for_opc(s, opc, MO_ATOM_IFALIGN, false);
+    a_mask = (1u << aa.align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
@@ -944,7 +947,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
      * cross pages using the address of the last byte of the access.
      */
     addr_adj = addr_reg;
-    if (a_bits < s_bits) {
+    if (a_mask < s_mask) {
         addr_adj = TCG_REG_TMP0;
         tcg_out_opc_imm(s, TARGET_LONG_BITS == 32 ? OPC_ADDIW : OPC_ADDI,
                         addr_adj, addr_reg, s_mask - a_mask);
@@ -983,8 +986,8 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
         ldst->oi = oi;
         ldst->addrlo_reg = addr_reg;
 
-        /* We are expecting a_bits max 7, so we can always use andi. */
-        tcg_debug_assert(a_bits < 12);
+        /* We are expecting alignment max 7, so we can always use andi. */
+        tcg_debug_assert(a_mask == sextreg(a_mask, 0, 12));
         tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, a_mask);
 
         ldst->label_ptr[0] = s->code_ptr;
-- 
2.34.1


