Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D63C3906F7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:54:20 +0200 (CEST)
Received: from localhost ([::1]:46918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llaJq-000642-GT
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYez-0002uz-0U
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYer-00076S-G8
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so13029727wmh.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Db7iT5Za189vuM0MHh9i6yXTOf7AUqi/xtG/TFB50Ak=;
 b=VCXnCr5nTwSKudSIVt7/6CFch52oArfB48GLcSWPbNa0TEbHiQILW6MVK8xoWPpFSR
 mZZedp+ePHSj30OS4FQRiJOX0ZrHM+QoBP7DtM7DJ833ZNN7j6HB/BRjpTE1OU9SwZbH
 s7QBEejTBG61wAr5fYxZx3s3EyOpFiKLmfM/H3D/LCHw1X+FeHw39jjEKZrwloL9raEQ
 y5fsPotBoC+M+JrvDZ+PnFgwbE924BP6B1JcTFXyL63POjxo/UEVsqzoIByjM0S+Ykwb
 /livlEVIUR7d7zw59KVQS/y8fozxv0qSTby3CJTq65aEonMEo5SmJP+Bd3xmWjEgzFMM
 hVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Db7iT5Za189vuM0MHh9i6yXTOf7AUqi/xtG/TFB50Ak=;
 b=ceqJ4tIbklju8RiwVX8woN/UAbJMGv3o1M658MMY9IJaemvVQdfGXhcGMJqGLmgwMo
 iHe5T9cyI4qu8rIOyG5geMhdDdpoOAKwFXvenkR1CGHTyWulPKT4bMYUBXWoAgOdWsRN
 gVpQEgkscfP/8Ph5ZHhAj5TiR8sFXWitNSkKwf6tkGEUkT3fqHCIie5dYRrLAGvM/9LR
 SoabqZoZkEcizwkDM6Z/uuPZVNjApQQ4bb1jSQtMNej9rlmScjj14WLjIGeMrusPGZsl
 6Utkgo1yBfIWAbpsZcLlGueAWESDWH7C4CHRyskx+pgF0jpZlN24jli4OnjZ5GSF9oT7
 lwkw==
X-Gm-Message-State: AOAM531hQGWWOQToR0xeLHbUciG+onlgStztAIt7JbVzy3zQO4H0KMCi
 4rTQtfFpWV29BKMi4kDUodQSJaQ7MB51gTVZ
X-Google-Smtp-Source: ABdhPJyeU24Mokd+mjEnQtw6BmCaOY/BtwsFVJPvNoQHUUHn4Z9vgYsWb5+syoWhAZEpj5fohWW16Q==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr4288131wmf.91.1621955268115; 
 Tue, 25 May 2021 08:07:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a11sm16643357wrr.48.2021.05.25.08.07.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 105/114] target/arm: Implement aarch64 SUDOT, USDOT
Date: Tue, 25 May 2021 16:07:27 +0100
Message-Id: <20210525150736.32695-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150736.32695-1-peter.maydell@linaro.org>
References: <20210525150736.32695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Message-id: 20210525010358.152808-84-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/translate-a64.c | 25 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 55383cb0661..8ecb2a1c89e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4216,6 +4216,11 @@ static inline bool isar_feature_aa64_rcpc_8_4(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) >= 2;
 }
 
+static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
+}
+
 static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a8edd2d2815..c8754817842 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12175,6 +12175,13 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_dp, s);
         break;
+    case 0x03: /* USDOT */
+        if (size != MO_32) {
+            unallocated_encoding(s);
+            return;
+        }
+        feature = dc_isar_feature(aa64_i8mm, s);
+        break;
     case 0x18: /* FCMLA, #0 */
     case 0x19: /* FCMLA, #90 */
     case 0x1a: /* FCMLA, #180 */
@@ -12215,6 +12222,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
                          u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b);
         return;
 
+    case 0x3: /* USDOT */
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_usdot_b);
+        return;
+
     case 0x8: /* FCMLA, #0 */
     case 0x9: /* FCMLA, #90 */
     case 0xa: /* FCMLA, #180 */
@@ -13360,6 +13371,13 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             return;
         }
         break;
+    case 0x0f: /* SUDOT, USDOT */
+        if (is_scalar || (size & 1) || !dc_isar_feature(aa64_i8mm, s)) {
+            unallocated_encoding(s);
+            return;
+        }
+        size = MO_32;
+        break;
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
@@ -13474,6 +13492,13 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                          u ? gen_helper_gvec_udot_idx_b
                          : gen_helper_gvec_sdot_idx_b);
         return;
+    case 0x0f: /* SUDOT, USDOT */
+        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
+                         extract32(insn, 23, 1)
+                         ? gen_helper_gvec_usdot_idx_b
+                         : gen_helper_gvec_sudot_idx_b);
+        return;
+
     case 0x11: /* FCMLA #0 */
     case 0x13: /* FCMLA #90 */
     case 0x15: /* FCMLA #180 */
-- 
2.20.1


