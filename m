Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816E3BA0F1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:09:30 +0200 (CEST)
Received: from localhost ([::1]:43072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIvB-0002P6-MS
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImN-0007i4-1D
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:24 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm7-0007iQ-IE
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id t6so2468204wrm.9
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=osZMfFMeA2mp6P0cq6qgh0GySJvWDadwBQMzDcmk64Y=;
 b=OMGCV0COtkuS1ZCSGtmMfriWLCZiZ0o8Y9fjLrvnegsKbI+PCFFPtd9KvewB6graqs
 JRnbPrM6MthbcQgrUOStOQ3huUx84tSD3COEbPd4cowwVKYyO2Jd3F2A108tjcApUeVq
 PFRFUlHwQAPo8czR2In2RoCJm5YwVxrWVHjafk5cUjHlUxWEeMwYA5s7585ajOqnTS9a
 MQm9VOYgb5Usa+jyOs7E94DbtRCweXryayytEcNOEfw5TmsoPQtRe9nUDEw2D1bZ5EcP
 lWCfGO6K+HaigODPyMrPBrWush4gbnIAlHHzjftD6/Hrhp9p2p/RqvRV5ABhjfyO3THr
 PFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=osZMfFMeA2mp6P0cq6qgh0GySJvWDadwBQMzDcmk64Y=;
 b=IyjPs8afdmFKojU/Qo7wPE0V7VM1aDXrPMuka5j2ro7UXr/mGzFHcw/tG4OE7IPz84
 TeLqEWN6j5q9ZMIPWoUCQPsbq/XUpeeUclisZPt23JmuLdVUWzUY1UHkAaV1j/6lB+9C
 cl9eRW266XZnG3K8ELOS92F5K40ZV+G3WjZNw0+FEYTl67jXtsbLx2JNujAMJBLn8lZj
 yIukgdWxpMHoC9WrtRvgDIoffY1JOjwo0RUhMxGx5WwNrE/CQ7TlrBqcrTlEzoRZIEj7
 Hr0y2IANPKsitbitIkUG6oLDqAG9uygFK1oA9392UGL8oqF2Jd9lm3/jPxcL7FjX6BYl
 +/Tg==
X-Gm-Message-State: AOAM530d8CVILGsgirVE7UlMhJwp0DKCRE6oocwQznZcKaefynj1HRaW
 gFyYEjYp39p7xxAjnpuVn1e4MnvuH4gIR4Uu
X-Google-Smtp-Source: ABdhPJzt5Xjbwr+oMYbdeCM23IGbseXC4HCgMp3dgwmgqSB6dqUgeTZaC3TEJN9wXA05UOE6fuTcug==
X-Received: by 2002:adf:f68f:: with SMTP id v15mr5737125wrp.291.1625230806216; 
 Fri, 02 Jul 2021 06:00:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/24] target/arm: Implement MVE vector shift right by
 immediate insns
Date: Fri,  2 Jul 2021 13:59:44 +0100
Message-Id: <20210702125954.13247-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE vector shift right by immediate insns VSHRI and
VRSHRI.  As with Neon, we implement these by using helper functions
which perform left shifts but allow negative shift counts to indicate
right shifts.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210628135835.6690-9-peter.maydell@linaro.org
---
 target/arm/helper-mve.h     | 12 ++++++++++++
 target/arm/translate.h      | 20 ++++++++++++++++++++
 target/arm/mve.decode       | 28 ++++++++++++++++++++++++++++
 target/arm/mve_helper.c     |  7 +++++++
 target/arm/translate-mve.c  |  5 +++++
 target/arm/translate-neon.c | 18 ------------------
 6 files changed, 72 insertions(+), 18 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 8cd7c6a0d8a..288a8faf4e8 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -360,6 +360,10 @@ DEF_HELPER_FLAGS_3(mve_vmovi, TCG_CALL_NO_WG, void, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vandi, TCG_CALL_NO_WG, void, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vorri, TCG_CALL_NO_WG, void, env, ptr, i64)
 
