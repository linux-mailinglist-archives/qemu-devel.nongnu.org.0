Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BD94088AF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:02:38 +0200 (CEST)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPinN-0000AA-Um
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifz-0007gn-Q8
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:59 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifs-0001xm-9l
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:59 -0400
Received: by mail-wr1-x435.google.com with SMTP id b6so13665827wrh.10
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=87t4rKj87r3v4XMYvFAJ7w7HoQP6mKOaE1QysWiPQ9g=;
 b=EFLvzQ9I/ftC2bUF14n8CIgeX2hjZmI9bAmqlHjO2muVwOq20C1ceJzyM/NoGfZ/5I
 kKxx1D7ooQQDVJgCZvo6xl5chH3NYtQmFab0irpMholTduqaBMAPfP3ntRhLptuBmivy
 3O2u/F0cSFRLr3zKTUEyxIQKt3vXnd1RlJnhIX7dxJpkW3R3dS1KSDEo/EkhQm9VAATL
 SUSwUGGLSbJrf0qPm+h7brfi3gB8k1syMNU/AvR5MhAPqz3dRhjEfK0/QWMhUsqMNwy4
 d2oiVaU37X76ul2Al3ayBCbC63+7O6o2O0MPhUR5TTovQEQArSx3bSi0NL5MoArN+DS7
 /MBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=87t4rKj87r3v4XMYvFAJ7w7HoQP6mKOaE1QysWiPQ9g=;
 b=iYUL++oR3Y9N4qp6hDhsxmiA15F7pMr5XeAk/7insM0CWDLU2BFKPbVfX/IDGvXdmX
 Y1Hrjx5KeHGEM3iMNVWAm7q8qi1RT/grArV01Fja1KNEhj7gfePmVkK8ZkqQL9oIPJeI
 twGnx8I18ikplc7AIbWEgBWtSw75VlZDlWys6rD+Qa/AUrLq9nov4YuOIzKZBUM0W7Qu
 foFV28QV6uE9JIElxny9R70uOjkmD74p83rPBbuCCAWAWAxZSFoCzIt+gNvvuaOCKwZi
 hoKBr9gPCOcantv/g7OBuhaQRNCku5xfMrWHsSLCJXlXudpqRJ48DGDIMHqu/cu9XCE/
 FGZw==
X-Gm-Message-State: AOAM530tNpIvnNMFFfLwaMu+V+dCyuMm836uOWgdAaAbuetlt3G1xokd
 ikFNPhBMqvFhquRpyKgydrK/TQ==
X-Google-Smtp-Source: ABdhPJz2EH4Dew01IspYPDwWcOWbobgMYjBupV5dAdWWJBLa9Y+DgDaXiYaPVwHbB8IEBWtW18kNcA==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr11667685wrl.65.1631526890808; 
 Mon, 13 Sep 2021 02:54:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/12] target/arm: Optimize MVE 1op-immediate insns
Date: Mon, 13 Sep 2021 10:54:40 +0100
Message-Id: <20210913095440.13462-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optimize the MVE 1op-immediate insns (VORR, VBIC, VMOV) to
use TCG vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


