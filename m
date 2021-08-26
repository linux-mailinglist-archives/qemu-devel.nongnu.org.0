Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F43F892C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:40:09 +0200 (CEST)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFc0-0005uT-Fw
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGN-0005qU-JD
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGI-00055e-0p
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:47 -0400
Received: by mail-wr1-x435.google.com with SMTP id z4so5022038wrr.6
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bkuWlzNSI2yuRBQTkDjmPVrmm9Ffu+LTHOZ/atHURyg=;
 b=QSyyflhOUYN+l/ld38/IqEv7jqYjFUWX2aeYLRBAtZ2fB3xY5sBO5lRo7l6AK7rp9/
 q3T3E7JZlkm4GJH8piQy7INyod3dxfSt7cB057PTFOF16Ku6Sq+cXaRahFlrm55TcJa4
 nnJt7y6PesfZDyKDCa9ccy5yl3qUpOxYWW52N0G9+PVdgbWH8Orhy8Kk5Xnu8e8p7SCJ
 4BQ1q2etgIDpxAziEWYOn+t6Uq/E9ZoISjL0o047piny3lzvyOMzvaLJv8q/7N5HVo1i
 j70hKlaEfEUo4Ve/WPCdMCsnp8+4LSrNENFeyb9z8igAPyx3L6OMo5OqvIRE6JCGJluo
 sv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bkuWlzNSI2yuRBQTkDjmPVrmm9Ffu+LTHOZ/atHURyg=;
 b=Pb389gzPlxmiQUnRtFH9IoP8reL7BDbYXZz8DLm5EZNidFq0+IWAQ8AVQWdJP2K1+q
 v7YPEFRZIkZ7GL8+z5X1sc7ZoXHH2UCYOeQNxeLBhB9K5fJDCiBWRpBZmGlPuUWguadl
 zfkJKWLC2DoNhxn+h0g3BlNJFAyVNuMjHTZdV/BXhDZCqi9WchitoEG1ycfvFsmrLWUj
 pJwzxLHrdC5z0r/sSqR+6JaVvWKaQw4cjWPnwzRbaHPvOP9WH+Wqz395eX0V+LtY9OWQ
 SCbTjLjMvrgkyc9DZdSqTdb6Gqwxme9yGxXfMDaS65usgKzuvtnBChZ4lt4SNK/lt2Y1
 htBQ==
X-Gm-Message-State: AOAM531y+kHXRFkY9U3I3hu936W9B5bJzI3UvsbBXNrk/bRW9ahvOAS7
 08Oxy6jET10IbjaLrnbzUdnflnb7Q00mjA==
X-Google-Smtp-Source: ABdhPJwGclcnnYQe98kFhn9W6rgrqKs3LCeWEnos6SE3xeoPNfGSAw2DkU8h1azMZQCTpl6FN3wHaw==
X-Received: by 2002:a5d:51ca:: with SMTP id n10mr3876460wrv.119.1629983859042; 
 Thu, 26 Aug 2021 06:17:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/18] target/arm: Implement MVE VCVT between fp and integer
Date: Thu, 26 Aug 2021 14:17:21 +0100
Message-Id: <20210826131725.22449-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
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
index d9fcc42d36d..9a40ff9f43c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -790,3 +790,10 @@ VCVT_UF_fixed     1111 1111 1 . ...... ... 0 11 . 0 01 . 1 ... 0 @vcvt
 
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


