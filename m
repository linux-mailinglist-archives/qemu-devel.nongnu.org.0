Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790433A6A23
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:27:28 +0200 (CEST)
Received: from localhost ([::1]:59794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoUp-0003H2-Da
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEa-00015W-E4
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:40 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEO-0000Kj-S2
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:10:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id c9so14928612wrt.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ThbTxy6l+8O2E/ok/WPfaMj55dvuTbSmLvJg3475QeM=;
 b=cvt+dIbSUZqYP2/vRfk2Z9FqlfC7tSXL81XmIUxGmXrKdCSZl5G7uOnENjJffhVj+n
 l7E4OWr6vxQLgYMkRceSX9SpCsfxRncM0cQimEPB81DV+Pe7WpDGVSHHfuHFKvVjKs2D
 ZaakmbSK1RUqQonGG7xUnMbGGOYCHvUTLtXzNSarJV1zwIYODPLoVUB2dx3MXQANyLl4
 VUgJCUiA47Lc/fz4Djm4VNvtWSZi0LzT2nchC3aBM4xdrvuWJhXj3RUrsIcflGfru1ZZ
 yiPl0MAODRqKpGpBve+J+41a8w++13kawefPsFd07jpcrAIBt/itg3e/1bCGGu2nafri
 RnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ThbTxy6l+8O2E/ok/WPfaMj55dvuTbSmLvJg3475QeM=;
 b=VHfZ2sdbUQYVZovGvE7lbeWzYCsSExznPPO4cF0gW34KD+te2v6423BeQi+anvWuFl
 0R9yTrxbWoU6V0+/X4WkwHOTp7kPQFxGR6ML4S9xvx0pShTwRGCyV5Pf89E32h3va+s5
 sjtp1zXvTEt6FcgvYdx1GX7n1LjnijqivOkz7s7jdH+mLgR1VCHWwzjlcKiXNO8nYDU2
 15zWobJvnVbx0ss5BG81UmVO/WlWuaca0A+KXrEEWROwlXPRB4HVoMR7502puq70aDLi
 jJO4hkf5HSbEkTFQtXrockOZq9TTwTWXoxY+gP3Bll2D74ZxgA5AsEAZ5EZEdowrEQ3f
 un5A==
X-Gm-Message-State: AOAM532Oc4z8EBUUAUWv8nDAEDOd1k9zd9EYObij2jX7psQCM9dxHCsA
 c1A0xFO1KNv9U7Pf93ch7w/VXQ==
X-Google-Smtp-Source: ABdhPJwvgxPUuotcT2pUEx2keTfDtDOyPOIeFqIXBlb5k0xWUi96ORV7cGEOmZiaUXDSRBExJrEyKw==
X-Received: by 2002:a5d:47a6:: with SMTP id 6mr19232527wrb.203.1623683427557; 
 Mon, 14 Jun 2021 08:10:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 20/57] target/arm: Implement MVE VNEG
Date: Mon, 14 Jun 2021 16:09:30 +0100
Message-Id: <20210614151007.4545-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
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
index 5f36f32a231..a5fd43f8180 100644
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


