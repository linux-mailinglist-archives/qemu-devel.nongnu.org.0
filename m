Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4490F660CDC
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:55:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zQ-0003iU-VC; Sat, 07 Jan 2023 02:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zI-0003fN-1x
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:32 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zF-0004BL-0W
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:31 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d15so4073288pls.6
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qi68E482PW7NHCokeYFK7Lpbw/UGKcQkHkgYJ1MLk5A=;
 b=d7zGOm5arCGfU3dfZbZTGnZ3I87xDl8tS64ywJwAkxk9cMAtLc5vuCHN0lY2a6AQ5M
 evrzp/iQyTO2Z7ZPmNN6b6J2C8lYIjembQWKOP18W2vTbysKtDzhKfwZ0jsYKa650hd4
 MMPFZDG4HtfD+em4IsyKNlsRsmxAIUoBFlDoscCo09XLLTgnaMdbrEXnK6IRUq+Z+K2N
 lnO3HCfkWYNsNM19xV3Mza8ZX/FPonZKCxac6zHNBK+BeEniIifYK6e0Y2KwJyRuTWnx
 L8jcajYp2L96rKu1xYFGlfILA/0S0ZcxvlQvOlk/YiI0U1f8Xry7pnCkZHtO7jQrsGBn
 aElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qi68E482PW7NHCokeYFK7Lpbw/UGKcQkHkgYJ1MLk5A=;
 b=ldCcaH2DrSg6CuR9m/rFPv1KNhxppFE8B0Io023uwX+4CsFuv9XOcFe/t1wMEzkX+s
 cv+ijmXdCCOONb0/ANgcb0B9WOjE2Y1ODv6eNLOkrnk7vYG5u4VGWUzZj/5Udpx7NWzR
 /iV+JNKHF9W23CjC53db+3ZxOVNMpcPdLqcDmAyo7ttRuhfQMu041RR2Kw3AxcSCTuLw
 LbQ6FwIIyF2DIfNo8ErR+9h4XbGOGvpqKHLlvHhWNF59V7FbOGDuvVY5zCRGHy2mg5Fu
 tdAihqQhQHVY3zNRo5DO+fFw1Lypce8nUh3HlG1F4JTC8UViJrPi0PHFEpqcr2J36g9W
 28bg==
X-Gm-Message-State: AFqh2kosYqzyUwSvls4GnBpIuDyxOICP2G31j8pu0bSYPQr9+hPrEHxt
 PlqGKo/kZMlp6au7yge9eCJUKLeJe6rnXcii
X-Google-Smtp-Source: AMrXdXtjzsFFp6HytNfR8Rc98wzFvsqlLeLtsj7M3cg6IqB/0l0y27bB1yGKM5US89KEIo2cR4eOHg==
X-Received: by 2002:a17:90a:ac04:b0:225:ad50:3b18 with SMTP id
 o4-20020a17090aac0400b00225ad503b18mr59472181pjq.25.1673077887601; 
 Fri, 06 Jan 2023 23:51:27 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 08/27] tcg/s390x: Check for load-on-condition facility at
 startup
Date: Fri,  6 Jan 2023 23:50:59 -0800
Message-Id: <20230107075118.1814503-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
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

The general-instruction-extension facility was introduced in z196,
which itself was end-of-life in 2021.  In addition, z196 is the
minimum CPU supported by our set of supported operating systems:
RHEL 7 (z196), SLES 12 (z196) and Ubuntu 16.04 (zEC12).

