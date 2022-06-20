Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1EA5524A2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:37:13 +0200 (CEST)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NCx-0005x3-PH
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1o3Mz3-0003xI-A5; Mon, 20 Jun 2022 15:22:53 -0400
Received: from mail.csgraf.de ([85.25.223.15]:58860 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1o3Mz1-0007O7-89; Mon, 20 Jun 2022 15:22:48 -0400
Received: from localhost.localdomain
 (dynamic-077-007-106-140.77.7.pool.telefonica.de [77.7.106.140])
 by csgraf.de (Postfix) with ESMTPSA id 3FD9B6080647;
 Mon, 20 Jun 2022 21:22:44 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/2] target/arm: Catch invalid kvm state also for hvf
Date: Mon, 20 Jun 2022 21:22:42 +0200
Message-Id: <20220620192242.70573-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220620192242.70573-1-agraf@csgraf.de>
References: <20220620192242.70573-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Some features such as running in EL3 or running M profile code are
incompatible with virtualization as QEMU implements it today. To prevent
users from picking invalid configurations on other virt solutions like
Hvf, let's run the same checks there too.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1073
Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v1 -> v2:

  - Use current_accel_name()
  - Use !tcg_enabled()
---
 target/arm/cpu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b5d535788..0862dcd63c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1490,7 +1490,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    if (kvm_enabled()) {
+    if (!tcg_enabled()) {
         /*
          * Catch all the cases which might cause us to create more than one
          * address space for the CPU (otherwise we will assert() later in
@@ -1498,17 +1498,20 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         if (arm_feature(env, ARM_FEATURE_M)) {
             error_setg(errp,
-                       "Cannot enable KVM when using an M-profile guest CPU");
+                       "Cannot enable %s when using an M-profile guest CPU",
+                       current_accel_name());
             return;
         }
         if (cpu->has_el3) {
             error_setg(errp,
-                       "Cannot enable KVM when guest CPU has EL3 enabled");
+                       "Cannot enable %s when guest CPU has EL3 enabled",
+                       current_accel_name());
             return;
         }
         if (cpu->tag_memory) {
             error_setg(errp,
-                       "Cannot enable KVM when guest CPUs has MTE enabled");
+                       "Cannot enable %s when guest CPUs has MTE enabled",
+                       current_accel_name());
             return;
         }
     }
-- 
2.32.1 (Apple Git-133)


