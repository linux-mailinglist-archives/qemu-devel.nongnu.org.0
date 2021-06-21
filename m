Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7423AF17D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:11:30 +0200 (CEST)
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNSL-0002Lc-DG
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMna-0007w9-Ka
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:22 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnY-0007nS-T5
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso14327787wmh.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EuNCtElWpZkHQPV+2XyDjESX2bukOQIWrFsLNLLTlFk=;
 b=ia6asaRpkpK7TD2xlrV57VLn6gxoh6h9eduCfPGAwGFsR9v8P7CyeFwKLYQ1dDHuMZ
 5gb/h0uYycFUAjySJXQEqWqu1/ohcPghx5i+LmsJFc73pnpqJbQNbbKVaFGRl2jS87sw
 8x5v0gdstIkSSpoHXLZj6UNhjg/gXw5p0654pWHeqyWMM+4hNX80sPGBmPhCwxMPYhTW
 NcARtf8EcktPYKogEWVym2FmDqUDYyAltNcyXOO9shmGWCjk2f9jR+xMoBcyjDmCUn/4
 Ljp5ia3W8dIrY0pa6NZDNPN9sP0l2WmWR0L6U8hRNROXBFd+f5gL5YeFpSCHE/rshipE
 hnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EuNCtElWpZkHQPV+2XyDjESX2bukOQIWrFsLNLLTlFk=;
 b=is7nS3zEjfmhd7EuScInr8CQPvkAj3EnDV+xHBYBSAK2U2clQvL97tbSPY7/Ypl8IG
 6YakEXQ8frqQiq9Vz4TOjVi4XdcxfXxoeWNbF0f2hdGoNo+/Tg5GXvq+f/ZIZfjSapjz
 N9QI8vS22bb5tquFWBCZnfx91lbPsy5MVWH3JdR1Vvpc3r5MQ2/0ADnjrrBYQ5ifmMg5
 ouAl5e6oMVyTe3kEvaZRFfSPbh+L6x6b3jTPntfaxPrmnCsYE2jziGfSZt2gSuXEhxCC
 llieDy3x6qmVTnoT+deGumbePhEgqm+gJKtoqBqSnqeM6mGuJFh8aMkmh54Hkq9ehb7R
 gJpg==
X-Gm-Message-State: AOAM532bKR9urjFT/u0lnwHmllUb8XnyNMUpoOl+9WjwSl9vLNkVjwHP
 WcMyJkj7uoV3TZycGa3cvJAR9eRkuy7fviRy
X-Google-Smtp-Source: ABdhPJzM+oyHqfbKrhJU7lFEvOTaQI0EliYVig1WDoP2MRZL/Lp4bvtUGfToKMFjeW9tSdimrQIRFw==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr28445042wmh.144.1624292959642; 
 Mon, 21 Jun 2021 09:29:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 50/57] target/arm: Implement MVE VRHADD
Date: Mon, 21 Jun 2021 17:28:26 +0100
Message-Id: <20210621162833.32535-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Implement the MVE VRHADD insn, which performs a rounded halving
addition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-40-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 34a46ed38ee..2f0cf99359a 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -238,6 +238,14 @@ DEF_HELPER_FLAGS_4(mve_vqdmullbw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmullth, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmulltw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vrhaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vrhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vrhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 3a2a7e75a3a..6b969902df0 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -157,6 +157,9 @@ VQRDMLSDHX       1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
 VQDMULLB         111 . 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 1 @2op_sz28
 VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
 
+VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
+VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 07c6b238feb..725a775605a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -531,6 +531,12 @@ DO_2OP_U(vshlu, DO_VSHLU)
 DO_2OP_S(vrshls, DO_VRSHLS)
 DO_2OP_U(vrshlu, DO_VRSHLU)
 
+#define DO_RHADD_S(N, M) (((int64_t)(N) + (M) + 1) >> 1)
+#define DO_RHADD_U(N, M) (((uint64_t)(N) + (M) + 1) >> 1)
+
+DO_2OP_S(vrhadds, DO_RHADD_S)
+DO_2OP_U(vrhaddu, DO_RHADD_U)
+
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
     if (val > max) {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 05789a19812..febf644079c 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -418,6 +418,8 @@ DO_2OP(VQDMLSDH, vqdmlsdh)
 DO_2OP(VQDMLSDHX, vqdmlsdhx)
 DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
+DO_2OP(VRHADD_S, vrhadds)
+DO_2OP(VRHADD_U, vrhaddu)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1


