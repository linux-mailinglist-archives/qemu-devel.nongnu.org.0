Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9B43DA27D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:50:11 +0200 (CEST)
Received: from localhost ([::1]:60914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94YE-0000yR-IL
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941Q-0001Ic-J6
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:18 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940y-0001MH-0N
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g15so6471885wrd.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6J2yRvpWpl1slGdw4MbxdAJXhdOLJlQJMTOp4A5Pkfs=;
 b=rv6Nd7FyvALRAt59lanXYsGkbfjHOj+ACORwh+snq5LUFG0YPWj9x3JIWnr/H8F9Rc
 +sSlhbZUnbXdaN57zsSqPin5HKxKaCgMdezAw2vGPw5F3Q/xbVXpkRoMb8SdkN8Z4INT
 wTC/Az4Xma+LeUM/2c1TIRnv3huniBXIMMulxDxl8b8Xs3DV7gPSZKYMRCYgKM4neYM8
 lwP9yRTr0l8RfuwarHoUyD2x3qPtAk02i+NO+L2NRr4Qxx7krNL+zg3FJTSYpaBHErjL
 vUTjNg/MQDPJ4+jkEldA2T2xjbnxCFOxRnYyceHfqI3vhM1h3b5wIBtV7oDcIvtjOgr7
 wbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6J2yRvpWpl1slGdw4MbxdAJXhdOLJlQJMTOp4A5Pkfs=;
 b=TyODN8P0ynsnoJ3SLADSwa0ijq4Y2kaZgdPTF4Zxka2wnCelGsROPEePuDgVKMVUFg
 4TC2EQDbga2EJ0hh3rsxGIcDYRDKE9VceLFnU0tIhF2b0iyeTzvp+sJ0NCtHvt1OU1hh
 mLA5oLV0xV+tlNjI5rErU2dhcuwbDThWfMROhLqArvucw1hbCAfBCI4dB4O8LdmtRjw/
 ivHsX7Jc2NC4OrcdNa9Wcwxqq0G3psZGqEpeV5PRK+hOFVJ3xDRvCJ2XijV2bpbQElc7
 4EOxICNw1NnCEATKaZUc5w9Z4v7Q7oRMcw0LJ+k235NyHUrR3nwcvk80bSH5eWdskp55
 lurQ==
X-Gm-Message-State: AOAM532oJgeLgALLPVqAfqdhONVh9y4w/LdpAVeV1p2yAYOm/QXeDVrP
 Gdqur8msXc8aFiXcxhtWkr9OQ/nls8VoTw==
X-Google-Smtp-Source: ABdhPJzz7JsfQWSxN9+QKw7T1Z6X/OY5V5ixGWvk9gqJWLs0HQbjr/aqzBiPYHLfiNgqeTtDS/bb7w==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr4365724wrr.92.1627557345950; 
 Thu, 29 Jul 2021 04:15:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 37/53] target/arm: Implement MVE VSUB, VMUL, VABD,
 VMAXNM, VMINNM
Date: Thu, 29 Jul 2021 12:14:56 +0100
Message-Id: <20210729111512.16541-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Implement more simple 2-operand floating point MVE insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 15 +++++++++++++++
 target/arm/mve.decode      |  6 ++++++
 target/arm/mve_helper.c    | 24 ++++++++++++++++++++++++
 target/arm/translate-mve.c |  5 +++++
 4 files changed, 50 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 32fd2e1f9be..370876d7934 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -413,6 +413,21 @@ DEF_HELPER_FLAGS_4(mve_vhcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfadds, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vfsubh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfsubs, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfmulh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfmuls, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfabdh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfabds, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmaxnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vminnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e211cb016c6..cdbfaa4245b 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -625,3 +625,9 @@ VCMPLE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 1 0 .... @vcmp_scalar
 
 # 2-operand FP
 VADD_fp           1110 1111 0 . 0 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+VSUB_fp           1110 1111 0 . 1 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+VMUL_fp           1111 1111 0 . 0 . ... 0 ... 0 1101 . 1 . 1 ... 0 @2op_fp
+VABD_fp           1111 1111 0 . 1 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+
+VMAXNM            1111 1111 0 . 0 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
+VMINNM            1111 1111 0 . 1 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index ff087e9d3a4..e0e3e30de68 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2835,3 +2835,27 @@ DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
 
 DO_2OP_FP(vfaddh, 2, uint16_t, float16_add)
 DO_2OP_FP(vfadds, 4, uint32_t, float32_add)
+
+DO_2OP_FP(vfsubh, 2, uint16_t, float16_sub)
+DO_2OP_FP(vfsubs, 4, uint32_t, float32_sub)
+
+DO_2OP_FP(vfmulh, 2, uint16_t, float16_mul)
+DO_2OP_FP(vfmuls, 4, uint32_t, float32_mul)
+
+static inline float16 float16_abd(float16 a, float16 b, float_status *s)
+{
+    return float16_abs(float16_sub(a, b, s));
+}
+
+static inline float32 float32_abd(float32 a, float32 b, float_status *s)
+{
+    return float32_abs(float32_sub(a, b, s));
+}
+
+DO_2OP_FP(vfabdh, 2, uint16_t, float16_abd)
+DO_2OP_FP(vfabds, 4, uint32_t, float32_abd)
+
+DO_2OP_FP(vmaxnmh, 2, uint16_t, float16_maxnum)
+DO_2OP_FP(vmaxnms, 4, uint32_t, float32_maxnum)
+DO_2OP_FP(vminnmh, 2, uint16_t, float16_minnum)
+DO_2OP_FP(vminnms, 4, uint32_t, float32_minnum)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d2c40ede564..98282335820 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -847,6 +847,11 @@ static bool trans_VSBCI(DisasContext *s, arg_2op *a)
     }
 
 DO_2OP_FP(VADD_fp, vfadd)
+DO_2OP_FP(VSUB_fp, vfsub)
+DO_2OP_FP(VMUL_fp, vfmul)
+DO_2OP_FP(VABD_fp, vfabd)
+DO_2OP_FP(VMAXNM, vmaxnm)
+DO_2OP_FP(VMINNM, vminnm)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


