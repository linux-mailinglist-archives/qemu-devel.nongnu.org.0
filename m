Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBB5516235
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:26:42 +0200 (CEST)
Received: from localhost ([::1]:33334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl32X-0006Zj-MF
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2To-0006t4-9J
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tl-0001HX-Hd
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:48 -0400
Received: by mail-pj1-x1031.google.com with SMTP id r9so10320663pjo.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q2ExgRJeW51vJ/LQ9D7kCX+GyJ0sPJY/PZJuyp2uAOM=;
 b=cF7Ik4j1QClewU0d3USpi9rFwhvj7mid+0aJBmWrnyQS5cqrLqb/rjWgWFmlulc+OD
 PwQao7NCZYcf0JNFT1YXuwKKPpBhGha/2AaSyGHEKaeDovGBeHPBf+xGeRlbZrs45OnG
 MSP86MiQFKp8P3iB2bLfuzdtwUDCMkhHB0aNLqyA3IFkVGTrMi8/XXk8rc884GTHfELq
 bDB9JaH7DoCDlHcNfgS+EPturReN3FwN5pEBVBdD/HNVTNkOq5Eo5MK+gjx8zyzfqgLO
 fjoX20WNw36TdvJx/nFd8tQYSmmXJYv6ACNNN+NaJ/DcODhzK+8LXDFrfvrX9Jl/vMlk
 GobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q2ExgRJeW51vJ/LQ9D7kCX+GyJ0sPJY/PZJuyp2uAOM=;
 b=aAVv59ivsjjxX0cON0mr1qyNYgHZnkmIBWYbecH/w9JH0mPnCKPekNq7EXjimBMxJZ
 ANNHaLsjbNf/wkcgnwhCuHDctCfLyJIyvdxjTxMPimUInv/PuClWgFFxlGmpu+zPE9uV
 Er19RfhiEBfXhnouAYbmx+ffv+lrCsEVwnehEr0OiOVP88lsC54B84paOsbssnHzwtA5
 /6RkWUPwXaN3StaMOmpGyFT22rWEfQzbeLr9aq9CmjegWeCoKuL0hy0QVgOzy834l2HB
 /D3Mb1F+sspKE2lG3rij8qQtwO81jkmaSn0t6U2xh85vnnpysT3tiTX0dZfY1JX00odN
 2cvg==
X-Gm-Message-State: AOAM530DyThhyiTsD5erwG6kZyWuBPjmoo7UABwMfPj05KXdEl23rtEz
 IC/qDvsko4N8Z8eD1SgFh2N4Aco2HlI3NQ==
X-Google-Smtp-Source: ABdhPJx8CHRTUYeTdEs3NT/R3KC/cqJWDB3mIv4nCmY6pz9lQ9uwy5/7a4wcsKWCcFuagn8gKSA2XA==
X-Received: by 2002:a17:90a:784b:b0:1db:dfe6:5d54 with SMTP id
 y11-20020a17090a784b00b001dbdfe65d54mr6973732pjl.112.1651384243486; 
 Sat, 30 Apr 2022 22:50:43 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/45] target/arm: Consolidate cpreg updates in
 add_cpreg_to_hashtable
Date: Sat, 30 Apr 2022 22:49:56 -0700
Message-Id: <20220501055028.646596-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Put most of the value writeback to the same place,
and improve the comment that goes with them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 118422d672..b2887d63b6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8543,10 +8543,19 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
     *r2 = *r;
     r2->name = memcpy(r2 + 1, name, name_len);
 
-    /* Reset the secure state to the specific incoming state.  This is
-     * necessary as the register may have been defined with both states.
+    /*
+     * Update fields to match the instantiation, overwiting wildcards
+     * such as CP_ANY, ARM_CP_STATE_BOTH, or ARM_CP_SECSTATE_BOTH.
      */
+    r2->cp = cp;
+    r2->crm = crm;
+    r2->opc1 = opc1;
+    r2->opc2 = opc2;
+    r2->state = state;
     r2->secure = secstate;
+    if (opaque) {
+        r2->opaque = opaque;
+    }
 
     if (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1]) {
         /* Register is banked (using both entries in array).
@@ -8587,20 +8596,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
 #endif
         }
     }
-    if (opaque) {
-        r2->opaque = opaque;
-    }
-    /* reginfo passed to helpers is correct for the actual access,
-     * and is never ARM_CP_STATE_BOTH:
-     */
-    r2->state = state;
-    /* Make sure reginfo passed to helpers for wildcarded regs
-     * has the correct crm/opc1/opc2 for this reg, not CP_ANY:
-     */
-    r2->cp = cp;
-    r2->crm = crm;
-    r2->opc1 = opc1;
-    r2->opc2 = opc2;
+
     /* By convention, for wildcarded registers only the first
      * entry is used for migration; the others are marked as
      * ALIAS so we don't try to transfer the register
-- 
2.34.1


