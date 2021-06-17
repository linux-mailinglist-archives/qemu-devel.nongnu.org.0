Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B6A3AB417
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:54:30 +0200 (CEST)
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrXR-0004ty-GB
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxN-0002Tq-7x
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:13 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxB-0007Fz-2h
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:12 -0400
Received: by mail-wr1-x432.google.com with SMTP id e22so2946413wrc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PWcuSAD3/5hxwuQlsn0htQLTBxXesJorNVu152nftmE=;
 b=msba7P3wswMV0x+OTLLofF71lZla+DmCRO6yEv+6uTHAls2Ip1YcC6IabguZPt4HS/
 Vp6tLAGFrSBN0CiPT9JGlccvL8F01mbnfABtxNFPriXvcP+j8l22sTrjjS0izhC0GZnL
 Dcyo3GqPvpjjd4PHvPrbtEdvQt3djMTBNG9pj2xqwjmI1Qmc47XpYIVU3pZscGMSTSyd
 rKJ+pYkLUn1/tfss9mrAWqFUHWhbIYjbnPUQ7bEuiCIapAGNbGncYSWqqoVh4wAa4ePJ
 Phy8Ki1EJDni+aWSp5L6McLQWainuRBDCC/1KTpf3mB2WF62Kcd2XSgfpAyr0GGg0zq6
 Y0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PWcuSAD3/5hxwuQlsn0htQLTBxXesJorNVu152nftmE=;
 b=YAk2B0fZ/vrERTsTGxFbdtsCdJsmxKNznjZSLQJfXVTXEcIFLteYkh3SgY7dyS8wFd
 aHwBUfrzThYmq1qaB6J9jSa+ohW3eZj8DZKSIBFa3BE62CeuzglA5SJsQzvCxsYsporj
 JG4buCR6t0E5q1SU5/YvNoLsJSF6vjzkZZdEcJI7NmOuAk5FHa47vNnBwKRzyxFFFxps
 rg/AZCIS07jmVMKqtSdQJclsbGIm5CoLB5J95sKwoMAXm6ZRvFI5z4gnKTaegzJkGPmL
 CqXYbrFFvabUvnVUlZV+Ws+tcdhjLdaI0Orv3jV3wiNuh9JVsss2TrlwUaHWwCWZ5zpq
 85tg==
X-Gm-Message-State: AOAM5303yHoHEkoToJzHl+RpwUsSAWQDvw356k1Om8zYAUA0XlpHEgPS
 7BQ96rbXza7IOYgY1zuv7i6EeBoT98vqTQ==
X-Google-Smtp-Source: ABdhPJydT2j3FAQBxlk0fPmu5D94YgIJPJvrd70F15rKExB+wbv2aIRMGuf/VcQTRkLGA+M+axjG7g==
X-Received: by 2002:a05:6000:232:: with SMTP id
 l18mr5351330wrz.88.1623932219692; 
 Thu, 17 Jun 2021 05:16:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 37/44] target/arm: Implement MVE VQDMLSDH and VQRDMLSDH
