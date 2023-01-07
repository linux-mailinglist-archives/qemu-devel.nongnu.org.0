Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A3D660CD8
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:53:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zV-0003l0-86; Sat, 07 Jan 2023 02:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zL-0003ga-00
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:35 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zI-0004A8-69
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:34 -0500
Received: by mail-pl1-x634.google.com with SMTP id d3so4053778plr.10
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C23h7Yx8JzQKAeZMd/n6e9yoB9czBQRnkklZY0NaEjA=;
 b=D/6rUowyVbI+TmEbspwjPLAIIsIxLHnfBERyLNDRWVOkQhL7Mg4yOpuiVG9NeLXOVN
 U4Fu+DxDXMml4FMQjVF01u0aUH3+j6y7pBKjyFpWsLyDBvo6tuPqhyh9gC7Ds4UQnqrp
 PzycxQEKi0un5Yi3/QwlPknbKul4ETSU2AO4ENYTEagNm6cpv7sjVRqxXNAm22C2vliX
 pmmTr6PbuV9SXi4I3fqzSpLUJKfcpTcVC79/C89dXwZvdO3ID7z3zP+ig97eSLtQ8OTt
 +Xss6tX0koQgfllBQeO8PhiUdck8Ke7ggLkjtLZ+QXHTEMjISLTODPs+PjcMEB3Crp/i
 RPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C23h7Yx8JzQKAeZMd/n6e9yoB9czBQRnkklZY0NaEjA=;
 b=6SFRWoTqUuw1lIqbACAM9SAT2jwRuUrsdzAXsL2+jGwf+cn6W/ViQV6gm97HlD4ltY
 xzwZvcPY3J/Za/GILs0hDhwOZ6DraBIs8eFW2Ie74oCNaPfyvUaKrNhjwbmAkJ6BOm/o
 mkS4qALgl+vR0Hexhp0PH7v/BxnpLsMzbUvzAdRQUHh+wlhRF9i+R8CBpXCcH06AWfuH
 jE+gdvZz/4X4KIAQQLTQqNgweFysHIByrZaDTPQK/Hkvv7FC0lEwL7qjHRGbBFWhX+pY
 7OSDAUWsLtOTlZOP/ZZ65PypBOwY9unHHTpTDnrpsgziDSog6FxBVTPxrXo6WZjTfxW+
 8s1A==
X-Gm-Message-State: AFqh2kpzoeZ8LcG7FoQZNz9Db+E0ijqCtozLAkBX1IdLee9Rfe6j+MNF
 BerlUytcwHWcUc7W0HCT97jnYV+8QTiWAOjU
X-Google-Smtp-Source: AMrXdXsAjzGCivGIwzgJej6xzNYPa4EpCIdXpMF29bLqAseuNzTFj9KuAbL4eu5y4FnQogQQcblIWA==
X-Received: by 2002:a17:90b:1047:b0:226:5b14:4af with SMTP id
 gq7-20020a17090b104700b002265b1404afmr26379899pjb.38.1673077891301; 
 Fri, 06 Jan 2023 23:51:31 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 12/27] tcg/s390x: Distinguish RRF-a and RRF-c formats
Date: Fri,  6 Jan 2023 23:51:03 -0800
Message-Id: <20230107075118.1814503-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

