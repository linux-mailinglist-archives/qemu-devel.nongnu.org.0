Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88683AF0DE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:51:41 +0200 (CEST)
Received: from localhost ([::1]:42252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvN9A-0007q1-Mb
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnG-0007E9-C3
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:03 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnC-0007ax-07
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:02 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so403208wma.2
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EcZexocOoDzg7vNf97R1cf/YaESQzzovEHBPy1gj29k=;
 b=sELlyJWbHjtSIw0xtamAGoIKxkYj8rN7mQ4XK3uEWE/ecBhepcwvbopMqn/FaUQCgi
 lLwcojjI9enpJY37U2TsEXZlCrv+mAda+KYIq3TRxyhQJFLFV6qBWARbKFzJNdIMQnJF
 ugSkhRN9T1i3d4zZFCTm1CgsGb4dR085l5/MvXmrZAHI40ovXy1LuQeFlz2KDgFJlSnu
 9I5nwQHMKzhkIQwpW0IEbBiYcTrLH18/YkCK3cOEo5fTgbJi0QoAf7tQWZQDqi2tM3KH
 vf4VnlsP3sDpuogHvETDXkWPlJOJtlyWVl1bPkXMSr2B377PxuX+JwaXweiiKpXij9a7
 wViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EcZexocOoDzg7vNf97R1cf/YaESQzzovEHBPy1gj29k=;
 b=CEgLM0v5TXxeW4EqwUUOfCDVd+eqX+7MoF/XWvhlZIG7SVEJzDjpEnztM86hthlkgM
 t4Nrf41Ng9KN3YmV3IG2vAiRgslbmT3BeEEjQLI+p+TSU1Mdytp9gF6eK6BkMrF9UPVI
 IW9jZAGIOHZ4qaWTwslP6S+aGnkp6N3t5ZRqox9CaH5xJ0Tv/eOKlb+1r+raMS1yoafC
 1yB9LOxsw/Cxo+YVeeI0tPFtW8HfAxrkXgCTFrhUljZPSxCGh1To+g4zebbLGrapfSHf
 ZQ5SlTXip5eI/pxGnwE8pkTEg2UE2L1QDCqEEm6X287JiDf98vdlRRkWBlSBOMSlOu7f
 WDKA==
X-Gm-Message-State: AOAM5311VMB32lCMrMwbpJVirSuxlrL24zk8lpYRvbD64PgRU+q96yMY
 cbz0k+TNyBlsJn51xTK66bY+ogTJzYgQk0Cy
X-Google-Smtp-Source: ABdhPJxbzow88HTJh8odjvJkrFyGVzbAeX+vsJBkqhrEzxTAM+jsNDxkcXed9NuvTOkBoijNZXH1Gw==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr28582043wmb.113.1624292936239; 
 Mon, 21 Jun 2021 09:28:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/57] target/arm: Implement MVE VAND, VBIC, VORR, VORN, VEOR
Date: Mon, 21 Jun 2021 17:27:58 +0100
Message-Id: <20210621162833.32535-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Implement the MVE vector logical operations operating
on two registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-12-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  9 +++++++++
 target/arm/mve_helper.c    | 26 ++++++++++++++++++++++++++
 target/arm/translate-mve.c | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 64c3f9e049e..01b6123f250 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -63,3 +63,9 @@ DEF_HELPER_FLAGS_3(mve_vnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegs, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vand, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vbic, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vorn, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_veor, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 09849917f5a..332e0b8d1d6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -25,6 +25,7 @@
 
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
+&2op qd qm qn size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -32,6 +33,7 @@
 
 @1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
 @1op_nosz .... .... .... .... .... .... .... .... &1op qd=%qd qm=%qm size=0
+@2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
 # Vector loads and stores
 
@@ -68,6 +70,13 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111101 .......   @vldr_vstr \
 VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
                  size=2 p=1
 
+# Vector 2-op
+VAND             1110 1111 0 . 00 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VBIC             1110 1111 0 . 01 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VORR             1110 1111 0 . 10 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VORN             1110 1111 0 . 11 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+VEOR             1111 1111 0 . 00 ... 0 ... 0 0001 . 1 . 1 ... 0 @2op_nosz
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index e17ffdccac5..da62b0e012b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -322,3 +322,29 @@ DO_1OP(vnegw, 4, int32_t, DO_NEG)
 /* We can do these 64 bits at a time */
 DO_1OP(vfnegh, 8, uint64_t, DO_FNEGH)
 DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
+
+#define DO_2OP(OP, ESIZE, TYPE, FN)                                     \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)],                                  \
+                      FN(n[H##ESIZE(e)], m[H##ESIZE(e)]), mask);        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_AND(N, M)  ((N) & (M))
+#define DO_BIC(N, M)  ((N) & ~(M))
+#define DO_ORR(N, M)  ((N) | (M))
+#define DO_ORN(N, M)  ((N) | ~(M))
+#define DO_EOR(N, M)  ((N) ^ (M))
+
+DO_2OP(vand, 8, uint64_t, DO_AND)
+DO_2OP(vbic, 8, uint64_t, DO_BIC)
+DO_2OP(vorr, 8, uint64_t, DO_ORR)
+DO_2OP(vorn, 8, uint64_t, DO_ORN)
+DO_2OP(veor, 8, uint64_t, DO_EOR)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 3714be7f8d1..2546567774c 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -30,6 +30,7 @@
 
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -294,3 +295,39 @@ static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
     }
     return do_1op(s, a, fns[a->size]);
 }
+
+static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
+{
+    TCGv_ptr qd, qn, qm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qn | a->qm) ||
+        !fn) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    qn = mve_qreg_ptr(a->qn);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qd, qn, qm);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_LOGIC(INSN, HELPER)                                  \
+    static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
+    {                                                           \
+        return do_2op(s, a, HELPER);                            \
+    }
+
+DO_LOGIC(VAND, gen_helper_mve_vand)
+DO_LOGIC(VBIC, gen_helper_mve_vbic)
+DO_LOGIC(VORR, gen_helper_mve_vorr)
+DO_LOGIC(VORN, gen_helper_mve_vorn)
+DO_LOGIC(VEOR, gen_helper_mve_veor)
-- 
2.20.1


