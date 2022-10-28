Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B02611027
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 13:57:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooNyz-00025Y-IK; Fri, 28 Oct 2022 07:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooNyd-0001jz-GO; Fri, 28 Oct 2022 07:56:43 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooNyZ-0006NG-Qi; Fri, 28 Oct 2022 07:56:43 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DA48A75A159;
 Fri, 28 Oct 2022 13:56:30 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BFA4775A150; Fri, 28 Oct 2022 13:56:30 +0200 (CEST)
Message-Id: <f9da172e486c1f57f8542c7c3cb0223cffa89b1f.1666957578.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666957578.git.balaton@eik.bme.hu>
References: <cover.1666957578.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 14/19] mac_newworld: Turn CORE99_VIA_CONFIG defines into an
 enum
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Fri, 28 Oct 2022 13:56:30 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This might allow the compiler to check values.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 37123daa6b..601ea518f8 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -95,15 +95,17 @@ typedef struct Core99MachineState Core99MachineState;
 DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
                          TYPE_CORE99_MACHINE)
 
-#define CORE99_VIA_CONFIG_CUDA     0x0
-#define CORE99_VIA_CONFIG_PMU      0x1
-#define CORE99_VIA_CONFIG_PMU_ADB  0x2
+typedef enum {
+    CORE99_VIA_CONFIG_CUDA = 0,
+    CORE99_VIA_CONFIG_PMU,
+    CORE99_VIA_CONFIG_PMU_ADB
+} Core99ViaConfig;
 
 struct Core99MachineState {
     /*< private >*/
     MachineState parent;
 
-    uint8_t via_config;
+    Core99ViaConfig via_config;
 };
 
 static void fw_cfg_boot_set(void *opaque, const char *boot_device,
-- 
2.30.6


