Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC2B536BF5
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:36:52 +0200 (CEST)
Received: from localhost ([::1]:42672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nussN-0002as-7F
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscX-00063W-AM
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscU-000405-Bd
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fkiJMYP2rjlmp7dbKR5lXxPE03sEoBm6K7IXsUlvyfk=; b=Fjw3OvTZGIwBy6vOHBDdWwVPgO
 DrP+QzSTLxtpH6ocFKwChPPUDDv7r9KX6sGNZhg/i+Kq4umm4igmz5SPU5riRu21Ri+eJUyBaepn5
 pS6/s4XCwGh56aPKj27hLtcxavputdRp3kqNhi99dz+YbBJZpJJDrmr3kq0/Iw9mDZ1JpYHhxSFIp
 qjxCb1oKnC058t78l0w/yPc57JFDCzj3kbAMuBCWQYFuW/Q3gF7Ybk4dQ2QKRk4idxugZgeSIPyle
 BHMSEfjKJ5A506/RYKyc1JIL6iXjdKTWS57KGwpTStmQGovC54Oy4EDlbeviYQEMV71ua2OB1qtvW
 KwgiI41nDJLSUwGxybMGnsUQ9XRqJ7/1YtZ7/KTKaiZnyofdWYgtljDNBo+/vh1MgJ6hQej96ySU1
 hBifmBmxHN5ekZrJiQTmqTaJ1XbwsXH3Omd0H4ZMHeitILJXkXSnO4NMM/+egAJDSLXn1nQr7KV0V
 wPnEPITsoG/VO7cVNwdqTBoutdiFG4q94AYM5R9z8gQlfi/R7CtIlCeWSKdjUtQ44PViCb4LqLbM2
 X2QKQXNfYKpnubuw+2B10jVO8vL8CxW04HYLf+eh4H8z6ZPY+rizIz6gRWE1FD2mEdCpQT9PlU/By
 Z5BgneozSNWgbVrUociqNJWB19N5azvugW2ZPQPpA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusbI-0003JL-I5; Sat, 28 May 2022 10:19:13 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:32 +0100
Message-Id: <20220528091934.15520-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 10/12] hw/i386/pc_piix: create PIIX4_PM device directly
 instead of using piix4_pm_initfn()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Now that all external logic has been removed from piix4_pm_initfn() the PIIX4_PM
device can be instantiated directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/i386/pc_piix.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 82696fc707..4120fd52e5 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -47,6 +47,7 @@
 #include "hw/xen/xen-x86.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/piix4.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -281,12 +282,16 @@ static void pc_init1(MachineState *machine,
     }
 
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
-        PIIX4PMState *piix4_pm;
+        PCIDevice *piix4_pm;
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
         /* TODO: Populate SPD eeprom data.  */
-        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100,
-                                   x86_machine_is_smm_enabled(x86ms));
+        piix4_pm = pci_new(piix3_devfn + 3, TYPE_PIIX4_PM);
+        qdev_prop_set_uint32(DEVICE(piix4_pm), "smb_io_base", 0xb100);
+        qdev_prop_set_bit(DEVICE(piix4_pm), "smm-enabled",
+                          x86_machine_is_smm_enabled(x86ms));
+        pci_realize_and_unref(piix4_pm, pci_bus, &error_fatal);
+
         qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
-- 
2.20.1


