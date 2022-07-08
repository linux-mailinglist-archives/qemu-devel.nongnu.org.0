Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2775F56BCFF
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:43:08 +0200 (CEST)
Received: from localhost ([::1]:60762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9q8H-0002b0-HE
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piv-0003KU-I9
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:53 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pis-0002M3-A8
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:53 -0400
Received: by mail-pl1-x62b.google.com with SMTP id d5so16559443plo.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8YQB6LeLt+3Ny30LNBUdLIOFN4107DYb/ESLNKv6Buo=;
 b=Zrm146tvGH49hpRCLcPwnds+ETUbYyvbbvET9jpZ3y2U2XvPIyqSkH5VgrPPyIRbjc
 4naT05yAnDBY4ToKU2xhlM232T+xCQ5o83lk6YMCfCmpFzsEzhHFt/bPwRSbeGJ6Rdtu
 H/SVaN23f59RWFhWMAnwnp8nighzN+0l9YcNp4mcI/7IQERgbOk/P0AimYTkhN0E4+Zl
 +EkYKzm8upfm4TQ2XGyLpE5RSS7JxMtt5rRB9M6QapGTx9kI7T/30s7RlsANmCuf7o3y
 5h1Dyhw03fR1RmRZnKJEPPQ8snuYfNPn27Ewr5y9wNgDnBh+3owO5cGloS2UKtZRl4Tn
 ZzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8YQB6LeLt+3Ny30LNBUdLIOFN4107DYb/ESLNKv6Buo=;
 b=e2g96ObpVR/WMv/0+BpcKYLAbi7urRnvrEdJGRmBwhqKK0BiEPolDWszvM6ogIn4UN
 UdhHZ7a3FtpP+5HUqmW9acSqGhRoZJz5fMN6awtnU0zTEVuEKBAnhyxNdkIejeJcVAW/
 9d8B71Q8YYGrdCMTHsnAG7OByxQus9Z4KYIPtKR01K8tp3scxOTFO8OEyaL25ltI7ohK
 +TsWPCvr7xVM4JjK2ml4eQyd8Ke9CM1InKJzHrPw/K7mvO/MP+ugONvxBvb8ah00CJ79
 zI6eY2boWJmZRNijRKjMG0nCAjza2W566Y5pf/OdqDcgFDcVF35L7IIV+KyuadWMgIeR
 ftig==
X-Gm-Message-State: AJIora8tiIHe/5irGqsj55KAo0qEgaiqKJA7K+PElkDcaLE0s7AUsglm
 KCKd9GjjZtdVMaLxTNR9YkerIk7SXKRlokc/
X-Google-Smtp-Source: AGRyM1uejRe2ezy8PYso0q8EF4MJBV0B13jloqNRp/vOvrSpodH9ZvUea70lBPIYkSUCcl1n9UDgYw==
X-Received: by 2002:a17:90b:4c86:b0:1ec:cc0f:32da with SMTP id
 my6-20020a17090b4c8600b001eccc0f32damr393184pjb.66.1657293408683; 
 Fri, 08 Jul 2022 08:16:48 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 20/45] target/arm: Implement SME LD1, ST1
Date: Fri,  8 Jul 2022 20:45:15 +0530
Message-Id: <20220708151540.18136-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

We cannot reuse the SVE functions for LD[1-4] and ST[1-4],
because those functions accept only a Zreg register number.
For SME, we want to pass a pointer into ZA storage.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sme.h    |  82 +++++
 target/arm/sme.decode      |   9 +
 target/arm/sme_helper.c    | 595 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sme.c |  70 +++++
 4 files changed, 756 insertions(+)

