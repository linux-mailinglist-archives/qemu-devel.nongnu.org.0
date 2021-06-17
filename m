Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF973AB3F5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:47:18 +0200 (CEST)
Received: from localhost ([::1]:33822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrQT-0004Px-EN
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxI-00028F-2S
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:08 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx5-0007BN-SG
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:07 -0400
Received: by mail-wr1-x429.google.com with SMTP id c5so6520178wrq.9
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i2+Nn2rxfuSq5/JEBJeaXo06Tllu2Q5gZa4VP1VdxXA=;
 b=F4GvJmCN6zv4u0cVRUPA43EB7LgmR1WHicysLu2VQeoTa7ih3OeQxfCqo/BPetj9NK
 SwhFHK7+xMhLSWFpLqGeBJ0kQZ+pnNgF9MEurUEIGRqqX7MaS3EhuagsGEO/tcfGWFJw
 /jByhNCAyJUsXHZupiP0Gc06ESYncmL6SNZpqNhpNaBDAiFBvr3COTaC0oQbDUwAeaZJ
 a2lUH0CQ1eEm+SHn+ngwCyXMxXAoYPANJ0CDJwAUw+f7PFx1muJeLygT8ZnSk2PvWpQ8
 N3KA/lEU8VgoJffU4DuXbDihHq+nB/if3gpxKEj4bA/qHyHHjKvK3WmaZQ8qOr8qb9fK
 iHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i2+Nn2rxfuSq5/JEBJeaXo06Tllu2Q5gZa4VP1VdxXA=;
 b=uDI6gCQM3DIwiXMxmofLaO77bBwVaxUlaeShcQLjvWP20eqm4rxvz/pwGKfrYYgCVy
 Pw5x8XNnHBP9zZ7EZytlqeINgvoyQ5ynl8201MHXizIsRD5Cksy5oXyUbxhBTk9or657
 4Xj3leSV0jCtZ0YMGxoASY+mYjHetrDqaeywacT7pa7uAN6VHIp3yl6y8pt8jQuRe9FC
 fi9p3SP732Ot1vi+uxokGhWvFu0/LLnu4fgL7Eg1xYV0bW9NCcRoHf6+VgoARQ3mhQRM
 AXQMum96DUE9mXBgOsz1MdZxb9TlyKfEvXaPZfiK9OEqx4Dga/ComQQEjjHIoM/9fDks
 oEIg==
X-Gm-Message-State: AOAM531ayDnBpa4P/e40HTXZigwWobvIFQMSoE6moPVVtjk5SwPDB591
 IJSnVgYNuxo9EEtzucQA4SqTk4cHDkDT4A==
X-Google-Smtp-Source: ABdhPJxVYWCAr5DAdXtQ56DZ3l4a3d1Xtx7+nz29ME/fFQ4Ud2zCy66BlnRbVv5PhpgCoMo3//A5RA==
X-Received: by 2002:a05:6000:232:: with SMTP id
 l18mr5350919wrz.88.1623932214634; 
 Thu, 17 Jun 2021 05:16:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 31/44] target/arm: Implement MVE VQADD, VQSUB (vector)
Date: Thu, 17 Jun 2021 13:16:15 +0100
Message-Id: <20210617121628.20116-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 14 ++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 39 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c4e766c6511..93847fc04ad 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -153,6 +153,22 @@ DEF_HELPER_FLAGS_4(mve_vqrdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index d17c5e4588b..bba3c1c1ee3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -578,6 +578,20 @@ DO_2OP_SAT(vqrdmulhb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT(vqrdmulhh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT(vqrdmulhw, 4, int32_t, DO_QRDMULH_W)
 
+DO_2OP_SAT(vqaddub, 1, uint8_t, DO_UQADD_B)
+DO_2OP_SAT(vqadduh, 2, uint16_t, DO_UQADD_H)
+DO_2OP_SAT(vqadduw, 4, uint32_t, DO_UQADD_W)
+DO_2OP_SAT(vqaddsb, 1, int8_t, DO_SQADD_B)
+DO_2OP_SAT(vqaddsh, 2, int16_t, DO_SQADD_H)
+DO_2OP_SAT(vqaddsw, 4, int32_t, DO_SQADD_W)
+
+DO_2OP_SAT(vqsubub, 1, uint8_t, DO_UQSUB_B)
+DO_2OP_SAT(vqsubuh, 2, uint16_t, DO_UQSUB_H)
+DO_2OP_SAT(vqsubuw, 4, uint32_t, DO_UQSUB_W)
+DO_2OP_SAT(vqsubsb, 1, int8_t, DO_SQSUB_B)
+DO_2OP_SAT(vqsubsh, 2, int16_t, DO_SQSUB_H)
+DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index ec9a9852868..9f59ed591bc 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -398,6 +398,10 @@ DO_2OP(VMULL_TS, vmullts)
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


