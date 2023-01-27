Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B026D67ECDE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:58:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSx3-0000wd-IF; Fri, 27 Jan 2023 12:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwo-0000oR-Hy
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:35 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00060H-I6
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:34 -0500
Received: by mail-wr1-x435.google.com with SMTP id n7so5684227wrx.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HS55RKKRetN93F2NWMHY8F2JBNqkHa0rbeTZy521S+g=;
 b=BTOuE5ymc0YAs+KZoRVcBd/LbrCUuuEo+CfbbyCQLmjBDwmdsvbXaozOjKANPmuKjd
 hbB4HodnootEI+bVM6eeXv/Em95QTEQzjd1lP8ttwbqm1QJw5Hu4F14ouxIJgH+w28AD
 1YodUnOEk3zPIxc2JCfmWD7YT1TB0MiUFhJFpvXNFxQdx7cHRBgEC3dm9rY3iOKhvP4P
 ILyaDWk1yVQ1jMAMXlvXhtjO6pYDQFlLCC4HMMoZZdDngqavJsZ21gQrihsXDc3Hutcv
 IuY7soSc6ra1XgO47PTFxemidmS5PFJSrAh7xNENXSw5wUcqWxXTIjj35JoqUuPlxVVT
 mQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HS55RKKRetN93F2NWMHY8F2JBNqkHa0rbeTZy521S+g=;
 b=65Ko+6QACns96EqiK95N8eU4xBVfJQOmV2aBOwZuefsiA3CpI0Ww+3nooeIwFWosZq
 yAfrcQepxJzNlD+zytqOi0hXK3WoKZpNVvGXx0/77QsrmQ51q1g95Dq4g4C62mDovRPp
 P4/d3+gkHBlHkK9I/BjqGOlfzngMwLW7yADGeMxAMff/07kjF976PO6VaUebfDq8vtDa
 31CPBQwZyAUV60aPupIaPNOU/BKzxmI6AONQNtMgo8FjxPNIc7yUNDjA60Pz6NJKZUPh
 mEVhjdmRXwLPwzek+mz1XZluK8RO6fC6oRCQQJ9hwkbmJlKW+cJQEVnIRn5Gs8X29Bgf
 mwNg==
X-Gm-Message-State: AO0yUKUjfQvwt9MTV8oKeRvK1fAo8JYK4Yn95c1xjIsqty9acJGbzPsN
 ++VM+Q49PHxowv3usfW5Yr62eA==
X-Google-Smtp-Source: AK7set9zGrvb4zgrOC04Cpr1HOoZpKDcmUnryVpiFkXRyHQ6D21qDzpOhiRC1PGmV7C94V9pDOE25w==
X-Received: by 2002:a5d:45c6:0:b0:2bf:bfb7:2fde with SMTP id
 b6-20020a5d45c6000000b002bfbfb72fdemr8366586wrs.30.1674842115757; 
 Fri, 27 Jan 2023 09:55:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/23] target/arm: All UNDEF-at-EL0 traps take priority over
 HSTR_EL2 traps
Date: Fri, 27 Jan 2023 17:54:49 +0000
Message-Id: <20230127175507.2895013-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The HSTR_EL2 register has a collection of trap bits which allow
trapping to EL2 for AArch32 EL0 or EL1 accesses to coprocessor
registers.  The specification of these bits is that when the bit is
set we should trap
 * EL1 accesses
 * EL0 accesses, if the access is not UNDEFINED when the
   trap bit is 0

In other words, all UNDEF traps from EL0 to EL1 take precedence over
the HSTR_EL2 trap to EL2.  (Since this is all AArch32, the only kind
of trap-to-EL1 is the UNDEF.)

Our implementation doesn't quite get this right -- we check for traps
in the order:
 * no such register
 * ARMCPRegInfo::access bits
 * HSTR_EL2 trap bits
 * ARMCPRegInfo::accessfn

So UNDEFs that happen because of the access bits or because the
register doesn't exist at all correctly take priority over the
HSTR_EL2 trap, but where a register can UNDEF at EL0 because of the
accessfn we are incorrectly always taking the HSTR_EL2 trap.  There
aren't many of these, but one example is the PMCR; if you look at the
access pseudocode for this register you can see that UNDEFs taken
because of the value of PMUSERENR.EN are checked before the HSTR_EL2
bit.

Rearrange helper_access_check_cp_reg() so that we always call the
accessfn, and use its return value if it indicates that the access
traps to EL0 rather than continuing to do the HSTR_EL2 check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index def5d3515e2..660dae696dd 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -640,10 +640,24 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         goto fail;
     }
 
+    if (ri->accessfn) {
+        res = ri->accessfn(env, ri, isread);
+    }
+
     /*
-     * Check for an EL2 trap due to HSTR_EL2. We expect EL0 accesses
-     * to sysregs non accessible at EL0 to have UNDEF-ed already.
+     * If the access function indicates a trap from EL0 to EL1 then
+     * that always takes priority over the HSTR_EL2 trap. (If it indicates
+     * a trap to EL3, then the HSTR_EL2 trap takes priority; if it indicates
+     * a trap to EL2, then the syndrome is the same either way so we don't
+     * care whether technically the architecture says that HSTR_EL2 trap or
+     * the other trap takes priority. So we take the "check HSTR_EL2" path
+     * for all of those cases.)
      */
+    if (res != CP_ACCESS_OK && ((res & CP_ACCESS_EL_MASK) == 0) &&
+        arm_current_el(env) == 0) {
+        goto fail;
+    }
+
     if (!is_a64(env) && arm_current_el(env) < 2 && ri->cp == 15 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         uint32_t mask = 1 << ri->crn;
@@ -661,9 +675,6 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         }
     }
 
-    if (ri->accessfn) {
-        res = ri->accessfn(env, ri, isread);
-    }
     if (likely(res == CP_ACCESS_OK)) {
         return ri;
     }
-- 
2.34.1


