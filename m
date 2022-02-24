Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312944C3065
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:54:37 +0100 (CET)
Received: from localhost ([::1]:38314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGRw-0000XV-8Q
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:54:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHV-0003kW-Vd
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:50 -0500
Received: from [2607:f8b0:4864:20::42e] (port=37813
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHT-0008Kx-OQ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:49 -0500
Received: by mail-pf1-x42e.google.com with SMTP id y5so2216245pfe.4
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z0GI/QmcnqT2cyB3xSBWFerN/uSLTGlsPOMWodd95pI=;
 b=b2C7xfoWkPj4z++ARvuya1eGBAbkxehKxwovw8jSd9SiFT6WaKh4jFqnQDhSpTnb3r
 Vuejri6V67kWlxOzvUW15t3Du0Bim5kVQbOfrqhiilhV2FSGq8f8EmKY6Oh3GbocC35U
 UucLeRRyldp6RWBpwRt4CNs49hvBmQo0T/uYd9vGieAIJy+DKnT0CtInknB1YTyKhhR0
 mQmyVwZRGsEiHmEKc6oRepu3IZZ+aQX6pfbyrUKSnsksd5iYeV3LMBMRni4tKOq/gIOi
 K6vj6+xKVuX4Plvhbx9pMir9lcYSW7EYkyouAzYuXsAFlS+pxfqF8iYTQVYgGOk0GSgE
 BOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z0GI/QmcnqT2cyB3xSBWFerN/uSLTGlsPOMWodd95pI=;
 b=nFwQaGXdO+vqh/bUlfBuUMSX40eVFGIgLL06Fcn3s53SLHbktc7SMQWDlATsccBQIb
 c82IYgeDFhJ0PuPaByLBFD3SDWrfUsKbVZGNJgqnxk7MSKCc7QD8NVdrSvWPTN1czDIK
 hAE+UEt5Jfqj6uadBgLFUw4VYVrM0IMQKSUNW456JNoS9HYdedlWUWkMPuvHzM4aaoqe
 wOZp++xKCLw5c85iN7Cp5vzbHuIXdXOnrTjbWuQVDBr6+vaFKMQ+LgzB3Fa2kDT7D/BW
 ZNvtYvPkXefwVYwx9k3rynNo7+FDA9yXBcGzbTSS4MgRHD+LqY9Tjaqb7vNGJjnvVxId
 Sd4g==
X-Gm-Message-State: AOAM533SF0ORq8Vh2G6PLQiKNE9sTIfJbSnwo8Y8U/JBM3ip+RKd/F6r
 VuEevRltL96is+QekClnODqA7G6wPmDOoQ==
X-Google-Smtp-Source: ABdhPJyU6u2ud/yLneVggajFPwgzNuezfFLJ2YKbUbHkDvIBd74PgBejV1xpnEYN1lvG9WBAxjSCpg==
X-Received: by 2002:a63:4560:0:b0:370:1f21:36b8 with SMTP id
 u32-20020a634560000000b003701f2136b8mr2696905pgk.181.1645717426426; 
 Thu, 24 Feb 2022 07:43:46 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v20sm3198062pju.9.2022.02.24.07.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:43:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/10] tcg/s390x: Support SELGR instruction in MOVCOND
Date: Thu, 24 Feb 2022 05:43:30 -1000
Message-Id: <20220224154333.125185-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224154333.125185-1-richard.henderson@linaro.org>
References: <20220224154333.125185-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, david@redhat.com, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new select instruction provides two separate register inputs,
whereas the old load-on-condition instruction overlaps one of the
register inputs with the destination.

Generalize movcond to support pre-computed conditions, and the same
set of arguments at all times.  This allows, but does not require,
MIE3 and LOC2 facilities at the same time.  It will also be assumed
by a following patch, which needs to reuse tgen_movcond_int.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  3 +-
 tcg/s390x/tcg-target.c.inc     | 99 +++++++++++++++++++++++++++-------
 2 files changed, 82 insertions(+), 20 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 37801983f1..38ebce3594 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -29,8 +29,7 @@ C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
-C_O1_I4(r, r, ri, r, 0)
-C_O1_I4(r, r, ri, rI, 0)
+C_O1_I4(r, r, ri, rI, r)
 C_O2_I2(b, a, 0, r)
 C_O2_I2(b, a, r, r)
 C_O2_I3(b, a, 0, 1, r)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 18b8ca3132..8edad2c390 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -210,6 +210,8 @@ typedef enum S390Opcode {
     RRFa_XRK    = 0xb9f7,
     RRFa_XGRK   = 0xb9e7,
 
+    RRFa4_SELGR  = 0xb9e3,  /* RRF-a with the m4 field */
+
     RRFc_LOCR   = 0xb9f2,
     RRFc_LOCGR  = 0xb9e2,
 
@@ -564,12 +566,20 @@ static void tcg_out_insn_RRE(TCGContext *s, S390Opcode op,
     tcg_out32(s, (op << 16) | (r1 << 4) | r2);
 }
 
+/* RRF-a without the m4 field */
 static void tcg_out_insn_RRFa(TCGContext *s, S390Opcode op,
                               TCGReg r1, TCGReg r2, TCGReg r3)
 {
     tcg_out32(s, (op << 16) | (r3 << 12) | (r1 << 4) | r2);
 }
 
+/* RRF-a with the m4 field */
+static void tcg_out_insn_RRFa4(TCGContext *s, S390Opcode op,
+                               TCGReg r1, TCGReg r2, TCGReg r3, int m4)
+{
+    tcg_out32(s, (op << 16) | (r3 << 12) | (m4 << 8) | (r1 << 4) | r2);
+}
+
 static void tcg_out_insn_RRFc(TCGContext *s, S390Opcode op,
                               TCGReg r1, TCGReg r2, int m3)
 {
@@ -1562,25 +1572,80 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
     }
 }
 
+static void tgen_movcond_int(TCGContext *s, TCGType type, TCGReg dest,
+                             TCGArg v3, int v3const, TCGReg v4,
+                             int cc, int inv_cc)
+{
+    TCGReg src;
+
+    if (v3const && HAVE_FACILITY(LOAD_ON_COND2)) {
+        tcg_out_mov(s, type, dest, v4);
+        /* Emit: if (cc) dest = v3. */
+        tcg_out_insn(s, RIEg, LOCGHI, dest, v3, cc);
+        return;
+    }
+
+    /* Note that while MIE3 implies LOC, it does not imply LOC2. */
+    if (HAVE_FACILITY(MISC_INSN_EXT3)) {
+        if (v3const) {
+            tcg_out_insn(s, RI, LGHI, TCG_TMP0, v3);
+            v3 = TCG_TMP0;
+        }
+        /* Emit: dest = cc ? v3 : v4. */
+        tcg_out_insn(s, RRFa4, SELGR, dest, v3, v4, cc);
+        return;
+    }
+
+    if (HAVE_FACILITY(LOAD_ON_COND)) {
+        if (v3const) {
+            if (dest == v4) {
+                tcg_out_insn(s, RI, LGHI, TCG_TMP0, v3);
+                src = TCG_TMP0;
+            } else {
+                tcg_out_insn(s, RI, LGHI, dest, v3);
+                cc = inv_cc;
+                src = v4;
+            }
+        } else if (dest == v3) {
+            cc = inv_cc;
+            src = v4;
+        } else {
+            tcg_out_mov(s, type, dest, v4);
+            src = v3;
+        }
+        /* Emit: if (cc) dest = v3. */
+        tcg_out_insn(s, RRFc, LOCGR, dest, src, cc);
+        return;
+    }
+
+    if (v3const) {
+        tcg_out_mov(s, type, dest, v4);
+        /* Emit: if (!cc) goto over; dest = r3; over:  */
+        tcg_out_insn(s, RI, BRC, inv_cc, (4 + 4) >> 1);
+        tcg_out_insn(s, RI, LGHI, dest, v3);
+        return;
+    }
+
+    if (dest == v3) {
+        src = v4;
+        inv_cc = cc;
+    } else {
+        tcg_out_mov(s, type, dest, v4);
+        src = v3;
+    }
+    /* Emit: if (!cc) goto over; dest = r3; over:  */
+    tcg_out_insn(s, RI, BRC, inv_cc, (4 + 4) >> 1);
+    tcg_out_insn(s, RRE, LGR, dest, src);
+}
+
 static void tgen_movcond(TCGContext *s, TCGType type, TCGCond c, TCGReg dest,
                          TCGReg c1, TCGArg c2, int c2const,
-                         TCGArg v3, int v3const)
+                         TCGArg v3, int v3const, TCGReg v4)
 {
     int cc, inv_cc;
 
     cc = tgen_cmp2(s, type, c, c1, c2, c2const, false, &inv_cc);
-
-    if (HAVE_FACILITY(LOAD_ON_COND)) {
-        if (v3const) {
-            tcg_out_insn(s, RIEg, LOCGHI, dest, v3, cc);
-        } else {
-            tcg_out_insn(s, RRFc, LOCGR, dest, v3, cc);
-        }
-    } else {
-        /* Emit: if (cc) goto over; dest = r3; over:  */
-        tcg_out_insn(s, RI, BRC, inv_cc, (4 + 4) >> 1);
-        tcg_out_insn(s, RRE, LGR, dest, v3);
-    }
+    tgen_movcond_int(s, type, dest, v3, v3const, v4, cc, inv_cc);
 }
 
 static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
@@ -2460,7 +2525,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_movcond_i32:
         tgen_movcond(s, TCG_TYPE_I32, args[5], args[0], args[1],
-                     args[2], const_args[2], args[3], const_args[3]);
+                     args[2], const_args[2], args[3], const_args[3], args[4]);
         break;
 
     case INDEX_op_qemu_ld_i32:
@@ -2737,7 +2802,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_movcond_i64:
         tgen_movcond(s, TCG_TYPE_I64, args[5], args[0], args[1],
-                     args[2], const_args[2], args[3], const_args[3]);
+                     args[2], const_args[2], args[3], const_args[3], args[4]);
         break;
 
     OP_32_64(deposit):
@@ -3336,9 +3401,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
-        return (HAVE_FACILITY(LOAD_ON_COND2)
-                ? C_O1_I4(r, r, ri, rI, 0)
-                : C_O1_I4(r, r, ri, r, 0));
+        return C_O1_I4(r, r, ri, rI, r);
 
     case INDEX_op_div2_i32:
     case INDEX_op_div2_i64:
-- 
2.25.1


