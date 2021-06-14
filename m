Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56E3A6AA7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:40:03 +0200 (CEST)
Received: from localhost ([::1]:55368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoh0-0004fd-3Y
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEr-0001vd-NH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEc-0000Vj-0k
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:57 -0400
Received: by mail-wm1-x332.google.com with SMTP id b205so7634766wmb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iXKepFl1D44T4dzWpBtsyVDKmRUxVKOMmh4jnHcCAtk=;
 b=hLAzERk6EhTcfnxFDUZuBiRLNssindfcfQnb9g8mzjd35GJtGjaUm3MJu5S4JFywq4
 XiaVYA1rpjAhh5znD6AGYx302BJGnWt8TrcJNPno/FTwwG0CQHi4JZmZX8y9qU8if8jp
 TiqcCVlx2/1pqAuMpTWoMz2oxC4/XjJuQLSgBo4/2j6ci8qu2ODKDX7Qc2PdZLkuGJZr
 EnKc8OECP4z6swiPKRfJbMqxrkzNWaTkk9XDdhZ31Le8kqj68f6Mo3vkdKa4ZYJlzwjg
 kWvpEvjNG5cuy7bR2bj88hYuzOmf8QyAd+NEMkRGikYU53ntWYSAjAk2caZ2vjoa89cR
 qCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iXKepFl1D44T4dzWpBtsyVDKmRUxVKOMmh4jnHcCAtk=;
 b=JPMh42FGqKthCERi0bY+Yj49nZBxktY4UYIFJ4JvTq1Mo7R1SU8MuXP/5m3bRaPdR4
 0bMaRiNvbWmGw9B12RlhZViuF0vvxDEne9rdtcC7nhh5UWkdU1SssDDcLT5imTPz8Ebh
 ryc5f36h5P463ewiO5z9DQkoLYkOW4W2LpLvwKQEkrNR+05stiP1rTgiUmUzcm8/g6B6
 m45CVjFzyVUzyG/RRjUXwybOL0v6yhghoOQpCcR1ADDpXuEs9SxEmtqyExQzvXyeRtrO
 pdsm53cCv+1bHDZzv4A7fRxbM1xSQJVkPUYgI1wgb3BVGlCHs2xzucoUzngYBIAw+cCN
 armg==
X-Gm-Message-State: AOAM533J5Ie2hRWZRgp+R1Ml3QkYLVKEO3jPNzgu3bUSW7hGMIN6yC4V
 5/s37+Sxb0thiQxOi4AjMjZ/4w==
X-Google-Smtp-Source: ABdhPJxgOPT/qEZTIZAolhZwf8Qx2Pi2u4V/jOEob5jZ4pRePpE4wy/UhG/607/CagAFx08IZMJAAg==
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr17265035wmq.9.1623683440632; 
 Mon, 14 Jun 2021 08:10:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 37/57] target/arm: Implement MVE VHADD, VHSUB (scalar)
Date: Mon, 14 Jun 2021 16:09:47 +0100
Message-Id: <20210614151007.4545-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++++++++
 target/arm/mve.decode      |  4 ++++
 target/arm/mve_helper.c    |  8 ++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 32 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 912505d0152..52086d769f4 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -157,6 +157,22 @@ DEF_HELPER_FLAGS_4(mve_vmul_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
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
index 14b268a15b6..8e33079fd66 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -525,10 +525,18 @@ DO_2OP_U(vhsubu, do_vhsub_u)
     DO_2OP_SCALAR(OP##b, 1, uint8_t, FN)        \
     DO_2OP_SCALAR(OP##h, 2, uint16_t, FN)       \
     DO_2OP_SCALAR(OP##w, 4, uint32_t, FN)
+#define DO_2OP_SCALAR_S(OP, FN)                 \
+    DO_2OP_SCALAR(OP##b, 1, int8_t, FN)         \
+    DO_2OP_SCALAR(OP##h, 2, int16_t, FN)        \
+    DO_2OP_SCALAR(OP##w, 4, int32_t, FN)
 
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
index 5c72299e985..7ff4b452def 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -429,6 +429,10 @@ static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
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


