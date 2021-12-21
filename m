Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5CA47C48C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:02:21 +0100 (CET)
Received: from localhost ([::1]:41968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziWq-0005af-6G
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:02:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ0-0000WE-KC
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:02 -0500
Received: from [2607:f8b0:4864:20::529] (port=42665
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIv-0007dv-OH
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:02 -0500
Received: by mail-pg1-x529.google.com with SMTP id g2so10253385pgo.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=adJz+s7jT6jWBFyUKxHXaxji8ihsHKTI4sYu6dNqkNg=;
 b=Z8lhaD7JXY/wwzF8yPR1RIrs+L37g8ZBW6d2vGpP1vp1NLKHvSrbAxK+xg5/gBki+r
 lH+t6WRYqLYVU4HHnwyNAnI1b7RvmbqhF8Tt3PS5PH1KG5eGylFJCzo4U/oWsnyiRaJU
 uj0TX6ldRWKskUK6dRIaw2ICnHKL5Q1e+/+1VyR06aMlEW1JnbZNnbQUCMldqOSqBRfA
 6gSyOGQqAQRTMpBxu2v5DTojdvroQLyyeTjtVR4TzGlap/KfS6oWx68gTUrghjY+yyxJ
 Spg85rhRCXt4U3bV8jOGiSG8FXbOo2gJGa0/uy2cRwYMJZUAC+yoPBCGCD99dZdvq1Yp
 rCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=adJz+s7jT6jWBFyUKxHXaxji8ihsHKTI4sYu6dNqkNg=;
 b=4RJQmzrHogaRJksU8WM1CpksBsfS3Sn5NK0uYo6PDTl3kbBH7eJ1631eCQAkuOET3b
 jWNJmClHX+cXBE9MB72zNBcZR784ijiom7JazzvjJGktiGOUYTlOs1JmQNvpA/SD8sxJ
 8maxsAIwk6KPS6xCg0fcg+YQxrk9lsjnUWcZFun3hKCmq1dx7tSE/BljDrsS45m3sVJy
 ZKIcPtpx+VEJLNXJ4T6cT+y7WKZi7zYoCXHFoCC48j2LyqovXU2BFNZcFJQxLGiMRJqT
 17lbd7Kffn9zJSCDFtpTuFdwrlUkDKUvRPvpV0Wdi4NTk6n8J7JobBpwSYI54+Ne/LIo
 Lqgw==
X-Gm-Message-State: AOAM531fQeaIKlgVji1y3fh/3vFN9iXPV0g1SfJajh30flJzFbFy3bjD
 1dGtc+TT56KXacMb9NP7QGn66XHOdGcdww==
X-Google-Smtp-Source: ABdhPJzzFP9uA55gA37WzfNkUcPwo6dK4fhvljGdKRFqHyRcz5WCzD0h/GNRPp5xNmkvRDhyFqRh7Q==
X-Received: by 2002:aa7:8219:0:b0:4a4:bec7:ef10 with SMTP id
 k25-20020aa78219000000b004a4bec7ef10mr4159947pfi.37.1640105276505; 
 Tue, 21 Dec 2021 08:47:56 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/31] tcg/loongarch64: Implement br/brcond ops
Date: Tue, 21 Dec 2021 08:47:25 -0800
Message-Id: <20211221164737.1076007-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-20-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  1 +
 tcg/loongarch64/tcg-target.c.inc     | 53 ++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index fb56f3a295..367689c2e2 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -15,6 +15,7 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I1(r)
+C_O0_I2(rZ, rZ)
 C_O1_I1(r, r)
 C_O1_I2(r, r, rC)
 C_O1_I2(r, r, ri)
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 0ae193fba5..aedfc0df84 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -434,6 +434,44 @@ static void tcg_out_clzctz(TCGContext *s, LoongArchInsn opc,
     tcg_out_opc_or(s, a0, TCG_REG_TMP0, a0);
 }
 
+/*
+ * Branch helpers
+ */
+
+static const struct {
+    LoongArchInsn op;
+    bool swap;
+} tcg_brcond_to_loongarch[] = {
+    [TCG_COND_EQ] =  { OPC_BEQ,  false },
+    [TCG_COND_NE] =  { OPC_BNE,  false },
+    [TCG_COND_LT] =  { OPC_BGT,  true  },
+    [TCG_COND_GE] =  { OPC_BLE,  true  },
+    [TCG_COND_LE] =  { OPC_BLE,  false },
+    [TCG_COND_GT] =  { OPC_BGT,  false },
+    [TCG_COND_LTU] = { OPC_BGTU, true  },
+    [TCG_COND_GEU] = { OPC_BLEU, true  },
+    [TCG_COND_LEU] = { OPC_BLEU, false },
+    [TCG_COND_GTU] = { OPC_BGTU, false }
+};
+
+static void tcg_out_brcond(TCGContext *s, TCGCond cond, TCGReg arg1,
+                           TCGReg arg2, TCGLabel *l)
+{
+    LoongArchInsn op = tcg_brcond_to_loongarch[cond].op;
+
+    tcg_debug_assert(op != 0);
+
+    if (tcg_brcond_to_loongarch[cond].swap) {
+        TCGReg t = arg1;
+        arg1 = arg2;
+        arg2 = t;
+    }
+
+    /* all conditional branch insns belong to DJSk16-format */
+    tcg_out_reloc(s, s->code_ptr, R_LOONGARCH_BR_SK16, l, 0);
+    tcg_out32(s, encode_djsk16_insn(op, arg1, arg2, 0));
+}
+
 /*
  * Entry-points
  */
@@ -456,6 +494,17 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_jirl(s, TCG_REG_ZERO, a0, 0);
         break;
 
+    case INDEX_op_br:
+        tcg_out_reloc(s, s->code_ptr, R_LOONGARCH_BR_SD10K16, arg_label(a0),
+                      0);
+        tcg_out_opc_b(s, 0);
+        break;
+
+    case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
+        tcg_out_brcond(s, a2, a0, a1, arg_label(args[3]));
+        break;
+
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
         tcg_out_ext8s(s, a0, a1);
@@ -779,6 +828,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_goto_ptr:
         return C_O0_I1(r);
 
+    case INDEX_op_brcond_i32:
+    case INDEX_op_brcond_i64:
+        return C_O0_I2(rZ, rZ);
+
     case INDEX_op_ext8s_i32:
     case INDEX_op_ext8s_i64:
     case INDEX_op_ext8u_i32:
-- 
2.25.1


