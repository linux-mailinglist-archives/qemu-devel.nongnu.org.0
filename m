Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBE9411716
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:31:25 +0200 (CEST)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKKK-0008Cb-H4
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9n-0002tg-DD
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:32 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9T-0000zY-Sm
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id w29so30196015wra.8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UsAnWUJXXQdrCgl7MANvH4HB45xqev5qmNo8iG4qPs0=;
 b=eqqP+vXUzGeF4ghedD1z/XYmOF30EdX8OUijaBQYZwfZklkDKprD50UXTbpeRuS9PD
 agQu4OsqF+lnIzID3O2svLXNNwqRmE1ShyV2h8HmwPLJ8d3xCSlCUvc+BrqQkENSdEFo
 pHfULVsyoQl47GVuk/aZXiEkhnTvWGwZ3vesY1roNPeovbNiZ5D4jRB3DkRRgno8meV5
 ujUkspgF15ziPwC/A/jyOhXUC9SxERNciuVtPdxC1V3G45QPX7iH+snEEsAJ1U/C1Hlj
 Q+Y5crVZKDTSInYvIVgB9cN8h/etrwEVWAbu2ZV0B5PVoPCDLuHHLHZ9Jd3+qDtKYYvO
 BgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UsAnWUJXXQdrCgl7MANvH4HB45xqev5qmNo8iG4qPs0=;
 b=BDpIzmvrahUj93k4z0jYCTVKRe+AsDQu1k7iPYyN9y5Xg7l5Tw9PK8iGHcMUQce7Oi
 aANS4eeG/xjJa8TWuu6kPnvqg/+jTvPUb6/Cl2BIg1KoNruyaMsSmbedfi1Oir5SCFIX
 hfQgNy4j0iLytTERRdjzJdc9q77+YXCSpHnyRZaSRj0xCGx++GPOQbMEtKBsDbExisF5
 ufA1bMYZYfpRZVHvZzo1nFVlal+0+PezLvg4hcyzUECAUJmWNr9CiUA8cnaDLReyB5um
 dkMJ7Tu8SqZCDlwI1cjLwACnFhHLv7ISL+tZxnCFnhp1JI/Gw/ojj5J9iAF5cvhcedUA
 mJnw==
X-Gm-Message-State: AOAM533jPwFiGupyqCk2kX9a1ThmZAirrjX0nzq6e+3pxbpBGnVts56r
 wvxzP2P4hhH2VGSZEwttKMR5WVqx/gwGiw==
X-Google-Smtp-Source: ABdhPJzNjrLefDAtdOshVuxJVMQh4Uor3nueK5CHUR3KzjZkK9pLrh2L62HR40K3rW4D8VeNOVBBew==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr29906294wmp.165.1632147609584; 
 Mon, 20 Sep 2021 07:20:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.20.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:20:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/27] target/arm: Optimize MVE 1op-immediate insns
Date: Mon, 20 Sep 2021 15:19:47 +0100
Message-Id: <20210920141947.5537-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize the MVE 1op-immediate insns (VORR, VBIC, VMOV) to
use TCG vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210913095440.13462-13-peter.maydell@linaro.org
---
 target/arm/translate-mve.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 1fd71c9a1ee..4267d43cc7c 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1521,7 +1521,8 @@ static bool trans_VADDLV(DisasContext *s, arg_VADDLV *a)
     return true;
 }
 
-static bool do_1imm(DisasContext *s, arg_1imm *a, MVEGenOneOpImmFn *fn)
+static bool do_1imm(DisasContext *s, arg_1imm *a, MVEGenOneOpImmFn *fn,
+                    GVecGen2iFn *vecfn)
 {
     TCGv_ptr qd;
     uint64_t imm;
@@ -1537,17 +1538,29 @@ static bool do_1imm(DisasContext *s, arg_1imm *a, MVEGenOneOpImmFn *fn)
 
     imm = asimd_imm_const(a->imm, a->cmode, a->op);
 
-    qd = mve_qreg_ptr(a->qd);
-    fn(cpu_env, qd, tcg_constant_i64(imm));
-    tcg_temp_free_ptr(qd);
+    if (vecfn && mve_no_predication(s)) {
+        vecfn(MO_64, mve_qreg_offset(a->qd), mve_qreg_offset(a->qd),
+              imm, 16, 16);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        fn(cpu_env, qd, tcg_constant_i64(imm));
+        tcg_temp_free_ptr(qd);
+    }
     mve_update_eci(s);
     return true;
 }
 
+static void gen_gvec_vmovi(unsigned vece, uint32_t dofs, uint32_t aofs,
+                           int64_t c, uint32_t oprsz, uint32_t maxsz)
+{
+    tcg_gen_gvec_dup_imm(vece, dofs, oprsz, maxsz, c);
+}
+
 static bool trans_Vimm_1r(DisasContext *s, arg_1imm *a)
 {
     /* Handle decode of cmode/op here between VORR/VBIC/VMOV */
     MVEGenOneOpImmFn *fn;
+    GVecGen2iFn *vecfn;
 
     if ((a->cmode & 1) && a->cmode < 12) {
         if (a->op) {
@@ -1556,8 +1569,10 @@ static bool trans_Vimm_1r(DisasContext *s, arg_1imm *a)
              * so the VBIC becomes a logical AND operation.
              */
             fn = gen_helper_mve_vandi;
+            vecfn = tcg_gen_gvec_andi;
         } else {
             fn = gen_helper_mve_vorri;
+            vecfn = tcg_gen_gvec_ori;
         }
     } else {
         /* There is one unallocated cmode/op combination in this space */
@@ -1566,8 +1581,9 @@ static bool trans_Vimm_1r(DisasContext *s, arg_1imm *a)
         }
         /* asimd_imm_const() sorts out VMVNI vs VMOVI for us */
         fn = gen_helper_mve_vmovi;
+        vecfn = gen_gvec_vmovi;
     }
-    return do_1imm(s, a, fn);
+    return do_1imm(s, a, fn, vecfn);
 }
 
 static bool do_2shift_vec(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
-- 
2.20.1


