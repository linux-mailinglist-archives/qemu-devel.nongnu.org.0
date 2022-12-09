Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E49647C03
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:10:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slm-0005w6-MV; Thu, 08 Dec 2022 21:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sll-0005vE-DK
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:45 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slj-0001vW-LQ
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:45 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 l8-20020a056830054800b006705fd35eceso1976110otb.12
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4n6658V8gzuBQVeX0F+T4ObLOLK7n60xjvBN2Tekig=;
 b=ZaH47SsZ5p/Af+izYy/fULz6+LtGGrw8NgJVoKzVBkBxO2dRonww80HhSf/Z00SLSs
 rT6cYFNodAGaMIkxTLLfO9CyOtHobz8qyh/dFjGfwKwy3XPHxCqJJvUaHtKOrM2xaKXL
 2yi1VhlaNi6B8ZzKZsQNYgs06s6EabT6+X3I5x9tV+XSdmj/Ccu/ARGbzveT/jFhpj1R
 5d0PthhEGQkU2W9lnQLIn4fV3kz6R1vLKaWBnLzow/JdK8PIoiXP4wA6civSUj4Wwi9S
 TJn5R/k8r+Ilw29zibY1J+9tHG2NA9ZLcQZm9y2gW0lCjjmRWpFYYo4mBqPpE7IVMNwH
 Gwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4n6658V8gzuBQVeX0F+T4ObLOLK7n60xjvBN2Tekig=;
 b=RzHvpCiH46v2QdNWwHZt6bqOR24X6gr2NdycfZRfgCjCrdoecrOfffFwFncIkMJyMR
 EHtUy2vqYh0RCqTJRZteOYN7AGHj11zRi6a5qeySrwqZ7dhI6nrvQpnxTBc5cTVdSr7G
 TzdrS8AKQF/bIbFnxz2npBmeXwvmhknVT2zYj8ed5pSUisSBoTx8+Y+vyHmXFn5j4m2P
 6BRHKE8Mn36vHkAoNKVpo5RnrvRjWpQ3paYDs8fem6RlFZx3CmRPccMEVXe3lPghV+q/
 e/miYkla5GW5xMJi2I90mqDzwhMnx2HVNe/HCrVIxbc5tuySz/GXEiv6CellOtLDWlq/
 eS/A==
X-Gm-Message-State: ANoB5pnsA78aloOhpHaAsr4P13QeWVL53XPk0H85Gc6cdLUQXFst85PO
 JxT7PX28BHta5whLw9gsTF/hkJlii9N/xMV5I14=
X-Google-Smtp-Source: AA0mqf74uP3aWSTsUL7bnnMRtgmx6khK0dSY3XbUJs1vIMBfYLnRgA5MBqjRTl5BPrX5s7IxTh6KTw==
X-Received: by 2002:a9d:30f:0:b0:670:5bc0:fd66 with SMTP id
 15-20020a9d030f000000b006705bc0fd66mr1753608otv.30.1670551542325; 
 Thu, 08 Dec 2022 18:05:42 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 08/27] tcg/s390x: Check for load-on-condition facility at
 startup
Date: Thu,  8 Dec 2022 20:05:11 -0600
Message-Id: <20221209020530.396391-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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


