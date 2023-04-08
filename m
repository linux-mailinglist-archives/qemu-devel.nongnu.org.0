Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC3B6DB873
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:05:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkysL-0004A4-DP; Fri, 07 Apr 2023 23:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys4-00045q-16
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:08 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys2-0004WC-FJ
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1a51ba7fdfcso2440695ad.3
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3/mfgEEhut6lCtnwnsC8h9ARH2ugsuuRzfccUIm+yY=;
 b=NPU/kOF95RAupGvsmTotsiz3qhWtLOBSASgDXO+AI30lz/6nIFjeeqmBnLPQMegUx6
 r99dw5CD931Qkli7uBs8fxMjjpCkCIYMCZt+TWhzbY270Ra6iZy6aqLROygVlyLBzsPS
 cZ+HN7QV3Fk7xl7It1GQ+OPasvIedjpfOSusghtudtosikMrcWLcIZvQr0qXIOLhcQgc
 he1xa0MG9XthIyX9zhyQ8ZbLheZzHu/PYeqMOzS0+TLPAyCTQI0RdMlXk0pXgEcq6s8/
 tbHFAof6dPT5HhX//8QMn47f/Wj46fW5gV9BaveHNodcHStXGusr7EjUoCrVp1o8Hzv/
 dfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3/mfgEEhut6lCtnwnsC8h9ARH2ugsuuRzfccUIm+yY=;
 b=65L25JfcJdM4pMzIV3eN22DL4ergAD9mz/E8tm4hRGqmZ8RBeKK1Ky5D0RJAEOYuQg
 9WAko/Yqf+SfnYJF9aVatt3YVv3uMAmy9Pi+KutMflGa2NNOm9gOnMbeFQnvY7VvgCNH
 uCm1gJ+4i83F3rz6ffl/XoyLrmCCh7bWb0GBTG8GWjGAhEdWl/vrUTODebIKWSSzL0pS
 pU3kP+RdJr6TNMTGEG1luY3LklMF+PPnHnBQy8eCFVNU3+vKD29ExzufCiPnABODlkCM
 jssSGIdiNXiYx6AV1bY41yU45ztOwtFOVwXMJO0HgJlQSswLVMuKm6+c/EshZKYbpHTK
 qbTQ==
X-Gm-Message-State: AAQBX9fe54WmiFLw7IRpzNBxu5m/w63c3Fil6m4MM+imJMM9mUlV/Hr8
 J5q69681fi+hVU8ABTq+EGTRir8juuTK0kySGm0=
X-Google-Smtp-Source: AKy350ZAjbMzIlsNo2wndhliKgLRW7d4fShxDZd1hZiXMesORuKtR16FIO/ufQ8qo0+tKttIuNcedw==
X-Received: by 2002:a62:3802:0:b0:633:5c46:5a68 with SMTP id
 f2-20020a623802000000b006335c465a68mr138760pfa.10.1680923044977; 
 Fri, 07 Apr 2023 20:04:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH 05/12] tcg/mips: Split out tcg_out_movi_one
Date: Fri,  7 Apr 2023 20:03:52 -0700
Message-Id: <20230408030359.3368868-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

Emit all constants that can be loaded in exactly one insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index c2f8d6550b..f0ae418ba6 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -514,20 +514,34 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
     return true;
 }
 
+static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
+{
+    if (arg == (int16_t)arg) {
+        tcg_out_opc_imm(s, OPC_ADDIU, ret, TCG_REG_ZERO, arg);
+        return true;
+    }
+    if (arg == (uint16_t)arg) {
+        tcg_out_opc_imm(s, OPC_ORI, ret, TCG_REG_ZERO, arg);
+        return true;
+    }
+    if (arg == (int32_t)arg && (arg & 0xffff) == 0) {
+        tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
+        return true;
+    }
+    return false;
+}
+
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
     if (TCG_TARGET_REG_BITS == 64 && type == TCG_TYPE_I32) {
         arg = (int32_t)arg;
     }
-    if (arg == (int16_t)arg) {
-        tcg_out_opc_imm(s, OPC_ADDIU, ret, TCG_REG_ZERO, arg);
-        return;
-    }
-    if (arg == (uint16_t)arg) {
-        tcg_out_opc_imm(s, OPC_ORI, ret, TCG_REG_ZERO, arg);
+
+    if (tcg_out_movi_one(s, ret, arg)) {
         return;
     }
+
     if (TCG_TARGET_REG_BITS == 32 || arg == (int32_t)arg) {
         tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
     } else {
-- 
2.34.1


