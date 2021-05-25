Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7364C38F7ED
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:09:10 +0200 (CEST)
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMVJ-00059x-70
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb7-0006HG-9t
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:05 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:46923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLav-0005ru-EF
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:11:04 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso12174414pjb.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dZqpG1NzFwardXCWOeWwh7nv+Kax2dkw5cg803fy2E=;
 b=HA0d8y2Rk0ku9qXs3WUgDfZjLkAwN4SXYnQzk24FRjgwVoEZrmZCs2k7zmUkeL1hIX
 hTUmweP1anMCPj91tSyvMzB2QS4xDZgz7aOE/odjwDxhDRe3pBsmLNh9u7XYCNmFzvqu
 J9FoLsiXDYFqFMrUgJcn7NeZb9e3d5gbpwKD9fg8u2laj/3pvpyYTGyBFAkdkQ3+aaaf
 kUjyXBDbU758GrXCN+ICwey3NEDyBHiYOEfGT5zqvVw7ISsJgrICrH6vtzCB93SCl4QO
 UKW0rV2HvEy2XKzafsF8W4rej9VN+fEVwh/sbNCxdoSKS3zmvAMBA2JFVtfHclblVBNW
 KjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7dZqpG1NzFwardXCWOeWwh7nv+Kax2dkw5cg803fy2E=;
 b=JyCi/dcEY50I3qN7z7pRWeRTlkTMj9AQWMpP0CVU8iR3CxmL1MSs4Zn+vJH8e4jQVr
 PRva1bJeqITQyIKomvJp+0ancAaEMmvPDkKWWWsrPLPTs7fq+w/5YgP/1KabEEVcKe6N
 gowe4Vq6dXmD78OC5PXhQFjidHah05k3BSYeLWKLlgp4DJF2Bi1ROtrFCFofF+rOXI04
 DLwW1NOymST/XvOD/i8bgGaLykm9wzF2C1e5L9IC9QyGjzEEh875VFIQsPIlBJyKNNd/
 jZyCBa4ufptizNqTmfYTHh8BR9e7R5iG5CQTtkxhqTyojXjLtqh3dT27jeQYzJEfV5d3
 YVMQ==
X-Gm-Message-State: AOAM531uu6rqKB15ZpyLaPMionGhO1rM6Lpkob/w6CV3u4+Y76Gd+e86
 +3F1GpNQGbNZFZF1fYOrPK2BPvuMrI1INg==
X-Google-Smtp-Source: ABdhPJzuCw3CfLWGhGkvhKxGhVrgBaSWhXQRbhaWYgisF0UED3CuTVQzBBCMmeaRnvfNRq0uMPKj7w==
X-Received: by 2002:a17:90a:8581:: with SMTP id
 m1mr2847606pjn.47.1621905051167; 
 Mon, 24 May 2021 18:10:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 83/92] target/arm: Implement aarch64 SUDOT, USDOT
Date: Mon, 24 May 2021 18:03:49 -0700
Message-Id: <20210525010358.152808-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/translate-a64.c | 25 +++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c75601b221..b2b684df55 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4206,6 +4206,11 @@ static inline bool isar_feature_aa64_rcpc_8_4(const ARMISARegisters *id)
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
index a8edd2d281..c875481784 100644
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
2.25.1


