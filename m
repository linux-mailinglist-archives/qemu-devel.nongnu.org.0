Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9B5E9979
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 08:32:14 +0200 (CEST)
Received: from localhost ([::1]:45598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ochf1-00079m-GH
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 02:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=8Ijc=Z5=kaod.org=clg@ozlabs.org>)
 id 1ochZV-0004Ax-SQ; Mon, 26 Sep 2022 02:26:30 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:56293
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=8Ijc=Z5=kaod.org=clg@ozlabs.org>)
 id 1ochZT-000614-91; Mon, 26 Sep 2022 02:26:29 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MbXp00Y9sz4xFt;
 Mon, 26 Sep 2022 16:26:16 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MbXnx0MDfz4x1K;
 Mon, 26 Sep 2022 16:26:12 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [RFC PATCH] ast2600: Fix CPU features
Date: Mon, 26 Sep 2022 08:26:08 +0200
Message-Id: <20220926062608.3930789-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=8Ijc=Z5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Currently, the CPU features exposed to the AST2600 QEMU machines are :

  half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
  vfpd32 lpae evtstrm

But, the features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC
are :

  half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt
  lpae evtstrm

The vfpv3d16 feature bit is common to both vfpv3 and vfpv4, and for
this SoC, QEMU should advertise a VFPv4 unit with 16 double-precision
registers, and not 32 registers.

Drop neon support and hack the default mvfr0 register value of the
cortex A7 to advertise 16 registers.

How can that be done cleanly ? Should we :

 * introduce a new A7 CPU with its own _initfn routine ?
 * introduce a new CPU property to set the number of "Advanced SIMD
   and floating-point" registers in arm_cpu_realizefn() ?

This problem was raised by a buildroot rootfs compiled with vfpv4.
Boot went fine under QEMU but on real HW, user space binaries had
issues with output. Compiling buildroot with vfpv4d16 fixed it and
I didn't dig further. Nevertheless, it would be nice to catch such
issues with QEMU.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c | 2 ++
 target/arm/cpu_tcg.c    | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index dcdc9bc54456..af987fd418ec 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -330,6 +330,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 
         object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
                                 &error_abort);
+        object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
+                                &error_abort);
         object_property_set_link(OBJECT(&s->cpu[i]), "memory",
                                  OBJECT(s->memory), &error_abort);
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 98b5ba216041..b3f93783a061 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -545,7 +545,7 @@ static void cortex_a7_initfn(Object *obj)
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
     cpu->midr = 0x410fc075;
     cpu->reset_fpsid = 0x41023075;
-    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr0 = 0x10110221; /* SIMDREG == 0x1 -> 16 registers */
     cpu->isar.mvfr1 = 0x11111111;
     cpu->ctr = 0x84448003;
     cpu->reset_sctlr = 0x00c50078;
-- 
2.37.3


