Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60439E5EE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:54:12 +0200 (CEST)
Received: from localhost ([::1]:45614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJS0-0000kr-0o
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbO-0000Kr-0y
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:50 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIae-000872-Jj
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:49 -0400
Received: by mail-wr1-x433.google.com with SMTP id c9so9746830wrt.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MtUWIrOwARNN+B35zuZj2IuA3K1qcjuz/iaWJMrCiDM=;
 b=WUszFXbzhOx0qvh67xbSjDEy/SBMJE5J7mP+xDMtDdS7Bl1xf6MaWdqEV2S3KlixZn
 imxQW89lpBCb+TTGY7Z1apQA+a3GgapgpUQmqvN8Ckhsw4DfLL1l2+hInlvBQODuc0Zn
 vWtmnDWmOIc1TYCqJjy9JOByFpu9zGQnUTmBRu3HrpiRRzwv7apYHl0LdlBdyHF+KjIs
 ZY1OIZJ/PjsBXnhPHsVyE8ov5zI3OhoS2ZtzqhdiL9Hwmie28HiNcTfsdUjKtP+9krWb
 KwnUnMuoUSN+xByeaZglvk+etevV0/q0UnXYnTrehESs4MuUfMTzOIMPiBxUgoaHNS+j
 J51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MtUWIrOwARNN+B35zuZj2IuA3K1qcjuz/iaWJMrCiDM=;
 b=hqPeC1VcStqjMMJfLKrMvIL3z8OkUDQ6SpZ6BR1krTvekbSd+RLbDZ5g4DnYPGSBWh
 vboE6j3ySnRe4q6ntmwZ1M5RZ0IyUIyRc1dNqBpEKNrMJ+Do0wK7HwBcCfF6ECttMPU7
 dwccnrSCiF/IYoiVawDir72ZffOrqb2MeafRemKcfR6PqA7WZA0bYQjW6HTFQFfgVuQf
 cKYZnZFxp1rbuM87J46EvoTktUVnTpN5BT2NvV9E5xojcO8RE+V7+zHJfMBrbg/lMIH7
 HEcnSFUILSwZ+I18dOHSquf8XbpoZTWVqQ/psF6zqxmo5YmHMFF9+Bep2Yni3wKCwd4u
 uQLA==
X-Gm-Message-State: AOAM530/0wuEsJKvpDnAM1+vTW1mkVREW3uVQO9x65dV3JTKsrgk82V7
 Pa4gbiT8JnzNzOOYX+dJlQS+Gg==
X-Google-Smtp-Source: ABdhPJyz0v5P56LKVPRX9Zw44RYNm2Ofb+k2ljXIJM7zyZWdVIcMnHASKKGOF+84JBevrU7iXIr2yQ==
X-Received: by 2002:a5d:5243:: with SMTP id k3mr18359569wrc.19.1623085143072; 
 Mon, 07 Jun 2021 09:59:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:59:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 50/55] target/arm: Implement MVE VRHADD
Date: Mon,  7 Jun 2021 17:58:16 +0100
Message-Id: <20210607165821.9892-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Implement the MVE VRHADD insn, which performs a rounded halving
addition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index ffddbd72377..cd2cc6252f8 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -240,6 +240,14 @@ DEF_HELPER_FLAGS_4(mve_vqdmullbw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index 68a2339feae..c9434479604 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -574,6 +574,12 @@ static inline int32_t do_srshl(int32_t n, int8_t shift, int esize)
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
index b227b72e5b6..9a88583385f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -437,6 +437,8 @@ DO_2OP(VQDMLSDH, vqdmlsdh)
 DO_2OP(VQDMLSDHX, vqdmlsdhx)
 DO_2OP(VQRDMLSDH, vqrdmlsdh)
 DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
+DO_2OP(VRHADD_S, vrhadds)
+DO_2OP(VRHADD_U, vrhaddu)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1


