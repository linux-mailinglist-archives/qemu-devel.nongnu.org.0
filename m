Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBCF31E35B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 01:01:19 +0100 (CET)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWkw-0007PK-V1
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 19:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWS2-0001B7-EE
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:49 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRp-0004sE-LN
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:45 -0500
Received: by mail-pf1-x434.google.com with SMTP id 189so33304pfy.6
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQLjsVxe265YNzQ3sjeGms3Bg8DyABIrQ53FVnjy4b0=;
 b=PNuJajGEYiSIcVcvUVbauOdsbUDnrERxnvEQASr0FiYlJoqHmX4fcdhdp+A46AO/ej
 h/O2aB9ej/UHQY0aU+ryyrBs4WzhvsmWkT3dUoL5B8rjlFrYAShvH25IjRhBbStq2DGX
 QBKbQpbwTXM1mH3quekhDojFs9Q6zeYyi6dxIuxmt92HU8S2ThLSQknc0gD5W41mPaaa
 LWr4LifyLrS4LeB9zS9hBYbmcdEPtu/6F6wnSj4rcFQLZpWkbLpwBL/Y59jziEf/DiRu
 Ecld4Z5+vZJYNDIhrKIe7BvPhKBOQbPo0wFpMgLHJYOsWtHgV7xK7abWpqvM/UpwFlF/
 5D2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQLjsVxe265YNzQ3sjeGms3Bg8DyABIrQ53FVnjy4b0=;
 b=AhVmjfDTnJ3rTm63bLXvdV9RL4Enks/fnphbGeqIqXEvBW6APg1otDBpsfMVPbOOxi
 aF0mNXoC46/Zo+dYEIiXxoQ+YEStdBjApa4Tnecx2vi9R4VhIKzkyOYLD01QRLkLjIkl
 WLp37sUXNGCbgZjzUdsn0JhO78MRLMv5AzGccXZnx7dsJSLcfyqf7jNul5nRMqt72CrF
 p+g5Yi2/LHbYy9meaE+Mwor+MdmEqmJi5KFHkupnUYmYN4bYHBIu7Wb/Lf9o+Dvbg45K
 WLdmsUWVN08fMeLdt0mXBYe9erW9ZwA0J0+880kBxysfjHgzle9Oxr2m/I/uGHssR0n0
 KcMA==
X-Gm-Message-State: AOAM531YyjI0IOGt8zGvZZ2sLYyD0VLRDjWOb8FXdTbWB+8l4xXfLXUe
 bFLn/IHx4qqPRRfiI0Z3R81pADY0I8oWBA==
X-Google-Smtp-Source: ABdhPJxexDj0nkph1vHn8W/1M/gNRA1Fiq+RC6DCUKBLSqESiNp2+TdWytx1bWhsYWaY2QMqLkZbCg==
X-Received: by 2002:a65:404a:: with SMTP id h10mr1493734pgp.367.1613605291592; 
 Wed, 17 Feb 2021 15:41:31 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/35] Hexagon (target/hexagon) TCG for instructions with
 multiple definitions
Date: Wed, 17 Feb 2021 15:40:16 -0800
Message-Id: <20210217234023.1742406-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Helpers won't work if there are multiple definitions, so we override these
instructions using #define fGEN_TCG_<tag>.

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1612763186-18161-28-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/gen_tcg.h | 198 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)
 create mode 100644 target/hexagon/gen_tcg.h

diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h
new file mode 100644
index 0000000000..a8d9321b42
--- /dev/null
+++ b/target/hexagon/gen_tcg.h
@@ -0,0 +1,198 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_GEN_TCG_H
+#define HEXAGON_GEN_TCG_H
+
+/*
+ * Here is a primer to understand the tag names for load/store instructions
+ *
+ * Data types
+ *      b        signed byte                       r0 = memb(r2+#0)
+ *     ub        unsigned byte                     r0 = memub(r2+#0)
+ *      h        signed half word (16 bits)        r0 = memh(r2+#0)
+ *     uh        unsigned half word                r0 = memuh(r2+#0)
+ *      i        integer (32 bits)                 r0 = memw(r2+#0)
+ *      d        double word (64 bits)             r1:0 = memd(r2+#0)
+ *
+ * Addressing modes
+ *     _io       indirect with offset              r0 = memw(r1+#4)
+ *     _ur       absolute with register offset     r0 = memw(r1<<#4+##variable)
+ *     _rr       indirect with register offset     r0 = memw(r1+r4<<#2)
+ *     gp        global pointer relative           r0 = memw(gp+#200)
+ *     _sp       stack pointer relative            r0 = memw(r29+#12)
+ *     _ap       absolute set                      r0 = memw(r1=##variable)
+ *     _pr       post increment register           r0 = memw(r1++m1)
+ *     _pi       post increment immediate          r0 = memb(r1++#1)
+ */
+
+/* Macros for complex addressing modes */
+#define GET_EA_ap \
+    do { \
+        fEA_IMM(UiV); \
+        tcg_gen_movi_tl(ReV, UiV); \
+    } while (0)
+#define GET_EA_pr \
+    do { \
+        fEA_REG(RxV); \
+        fPM_M(RxV, MuV); \
+    } while (0)
+#define GET_EA_pi \
+    do { \
+        fEA_REG(RxV); \
+        fPM_I(RxV, siV); \
+    } while (0)
+
+
+/* Instructions with multiple definitions */
+#define fGEN_TCG_LOAD_AP(RES, SIZE, SIGN) \
+    do { \
+        fMUST_IMMEXT(UiV); \
+        fEA_IMM(UiV); \
+        fLOAD(1, SIZE, SIGN, EA, RES); \
+        tcg_gen_movi_tl(ReV, UiV); \
+    } while (0)
+
+#define fGEN_TCG_L4_loadrub_ap(SHORTCODE) \
+    fGEN_TCG_LOAD_AP(RdV, 1, u)
+#define fGEN_TCG_L4_loadrb_ap(SHORTCODE) \
+    fGEN_TCG_LOAD_AP(RdV, 1, s)
+#define fGEN_TCG_L4_loadruh_ap(SHORTCODE) \
+    fGEN_TCG_LOAD_AP(RdV, 2, u)
+#define fGEN_TCG_L4_loadrh_ap(SHORTCODE) \
+    fGEN_TCG_LOAD_AP(RdV, 2, s)
+#define fGEN_TCG_L4_loadri_ap(SHORTCODE) \
+    fGEN_TCG_LOAD_AP(RdV, 4, u)
+#define fGEN_TCG_L4_loadrd_ap(SHORTCODE) \
+    fGEN_TCG_LOAD_AP(RddV, 8, u)
+
+#define fGEN_TCG_L2_loadrub_pr(SHORTCODE)      SHORTCODE
+#define fGEN_TCG_L2_loadrub_pi(SHORTCODE)      SHORTCODE
+#define fGEN_TCG_L2_loadrb_pr(SHORTCODE)       SHORTCODE
+#define fGEN_TCG_L2_loadrb_pi(SHORTCODE)       SHORTCODE;
+#define fGEN_TCG_L2_loadruh_pr(SHORTCODE)      SHORTCODE
+#define fGEN_TCG_L2_loadruh_pi(SHORTCODE)      SHORTCODE;
+#define fGEN_TCG_L2_loadrh_pr(SHORTCODE)       SHORTCODE
+#define fGEN_TCG_L2_loadrh_pi(SHORTCODE)       SHORTCODE
+#define fGEN_TCG_L2_loadri_pr(SHORTCODE)       SHORTCODE
+#define fGEN_TCG_L2_loadri_pi(SHORTCODE)       SHORTCODE
+#define fGEN_TCG_L2_loadrd_pr(SHORTCODE)       SHORTCODE
+#define fGEN_TCG_L2_loadrd_pi(SHORTCODE)       SHORTCODE
+
+/*
+ * Predicated loads
+ * Here is a primer to understand the tag names
+ *
+ * Predicate used
+ *      t        true "old" value                  if (p0) r0 = memb(r2+#0)
+ *      f        false "old" value                 if (!p0) r0 = memb(r2+#0)
+ *      tnew     true "new" value                  if (p0.new) r0 = memb(r2+#0)
+ *      fnew     false "new" value                 if (!p0.new) r0 = memb(r2+#0)
+ */
+#define fGEN_TCG_PRED_LOAD(GET_EA, PRED, SIZE, SIGN) \
+    do { \
+        TCGv LSB = tcg_temp_local_new(); \
+        TCGLabel *label = gen_new_label(); \
+        GET_EA; \
+        PRED;  \
+        PRED_LOAD_CANCEL(LSB, EA); \
+        tcg_gen_movi_tl(RdV, 0); \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, LSB, 0, label); \
+            fLOAD(1, SIZE, SIGN, EA, RdV); \
+        gen_set_label(label); \
+        tcg_temp_free(LSB); \
+    } while (0)
+
+#define fGEN_TCG_L2_ploadrubt_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 1, u)
+#define fGEN_TCG_L2_ploadrubf_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 1, u)
+#define fGEN_TCG_L2_ploadrubtnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 1, u)
+#define fGEN_TCG_L2_ploadrubfnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 1, u)
+#define fGEN_TCG_L2_ploadrbt_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 1, s)
+#define fGEN_TCG_L2_ploadrbf_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 1, s)
+#define fGEN_TCG_L2_ploadrbtnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 1, s)
+#define fGEN_TCG_L2_ploadrbfnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD({ fEA_REG(RxV); fPM_I(RxV, siV); }, \
+                       fLSBNEWNOT(PtN), 1, s)
+
+#define fGEN_TCG_L2_ploadruht_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 2, u)
+#define fGEN_TCG_L2_ploadruhf_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 2, u)
+#define fGEN_TCG_L2_ploadruhtnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 2, u)
+#define fGEN_TCG_L2_ploadruhfnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 2, u)
+#define fGEN_TCG_L2_ploadrht_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 2, s)
+#define fGEN_TCG_L2_ploadrhf_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 2, s)
+#define fGEN_TCG_L2_ploadrhtnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 2, s)
+#define fGEN_TCG_L2_ploadrhfnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 2, s)
+
+#define fGEN_TCG_L2_ploadrit_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLD(PtV), 4, u)
+#define fGEN_TCG_L2_ploadrif_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBOLDNOT(PtV), 4, u)
+#define fGEN_TCG_L2_ploadritnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEW(PtN), 4, u)
+#define fGEN_TCG_L2_ploadrifnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD(GET_EA_pi, fLSBNEWNOT(PtN), 4, u)
+
+/* Predicated loads into a register pair */
+#define fGEN_TCG_PRED_LOAD_PAIR(GET_EA, PRED) \
+    do { \
+        TCGv LSB = tcg_temp_local_new(); \
+        TCGLabel *label = gen_new_label(); \
+        GET_EA; \
+        PRED;  \
+        PRED_LOAD_CANCEL(LSB, EA); \
+        tcg_gen_movi_i64(RddV, 0); \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, LSB, 0, label); \
+            fLOAD(1, 8, u, EA, RddV); \
+        gen_set_label(label); \
+        tcg_temp_free(LSB); \
+    } while (0)
+
+#define fGEN_TCG_L2_ploadrdt_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBOLD(PtV))
+#define fGEN_TCG_L2_ploadrdf_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBOLDNOT(PtV))
+#define fGEN_TCG_L2_ploadrdtnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBNEW(PtN))
+#define fGEN_TCG_L2_ploadrdfnew_pi(SHORTCODE) \
+    fGEN_TCG_PRED_LOAD_PAIR(GET_EA_pi, fLSBNEWNOT(PtN))
+
+/* load-locked and store-locked */
+#define fGEN_TCG_L2_loadw_locked(SHORTCODE) \
+    SHORTCODE
+#define fGEN_TCG_L4_loadd_locked(SHORTCODE) \
+    SHORTCODE
+#define fGEN_TCG_S2_storew_locked(SHORTCODE) \
+    do { SHORTCODE; READ_PREG(PdV, PdN); } while (0)
+#define fGEN_TCG_S4_stored_locked(SHORTCODE) \
+    do { SHORTCODE; READ_PREG(PdV, PdN); } while (0)
+
+#endif
-- 
2.25.1


