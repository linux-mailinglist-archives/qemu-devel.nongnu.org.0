Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04793328B1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:36:19 +0100 (CET)
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdT8-0004lE-JL
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lJdJL-0003WH-Mq
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:11 -0500
Received: from mx2.suse.de ([195.135.220.15]:45372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lJdJH-0005di-8m
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D178AEA3;
 Tue,  9 Mar 2021 14:25:55 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v5 19/36] target/arm: move arm_sctlr away from tcg helpers
Date: Tue,  9 Mar 2021 15:25:27 +0100
Message-Id: <20210309142544.5020-20-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309142544.5020-1-cfontana@suse.de>
References: <20210309142544.5020-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this function is used for kvm too, add it to the
cpu-common module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/cpu-common.c | 11 +++++++++++
 target/arm/tcg/helper.c | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index 540793e4c0..dc7a5049a7 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -274,3 +274,14 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
 }
 
 /* #endif TARGET_AARCH64 , see matching comment above */
+
+uint64_t arm_sctlr(CPUARMState *env, int el)
+{
+    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
+    if (el == 0) {
+        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
+        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
+            ? 2 : 1;
+    }
+    return env->cp15.sctlr_el[el];
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 5c5c916279..5878a0515c 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -1743,17 +1743,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-uint64_t arm_sctlr(CPUARMState *env, int el)
-{
-    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
-    if (el == 0) {
-        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
-        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
-             ? 2 : 1;
-    }
-    return env->cp15.sctlr_el[el];
-}
-
 /* Returns true if the stage 1 translation regime is using LPAE format page
  * tables. Used when raising alignment exceptions, whose FSR changes depending
  * on whether the long or short descriptor format is in use. */
-- 
2.26.2


