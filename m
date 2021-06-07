Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCFD39E5AE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:43:05 +0200 (CEST)
Received: from localhost ([::1]:40856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJHE-0003rn-92
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIb0-0007qr-B7
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaW-00082B-Vl
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:26 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 s70-20020a1ca9490000b02901a589651424so269951wme.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dnwdQ48Evvu95KjTeddCpWFog36QsW/ysrhnli1x9Gw=;
 b=VSj6+zJeueCCL6fs7PAsarBsjsDCjs5nTGfVrcvx7xBM25QEhSYb/Qjj+9waOe+UXm
 mEEQ62BO/ww7osGTEmI1n89Q0xdaedQkjYBtkwVh2xzwtygUvqD/j9XK63JJp316t0ac
 DCP2Cl0cc1KY2AP/fhg6UDssXs3KHHdP/yKAp8GKTRoRm4Ce+OAJG8VSGAcy6VvQO05W
 L/VTOiZzkP23KrFRhweFIjnLdwKvnoFy95tZCUgVveb50h2Rdg2h7YXXSBiOHhaAzBMr
 aChBO3wgIz1PRHi1KoSwnVfB7Er3RvP8+KOG7yOMZloswo97rNW9+FId66PIo2wMvM34
 jXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dnwdQ48Evvu95KjTeddCpWFog36QsW/ysrhnli1x9Gw=;
 b=T94XG/d+3jkJVLT7+TQH7iT9ZXFOId79Evh+JWOgCwByZw7mxeAtltjyaDjqSkT13N
 FkarjbauLzgE0qlMyl4S9kPPs7M6CYwzlY2VPg0KNlcv4AgPG2vSV2fZ6iUcClEw2E/i
 fce13B8M/T3O9ekRId+lAyMB+3t8eqPzyGeAn2Ski9Lc/0Yw3as3ArueE8n5WM2G2Gdc
 SvecgYSP3Pe9dnpQkX/JSJifEVpALqPoydXuK5Lce+7MwhIvEMReuYIaAGnvheFDslfz
 CyXVnHnGYP7Ab2zjV/LgzcyblR00StFUxH3zaFEhKJg5OIwMc/cZvGxj0E5fiBjUIikL
 GXUA==
X-Gm-Message-State: AOAM530viJs9kVQNjPXPhpEN+6L4o62S1+BafxkHzFKMxi9EHkrlGMuL
 uE02WPZwFGS49Aoa26kyU+CHJMmqE+e09rah
X-Google-Smtp-Source: ABdhPJwIzLbIJ0xnlkmGNwdAFXY5SUyoPHYWg9KJc3Z1usqbws0M8OmbspmEegfI8KwcfzlVM+W93g==
X-Received: by 2002:a1c:7ec3:: with SMTP id
 z186mr17606561wmc.102.1623085131313; 
 Mon, 07 Jun 2021 09:58:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 35/55] target/arm: Implement MVE VHADD, VHSUB (scalar)
Date: Mon,  7 Jun 2021 17:58:01 +0100
Message-Id: <20210607165821.9892-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the scalar variants of the MVE VHADD and VHSUB insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++++++++
 target/arm/mve.decode      |  4 ++++
 target/arm/mve_helper.c    |  8 ++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 32 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 4d39527e201..5853bd34687 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -159,6 +159,22 @@ DEF_HELPER_FLAGS_4(mve_vmul_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmul_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmul_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vhadds_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhadds_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhadds_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vhaddu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhaddu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhaddu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vhsubs_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhsubs_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhsubs_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vhsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhsubu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vhsubu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index af5fba78ce2..5c332b04a7c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -163,3 +163,7 @@ VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_no
 VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
 VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
 VMUL_scalar      1110 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
+VHADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
+VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
+VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 8892a713287..dbcf4c24949 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -500,10 +500,18 @@ DO_2OP_U(vhsubu, do_vhsub_u)
     DO_2OP_SCALAR(OP##b, 1, uint8_t, H1, FN)    \
     DO_2OP_SCALAR(OP##h, 2, uint16_t, H2, FN)   \
     DO_2OP_SCALAR(OP##w, 4, uint32_t, H4, FN)
+#define DO_2OP_SCALAR_S(OP, FN)                 \
+    DO_2OP_SCALAR(OP##b, 1, int8_t, H1, FN)     \
+    DO_2OP_SCALAR(OP##h, 2, int16_t, H2, FN)    \
+    DO_2OP_SCALAR(OP##w, 4, int32_t, H4, FN)
 
 DO_2OP_SCALAR_U(vadd_scalar, DO_ADD)
 DO_2OP_SCALAR_U(vsub_scalar, DO_SUB)
 DO_2OP_SCALAR_U(vmul_scalar, DO_MUL)
+DO_2OP_SCALAR_S(vhadds_scalar, do_vhadd_s)
+DO_2OP_SCALAR_U(vhaddu_scalar, do_vhadd_u)
+DO_2OP_SCALAR_S(vhsubs_scalar, do_vhsub_s)
+DO_2OP_SCALAR_U(vhsubu_scalar, do_vhsub_u)
 
 /*
  * Multiply add long dual accumulate ops.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index c03528d1973..8dfc52d8027 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -465,6 +465,10 @@ static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
 DO_2OP_SCALAR(VADD_scalar, vadd_scalar)
 DO_2OP_SCALAR(VSUB_scalar, vsub_scalar)
 DO_2OP_SCALAR(VMUL_scalar, vmul_scalar)
+DO_2OP_SCALAR(VHADD_S_scalar, vhadds_scalar)
+DO_2OP_SCALAR(VHADD_U_scalar, vhaddu_scalar)
+DO_2OP_SCALAR(VHSUB_S_scalar, vhsubs_scalar)
+DO_2OP_SCALAR(VHSUB_U_scalar, vhsubu_scalar)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
-- 
2.20.1


