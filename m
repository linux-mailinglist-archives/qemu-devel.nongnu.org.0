Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8933AB423
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:58:02 +0200 (CEST)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrar-0003Dm-3X
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxQ-0002hu-Vm
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:17 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxE-0007J7-Pg
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:16 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso6233762wmi.3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zrb5AvjnvJ0s1md2ppwPh2z3hxVg0GYrb9NBpUTkCjU=;
 b=X3JkkwTI3nSQmA/qMgZs2ugANtRhpc1kJc0c/657y0K8rcOrc3TKh+W4OKXlrL6uEy
 RvdCo4owEHqdkkMLIpSfQSoNCpZk/f5O3zci7v6ufPRBhfEeolqSpnVghHXUFIpnkOIv
 vFbVrWRFNM+gBCFZ8SwIvDIirNZAfqnNDNu/zmi1SDPYPntjDFzLyJTTfJby4w7IPKme
 cm3uDviyQLyl2HNmtGZx7Ms0S63jOHDAyqnoUYgt3oCi8q2IhUe2XPiiRAZRYxj6hTPN
 ETX83fNsZejjB3YEDHg0sXVw+/kcJvzZ0Kl/e7G6OrEIfcadyf+hYd4fdFCgL209eQZq
 lypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zrb5AvjnvJ0s1md2ppwPh2z3hxVg0GYrb9NBpUTkCjU=;
 b=fDEACJV52/Rsw1t1PDY+9UK7p8tGXis2c2clrUJXHKRMYhTQmGlRT25Th6vOt95lUx
 YvIl6RZT3bxeTh6Vfkhj4tXD87TupD1FSPzYkQLt8NEP4J1LXSN3yDAeNc41UYPRMvpP
 KC2Fp/C2Wa0kLErkqzeF9Zqe2Qr7hdij9jSSllTCq5bTfElPc0+v1IK2ZCNYGbfYL9xx
 L/X2CQyKWj9lX1GJ3jcZaWQXBw2znH4nq5rNUBdmt52YueBhUelGbnnEPiv4j55wNAVT
 J5XuNaeYyy6rLTSTInVwfsqbJK9Ve99NHqgDTpg2dnMz5GLcRSppyxbmPDfrLWGXDeBt
 G0Pg==
X-Gm-Message-State: AOAM533rk9vPQRhVWPaZWmj7h2ooQqDk3YqatP8g61fn6W0YbcJJyDs7
 Qt/dXETeMqFrAPC2cs6++wrhkA==
X-Google-Smtp-Source: ABdhPJxtM93J3JcG0e50FsyAI1RIPe0R/f6Wk0S05eRpL0Q+33P5EKtdnR3etGWVQGe7gScLhuXfBw==
X-Received: by 2002:a1c:4d09:: with SMTP id o9mr4768858wmh.149.1623932223525; 
 Thu, 17 Jun 2021 05:17:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:17:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 42/44] target/arm: Implement MVE VHCADD
Date: Thu, 17 Jun 2021 13:16:26 +0100
Message-Id: <20210617121628.20116-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Implement the MVE VHCADD insn, which is similar to VCADD
but performs a halving step. This one overlaps with VADC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index e06b2bcea79..fb002465413 100644
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
index b164907426c..73c15f41333 100644
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


