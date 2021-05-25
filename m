Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE29839071E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:07:10 +0200 (CEST)
Received: from localhost ([::1]:60502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaWM-0000Ti-0m
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYpM-0003Fg-VD
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:18:41 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYew-00079C-3Y
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:57 -0400
Received: by mail-wr1-x431.google.com with SMTP id d11so32604889wrw.8
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bJD5IRuXlMWhlUF7Qtds9d1Vx9ykPhb4ObGucBtCW54=;
 b=nxWu+3VooHHxIIAPYIDBFLy88B0V54g6zD4lMHnqCNZyDRt5hlnzNm91nGPm7PZW7o
 tPNbOFZc6e8OJ708vVEoWl0kuYbbG6Hmqzfm8vKuohTXwM7RqedB6dZC8mlFBhA6Fz7g
 HKm6fAFWvIjFVkKakd+WJ5TRIXJyPrQLJS1nkciirL9LbpbOh4DgnYysS++Gy0+ST8t+
 pFEweg4h1bS6QqtXBJtO4Tmf6eZ5NyqGrz8ARQSVumNikVeA4oPbPcTvFxwu8/GaHUs6
 JcDSvgIxA/yMncw9FgObBqJcVY7d7PhARqNx5ufdKCgWXx8gEBMmE7QmQy++Mdt7nuZs
 lmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bJD5IRuXlMWhlUF7Qtds9d1Vx9ykPhb4ObGucBtCW54=;
 b=onps1yJAs7VilNYTz5PQAtpn6pZdTS8UaeA0cI0s/iSlAdSCmF4njqpyMiVpRYQ38u
 68dEuZRjk1TZEH8fPiqtQqQnXSuwwsp77XrgQ3SnM2QTdqewau036BZ6n6DBnA+766Gg
 EMD66F1GsgkulmEyNxG/XGXHqwDvr0La8jSFqT37P/erCbeJZMZqff2OsZ4RlZJiLjT4
 Hq9rlBjKCVDxn24Vj4rv1DlOYdrMsmkAtKg+YFgd+A38HgZe9+DwtkKJFfitksdBA5Lz
 NPJzeLd6Y2lXvDIZd8YKMFyljQkARgEbSFErJQFLgXfJKb5X4353U48NXgGpq3i3m3kr
 N/lg==
X-Gm-Message-State: AOAM5321NTmZnJlVCBF9gg8xy3kasLW2HOhWFmnhxwGnBa2OXh9YfVuL
 WN1JCTwBF++Nbu2cJNlmVSRgobA9+0m9IxbK
X-Google-Smtp-Source: ABdhPJzt/6mW3bRG6rMqz4ySPR2m0H5F0J95LJybPGx/EM1ykUWK+eRrAG/ed8TT+sKmbgvymTyFnQ==
X-Received: by 2002:adf:a404:: with SMTP id d4mr12208926wra.373.1621955272708; 
 Tue, 25 May 2021 08:07:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 111/114] target/arm: Implement aarch32 VSUDOT, VUSDOT
Date: Tue, 25 May 2021 16:07:33 +0100
Message-Id: <20210525150736.32695-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-90-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h              |  5 +++++
 target/arm/neon-shared.decode |  6 ++++++
 target/arm/translate-neon.c   | 27 +++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8ecb2a1c89e..04f8be35bf0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3783,6 +3783,11 @@ static inline bool isar_feature_aa32_predinv(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, SPECRES) != 0;
 }
 
+static inline bool isar_feature_aa32_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_isar6, ID_ISAR6, I8MM) != 0;
+}
+
 static inline bool isar_feature_aa32_ras(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_pfr0, ID_PFR0, RAS) != 0;
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index 2d94369750d..5befaec87b1 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -50,6 +50,8 @@ VSDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 VUDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUSDOT         1111 110 01 . 10 .... .... 1101 . q:1 . 0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 # VFM[AS]L
 VFML           1111 110 0 s:1 . 10 .... .... 1000 . 0 . 1 .... \
@@ -66,6 +68,10 @@ VSDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 0 vm:4 \
                vn=%vn_dp vd=%vd_dp
 VUDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 1 vm:4 \
                vn=%vn_dp vd=%vd_dp
+VUSDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 0 vm:4 \
+               vn=%vn_dp vd=%vd_dp
+VSUDOT_scalar  1111 1110 1 . 00 .... .... 1101 . q:1 index:1 1 vm:4 \
+               vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
 %vfml_scalar_q1_index 5:1 3:1
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 386b42fe4b0..b6ca29c25ca 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -287,6 +287,15 @@ static bool trans_VUDOT(DisasContext *s, arg_VUDOT *a)
                         gen_helper_gvec_udot_b);
 }
 
+static bool trans_VUSDOT(DisasContext *s, arg_VUSDOT *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_usdot_b);
+}
+
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
 {
     int opr_sz;
@@ -354,6 +363,24 @@ static bool trans_VUDOT_scalar(DisasContext *s, arg_VUDOT_scalar *a)
                         gen_helper_gvec_udot_idx_b);
 }
 
+static bool trans_VUSDOT_scalar(DisasContext *s, arg_VUSDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_usdot_idx_b);
+}
+
+static bool trans_VSUDOT_scalar(DisasContext *s, arg_VSUDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_i8mm, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_sudot_idx_b);
+}
+
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
 {
     int opr_sz;
-- 
2.20.1


