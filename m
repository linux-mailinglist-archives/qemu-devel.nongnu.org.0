Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CA13FD846
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:58:29 +0200 (CEST)
Received: from localhost ([::1]:43108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNwq-0001zH-QD
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcK-00076Q-KD
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:17 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcE-0005l7-9S
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:16 -0400
Received: by mail-wr1-x429.google.com with SMTP id v10so3743108wrd.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wxV8ETbRwpnY1TML7JdJIQOdN91j+ccB0uTrt2mBY2U=;
 b=dBPdDr/VH7wiSEgnhzjU1nuWEGbndjqHS5QAyGumc2e7KplPVAR5l7PA5ffwHGMlMu
 SVDx6euOMjLqQiIcZAXydpL+b6j4vvQFkGIG/cuQYj4OA6jHPF+S0s07NlsHe/8B0ilf
 vrDRLVqMPIs6j0oZCn5ZkOJU+DfQooLVoDsFrA71rtLBE7Fh2x+r7qh+oDT3qkcfu7wp
 eiit3ZjArpyL815arlKSj77mfh6FR/f8eXuImI1tK2Fgjo+RVUoTHiPbz6ld8BPVSFbD
 +T63ajViLMayU/UrRuG+6365pWmTtL5N7VATxd8X+xlXVgig9lsU7ksoSBpS3zo9/mn0
 WAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wxV8ETbRwpnY1TML7JdJIQOdN91j+ccB0uTrt2mBY2U=;
 b=FssYrg3s/IFkN9N7lABwO72xPQ/FwcB0PzSgZsXyKCaiQaICBat0CwfCufxfZivxp3
 f3U3XI3K1pmnXAB9DhYHJPRZ14wJcLJDT96DnJaoZOxIxpfO/kI+pNLVBAFlxvSTWi4K
 l1ReGhP3Wmz2SxmjtK+jo1M9QfjPBkcSn7FLSAcn97DowjgkLAGej5Hvqxg0UpNog4pW
 ndekv/UVCW/7QFbE68kDzyhwM3BA9zmC01Js3yMuI0GTZp05rvKruor81wsxW6VX0rHG
 rk9E4+evtvg2d4PP5CmMb7Q4uQxLcU9lZf4cRnF2fl4Kje9TvlCmAcTWJdFgtAHe3uae
 /Nqg==
X-Gm-Message-State: AOAM532XaKSguWab8Ic0NuSr0s6CfM7fOvQy8tolwhcwWPVrdy1KE3ym
 aIkNMI77K97CwjhqEQSbi/1mGJ2L402Btg==
X-Google-Smtp-Source: ABdhPJwmVqR4vCrWLfORyVrkDf44YApfDay3IshDwyPmxeb+TC7bozJTnFwBpU4awOSL2Pg2TQJ66Q==
X-Received: by 2002:adf:914a:: with SMTP id j68mr34529868wrj.73.1630492628902; 
 Wed, 01 Sep 2021 03:37:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/51] target/arm: Implement MVE VCVT between fp and integer
Date: Wed,  1 Sep 2021 11:36:21 +0100
Message-Id: <20210901103653.13435-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Implement the MVE "VCVT (between floating-point and integer)" insn.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve.decode      |  7 +++++++
 target/arm/translate-mve.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index d93083065d6..89b8c6fc8e6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -798,3 +798,10 @@ VCVT_UF_fixed     1111 1111 1 . ...... ... 0 11 . 0 01 . 1 ... 0 @vcvt
 
 VCVT_FS_fixed     1110 1111 1 . ...... ... 0 11 . 1 01 . 1 ... 0 @vcvt
 VCVT_FU_fixed     1111 1111 1 . ...... ... 0 11 . 1 01 . 1 ... 0 @vcvt
+
+# VCVT between floating point and integer (halfprec and single);
+# VCVT_<from><to>, S = signed int, U = unsigned int, F = float
+VCVT_SF           1111 1111 1 . 11 .. 11 ... 0 011 00 1 . 0 ... 0 @1op
+VCVT_UF           1111 1111 1 . 11 .. 11 ... 0 011 01 1 . 0 ... 0 @1op
+VCVT_FS           1111 1111 1 . 11 .. 11 ... 0 011 10 1 . 0 ... 0 @1op
+VCVT_FU           1111 1111 1 . 11 .. 11 ... 0 011 11 1 . 0 ... 0 @1op
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 9269dbc3324..351033af1ec 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -543,6 +543,38 @@ DO_1OP(VQNEG, vqneg)
 DO_1OP(VMAXA, vmaxa)
 DO_1OP(VMINA, vmina)
 
+/*
+ * For simple float/int conversions we use the fixed-point
+ * conversion helpers with a zero shift count
+ */
+#define DO_VCVT(INSN, HFN, SFN)                                         \
+    static void gen_##INSN##h(TCGv_ptr env, TCGv_ptr qd, TCGv_ptr qm)   \
+    {                                                                   \
+        gen_helper_mve_##HFN(env, qd, qm, tcg_constant_i32(0));         \
+    }                                                                   \
+    static void gen_##INSN##s(TCGv_ptr env, TCGv_ptr qd, TCGv_ptr qm)   \
+    {                                                                   \
+        gen_helper_mve_##SFN(env, qd, qm, tcg_constant_i32(0));         \
+    }                                                                   \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)               \
+    {                                                                   \
+        static MVEGenOneOpFn * const fns[] = {                          \
+            NULL,                                                       \
+            gen_##INSN##h,                                              \
+            gen_##INSN##s,                                              \
+            NULL,                                                       \
+        };                                                              \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                         \
+            return false;                                               \
+        }                                                               \
+        return do_1op(s, a, fns[a->size]);                              \
+    }
+
+DO_VCVT(VCVT_SF, vcvt_sh, vcvt_sf)
+DO_VCVT(VCVT_UF, vcvt_uh, vcvt_uf)
+DO_VCVT(VCVT_FS, vcvt_hs, vcvt_fs)
+DO_VCVT(VCVT_FU, vcvt_hu, vcvt_fu)
+
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
-- 
2.20.1


