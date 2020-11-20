Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A6B2BAD28
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:12:22 +0100 (CET)
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg85F-0007Mo-Mk
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1kg7E9-0002tW-5h; Fri, 20 Nov 2020 09:17:29 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221]:35314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1kg7E7-0002iK-1D; Fri, 20 Nov 2020 09:17:28 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id A652226036D;
 Fri, 20 Nov 2020 15:17:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ol5HqVUr2XQl; Fri, 20 Nov 2020 15:17:20 +0100 (CET)
Received: from puchatek.local (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 09EC026026E; 
 Fri, 20 Nov 2020 15:17:19 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Subject: [PATCH] sbsa-ref: allow to use Cortex-A53/57/72 cpus
Date: Fri, 20 Nov 2020 15:17:05 +0100
Message-Id: <20201120141705.246690-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 Nov 2020 10:11:12 -0500
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Rados=C5=82aw=20Biernacki?= <rad@semihalf.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trusted Firmware now supports A72 on sbsa-ref by default [1] so enable
it for QEMU as well. A53 was already enabled there.

1. https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7117

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
index 7d9e180c0d..b9909279f1 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -143,6 +143,24 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_GWDT] = 16,
 };
 
+static const char *valid_cpus[] = {
+    ARM_CPU_TYPE_NAME("cortex-a53"),
+    ARM_CPU_TYPE_NAME("cortex-a57"),
+    ARM_CPU_TYPE_NAME("cortex-a72"),
+};
+
+static bool cpu_type_valid(const char *cpu)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
+        if (strcmp(cpu, valid_cpus[i]) == 0) {
+            return true;
+        }
+    }
+    return false;
+}
+
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
 {
     uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
@@ -649,9 +667,8 @@ static void sbsa_ref_init(MachineState *machine)
     const CPUArchIdList *possible_cpus;
     int n, sbsa_max_cpus;
 
-    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
-        error_report("sbsa-ref: CPU type other than the built-in "
-                     "cortex-a57 not supported");
+    if (!cpu_type_valid(machine->cpu_type)) {
+        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
         exit(1);
     }
 
-- 
2.28.0