Check for facility number 45, which will be the consilidated check
for several facilities.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  6 ++--
 tcg/s390x/tcg-target.c.inc | 72 +++++++++++++-------------------------
 2 files changed, 27 insertions(+), 51 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index d47e8ba66a..31d5510d2d 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -58,12 +58,12 @@ typedef enum TCGReg {
 #define FACILITY_LONG_DISP            18
 #define FACILITY_EXT_IMM              21
 #define FACILITY_GEN_INST_EXT         34
+#define FACILITY_45                   45
 
 /* Facilities that are checked at runtime. */
 
-#define FACILITY_LOAD_ON_COND         45
-#define FACILITY_FAST_BCR_SER         FACILITY_LOAD_ON_COND
-#define FACILITY_DISTINCT_OPS         FACILITY_LOAD_ON_COND
+#define FACILITY_FAST_BCR_SER         45
+#define FACILITY_DISTINCT_OPS         45
 #define FACILITY_LOAD_ON_COND2        53
 #define FACILITY_VECTOR               129
 #define FACILITY_VECTOR_ENH1          135
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index f0b581293c..29a64ad0fe 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1252,7 +1252,6 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
                          TCGReg dest, TCGReg c1, TCGArg c2, int c2const)
 {
     int cc;
-    bool have_loc;
 
     /* With LOC2, we can always emit the minimum 3 insns.  */
     if (HAVE_FACILITY(LOAD_ON_COND2)) {
@@ -1263,9 +1262,6 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
         return;
     }
 
-    have_loc = HAVE_FACILITY(LOAD_ON_COND);
-
-    /* For HAVE_LOC, only the paths through GTU/GT/LEU/LE are smaller.  */
  restart:
     switch (cond) {
     case TCG_COND_NE:
@@ -1310,59 +1306,35 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
     case TCG_COND_LT:
     case TCG_COND_GE:
         /* Swap operands so that we can use LEU/GTU/GT/LE.  */
-        if (c2const) {
-            if (have_loc) {
-                break;
-            }
-            tcg_out_movi(s, type, TCG_TMP0, c2);
-            c2 = c1;
-            c2const = 0;
-            c1 = TCG_TMP0;
-        } else {
+        if (!c2const) {
             TCGReg t = c1;
             c1 = c2;
             c2 = t;
+            cond = tcg_swap_cond(cond);
+            goto restart;
         }
-        cond = tcg_swap_cond(cond);
-        goto restart;
+        break;
 
     default:
         g_assert_not_reached();
     }
 
     cc = tgen_cmp(s, type, cond, c1, c2, c2const, false);
-    if (have_loc) {
-        /* Emit: d = 0, t = 1, d = (cc ? t : d).  */
-        tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
-        tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, 1);
-        tcg_out_insn(s, RRF, LOCGR, dest, TCG_TMP0, cc);
-    } else {
-        /* Emit: d = 1; if (cc) goto over; d = 0; over:  */
-        tcg_out_movi(s, type, dest, 1);
-        tcg_out_insn(s, RI, BRC, cc, (4 + 4) >> 1);
-        tcg_out_movi(s, type, dest, 0);
-    }
+    /* Emit: d = 0, t = 1, d = (cc ? t : d).  */
+    tcg_out_movi(s, TCG_TYPE_I64, dest, 0);
+    tcg_out_movi(s, TCG_TYPE_I64, TCG_TMP0, 1);
+    tcg_out_insn(s, RRF, LOCGR, dest, TCG_TMP0, cc);
 }
 
 static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
                          TCGReg c1, TCGArg c2, int c2const,
                          TCGArg v3, int v3const)
 {
-    int cc;
-    if (HAVE_FACILITY(LOAD_ON_COND)) {
-        cc = tgen_cmp(s, type, c, c1, c2, c2const, false);
-        if (v3const) {
-            tcg_out_insn(s, RIE, LOCGHI, dest, v3, cc);
-        } else {
-            tcg_out_insn(s, RRF, LOCGR, dest, v3, cc);
-        }
+    int cc = tgen_cmp(s, type, c, c1, c2, c2const, false);
+    if (v3const) {
+        tcg_out_insn(s, RIE, LOCGHI, dest, v3, cc);
     } else {
-        c = tcg_invert_cond(c);
-        cc = tgen_cmp(s, type, c, c1, c2, c2const, false);
-
-        /* Emit: if (cc) goto over; dest = r3; over:  */
-        tcg_out_insn(s, RI, BRC, cc, (4 + 4) >> 1);
-        tcg_out_insn(s, RRE, LGR, dest, v3);
+        tcg_out_insn(s, RRF, LOCGR, dest, v3, cc);
     }
 }
 
@@ -1382,14 +1354,8 @@ static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
         } else {
             tcg_out_mov(s, TCG_TYPE_I64, dest, a2);
         }
-        if (HAVE_FACILITY(LOAD_ON_COND)) {
-            /* Emit: if (one bit found) dest = r0.  */
-            tcg_out_insn(s, RRF, LOCGR, dest, TCG_REG_R0, 2);
-        } else {
-            /* Emit: if (no one bit found) goto over; dest = r0; over:  */
-            tcg_out_insn(s, RI, BRC, 8, (4 + 4) >> 1);
-            tcg_out_insn(s, RRE, LGR, dest, TCG_REG_R0);
-        }
+        /* Emit: if (one bit found) dest = r0.  */
+        tcg_out_insn(s, RRF, LOCGR, dest, TCG_REG_R0, 2);
     }
 }
 
@@ -3124,6 +3090,7 @@ static void query_s390_facilities(void)
     }
 
     /*
+     * Minimum supported cpu revision is z196.
      * Check for all required facilities.
      * ZARCH_ACTIVE is done via preprocessor check for 64-bit.
      */
@@ -3139,6 +3106,15 @@ static void query_s390_facilities(void)
         which = "general-instructions-extension";
         goto fail;
     }
+    /*
+     * Facility 45 is a big bin that contains: distinct-operands,
+     * fast-BCR-serialization, high-word, population-count,
+     * interlocked-access-1, and load/store-on-condition-1
+     */
+    if (!HAVE_FACILITY(45)) {
+        which = "45";
+        goto fail;
+    }
     return;
 
  fail:
-- 
2.34.1


