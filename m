Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AB5F1D91
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:26:55 +0200 (CEST)
Received: from localhost ([::1]:41438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefKI-0004Bd-Mr
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefGy-0006GI-KC
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:28 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:42726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefGw-0006DO-Ul
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:28 -0400
Received: by mail-qt1-x82e.google.com with SMTP id w2so4334795qtv.9
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sUrjBJ7dwQzpr5dWkCg6Vpf21komKkvxoPfjuiTQD48=;
 b=YqMh1wM8B6us+FgC9F+Y0msBRmrQt9992KTMWlqh0DIfeCSsH2RaKRHxX4GHO1B2KP
 YBSzOpDuIl9chCQiyY0l2tysMreZRfuxE+LKR6BtRopSCN2uNgyzD65/XpYC2w2xLfq0
 FIloio4N2J7DtHgBw45C5cRWWr15dXoSCufl549CTqLNttieMHNapW609i9jCVSDJGwl
 7zS2z4NJc6RCDgkLTwqbv2ykps/8HROGUf3EIyvDXXDSqwWcT7VCZ2JzIbhpqcK9cJpG
 5f4k59riCZxkg/fMCyzMpTkHknHTm9TvUPPINpef1CUyb4g971sldbKKSHbIVT+AUPsC
 Mbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sUrjBJ7dwQzpr5dWkCg6Vpf21komKkvxoPfjuiTQD48=;
 b=zoP+e+6IrndmO2TcWoiHs158biLFY5gEhajQ8tBwQl+h+svfzJDcRm8rwEAs3YMk4g
 EQ1hAr+ItT0aBxq697CV4+/bnEDOvVTY7wu0X2mu4ww4cr3Ugc2kVML5Cm51OgWZ355N
 69UCG4URdFUSlwc/sGZGVcoMgqmjR15G6LHfibnXvyNv2vTBP9xMbw1+r6ICreIjdkwC
 Gd3VULsD/3+Gwd0vjre/4xas/fNwwWpr+EI5JFnMI+mP8AWXzVwSKLyfVm2yRf+lcJmr
 ESbmPYhAEFAAapnJ+MJ3Pbs/+kQilDnBowZRUYyVIidujbce37JmYjIaV7ZNoAYCnFWA
 9bWg==
X-Gm-Message-State: ACrzQf0eYj7oSEXkp5ODtaTsuNXequDe7isE9zMnBTuaCfscT7eFo2pk
 vgIBZjniHd8LWajzP4y11sVQ0TsZf8mA7w==
X-Google-Smtp-Source: AMsMyM6Jtn8WNNY+4rgtKTSBlcaICjKXRMP+HW5sCeAEHq4YLxWfAni7vbLFJFUiS7my7dpjf8p8gA==
X-Received: by 2002:a05:622a:2c8:b0:35d:4b4d:57b0 with SMTP id
 a8-20020a05622a02c800b0035d4b4d57b0mr11032021qtx.307.1664641405917; 
 Sat, 01 Oct 2022 09:23:25 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 01/42] target/arm: Split s2walk_secure from ipa_secure in
 get_phys_addr
Date: Sat,  1 Oct 2022 09:22:37 -0700
Message-Id: <20221001162318.153420-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The starting security state comes with the translation regime,
not the current state of arm_is_secure_below_el3().

Create a new local variable, s2walk_secure, which does not need
to be written back to result->attrs.secure -- we compute that
value later, after the S2 walk is complete.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Do not modify ipa_secure, per review.
---
 target/arm/ptw.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2ddfc028ab..b8c494ad9f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2298,7 +2298,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             hwaddr ipa;
             int s1_prot;
             int ret;
-            bool ipa_secure;
+            bool ipa_secure, s2walk_secure;
             ARMCacheAttrs cacheattrs1;
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
@@ -2313,17 +2313,17 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
             ipa = result->phys;
             ipa_secure = result->attrs.secure;
-            if (arm_is_secure_below_el3(env)) {
-                if (ipa_secure) {
-                    result->attrs.secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
-                } else {
-                    result->attrs.secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
-                }
+            if (is_secure) {
+                /* Select TCR based on the NS bit from the S1 walk. */
+                s2walk_secure = !(ipa_secure
+                                  ? env->cp15.vstcr_el2 & VSTCR_SW
+                                  : env->cp15.vtcr_el2 & VTCR_NSW);
             } else {
                 assert(!ipa_secure);
+                s2walk_secure = false;
             }
 
-            s2_mmu_idx = (result->attrs.secure
+            s2_mmu_idx = (s2walk_secure
                           ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
             is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
 
@@ -2366,7 +2366,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                                     result->cacheattrs);
 
             /* Check if IPA translates to secure or non-secure PA space. */
-            if (arm_is_secure_below_el3(env)) {
+            if (is_secure) {
                 if (ipa_secure) {
                     result->attrs.secure =
                         !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
-- 
2.34.1


