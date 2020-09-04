Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415125D013
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 05:56:06 +0200 (CEST)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE2pZ-0000zI-Dv
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 23:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hd-0002pS-QU; Thu, 03 Sep 2020 23:47:55 -0400
Received: from ozlabs.org ([203.11.71.1]:34617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kE2hb-0004xe-V6; Thu, 03 Sep 2020 23:47:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BjNsr6Mrwz9sW3; Fri,  4 Sep 2020 13:47:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599191248;
 bh=nJoBs/BV0XUu7Aj0kMHw1zqSmXlXG1x5Ion9wGnErAY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oa+Fh3pExtd8QzuGsMh/KVDGk3AliNe+2pP3aTdGLZtTLMW3kFxlFHcuxZ3wBL3BG
 TJGd0gHt6Rq/QfVtyamRjuE17w/cFGhOF/ad75Izk+8G7lhN5wW6k/OeirLBuXZONf
 wkolxKxF90vdU/SL1bDRlT76XMu4D0FJ8R3F6clk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 19/30] mips/cps: Use start-powered-off CPUState property
Date: Fri,  4 Sep 2020 13:47:08 +1000
Message-Id: <20200904034719.673626-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904034719.673626-1-david@gibson.dropbear.id.au>
References: <20200904034719.673626-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 23:47:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 bauerman@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Also change creation of CPU object from cpu_create() to object_new() and
qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
possible to set a property after the object is realized.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Message-Id: <20200826055535.951207-6-bauerman@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/mips/cps.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 615e1a1ad2..23c0f87e41 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -52,9 +52,6 @@ static void main_cpu_reset(void *opaque)
     CPUState *cs = CPU(cpu);
 
     cpu_reset(cs);
-
-    /* All VPs are halted on reset. Leave powering up to CPC. */
-    cs->halted = 1;
 }
 
 static bool cpu_mips_itu_supported(CPUMIPSState *env)
@@ -76,7 +73,17 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
     bool saar_present = false;
 
     for (i = 0; i < s->num_vp; i++) {
-        cpu = MIPS_CPU(cpu_create(s->cpu_type));
+        cpu = MIPS_CPU(object_new(s->cpu_type));
+
+        /* All VPs are halted on reset. Leave powering up to CPC. */
+        if (!object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
+                                      errp)) {
+            return;
+        }
+
+        if (!qdev_realize_and_unref(DEVICE(cpu), NULL, errp)) {
+            return;
+        }
 
         /* Init internal devices */
         cpu_mips_irq_init_cpu(cpu);
-- 
2.26.2


