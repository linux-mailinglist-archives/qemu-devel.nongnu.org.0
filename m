Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826F039E555
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:26:03 +0200 (CEST)
Received: from localhost ([::1]:52676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJ0k-0005c9-22
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIam-0007eB-8Q
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaN-0007zc-O6
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:12 -0400
Received: by mail-wr1-x435.google.com with SMTP id q5so18457231wrm.1
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lmitx3Cr0jgwChXHcEsjI6tKva1OYZOq2ukb+k0uZ1A=;
 b=O/U0EZM7TpiX0bCY+g2CUvmd1NQWPFhTAdTTJ84lU5Tf+IHNcFICtn0MPI5AMoy4As
 FHYl2gQ+sbunN4+Z/KrLuxp5uswpDmMSZVJBjU05q2rafdqrlnIwTGXjcVLr5N8nCHYr
 jGzKM4xoITtNQycoJugvGmgzwNZhWeDBDNxyDmD8KPIqFTjWNRgzSAzbUxqsGScclDYY
 BrPxPSheXRqXUlTrdpZ0iLMrvVNzBHjXBogN/zM+E9b8U5+JBGtSmfai4WMPxbhzBFqO
 dQ5qNNBIO3G908F5R4UP2d8dFIHq25E2CjeIcBRf4fjOPZTKScHVkE8JDchUNmPlRgfK
 btww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lmitx3Cr0jgwChXHcEsjI6tKva1OYZOq2ukb+k0uZ1A=;
 b=ie5hvTviO8MyqD0fNcFXNVLD0wmyLNcVwpFvz98y99IuNK7dzoeMg8VoKmULDxXTuF
 tJteyNEGRmq9itru96Hd/ZLyj4czqggYE3ryDdZs0cc8ockQbuniTe8Q64z+6CJ5Gpkz
 ke2exh0mAoClv9re2mKB4hxUwCLJVfI4J87fjnkh4THgvZoie/7n2xe1cFuOh9XEyYyo
 YB1koVsKRDy7lR8FMjuoj+7DblTM5/DdBv2uk9zOdVBrv8R/AZ35JXZuzUjJatJhC0Mw
 8Ja9qUhutZYdeVcQwXgRP8sMIdOnv5GXyXW1X9sfBvpyeISvZds9u1BjHgnXN6262B4r
 SpOg==
X-Gm-Message-State: AOAM530lWYrAkWCaAepydcNajuWzR9YbgH0f3+/SB+Li5onG1YXVWlXB
 EA8Bdb6qdDlO30RNgzLqNAzfwV7GGpE7Q22S
X-Google-Smtp-Source: ABdhPJw6A//oogvrern6k5lzoTzLx7fMRxyvc0A+WnKxoorLfUsDQEMCheOGVkLm4dkSPwldSXqnPg==
X-Received: by 2002:a5d:6382:: with SMTP id p2mr18888638wru.338.1623085123788; 
 Mon, 07 Jun 2021 09:58:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 25/55] target/arm: Implement MVE VMAX, VMIN
Date: Mon,  7 Jun 2021 17:57:51 +0100
Message-Id: <20210607165821.9892-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Implement the MVE VMAX and VMIN insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 14 ++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 37 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 38d084429b8..bc9dcde5dba 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -97,3 +97,17 @@ DEF_HELPER_FLAGS_4(mve_vrmulhsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
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
index 20d96b86f5a..f53551c7de5 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -329,6 +329,12 @@ DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)
     DO_2OP(OP##h, 2, uint16_t, H2, FN)          \
     DO_2OP(OP##w, 4, uint32_t, H4, FN)
 
+/* provide signed 2-op helpers for all sizes */
+#define DO_2OP_S(OP, FN)                        \
+    DO_2OP(OP##b, 1, int8_t, H1, FN)            \
+    DO_2OP(OP##h, 2, int16_t, H2, FN)           \
+    DO_2OP(OP##w, 4, int32_t, H4, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -396,3 +402,11 @@ DO_2OP(vrmulhsw, 4, int32_t, H4, do_rmulh_w)
 DO_2OP(vrmulhub, 1, uint8_t, H1, do_rmulh_b)
 DO_2OP(vrmulhuh, 2, uint16_t, H2, do_rmulh_h)
 DO_2OP(vrmulhuw, 4, uint32_t, H4, do_rmulh_w)
+
+#define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
+#define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))
+
+DO_2OP_S(vmaxs, DO_MAX)
+DO_2OP_U(vmaxu, DO_MAX)
+DO_2OP_S(vmins, DO_MIN)
+DO_2OP_U(vminu, DO_MIN)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 7e9d852c6ff..c12b0174b82 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -383,3 +383,7 @@ DO_2OP(VMULH_S, vmulhs)
 DO_2OP(VMULH_U, vmulhu)
 DO_2OP(VRMULH_S, vrmulhs)
 DO_2OP(VRMULH_U, vrmulhu)
+DO_2OP(VMAX_S, vmaxs)
+DO_2OP(VMAX_U, vmaxu)
+DO_2OP(VMIN_S, vmins)
+DO_2OP(VMIN_U, vminu)
-- 
2.20.1


