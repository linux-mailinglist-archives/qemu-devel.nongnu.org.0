Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA9C660CEE
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 09:12:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zU-0003jt-7X; Sat, 07 Jan 2023 02:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zJ-0003g2-Gi
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:34 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zH-0004D3-P7
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:33 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d15so4073367pls.6
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YF0GWpx0dC/UYYXWm5/mP8VhAPYVOiMc6soYwoN6xvw=;
 b=khihS/Ec2+jMHENhQtbrwwbPGUN71VJKVKGs1FFTzvBDE83e4jNUA7AOQdw3ZsMOFh
 VWp/LjFBU5381AYqiyfp2jNOb6w06nBogTIsy2a8gUhjuYvlY2iAzr2bzD2nRJXwZidn
 Xy2ceUmB3EovNSnZU3VYgnXQt9btZdRuROBh2VlarBDE7xJ0LsK+RDRCHG5DeGTIg2HW
 tIVREYfmB+akO6t7UnIeTCXM6cey6LJj1sa3DUBhFZYcPKbtU1ydeNCqzcuC4d/NX1yj
 jarrdSuEuhcei+Qg7x0vBJ1ycS3UmXlZnqAawxC4p5dtQ2qNmx3R0Bd074HTK8/OXvDj
 xWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YF0GWpx0dC/UYYXWm5/mP8VhAPYVOiMc6soYwoN6xvw=;
 b=sYoy2NMa4YHJE1X4t5K186PHor0ntIdZ/CbRMIjal7DuDlCrk64zYzZqieG/8xE4uP
 12nQfpwGBWAZfOBcKlk2yETAtyCIsVle3/QcbxNKg4JKGpk3HMjRU0uz91Gy5e7UN0Dl
 8frA9fduG4SByhOgQ30JAcouv3A54r/clma5NNmxJxhCDAvdHTxHw+KIOmx0pLKh56n+
 5EWyijiewjuYVrQrsghFHEL1EoxfTpfkiWb0k8tryMP6y98M7ts+FnCyIVna6Do8aQAO
 oY5r7UlGnCeYQ8QdRPw68D8AT7yzm8l/9tZl0TuJ+L21ydiTH0PpFk978HDJeTJxXQb5
 /d4A==
X-Gm-Message-State: AFqh2koqQ8Acylh6qfpMOEcLux4OVaqz/z4bJjIxvFdNSDso4sNfpZsV
 6UYRGpcoUdYJvi4E5ivEX6euEV/mqR2alX0z
X-Google-Smtp-Source: AMrXdXsbbnRsfVKEYr7AaFloQTC2Cvo01M8xePMdBsXoYyEi7uHgC2wr1Ee38lXqOYzwt0H/4Eo0Yg==
X-Received: by 2002:a17:90b:4f4e:b0:219:89c3:2847 with SMTP id
 pj14-20020a17090b4f4e00b0021989c32847mr61252173pjb.44.1673077889509; 
 Fri, 06 Jan 2023 23:51:29 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 10/27] tcg/s390x: Remove DISTINCT_OPERANDS facility check
Date: Fri,  6 Jan 2023 23:51:01 -0800
Message-Id: <20230107075118.1814503-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

The distinct-operands facility is bundled into facility 45,
along with load-on-condition.  We are checking this at startup.
Remove the a0 == a1 checks for 64-bit sub, and, or, xor, as there
is no space savings for avoiding the distinct-operands insn.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  1 -
 tcg/s390x/tcg-target.c.inc | 16 ++--------------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index fc9ae82700..db10a39381 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -62,7 +62,6 @@ typedef enum TCGReg {
 
 /* Facilities that are checked at runtime. */
 
-#define FACILITY_DISTINCT_OPS         45
 #define FACILITY_LOAD_ON_COND2        53
 #define FACILITY_VECTOR               129
 #define FACILITY_VECTOR_ENH1          135
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dd58f0cdb5..e4403ffabf 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2218,8 +2218,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (const_args[2]) {
             a2 = -a2;
             goto do_addi_64;
-        } else if (a0 == a1) {
-            tcg_out_insn(s, RRE, SGR, a0, a2);
         } else {
             tcg_out_insn(s, RRF, SGRK, a0, a1, a2);
         }
@@ -2230,8 +2228,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
             tgen_andi(s, TCG_TYPE_I64, args[0], args[2]);
-        } else if (a0 == a1) {
-            tcg_out_insn(s, RRE, NGR, args[0], args[2]);
         } else {
             tcg_out_insn(s, RRF, NGRK, a0, a1, a2);
         }
@@ -2241,8 +2237,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
             tgen_ori(s, TCG_TYPE_I64, a0, a2);
-        } else if (a0 == a1) {
-            tcg_out_insn(s, RRE, OGR, a0, a2);
         } else {
             tcg_out_insn(s, RRF, OGRK, a0, a1, a2);
         }
@@ -2252,8 +2246,6 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         if (const_args[2]) {
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
             tgen_xori(s, TCG_TYPE_I64, a0, a2);
-        } else if (a0 == a1) {
-            tcg_out_insn(s, RRE, XGR, a0, a2);
         } else {
             tcg_out_insn(s, RRF, XGRK, a0, a1, a2);
         }
@@ -2926,9 +2918,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_or_i64:
     case INDEX_op_xor_i32:
     case INDEX_op_xor_i64:
-        return (HAVE_FACILITY(DISTINCT_OPS)
-                ? C_O1_I2(r, r, ri)
-                : C_O1_I2(r, 0, ri));
+        return C_O1_I2(r, r, ri);
 
     case INDEX_op_mul_i32:
         return C_O1_I2(r, 0, ri);
@@ -2938,9 +2928,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shl_i32:
     case INDEX_op_shr_i32:
     case INDEX_op_sar_i32:
-        return (HAVE_FACILITY(DISTINCT_OPS)
-                ? C_O1_I2(r, r, ri)
-                : C_O1_I2(r, 0, ri));
+        return C_O1_I2(r, r, ri);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-- 
2.34.1


