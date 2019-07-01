Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B91FC29
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 23:21:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hR11z-0006Va-5t
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 17:01:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hR0ri-0006EQ-V9
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:51:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hR0rg-0001TM-MX
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:51:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hR0rg-0001RT-Fj
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:51:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF5B1307D987;
	Wed, 15 May 2019 20:51:03 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-17.ams2.redhat.com
	[10.36.112.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80D3E5C557;
	Wed, 15 May 2019 20:51:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 15 May 2019 22:50:24 +0200
Message-Id: <1557953433-19663-13-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1557953433-19663-1-git-send-email-pbonzini@redhat.com>
References: <1557953433-19663-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 15 May 2019 20:51:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 12/21] mips-fulong2e: obey -vga none
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not create an ATI VGA if "-vga none" was passed on the command line.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/mips/mips_fulong2e.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 9d7480e..05a5a82 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -349,10 +349,12 @@ static void mips_fulong2e_init(MachineState *machine)
                                &smbus, &isa_bus);
 
     /* GPU */
-    dev = DEVICE(pci_create(pci_bus, -1, "ati-vga"));
-    qdev_prop_set_uint32(dev, "vgamem_mb", 16);
-    qdev_prop_set_uint16(dev, "x-device-id", 0x5159);
-    qdev_init_nofail(dev);
+    if (vga_interface_type != VGA_NONE) {
+        dev = DEVICE(pci_create(pci_bus, -1, "ati-vga"));
+        qdev_prop_set_uint32(dev, "vgamem_mb", 16);
+        qdev_prop_set_uint16(dev, "x-device-id", 0x5159);
+        qdev_init_nofail(dev);
+    }
 
     /* Populate SPD eeprom data */
     spd_data = spd_data_generate(DDR, ram_size, &err);
-- 
1.8.3.1



