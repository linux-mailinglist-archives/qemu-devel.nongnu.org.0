Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6513906FF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:58:08 +0200 (CEST)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaNc-00058a-0W
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYf0-000363-VQ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:59 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYev-00078S-DO
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:58 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so10390871wmq.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OS7n33AyuPBpxxLE3lSA4OnD55V/rnoi2yRanpBcCTc=;
 b=ELTiAAJG5Q9ytvKEYq6+aYKb1QIERrwArRSw5L1frXXzvLIx3lBF1A1LngXF7g04VZ
 ZAQuXbAiGSdKpX8fRrN58hPfLR0yKgtRrHULY7kr4hZJPgEcerZ5Lzp1mzEEnN2mS0xW
 6aXFSr21xeI/1ONOS2/7efFi8T771j6SmWqjh8v+Tc8ZjeUV+zqA/lGPvyMFTNoFNeMo
 v/9UQOkLDNAxd6w3LjGKdZBju91Iza8gXCFMeqkfRAIfS6G1EK7luf15Wkkq9OWpKUxU
 dWSCE54I+ndGntb8PsnC4mZe2buxTT61KgWFttsaGwyEuG+zIaFB4EXLkzrBR0pU2gsH
 Cj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OS7n33AyuPBpxxLE3lSA4OnD55V/rnoi2yRanpBcCTc=;
 b=J1hPI3bNrsAudckq0mesE2bGi/1l6R8wE///DyasyYhfzBF+GfTc7rThmyMepU3ntO
 hiT1VL0l7WdN4haJnnA1pQN7j2BlTGa0bceMAP37ZrnuS/KPU+WDLzDxGWpKuroU4eHk
 f7l75DaHgQAh1+Plf0358BQyTiTZtb6vPFn69xSLBXXVwkXN00nA1a+lGU/T5culzwfl
 e+6j/PYSqg81TgKXlsKbePScVOfThWTHXHvlIdOkiKjs76qINc9XDdr3pfxcsJ9q0wqk
 nyqjgiVjD66Y6KA9MmxAeswSW0/ZkYzc6DDBEdV56og0deiZ1JJhwLXgi++azADs8Zuh
 xvpw==
X-Gm-Message-State: AOAM532OSBw4e702sXS1Gi11Bp9EciVjx0STlx2qaIpHeF7QHIeWNrSb
 pWzKfa/7k95CTa667jtavdUwxBkt+twMiDEb
X-Google-Smtp-Source: ABdhPJy/Qd3gRIFjT+QDxNImpSP2dtze8u2Bu35jv/RX5Tlte0WUDb+a+ZS7zFQ9airw+eSmCEyuWQ==
X-Received: by 2002:a1c:4e0b:: with SMTP id g11mr24307609wmh.3.1621955271921; 
 Tue, 25 May 2021 08:07:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 110/114] target/arm: Split decode of VSDOT and VUDOT
Date: Tue, 25 May 2021 16:07:32 +0100
Message-Id: <20210525150736.32695-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

Now that we have a common helper, sharing decode does not
save much.  Also, this will solve an upcoming naming problem.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-89-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-shared.decode |  9 ++++++---
 target/arm/translate-neon.c   | 30 ++++++++++++++++++++++--------
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index facb621450d..2d94369750d 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -46,8 +46,9 @@ VCMLA          1111 110 rot:2 . 1 . .... .... 1000 . q:1 . 0 .... \
 VCADD          1111 110 rot:1 1 . 0 . .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=%vcadd_size
 
-# VUDOT and VSDOT
-VDOT           1111 110 00 . 10 .... .... 1101 . q:1 . u:1 .... \
+VSDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VUDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 # VFM[AS]L
@@ -61,7 +62,9 @@ VCMLA_scalar   1111 1110 0 . rot:2 .... .... 1000 . q:1 index:1 0 vm:4 \
 VCMLA_scalar   1111 1110 1 . rot:2 .... .... 1000 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp size=2 index=0
 
-VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
+VSDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 0 vm:4 \
+               vn=%vn_dp vd=%vd_dp
+VUDOT_scalar   1111 1110 0 . 10 .... .... 1101 . q:1 index:1 1 vm:4 \
                vn=%vn_dp vd=%vd_dp
 
 %vfml_scalar_q0_rm 0:3 5:1
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index dfa33912ab1..386b42fe4b0 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -269,15 +269,22 @@ static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
     return true;
 }
 
-static bool trans_VDOT(DisasContext *s, arg_VDOT *a)
+static bool trans_VSDOT(DisasContext *s, arg_VSDOT *a)
 {
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
     return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
-                        a->u
-                        ? gen_helper_gvec_udot_b
-                        : gen_helper_gvec_sdot_b);
+                        gen_helper_gvec_sdot_b);
+}
+
+static bool trans_VUDOT(DisasContext *s, arg_VUDOT *a)
+{
+    if (!dc_isar_feature(aa32_dp, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_udot_b);
 }
 
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
@@ -329,15 +336,22 @@ static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
                              FPST_STD, gen_helper_gvec_fcmlas_idx);
 }
 
-static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
+static bool trans_VSDOT_scalar(DisasContext *s, arg_VSDOT_scalar *a)
 {
     if (!dc_isar_feature(aa32_dp, s)) {
         return false;
     }
     return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
-                        a->u
-                        ? gen_helper_gvec_udot_idx_b
-                        : gen_helper_gvec_sdot_idx_b);
+                        gen_helper_gvec_sdot_idx_b);
+}
+
+static bool trans_VUDOT_scalar(DisasContext *s, arg_VUDOT_scalar *a)
+{
+    if (!dc_isar_feature(aa32_dp, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 6, a->vd, a->vn, a->vm, a->index,
+                        gen_helper_gvec_udot_idx_b);
 }
 
 static bool trans_VFML_scalar(DisasContext *s, arg_VFML_scalar *a)
-- 
2.20.1


