Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6D23AB381
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:26:04 +0200 (CEST)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltr5v-0000rq-6e
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwt-0001Dm-MQ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:43 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwo-0006wq-1u
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:43 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v9so6546052wrx.6
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSmUdgTY3vNX2ok8QM61elDamksiAlZsPWNetuCUjfg=;
 b=H/RZRha8MmQ9zDLdpRiD8nrkcZaWNF7u8DcsEDXUbrWs524eAlZdm8Aw0zBcH6r4VJ
 Ttjzyk85IHf0Mp+N583S6o4kkQKLsdS6/67sJ3mUZ8IruzsQbhsA5Kq00OKHOuZtttq5
 DVNqjAVj0dI9KJ8N+dUK9WeBPVD2RmzloNcEHPIe2BtgsuTV+pmu2RptJ9Ynx39pQDoF
 Xdx37v/+8LQb0dUalkhpY9X96xFAUHCiQCX/inwELS34dMgGxfdMVkR5QeGj/2f6LuBF
 +WYsE7HBFQD1WNe3ZEJ/A3XSQOUcubHOhIIMHvQkx66VqO8BT7ybtoV0fg0Zn9dRvUnw
 ho1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSmUdgTY3vNX2ok8QM61elDamksiAlZsPWNetuCUjfg=;
 b=T/U2Y9A55N3Tm7Hz+nJRKaG8mWo0xEhSfZ3PA6Zgsaa31q18gGwMI5fhnouiHdrCYT
 4O7f/2/c/eGaM9weNETajnAzY/+KMkzWPJyi4nePQnoBbQmjZM+1aWAiL55AeqeKtT/G
 59OkmfBLjmc4leJ6IdiVpTUi3utfgsE8OxQHExDRcGcSZVSQrW8VOp3EzEJDHGWl7FNt
 VQKb3KJeaw2hyHVcBruQH6GGJScB8m4KLg9DchU/u4TWchIIRLQV11bgo2mWDMFO1oIh
 CVJHwUNj7UGNIhSQRMszpnrx5wq9RpJ75TUCace2bzhbBNh/5nslkt2AM6sGeWKv7rIh
 VX2w==
X-Gm-Message-State: AOAM532pvPROVq1/caixA17z1K/Pt8HS/uo/PFqUOTdZRy/YlJUrYd5e
 E0pLmxkmXpi8KKLq82K+RxpW1w==
X-Google-Smtp-Source: ABdhPJze0PcKdSTdzaX5yU12k9OR42Vc11xsKr6n9YPRJ/NTROEeRhU7nboexzhCTgvSPN861DwoJA==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr5300767wrr.358.1623932196769; 
 Thu, 17 Jun 2021 05:16:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 08/44] target/arm: Implement MVE VNEG
Date: Thu, 17 Jun 2021 13:15:52 +0100
Message-Id: <20210617121628.20116-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Implement the MVE VNEG insn (both integer and floating point forms).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  2 ++
 target/arm/mve_helper.c    | 12 ++++++++++++
 target/arm/translate-mve.c | 15 +++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 76508d5dd71..733a54d2e3c 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -55,3 +55,9 @@ DEF_HELPER_FLAGS_3(mve_vabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vabsw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfabsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfabss, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vnegb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vfnegs, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 66963dc1847..82cc0abcb82 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -80,3 +80,5 @@ VMVN             1111 1111 1 . 11 00 00 ... 0 0101 11 . 0 ... 0 @1op_nosz
 
 VABS             1111 1111 1 . 11 .. 01 ... 0 0011 01 . 0 ... 0 @1op
 VABS_fp          1111 1111 1 . 11 .. 01 ... 0 0111 01 . 0 ... 0 @1op
+VNEG             1111 1111 1 . 11 .. 01 ... 0 0011 11 . 0 ... 0 @1op
+VNEG_fp          1111 1111 1 . 11 .. 01 ... 0 0111 11 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index eaf750ead0b..7ba6a8a2d9e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -309,3 +309,15 @@ DO_1OP(vabsw, 4, int32_t, DO_ABS)
 /* We can do these 64 bits at a time */
 DO_1OP(vfabsh, 8, uint64_t, DO_FABSH)
 DO_1OP(vfabss, 8, uint64_t, DO_FABSS)
+
+#define DO_NEG(N)    (-(N))
+#define DO_FNEGH(N) ((N) ^ dup_const(MO_16, 0x8000))
+#define DO_FNEGS(N) ((N) ^ dup_const(MO_32, 0x80000000))
+
+DO_1OP(vnegb, 1, int8_t, DO_NEG)
+DO_1OP(vnegh, 2, int16_t, DO_NEG)
+DO_1OP(vnegw, 4, int32_t, DO_NEG)
+
+/* We can do these 64 bits at a time */
+DO_1OP(vfnegh, 8, uint64_t, DO_FNEGH)
+DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 90996813a85..ad2e4af2844 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -200,6 +200,7 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
 DO_1OP(VABS, vabs)
+DO_1OP(VNEG, vneg)
 
 static bool trans_VREV16(DisasContext *s, arg_1op *a)
 {
@@ -252,3 +253,17 @@ static bool trans_VABS_fp(DisasContext *s, arg_1op *a)
     }
     return do_1op(s, a, fns[a->size]);
 }
+
+static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vfnegh,
+        gen_helper_mve_vfnegs,
+        NULL,
+    };
+    if (!dc_isar_feature(aa32_mve_fp, s)) {
+        return false;
+    }
+    return do_1op(s, a, fns[a->size]);
+}
-- 
2.20.1


