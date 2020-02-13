Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7E315C0C1
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 15:56:28 +0100 (CET)
Received: from localhost ([::1]:54014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2Ful-0005Hw-2g
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 09:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2Fh9-0004dw-Ef
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2Fh7-0002AT-AS
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:23 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:33129)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2Fh7-000293-3q
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:21 -0500
Received: by mail-wm1-x342.google.com with SMTP id m10so7273305wmc.0
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 06:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PpjQIC0RqFe6Xqx3OKTth2xnBQFxNcA4Bz7zhZ8w2yo=;
 b=PmmZA9L+B0ZIdy4qnvFayRiSVN5eCh+0lOseJK+7gPXpAlRQGRz/ie3pIMjwlU2V3f
 C7ji/Qf7MeK2LBtIiiq+YZoaxSnogqS8zUujI3QSgu7p4E1OVb0GPttaqkzBWd+56RIH
 gXs0+AncGc5lCZxtWO/nsH4HStUL+/Mgdk+drSB25fFT2Qy4neSU6ZX1RoYUjUbDkLYu
 63+2IMFvJDTFufTDytx4EbSPKKH7hG/UAeYKF2tqvj7d7sq6qfj27Yw1XeUKnHwdTyT3
 df+2aoBg0QewMUJYm+hEWyZTUkmgDUrhSpIWEGny78YDzZ8y53/OVweKfNjS89W2ajOv
 HlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PpjQIC0RqFe6Xqx3OKTth2xnBQFxNcA4Bz7zhZ8w2yo=;
 b=HQm+/ENKdCD9x6nXPFtlIPy8X+qQjYi3RbvJcKL/HmiE2HKgS/gsMFTE9i3od+F1Tg
 nTfC7Fj52PRSNGSbrG7SyXLnFY9j0Hntk2NlSHv3ABUJ+jV2KFcg0RaiIICEuhf4c73d
 vncm0sKaJPwFq/Ks83qZAL6GvZ7j6k00VD3vD5D8hdP8Cg3be7khHh9Xz1WuIltUUJ/x
 HYRiKxJ5q3KnaZSgqSqfwz5qg/r4nsCEVSoPeaGxdoSUp6nnMCQKLDVi0gj11Qk/Ez2u
 95iTlke/nyE4fPvf4nUC9uuxUoPxl69V3VvIvVHzRoaPGwwyb6XBAayBEuraCcUrKkj8
 rEYA==
X-Gm-Message-State: APjAAAWYk6x2BHRVGq/e5JZEmhOvGnI7Py6NCdGB3IXcR2UuFqACYyh3
 Y94WQv4qhN5QeG6k7IvfuWpme6IUK5k=
X-Google-Smtp-Source: APXvYqy6VHJiUJ3s9COMa2n7I/BzvQJ5L0joeqs5NmZwNQXm3vCvi5mdBT2iPthMJ37szcyQt/+DVA==
X-Received: by 2002:a7b:c93a:: with SMTP id h26mr6493868wml.83.1581604939817; 
 Thu, 13 Feb 2020 06:42:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e22sm3362454wme.45.2020.02.13.06.42.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 06:42:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/46] target/arm: Implement UAO semantics
Date: Thu, 13 Feb 2020 14:41:27 +0000
Message-Id: <20200213144145.818-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213144145.818-1-peter.maydell@linaro.org>
References: <20200213144145.818-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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

We need only override the current condition under which
TBFLAG_A64.UNPRIV is set.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200208125816.14954-20-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 11a5f0be52f..366dbcf460d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12198,28 +12198,29 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     }
 
     /* Compute the condition for using AccType_UNPRIV for LDTR et al. */
-    /* TODO: ARMv8.2-UAO */
-    switch (mmu_idx) {
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_SE10_1:
-    case ARMMMUIdx_SE10_1_PAN:
-        /* TODO: ARMv8.3-NV */
-        flags = FIELD_DP32(flags, TBFLAG_A64, UNPRIV, 1);
-        break;
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-        /* TODO: ARMv8.4-SecEL2 */
-        /*
-         * Note that E20_2 is gated by HCR_EL2.E2H == 1, but E20_0 is
-         * gated by HCR_EL2.<E2H,TGE> == '11', and so is LDTR.
-         */
-        if (env->cp15.hcr_el2 & HCR_TGE) {
+    if (!(env->pstate & PSTATE_UAO)) {
+        switch (mmu_idx) {
+        case ARMMMUIdx_E10_1:
+        case ARMMMUIdx_E10_1_PAN:
+        case ARMMMUIdx_SE10_1:
+        case ARMMMUIdx_SE10_1_PAN:
+            /* TODO: ARMv8.3-NV */
             flags = FIELD_DP32(flags, TBFLAG_A64, UNPRIV, 1);
+            break;
+        case ARMMMUIdx_E20_2:
+        case ARMMMUIdx_E20_2_PAN:
+            /* TODO: ARMv8.4-SecEL2 */
+            /*
+             * Note that EL20_2 is gated by HCR_EL2.E2H == 1, but EL20_0 is
+             * gated by HCR_EL2.<E2H,TGE> == '11', and so is LDTR.
+             */
+            if (env->cp15.hcr_el2 & HCR_TGE) {
+                flags = FIELD_DP32(flags, TBFLAG_A64, UNPRIV, 1);
+            }
+            break;
+        default:
+            break;
         }
-        break;
-    default:
-        break;
     }
 
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
-- 
2.20.1


