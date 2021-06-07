Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F278139E566
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:28:56 +0200 (CEST)
Received: from localhost ([::1]:33134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJ3X-0003U5-Cs
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbF-0008NT-RQ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIab-00085s-Km
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id a20so18492443wrc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fGbsL0Vwzsphqd9BOE+K3Cgyjkt5iafRzopECzKXlTk=;
 b=rtCN42k1YLcAp1p5WQY/xVy7uP2dRGuuQrWjywpQub8YgmxfGPUiHU7v4m3D6ylSfi
 aUQlAqCHyNNvIV0Iwv5EnqXq97Qm3lOqTfLcvPew4DSUZUs75dg9p+RUBfUmKDw71LLR
 QXO6ebnRWVQAk3J+SWBz+tvULPsAI7CWUD3PIlGAjqFBh4B1L98pjT1LuYWeO0tjE8Ar
 WzNq1hCO1t4GhBpYtPATj+bGqPerHCx6NqxKnVt0ATvXgbF1Px1O+1XLzmZhZHLhw4Ve
 h1YJUhzd39wwVRWo/n3Tcf2XOqmfqyOfRWDvTdtmk4FK4DvpbAwHymxaQ88M0t49lukK
 Ch/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fGbsL0Vwzsphqd9BOE+K3Cgyjkt5iafRzopECzKXlTk=;
 b=jVoVyuW54Qqr82Pdz+evaHfp0t9vsMGjRxifIUwjmMNaQyvar73khKUiylrRtIyqqN
 eVIV6jl3ACZKqCQCS68xMW+zzZGyXvtp+thNOpL65c9bvD7ZjOlPXydeAggcdbx+RThq
 phDHQKBaSRueJgiDvjQDex9vregj1w2u/gvdBjzUcju6slrs5JUwCtQvVvm3OY51G/Dt
 IQOptqrjJed6DNPMUzZiiaIH2AOGkzs0sqhVdAmrJKN6lCA+4YALeeCusxv36zpSPYJL
 bRAe0ybWHreN76Jz3eTxb3kx+F2ytEFPSaKuRWWX9bH56cmTCXybnz9AxdSUGqtbftAM
 3i7g==
X-Gm-Message-State: AOAM531QMLHCpc/shFsxAWDC7hCJoChpRO+vgvfiWte7ygjGhDm7lLa7
 IHAi+qP78bHRLBdpS8rX1Q6/mQ==
X-Google-Smtp-Source: ABdhPJyWJVnBQfAPSwU9JrSi3LP08ZxRJuw1K7iB7gXSgirMH5DMErk+si2FwFprXw4Vrapp/MErnA==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr17686776wrz.59.1623085139104; 
 Mon, 07 Jun 2021 09:58:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 45/55] target/arm: Implement MVE VSHL insn
Date: Mon,  7 Jun 2021 17:58:11 +0100
Message-Id: <20210607165821.9892-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Implement the MVE VSHL insn (vector form).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 43 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index a2f9916b24e..6ef01d367b4 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -171,6 +171,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e78eab6d659..ebf156b46b5 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -130,6 +130,9 @@ VQADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
 VQSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 
+VSHL_S           111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
+VSHL_U           111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 0 ... 0 @2op_rev
+
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index b7f9af4067b..c95d5a0fd8e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -508,6 +508,36 @@ DO_2OP_U(vhaddu, do_vhadd_u)
 DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
 
+static inline uint32_t do_ushl(uint32_t n, int8_t shift, int esize)
+{
+    if (shift >= esize || shift <= -esize) {
+        return 0;
+    } else if (shift < 0) {
+        return n >> -shift;
+    } else {
+        return n << shift;
+    }
+}
+
+static inline int32_t do_sshl(int32_t n, int8_t shift, int esize)
+{
+    if (shift >= esize) {
+        return 0;
+    } else if (shift <= -esize) {
+        return n >> (esize - 1);
+    } else if (shift < 0) {
+        return n >> -shift;
+    } else {
+        return n << shift;
+    }
+}
+
+#define DO_VSHLS(N, M) do_sshl(N, M, sizeof(N) * 8)
+#define DO_VSHLU(N, M) do_ushl(N, M, sizeof(N) * 8)
+
+DO_2OP_S(vshls, DO_VSHLS)
+DO_2OP_U(vshlu, DO_VSHLU)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bea561726ea..6eaa99bc0f5 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -421,6 +421,8 @@ DO_2OP(VQADD_S, vqadds)
 DO_2OP(VQADD_U, vqaddu)
 DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
+DO_2OP(VSHL_S, vshls)
+DO_2OP(VSHL_U, vshlu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
 DO_2OP(VQRSHL_S, vqrshls)
-- 
2.20.1


