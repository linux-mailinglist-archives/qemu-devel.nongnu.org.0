Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F33725D4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:30:30 +0200 (CEST)
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoZh-00005b-KS
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0R-0005vC-1C; Tue, 04 May 2021 01:54:03 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50861 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0O-0004o8-KR; Tue, 04 May 2021 01:54:02 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CL0JWMz9sXb; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107598;
 bh=AlcnnbXsSRiB8mP7j8xA/Pa1V2sXA654j3UmiJEirOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mi5/qmZcQ5TaMbphgtnJG9xYNcZFy7au6bdIEBDdQ/7jORDZH4C7zvmCSvuk8CB7s
 SnTRsCTmlM1MO5vz3sw8ceYXNIXXrodbOokNSGt+crZmm/lYKX8LclIxq1u0XXHibT
 OahQ7EEpaY/BWnlAZTqGV9p8SWpurBZFs3/+PRyI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 21/46] vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
Date: Tue,  4 May 2021 15:52:47 +1000
Message-Id: <20210504055312.306823-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

The VT8231 south bridge is very similar to VT82C686B but there are
some differences in register addresses and functionality, e.g. the
VT8231 only has one serial port. This commit adds VT8231_SUPERIO
subclass based on the abstract VIA_SUPERIO class to emulate the
superio part of VT8231.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <8108809321f9ecf3fb1aea22ddaeccc7c3a57c8e.1616680239.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/isa/vt82c686.c | 102 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index ea55117724..952c6fc867 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -433,6 +433,107 @@ static const TypeInfo vt82c686b_superio_info = {
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
@@ -556,6 +657,7 @@ static void vt82c686b_register_types(void)
     type_register_static(&vt8231_pm_info);
     type_register_static(&via_superio_info);
     type_register_static(&vt82c686b_superio_info);
+    type_register_static(&vt8231_superio_info);
     type_register_static(&via_info);
 }
 
-- 
2.31.1


