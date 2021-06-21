Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E313AF1BE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:17:10 +0200 (CEST)
Received: from localhost ([::1]:55032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNXp-0004XY-Us
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMne-00089s-DZ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:26 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMna-0007oU-TP
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 y13-20020a1c4b0d0000b02901c20173e165so436188wma.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5nU3f4RWod9/+QjnyOBiVQ5f4cz1KcnkOAoyTjGuVhs=;
 b=JmkJZcDeNBVeZ0E+ee910IEV3IUpYsRMyBK3ROJJ/WlPfJlpCJtitm5NnNuBekMbaa
 IGQ09XV3cSJQeJ1jowSQ18KRZ9k2H8eZyjhM1ANX+VbiZrCldwAdyi6gCiqEs5ult61p
 7ZHDsFuPBtPZmbU27pLIBIOUxaYCYw+0Omkvb/CvJ4g8mmX+2fWimX0xyN+HWVp9vOKx
 gGV9gxJSqn97Z7P2JCJeOoPLwtcsn4I5Gl7By0xicJzSU2/JlKimq8qxLhf6Fld9dqB0
 Hlv4UPQCd14z5I+VpqaDwjA0X+UW+EBvai7g1zUcCaIUCoz9klaFS/Exe6VVb9mxH1GP
 ozxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5nU3f4RWod9/+QjnyOBiVQ5f4cz1KcnkOAoyTjGuVhs=;
 b=MLq9g1yjm1luponZT/KRbHKw+a3KBN5dh+HV17ofLE9j67SfPL0JaOtyI8zHlwwzHV
 qYviPe37y/miWBOen5X5MPkHQNB7eg4qHWmToRiZido6X+wj8M11jHHnst5/cH4yXaWx
 A0ejceAc1DgU40c2IUpItrmhLhRdqtdVpLgmIw9bxQpF6LYKTyU+k3rrUWoyXPXNVVwd
 gz3PP8imYXJaFdYl3XMk7YKyED4i1jelGlrTVJu91x42qIDmwxS2bKB3T7lge8URYX/8
 7VWsYtGiM3nWDX3g9QLsfVat6XlhapYssBu6zI+izk8cOIirxTpKKcWYVWAX0VT+1RZ7
 eFpA==
X-Gm-Message-State: AOAM531/loibhto2F4/iyT/nXk7MUAnHd3Ps/HnIgHkHnwf4COPfz+tj
 CzbI7GnwzTgvSfG7Yzy5yvpFz6yol/RTgYDN
X-Google-Smtp-Source: ABdhPJwCY8R8w3jN07XmAMX5yJUHxy4sbrCQL73yE3+uAzGQyYmIvQHJJhzkt0JLrr2kUKKBSgc0TA==
X-Received: by 2002:a1c:9a8b:: with SMTP id c133mr20360119wme.65.1624292961765; 
 Mon, 21 Jun 2021 09:29:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 53/57] target/arm: Implement MVE VHCADD
Date: Mon, 21 Jun 2021 17:28:29 +0100
Message-Id: <20210621162833.32535-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VHCADD insn, which is similar to VCADD
but performs a halving step. This one overlaps with VADC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-43-peter.maydell@linaro.org
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
index fcb44ae7441..9839d3e64a3 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -617,6 +617,8 @@ void HELPER(mve_vsbci)(CPUARMState *env, void *vd, void *vn, void *vm)
 
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


