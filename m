Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A5F127AD9
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 13:17:14 +0100 (CET)
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiHDV-0001BB-9G
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 07:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51457)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiGo3-0002B5-Rg
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 06:50:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiGo1-0006cX-Gc
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 06:50:55 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:45286)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iiGo0-0006Vt-SV; Fri, 20 Dec 2019 06:50:53 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 8B5C796EF0;
 Fri, 20 Dec 2019 11:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1576842650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uUES1bGWs1gBar/RW2DjYPIV0ki2+EfqvldzJ2Hwv94=;
 b=FPbfoHzH4hndCmzkJyamc9yzdw9DCOtg8T1Z9FkqcSkqXCRYVOyALi8V7wLL0P6ecfT5Oq
 cUZ8N15PRlLvlyO5qqW4t43v1NfgaQyAwbWEsNCbi9eG55WsAgUMOqAgWH6TQfFIndvE19
 QUDO81Gov9yDv2XmXj8T1eUvLueOwI4=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/11] vl: replace deprecated qbus_reset_all registration
Date: Fri, 20 Dec 2019 12:50:34 +0100
Message-Id: <20191220115035.709876-11-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191220115035.709876-1-damien.hedde@greensocs.com>
References: <20191220115035.709876-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1576842650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uUES1bGWs1gBar/RW2DjYPIV0ki2+EfqvldzJ2Hwv94=;
 b=xPe2GUWhAedBEADFvnAhvIDMUWwwChiCkdRYr+PdTwyHyD63y+mv1gjQ+PinvNOhvfe4Q7
 BzReD+z8tlS9BblEZJ97fdR21+gC3bpgY/bw1Ry79Xav/rxO3i7DwkmhXeS0OYW5HNEm70
 bTqW+ezBQoPZ/xzCRkh6kOwbBJMnq6U=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576842650; a=rsa-sha256; cv=none;
 b=kFQsdvdjMxwmctnqUoWM7hZsdkZk9jYKuyb9Q8hML46IbBvyeGPPdjs7sPsWVlo4/qP2AR
 qQIQZRUzmqFs49dK2W3oXSKQnSp1/L4jlGp0dTfex6clHpr8hI/VY/LJk2FwfDaua5rIQe
 YxxBQTWW+QTLAkBMxwDAEbMRtTODVNM=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, cohuck@redhat.com,
 mark.burton@greensocs.com, qemu-s390x@nongnu.org, edgari@xilinx.com,
 pbonzini@redhat.com, philmd@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace deprecated qbus_reset_all by resettable_cold_reset_fn for
the sysbus reset registration.

Apart for the raspi machines, this does not impact the behavior
because:
+ at this point resettable just calls the old reset methods of devices
  and buses in the same order as qdev/qbus.
+ resettable handlers registered with qemu_register_reset are
  serialized; there is no interleaving.
+ eventual explicit calls to legacy reset API (device_reset or
  qdev/qbus_reset) inside this reset handler will not be masked out
  by resettable mechanism; they do not go through resettable api.

For the raspi machines, during the sysbus reset the sd-card is not
reset twice anymore but only once. This is a consequence of switching
both sysbus reset and changing parent to resettable; it detects the
second reset is not needed. This has no impact on the state after
reset; the sd-card reset method only reset local state and query
information from the block backend.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

The raspi reset change can be observed by using the following command
(reset will occurs, then do Ctrl-C to end qemu; no firmware is
given here).
qemu-system-aarch64 -M raspi3 \
    -trace resettable_phase_hold_exec \
    -trace qdev_update_parent_bus \
    -trace resettable_change_parent \
    -trace qdev_reset -trace qbus_reset

Before the patch, the qdev/qbus_reset traces show when reset method are
called. After the patch, the resettable_phase_hold_exec show when reset
method are called.

The traced reset order of the raspi3 is listed below. I've added empty
lines and the tree structure.

 +->bcm2835-peripherals reset
 |
 |       +->sd-card reset
 |   +->sd-bus reset
 +->bcm2835_gpio reset
 |      -> dev_update_parent_bus (move the sd-card on the sdhci-bus)
 |      -> resettable_change_parent
 |
 +->bcm2835-dma reset
 |
 |   +->bcm2835-sdhost-bus reset
 +->bcm2835-sdhost reset
 |
 |       +->sd-card (reset ONLY BEFORE BEFORE THE PATCH)
 |   +->sdhci-bus reset
 +->generic-sdhci reset
 |
 +->bcm2835-rng reset
 +->bcm2835-property reset
 +->bcm2835-fb reset
 +->bcm2835-mbox reset
 +->bcm2835-aux reset
 +->pl011 reset
 +->bcm2835-ic reset
 +->bcm2836-control reset
System reset

In both case, the sd-card is reset (being on bcm2835_gpio/sd-bus) then mo=
ved
to generic-sdhci/sdhci-bus by the bcm2835_gpio reset method.

Before the patch, it is then reset again being part of generic-sdhci/sdhc=
i-bus.
After the patch, it considered again for reset but its reset method is no=
t
called because it is already flagged as reset.
---
 vl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 94508300c3..3990fc4bbe 100644
--- a/vl.c
+++ b/vl.c
@@ -4260,7 +4260,15 @@ int main(int argc, char **argv, char **envp)
=20
     /* TODO: once all bus devices are qdevified, this should be done
      * when bus is created by qdev.c */
-    qemu_register_reset(qbus_reset_all_fn, sysbus_get_default());
+    /*
+     * TODO: If we had a main 'reset container' that the whole system
+     * lived in, we could reset that using the multi-phase reset
+     * APIs. For the moment, we just reset the sysbus, which will cause
+     * all devices hanging off it (and all their child buses, recursivel=
y)
+     * to be reset. Note that this will *not* reset any Device objects
+     * which are not attached to some part of the qbus tree!
+     */
+    qemu_register_reset(resettable_cold_reset_fn, sysbus_get_default());
     qemu_run_machine_init_done_notifiers();
=20
     if (rom_check_and_register_reset() !=3D 0) {
--=20
2.24.0


