Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C930939E592
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:35:37 +0200 (CEST)
Received: from localhost ([::1]:51776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJA0-0008KC-7K
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbD-0008DG-H9
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaZ-00084T-UJ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:39 -0400
Received: by mail-wr1-x429.google.com with SMTP id z8so18396225wrp.12
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DDQF52g8vN6c9/t7lxs56B/f0m6nbSLusEKrn4THl4Q=;
 b=V6RMZq4WHuj9V/RXel7MSYYzZRmpfcPwOFBL9ZPvM/kfecF5gpYdPRNx9NV80EQOlY
 i8EHwxIcdEErJYwg4y6XaTvncZedxAehSn3obNahBtGnILkCb6poXO3BzyC5PCkL8zo1
 bNIVthdAY1cwxKj3/uMNf1D69YL376uFSNzTBxMYmMZUMY4rDQjRIkqUKjSNq9K4/E57
 xt8kjN1svgrZWyu7OQkQlSKpi2tYvRUQJvNT3UpEekrEWF4iRnOz1HMmccRj0yj6bSHC
 gubaTu6VbOJABHhQwhrJZAEG7Xlux4zpOAbkd3xsvhV8WvP5WVN69sEJAtv26IqOg2Qk
 qYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDQF52g8vN6c9/t7lxs56B/f0m6nbSLusEKrn4THl4Q=;
 b=ghxpTJjl313lWwctQQ75/d2rWuGBrGvJYk6ktJ9/WYC/YyX/eS3v765YsUL2ayYTwk
 PIycaxgue8KBAl9dwk8lnvh6tveGLHi5VNKu1OZJAUhrM85xZLsjhU5G2bBSfAxOk2hu
 NXBtHvGPguBFIybrjolFRx3S+L9RzACBW/1mdxeOZptoynz1C2VNw1RKXLwVxMTAdZWk
 DjBMPmlZk8T61czhOtxWKYUK+cQk8QC+sEhoLDHImtVnNp3ke0D6+9LlvqW5vZ+km32k
 FXzN0/Z3sfOOJtryTO+aI7c3nExCB/CvlhTJXN/A4Ce6vdqcwDsJhxRkdbM1KUVbw1Zy
 Wbcw==
X-Gm-Message-State: AOAM5333X9sBq+LgbGYJuQC3ndoJO/vsN+rWgfQySGkYibc2orwpd2cm
 j1rUk7LdAvsgNfOp/MGLoB7JGg==
X-Google-Smtp-Source: ABdhPJzdUHqNRDt8XXVXxpy8qy1oiRA5+LL1dmbuWvcXizuXP3r+3FIoATrV6BzUnelq/o3vGWzVvw==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr17602901wrv.423.1623085136758; 
 Mon, 07 Jun 2021 09:58:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 42/55] target/arm: Implement MVE VQADD, VQSUB (vector)
Date: Mon,  7 Jun 2021 17:58:08 +0100
Message-Id: <20210607165821.9892-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Implement the vector forms of the MVE VQADD and VQSUB insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 14 ++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 39 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index a7eddf3d488..9801a39a984 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -155,6 +155,22 @@ DEF_HELPER_FLAGS_4(mve_vqrdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmulhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmulhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqsubsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 9860d43f73c..80fa647c08f 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -116,6 +116,11 @@ VMULL_TU         111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
 VQDMULH          1110 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
 VQRDMULH         1111 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
 
+VQADD_S          111 0 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
+VQADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
+VQSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
+VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 7d65bcef56c..d3562f80026 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -550,6 +550,20 @@ DO_2OP_SAT(vqrdmulhb, 1, int8_t, H1, DO_QRDMULH_B)
 DO_2OP_SAT(vqrdmulhh, 2, int16_t, H2, DO_QRDMULH_H)
 DO_2OP_SAT(vqrdmulhw, 4, int32_t, H4, DO_QRDMULH_W)
 
+DO_2OP_SAT(vqaddub, 1, uint8_t, H1, DO_UQADD_B)
+DO_2OP_SAT(vqadduh, 2, uint16_t, H2, DO_UQADD_H)
+DO_2OP_SAT(vqadduw, 4, uint32_t, H4, DO_UQADD_W)
+DO_2OP_SAT(vqaddsb, 1, int8_t, H1, DO_SQADD_B)
+DO_2OP_SAT(vqaddsh, 2, int16_t, H2, DO_SQADD_H)
+DO_2OP_SAT(vqaddsw, 4, int32_t, H4, DO_SQADD_W)
+
+DO_2OP_SAT(vqsubub, 1, uint8_t, H1, DO_UQSUB_B)
+DO_2OP_SAT(vqsubuh, 2, uint16_t, H2, DO_UQSUB_H)
+DO_2OP_SAT(vqsubuw, 4, uint32_t, H4, DO_UQSUB_W)
+DO_2OP_SAT(vqsubsb, 1, int8_t, H1, DO_SQSUB_B)
+DO_2OP_SAT(vqsubsh, 2, int16_t, H2, DO_SQSUB_H)
+DO_2OP_SAT(vqsubsw, 4, int32_t, H4, DO_SQSUB_W)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, H, FN)                           \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 213a90b59b6..957e7e48fab 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -417,6 +417,10 @@ DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
 DO_2OP(VQDMULH, vqdmulh)
 DO_2OP(VQRDMULH, vqrdmulh)
+DO_2OP(VQADD_S, vqadds)
+DO_2OP(VQADD_U, vqaddu)
+DO_2OP(VQSUB_S, vqsubs)
+DO_2OP(VQSUB_U, vqsubu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


