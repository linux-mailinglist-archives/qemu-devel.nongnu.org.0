Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3003702C6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:14:55 +0200 (CEST)
Received: from localhost ([::1]:51674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcaTP-0007jq-0z
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmg-0004zs-Pg
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:46 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007oH-04
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:30:46 -0400
Received: by mail-pg1-x534.google.com with SMTP id p12so50171972pgj.10
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cRF8Mv+M0NzHkJxcMg0tP1cErf1whBJVFSultKETQRM=;
 b=JItORHXNVtCDA74Dgt76waqUAe8+Mmip0wKIrv1Uxa5ZlmUPJf0XICf8pXb6jrE7y4
 tOvG99ah2QCcUdQhmBhK/f9gXRRsDOuGnVXujooYf2ZCHRZ34ZNUsNLVFogiPZ6/5Nnx
 yLJVqROjceF8+8I798IwnjQoqoiIx3boW7rPP/OyJCV7qpVcPOqksYFReyP+1/ZlB44e
 Q3dfmKPfJQhTCjXTqn3WkfkxsO8/TqmHkB5SHN0wSJDubD4QETRFctGH3AT/twa4huoW
 i+FTgBAsmlybuUc8PAGzXUz+93+ERDylTU2Uoc4yaj/3HQDEE2hX1AFGyess8LX4Eukd
 2D4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cRF8Mv+M0NzHkJxcMg0tP1cErf1whBJVFSultKETQRM=;
 b=gQeUuEMTfJDUvUe4THLulUt093lWtnJ2vSIPlyYGq1Xe6MZ+WNyC0dshOBp1XZtteZ
 DkFH1/OVrKT0rTCbHPeoibbEV61wPpF5kD0gBwP/RLWLg0QnzpOU4UNOMcZeFERvstqc
 iSoc2UCf7bs2Bj1hpgHoCGOQWvkOTbhbWYVtokyZEC87v06IB4pkwdrcvTsJSb36C6Ty
 viZQyNzWBE89svAkq/4xkCh6Ik9GCzC1/8mr9t4pLwzbKrVmVXBBJpV55qNZxGv9/QSi
 cTzXaYsNhkx24W5dhJYkLVh464B/2QyO+DUj9vhSUIXfidM55Q/BpsqwEkeudfRu6HZ4
 Y1Cg==
X-Gm-Message-State: AOAM5322U/tWrYMsboXWxFzDxcptqxSnFNjccJR41Jd1BsAfYge0lgRA
 TvB9hd3YxL2IOvCbgO32ZTdsTotlLhyTtQ==
X-Google-Smtp-Source: ABdhPJwKSeCoXfBYe6DG65CLR3NkZI2ocmFqgOIRCPxUECf72gBYAxrmh4hoTBlkOM290YIpQQEGkQ==
X-Received: by 2002:aa7:8f15:0:b029:27a:4eb9:7c9a with SMTP id
 x21-20020aa78f150000b029027a4eb97c9amr6617043pfr.62.1619814597009; 
 Fri, 30 Apr 2021 13:29:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 74/82] target/arm: Implement aarch64 SUDOT, USDOT
Date: Fri, 30 Apr 2021 13:26:02 -0700
Message-Id: <20210430202610.1136687-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


