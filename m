Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF286F5219
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:45:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qs-0003dA-89; Wed, 03 May 2023 03:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qC-00029n-PS
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:58 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qB-0001k4-3s
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:56 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so4561299f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098633; x=1685690633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZDXkqK9mfdU3Cm8OqGXV0ryPCZnRW3rCBHGqASwnBPg=;
 b=m6kMSS3/WUTVVuE6GWhPYXPqcs3Z2tX98anAOnlBzyKL7QoZlbYlNqL4ZuUm4yl3PD
 YKZXhatYIQJWF2W2yHazkEp404qvMJlZqWSnWk8WP9XWlnpxb8ULa8x1Dg0/4LBYP0PA
 e20IvxGpq6HkBEyT5kIaIhm7cOuf8plEBPU5hIyXkvxBoM0ZUeequ8NB2XtlL7rodIHW
 bO6sknBF4/nXWeBs1y6mYKTG8WUexsqWlfkbUNr8HnjoMkA8hlFM/ox/srIEyLZ/eEC7
 UsqpjMCzvwwRoXXAYTaihjdrUP3v1R61RDaKRt7C3rQFGT3c6dA+VYh7nob1Nm5pxLpi
 M+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098633; x=1685690633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZDXkqK9mfdU3Cm8OqGXV0ryPCZnRW3rCBHGqASwnBPg=;
 b=im9UnPfKOQ9uHqQj5f88be9GCTs2wpxIcGn2Dxt/ggkAlQ8WPot0fuiQFbh31KXIDQ
 hPK/aEW0DLOQHP824LyaI/gB8xJziWp0/4s+o77qWlqmayt5FUZK89BNt2hRfkA0xrWI
 5oBS+0Sy/My8Xk3r3+hWdbdUXpoFnzcSbnS15MgDIdveuah/cwtzmQRUZiPiix8tXooe
 BtUGWLqt30YhE0iH2WWTKcsl15meEKWI45deMDi/OpbolmN6nYD4GWD2srAYsI/ysTZy
 kJzalDIJqNl0eu6UvH6qk/7QkiCmk5y7Skq1cCiF+ji+70AFVP6pXZtaK6EjNdlmXw7q
 Hgiw==
X-Gm-Message-State: AC+VfDzcVeypSBDyKszw1tMXWjz6ZxU3ZcKIDjgndpd+zhHnEd3166Nr
 ozgt6FL/SFVtHOpGGVBrmUGlSsRrljwc7yN5TAzzIA==
X-Google-Smtp-Source: ACHHUZ4Je1jYn2nTYvJvpfWgj78ReoZ4RmO3/hgGY8flY+4QF6LPu+Q5qx9sMSaqpOQ7kPqkjg7Myw==
X-Received: by 2002:adf:dd88:0:b0:2d0:bba8:3901 with SMTP id
 x8-20020adfdd88000000b002d0bba83901mr13823845wrl.62.1683098633226; 
 Wed, 03 May 2023 00:23:53 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 26/84] tcg/riscv: Remove TARGET_LONG_BITS, TCG_TYPE_TL
Date: Wed,  3 May 2023 08:22:33 +0100
Message-Id: <20230503072331.1747057-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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

All uses replaced with TCGContext.addr_type.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 16e35ea6a6..fdc1faab1b 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -908,6 +908,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
                                            TCGReg addr_reg, MemOpIdx oi,
                                            bool is_ld)
 {
+    TCGType addr_type = s->addr_type;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
     MemOp a_bits, atom_a, atom_u;
@@ -950,19 +951,19 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
     addr_adj = addr_reg;
     if (a_bits < s_bits) {
         addr_adj = TCG_REG_TMP0;
-        tcg_out_opc_imm(s, TARGET_LONG_BITS == 32 ? OPC_ADDIW : OPC_ADDI,
+        tcg_out_opc_imm(s, addr_type == TCG_TYPE_I32 ? OPC_ADDIW : OPC_ADDI,
                         addr_adj, addr_reg, s_mask - a_mask);
     }
     compare_mask = TARGET_PAGE_MASK | a_mask;
     if (compare_mask == sextreg(compare_mask, 0, 12)) {
         tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_adj, compare_mask);
     } else {
-        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
+        tcg_out_movi(s, addr_type, TCG_REG_TMP1, compare_mask);
         tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr_adj);
     }
 
     /* Load the tlb comparator and the addend.  */
-    tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
+    tcg_out_ld(s, addr_type, TCG_REG_TMP0, TCG_REG_TMP2,
                is_ld ? offsetof(CPUTLBEntry, addr_read)
                      : offsetof(CPUTLBEntry, addr_write));
     tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
@@ -974,7 +975,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
 
     /* TLB Hit - translate address using addend.  */
     addr_adj = addr_reg;
-    if (TARGET_LONG_BITS == 32) {
+    if (addr_type == TCG_TYPE_I32) {
         addr_adj = TCG_REG_TMP0;
         tcg_out_ext32u(s, addr_adj, addr_reg);
     }
@@ -996,7 +997,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
     }
 
     TCGReg base = addr_reg;
-    if (TARGET_LONG_BITS == 32) {
+    if (addr_type == TCG_TYPE_I32) {
         tcg_out_ext32u(s, TCG_REG_TMP0, base);
         base = TCG_REG_TMP0;
     }
-- 
2.34.1


