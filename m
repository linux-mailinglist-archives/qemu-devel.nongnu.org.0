Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0955C3AB3A8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:35:24 +0200 (CEST)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrEx-0007Xs-0m
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx1-0001al-Az
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:51 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwt-00070E-HC
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:51 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso6248474wmg.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7aDnNnERKIOdMfDpMw/E34SJCR3x0rNEDhP50IL7Vl8=;
 b=S9NmXM34cccfpWN3RIgJIbLy4nPBGPUxDJhpaeuNVf3U2lZvvBl3ZzjusVZw+U28P6
 MdNpoEfjwaIr69SV2rVcv7fheFaZtKG3DXNUIxoSd5R/vZMDWtyFsa7AcSiCHdGo/PFz
 80+j72EZqW/tiHZOo6r+5ybYNA7bd18WuGRCy+7Uash5nQe0fll7m6A+d/1yOZZ4LaCa
 oQMQCaKjYgWO99rZN4mr7e3U7eoJkdPMDcc3awFq797IZP5upPRJ5kNEYUef5sMQDQeD
 efqTqL7KpZ5srFZDPRtRLEpmR7hsusvsvaCsKuC4akX3aQoknsxZg9Xkp51gN//BGHe6
 r0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7aDnNnERKIOdMfDpMw/E34SJCR3x0rNEDhP50IL7Vl8=;
 b=VE81dJ/P64iTQEUHm2gLyx4lH7STsy7BgMCUzSnwJrOcY1bk8IgVlurAa39UQix6X/
 WysErP7dC1qrNeGjccJWBGJPOHYobkz3sOCrQBkNCB8xZfIT+TlsNh2h1nj2vxVvvbCM
 W5B8aeTaN9P6y3TjDVlDZwp6p0lqvOIr1O4shB+OQLtcd/ak4HGyytj6F3Cq2WU6VTFj
 2GSVuuinMiHgEEwjFQU18m8JOz0F0R++o4qZeMDe6CWoTkwFX7S92G/ujY6NVvy8pQu/
 +pLSNubAe8lQImBkBT+zCizAOWfd9P6SRSBwY8jdiio0uO1eXpga/B66h9I8nefMm2mX
 38uw==
X-Gm-Message-State: AOAM532zYtfjvVx90RLMUHiDpIvmMosmcWPunjgcRnuojIEqQX5GUTqd
 XDyuroIuYDXfYPKR6oEW6gciJw==
X-Google-Smtp-Source: ABdhPJzMg5oMY8Zfgs2oB25hsfOm1RiIaTpXqQnWSofZjbd566DMctMsOl5uQFGA5TH2WUjZwfwjUA==
X-Received: by 2002:a7b:cb01:: with SMTP id u1mr4778083wmj.188.1623932202149; 
 Thu, 17 Jun 2021 05:16:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 15/44] target/arm: Implement MVE VMAX, VMIN
Date: Thu, 17 Jun 2021 13:15:59 +0100
Message-Id: <20210617121628.20116-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Implement the MVE VMAX and VMIN insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 14 ++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 37 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 0e496971f02..5181d3b9413 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -95,3 +95,17 @@ DEF_HELPER_FLAGS_4(mve_vrmulhsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrmulhub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrmulhuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vrmulhuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmaxsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vminsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 4ab6c9dba90..42d5504500c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -88,6 +88,11 @@ VMULH_U          111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 VRMULH_S         111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 VRMULH_U         111 1 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 
+VMAX_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
+VMAX_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
+VMIN_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
+VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 1f606e0ae70..888d74d5b1c 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -358,6 +358,12 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
     DO_2OP(OP##h, 2, uint16_t, FN)              \
     DO_2OP(OP##w, 4, uint32_t, FN)
 
+/* provide signed 2-op helpers for all sizes */
+#define DO_2OP_S(OP, FN)                        \
+    DO_2OP(OP##b, 1, int8_t, FN)                \
+    DO_2OP(OP##h, 2, int16_t, FN)               \
+    DO_2OP(OP##w, 4, int32_t, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -425,3 +431,11 @@ DO_2OP(vrmulhsw, 4, int32_t, do_rmulh_w)
 DO_2OP(vrmulhub, 1, uint8_t, do_rmulh_b)
 DO_2OP(vrmulhuh, 2, uint16_t, do_rmulh_h)
 DO_2OP(vrmulhuw, 4, uint32_t, do_rmulh_w)
+
+#define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
+#define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))
+
+DO_2OP_S(vmaxs, DO_MAX)
+DO_2OP_U(vmaxu, DO_MAX)
+DO_2OP_S(vmins, DO_MIN)
+DO_2OP_U(vminu, DO_MIN)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bc66058fd38..107c393a997 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -351,3 +351,7 @@ DO_2OP(VMULH_S, vmulhs)
 DO_2OP(VMULH_U, vmulhu)
 DO_2OP(VRMULH_S, vrmulhs)
 DO_2OP(VRMULH_U, vrmulhu)
+DO_2OP(VMAX_S, vmaxs)
+DO_2OP(VMAX_U, vmaxu)
+DO_2OP(VMIN_S, vmins)
+DO_2OP(VMIN_U, vminu)
-- 
2.20.1


