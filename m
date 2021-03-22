Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA685344780
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:38:40 +0100 (CET)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLhX-0004st-Ug
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL94-0005Yp-Vd
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:03:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:44806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOL92-0005LT-2a
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:03:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 114FCAF49;
 Mon, 22 Mar 2021 14:02:26 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v10 36/49] Revert "target/arm: Restrict v8M IDAU to TCG"
Date: Mon, 22 Mar 2021 15:01:53 +0100
Message-Id: <20210322140206.9513-37-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322140206.9513-1-cfontana@suse.de>
References: <20210322140206.9513-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 6e937ba7f8fb90d66cb3781f7fed32fb4239556a

This change breaks quickly at startup, as all interfaces in boards
are checked in vl.c in select_machine():
{
  GSList *machines = object_class_get_list(TYPE_MACHINE, false);
}

In order to restrict v8M IDAU to TCG,
we need to first disable all incompatible boards when building
only KVM.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c                | 7 +++++++
 target/arm/tcg/tcg-cpu-models.c | 8 --------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 31f1b3df09..353cd652bc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1510,9 +1510,16 @@ static const TypeInfo arm_cpu_type_info = {
     .class_init = arm_cpu_class_init,
 };
 
+static const TypeInfo idau_interface_type_info = {
+    .name = TYPE_IDAU_INTERFACE,
+    .parent = TYPE_INTERFACE,
+    .class_size = sizeof(IDAUInterfaceClass),
+};
+
 static void arm_cpu_register_types(void)
 {
     type_register_static(&arm_cpu_type_info);
+    type_register_static(&idau_interface_type_info);
 
 #ifdef CONFIG_KVM
     type_register_static(&host_arm_cpu_type_info);
diff --git a/target/arm/tcg/tcg-cpu-models.c b/target/arm/tcg/tcg-cpu-models.c
index f4eea544b3..16ab5d5364 100644
--- a/target/arm/tcg/tcg-cpu-models.c
+++ b/target/arm/tcg/tcg-cpu-models.c
@@ -12,7 +12,6 @@
 #include "tcg-cpu.h"
 
 #include "internals.h"
-#include "target/arm/idau.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/boards.h"
 #endif
@@ -987,17 +986,10 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
 #endif
 };
 
-static const TypeInfo idau_interface_type_info = {
-    .name = TYPE_IDAU_INTERFACE,
-    .parent = TYPE_INTERFACE,
-    .class_size = sizeof(IDAUInterfaceClass),
-};
-
 static void arm_tcg_cpu_register_types(void)
 {
     size_t i;
 
-    type_register_static(&idau_interface_type_info);
     for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
         arm32_cpu_register(&arm_tcg_cpus[i]);
     }
-- 
2.26.2


