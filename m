Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140B23A6AFC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:53:29 +0200 (CEST)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsou0-0000k6-4w
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoF1-0002P1-NH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:07 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEk-0000aV-2E
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso13316819wmh.4
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qNQRvMNaIXyVbqoVWVPAZdQE8EjkcwMkTf+5DbPtj9c=;
 b=y2Oxvlx7CbSw+MfDTsc9jf7eQRSvpvrG9DklMbl1G/4yOQVQoY0uPqkjpGuY8F0MGv
 xP+5WNMHfok1P7qXsY/aNWuEVahJxUsxpTHLAJLZZfp2v5SzELe0pTFyGRDNs949lH3E
 ZuO/i4426WxiWhhb2eyp4vqti5f5rYld/6ubrcHlod9bHq6Nh1CZV3QB7UWPKPaSu67G
 ZXOyNF/QArLUMqkvLq1kVEdabdUpqjotPFoZ9ny/LHK7+6/VcIRT5KbqNq12M7lPAMH/
 xvyNY7cLbE8KEOfWCmNp061lvXLgWm87Y9WEi5qWb5nf6Y0c6UXLbwQI4fmW+s5O88P1
 zOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qNQRvMNaIXyVbqoVWVPAZdQE8EjkcwMkTf+5DbPtj9c=;
 b=b/ZO6/e+2JFaIV++dqnb2SSzm3/Go9xIptbfiTaFQ6IiB041MYdK5pWpjIPxmKpEMP
 C0lLTDBOY2guuU+owpgAmJ3SNHit4mgCXX5X8d/Lko+Uxkip1rkrBnS/c9dca3g4c8rj
 Tjsbr/rH9BDQoRQ1Pvc9tbtW8gNEozV0+mtD4Hu+ydr65yLmCf4/9LheWh9cVVRjPuMh
 jOwp6INkEO5sQ8ORQd40LL/3nOSyg6rb6ykDmlZrJwcAW9aagXPQqepFSJJVNlkQ9kh2
 emtYeQc84y5VqnGFlJKMK+JsjvfMWJdccqSy2zyFHw6M0QSfRKNZ2HaejICz6oq4pME7
 4TSw==
X-Gm-Message-State: AOAM531guKggPLdgbZcbyWSnqrVENueWoV4WIp2HnPbIj+o1OD6mpCTS
 gH8G5tMyry5aeqlFkF7YmVA1Lw==
X-Google-Smtp-Source: ABdhPJy+FC4eFTW3UYXQ2RQ4YBDoFfHMIrDp+xgXv1sHqpOysh2LwZm7aE59nSAnQvuvac5hZx/K+A==
X-Received: by 2002:a05:600c:2905:: with SMTP id
 i5mr10487614wmd.91.1623683447448; 
 Mon, 14 Jun 2021 08:10:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 46/57] target/arm: Implement MVE VQRSHL
Date: Mon, 14 Jun 2021 16:09:56 +0100
Message-Id: <20210614151007.4545-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MV VQRSHL (vector) insn.  Again, the code to perform
the actual shifts is borrowed from neon_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 1c5626bb726..42be99ad526 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -177,6 +177,14 @@ DEF_HELPER_FLAGS_4(mve_vqshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqrshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 2c37e265765..e78eab6d659 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -133,6 +133,9 @@ VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
+VQRSHL_S         111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
+VQRSHL_U         111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 31ee057db2e..3464dd311f1 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -622,9 +622,15 @@ DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
     WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, false, satp)
 #define DO_UQSHL_OP(N, M, satp) \
     WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, false, satp)
+#define DO_SQRSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, true, satp)
+#define DO_UQRSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, true, satp)
 
 DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
 DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
+DO_2OP_SAT_S(vqrshls, DO_SQRSHL_OP)
+DO_2OP_SAT_U(vqrshlu, DO_UQRSHL_OP)
 
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bde62bf2445..ac0114c8358 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -404,6 +404,8 @@ DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
+DO_2OP(VQRSHL_S, vqrshls)
+DO_2OP(VQRSHL_U, vqrshlu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


