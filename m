Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155B72CB762
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:41:05 +0100 (CET)
Received: from localhost ([::1]:41656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNhA-0006eQ-37
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCV-00030L-3e
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCE-0003gK-TL
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=blQkOkQT5PANCZvLAbElIYkBDvT14KbE8AXseKQwuXU=;
 b=Ct88SrI+1HHDw+/D5flplR1nEaamrIon4/o0Bb64DV5QY9xtqLIgVkVQ335lCXV8x6U0mI
 +PJBvcw5Bc59wSDKPc6rVfA3vbL5HXjFF7mJzePSlvMGpPuYDCwl45ow2nRYBaS0GMQYKv
 S8/AhMeCDE1Y9HJNYKJQRZ507V9vxIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-ejMA-8zHPKS9u2sgK4fRHg-1; Wed, 02 Dec 2020 03:09:04 -0500
X-MC-Unique: ejMA-8zHPKS9u2sgK4fRHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A0CA1006C81
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4616960854
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 036/113] arm: do not use ram_size global
Date: Wed,  2 Dec 2020 03:07:32 -0500
Message-Id: <20201202080849.4125477-37-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the machine properties instead.

Cc: qemu-ppc@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/aspeed.c         | 8 ++++----
 hw/display/pxa2xx_lcd.c | 5 +++--
 target/arm/arm-semi.c   | 3 ++-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0ef3f6b412..cc8ed6ec9c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -295,7 +295,7 @@ static void aspeed_machine_init(MachineState *machine)
     /*
      * This will error out if isize is not supported by memory controller.
      */
-    object_property_set_uint(OBJECT(&bmc->soc), "ram-size", ram_size,
+    object_property_set_uint(OBJECT(&bmc->soc), "ram-size", machine->ram_size,
                              &error_fatal);
 
     for (i = 0; i < sc->macs_num; i++) {
@@ -332,8 +332,8 @@ static void aspeed_machine_init(MachineState *machine)
     max_ram_size = object_property_get_uint(OBJECT(&bmc->soc), "max-ram-size",
                                             &error_abort);
     memory_region_init_io(&bmc->max_ram, NULL, &max_ram_ops, NULL,
-                          "max_ram", max_ram_size  - ram_size);
-    memory_region_add_subregion(&bmc->ram_container, ram_size, &bmc->max_ram);
+                          "max_ram", max_ram_size  - machine->ram_size);
+    memory_region_add_subregion(&bmc->ram_container, machine->ram_size, &bmc->max_ram);
 
     aspeed_board_init_flashes(&bmc->soc.fmc, bmc->fmc_model ?
                               bmc->fmc_model : amc->fmc_model);
@@ -378,7 +378,7 @@ static void aspeed_machine_init(MachineState *machine)
         aspeed_board_binfo.smp_loader_start = AST_SMP_MBOX_CODE;
     }
 
-    aspeed_board_binfo.ram_size = ram_size;
+    aspeed_board_binfo.ram_size = machine->ram_size;
     aspeed_board_binfo.loader_start = sc->memmap[ASPEED_DEV_SDRAM];
     aspeed_board_binfo.nb_cpus = sc->num_cpus;
 
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index ff90104b80..dfff994962 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -17,6 +17,7 @@
 #include "ui/console.h"
 #include "hw/arm/pxa.h"
 #include "ui/pixel_ops.h"
+#include "hw/boards.h"
 /* FIXME: For graphic_rotate. Should probably be done in common code.  */
 #include "sysemu/sysemu.h"
 #include "framebuffer.h"
@@ -305,7 +306,7 @@ static void pxa2xx_descriptor_load(PXA2xxLCDState *s)
             descptr = s->dma_ch[i].descriptor;
 
         if (!((descptr >= PXA2XX_SDRAM_BASE && descptr +
-                 sizeof(desc) <= PXA2XX_SDRAM_BASE + ram_size) ||
+                 sizeof(desc) <= PXA2XX_SDRAM_BASE + current_machine->ram_size) ||
                 (descptr >= PXA2XX_INTERNAL_BASE && descptr + sizeof(desc) <=
                  PXA2XX_INTERNAL_BASE + PXA2XX_INTERNAL_SIZE))) {
             continue;
@@ -850,7 +851,7 @@ static void pxa2xx_update_display(void *opaque)
             }
             fbptr = s->dma_ch[ch].source;
             if (!((fbptr >= PXA2XX_SDRAM_BASE &&
-                     fbptr <= PXA2XX_SDRAM_BASE + ram_size) ||
+                     fbptr <= PXA2XX_SDRAM_BASE + current_machine->ram_size) ||
                     (fbptr >= PXA2XX_INTERNAL_BASE &&
                      fbptr <= PXA2XX_INTERNAL_BASE + PXA2XX_INTERNAL_SIZE))) {
                 pxa2xx_dma_ber_set(s, ch);
diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index c892e0e674..f7b7bff522 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -37,6 +37,7 @@
 #include "exec/gdbstub.h"
 #include "qemu/cutils.h"
 #include "hw/arm/boot.h"
+#include "hw/boards.h"
 #endif
 
 #define TARGET_SYS_OPEN        0x01
@@ -1048,7 +1049,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             retvals[2] = ts->stack_base;
             retvals[3] = 0; /* Stack limit.  */
 #else
-            limit = ram_size;
+            limit = current_machine->ram_size;
             /* TODO: Make this use the limit of the loaded application.  */
             retvals[0] = rambase + limit / 2;
             retvals[1] = rambase + limit;
-- 
2.26.2



