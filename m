Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D4647C12
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Sm7-000621-9S; Thu, 08 Dec 2022 21:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slz-00061g-Tp
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:59 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sly-0001ym-7d
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:59 -0500
Received: by mail-oi1-x235.google.com with SMTP id c129so3306930oia.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gx7T/PYZU254lwrsHZ56yxEYIpVsjroGfvIVha75a6k=;
 b=atHepb2sdz2dv1kFCvduur+6Ht3OG2T33+Bo7R5Qs3j1HR10baLLX/e2gtaMn8/dxo
 Mq79XgO+yKu6hRjfTyBgSeSB2lEzCxfsZqNHEgtoPVfq6o8rL6o7IpNXiwh4EPgH7Srq
 cXND6zxpHAS+HzuMQbp3Jh5DV1dKYySaJHNiGfWUw8mWvXjulfPsG7J0usnQ6Ey3ydEo
 QWIRFP6occNPCzmx/v/k5/M3Z+4y52c1EC0DVb7vnTFfZWnf6TTA5+DaPnMZ+IQA5o/M
 czHnoSpyn8ye+mSF2LP8hy2zMQtTveaxIe6+bAbb0mlX/657FhAXljj7ZXmzNKT6aAeJ
 7Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gx7T/PYZU254lwrsHZ56yxEYIpVsjroGfvIVha75a6k=;
 b=T3pb39MXlkJZ9rx/hVHbyMOUBcdJypmApGnaB3ZK8Q3Du7jBVMB3hbdn65iL+QUiDL
 odlHJwgQifS7lFc1YvooBRUXqQIgvDKoUU7QFNU82uXGLOLgd22FISJaG2urWw/IcpSe
 e2gOCta/UOP72dzb2vyIaA/v9Zbau8KhwaC5f+/ql9/fuXjfJnZJcyV9H2yu/BqsLHG9
 +4H/4mI2Oo13mDIEnBBNpP6/1etm7Nry1tJQafo72tViuAiY/rimbM5u7z/7+b/2wv1h
 +oVsCc+apKDq+R4xJqd0If5h/fuNEx4miG2k+RmJ3XFxg021ZCux1zlDLqUh0zH6gyNw
 7jpw==
X-Gm-Message-State: ANoB5pn1SMdV/BpkNVQ+R9hui5yBRa5v4KnxCAS96tpYtzfujHodhKW6
 TyWBAimc9Qv7ikDV5NwAh0o7AP1rFqjjqj3fYnY=
X-Google-Smtp-Source: AA0mqf5bbTHo4jllAOUMGOQRFrLcmIK+tjajN23Joh1dR62C3kwPwb+KcKz84mSczrdHreWrcF8hkg==
X-Received: by 2002:aca:dfd6:0:b0:35a:1124:227d with SMTP id
 w205-20020acadfd6000000b0035a1124227dmr1765777oig.3.1670551557117; 
 Thu, 08 Dec 2022 18:05:57 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 21/27] tcg/s390x: Generalize movcond implementation
Date: Thu,  8 Dec 2022 20:05:24 -0600
Message-Id: <20221209020530.396391-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h |  3 +-
 tcg/s390x/tcg-target.c.inc     | 52 ++++++++++++++++++++++++++--------
 2 files changed, 41 insertions(+), 14 deletions(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index b194ad7f03..8cf8ed4dff 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -33,8 +33,7 @@ C_O1_I2(r, rZ, r)
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
index a9e3b4a9b9..30c12052f0 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1354,19 +1354,49 @@ static void tgen_setcond(TCGContext *s, TCGType type, TCGCond cond,
     tcg_out_insn(s, RRFc, LOCGR, dest, TCG_TMP0, cc);
 }
 
+static void tgen_movcond_int(TCGContext *s, TCGType type, TCGReg dest,
+                             TCGArg v3, int v3const, TCGReg v4,
+                             int cc, int inv_cc)
+{
+    TCGReg src;
+
+    if (v3const) {
+        if (dest == v4) {
+            if (HAVE_FACILITY(LOAD_ON_COND2)) {
+                /* Emit: if (cc) dest = v3. */
+                tcg_out_insn(s, RIEg, LOCGHI, dest, v3, cc);
+                return;
+            }
+            tcg_out_insn(s, RI, LGHI, TCG_TMP0, v3);
+            src = TCG_TMP0;
+        } else {
+            /* LGR+LOCGHI is larger than LGHI+LOCGR. */
+            tcg_out_insn(s, RI, LGHI, dest, v3);
+            cc = inv_cc;
+            src = v4;
+        }
+    } else {
+        if (dest == v4) {
+            src = v3;
+        } else {
+            tcg_out_mov(s, type, dest, v3);
+            cc = inv_cc;
+            src = v4;
+        }
+    }
+
+    /* Emit: if (cc) dest = src. */
+    tcg_out_insn(s, RRFc, LOCGR, dest, src, cc);
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
-    if (v3const) {
-        tcg_out_insn(s, RIEg, LOCGHI, dest, v3, cc);
-    } else {
-        tcg_out_insn(s, RRFc, LOCGR, dest, v3, cc);
-    }
+    tgen_movcond_int(s, type, dest, v3, v3const, v4, cc, inv_cc);
 }
 
 static void tgen_clz(TCGContext *s, TCGReg dest, TCGReg a1,
@@ -2225,7 +2255,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_movcond_i32:
         tgen_movcond(s, TCG_TYPE_I32, args[5], args[0], args[1],
-                     args[2], const_args[2], args[3], const_args[3]);
+                     args[2], const_args[2], args[3], const_args[3], args[4]);
         break;
 
     case INDEX_op_qemu_ld_i32:
@@ -2509,7 +2539,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_movcond_i64:
         tgen_movcond(s, TCG_TYPE_I64, args[5], args[0], args[1],
-                     args[2], const_args[2], args[3], const_args[3]);
+                     args[2], const_args[2], args[3], const_args[3], args[4]);
         break;
 
     OP_32_64(deposit):
@@ -3114,9 +3144,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
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


