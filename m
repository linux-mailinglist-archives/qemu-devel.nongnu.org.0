Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF24C6F53D4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:57:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IM-0000wl-W1; Wed, 03 May 2023 04:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IK-0000vW-67
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:04 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8II-0006c2-De
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:03 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso48537875e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104221; x=1685696221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HW8JSRn5RMrJ+UuW0TSqtYpPCYz7WFz757nhPdtnQaI=;
 b=M+mbFJCyxGsW+d7QWHayicsLeOACU+PoQ0mv0bg3ALw0ZmOvU07Agn+TmaFs6729Q1
 e7qFTEB87AgWw2kT2GKPkSiLl4sWMzcEV0BCRrq3x8jj97jqfk55gkyqeBRoN2+lIY2J
 QKMIONfK0ZQPV2gfikQzfO25sGXb8El7v98S2Q73D3DnQWEUIFz2BhcT9ebDTOkI5Xmr
 acL5pFfxu1AmKIEvJZgLvL11OyWKN1y+FtidJtni8apzGhdr4mCYa29jmrpJ9ZIKS00v
 Q/KkBjg98oMnk2pTk0CW4NQ0aL1pWIYk/056yWM1LR7XcH861AA7v2LgJGXR5El5mVr7
 4jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104221; x=1685696221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HW8JSRn5RMrJ+UuW0TSqtYpPCYz7WFz757nhPdtnQaI=;
 b=aciB3Umt7tmtO6UnmWPbLB0ovPSLAZdw3hGjRm8Yvaby+OQFlaSEfIpMd9C15AMfM9
 RGtAZCK8qKeJYKZ0++mNTGNbkB4DRLHYb8FgHYtCUrfifzFEf/ug92yxC2Ueg86Jq3O7
 YH7Ev4rWZAPs9r1/UBXqkyLo7JW0pWIIJzzLwpo4vTfeg25fHrHswLWHj2tDTYx6R1Vn
 cV0JOmzC34QOSER7QwSZcZPqu0/q5zmfmpQgNZVVotUCa+gxdVYmMxob7Aa0Mg/NryQt
 lqtwkBEpg7zANzZeesUQdSB9dKOMf6WyWM2+QGPSaEt2QBIBh5iKmzIEnuFH2+jev+Bu
 k7jw==
X-Gm-Message-State: AC+VfDzv2f3hqHmTvGpLxCkHJzuja9z/ERw4KysxppW3KIsxI0t78RiI
 Pb7Ow5O9rWBwqIbVHQrkB5hezsyINBc6EzBTxNpKlQ==
X-Google-Smtp-Source: ACHHUZ6MKzqan8AEnadNfjiGCsbAvHs8T2bnv69enojnYrjHuRzcJw968lKTjUZ9ouTfxFhxMRvKDg==
X-Received: by 2002:a1c:f30b:0:b0:3f1:75d2:a6a7 with SMTP id
 q11-20020a1cf30b000000b003f175d2a6a7mr14614605wmq.36.1683104220894; 
 Wed, 03 May 2023 01:57:00 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:57:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 05/11] tcg/riscv: Use ADD.UW for guest address generation
Date: Wed,  3 May 2023 09:56:51 +0100
Message-Id: <20230503085657.1814850-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
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

The instruction is a combined zero-extend and add.
Use it for exactly that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 53a7f97b29..f64eaa8515 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1039,14 +1039,18 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
     tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
 
     /* TLB Hit - translate address using addend.  */
-    addr_adj = addr_reg;
-    if (TARGET_LONG_BITS == 32) {
-        addr_adj = TCG_REG_TMP0;
-        tcg_out_ext32u(s, addr_adj, addr_reg);
+    if (TARGET_LONG_BITS == 64) {
+        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, addr_reg, TCG_REG_TMP2);
+    } else if (have_zba) {
+        tcg_out_opc_reg(s, OPC_ADD_UW, TCG_REG_TMP0, addr_reg, TCG_REG_TMP2);
+    } else {
+        tcg_out_ext32u(s, TCG_REG_TMP0, addr_reg);
+        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP0, TCG_REG_TMP2);
     }
-    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr_adj);
     *pbase = TCG_REG_TMP0;
 #else
+    TCGReg base;
+
     if (a_mask) {
         ldst = new_ldst_label(s);
         ldst->is_ld = is_ld;
@@ -1061,14 +1065,21 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
         tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP1, TCG_REG_ZERO, 0);
     }
 
-    TCGReg base = addr_reg;
-    if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_REG_TMP0, base);
-        base = TCG_REG_TMP0;
-    }
     if (guest_base != 0) {
-        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
         base = TCG_REG_TMP0;
+        if (TARGET_LONG_BITS == 64) {
+            tcg_out_opc_reg(s, OPC_ADD, base, addr_reg, TCG_GUEST_BASE_REG);
+        } else if (have_zba) {
+            tcg_out_opc_reg(s, OPC_ADD_UW, base, addr_reg, TCG_GUEST_BASE_REG);
+        } else {
+            tcg_out_ext32u(s, base, addr_reg);
+            tcg_out_opc_reg(s, OPC_ADD, base, base, TCG_GUEST_BASE_REG);
+        }
+    } else if (TARGET_LONG_BITS == 64) {
+        base = addr_reg;
+    } else {
+        base = TCG_REG_TMP0;
+        tcg_out_ext32u(s, base, addr_reg);
     }
     *pbase = base;
 #endif
-- 
2.34.1


