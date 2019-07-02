Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAEB5D80C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 00:22:25 +0200 (CEST)
Received: from localhost ([::1]:57960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiRAO-0000Bb-8I
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 18:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46082)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hiR6r-0006ow-Q4
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hiR6m-0002VF-US
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:42 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:44548
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hiR6k-0002C8-SZ
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:39 -0400
Received: from host109-146-132-17.range109-146.btcentralplus.com
 ([109.146.132.17] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hiR3n-0004bu-N7; Tue, 02 Jul 2019 23:15:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 23:16:01 +0100
Message-Id: <20190702221606.21600-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190702221606.21600-1-mark.cave-ayland@ilande.co.uk>
References: <20190702221606.21600-1-mark.cave-ayland@ilande.co.uk>
X-SA-Exim-Connect-IP: 109.146.132.17
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PULL 1/6] sun4m: set default display type to TCX
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

Commit 6807874d55 "sun4m: obey -vga none" changed the sun4m machines so that
they could be started without a framebuffer installed, but as no default
display type was configured the machines would start in headless mode without
an explict -vga option.

Set the default display type for all sun4m machines to TCX so that they will
start with a framebuffer if one is not specifically requested.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc/sun4m.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 7e4f61fc3e..99f53e87f7 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1406,6 +1406,7 @@ static void ss5_class_init(ObjectClass *oc, void *data)
     mc->is_default = 1;
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    mc->default_display = "tcx";
 }
 
 static const TypeInfo ss5_type = {
@@ -1424,6 +1425,7 @@ static void ss10_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 4;
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    mc->default_display = "tcx";
 }
 
 static const TypeInfo ss10_type = {
@@ -1442,6 +1444,7 @@ static void ss600mp_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 4;
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    mc->default_display = "tcx";
 }
 
 static const TypeInfo ss600mp_type = {
@@ -1460,6 +1463,7 @@ static void ss20_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 4;
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
+    mc->default_display = "tcx";
 }
 
 static const TypeInfo ss20_type = {
@@ -1477,6 +1481,7 @@ static void voyager_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_SCSI;
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    mc->default_display = "tcx";
 }
 
 static const TypeInfo voyager_type = {
@@ -1494,6 +1499,7 @@ static void ss_lx_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_SCSI;
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
+    mc->default_display = "tcx";
 }
 
 static const TypeInfo ss_lx_type = {
@@ -1511,6 +1517,7 @@ static void ss4_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_SCSI;
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
+    mc->default_display = "tcx";
 }
 
 static const TypeInfo ss4_type = {
@@ -1528,6 +1535,7 @@ static void scls_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_SCSI;
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
+    mc->default_display = "tcx";
 }
 
 static const TypeInfo scls_type = {
@@ -1545,6 +1553,7 @@ static void sbook_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_SCSI;
     mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
+    mc->default_display = "tcx";
 }
 
 static const TypeInfo sbook_type = {
-- 
2.11.0


