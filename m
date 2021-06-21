Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F103AF10F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:55:12 +0200 (CEST)
Received: from localhost ([::1]:54530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNCZ-0007sF-VG
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnV-0007ed-AH
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:17 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnO-0007gP-8V
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:16 -0400
Received: by mail-wm1-x32c.google.com with SMTP id m3so10938871wms.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cWk3VqX05M0c8BcaRr16KKSG6LU8hBlcOqOvyPTuaWQ=;
 b=pVbHfibaUWCkSIX2BT6pKd5h72q5ydSyfcEc4bI98OBjprK7gjcNxOoM88Vh9TLjzW
 LIV6liVcKLCwZ+K00qAkU+3cXYP6D75r9nRQ27m/D0YPssmUvkCKbxxCIy6l11cwO/6Q
 /g8ruscDBQ0iNk0pddYJsVa1kUuup97GHi2YLoCui4DNUJDzt9RxooJMug/zMWXuQyb2
 4atnz8VqhdVMl2V2yhaB9hpavDSbRGCIbgSXnQ3TZ+aBfyGfYyOhP3oz6Q8CraY1cvxe
 kEoczXcPMPYgmxDUU1YcgrB+IYZ+SBQpzjstLqvo7GQm6BFUjHwfaHJ9DsMW1dl7Ha/8
 /GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cWk3VqX05M0c8BcaRr16KKSG6LU8hBlcOqOvyPTuaWQ=;
 b=bQ8BolwMY1qH106wONpvlhByVsnMsE5iA7/V8dKStN/Wm2aesIErBFVPzfbsvZtnpA
 Pecp1hLmJ9fE4HJBI3+Zp3qNfGIvHONEMyRS7P5nrkMSH5MCzywPyNy0KrXxc4GGkcEZ
 ew5CFv463ySuV/uYjYYRZfImIIIzq8SfnUz4hwpw4CtzSx2k8ztCtWdq5iJS5NH5TCVS
 1zvDRXrFchUnNl7ih9AyHgcEc+lBIVCcUwLwG5nD5TKDB7dpviA3/74QVgNVITtZGaQN
 F1xOue4aDNsr6D6k6sl0WHhIlCAa9mc143nKO8BSebmERaBU2ZW8cazXKu9d2acwXAd6
 rdGA==
X-Gm-Message-State: AOAM531w7C/3Eeu/7p8TsFCQJkqbkp/GCd83GjxL6IBehsPALeH/qrqx
 aZ3m5NL/+nFsZJFhDg+OYc/UzK/r2vzMLyPo
X-Google-Smtp-Source: ABdhPJyE/XiTg/HrVpEdHFbKYCJV3p64sA4NjJIq8mNow5B7GbWXTSCPVLkq6fISXlOEw3fjggdZsQ==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr28444085wmh.144.1624292949073; 
 Mon, 21 Jun 2021 09:29:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/57] target/arm: Implement MVE VBRSR
Date: Mon, 21 Jun 2021 17:28:12 +0100
Message-Id: <20210621162833.32535-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Implement the MVE VBRSR insn, which reverses a specified
number of bits in each element, setting the rest to zero.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-26-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  4 ++++
 target/arm/mve.decode      |  1 +
 target/arm/mve_helper.c    | 43 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  1 +
 4 files changed, 49 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 52086d769f4..1b807e1cf5f 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -173,6 +173,10 @@ DEF_HELPER_FLAGS_4(mve_vhsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vhsubu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vhsubu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vbrsrb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vbrsrh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vbrsrw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 5c332b04a7c..a3dbdb72a5c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -167,3 +167,4 @@ VHADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 096f7a39dac..558c6f5aa34 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -523,6 +523,49 @@ DO_2OP_SCALAR_U(vhaddu_scalar, do_vhadd_u)
 DO_2OP_SCALAR_S(vhsubs_scalar, do_vhsub_s)
 DO_2OP_SCALAR_U(vhsubu_scalar, do_vhsub_u)
 
+static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
+{
+    m &= 0xff;
+    if (m == 0) {
+        return 0;
+    }
+    n = revbit8(n);
+    if (m < 8) {
+        n >>= 8 - m;
+    }
+    return n;
+}
+
+static inline uint32_t do_vbrsrh(uint32_t n, uint32_t m)
+{
+    m &= 0xff;
+    if (m == 0) {
+        return 0;
+    }
+    n = revbit16(n);
+    if (m < 16) {
+        n >>= 16 - m;
+    }
+    return n;
+}
+
+static inline uint32_t do_vbrsrw(uint32_t n, uint32_t m)
+{
+    m &= 0xff;
+    if (m == 0) {
+        return 0;
+    }
+    n = revbit32(n);
+    if (m < 32) {
+        n >>= 32 - m;
+    }
+    return n;
+}
+
+DO_2OP_SCALAR(vbrsrb, 1, uint8_t, do_vbrsrb)
+DO_2OP_SCALAR(vbrsrh, 2, uint16_t, do_vbrsrh)
+DO_2OP_SCALAR(vbrsrw, 4, uint32_t, do_vbrsrw)
+
 /*
  * Multiply add long dual accumulate ops.
  */
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4b379bfe6e4..6320064a08d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -433,6 +433,7 @@ DO_2OP_SCALAR(VHADD_S_scalar, vhadds_scalar)
 DO_2OP_SCALAR(VHADD_U_scalar, vhaddu_scalar)
 DO_2OP_SCALAR(VHSUB_S_scalar, vhsubs_scalar)
 DO_2OP_SCALAR(VHSUB_U_scalar, vhsubu_scalar)
+DO_2OP_SCALAR(VBRSR, vbrsr)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
-- 
2.20.1


