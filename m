Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2F39E58A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:34:03 +0200 (CEST)
Received: from localhost ([::1]:45814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJ8U-000418-PY
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbK-0000Cd-Bs
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIae-00086f-Is
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:46 -0400
Received: by mail-wm1-x335.google.com with SMTP id g204so85555wmf.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nA16a0wbwNZedQGtA5Byawf7/on8UyQP7L5tEao8zI=;
 b=kaxkfAjfbb0LQJSUY4exMGwTRJUa0Tg5of53qxdQsoZ/a6kcNAElNOMK+XvcEXjn3H
 Jb26DLQoCE5fs6cLGYz0ge+exfJYkAC1bxB02jSkDHx57FewTHPrYj2kRqp+bE5deQAO
 Q000qkyxdqDp6T/fjfRyrVWziT1Ql5XPA41OhjVdjIcoD85XLcYjHQwKYI1Sril7yxNb
 jqOUSHTL16VxKprNXLpv9b4c39UTUT9dLtWmPtWFksrUhqiQQK3m9NCrVgkOoF3eY9fO
 gAEPRsDloeuFwpK3jH/95ZynOCfTRYlXYkmcytHLlDXQhRPWI5XT0k4UUYI8+xx30HyX
 EfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nA16a0wbwNZedQGtA5Byawf7/on8UyQP7L5tEao8zI=;
 b=HO5C4jqppyatTG3G9r2NxLW9NtL7Ie9azs8nKv1n6ZdHLgwQ6R6UgHTw8q/mPCB4ql
 5PilQNYXhEW5VbIBv+0jK0vwdh+gX90H7kbsOtvCQCfIYbTXirFmKVhobfNJoez7SvOD
 KpmqGBYIXxwxeVkItHS2ob/yuxg17tJrMXkmXepP3NvvKDLSBVpkM9hB8HbaO28cRSI6
 8QgozJ/GKn5EKO3goh3q5tW6CqyLHSGpL8Ajvtnp/OFRWOWq/WDE2/GmE5JuQbIQUZUk
 yaLsMfSPDf7x1UOxOxiWXVfY4Vs+bQ3rzGE691mgU8+4/j7cTJ0UymwdY0Avr2cuSMf3
 XatQ==
X-Gm-Message-State: AOAM533w8w0MqgUPDmh8cd4P/EuLCItWFM1yxu72JlGa1JKfeAy0oy+h
 msvdR0/Nwwy34k06NOQjcLycf4C2JGefzD2w
X-Google-Smtp-Source: ABdhPJzmdwWsI9zqGxf6OWO5rB5AF7FkGXL+WdaAoKNWAgyN4mTf7yxxAXAez0bJiBiBgyvbTjNIIw==
X-Received: by 2002:a1c:2142:: with SMTP id h63mr18050247wmh.84.1623085141465; 
 Mon, 07 Jun 2021 09:59:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:59:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 48/55] target/arm: Implement MVE VQDMLSDH and VQRDMLSDH
Date: Mon,  7 Jun 2021 17:58:14 +0100
Message-Id: <20210607165821.9892-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
---
 target/arm/helper-mve.h    | 16 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 69 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c62066d94aa..e25299b229e 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -219,6 +219,22 @@ DEF_HELPER_FLAGS_4(mve_vqrdmladhxb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index 03701d32dcb..ed0da8097dc 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -903,6 +903,36 @@ static int32_t do_vqdmladh_w(int32_t a, int32_t b, int32_t c, int32_t d,
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
 DO_VQDMLADH_OP(vqdmladhb, 1, int8_t, H1, 0, 0, do_vqdmladh_b)
 DO_VQDMLADH_OP(vqdmladhh, 2, int16_t, H2, 0, 0, do_vqdmladh_h)
 DO_VQDMLADH_OP(vqdmladhw, 4, int32_t, H4, 0, 0, do_vqdmladh_w)
@@ -917,6 +947,20 @@ DO_VQDMLADH_OP(vqrdmladhxb, 1, int8_t, H1, 1, 1, do_vqdmladh_b)
 DO_VQDMLADH_OP(vqrdmladhxh, 2, int16_t, H2, 1, 1, do_vqdmladh_h)
 DO_VQDMLADH_OP(vqrdmladhxw, 4, int32_t, H4, 1, 1, do_vqdmladh_w)
 
+DO_VQDMLADH_OP(vqdmlsdhb, 1, int8_t, H1, 0, 0, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqdmlsdhh, 2, int16_t, H2, 0, 0, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqdmlsdhw, 4, int32_t, H4, 0, 0, do_vqdmlsdh_w)
+DO_VQDMLADH_OP(vqdmlsdhxb, 1, int8_t, H1, 1, 0, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqdmlsdhxh, 2, int16_t, H2, 1, 0, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqdmlsdhxw, 4, int32_t, H4, 1, 0, do_vqdmlsdh_w)
+
+DO_VQDMLADH_OP(vqrdmlsdhb, 1, int8_t, H1, 0, 1, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqrdmlsdhh, 2, int16_t, H2, 0, 1, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqrdmlsdhw, 4, int32_t, H4, 0, 1, do_vqdmlsdh_w)
+DO_VQDMLADH_OP(vqrdmlsdhxb, 1, int8_t, H1, 1, 1, do_vqdmlsdh_b)
+DO_VQDMLADH_OP(vqrdmlsdhxh, 2, int16_t, H2, 1, 1, do_vqdmlsdh_h)
+DO_VQDMLADH_OP(vqrdmlsdhxw, 4, int32_t, H4, 1, 1, do_vqdmlsdh_w)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, H, FN)                           \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 7c25802bf53..0048aec1e9e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -433,6 +433,10 @@ DO_2OP(VQDMLADH, vqdmladh)
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


