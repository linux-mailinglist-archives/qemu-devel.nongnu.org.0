Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6D16400C7
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:58:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuA-0007aa-W4; Fri, 02 Dec 2022 01:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu6-0007ZD-5c
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:10 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu4-0003d6-2n
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:09 -0500
Received: by mail-pf1-x432.google.com with SMTP id w129so4088808pfb.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SALIZINGdn2w7on0H3KHxyUtfANKPc/CHhJmhj36m1o=;
 b=M0Bx5ZwM2t4t1qjazItnFCJoLSeRr8MKfN+8Hacjp01i0sHc4jzdcavwTSeYJyUFN9
 Zuq5eKgPsecICFPaiabCzXvza2ILY7Sr2HeCu+qFMKG6vFhRgAgeCGQbhN2x/fp76CQf
 VkfrGYwNRBEkmNeHcvXsYqhb4kMdNOMwOFcIBM5moQW/6nsbDzBtrQ53yuanZ+Xz3rSI
 zFwTPHzLRLWox9He7KudQNVpYU+CZd1XvlE+IxGXqt8SD5V6NTJL08WdTCiq0K6WGRi3
 7CP0iDTtRXWgj93ibU9thN9tzTHCWDJwJrWNgEz71Ur580NQBI2UcMT851p0OdoZ7nSj
 E9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SALIZINGdn2w7on0H3KHxyUtfANKPc/CHhJmhj36m1o=;
 b=jGnKnbYbd/I/Him/U5wcEZWAXTFWdv3SoaKnXVywfFDQi0k5OiPeJRguLrhr21N8fx
 8Koh1CgW9DnLyQXWt2D82gz2lq6quaQYjr++SHuiUn7ygwBm0j510coLiHyTawJJhcFO
 0M3kWcU2AVT0yW7EkD4hIeFQaaiUeHJdiMva14ixXTDGRnwdGmhZ2y3cEywp+gEti4jO
 Oh5gYqXWtOZksHn83zEiN188uXDwbSSGkVlwLdk7BlHbMd66GjVj/EPGBhcQRpk/u/8P
 CEKUsNENNv1MQPTIaaGuEu1RJRrp41/c7XEcegOCbkFCnxyImpgGJY0AHA29+0hI4D3H
 wa1g==
X-Gm-Message-State: ANoB5pnEcHvithMYeJD4HGTVcq+kyNcZWO1EguoETbG34QTjXweFNpI4
 82qkwsfMKV7ON6sgNuRsgkgR1wZiYEq6MAHy
X-Google-Smtp-Source: AA0mqf75a2xuSRqIr8gPZW4ozmO6oP+fnXjUQTDD8voTEWRAIanY1QXoKFrB5MntccX21oyBPH1H6w==
X-Received: by 2002:a63:f003:0:b0:45f:bf86:c917 with SMTP id
 k3-20020a63f003000000b0045fbf86c917mr62244632pgh.201.1669963927372; 
 Thu, 01 Dec 2022 22:52:07 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 06/13] tcg/s390x: Support MIE2 multiply single instructions
Date: Thu,  1 Dec 2022 22:51:53 -0800
Message-Id: <20221202065200.224537-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
index 645f522058..bfd623a639 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -63,6 +63,7 @@ typedef enum TCGReg {
 #define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
 #define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
 #define FACILITY_LOAD_ON_COND2        53
+#define FACILITY_MISC_INSN_EXT2       58
 #define FACILITY_VECTOR               129
 #define FACILITY_VECTOR_ENH1          135
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index d02b433271..cd39b2a208 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -180,6 +180,8 @@ typedef enum S390Opcode {
     RRE_SLBGR   = 0xb989,
     RRE_XGR     = 0xb982,
 
+    RRFa_MSRKC  = 0xb9fd,
+    RRFa_MSGRKC = 0xb9ed,
     RRFa_NRK    = 0xb9f4,
     RRFa_NGRK   = 0xb9e4,
     RRFa_ORK    = 0xb9f6,
@@ -2140,14 +2142,18 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
 
@@ -2405,14 +2411,18 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
 
@@ -3072,12 +3082,16 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
            MULTIPLY SINGLE IMMEDIATE with a signed 32-bit, otherwise we
            have only MULTIPLY HALFWORD IMMEDIATE, with a signed 16-bit.  */
         return (HAVE_FACILITY(GEN_INST_EXT)
-                ? C_O1_I2(r, 0, ri)
+                ? (HAVE_FACILITY(MISC_INSN_EXT2)
+                   ? C_O1_I2(r, r, ri)
+                   : C_O1_I2(r, 0, ri))
                 : C_O1_I2(r, 0, rI));
 
     case INDEX_op_mul_i64:
         return (HAVE_FACILITY(GEN_INST_EXT)
-                ? C_O1_I2(r, 0, rJ)
+                ? (HAVE_FACILITY(MISC_INSN_EXT2)
+                   ? C_O1_I2(r, r, rJ)
+                   : C_O1_I2(r, 0, rJ))
                 : C_O1_I2(r, 0, rI));
 
     case INDEX_op_shl_i32:
-- 
2.34.1


