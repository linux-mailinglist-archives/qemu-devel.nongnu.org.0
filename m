Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335344F778
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 11:57:54 +0100 (CET)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmDCr-0007lP-9X
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 05:57:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mmDBz-0006fT-Cq; Sun, 14 Nov 2021 05:56:59 -0500
Received: from mail.csgraf.de ([85.25.223.15]:39320 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mmDBu-00034M-Gr; Sun, 14 Nov 2021 05:56:58 -0500
Received: from localhost.localdomain
 (dynamic-095-118-029-131.95.118.pool.telefonica.de [95.118.29.131])
 by csgraf.de (Postfix) with ESMTPSA id 27F376080090;
 Sun, 14 Nov 2021 11:56:46 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-arm@nongnu.org
Subject: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
Date: Sun, 14 Nov 2021 11:56:45 +0100
Message-Id: <20211114105645.16841-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Andrei Warkentin <andrey.warkentin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we expose an SMC conduit, we're implicitly telling the guest that
there is EL3 available because it needs to call it. While that EL3 then
is not backed by the emulated CPU, from the guest's EL2 point of view,
it still means there is an EL3 to call into.

This is a problem for VMware ESXi, which validates EL3 availability before
doing SMC calls. With this patch, VMware ESXi works with SMP in TCG.

Reported-by: Andrei Warkentin <andrey.warkentin@gmail.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/cpu.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a211804fd3..21092c5242 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1782,11 +1782,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         unset_feature(env, ARM_FEATURE_EL3);
 
-        /* Disable the security extension feature bits in the processor feature
-         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
-         */
-        cpu->isar.id_pfr1 &= ~0xf0;
-        cpu->isar.id_aa64pfr0 &= ~0xf000;
+        if (cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
+            /*
+             * We tell the guest to use SMC calls into EL3 for PSCI calls, so
+             * there has to be EL3 available. We merely execute it on the host
+             * in QEMU rather than in actual EL3 inside the guest.
+             */
+        } else {
+            /*
+             * Disable the security extension feature bits in the processor
+             * feature registers as well. These are id_pfr1[7:4] and
+             * id_aa64pfr0[15:12].
+             */
+            cpu->isar.id_pfr1 &= ~0xf0;
+            cpu->isar.id_aa64pfr0 &= ~0xf000;
+        }
     }
 
     if (!cpu->has_el2) {
-- 
2.30.1 (Apple Git-130)


