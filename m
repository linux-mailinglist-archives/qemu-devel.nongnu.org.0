Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9BD3AF11B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:57:23 +0200 (CEST)
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNEg-0002jw-Mh
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnW-0007iL-Bd
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnU-0007kV-CJ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id m3so10939129wms.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=omFHdsg6VcSCTe5S4gKAIGfTf4Kdo/Iw+jXMtDz1EHY=;
 b=ukhSmnKDasS+cUiUrzSZtmDb8bPaFPBS1rn0jQsB7R41MJ9zvgCK7EYj4oMrRLcIvj
 cSKkmJxSrWU6WtWwJ3sllQytOW/+zrMzCt01BFAF26QE1Pldp9+UZUqjquNA9K6cujdB
 B13jeQdbzwlMboRABTTQLlN//89qke8tAnmromGs0FuwTCimKkiu4m8Wa+wg83WLRFWh
 4kI8f0Ku+STmVBNX7+nJNk7eEKcUoahwVpm1u94g62UgVwm7+DRcX6Fsy/tGxxifwYVU
 +BRUD21qARZW+uS5BiWrP4YbjGORDpYFvjRwglsMy0G12bc8GKmQu20KcNAGxbHNtQd9
 76TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omFHdsg6VcSCTe5S4gKAIGfTf4Kdo/Iw+jXMtDz1EHY=;
 b=XtR3Z3O/PsZQT8I866ieqSONFfoVomyUNeZ255rk1z9Tx/hSmvKKFQmj6fGnX1A8Jm
 zJvutqZme+PQSZ0y76aT2sexXTDkwnmpJ7xeSFUsUIrMQGd+JG1fw2PzNpgr3AMlfdpq
 K4UK0TRixtzatw8H9lkUf4GLtGaj4Y0kaf9WHrK9ftTOdpk/Hf96rTTe/ZLTYni7eBsb
 FppZp7haRl+LF0tiEBncvwDHxpYsnoQKxUHP9uJV/5rtkDFIceMczm8N9N5/uw/C4ws8
 8k4vaQ6Sa685RRGPOK7KOIHJUFWVHSmdDCulAqpSqocBGPO7eYY8ZQA5d4Vrraukjn5m
 t81Q==
X-Gm-Message-State: AOAM533koxSiFaKWMDejnLkt1jiIFB8e3W/0qwIq50WZwlbQuFL2/Fwf
 dhZy1xqWj2lA9oQZp16+wsEpB2q86R0V4RIj
X-Google-Smtp-Source: ABdhPJyVVWVI0qYk6DpbLg39xRnX9iy2xJCkoENWMMLDct53B8UJcQvsq1xvsWlHi/XHds6WGw48qQ==
X-Received: by 2002:a05:600c:3791:: with SMTP id
 o17mr14712475wmr.187.1624292955154; 
 Mon, 21 Jun 2021 09:29:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/57] target/arm: Implement MVE VQRSHL
Date: Mon, 21 Jun 2021 17:28:20 +0100
Message-Id: <20210621162833.32535-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

Implement the MV VQRSHL (vector) insn.  Again, the code to perform
the actual shifts is borrowed from neon_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-34-peter.maydell@linaro.org
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
index 5ffc0720d89..8ddd07ac287 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -607,9 +607,15 @@ DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
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
index 52fef6cd892..bd4c6150cad 100644
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


