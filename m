Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CA6578A3C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:02:09 +0200 (CEST)
Received: from localhost ([::1]:54766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDW0M-00015C-Lo
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZv-0000Di-A6
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVZs-0005bk-Dc
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3GR/kcoJUD3F8/4XlPxw70KjCiSOtrXwknwgPYyjTXc=; b=Uajkyf6pRXg8QvoNhxpH66lacu
 +1enzJhzzPVOdcCxlSm2KQ8qJTIuWnjq1wCX2Z0cVRDoUd2EhbA6BTMsVsHi6ihlHGt/56uTkLVmG
 18P+M7lfgeG94bI3jJ7Da3eBtblt0JcFlGPcYuHqA/xIJNt59GFSvFaFbUvMmtMel7U8V3Samafes
 fte4Cok11nyDB1gn/zWyEOSBO9k6NY/+0KExFfHBSsQqaJqFLFMbHSFL4mcaD5H9JurTeUkeLGl7y
 CB46hgyVe+/TsumaFaf1WWWEMtVZ6GgWTsrTLWst7ItzdUCGjqBYR4GULm2ATB44jVIWnxByCdp/P
 hhOAotfbpfr50zF7zcr09wx2+hrkcqHfkoXTI3rqQ8tkVObPqSg8xL/LDamodzmUbprWBnWg6DgdC
 ZMNTiz3G8alontndpVoSBal42CG9wiZeN8OlvYr5kmH2tU8Y/p5IjOXHPs+c4v9T2BRqc/PLZatWF
 0lyUleEZSv1FY5cIW3HdacCOYtIWeBdoyAWRSs6fEwc9qgygnsA0OB5FsDXrL4ZY93BI3xJkR6Ni3
 vmiCTeC5EuDGuFDv6mXGUiUWnENQBrQrJdV4yIb9JUHz41Ru4uAwcBsFp/CFUagnSVHHvQX41aIAC
 XGy60LOdx80eKInhZjN4Ha8O0NKb6CGlYxmZujy/0=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oDVYX-000B51-9T; Mon, 18 Jul 2022 19:33:25 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon, 18 Jul 2022 19:33:12 +0100
Message-Id: <20220718183339.124253-14-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
References: <20220718183339.124253-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 13/40] lasips2: remove the qdev base property and the
 lasips2_properties array
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

The base property was only needed for use by vmstate_register() in order to
preserve migration compatibility. Now that the lasips2 migration state is
registered through the DeviceClass vmsd field, the base property and also
the lasips2_properties array can be removed completely as they are no longer
required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220712215251.7944-14-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/hppa/machine.c          | 3 +--
 hw/input/lasips2.c         | 9 +--------
 include/hw/input/lasips2.h | 3 +--
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 44ecd446c3..6080037cf1 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -280,8 +280,7 @@ static void machine_hppa_init(MachineState *machine)
     }
 
     /* PS/2 Keyboard/Mouse */
-    dev = DEVICE(lasips2_initfn(LASI_PS2KBD_HPA,
-                                qdev_get_gpio_in(lasi_dev,
+    dev = DEVICE(lasips2_initfn(qdev_get_gpio_in(lasi_dev,
                                                  LASI_IRQ_PS2KBD_HPA)));
     memory_region_add_subregion(addr_space, LASI_PS2KBD_HPA,
                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(dev),
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index d4fa248729..40f77baf3e 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -255,12 +255,11 @@ static void lasips2_set_mouse_irq(void *opaque, int n, int level)
     lasips2_update_irq(port->parent);
 }
 
-LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
+LASIPS2State *lasips2_initfn(qemu_irq irq)
 {
     DeviceState *dev;
 
     dev = qdev_new(TYPE_LASIPS2);
-    qdev_prop_set_uint64(dev, "base", base);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq);
@@ -307,18 +306,12 @@ static void lasips2_init(Object *obj)
                             "ps2-mouse-input-irq", 1);
 }
 
-static Property lasips2_properties[] = {
-    DEFINE_PROP_UINT64("base", LASIPS2State, base, UINT64_MAX),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void lasips2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = lasips2_realize;
     dc->vmsd = &vmstate_lasips2;
-    device_class_set_props(dc, lasips2_properties);
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 03f0c9e9f9..f051c970f0 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -39,7 +39,6 @@ typedef struct LASIPS2Port {
 struct LASIPS2State {
     SysBusDevice parent_obj;
 
-    hwaddr base;
     LASIPS2Port kbd;
     LASIPS2Port mouse;
     qemu_irq irq;
@@ -48,6 +47,6 @@ struct LASIPS2State {
 #define TYPE_LASIPS2 "lasips2"
 OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
-LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq);
+LASIPS2State *lasips2_initfn(qemu_irq irq);
 
 #endif /* HW_INPUT_LASIPS2_H */
-- 
2.30.2


