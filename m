Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3606B5048C4
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:06:49 +0200 (CEST)
Received: from localhost ([::1]:48864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9IO-000180-Uu
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xK-0001KC-AU
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:02 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xG-0003P6-SU
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:45:01 -0400
Received: by mail-pg1-x535.google.com with SMTP id s137so14960264pgs.5
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S1tmxjtzChOlXlFN2H8r9mWpojIz96JDvEta62yTA5I=;
 b=Zne17NRUnh0wV0VRNjlf17bWBhR6aWhrYRfQZQQqXWiJJV446MgEBy89v0vWksqDOG
 fvaGxpOQViz2x6FcpbsKhcmcAcVBA7zafyDVRH2ISVowbzAvFoySKOzCgc9DDwKwV0R+
 NJytjU2kLtiOlny2peLrTeoMovw7IZ+ubG9rtJ6rI/w7Hzk6L4pIuDEYWu2PeV94strA
 pZ3jt5IpS3Y6hTg0+fU0lIlXqBUBrgm1/xZiO6ldH5HkmRp6F9GT6iJK2t92Te7g137d
 iLXM35ugMD5K5yt5+DM36gL6ThOH0bo4um5qlKVWvLE4NqpQ5unmM/3Wff603FPPSEWm
 QsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S1tmxjtzChOlXlFN2H8r9mWpojIz96JDvEta62yTA5I=;
 b=v32OeWQv4TCFe/G/0t3zPHiKba8tRPGhY4Ju202lIerTsAFLWTZlsd//PLLIiyF10N
 V0utz4J2Df74FIif/ok4lVJD6ghsGrpbs8Hb1dbBNtf39z3OZUtWKFWuogwAgk3qQX8m
 d92HlVbed+j+LxGK55O/sB3F2aCNpqIxUA6Fe/DZ8waOBLBbuVSBtSZExrQ7UflrO7Ya
 NW1DcJuYhTgNzGVGKnSOAwJ8G2Q3vnwYfGgqqT2n8nj4NaBtuqvXOeLzj6RK2bTqlQvi
 x+MYQNrP7+IBqBItWq9fg2DeioBQiLxTC61Or7kGb2zQbstohX4N667e+qwRKdkAEb+U
 crFA==
X-Gm-Message-State: AOAM531z8N3y/KC05NOxIZKJARkogD5PUnmKNsJFsOPOHtEQcLZZKODl
 p1QSNK8K5G1M1TPohG3Ip1XKKlL6E4vzdw==
X-Google-Smtp-Source: ABdhPJwMkVsA1BLHMtRqLUUCTAcHp5NIl5gxKu4FkD0XjJMVD0wyQBrON+z8uQVz7LZ0FvXXeFFUEg==
X-Received: by 2002:a65:614e:0:b0:380:bfd9:d4ea with SMTP id
 o14-20020a65614e000000b00380bfd9d4eamr7020955pgv.92.1650217497383; 
 Sun, 17 Apr 2022 10:44:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 32/60] target/arm: Update sysreg fields when redirecting
 for E2H
Date: Sun, 17 Apr 2022 10:43:58 -0700
Message-Id: <20220417174426.711829-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new_key is always non-zero during redirection,
so remove the if.  Update opc0 et al from the new key.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7c569a569a..aee195400b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5915,7 +5915,9 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
     for (i = 0; i < ARRAY_SIZE(aliases); i++) {
         const struct E2HAlias *a = &aliases[i];
-        ARMCPRegInfo *src_reg, *dst_reg;
+        ARMCPRegInfo *src_reg, *dst_reg, *new_reg;
+        uint32_t *new_key;
+        bool ok;
 
         if (a->feature && !a->feature(&cpu->isar)) {
             continue;
@@ -5934,19 +5936,28 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         g_assert(src_reg->opaque == NULL);
 
         /* Create alias before redirection so we dup the right data. */
-        if (a->new_key) {
-            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
-            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
-            bool ok;
+        new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
+        new_key = g_memdup(&a->new_key, sizeof(uint32_t));
 
-            new_reg->name = a->new_name;
-            new_reg->type |= ARM_CP_ALIAS;
-            /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
-            new_reg->access &= PL2_RW | PL3_RW;
+        new_reg->name = a->new_name;
+        new_reg->type |= ARM_CP_ALIAS;
+        /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
+        new_reg->access &= PL2_RW;
 
-            ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
-            g_assert(ok);
-        }
+#define E(X, N) \
+    ((X & CP_REG_ARM64_SYSREG_##N##_MASK) >> CP_REG_ARM64_SYSREG_##N##_SHIFT)
+
+        /* Update the sysreg fields */
+        new_reg->opc0 = E(a->new_key, OP0);
+        new_reg->opc1 = E(a->new_key, OP1);
+        new_reg->crn = E(a->new_key, CRN);
+        new_reg->crm = E(a->new_key, CRM);
+        new_reg->opc2 = E(a->new_key, OP2);
+
+#undef E
+
+        ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
+        g_assert(ok);
 
         src_reg->opaque = dst_reg;
         src_reg->orig_readfn = src_reg->readfn ?: raw_read;
-- 
2.25.1


