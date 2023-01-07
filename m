Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E123660CD5
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:52:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zS-0003ij-E1; Sat, 07 Jan 2023 02:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zM-0003gp-Gi
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:38 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zK-0004EH-LZ
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:36 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so7533014pjk.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hELIWO/9s4dMzjgjNIgr7btQwZnxqh26ctXstkwJ0Bg=;
 b=wVYW4GRrcLw9SGPBol6vpqkj2Y0mJtbaOD3bNiOXmk4b3mXHSIT9S6tbZxaQXKFFyH
 7e1Ej92gNN4JnNFgnwJ3Ur1EeUD4Gyp7cLxkcyYfJt1V9YkWPwniNLd2Gx2e9tR0djTX
 XR9lWC4AhvXyZ8zxi8L6OQwLs7Pq9xCzORCjmeTgapJ3QAmDXPAoB0I+KHFlS/Yl+NtA
 uDzNfXkmuAC8xzB6xlY8Kh5pWh2wqUtflxS2N2aDh3IBj4fsWN8CEZxMWCO0A4ENs3/i
 Zu/PLrpzS+8k/bJsRzGo3iyDe2/NBK+KJGNWO2lcuMBAH6fUiDDxs0tdgcO/gORvDA3u
 M3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hELIWO/9s4dMzjgjNIgr7btQwZnxqh26ctXstkwJ0Bg=;
 b=axgXlvlpmg2iBGnjNLRHTncF1MPObJ8Vtm/H8ntYlCpVdaTVuBNfKcQIzuqn7g5m17
 p03ftdVvu7hQ2XyD1/gyZK+sMm6S2u/FTqC/LbAgBpaJCu6JmBhIGEmCCGHlcf9wbZYT
 xlMXXGsdH4KacLdhbq5xFr6J17/bWSui+A/u7cHUNRn8xl/jhkIE7y96Km2IqausvMk/
 A9kTu38cfd89tJ3xEXuPx+jD3S1EO+/nlHT7AW/rTT2Ve60stu5QVbVxS6omHrkF2psh
 GilaEqQUtqR8lUIFWS/FdBY38uoRoKyjElM283gN25M/5OWSiR+DBND8z3XYq3aM3eyq
 wINg==
X-Gm-Message-State: AFqh2krvEKf5RvShLS+RjfCKfqDsjbrwDiay/xy6ndOrn4Nv1CtLuMqA
 Jz4NNBkLMLUKuX5VwA8OIF+uBfP0iZ7UMxFG
X-Google-Smtp-Source: AMrXdXttjk2kvLkjr/EEaJjRveuylc5vmE0Gbq7XyqCdbXXT+vZuCmOi7oZFaQ2P62jKEQ80zlOlkw==
X-Received: by 2002:a17:90a:5d08:b0:219:4578:6409 with SMTP id
 s8-20020a17090a5d0800b0021945786409mr61502657pji.41.1673077893202; 
 Fri, 06 Jan 2023 23:51:33 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 14/27] tcg/s390x: Support MIE2 multiply single instructions
Date: Fri,  6 Jan 2023 23:51:05 -0800
Message-Id: <20230107075118.1814503-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

The MIE2 facility adds 3-operand versions of multiply.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  1 +
 tcg/s390x/tcg-target.h         |  1 +
 tcg/s390x/tcg-target.c.inc     | 34 ++++++++++++++++++++++++----------
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 00ba727b70..33a82e3286 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -23,6 +23,7 @@ C_O1_I2(r, 0, ri)
 C_O1_I2(r, 0, rI)
 C_O1_I2(r, 0, rJ)
 C_O1_I2(r, r, ri)
+C_O1_I2(r, r, rJ)
 C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index db10a39381..1fb7b8fb1d 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -63,6 +63,7 @@ typedef enum TCGReg {
 /* Facilities that are checked at runtime. */
 
 #define FACILITY_LOAD_ON_COND2        53
+#define FACILITY_MISC_INSN_EXT2       58
 #define FACILITY_VECTOR               129
 #define FACILITY_VECTOR_ENH1          135
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index a81a82c70b..9634126ed1 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -175,6 +175,8 @@ typedef enum S390Opcode {
     RRE_SLBGR   = 0xb989,
     RRE_XGR     = 0xb982,
 
+    RRFa_MSRKC  = 0xb9fd,
+    RRFa_MSGRKC = 0xb9ed,
     RRFa_NRK    = 0xb9f4,
     RRFa_NGRK   = 0xb9e4,
     RRFa_ORK    = 0xb9f6,
@@ -2015,14 +2017,18 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_mul_i32:
+        a0 = args[0], a1 = args[1], a2 = (int32_t)args[2];
         if (const_args[2]) {
-            if ((int32_t)args[2] == (int16_t)args[2]) {
-                tcg_out_insn(s, RI, MHI, args[0], args[2]);
+            tcg_out_mov(s, TCG_TYPE_I32, a0, a1);
+            if (a2 == (int16_t)a2) {
+                tcg_out_insn(s, RI, MHI, a0, a2);
             } else {
-                tcg_out_insn(s, RIL, MSFI, args[0], args[2]);
+                tcg_out_insn(s, RIL, MSFI, a0, a2);
             }
+        } else if (a0 == a1) {
+            tcg_out_insn(s, RRE, MSR, a0, a2);
         } else {
-            tcg_out_insn(s, RRE, MSR, args[0], args[2]);
+            tcg_out_insn(s, RRFa, MSRKC, a0, a1, a2);
         }
         break;
 
@@ -2272,14 +2278,18 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_mul_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
         if (const_args[2]) {
-            if (args[2] == (int16_t)args[2]) {
-                tcg_out_insn(s, RI, MGHI, args[0], args[2]);
+            tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
+            if (a2 == (int16_t)a2) {
+                tcg_out_insn(s, RI, MGHI, a0, a2);
             } else {
-                tcg_out_insn(s, RIL, MSGFI, args[0], args[2]);
+                tcg_out_insn(s, RIL, MSGFI, a0, a2);
             }
+        } else if (a0 == a1) {
+            tcg_out_insn(s, RRE, MSGR, a0, a2);
         } else {
-            tcg_out_insn(s, RRE, MSGR, args[0], args[2]);
+            tcg_out_insn(s, RRFa, MSGRKC, a0, a1, a2);
         }
         break;
 
@@ -2934,9 +2944,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O1_I2(r, r, ri);
 
     case INDEX_op_mul_i32:
-        return C_O1_I2(r, 0, ri);
+        return (HAVE_FACILITY(MISC_INSN_EXT2)
+                ? C_O1_I2(r, r, ri)
+                : C_O1_I2(r, 0, ri));
     case INDEX_op_mul_i64:
-        return C_O1_I2(r, 0, rJ);
+        return (HAVE_FACILITY(MISC_INSN_EXT2)
+                ? C_O1_I2(r, r, rJ)
+                : C_O1_I2(r, 0, rJ));
 
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
-- 
2.34.1


