Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687A539E5D8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:46:56 +0200 (CEST)
Received: from localhost ([::1]:50686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJKx-00027n-EX
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIbT-0000Vj-1C
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:57 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIag-00088S-Th
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso103391wmh.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZpgHoqnBmOkzqr58mneEyeBuRbOpEZqrC/tcPvjTIAc=;
 b=zaDcXdZYuPaLxXrc8+yy6DvgriO/W8e23iDmNoDp5l+ibmuEO+LdFl5wweyaXLk/JT
 U2TixxRJCVoCI98o3w8eIzK7peftEUroOB/+666N/pMnJZ+ASEMSLWTRZ9suAfV5643G
 FyW6ft9UMDSrFRPwXvFOTJBeTewtCc0QgRZSS28aikJ20hQpw/V67JO4uISBl6Gm0xCv
 ZtljD3faPR3XNdVH52G31GfxGNByna7SymPm52LxnJWvadbeQJix5tmgtkfDM6H+RXa9
 SkH1jmAbmEFOE0eCWkblCzjlDtvBWw6ItCxtypLj3knb7wRR3PckJa/A3NE0sMmJpCng
 EPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZpgHoqnBmOkzqr58mneEyeBuRbOpEZqrC/tcPvjTIAc=;
 b=C4u5HDHBavhJG9FPI5g5lM6AF9oakndCeNZ29k9NHjLJk//lS3371Nal3MtnNNVndW
 kl+2k0X2Z4XTOaCtmTMSXKoaPgN6i+VNdKQfRcGA0uvLwlrh/SNKO4PIXNUv4syIL/1x
 Hzv7S/AxuIG5R0H7k1vt7Lsl+pFnJnxpUVaaFcwKeIhMP5pqcR6iU5TnFtwVx7QmVOwF
 fc3atrmQUTNQ0CmtOHwYUeiFCpuKOYbyfzst0c1poUol/rC/A2ajoTTaKxpE2gWcrXdO
 KHtBdVdeXPKxghanSowOGmIWmIJzOMWJJW0o0LOOGVJYy4g7xJqFcxQAW0p8BNzETrkF
 2Irg==
X-Gm-Message-State: AOAM531QNvqbNhTIoFTb0h0JHVAsRkRK0tt7l4NMHZUG2SpoOkd5YP2+
 WEGRAmnBKjqojDRp/3bBYw6lEQ==
X-Google-Smtp-Source: ABdhPJyDQKqx0vdVxxzh/c5jU1Ic8/n2+CUXS1zHJO9bu67D5d2nW80H6H+QKUtQN9otIS0SYL0Eng==
X-Received: by 2002:a1c:ed10:: with SMTP id l16mr103897wmh.8.1623085145328;
 Mon, 07 Jun 2021 09:59:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:59:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 53/55] target/arm: Implement MVE VHCADD
Date: Mon,  7 Jun 2021 17:58:19 +0100
Message-Id: <20210607165821.9892-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
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
 target/arm/mve.decode      | 6 +++++-
 target/arm/mve_helper.c    | 5 +++++
 target/arm/translate-mve.c | 4 +++-
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 6e345470cbb..3f056e67871 100644
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
index c0979f3941b..23ae12b7a38 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -163,7 +163,11 @@ VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
 VRHADD_S         111 0 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 VRHADD_U         111 1 1111 0 . .. ... 0 ... 0 0001 . 1 . 0 ... 0 @2op
 
-VADC             1110 1110 0 . 11 ... 0 ... . 1111 . 0 . 0 ... 0 @vadc
+{
+  VHCADD90       1110 1110 0 . .. ... 0 ... 0 1111 . 0 . 0 ... 0 @2op
+  VHCADD270      1110 1110 0 . .. ... 0 ... 1 1111 . 0 . 0 ... 0 @2op
+  VADC           1110 1110 0 . 11 ... 0 ... . 1111 . 0 . 0 ... 0 @vadc
+}
 
 {
   VCADD90        1111 1110 0 . .. ... 0 ... 0 1111 . 0 . 0 ... 0 @2op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 2c8ef25b208..3477d2bb191 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -638,8 +638,13 @@ DO_VADC(vsbc, DO_NOT)
     DO_VCADD(OP##h, 2, int16_t, H1, FN0, FN1)   \
     DO_VCADD(OP##w, 4, int32_t, H1, FN0, FN1)
 
+#define DO_HADD(N, M) (((int64_t)(N) + (int64_t)(M)) >> 1)
+#define DO_HSUB(N, M) (((int64_t)(N) - (int64_t)(M)) >> 1)
+
 DO_VCADD_ALL(vcadd90, DO_SUB, DO_ADD)
 DO_VCADD_ALL(vcadd270, DO_ADD, DO_SUB)
+DO_VCADD_ALL(vhcadd90, DO_HSUB, DO_HADD)
+DO_VCADD_ALL(vhcadd270, DO_HADD, DO_HSUB)
 
 static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 8e3989b0176..b2020bd90b1 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -443,10 +443,12 @@ DO_2OP(VRHADD_U, vrhaddu)
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


