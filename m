Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3B247D666
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:20:36 +0100 (CET)
Received: from localhost ([::1]:35552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06E7-0007kG-Gy
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:20:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in>)
 id 1n04p4-0005x2-JY
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:50:40 -0500
Received: from pnkfpfxf.outbound-mail.sendgrid.net ([50.31.63.175]:6230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in>)
 id 1n04oz-0002Ld-Ri
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 11:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svin.in;
 h=from:subject:in-reply-to:references:mime-version:
 content-transfer-encoding:to:cc:content-type;
 s=s1; bh=zLhmjiNW81yce1Sj4R/CiN5IVRZe4Fw0mhmrjXUjf58=;
 b=QE8BOvF1usHq4Vd1ZxihI/nIdF8CcU/VB5EtbAGLDgbhH9R/3mwrNm73ZZ5k2beFOMHB
 KrcAfnmGmVdZDgpAg6HN17h7XJaoyyRHeGOuu+I10ZW4EZnj4+lPt3sD2jlqjnq7wwIbjt
 eUHDRnSS6q25qaasRWY7Cr+Z6AhcCokAJc+HTYY9LFqqrxvob0g/oklMQRB/Abtl2daTIM
 70YDjqj/WZPgTT/sxbL1yUBwXhIzCj2hG3MB4k74no87ON+plTzdGloS4u7gsEoXfWufO3
 qxzy+Xl0TBz8HNHoJUkX6uthmiF51H2/4brZZRyUz3rlIte5OkxikAjm+OGkZN5w==
Received: by filterdrecv-75ff7b5ffb-wdd5z with SMTP id
 filterdrecv-75ff7b5ffb-wdd5z-1-61C35756-10
 2021-12-22 16:50:30.396739294 +0000 UTC m=+9657038.498015085
Received: from ne2.svin.in (unknown) by geopod-ismtpd-canary-0 (SG) with ESMTP
 id hmvWGZicSB2dPyS9f7qH-g Wed, 22 Dec 2021 16:50:29.934 +0000 (UTC)
Received: from authenticated-user (ne2.svin.in [152.70.50.15])
 by ne2.svin.in (Postfix) with ESMTPA id 3296017C09C;
 Wed, 22 Dec 2021 16:50:27 +0000 (UTC)
From: Oleg Vasilev <me@svin.in>
Subject: [RFC PATCH 1/2] target/arm: move regime_ttbr helper
Date: Wed, 22 Dec 2021 16:50:30 +0000 (UTC)
Message-Id: <20211222164947.634759-2-me@svin.in>
In-Reply-To: <20211222164947.634759-1-me@svin.in>
References: <20211222164947.634759-1-me@svin.in>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Authentication-Results: ne2.svin.in;
 auth=pass smtp.auth=admin@svin.in smtp.mailfrom=me@svin.in
X-Spamd-Bar: /
X-SG-EID: =?us-ascii?Q?vuv4bBSMv+s+sLXfbA0TX5eOZYkSPfNDFag09+IwHa3cTVRX1snJTadgqJKv5P?=
 =?us-ascii?Q?2zPXL7uUC6NwItvJ2jYL1lMb1xkBe=2F5F4MFlj6L?=
 =?us-ascii?Q?7JGFHUT+y8kcPndQ1Xap9ZUGSBvijTvkJeouvhH?=
 =?us-ascii?Q?kNieSAp8ynBxc2m6LvKy6hmmm0rTEq9X9b2Du+0?=
 =?us-ascii?Q?gx+DqXURbpkenmMOrnqBMG2J1V6RFPbbbBp5wth?=
 =?us-ascii?Q?rhHf1223X6ua8UwR+ZA7AoCX6fQi27qxSw5FXM?=
To: qemu-devel@nongnu.org
Cc: Oleg Vasilev <vasilev.oleg@huawei.com>, Alex =?iso-8859-1?q?Benn=E9e?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org, Oleg Vasilev <me@svin.in>,
 Peter Maydell <peter.maydell@linaro.org>
X-Entity-ID: R60PFX0ZT2z0LR3J/oF4GQ==
Content-Type: text/plain; charset=us-ascii
Received-SPF: pass client-ip=50.31.63.175;
 envelope-from=bounces+23648303-31c4-qemu-devel=nongnu.org@em7421.svin.in;
 helo=pnkfpfxf.outbound-mail.sendgrid.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 22 Dec 2021 13:16:15 -0500
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

From: Oleg Vasilev <vasilev.oleg@huawei.com>

Now it is available for other files to use.

CC: qemu-arm@nongnu.org
Signed-off-by: Oleg Vasilev <vasilev.oleg@huawei.com>
Signed-off-by: Oleg Vasilev <me@svin.in>
---
 target/arm/helper.c    | 17 -----------------
 target/arm/internals.h | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index db837d53bd..747c94fd95 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10275,23 +10275,6 @@ static inline bool regime_translation_big_endian(CPUARMState *env,
     return (regime_sctlr(env, mmu_idx) & SCTLR_EE) != 0;
 }
 
-/* Return the TTBR associated with this translation regime */
-static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
-                                   int ttbrn)
-{
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        return env->cp15.vttbr_el2;
-    }
-    if (mmu_idx == ARMMMUIdx_Stage2_S) {
-        return env->cp15.vsttbr_el2;
-    }
-    if (ttbrn == 0) {
-        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
-    } else {
-        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
-    }
-}
-
 #endif /* !CONFIG_USER_ONLY */
 
 /* Convert a possible stage1+2 MMU index into the appropriate
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 89f7610ebc..a288fe019b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1132,6 +1132,23 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
 void arm_log_exception(int idx);
 
+/* Return the TTBR associated with this translation regime */
+static inline uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                   int ttbrn)
+{
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        return env->cp15.vttbr_el2;
+    }
+    if (mmu_idx == ARMMMUIdx_Stage2_S) {
+        return env->cp15.vsttbr_el2;
+    }
+    if (ttbrn == 0) {
+        return env->cp15.ttbr0_el[regime_el(env, mmu_idx)];
+    } else {
+        return env->cp15.ttbr1_el[regime_el(env, mmu_idx)];
+    }
+}
+
 #endif /* !CONFIG_USER_ONLY */
 
 /*
-- 
2.33.1


