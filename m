Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7781516222
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:09:59 +0200 (CEST)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2mN-0006hc-1b
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tn-0006t1-CY
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:52 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tk-0001Gd-Cw
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:46 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so10458799pjf.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dAjLdTZkl7TID6iGw+1xQMd9kdTMVThmu014u7vMDQ=;
 b=n75sJf5xK2h9Le32WX0ruVufYI4OSQykxtXdUuSwrd8SppuA7gbZukcNvwjaHf01tJ
 keE0i9JkY3nABySd09/+eWfMl0vzrmtDjveiSCX7boRJ8+v6VuL1yrKjxY3ylc011grM
 ShjXaOEFlgRX7flwNlwwCCupZiWakLQwEW51MHejex09fLYnucPKTW3FejlBsScTuJ2u
 hXKYwB8t4Xe1O6wM5p/zV02xyLzDVdBbldy7+QAlNVjogZ9WNrAxYQvJjR327mhj0Fv9
 NdQhkWU8+IcNJBsgNw9DdtT5ELqDxv4zDW4X85lgVv7iecFBn4NERLnqvm2+92XWW6sD
 XSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7dAjLdTZkl7TID6iGw+1xQMd9kdTMVThmu014u7vMDQ=;
 b=TWPWhU1AUtXlfNkEW7Z1VH6+IXM+MzukAjQPJ7d8Bp82bgq4vt1zGGW7/CrQ/T0nYL
 MJU5FSVdhtKSucBLwg8jKPSy2NVaGHqvM0QF6C7JmXxTLEfNmELzVrBN78drIriyv+R5
 RTBu1vWlvQExMLCPEiR+dQwgxbC2uzzA/4BMXkjwt4sFY5JSZ/LUsXfGeZHKgibkoLmI
 mfv+ln+/oC+NTc/sgbtB9Ou96xZV9TPSOtX13kWegAkBRbssGj4ISQLrojccwhINgBx5
 Tx19wfZZfOEiVCmJ0Kpd8Exm8fMOzM5sY+i0tU14IRxraKfMhXa8xcClHiLLa6JNbMgq
 ddfQ==
X-Gm-Message-State: AOAM532tK1S90m4XqHMBRdOaLFqQS6foCqBvpgH5amZr4H1twtDBzSnJ
 JAHrgt9CkEwTrI9QkHKKisXUSgVRKJxsGw==
X-Google-Smtp-Source: ABdhPJzCOw9tnF2A35WONfn9Y0yxo7LiNeW1T/s8IDdMHa7L4UnjCtaOpKyN16pPO+WXR4MQdV311g==
X-Received: by 2002:a17:90b:3851:b0:1dc:4f70:1cb with SMTP id
 nl17-20020a17090b385100b001dc4f7001cbmr1366825pjb.167.1651384239772; 
 Sat, 30 Apr 2022 22:50:39 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/45] target/arm: Drop always-true test in
 define_arm_vh_e2h_redirects_aliases
Date: Sat, 30 Apr 2022 22:49:52 -0700
Message-Id: <20220501055028.646596-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new_key field is always non-zero -- drop the if.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Drop change to crn et al.
---
 target/arm/helper.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 50ad2e3e37..e5fc22bb69 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5914,7 +5914,9 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
     for (i = 0; i < ARRAY_SIZE(aliases); i++) {
         const struct E2HAlias *a = &aliases[i];
-        ARMCPRegInfo *src_reg, *dst_reg;
+        ARMCPRegInfo *src_reg, *dst_reg, *new_reg;
+        uint32_t *new_key;
+        bool ok;
 
         if (a->feature && !a->feature(&cpu->isar)) {
             continue;
@@ -5933,19 +5935,16 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
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
+        ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
+        g_assert(ok);
 
         src_reg->opaque = dst_reg;
         src_reg->orig_readfn = src_reg->readfn ?: raw_read;
-- 
2.34.1


