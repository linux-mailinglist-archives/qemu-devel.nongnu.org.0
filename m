Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284645683B9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:40:27 +0200 (CEST)
Received: from localhost ([::1]:33740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91WC-0007Ub-Gp
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Lu-0006dW-42
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:43 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Lq-0000fk-An
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:40 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 23so13442232pgc.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bq7X2GhXVvfG6Er6nutJ7UEGp/1xvxDoz5E5KPgsbCU=;
 b=d6Ptz78PcfIvBurU0XfR+GIVv4C/cw8l7/SFo+0sWHX4O2rDI8xHnZK1aLInY0sdC0
 xC/PsU7iF/OPbH/MFgM7vg7hr3ai664oExtF9+S1FR8Prv+vxMZHASLqla6ACSoskdAL
 d4khLB3oivkhk7fVnKnCdby+z2WXi4SBKk/WQ3RSwCbFQ6Lhx2JbwNxpeUeGZckaUjiW
 ijfgDuq3u0yBL7HMk6PpoFKVYPmY/oDzcsc8ClwuErPzlFa52EvaNBGXH3ZkoHuyr4Q/
 3ib4DP+s5+7lNWfmwUMphMWEBt0szEsIi5kIO2qy6jlgoDSoNAPaSsiQ3pWpZHAcSH9F
 zZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bq7X2GhXVvfG6Er6nutJ7UEGp/1xvxDoz5E5KPgsbCU=;
 b=jXjMMbxwy4Q0q+oQgqeBgUrQB42zJzEEoGtdg7MNcEcT0MLjJw7ppE83R3Uullwr8s
 ieVzG5wZjJ957kqdV6z+kxRnXaQRxtAbh2/6QeOUd1CW0bRAnpC+TXH9DXZxX1F0XyCp
 ClDCBMCO3ZFf3Gem9qYjiygUYTmXjq9c8awTr4vULpku19m0e/iJtVzziIaCnT5KS9us
 Rk8RPERFuB5zBMYyxIfz1DWRMWnFQJpU1kcgH0IEj96BcxX20R0T6vC0pOXAXDrvOXte
 zjVlhY8eoLRhqxStYNNrk83SKF5aJ4TY9eJ00cXVxNnn49ZY/oXEctZ8IeCRD/CsSyM6
 KVUg==
X-Gm-Message-State: AJIora8YV4MmSKUfbkgiundj5Gesj9NtAKMOjQOi41Upw0TSMnG8mkTx
 dCLQCCvt/eQigbX0Q+BCCMLVx821zgCJzuQv
X-Google-Smtp-Source: AGRyM1tg5eZ8ckGO1MtmphG2o4Cgh2hIy03mI2l6d9Ug3zIpACf1DyVd4T4AseIUjVylMBs5p18qSw==
X-Received: by 2002:a63:dd4f:0:b0:411:e30d:6a0a with SMTP id
 g15-20020a63dd4f000000b00411e30d6a0amr22561093pgj.22.1657095937540; 
 Wed, 06 Jul 2022 01:25:37 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 29/45] target/arm: Implement REVD
Date: Wed,  6 Jul 2022 13:53:55 +0530
Message-Id: <20220706082411.1664825-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is an SVE instruction that operates using the SVE vector
length but that it is present only if SME is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  2 ++
 target/arm/sve.decode      |  1 +
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c |  2 ++
 4 files changed, 21 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ab0333400f..cc4e1d8948 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -719,6 +719,8 @@ DEF_HELPER_FLAGS_4(sve_revh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve_revw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sme_revd_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_rbit_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 966803cbb7..a9e48f07b4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -652,6 +652,7 @@ REVB            00000101 .. 1001 00 100 ... ..... .....         @rd_pg_rn
 REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
 REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
 RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
+REVD            00000101 00 1011 10 100 ... ..... .....         @rd_pg_rn_e0
 
 # SVE vector splice (predicated, destructive)
 SPLICE          00000101 .. 101 100 100 ... ..... .....         @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9a26f253e0..5de82696b5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -931,6 +931,22 @@ DO_ZPZ_D(sve_revh_d, uint64_t, hswap64)
 
 DO_ZPZ_D(sve_revw_d, uint64_t, wswap64)
 
+void HELPER(sme_revd_q)(void *vd, void *vn, void *vg, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn;
+    uint8_t *pg = vg;
+
+    for (i = 0; i < opr_sz; i += 2) {
+        if (pg[H1(i)] & 1) {
+            uint64_t n0 = n[i + 0];
+            uint64_t n1 = n[i + 1];
+            d[i + 0] = n1;
+            d[i + 1] = n0;
+        }
+    }
+}
+
 DO_ZPZ(sve_rbit_b, uint8_t, H1, revbit8)
 DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
 DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 24ffb69a2a..9ed3b267fd 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2901,6 +2901,8 @@ TRANS_FEAT(REVH, aa64_sve, gen_gvec_ool_arg_zpz, revh_fns[a->esz], a, 0)
 TRANS_FEAT(REVW, aa64_sve, gen_gvec_ool_arg_zpz,
            a->esz == 3 ? gen_helper_sve_revw_d : NULL, a, 0)
 
+TRANS_FEAT(REVD, aa64_sme, gen_gvec_ool_arg_zpz, gen_helper_sme_revd_q, a, 0)
+
 TRANS_FEAT(SPLICE, aa64_sve, gen_gvec_ool_arg_zpzz,
            gen_helper_sve_splice, a, a->esz)
 
-- 
2.34.1


