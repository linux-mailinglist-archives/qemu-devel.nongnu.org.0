Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76405487A10
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 17:02:00 +0100 (CET)
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5rgl-0007Jc-AZ
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 11:01:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1n5rZY-0008FH-Om; Fri, 07 Jan 2022 10:54:33 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:56762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1n5rZU-00079O-O6; Fri, 07 Jan 2022 10:54:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1B70FB8265C;
 Fri,  7 Jan 2022 15:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC64C36AEB;
 Fri,  7 Jan 2022 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641570852;
 bh=lcWmzJBWTzN6IZGJco59IDlCHLecdqfcdN120DHVA9c=;
 h=From:To:Cc:Subject:Date:From;
 b=AGErxC5FWsuML0PXbOLrPOgoELhOX653fvjjKh1NZfOfhq4KZ5ZXUv1iJz83lffra
 rroHTQ/oxDbEAezLphhkcacEBevgCZWGUda1lBBCcplbRnOI13wZJHYajavhGgUCN9
 Uxs2BPVgaFUSBitkAf4jibj54ky/6hEKPkOmepYBXp0zvBe84k/27BuktvqcZVfPY1
 aVXyk+iJDAzf6M0j7IR/0ovbO4lmNToBXXzn3NCE+Zbjil6MmrVNP1QKIfeSG4vC80
 E78fQxMj3FRow4TQPaOHb9PZxiUNB1APscPfAOuXKqLfF/dE+lU/K3D8jpWazz3VT0
 CxMa/gE3qYRdA==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Subject: [PATCH] target/arm/cpu64: Use 32-bit GDBstub when running in 32-bit
 KVM mode
Date: Fri,  7 Jan 2022 16:54:06 +0100
Message-Id: <20220107155406.344273-1-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75; envelope-from=ardb@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex Bennee <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running under KVM, we may decide to run the CPU in 32-bit mode, by
setting the 'aarch64=off' CPU option. In this case, we need to switch to
the 32-bit version of the GDB stub too, so that GDB has the correct view
of the CPU state. Without this, GDB debugging does not work at all, and
errors out upon connecting to the target with a mysterious 'g' packet
length error.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex Bennee <alex.bennee@linaro.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 target/arm/cpu64.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 15245a60a8c7..3dede9e2ec31 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -903,9 +903,15 @@ static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
     return arm_feature(&cpu->env, ARM_FEATURE_AARCH64);
 }
 
+static gchar *arm_gdb_arch_name(CPUState *cs)
+{
+    return g_strdup("arm");
+}
+
 static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    CPUClass *cc = CPU_GET_CLASS(obj);
 
     /* At this time, this property is only allowed if KVM is enabled.  This
      * restriction allows us to avoid fixing up functionality that assumes a
@@ -919,6 +925,12 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
             return;
         }
         unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
+
+        cc->gdb_read_register = arm_cpu_gdb_read_register;
+        cc->gdb_write_register = arm_cpu_gdb_write_register;
+        cc->gdb_num_core_regs = 26;
+        cc->gdb_core_xml_file = "arm-core.xml";
+        cc->gdb_arch_name = arm_gdb_arch_name;
     } else {
         set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     }
-- 
2.30.2


