Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93CA647C25
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:18:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slz-00060s-Ne; Thu, 08 Dec 2022 21:05:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slv-0005yX-5N
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:55 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slr-0001ww-Pr
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:54 -0500
Received: by mail-oi1-x22e.google.com with SMTP id m204so3275077oib.6
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hELIWO/9s4dMzjgjNIgr7btQwZnxqh26ctXstkwJ0Bg=;
 b=PmY/0yi7E0sBRGTMdrrpC8g9cpCcEMyasYw4e3mMWSl27uV7F02lHdB+FqrbYm1OST
 IhSLMk7Ai9SQTw7xQJk96OzX0FqB3wgkE0iHRslHkm267Gd1GjPU1xCzsqUbRopOzh51
 B6itTn9SVO+LWOkKd2z4Xzm7phy3JuomkC9XkjlZrki5sRE/Fj0HTBSYovK9vmS2AnRt
 U/4yaE1EW2jF76qJXOKM+bH1vTXjj0Cv+JrBLwowHJoy4aX0oE3R/iXfapsrK5kJIRG8
 iHGiyFoykWanvq5zLmTclAQsWic1xNM8FdoMdQSEuSC/LmUb6/2UQxW8QmE+CJpflw+t
 SkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hELIWO/9s4dMzjgjNIgr7btQwZnxqh26ctXstkwJ0Bg=;
 b=8Kt6MJr9KuhzCSfkjBqSvcq8TRzo56oFSyj8QmbgbHRo/GXGWfR+1jxR4sYfP+ETkt
 r2aiNlYk721mqiHITkCr5h5vlJEnT6DiWWQClASBBIIjdh/H6fYmJo59GNvfWTu1CDc7
 Vlfvyw6BGKblpZdDze4DBqh5HK+N1HU0KlcN6WkQkuzJif7TUaoNZM9npHwm0KzAU2GH
 5hHNNnyOMRsRKHsXQs+ewOye3SNvXLDcTOuyPxfGPNR0xku9HbYkWxlq0/bn1CoNxkVB
 3AAnUmxl2a1auW+nLjGTLMQ+V/uiJ+rxJzwo10YuU2Tp6paTTZyZnG+HjR+I8AQLbBnd
 8wwA==
X-Gm-Message-State: ANoB5pnXKLfddMyjuLnZsk39Qb1JpHmjelnD85m8BI1jb3HcmhL+VLXd
 IIe/su+oc9ja31lcWHDW39sYU3O0OePfs7sDm4o=
X-Google-Smtp-Source: AA0mqf7l8THxSolhEsU3A4SctEVHm+3v7RQDOtSeVpypz3IOvG2H5agKeHUwvmxMlTf0QMzhHrxANw==
X-Received: by 2002:a05:6808:218a:b0:35e:214f:11c0 with SMTP id
 be10-20020a056808218a00b0035e214f11c0mr2755255oib.22.1670551549028; 
 Thu, 08 Dec 2022 18:05:49 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 14/27] tcg/s390x: Support MIE2 multiply single instructions
Date: Thu,  8 Dec 2022 20:05:17 -0600
Message-Id: <20221209020530.396391-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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


