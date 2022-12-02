Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3576400C3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:58:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuD-0007bt-0T; Fri, 02 Dec 2022 01:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zuA-0007aP-BY
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:14 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu8-0003is-J6
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:14 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 82so3706314pgc.0
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k7bPsv0avo+ZkLhyF6N/wgL5oGyNcPHPmhD8reBv+lg=;
 b=a/QhVP6e591p28Ut+mJWrJClvJvbngK/sGOVOrliTcpd8b7M0AFt7YLIS28hctdISg
 hxha21B2J3jlCWAdOneAQMgqQV8ly/UcnygYVCtPujdQJtzoboMmx8QvIFs8vcrFpx+e
 MjFans12mpIVNV2DtmRWewZ8Fsus2wjdxDkluOiJzEP4VWNDDm01sTA7MpbuK6G3GlX6
 uWy+o7BRAPpRgN3gtINQo4tCXwbveD8zTPRiDXzidj+ioit+KEdsUq7z4qojQzNLbS/s
 X5niWwy1sRPDVFnp/DFAAs36LrTeighmwZHeMDKpS3FxEzLQoZDJXXcmks0iFq5uqC63
 XT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k7bPsv0avo+ZkLhyF6N/wgL5oGyNcPHPmhD8reBv+lg=;
 b=B3zP/cCjaEeWbh64Sk2+NfEOtZZ8V4aS99NpQEzN+U7+licHtdvV5auj7519R78o6C
 BLXmY4PObaPpjQD+UcsnQ1Ytr96XrKKKsxJ9TeJEs6xu1qcLWKhrYTHk+BbleyEXyr8B
 LeQG833KnROMqtAPkC7HpjLvMU83WQIMOtEICDggdFLihG5UNvUrKdI1NUinoFtJj/ZO
 2Lsvo0NsoKgbAEPQ/hJHYizvYxmMfKpIXKP3XV1iMHr5XtyPp5K/drNRPP4UEZetL5X+
 aP71wAFw8b4jc0VL3fA4Opq9WAyiaePteSO36rnTqP9UTxrP/oAUYpb3p5YJUs14UG+8
 f95g==
X-Gm-Message-State: ANoB5pkblxyVWr1umOO8VWJiZcMrZGDgyZrnI4tDuABpFqZ4DdUpGyyV
 teXmv+1GB4IDeuPnOeJRInWUdAdjopGwkC3I
X-Google-Smtp-Source: AA0mqf6BCbJ2FLkyVbJKfBjUwU0Kb5FjKBLgwj5SC924bIZZtt7wWdhXUpqgQr7D5sm25S4r+i78Yw==
X-Received: by 2002:a63:1c55:0:b0:477:d9fe:c3b0 with SMTP id
 c21-20020a631c55000000b00477d9fec3b0mr32561117pgm.445.1669963931256; 
 Thu, 01 Dec 2022 22:52:11 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 10/13] tcg/s390x: Generalize movcond implementation
Date: Thu,  1 Dec 2022 22:51:57 -0800
Message-Id: <20221202065200.224537-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Generalize movcond to support pre-computed conditions, and the same
set of arguments at all times.  This will be assumed by a following
patch, which needs to reuse tgen_movcond_int.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  3 +-
 tcg/s390x/tcg-target.c.inc     | 78 ++++++++++++++++++++++++++--------
 2 files changed, 61 insertions(+), 20 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index dc271a6d11..86cdc248f2 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -29,8 +29,7 @@ C_O1_I2(r, rZ, r)
 C_O1_I2(v, v, r)
 C_O1_I2(v, v, v)
 C_O1_I3(v, v, v, v)
-C_O1_I4(r, r, ri, r, 0)
-C_O1_I4(r, r, ri, rI, 0)
+C_O1_I4(r, r, ri, rI, r)
 C_O2_I2(o, m, 0, r)
 C_O2_I2(o, m, r, r)
 C_O2_I3(o, m, 0, 1, r)
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index fad86f01f3..b2adbbe7de 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1461,25 +1461,69 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
     }
 }
 
+static void tgen_movcond_int(TCGContext *s, TCGType type, TCGReg dest,
+                             TCGArg v3, int v3const, TCGReg v4,
+                             int cc, int inv_cc)
+{
+    TCGReg src;
+
+    /* If dest != v4, LGR+LOCGHI is larger than LGHI+{LOCGR,SELGR}. */
+    if (HAVE_FACILITY(LOAD_ON_COND2) && v3const && dest == v4) {
+        /* Emit: if (cc) dest = v3. */
+        tcg_out_insn(s, RIEg, LOCGHI, dest, v3, cc);
+        return;
+    }
+
+    if (HAVE_FACILITY(LOAD_ON_COND)) {
+        if (dest == v4) {
+            if (v3const) {
+                tcg_out_insn(s, RI, LGHI, TCG_TMP0, v3);
+                src = TCG_TMP0;
+            } else {
+                src = v3;
+            }
+        } else {
+            if (v3const) {
+                tcg_out_insn(s, RI, LGHI, dest, v3);
+            } else {
+                tcg_out_mov(s, type, dest, v3);
+            }
+            cc = inv_cc;
+            src = v4;
+        }
+        /* Emit: if (cc) dest = src. */
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
+    if (dest == v4) {
+        src = v3;
+    } else {
+        tcg_out_mov(s, type, dest, v3);
+        inv_cc = cc;
+        src = v4;
+    }
+    /* Emit: if (!cc) goto over; dest = src; over:  */
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
@@ -2352,7 +2396,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_movcond_i32:
         tgen_movcond(s, TCG_TYPE_I32, args[5], args[0], args[1],
-                     args[2], const_args[2], args[3], const_args[3]);
+                     args[2], const_args[2], args[3], const_args[3], args[4]);
         break;
 
     case INDEX_op_qemu_ld_i32:
@@ -2644,7 +2688,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_movcond_i64:
         tgen_movcond(s, TCG_TYPE_I64, args[5], args[0], args[1],
-                     args[2], const_args[2], args[3], const_args[3]);
+                     args[2], const_args[2], args[3], const_args[3], args[4]);
         break;
 
     OP_32_64(deposit):
@@ -3256,9 +3300,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
-        return (HAVE_FACILITY(LOAD_ON_COND2)
-                ? C_O1_I4(r, r, ri, rI, 0)
-                : C_O1_I4(r, r, ri, r, 0));
+        return C_O1_I4(r, r, ri, rI, r);
 
     case INDEX_op_div2_i32:
     case INDEX_op_div2_i64:
-- 
2.34.1


