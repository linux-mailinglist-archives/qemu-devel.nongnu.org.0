Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E45D3DA223
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:30:35 +0200 (CEST)
Received: from localhost ([::1]:34158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94FG-0004m2-A7
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9419-00011B-Mm
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:59 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940n-0001FS-KI
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:59 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so6569133wmh.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YspGX6RXJjhn0x59Tstxyc/gxMQjYsvkbC/RAiXTbf4=;
 b=iIqpT8aV6IL4OOmzIIaz6zYeMdeg/CUj9dYe/IqI/TWZOSWhSKCkhY+xscH5CV3Ij9
 r8L255tLm3+CrGvmE40EkMeIn7hzJYkb6wlyGb+2+z2sthnDEHTbP9uh1ZkZUkBb7PZu
 I2o5br++FQRj23bKYx5y10lkUT6pfB++NIwWR2Dvzi9uWwPTOKMdFYPtHGh64hWTRdJH
 KLqkojyeG5KPf+ihH6LpKuNoS10bzhrxYTS66ObvaW+nvmECGQWLsuWBEulAQeaRqsGS
 0DCtK8MSWXATBuqOrTDynerbX8i7RC0BHPMnxZuvaQqTKbab9raRzK/PyL50W58/Ty7Z
 h8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YspGX6RXJjhn0x59Tstxyc/gxMQjYsvkbC/RAiXTbf4=;
 b=So9BVdeybynR8NjMNTBZrOPg0ae9rtas8kzXx35+wQQBXrNFIZrMHghRQaS2E+nC7d
 qJbSfGTsanrvyxn9IYMagVKDvhdolXJ4tv9gs/Oa++7dhPrvbPOn0Lu69hTZn/oC+svv
 egO1o1R0T0CmNbMJthaD4+zjS4MyMVv5g4f2J6F5OwsYaSJyIZ/DoEk7UysDdowUV5o0
 N1eJwdJzULjSS5tCE64KSeMayd4dlOnICLAoPIqmsxg/bLiOdia6WO5sH6TT4NbRqftT
 LMuT37DwBxlDWTb8bOiNMlgDyX3PwS2xWSia2UlEvp1xZWS9OVpwqze+r205Qh2PzXlZ
 o+EQ==
X-Gm-Message-State: AOAM5304Fw6WKrXVIAgjjNRXA3w/yXuBDZTuBcTku3pOaj9WYkITtOk3
 SNbkRdMoMUxjrnE4s1+NntnIHA==
X-Google-Smtp-Source: ABdhPJwL/W1kA2znBs6cHB3ATOJrxS5Jox1w73yT+94Wp1kyvAmSGCnqtqgaXM7AGQcQd8FiNakUuQ==
X-Received: by 2002:a7b:c301:: with SMTP id k1mr4197646wmj.165.1627557336306; 
 Thu, 29 Jul 2021 04:15:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 26/53] target/arm: Implement MVE VMLA
Date: Thu, 29 Jul 2021 12:14:45 +0100
Message-Id: <20210729111512.16541-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Implement the MVE VMLA insn, which multiplies a vector by a scalar
and accumulates into another vector.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes v1->v2: don't decode U bit
---
 target/arm/helper-mve.h    | 4 ++++
 target/arm/mve.decode      | 1 +
 target/arm/mve_helper.c    | 5 +++++
 target/arm/translate-mve.c | 1 +
 4 files changed, 11 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 34d644a519c..328e31e2665 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -367,6 +367,10 @@ DEF_HELPER_FLAGS_4(mve_vqdmullb_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i3
 DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vmlab, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlah, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vmlaw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlasb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmlash, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmlasw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index cec5a51b0ee..cd9c806a11c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -413,6 +413,7 @@ VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
 # The U bit (28) is don't-care because it does not affect the result
+VMLA             111- 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
 VMLAS            111- 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
 
 # Vector add across vector
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index ea206c932bc..8004b9bb728 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1008,6 +1008,11 @@ DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, DO_QRDMULH_W)
 
+/* Vector by scalar plus vector */
+#define DO_VMLA(D, N, M) ((N) * (M) + (D))
+
+DO_2OP_ACC_SCALAR_U(vmla, DO_VMLA)
+
 /* Vector by vector plus scalar */
 #define DO_VMLAS(D, N, M) ((N) * (D) + (M))
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 92ed1be83e7..f8899af352d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -620,6 +620,7 @@ DO_2OP_SCALAR(VQSUB_U_scalar, vqsubu_scalar)
 DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
 DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
+DO_2OP_SCALAR(VMLA, vmla)
 DO_2OP_SCALAR(VMLAS, vmlas)
 
 static bool trans_VQDMULLB_scalar(DisasContext *s, arg_2scalar *a)
-- 
2.20.1