One has 3 register arguments; the other has 2 plus an m3 field.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 57 +++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 6cf07152a5..d38a602dd9 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -172,18 +172,19 @@ typedef enum S390Opcode {
     RRE_SLBGR   = 0xb989,
     RRE_XGR     = 0xb982,
 
-    RRF_LOCR    = 0xb9f2,
-    RRF_LOCGR   = 0xb9e2,
-    RRF_NRK     = 0xb9f4,
-    RRF_NGRK    = 0xb9e4,
-    RRF_ORK     = 0xb9f6,
-    RRF_OGRK    = 0xb9e6,
-    RRF_SRK     = 0xb9f9,
-    RRF_SGRK    = 0xb9e9,
-    RRF_SLRK    = 0xb9fb,
-    RRF_SLGRK   = 0xb9eb,
-    RRF_XRK     = 0xb9f7,
-    RRF_XGRK    = 0xb9e7,
+    RRFa_NRK    = 0xb9f4,
+    RRFa_NGRK   = 0xb9e4,
+    RRFa_ORK    = 0xb9f6,
+    RRFa_OGRK   = 0xb9e6,
+    RRFa_SRK    = 0xb9f9,
+    RRFa_SGRK   = 0xb9e9,
+    RRFa_SLRK   = 0xb9fb,
+    RRFa_SLGRK  = 0xb9eb,
+    RRFa_XRK    = 0xb9f7,
+    RRFa_XGRK   = 0xb9e7,
+
+    RRFc_LOCR   = 0xb9f2,
+    RRFc_LOCGR  = 0xb9e2,
 
     RR_AR       = 0x1a,
     RR_ALR      = 0x1e,
@@ -538,8 +539,14 @@ static void tcg_out_insn_RRE(TCGContext *s, S390Opcode op,
     tcg_out32(s, (op << 16) | (r1 << 4) | r2);
 }
 
-static void tcg_out_insn_RRF(TCGContext *s, S390Opcode op,
-                             TCGReg r1, TCGReg r2, int m3)
+static void tcg_out_insn_RRFa(TCGContext *s, S390Opcode op,
+                              TCGReg r1, TCGReg r2, TCGReg r3)
+{
+    tcg_out32(s, (op << 16) | (r3 << 12) | (r1 << 4) | r2);
+}
+
+static void tcg_out_insn_RRFc(TCGContext *s, S390Opcode op,
+                              TCGReg r1, TCGReg r2, int m3)
 {
     tcg_out32(s, (op << 16) | (m3 << 12) | (r1 << 4) | r2);
 }
@@ -1324,7 +1331,7 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
     /* Emit: d = 0, t = 1, d = (cc ? t : d).  */
     tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
     tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, 1);
-    tcg_out_insn(s, RRF, LOCGR, dest, TCG_TMP0, cc);
+    tcg_out_insn(s, RRFc, LOCGR, dest, TCG_TMP0, cc);
 }
 
 static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
@@ -1335,7 +1342,7 @@ static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
     if (v3const) {
         tcg_out_insn(s, RIE, LOCGHI, dest, v3, cc);
     } else {
-        tcg_out_insn(s, RRF, LOCGR, dest, v3, cc);
+        tcg_out_insn(s, RRFc, LOCGR, dest, v3, cc);
     }
 }
 
@@ -1356,7 +1363,7 @@ static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
             tcg_out_mov(s, TCG_TYPE_I64, dest, a2);
         }
         /* Emit: if (one bit found) dest = r0.  */
-        tcg_out_insn(s, RRF, LOCGR, dest, TCG_REG_R0, 2);
+        tcg_out_insn(s, RRFc, LOCGR, dest, TCG_REG_R0, 2);
     }
 }
 
@@ -1960,7 +1967,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, SR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, SRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, SRK, a0, a1, a2);
         }
         break;
 
@@ -1972,7 +1979,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, NR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, NRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, NRK, a0, a1, a2);
         }
         break;
     case INDEX_op_or_i32:
@@ -1983,7 +1990,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, OR, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, ORK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, ORK, a0, a1, a2);
         }
         break;
     case INDEX_op_xor_i32:
@@ -1994,7 +2001,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         } else if (a0 == a1) {
             tcg_out_insn(s, RR, XR, args[0], args[2]);
         } else {
-            tcg_out_insn(s, RRF, XRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, XRK, a0, a1, a2);
         }
         break;
 
@@ -2220,7 +2227,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             a2 = -a2;
             goto do_addi_64;
         } else {
-            tcg_out_insn(s, RRF, SGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, SGRK, a0, a1, a2);
         }
         break;
 
@@ -2230,7 +2237,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
             tgen_andi(s, TCG_TYPE_I64, args[0], args[2]);
         } else {
-            tcg_out_insn(s, RRF, NGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, NGRK, a0, a1, a2);
         }
         break;
     case INDEX_op_or_i64:
@@ -2239,7 +2246,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
             tgen_ori(s, TCG_TYPE_I64, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, OGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, OGRK, a0, a1, a2);
         }
         break;
     case INDEX_op_xor_i64:
@@ -2248,7 +2255,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
             tcg_out_mov(s, TCG_TYPE_I64, a0, a1);
             tgen_xori(s, TCG_TYPE_I64, a0, a2);
         } else {
-            tcg_out_insn(s, RRF, XGRK, a0, a1, a2);
+            tcg_out_insn(s, RRFa, XGRK, a0, a1, a2);
         }
         break;
 
-- 
2.34.1