diff --git a/target/arm/helper-sme.h b/target/arm/helper-sme.h
index 154bc73d2e..95f6e88bdd 100644
--- a/target/arm/helper-sme.h
+++ b/target/arm/helper-sme.h
@@ -33,3 +33,85 @@ DEF_HELPER_FLAGS_4(sme_mova_cz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_mova_zc_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_mova_cz_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sme_mova_zc_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sme_ld1b_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1b_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1b_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1b_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_ld1h_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1h_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_ld1s_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1s_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_ld1d_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1d_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_ld1q_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_ld1q_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_st1b_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1b_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1b_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1b_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_st1h_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1h_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_st1s_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1s_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_st1d_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1d_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_5(sme_st1q_be_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_le_h, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_be_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_le_v, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_be_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_le_h_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_be_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_5(sme_st1q_le_v_mte, TCG_CALL_NO_WG, void, env, ptr, ptr, tl, i32)
diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 241b4895b7..900e3f2a07 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -37,3 +37,12 @@ MOVA            11000000 esz:2 00001 0 v:1 .. pg:3 0 za_imm:4 zr:5  \
                 &mova to_vec=1 rs=%mova_rs
 MOVA            11000000 11    00001 1 v:1 .. pg:3 0 za_imm:4 zr:5  \
                 &mova to_vec=1 rs=%mova_rs esz=4
+
+### SME Memory
+
+&ldst           esz rs pg rn rm za_imm v:bool st:bool
+
+LDST1           1110000 0 esz:2 st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
+                &ldst rs=%mova_rs
+LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
+                &ldst esz=4 rs=%mova_rs
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index e88244423d..10fd1ed910 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -19,10 +19,14 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "internals.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
+#include "exec/exec-all.h"
 #include "qemu/int128.h"
 #include "vec_internal.h"
+#include "sve_ldst_internal.h"
 
 /* ResetSVEState */
 void arm_reset_sve_state(CPUARMState *env)
@@ -233,3 +237,594 @@ void HELPER(sme_mova_zc_q)(void *vd, void *za, void *vg, uint32_t desc)
 }
 
 #undef DO_MOVA_Z
+
+/*
+ * Clear elements in a tile slice comprising len bytes.
+ */
+
+typedef void ClearFn(void *ptr, size_t off, size_t len);
+
+static void clear_horizontal(void *ptr, size_t off, size_t len)
+{
+    memset(ptr + off, 0, len);
+}
+
+static void clear_vertical_b(void *vptr, size_t off, size_t len)
+{
+    for (size_t i = 0; i < len; ++i) {
+        *(uint8_t *)(vptr + tile_vslice_offset(i + off)) = 0;
+    }
+}
+
+static void clear_vertical_h(void *vptr, size_t off, size_t len)
+{
+    for (size_t i = 0; i < len; i += 2) {
+        *(uint16_t *)(vptr + tile_vslice_offset(i + off)) = 0;
+    }
+}
+
+static void clear_vertical_s(void *vptr, size_t off, size_t len)
+{
+    for (size_t i = 0; i < len; i += 4) {
+        *(uint32_t *)(vptr + tile_vslice_offset(i + off)) = 0;
+    }
+}
+
+static void clear_vertical_d(void *vptr, size_t off, size_t len)
+{
+    for (size_t i = 0; i < len; i += 8) {
+        *(uint64_t *)(vptr + tile_vslice_offset(i + off)) = 0;
+    }
+}
+
+static void clear_vertical_q(void *vptr, size_t off, size_t len)
+{
+    for (size_t i = 0; i < len; i += 16) {
+        memset(vptr + tile_vslice_offset(i + off), 0, 16);
+    }
+}
+
+/*
+ * Copy elements from an array into a tile slice comprising len bytes.
+ */
+
+typedef void CopyFn(void *dst, const void *src, size_t len);
+
+static void copy_horizontal(void *dst, const void *src, size_t len)
+{
+    memcpy(dst, src, len);
+}
+
+static void copy_vertical_b(void *vdst, const void *vsrc, size_t len)
+{
+    const uint8_t *src = vsrc;
+    uint8_t *dst = vdst;
+    size_t i;
+
+    for (i = 0; i < len; ++i) {
+        dst[tile_vslice_index(i)] = src[i];
+    }
+}
+
+static void copy_vertical_h(void *vdst, const void *vsrc, size_t len)
+{
+    const uint16_t *src = vsrc;
+    uint16_t *dst = vdst;
+    size_t i;
+
+    for (i = 0; i < len / 2; ++i) {
+        dst[tile_vslice_index(i)] = src[i];
+    }
+}
+
+static void copy_vertical_s(void *vdst, const void *vsrc, size_t len)
+{
+    const uint32_t *src = vsrc;
+    uint32_t *dst = vdst;
+    size_t i;
+
+    for (i = 0; i < len / 4; ++i) {
+        dst[tile_vslice_index(i)] = src[i];
+    }
+}
+
+static void copy_vertical_d(void *vdst, const void *vsrc, size_t len)
+{
+    const uint64_t *src = vsrc;
+    uint64_t *dst = vdst;
+    size_t i;
+
+    for (i = 0; i < len / 8; ++i) {
+        dst[tile_vslice_index(i)] = src[i];
+    }
+}
+
+static void copy_vertical_q(void *vdst, const void *vsrc, size_t len)
+{
+    for (size_t i = 0; i < len; i += 16) {
+        memcpy(vdst + tile_vslice_offset(i), vsrc + i, 16);
+    }
+}
+
+/*
+ * Host and TLB primitives for vertical tile slice addressing.
+ */
+
+#define DO_LD(NAME, TYPE, HOST, TLB)                                        \
+static inline void sme_##NAME##_v_host(void *za, intptr_t off, void *host)  \
+{                                                                           \
+    TYPE val = HOST(host);                                                  \
+    *(TYPE *)(za + tile_vslice_offset(off)) = val;                          \
+}                                                                           \
+static inline void sme_##NAME##_v_tlb(CPUARMState *env, void *za,           \
+                        intptr_t off, target_ulong addr, uintptr_t ra)      \
+{                                                                           \
+    TYPE val = TLB(env, useronly_clean_ptr(addr), ra);                      \
+    *(TYPE *)(za + tile_vslice_offset(off)) = val;                          \
+}
+
+#define DO_ST(NAME, TYPE, HOST, TLB)                                        \
+static inline void sme_##NAME##_v_host(void *za, intptr_t off, void *host)  \
+{                                                                           \
+    TYPE val = *(TYPE *)(za + tile_vslice_offset(off));                     \
+    HOST(host, val);                                                        \
+}                                                                           \
+static inline void sme_##NAME##_v_tlb(CPUARMState *env, void *za,           \
+                        intptr_t off, target_ulong addr, uintptr_t ra)      \
+{                                                                           \
+    TYPE val = *(TYPE *)(za + tile_vslice_offset(off));                     \
+    TLB(env, useronly_clean_ptr(addr), val, ra);                            \
+}
+
+/*
+ * The ARMVectorReg elements are stored in host-endian 64-bit units.
+ * For 128-bit quantities, the sequence defined by the Elem[] pseudocode
+ * corresponds to storing the two 64-bit pieces in little-endian order.
+ */
+#define DO_LDQ(HNAME, VNAME, BE, HOST, TLB)                                 \
+static inline void HNAME##_host(void *za, intptr_t off, void *host)         \
+{                                                                           \
+    uint64_t val0 = HOST(host), val1 = HOST(host + 8);                      \
+    uint64_t *ptr = za + off;                                               \
+    ptr[0] = BE ? val1 : val0, ptr[1] = BE ? val0 : val1;                   \
+}                                                                           \
+static inline void VNAME##_v_host(void *za, intptr_t off, void *host)       \
+{                                                                           \
+    HNAME##_host(za, tile_vslice_offset(off), host);                        \
+}                                                                           \
+static inline void HNAME##_tlb(CPUARMState *env, void *za, intptr_t off,    \
+                               target_ulong addr, uintptr_t ra)             \
+{                                                                           \
+    uint64_t val0 = TLB(env, useronly_clean_ptr(addr), ra);                 \
+    uint64_t val1 = TLB(env, useronly_clean_ptr(addr + 8), ra);             \
+    uint64_t *ptr = za + off;                                               \
+    ptr[0] = BE ? val1 : val0, ptr[1] = BE ? val0 : val1;                   \
+}                                                                           \
+static inline void VNAME##_v_tlb(CPUARMState *env, void *za, intptr_t off,  \
+                               target_ulong addr, uintptr_t ra)             \
+{                                                                           \
+    HNAME##_tlb(env, za, tile_vslice_offset(off), addr, ra);                \
+}
+
+#define DO_STQ(HNAME, VNAME, BE, HOST, TLB)                                 \
+static inline void HNAME##_host(void *za, intptr_t off, void *host)         \
+{                                                                           \
+    uint64_t *ptr = za + off;                                               \
+    HOST(host, ptr[BE]);                                                    \
+    HOST(host + 1, ptr[!BE]);                                               \
+}                                                                           \
+static inline void VNAME##_v_host(void *za, intptr_t off, void *host)       \
+{                                                                           \
+    HNAME##_host(za, tile_vslice_offset(off), host);                        \
+}                                                                           \
+static inline void HNAME##_tlb(CPUARMState *env, void *za, intptr_t off,    \
+                               target_ulong addr, uintptr_t ra)             \
+{                                                                           \
+    uint64_t *ptr = za + off;                                               \
+    TLB(env, useronly_clean_ptr(addr), ptr[BE], ra);                        \
+    TLB(env, useronly_clean_ptr(addr + 8), ptr[!BE], ra);                   \
+}                                                                           \
+static inline void VNAME##_v_tlb(CPUARMState *env, void *za, intptr_t off,  \
+                               target_ulong addr, uintptr_t ra)             \
+{                                                                           \
+    HNAME##_tlb(env, za, tile_vslice_offset(off), addr, ra);                \
+}
+
+DO_LD(ld1b, uint8_t, ldub_p, cpu_ldub_data_ra)
+DO_LD(ld1h_be, uint16_t, lduw_be_p, cpu_lduw_be_data_ra)
+DO_LD(ld1h_le, uint16_t, lduw_le_p, cpu_lduw_le_data_ra)
+DO_LD(ld1s_be, uint32_t, ldl_be_p, cpu_ldl_be_data_ra)
+DO_LD(ld1s_le, uint32_t, ldl_le_p, cpu_ldl_le_data_ra)
+DO_LD(ld1d_be, uint64_t, ldq_be_p, cpu_ldq_be_data_ra)
+DO_LD(ld1d_le, uint64_t, ldq_le_p, cpu_ldq_le_data_ra)
+
+DO_LDQ(sve_ld1qq_be, sme_ld1q_be, 1, ldq_be_p, cpu_ldq_be_data_ra)
+DO_LDQ(sve_ld1qq_le, sme_ld1q_le, 0, ldq_le_p, cpu_ldq_le_data_ra)
+
+DO_ST(st1b, uint8_t, stb_p, cpu_stb_data_ra)
+DO_ST(st1h_be, uint16_t, stw_be_p, cpu_stw_be_data_ra)
+DO_ST(st1h_le, uint16_t, stw_le_p, cpu_stw_le_data_ra)
+DO_ST(st1s_be, uint32_t, stl_be_p, cpu_stl_be_data_ra)
+DO_ST(st1s_le, uint32_t, stl_le_p, cpu_stl_le_data_ra)
+DO_ST(st1d_be, uint64_t, stq_be_p, cpu_stq_be_data_ra)
+DO_ST(st1d_le, uint64_t, stq_le_p, cpu_stq_le_data_ra)
+
+DO_STQ(sve_st1qq_be, sme_st1q_be, 1, stq_be_p, cpu_stq_be_data_ra)
+DO_STQ(sve_st1qq_le, sme_st1q_le, 0, stq_le_p, cpu_stq_le_data_ra)
+
+#undef DO_LD
+#undef DO_ST
+#undef DO_LDQ
+#undef DO_STQ
+
+/*
+ * Common helper for all contiguous predicated loads.
+ */
+
+static inline QEMU_ALWAYS_INLINE
+void sme_ld1(CPUARMState *env, void *za, uint64_t *vg,
+             const target_ulong addr, uint32_t desc, const uintptr_t ra,
+             const int esz, uint32_t mtedesc, bool vertical,
+             sve_ldst1_host_fn *host_fn,
+             sve_ldst1_tlb_fn *tlb_fn,
+             ClearFn *clr_fn,
+             CopyFn *cpy_fn)
+{
+    const intptr_t reg_max = simd_oprsz(desc);
+    const intptr_t esize = 1 << esz;
+    intptr_t reg_off, reg_last;
+    SVEContLdSt info;
+    void *host;
+    int flags;
+
+    /* Find the active elements.  */
+    if (!sve_cont_ldst_elements(&info, addr, vg, reg_max, esz, esize)) {
+        /* The entire predicate was false; no load occurs.  */
+        clr_fn(za, 0, reg_max);
+        return;
+    }
+
+    /* Probe the page(s).  Exit with exception for any invalid page. */
+    sve_cont_ldst_pages(&info, FAULT_ALL, env, addr, MMU_DATA_LOAD, ra);
+
+    /* Handle watchpoints for all active elements. */
+    sve_cont_ldst_watchpoints(&info, env, vg, addr, esize, esize,
+                              BP_MEM_READ, ra);
+
+    /*
+     * Handle mte checks for all active elements.
+     * Since TBI must be set for MTE, !mtedesc => !mte_active.
+     */
+    if (mtedesc) {
+        sve_cont_ldst_mte_check(&info, env, vg, addr, esize, esize,
+                                mtedesc, ra);
+    }
+
+    flags = info.page[0].flags | info.page[1].flags;
+    if (unlikely(flags != 0)) {
+#ifdef CONFIG_USER_ONLY
+        g_assert_not_reached();
+#else
+        /*
+         * At least one page includes MMIO.
+         * Any bus operation can fail with cpu_transaction_failed,
+         * which for ARM will raise SyncExternal.  Perform the load
+         * into scratch memory to preserve register state until the end.
+         */
+        ARMVectorReg scratch = { };
+
+        reg_off = info.reg_off_first[0];
+        reg_last = info.reg_off_last[1];
+        if (reg_last < 0) {
+            reg_last = info.reg_off_split;
+            if (reg_last < 0) {
+                reg_last = info.reg_off_last[0];
+            }
+        }
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    tlb_fn(env, &scratch, reg_off, addr + reg_off, ra);
+                }
+                reg_off += esize;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+
+        cpy_fn(za, &scratch, reg_max);
+        return;
+#endif
+    }
+
+    /* The entire operation is in RAM, on valid pages. */
+
+    reg_off = info.reg_off_first[0];
+    reg_last = info.reg_off_last[0];
+    host = info.page[0].host;
+
+    if (!vertical) {
+        memset(za, 0, reg_max);
+    } else if (reg_off) {
+        clr_fn(za, 0, reg_off);
+    }
+
+    while (reg_off <= reg_last) {
+        uint64_t pg = vg[reg_off >> 6];
+        do {
+            if ((pg >> (reg_off & 63)) & 1) {
+                host_fn(za, reg_off, host + reg_off);
+            } else if (vertical) {
+                clr_fn(za, reg_off, esize);
+            }
+            reg_off += esize;
+        } while (reg_off <= reg_last && (reg_off & 63));
+    }
+
+    /*
+     * Use the slow path to manage the cross-page misalignment.
+     * But we know this is RAM and cannot trap.
+     */
+    reg_off = info.reg_off_split;
+    if (unlikely(reg_off >= 0)) {
+        tlb_fn(env, za, reg_off, addr + reg_off, ra);
+    }
+
+    reg_off = info.reg_off_first[1];
+    if (unlikely(reg_off >= 0)) {
+        reg_last = info.reg_off_last[1];
+        host = info.page[1].host;
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    host_fn(za, reg_off, host + reg_off);
+                } else if (vertical) {
+                    clr_fn(za, reg_off, esize);
+                }
+                reg_off += esize;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+    }
+}
+
+static inline QEMU_ALWAYS_INLINE
+void sme_ld1_mte(CPUARMState *env, void *za, uint64_t *vg,
+                 target_ulong addr, uint32_t desc, uintptr_t ra,
+                 const int esz, bool vertical,
+                 sve_ldst1_host_fn *host_fn,
+                 sve_ldst1_tlb_fn *tlb_fn,
+                 ClearFn *clr_fn,
+                 CopyFn *cpy_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    int bit55 = extract64(addr, 55, 1);
+
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /* Perform gross MTE suppression early. */
+    if (!tbi_check(desc, bit55) ||
+        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+        mtedesc = 0;
+    }
+
+    sme_ld1(env, za, vg, addr, desc, ra, esz, mtedesc, vertical,
+            host_fn, tlb_fn, clr_fn, cpy_fn);
+}
+
+#define DO_LD(L, END, ESZ)                                                 \
+void HELPER(sme_ld1##L##END##_h)(CPUARMState *env, void *za, void *vg,     \
+                                 target_ulong addr, uint32_t desc)         \
+{                                                                          \
+    sme_ld1(env, za, vg, addr, desc, GETPC(), ESZ, 0, false,               \
+            sve_ld1##L##L##END##_host, sve_ld1##L##L##END##_tlb,           \
+            clear_horizontal, copy_horizontal);                            \
+}                                                                          \
+void HELPER(sme_ld1##L##END##_v)(CPUARMState *env, void *za, void *vg,     \
+                                 target_ulong addr, uint32_t desc)         \
+{                                                                          \
+    sme_ld1(env, za, vg, addr, desc, GETPC(), ESZ, 0, true,                \
+            sme_ld1##L##END##_v_host, sme_ld1##L##END##_v_tlb,             \
+            clear_vertical_##L, copy_vertical_##L);                        \
+}                                                                          \
+void HELPER(sme_ld1##L##END##_h_mte)(CPUARMState *env, void *za, void *vg, \
+                                     target_ulong addr, uint32_t desc)     \
+{                                                                          \
+    sme_ld1_mte(env, za, vg, addr, desc, GETPC(), ESZ, false,              \
+                sve_ld1##L##L##END##_host, sve_ld1##L##L##END##_tlb,       \
+                clear_horizontal, copy_horizontal);                        \
+}                                                                          \
+void HELPER(sme_ld1##L##END##_v_mte)(CPUARMState *env, void *za, void *vg, \
+                                     target_ulong addr, uint32_t desc)     \
+{                                                                          \
+    sme_ld1_mte(env, za, vg, addr, desc, GETPC(), ESZ, true,               \
+                sme_ld1##L##END##_v_host, sme_ld1##L##END##_v_tlb,         \
+                clear_vertical_##L, copy_vertical_##L);                    \
+}
+
+DO_LD(b, , MO_8)
+DO_LD(h, _be, MO_16)
+DO_LD(h, _le, MO_16)
+DO_LD(s, _be, MO_32)
+DO_LD(s, _le, MO_32)
+DO_LD(d, _be, MO_64)
+DO_LD(d, _le, MO_64)
+DO_LD(q, _be, MO_128)
+DO_LD(q, _le, MO_128)
+
+#undef DO_LD
+
+/*
+ * Common helper for all contiguous predicated stores.
+ */
+
+static inline QEMU_ALWAYS_INLINE
+void sme_st1(CPUARMState *env, void *za, uint64_t *vg,
+             const target_ulong addr, uint32_t desc, const uintptr_t ra,
+             const int esz, uint32_t mtedesc, bool vertical,
+             sve_ldst1_host_fn *host_fn,
+             sve_ldst1_tlb_fn *tlb_fn)
+{
+    const intptr_t reg_max = simd_oprsz(desc);
+    const intptr_t esize = 1 << esz;
+    intptr_t reg_off, reg_last;
+    SVEContLdSt info;
+    void *host;
+    int flags;
+
+    /* Find the active elements.  */
+    if (!sve_cont_ldst_elements(&info, addr, vg, reg_max, esz, esize)) {
+        /* The entire predicate was false; no store occurs.  */
+        return;
+    }
+
+    /* Probe the page(s).  Exit with exception for any invalid page. */
+    sve_cont_ldst_pages(&info, FAULT_ALL, env, addr, MMU_DATA_STORE, ra);
+
+    /* Handle watchpoints for all active elements. */
+    sve_cont_ldst_watchpoints(&info, env, vg, addr, esize, esize,
+                              BP_MEM_WRITE, ra);
+
+    /*
+     * Handle mte checks for all active elements.
+     * Since TBI must be set for MTE, !mtedesc => !mte_active.
+     */
+    if (mtedesc) {
+        sve_cont_ldst_mte_check(&info, env, vg, addr, esize, esize,
+                                mtedesc, ra);
+    }
+
+    flags = info.page[0].flags | info.page[1].flags;
+    if (unlikely(flags != 0)) {
+#ifdef CONFIG_USER_ONLY
+        g_assert_not_reached();
+#else
+        /*
+         * At least one page includes MMIO.
+         * Any bus operation can fail with cpu_transaction_failed,
+         * which for ARM will raise SyncExternal.  We cannot avoid
+         * this fault and will leave with the store incomplete.
+         */
+        reg_off = info.reg_off_first[0];
+        reg_last = info.reg_off_last[1];
+        if (reg_last < 0) {
+            reg_last = info.reg_off_split;
+            if (reg_last < 0) {
+                reg_last = info.reg_off_last[0];
+            }
+        }
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    tlb_fn(env, za, reg_off, addr + reg_off, ra);
+                }
+                reg_off += esize;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+        return;
+#endif
+    }
+
+    reg_off = info.reg_off_first[0];
+    reg_last = info.reg_off_last[0];
+    host = info.page[0].host;
+
+    while (reg_off <= reg_last) {
+        uint64_t pg = vg[reg_off >> 6];
+        do {
+            if ((pg >> (reg_off & 63)) & 1) {
+                host_fn(za, reg_off, host + reg_off);
+            }
+            reg_off += 1 << esz;
+        } while (reg_off <= reg_last && (reg_off & 63));
+    }
+
+    /*
+     * Use the slow path to manage the cross-page misalignment.
+     * But we know this is RAM and cannot trap.
+     */
+    reg_off = info.reg_off_split;
+    if (unlikely(reg_off >= 0)) {
+        tlb_fn(env, za, reg_off, addr + reg_off, ra);
+    }
+
+    reg_off = info.reg_off_first[1];
+    if (unlikely(reg_off >= 0)) {
+        reg_last = info.reg_off_last[1];
+        host = info.page[1].host;
+
+        do {
+            uint64_t pg = vg[reg_off >> 6];
+            do {
+                if ((pg >> (reg_off & 63)) & 1) {
+                    host_fn(za, reg_off, host + reg_off);
+                }
+                reg_off += 1 << esz;
+            } while (reg_off & 63);
+        } while (reg_off <= reg_last);
+    }
+}
+
+static inline QEMU_ALWAYS_INLINE
+void sme_st1_mte(CPUARMState *env, void *za, uint64_t *vg, target_ulong addr,
+                 uint32_t desc, uintptr_t ra, int esz, bool vertical,
+                 sve_ldst1_host_fn *host_fn,
+                 sve_ldst1_tlb_fn *tlb_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    int bit55 = extract64(addr, 55, 1);
+
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /* Perform gross MTE suppression early. */
+    if (!tbi_check(desc, bit55) ||
+        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+        mtedesc = 0;
+    }
+
+    sme_st1(env, za, vg, addr, desc, ra, esz, mtedesc,
+            vertical, host_fn, tlb_fn);
+}
+
+#define DO_ST(L, END, ESZ)                                                 \
+void HELPER(sme_st1##L##END##_h)(CPUARMState *env, void *za, void *vg,     \
+                                 target_ulong addr, uint32_t desc)         \
+{                                                                          \
+    sme_st1(env, za, vg, addr, desc, GETPC(), ESZ, 0, false,               \
+            sve_st1##L##L##END##_host, sve_st1##L##L##END##_tlb);          \
+}                                                                          \
+void HELPER(sme_st1##L##END##_v)(CPUARMState *env, void *za, void *vg,     \
+                                 target_ulong addr, uint32_t desc)         \
+{                                                                          \
+    sme_st1(env, za, vg, addr, desc, GETPC(), ESZ, 0, true,                \
+            sme_st1##L##END##_v_host, sme_st1##L##END##_v_tlb);            \
+}                                                                          \
+void HELPER(sme_st1##L##END##_h_mte)(CPUARMState *env, void *za, void *vg, \
+                                     target_ulong addr, uint32_t desc)     \
+{                                                                          \
+    sme_st1_mte(env, za, vg, addr, desc, GETPC(), ESZ, false,              \
+                sve_st1##L##L##END##_host, sve_st1##L##L##END##_tlb);      \
+}                                                                          \
+void HELPER(sme_st1##L##END##_v_mte)(CPUARMState *env, void *za, void *vg, \
+                                     target_ulong addr, uint32_t desc)     \
+{                                                                          \
+    sme_st1_mte(env, za, vg, addr, desc, GETPC(), ESZ, true,               \
+                sme_st1##L##END##_v_host, sme_st1##L##END##_v_tlb);        \
+}
+
+DO_ST(b, , MO_8)
+DO_ST(h, _be, MO_16)
+DO_ST(h, _le, MO_16)
+DO_ST(s, _be, MO_32)
+DO_ST(s, _le, MO_32)
+DO_ST(d, _be, MO_64)
+DO_ST(d, _le, MO_64)
+DO_ST(q, _be, MO_128)
+DO_ST(q, _le, MO_128)
+
+#undef DO_ST
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 79c33d35c2..42d14b883a 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -173,3 +173,73 @@ static bool trans_MOVA(DisasContext *s, arg_MOVA *a)
 
     return true;
 }
+
+static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
+{
+    typedef void GenLdSt1(TCGv_env, TCGv_ptr, TCGv_ptr, TCGv, TCGv_i32);
+
+    /*
+     * Indexed by [esz][be][v][mte][st], which is (except for load/store)
+     * also the order in which the elements appear in the function names,
+     * and so how we must concatenate the pieces.
+     */
+
+#define FN_LS(F)     { gen_helper_sme_ld1##F, gen_helper_sme_st1##F }
+#define FN_MTE(F)    { FN_LS(F), FN_LS(F##_mte) }
+#define FN_HV(F)     { FN_MTE(F##_h), FN_MTE(F##_v) }
+#define FN_END(L, B) { FN_HV(L), FN_HV(B) }
+
+    static GenLdSt1 * const fns[5][2][2][2][2] = {
+        FN_END(b, b),
+        FN_END(h_le, h_be),
+        FN_END(s_le, s_be),
+        FN_END(d_le, d_be),
+        FN_END(q_le, q_be),
+    };
+
+#undef FN_LS
+#undef FN_MTE
+#undef FN_HV
+#undef FN_END
+
+    TCGv_ptr t_za, t_pg;
+    TCGv_i64 addr;
+    int svl, desc = 0;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
+
+    if (!dc_isar_feature(aa64_sme, s)) {
+        return false;
+    }
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za_imm, a->v);
+    t_pg = pred_full_reg_ptr(s, a->pg);
+    addr = tcg_temp_new_i64();
+
+    tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), a->esz);
+    tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rn));
+
+    if (mte) {
+        desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
+        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+        desc = FIELD_DP32(desc, MTEDESC, WRITE, a->st);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, (1 << a->esz) - 1);
+        desc <<= SVE_MTEDESC_SHIFT;
+    } else {
+        addr = clean_data_tbi(s, addr);
+    }
+    svl = streaming_vec_reg_size(s);
+    desc = simd_desc(svl, svl, desc);
+
+    fns[a->esz][be][a->v][mte][a->st](cpu_env, t_za, t_pg, addr,
+                                      tcg_constant_i32(desc));
+
+    tcg_temp_free_ptr(t_za);
+    tcg_temp_free_ptr(t_pg);
+    tcg_temp_free_i64(addr);
+    return true;
+}
-- 
2.34.1


