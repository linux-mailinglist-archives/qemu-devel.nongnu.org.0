Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2D645A2A8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 13:31:31 +0100 (CET)
Received: from localhost ([::1]:44844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpUxO-0001cP-G9
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 07:31:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mpUvA-0000T5-Ff; Tue, 23 Nov 2021 07:29:12 -0500
Received: from mail.csgraf.de ([85.25.223.15]:43376 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mpUv8-0007ts-9F; Tue, 23 Nov 2021 07:29:12 -0500
Received: from localhost.localdomain
 (dynamic-077-002-101-238.77.2.pool.telefonica.de [77.2.101.238])
 by csgraf.de (Postfix) with ESMTPSA id 966D86080235;
 Tue, 23 Nov 2021 13:29:00 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: Extend nested and mte checks to hvf
Date: Tue, 23 Nov 2021 13:28:59 +0100
Message-Id: <20211123122859.22452-1-agraf@csgraf.de>
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
 saar amar <saaramar5@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virt machine has properties to enable MTE and Nested Virtualization
support. However, its check to ensure the backing accel implementation
supports it today only looks for KVM and bails out if it finds it.

Extend the checks to HVF as well as it does not support either today.

Reported-by: saar amar <saaramar5@gmail.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 hw/arm/virt.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 369552ad45..30da05dfe0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -49,6 +49,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/tpm.h"
 #include "sysemu/kvm.h"
+#include "sysemu/hvf.h"
 #include "hw/loader.h"
 #include "qapi/error.h"
 #include "qemu/bitops.h"
@@ -1969,15 +1970,17 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "Virtualization extensions to the guest CPU");
+    if (vms->virt && (kvm_enabled() || hvf_enabled())) {
+        error_report("mach-virt: %s does not support providing "
+                     "Virtualization extensions to the guest CPU",
+                     kvm_enabled() ? "KVM" : "HVF");
         exit(1);
     }
 
-    if (vms->mte && kvm_enabled()) {
-        error_report("mach-virt: KVM does not support providing "
-                     "MTE to the guest CPU");
+    if (vms->mte && (kvm_enabled() || hvf_enabled())) {
+        error_report("mach-virt: %s does not support providing "
+                     "MTE to the guest CPU",
+                     kvm_enabled() ? "KVM" : "HVF");
         exit(1);
     }
 
-- 
2.30.1 (Apple Git-130)


