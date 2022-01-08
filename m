Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7D488264
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:33:32 +0100 (CET)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66V3-0001bK-3M
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:50:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lf-0005i8-4B
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:09 -0500
Received: from [2607:f8b0:4864:20::533] (port=43645
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Lc-00047o-4G
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:37:06 -0500
Received: by mail-pg1-x533.google.com with SMTP id 8so7660251pgc.10
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MZajHEilU6k0lLPYYDZNQ8jEdB70Bcd5oTv/nQtoSnU=;
 b=h9tD3gqY/ZsxBj1V75fRpJ4CVnPcEk+8dJXEKUnzgHHS+QG+0JoLJxup6VZYZlZeUP
 8HTb/UlQIE4wT3vMQOZC9Z+pCnqcgUzJd4mwf/GeGWyhjLVXJ1enrFy3evWrSrUAEPdl
 T8G6lWw0mR2wPhjPWxv4BmZ4e/NVEfzjfY2C+nokqr0WII0MFiHfkZ8iKexbK+4VlMbg
 CSYrxlSEVczRLUFaWhLSGTBvneLXjEg3StqYM0t2kcSpmpU8NNqnscYEXTg9rtnBFc01
 OGxSch+IKR1y0Act55L7uQJnnuoanoZ/dmrCqmfMBjsqwNLsPq//pp9tqNxP9vZnmfFO
 GnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MZajHEilU6k0lLPYYDZNQ8jEdB70Bcd5oTv/nQtoSnU=;
 b=Cp/qAttlZtggQvG8UIiGrxKa8fZCI8hj1maw6sJPXgH6+7t2l1aWU9UUyVjxfGp6D9
 EcBNTObnvY0dgdaglCKCqoIQ6mtXyoOohxxIdbPe/BE/81Dl+bqfiWMnvZlToNswvCsn
 J7q7+8mKKDdm6yVH2prmgRAIF6/ffhgIXPiHPYa4e99qlpgnuwPmKJ4CEk2h/ltfgpDb
 T+2kjs7/g7jiIDSS0BzVbNpK/TFY9iCrHEH2JZK2G5d5KLmOOLPD3fnT2uPpW9ewklpx
 +fwNyx6Zxv0Ot1+S7xkhXivrq6gu9Qfo7aek13cnzJRgUpTCMHDyZ2Lm4yGG7Wyx0L4+
 rHrw==
X-Gm-Message-State: AOAM530C6CQyGd2ueUODl62YsQPlyQP3SwK2HVOAu3j1Wyr1cAlJqvdp
 9c8Yj9e5LCmPOsmeO72camM5c05sn0IIQg==
X-Google-Smtp-Source: ABdhPJw9yqOtgP/QBGvsV7fadslwzpmxoFEgD7tdkdDFYIc9m3I3DKxvBEDRXRt3YTOACN3GRzKjEQ==
X-Received: by 2002:a63:b247:: with SMTP id t7mr13164194pgo.164.1641623816390; 
 Fri, 07 Jan 2022 22:36:56 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z4sm840954pfh.215.2022.01.07.22.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:36:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/12] tcg/mips: Split out tcg_out_movi_one
Date: Fri,  7 Jan 2022 22:36:39 -0800
Message-Id: <20220108063644.478043-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063644.478043-1-richard.henderson@linaro.org>
References: <20220108063644.478043-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Emit all constants that can be loaded in exactly one insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 76fb1dada0..8741fdd49c 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -524,20 +524,34 @@ static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
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
2.25.1


