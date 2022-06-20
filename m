Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B375521FA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:12:28 +0200 (CEST)
Received: from localhost ([::1]:43410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3K0p-00005F-Js
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1o3JxE-0004uL-KB; Mon, 20 Jun 2022 12:08:44 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48660 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1o3JxC-0001it-7t; Mon, 20 Jun 2022 12:08:44 -0400
Received: from localhost.localdomain
 (dynamic-077-007-106-140.77.7.pool.telefonica.de [77.7.106.140])
 by csgraf.de (Postfix) with ESMTPSA id 097ED6080263;
 Mon, 20 Jun 2022 18:08:21 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Catch invalid kvm state also for hvf
Date: Mon, 20 Jun 2022 18:08:19 +0200
Message-Id: <20220620160819.65191-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
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
users from picking invalid configurations on Hvf as well, let's run the
same checks there as well.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1073
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b5d535788..03510f29f9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1490,7 +1490,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    if (kvm_enabled()) {
+    if (kvm_enabled() || hvf_enabled()) {
         /*
          * Catch all the cases which might cause us to create more than one
          * address space for the CPU (otherwise we will assert() later in
@@ -1498,17 +1498,17 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         if (arm_feature(env, ARM_FEATURE_M)) {
             error_setg(errp,
-                       "Cannot enable KVM when using an M-profile guest CPU");
+                       "Cannot enable KVM or HVF when using an M-profile guest CPU");
             return;
         }
         if (cpu->has_el3) {
             error_setg(errp,
-                       "Cannot enable KVM when guest CPU has EL3 enabled");
+                       "Cannot enable KVM or HVF when guest CPU has EL3 enabled");
             return;
         }
         if (cpu->tag_memory) {
             error_setg(errp,
-                       "Cannot enable KVM when guest CPUs has MTE enabled");
+                       "Cannot enable KVM or HVF when guest CPUs has MTE enabled");
             return;
         }
     }
-- 
2.32.1 (Apple Git-133)


