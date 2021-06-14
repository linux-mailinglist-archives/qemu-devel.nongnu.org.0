Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC5B3A6AE4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:48:24 +0200 (CEST)
Received: from localhost ([::1]:56870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsop5-0008BK-EH
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoFF-0002oN-AH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:21 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEq-0000fT-Qb
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:20 -0400
Received: by mail-wr1-x429.google.com with SMTP id m18so14943255wrv.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H4ue7qs51eOs2wh009o2wJxjdARm6QlBdUc1wl7Oz8I=;
 b=eM+GNxoNQ+f0azyAEhqWDNcyaIyaIcj383EjYjmr+4HEf2VkYYvtJKMmELLtd7NbDV
 iOCJHEFHSCwV+fYGHAHdaF2E+5LKDRdD/jUkangL7T0X5Zy6k9rlD7pF7BeOmk5tyTLU
 UPDVrXso6CqfR5EnmbhMt1fRW6K/AuzTKTTj/gn23jbDA8aJqXcbcbz/ZBfzLPcCSXfP
 Tt/lD4rSc+dKoSFjvFJWyk8/2AS7pYqMNYyA4OQ5X4KjQzTLu0LQ3STPskvJc47g9+E3
 XZrLmYSjVxA0ym5BOca87aBgPqi6zZnCUXCfbikX28ysK2zqGpfVQXRJnf34Htygj2Pd
 8FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H4ue7qs51eOs2wh009o2wJxjdARm6QlBdUc1wl7Oz8I=;
 b=Dho31Ute9kkUSpyfkEITJYC8XWvy7u1axGuQlG1LZ6zPNCjsc4zTDBkBLdoicMe0hy
 3s3+krfpH4WBUwCMmETmmk975UbOXygz7YjlP6zr7+E/ZM9LaMC0kIHTPP5pzQ4t7bHc
 6ix0I8ajVUb9OVzQuC0s6ZkN6eQ1tcke37NsoiQktf92anwLYSI36iN3Y4Go9Q0XkBk7
 Cz2dFHA30+kFX7HIqBU0oKx91M/K5Ugg5AWML8HrQ03buB5ymcqlquEvVHAwk5C/KzsM
 6TAmdPe9Mh/CJaQ+4DAONu6PD7lnBf/pf54b2Wb4XuN8Ife2MkyQQ9iG5T18zo+aShQJ
 OaGg==
X-Gm-Message-State: AOAM531vbCwjLFAC4V5GQR4H6OBm6RFk936xPDrK54KcgwLR+k8q8Gcy
 xSMRxrLRUMt/Iv3XBl4zEHxohg==
X-Google-Smtp-Source: ABdhPJwsPRo7CSfeZQS8eOFOaEKPkIihdlh/fN5hljJ2W070x8Lc1X+FxdzXaANzQ4Z7rDdg2JE2TA==
X-Received: by 2002:a5d:68c9:: with SMTP id p9mr19355573wrw.330.1623683455348; 
 Mon, 14 Jun 2021 08:10:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 55/57] target/arm: Implement MVE VHCADD
Date: Mon, 14 Jun 2021 16:10:05 +0100
Message-Id: <20210614151007.4545-56-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
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

Implement the MVE VHCADD insn, which is similar to VCADD
but performs a halving step. This one overlaps with VADC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 8 ++++++--
 target/arm/mve_helper.c    | 2 ++
 target/arm/translate-mve.c | 4 +++-
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index b8ad3df9cc8..161308b67e6 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -259,6 +259,14 @@ DEF_HELPER_FLAGS_4(mve_vcadd270b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vhcadd90b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd90w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vhcadd270b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index afe60078649..695097dcca4 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -160,8 +160,12 @@ VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
 VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 
-VADC             1110 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
-VADCI            1110 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
+{
+  VADC           1110 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
+  VADCI          1110 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 0 @2op_nosz
+  VHCADD90       1110 1110 0 . .. ... 0 ... 0 1111 . 0 . 0 ... 0 @2op
+  VHCADD270      1110 1110 0 . .. ... 0 ... 1 1111 . 0 . 0 ... 0 @2op
+}
 
 {
   VSBC           1111 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 0 @2op_nosz
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index e2daf34f38e..e5b8016e377 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -632,6 +632,8 @@ void HELPER(mve_vsbci)(CPUARMState *env, void *vd, void *vn, void *vm)
 
 DO_VCADD_ALL(vcadd90, DO_SUB, DO_ADD)
 DO_VCADD_ALL(vcadd270, DO_ADD, DO_SUB)
+DO_VCADD_ALL(vhcadd90, do_vhsub_s, do_vhadd_s)
+DO_VCADD_ALL(vhcadd270, do_vhadd_s, do_vhsub_s)
 
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index c9f5ef73955..ca619dad14a 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -423,10 +423,12 @@ DO_2OP(VRHADD_U, vrhaddu)
 /*
  * VCADD Qd == Qm at size MO_32 is UNPREDICTABLE; we choose not to diagnose
  * so we can reuse the DO_2OP macro. (Our implementation calculates the
- * "expected" results in this case.)
+ * "expected" results in this case.) Similarly for VHCADD.
  */
 DO_2OP(VCADD90, vcadd90)
 DO_2OP(VCADD270, vcadd270)
+DO_2OP(VHCADD90, vhcadd90)
+DO_2OP(VHCADD270, vhcadd270)
 
 static bool trans_VQDMULLB(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1


