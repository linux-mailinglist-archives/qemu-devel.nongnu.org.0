Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1987D58C679
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 12:33:38 +0200 (CEST)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL04m-00026F-Oc
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 06:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzH-0004tS-Ol; Mon, 08 Aug 2022 06:27:55 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzF-0001Px-FD; Mon, 08 Aug 2022 06:27:55 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M1XTJ2dpNz4xTs;
 Mon,  8 Aug 2022 20:27:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M1XTG2MNmz4x1K;
 Mon,  8 Aug 2022 20:27:46 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 02/22] ppc/ppc405: Introduce a PPC405 generic machine
Date: Mon,  8 Aug 2022 12:27:14 +0200
Message-Id: <20220808102734.133084-3-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808102734.133084-1-clg@kaod.org>
References: <20220808102734.133084-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=c6th=YM=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We will use this machine as a base to define the ref405ep and possibly
the PPC405 hotfoot board as found in the Linux kernel.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_boards.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 1a4e7588c584..96700be74d08 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -50,6 +50,15 @@
 
 #define USE_FLASH_BIOS
 
+#define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
+OBJECT_DECLARE_SIMPLE_TYPE(Ppc405MachineState, PPC405_MACHINE);
+
+struct Ppc405MachineState {
+    /* Private */
+    MachineState parent_obj;
+    /* Public */
+};
+
 /*****************************************************************************/
 /* PPC405EP reference board (IBM) */
 /* Standalone board with:
@@ -332,18 +341,34 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
 
     mc->desc = "ref405ep";
     mc->init = ref405ep_init;
-    mc->default_ram_size = 0x08000000;
-    mc->default_ram_id = "ef405ep.ram";
 }
 
 static const TypeInfo ref405ep_type = {
     .name = MACHINE_TYPE_NAME("ref405ep"),
-    .parent = TYPE_MACHINE,
+    .parent = TYPE_PPC405_MACHINE,
     .class_init = ref405ep_class_init,
 };
 
+static void ppc405_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "PPC405 generic machine";
+    mc->default_ram_size = 128 * MiB;
+    mc->default_ram_id = "ppc405.ram";
+}
+
+static const TypeInfo ppc405_machine_type = {
+    .name = TYPE_PPC405_MACHINE,
+    .parent = TYPE_MACHINE,
+    .instance_size = sizeof(Ppc405MachineState),
+    .class_init = ppc405_machine_class_init,
+    .abstract = true,
+};
+
 static void ppc405_machine_init(void)
 {
+    type_register_static(&ppc405_machine_type);
     type_register_static(&ref405ep_type);
 }
 
-- 
2.37.1


