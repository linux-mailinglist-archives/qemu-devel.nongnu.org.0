Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA49F33E0BC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:44:24 +0100 (CET)
Received: from localhost ([::1]:54294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHUF-0003CI-OG
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMHNk-0004zl-2L; Tue, 16 Mar 2021 17:37:42 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:26319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lMHNi-00052o-5O; Tue, 16 Mar 2021 17:37:39 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4583A746425;
 Tue, 16 Mar 2021 22:37:32 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BE3EC746396; Tue, 16 Mar 2021 22:37:31 +0100 (CET)
Message-Id: <dd21d6e541e1fc43ec11d61cdae658e9e7271edb.1615930019.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1615930019.git.balaton@eik.bme.hu>
References: <cover.1615930019.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v8 2/7] vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
Date: Tue, 16 Mar 2021 22:26:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, f4bug@amsat.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VT8231 south bridge is very similar to VT82C686B but there are
some differences in register addresses and functionality, e.g. the
VT8231 only has one serial port. This commit adds VT8231_SUPERIO
subclass based on the abstract VIA_SUPERIO class to emulate the
superio part of VT8231.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 102 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index ede8f3b195..1d9040aa2b 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -417,6 +417,107 @@ static const TypeInfo vt82c686b_superio_info = {
 };
 
 
+#define TYPE_VT8231_SUPERIO "vt8231-superio"
+
+static void vt8231_superio_cfg_write(void *opaque, hwaddr addr,
+                                     uint64_t data, unsigned size)
+{
+    ViaSuperIOState *sc = opaque;
+    uint8_t idx = sc->regs[0];
+
+    if (addr == 0) { /* config index register */
+        sc->regs[0] = data;
+        return;
+    }
+
+    /* config data register */
+    trace_via_superio_write(idx, data);
+    switch (idx) {
+    case 0x00 ... 0xdf:
+    case 0xe7 ... 0xef:
+    case 0xf0 ... 0xf1:
+    case 0xf5:
+    case 0xf8:
+    case 0xfd:
+        /* ignore write to read only registers */
+        return;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "via_superio_cfg: unimplemented register 0x%x\n", idx);
+        break;
+    }
+    sc->regs[idx] = data;
+}
+
+static const MemoryRegionOps vt8231_superio_cfg_ops = {
+    .read = via_superio_cfg_read,
+    .write = vt8231_superio_cfg_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 1,
+    },
+};
+
+static void vt8231_superio_reset(DeviceState *dev)
+{
+    ViaSuperIOState *s = VIA_SUPERIO(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    /* Device ID */
+    s->regs[0xf0] = 0x3c;
+    /* Device revision */
+    s->regs[0xf1] = 0x01;
+    /* Function select - all disabled */
+    vt8231_superio_cfg_write(s, 0, 0xf2, 1);
+    vt8231_superio_cfg_write(s, 1, 0x03, 1);
+    /* Serial port base addr */
+    vt8231_superio_cfg_write(s, 0, 0xf4, 1);
+    vt8231_superio_cfg_write(s, 1, 0xfe, 1);
+    /* Parallel port base addr */
+    vt8231_superio_cfg_write(s, 0, 0xf6, 1);
+    vt8231_superio_cfg_write(s, 1, 0xde, 1);
+    /* Floppy ctrl base addr */
+    vt8231_superio_cfg_write(s, 0, 0xf7, 1);
+    vt8231_superio_cfg_write(s, 1, 0xfc, 1);
+
+    vt8231_superio_cfg_write(s, 0, 0, 1);
+}
+
+static void vt8231_superio_init(Object *obj)
+{
+    VIA_SUPERIO(obj)->io_ops = &vt8231_superio_cfg_ops;
+}
+
+static uint16_t vt8231_superio_serial_iobase(ISASuperIODevice *sio,
+                                             uint8_t index)
+{
+        return 0x2f8; /* FIXME: This should be settable via registers f2-f4 */
+}
+
+static void vt8231_superio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
+
+    dc->reset = vt8231_superio_reset;
+    sc->serial.count = 1;
+    sc->serial.get_iobase = vt8231_superio_serial_iobase;
+    sc->parallel.count = 1;
+    sc->ide.count = 0; /* emulated by via-ide */
+    sc->floppy.count = 1;
+}
+
+static const TypeInfo vt8231_superio_info = {
+    .name          = TYPE_VT8231_SUPERIO,
+    .parent        = TYPE_VIA_SUPERIO,
+    .instance_size = sizeof(ViaSuperIOState),
+    .instance_init = vt8231_superio_init,
+    .class_size    = sizeof(ISASuperIOClass),
+    .class_init    = vt8231_superio_class_init,
+};
+
+
 OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
 
 struct VT82C686BISAState {
@@ -540,6 +641,7 @@ static void vt82c686b_register_types(void)
     type_register_static(&vt8231_pm_info);
     type_register_static(&via_superio_info);
     type_register_static(&vt82c686b_superio_info);
+    type_register_static(&vt8231_superio_info);
     type_register_static(&via_info);
 }
 
-- 
2.21.4


