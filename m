Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49636332984
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:01:52 +0100 (CET)
Received: from localhost ([::1]:41646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdrr-0007U4-Aa
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lJdJc-0003vh-9W
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lJdJV-0005ms-6A
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 108BEAF19;
 Tue,  9 Mar 2021 14:26:01 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v5 36/36] revert commit 6e937ba7f8fb90d66cb3781f7fed32fb4239556a
Date: Tue,  9 Mar 2021 15:25:44 +0100
Message-Id: <20210309142544.5020-37-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309142544.5020-1-cfontana@suse.de>
References: <20210309142544.5020-1-cfontana@suse.de>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this change breaks all tests, need to revert for now.

Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Sun Feb 21 23:26:15 2021 +0100

target/arm: Restrict v8M IDAU to TCG

Signed-off-by: Claudio Fontana <cfontana@suse.de>
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
index 2513c11bd3..a173c6c0a1 100644
--- a/target/arm/tcg/tcg-cpu-models.c
+++ b/target/arm/tcg/tcg-cpu-models.c
@@ -12,7 +12,6 @@
 #include "tcg-cpu.h"
 
 #include "internals.h"
-#include "target/arm/idau.h"
 #include "cpregs.h"
 #include "cpu32.h"
 
@@ -736,17 +735,10 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
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