Date: Thu, 17 Jun 2021 13:16:21 +0100
Message-Id: <20210617121628.20116-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Implement the MVE VQDMLSDH and VQRDMLSDH insns, which are
like VQDMLADH and VQRDMLADH except that products are subtracted
rather than added.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 69 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c3cc6a08476..61f8082e0e3 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -217,6 +217,22 @@ DEF_HELPER_FLAGS_4(mve_vqrdmladhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmladhxh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqrdmladhxw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhxh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmlsdhxw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmlsdhxw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index d267c8838eb..fa4fb1b2038 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -147,6 +147,11 @@ VQDMLADHX        1110 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
 VQRDMLADH        1110 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
 VQRDMLADHX       1110 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
 
+VQDMLSDH         1111 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 0 @2op
+VQDMLSDHX        1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
+VQRDMLSDH        1111 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
+VQRDMLSDHX       1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 9c64e4979bc..8db03003ce1 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -717,6 +717,36 @@ static int32_t do_vqdmladh_w(int32_t a, int32_t b, int32_t c, int32_t d,
     return r >> 32;
 }
 
+static int8_t do_vqdmlsdh_b(int8_t a, int8_t b, int8_t c, int8_t d,
+                            int round, bool *sat)
+{
+    int64_t r = ((int64_t)a * b - (int64_t)c * d) * 2 + (round << 7);
+    return do_sat_bhw(r, INT16_MIN, INT16_MAX, sat) >> 8;
+}
+
+static int16_t do_vqdmlsdh_h(int16_t a, int16_t b, int16_t c, int16_t d,
+                             int round, bool *sat)
+{
+    int64_t r = ((int64_t)a * b - (int64_t)c * d) * 2 + (round << 15);
+    return do_sat_bhw(r, INT32_MIN, INT32_MAX, sat) >> 16;
+}
+
+static int32_t do_vqdmlsdh_w(int32_t a, int32_t b, int32_t c, int32_t d,
+                             int round, bool *sat)
+{
+    int64_t m1 = (int64_t)a * b;
+    int64_t m2 = (int64_t)c * d;
+    int64_t r;
+    /* The same ordering issue as in do_vqdmladh_w applies here too */
+    if (ssub64_overflow(m1, m2, &r) ||
+        sadd64_overflow(r, (round << 30), &r) ||
+        sadd64_overflow(r, r, &r)) {
+        *sat = true;
+        return r < 0 ? INT32_MAX : INT32_MIN;
+    }
+    return r >> 32;
+}
+
 DO_VQDMLADH_OP(vqdmladhb, 1, int8_t, 0, 0, do_vqdmladh_b)
 DO_VQDMLADH_OP(vqdmladhh, 2, int16_t, 0, 0, do_vqdmladh_h)
 DO_VQDMLADH_OP(vqdmladhw, 4, int32_t, 0, 0, do_vqdmladh_w)
@@ -731,6 +761,20 @@ DO_VQDMLADH_OP(vqrdmladhxb, 1, int8_t, 1, 1, do_vqdmladh_b)
 DO_VQDMLADH_OP(vqrdmladhxh, 2, int16_t, 1, 1, do_vqdmladh_h)
 DO_VQDMLADH_OP(vqrdmladhxw, 4, int32_t, 1, 1, do_vqdmladh_w)
 
+DO_VQDMLADH_OP(vqdmlsdhb, 1, int8_t, 0, 0, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqdmlsdhh, 2, int16_t, 0, 0, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqdmlsdhw, 4, int32_t, 0, 0, do_vqdmlsdh_w)
+DO_VQDMLADH_OP(vqdmlsdhxb, 1, int8_t, 1, 0, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqdmlsdhxh, 2, int16_t, 1, 0, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqdmlsdhxw, 4, int32_t, 1, 0, do_vqdmlsdh_w)
+
+DO_VQDMLADH_OP(vqrdmlsdhb, 1, int8_t, 0, 1, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqrdmlsdhh, 2, int16_t, 0, 1, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqrdmlsdhw, 4, int32_t, 0, 1, do_vqdmlsdh_w)
+DO_VQDMLADH_OP(vqrdmlsdhxb, 1, int8_t, 1, 1, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqrdmlsdhxh, 2, int16_t, 1, 1, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqrdmlsdhxw, 4, int32_t, 1, 1, do_vqdmlsdh_w)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d830b42d5ce..27b3e378ac7 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -414,6 +414,10 @@ DO_2OP(VQDMLADH, vqdmladh)
 DO_2OP(VQDMLADHX, vqdmladhx)
 DO_2OP(VQRDMLADH, vqrdmladh)
 DO_2OP(VQRDMLADHX, vqrdmladhx)
+DO_2OP(VQDMLSDH, vqdmlsdh)
+DO_2OP(VQDMLSDHX, vqdmlsdhx)
+DO_2OP(VQRDMLSDH, vqrdmlsdh)
+DO_2OP(VQRDMLSDHX, vqrdmlsdhx)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