+DEF_HELPER_FLAGS_4(mve_vshli_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshli_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshli_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vshli_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vshli_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vshli_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
@@ -375,3 +379,11 @@ DEF_HELPER_FLAGS_4(mve_vqshli_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqshlui_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqshlui_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqshlui_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vrshli_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrshli_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrshli_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vrshli_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrshli_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrshli_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index e2f056c32c2..4b5db937ef3 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -161,6 +161,26 @@ static inline int times_2_plus_1(DisasContext *s, int x)
     return x * 2 + 1;
 }
 
+static inline int rsub_64(DisasContext *s, int x)
+{
+    return 64 - x;
+}
+
+static inline int rsub_32(DisasContext *s, int x)
+{
+    return 32 - x;
+}
+
+static inline int rsub_16(DisasContext *s, int x)
+{
+    return 16 - x;
+}
+
+static inline int rsub_8(DisasContext *s, int x)
+{
+    return 8 - x;
+}
+
 static inline int arm_dc_feature(DisasContext *dc, int feature)
 {
     return (dc->features & (1ULL << feature)) != 0;
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 183eb731d2b..8be04589a6c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -64,6 +64,18 @@
 @2_shl_h .... .... .. 01  shift:4 .... .... .... .... &2shift qd=%qd qm=%qm size=1
 @2_shl_w .... .... .. 1   shift:5 .... .... .... .... &2shift qd=%qd qm=%qm size=2
 
+# Right shifts are encoded as N - shift, where N is the element size in bits.
+%rshift_i5  16:5 !function=rsub_32
+%rshift_i4  16:4 !function=rsub_16
+%rshift_i3  16:3 !function=rsub_8
+
+@2_shr_b .... .... .. 001 ... .... .... .... .... &2shift qd=%qd qm=%qm \
+         size=0 shift=%rshift_i3
+@2_shr_h .... .... .. 01 .... .... .... .... .... &2shift qd=%qd qm=%qm \
+         size=1 shift=%rshift_i4
+@2_shr_w .... .... .. 1 ..... .... .... .... .... &2shift qd=%qd qm=%qm \
+         size=2 shift=%rshift_i5
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -298,3 +310,19 @@ VQSHLI_U          111 1 1111 1 . ... ... ... 0 0111 0 1 . 1 ... 0 @2_shl_w
 VQSHLUI           111 1 1111 1 . ... ... ... 0 0110 0 1 . 1 ... 0 @2_shl_b
 VQSHLUI           111 1 1111 1 . ... ... ... 0 0110 0 1 . 1 ... 0 @2_shl_h
 VQSHLUI           111 1 1111 1 . ... ... ... 0 0110 0 1 . 1 ... 0 @2_shl_w
+
+VSHRI_S           111 0 1111 1 . ... ... ... 0 0000 0 1 . 1 ... 0 @2_shr_b
+VSHRI_S           111 0 1111 1 . ... ... ... 0 0000 0 1 . 1 ... 0 @2_shr_h
+VSHRI_S           111 0 1111 1 . ... ... ... 0 0000 0 1 . 1 ... 0 @2_shr_w
+
+VSHRI_U           111 1 1111 1 . ... ... ... 0 0000 0 1 . 1 ... 0 @2_shr_b
+VSHRI_U           111 1 1111 1 . ... ... ... 0 0000 0 1 . 1 ... 0 @2_shr_h
+VSHRI_U           111 1 1111 1 . ... ... ... 0 0000 0 1 . 1 ... 0 @2_shr_w
+
+VRSHRI_S          111 0 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_b
+VRSHRI_S          111 0 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_h
+VRSHRI_S          111 0 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_w
+
+VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_b
+VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_h
+VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_w
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 285c8b56f78..ac720c9ee05 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1229,6 +1229,10 @@ DO_VADDV(vaddvuw, 4, uint32_t)
     DO_2SHIFT(OP##b, 1, uint8_t, FN)            \
     DO_2SHIFT(OP##h, 2, uint16_t, FN)           \
     DO_2SHIFT(OP##w, 4, uint32_t, FN)
+#define DO_2SHIFT_S(OP, FN)                     \
+    DO_2SHIFT(OP##b, 1, int8_t, FN)             \
+    DO_2SHIFT(OP##h, 2, int16_t, FN)            \
+    DO_2SHIFT(OP##w, 4, int32_t, FN)
 
 #define DO_2SHIFT_SAT_U(OP, FN)                 \
     DO_2SHIFT_SAT(OP##b, 1, uint8_t, FN)        \
@@ -1240,6 +1244,9 @@ DO_VADDV(vaddvuw, 4, uint32_t)
     DO_2SHIFT_SAT(OP##w, 4, int32_t, FN)
 
 DO_2SHIFT_U(vshli_u, DO_VSHLU)
+DO_2SHIFT_S(vshli_s, DO_VSHLS)
 DO_2SHIFT_SAT_U(vqshli_u, DO_UQSHL_OP)
 DO_2SHIFT_SAT_S(vqshli_s, DO_SQSHL_OP)
 DO_2SHIFT_SAT_S(vqshlui_s, DO_SUQSHL_OP)
+DO_2SHIFT_U(vrshli_u, DO_VRSHLU)
+DO_2SHIFT_S(vrshli_s, DO_VRSHLS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index fc8a2da6e1f..4030ee07f0d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -888,3 +888,8 @@ DO_2SHIFT(VSHLI, vshli_u, false)
 DO_2SHIFT(VQSHLI_S, vqshli_s, false)
 DO_2SHIFT(VQSHLI_U, vqshli_u, false)
 DO_2SHIFT(VQSHLUI, vqshlui_s, false)
+/* These right shifts use a left-shift helper with negated shift count */
+DO_2SHIFT(VSHRI_S, vshli_s, true)
+DO_2SHIFT(VSHRI_U, vshli_u, true)
+DO_2SHIFT(VRSHRI_S, vrshli_s, true)
+DO_2SHIFT(VRSHRI_U, vrshli_u, true)
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index f915f70970b..a45616cb631 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -33,24 +33,6 @@ static inline int plus1(DisasContext *s, int x)
     return x + 1;
 }
 
-static inline int rsub_64(DisasContext *s, int x)
-{
-    return 64 - x;
-}
-
-static inline int rsub_32(DisasContext *s, int x)
-{
-    return 32 - x;
-}
-static inline int rsub_16(DisasContext *s, int x)
-{
-    return 16 - x;
-}
-static inline int rsub_8(DisasContext *s, int x)
-{
-    return 8 - x;
-}
-
 static inline int neon_3same_fp_size(DisasContext *s, int x)
 {
     /* Convert 0==fp32, 1==fp16 into a MO_* value */
-- 
2.20.1


