Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2109536C23
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:47:53 +0200 (CEST)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nut32-0003TS-ER
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscU-00061s-JM
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscO-0003zv-B3
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lru2PmE6GE8hnkukJ7PXqitB0Q/kZdxFvfuDZJnAxFg=; b=Cmj4nkOE7VNjaGFC7X6/Z9i07c
 Q454CInem20TRXuDBTBcWr6tgF4ViBj7TZGw+IR+JfYXK4HBv5/6CQqLDidoft/WbdFLU2WN9yq/a
 pPaCfxIo76wp9halAVKpr7iznoV98oCER4RjGX6G7/P61jKl2jx+KawIxFP7d1eYSzIJ/MdiA78km
 +CdhXHSbCEFVj4j4+i5qquSE3qJVB39XIbpU1qxYExzgpKF6afIICyiAjDeU9qWdVIiJVLN5oHDQU
 /IlwePkCFLWfkc9xcjv7KZEYUesiejKR0iUWXoXYCxxAmjRgm/eM8c9M45d8vLRZQyh6SWxuHeCFx
 4/8tHditKXK94WlIwV0BoMsDbUc2DyIJ5zQRyzS0bxd63YeFIJ/hL2SKWt6cn6zB9fOVPtjm4O9YX
 F/3rO5iI0JIo3EhCfmmV4HxfFaOS0cHvXLZ4ZP2BBP5DGAKA1ur/6y+1ynClRO9zPDRUOdcRhjo6q
 Bg4FRAKRYJkFBmjvHkAtVUKBZoTPWAeXqOC2eWjTuXMXzQjU56ZixOATDGfv9kQ5t8FmYNrfurl4x
 InJQKDw0r+BSltcG1PPR2JuzytmfC4WRW1GWIkeKZueD207e2CU1GemS4t+kluMYkFVkGReFOY6hn
 HAJpfMuflWXwiv+w8JFSyxvlWuGCumDV3z1+1guJ8=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusbC-0003JL-Ui; Sat, 28 May 2022 10:19:07 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:29 +0100
Message-Id: <20220528091934.15520-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 07/12] hw/acpi/piix4: introduce piix4_pm_init() instance init
 function
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

Use the new piix4_pm_init() instance init function to initialise 2 separate qdev
gpios for the SCI and SMI IRQs.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/piix4.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index d897d2dee6..454fa34df1 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -497,6 +497,14 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     piix4_pm_add_properties(s);
 }
 
+static void piix4_pm_init(Object *obj)
+{
+    PIIX4PMState *s = PIIX4_PM(obj);
+
+    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+    qdev_init_gpio_out_named(DEVICE(obj), &s->smi_irq, "smi-irq", 1);
+}
+
 PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
                               qemu_irq sci_irq, qemu_irq smi_irq,
                               int smm_enabled)
@@ -663,6 +671,7 @@ static void piix4_pm_class_init(ObjectClass *klass, void *data)
 static const TypeInfo piix4_pm_info = {
     .name          = TYPE_PIIX4_PM,
     .parent        = TYPE_PCI_DEVICE,
+    .instance_init  = piix4_pm_init,
     .instance_size = sizeof(PIIX4PMState),
     .class_init    = piix4_pm_class_init,
     .interfaces = (InterfaceInfo[]) {
-- 
2.20.1


