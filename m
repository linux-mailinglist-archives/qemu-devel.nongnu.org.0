Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BA4389469
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:07:59 +0200 (CEST)
Received: from localhost ([::1]:38610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPfq-0002Ra-5z
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljPAF-0003Vb-Ek
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:35:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljPAA-0006yT-8G
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621442113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sT8VQnZpmDiW0f4tpaMuAcHmHRgcjhj2/uyrihdSmS0=;
 b=LQkdC9M6oYe97NpDTd53Wmvfxas8e7Q41tioWtoUn1ySCwkbRGuTfhWb2d0X8keBAQnOjS
 qlpjk7kCg4+btZIX7NwFALwen/8mcAPUA4fgN/LQG63OTy5VWFjcnsOf/GeWSoSYJH7MTU
 m+Rc4SeNm58KomC9XtCR2o9F0eyuIBA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-OF6M6-gDM02-qSo4DrpwUw-1; Wed, 19 May 2021 12:35:09 -0400
X-MC-Unique: OF6M6-gDM02-qSo4DrpwUw-1
Received: by mail-wr1-f72.google.com with SMTP id
 c13-20020a5d6ccd0000b029010ec741b84bso7358685wrc.23
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 09:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sT8VQnZpmDiW0f4tpaMuAcHmHRgcjhj2/uyrihdSmS0=;
 b=ehJIp1KSfDrnJ1X65jgI8y59w6pFoVurVeK+VSYAW3WxaGT5il4EvLQFqu0EjJRDI4
 8W70lVVOMd5ut/GygfrMn/Nf2qF+OneZgPNBpzdhzY/9MU0A/jgRxnDmD7kW3f1Je/iN
 9hir4YrhU0dWIUHdRvGN0Sx7JApM/dOwriNEviE7Xf214DZRVRcdaWx5AhbJYCoSqn3q
 bqg+t9vBAWZoZIkax+V2X58N0OIKd6glxzsaN8iAl+thzWb2aWEK+Gy8hggt1YNWypjf
 sNHzeZ/ZTgTv2cETTN9iL9aZuiXaDM4FmTdTSSRkKmhHzksul1mTqV/FBHsMvBFmd+74
 GSoA==
X-Gm-Message-State: AOAM531iyZ2Ka2zdybzT0nf9pUl4B0E0BDP4CsH3u1g3e/IhP9hMFadS
 +sU2QyssVwrMvo+z/p8OX3dQOVizmSKJMGMv0l5jyJSiiMVdeMj8/jKFe2ctj76AG/VUSlwWm2z
 EhmKIJ7S+Wu+k0O4=
X-Received: by 2002:adf:eacf:: with SMTP id o15mr1968165wrn.219.1621442108401; 
 Wed, 19 May 2021 09:35:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmnrVdEDKPdF8FXt8viZfbaSNGm+EJGslHJqALnnTCpOq+VaSGg1qB/gpwJLzkUEBUjsrmow==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr1968129wrn.219.1621442108100; 
 Wed, 19 May 2021 09:35:08 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x11sm25539115wrl.13.2021.05.19.09.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 09:35:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v6 4/5] hw/block/fdc: Extract ISA floppy controllers to
 fdc-isa.c
Date: Wed, 19 May 2021 18:34:47 +0200
Message-Id: <20210519163448.2154339-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519163448.2154339-1-philmd@redhat.com>
References: <20210519163448.2154339-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some machines use floppy controllers via the SysBus interface,
and don't need to pull in all the ISA code.
Extract the ISA specific code to a new unit: fdc-isa.c, and
add a new Kconfig symbol: "FDC_ISA".
This allows us to remove the FIXME from commit dd0ff8191ab
("isa: express SuperIO dependencies with Kconfig").

Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/fdc-isa.c   | 319 +++++++++++++++++++++++++++++++++++++++++++
 hw/block/fdc.c       | 265 -----------------------------------
 MAINTAINERS          |   1 +
 hw/block/Kconfig     |   8 +-
 hw/block/meson.build |   3 +-
 hw/i386/Kconfig      |   2 +-
 hw/isa/Kconfig       |   8 +-
 hw/sparc64/Kconfig   |   2 +-
 8 files changed, 333 insertions(+), 275 deletions(-)
 create mode 100644 hw/block/fdc-isa.c

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
new file mode 100644
index 00000000000..0e22a10732d
--- /dev/null
+++ b/hw/block/fdc-isa.c
@@ -0,0 +1,319 @@
+/*
+ * QEMU Floppy disk emulator (Intel 82078)
+ *
+ * Copyright (c) 2003, 2007 Jocelyn Mayer
+ * Copyright (c) 2008 Hervé Poussineau
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+/*
+ * The controller is used in Sun4m systems in a slightly different
+ * way. There are changes in DOR register and DMA is not available.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/block/fdc.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "qemu/timer.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/irq.h"
+#include "hw/isa/isa.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "migration/vmstate.h"
+#include "hw/block/block.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/blockdev.h"
+#include "sysemu/sysemu.h"
+#include "qemu/log.h"
+#include "qemu/main-loop.h"
+#include "qemu/module.h"
+#include "trace.h"
+#include "qom/object.h"
+#include "fdc-internal.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(FDCtrlISABus, ISA_FDC)
+
+struct FDCtrlISABus {
+    /*< private >*/
+    ISADevice parent_obj;
+    /*< public >*/
+
+    uint32_t iobase;
+    uint32_t irq;
+    uint32_t dma;
+    struct FDCtrl state;
+    int32_t bootindexA;
+    int32_t bootindexB;
+};
+
+static void fdctrl_external_reset_isa(DeviceState *d)
+{
+    FDCtrlISABus *isa = ISA_FDC(d);
+    FDCtrl *s = &isa->state;
+
+    fdctrl_reset(s, 0);
+}
+
+void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds)
+{
+    fdctrl_init_drives(&ISA_FDC(fdc)->state.bus, fds);
+}
+
+static const MemoryRegionPortio fdc_portio_list[] = {
+    { 1, 5, 1, .read = fdctrl_read, .write = fdctrl_write },
+    { 7, 1, 1, .read = fdctrl_read, .write = fdctrl_write },
+    PORTIO_END_OF_LIST(),
+};
+
+static void isabus_fdc_realize(DeviceState *dev, Error **errp)
+{
+    ISADevice *isadev = ISA_DEVICE(dev);
+    FDCtrlISABus *isa = ISA_FDC(dev);
+    FDCtrl *fdctrl = &isa->state;
+    Error *err = NULL;
+
+    isa_register_portio_list(isadev, &fdctrl->portio_list,
+                             isa->iobase, fdc_portio_list, fdctrl,
+                             "fdc");
+
+    isa_init_irq(isadev, &fdctrl->irq, isa->irq);
+    fdctrl->dma_chann = isa->dma;
+    if (fdctrl->dma_chann != -1) {
+        IsaDmaClass *k;
+        fdctrl->dma = isa_get_dma(isa_bus_from_device(isadev), isa->dma);
+        if (!fdctrl->dma) {
+            error_setg(errp, "ISA controller does not support DMA");
+            return;
+        }
+        k = ISADMA_GET_CLASS(fdctrl->dma);
+        k->register_channel(fdctrl->dma, fdctrl->dma_chann,
+                            &fdctrl_transfer_handler, fdctrl);
+    }
+
+    qdev_set_legacy_instance_id(dev, isa->iobase, 2);
+
+    fdctrl_realize_common(dev, fdctrl, &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+}
+
+FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i)
+{
+    FDCtrlISABus *isa = ISA_FDC(fdc);
+
+    return isa->state.drives[i].drive;
+}
+
+static void isa_fdc_get_drive_max_chs(FloppyDriveType type, uint8_t *maxc,
+                                      uint8_t *maxh, uint8_t *maxs)
+{
+    const FDFormat *fdf;
+
+    *maxc = *maxh = *maxs = 0;
+    for (fdf = fd_formats; fdf->drive != FLOPPY_DRIVE_TYPE_NONE; fdf++) {
+        if (fdf->drive != type) {
+            continue;
+        }
+        if (*maxc < fdf->max_track) {
+            *maxc = fdf->max_track;
+        }
+        if (*maxh < fdf->max_head) {
+            *maxh = fdf->max_head;
+        }
+        if (*maxs < fdf->last_sect) {
+            *maxs = fdf->last_sect;
+        }
+    }
+    (*maxc)--;
+}
+
+static Aml *build_fdinfo_aml(int idx, FloppyDriveType type)
+{
+    Aml *dev, *fdi;
+    uint8_t maxc, maxh, maxs;
+
+    isa_fdc_get_drive_max_chs(type, &maxc, &maxh, &maxs);
+
+    dev = aml_device("FLP%c", 'A' + idx);
+
+    aml_append(dev, aml_name_decl("_ADR", aml_int(idx)));
+
+    fdi = aml_package(16);
+    aml_append(fdi, aml_int(idx));  /* Drive Number */
+    aml_append(fdi,
+        aml_int(cmos_get_fd_drive_type(type)));  /* Device Type */
+    /*
+     * the values below are the limits of the drive, and are thus independent
+     * of the inserted media
+     */
+    aml_append(fdi, aml_int(maxc));  /* Maximum Cylinder Number */
+    aml_append(fdi, aml_int(maxs));  /* Maximum Sector Number */
+    aml_append(fdi, aml_int(maxh));  /* Maximum Head Number */
+    /*
+     * SeaBIOS returns the below values for int 0x13 func 0x08 regardless of
+     * the drive type, so shall we
+     */
+    aml_append(fdi, aml_int(0xAF));  /* disk_specify_1 */
+    aml_append(fdi, aml_int(0x02));  /* disk_specify_2 */
+    aml_append(fdi, aml_int(0x25));  /* disk_motor_wait */
+    aml_append(fdi, aml_int(0x02));  /* disk_sector_siz */
+    aml_append(fdi, aml_int(0x12));  /* disk_eot */
+    aml_append(fdi, aml_int(0x1B));  /* disk_rw_gap */
+    aml_append(fdi, aml_int(0xFF));  /* disk_dtl */
+    aml_append(fdi, aml_int(0x6C));  /* disk_formt_gap */
+    aml_append(fdi, aml_int(0xF6));  /* disk_fill */
+    aml_append(fdi, aml_int(0x0F));  /* disk_head_sttl */
+    aml_append(fdi, aml_int(0x08));  /* disk_motor_strt */
+
+    aml_append(dev, aml_name_decl("_FDI", fdi));
+    return dev;
+}
+
+int cmos_get_fd_drive_type(FloppyDriveType fd0)
+{
+    int val;
+
+    switch (fd0) {
+    case FLOPPY_DRIVE_TYPE_144:
+        /* 1.44 Mb 3"5 drive */
+        val = 4;
+        break;
+    case FLOPPY_DRIVE_TYPE_288:
+        /* 2.88 Mb 3"5 drive */
+        val = 5;
+        break;
+    case FLOPPY_DRIVE_TYPE_120:
+        /* 1.2 Mb 5"5 drive */
+        val = 2;
+        break;
+    case FLOPPY_DRIVE_TYPE_NONE:
+    default:
+        val = 0;
+        break;
+    }
+    return val;
+}
+
+static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
+{
+    Aml *dev;
+    Aml *crs;
+    int i;
+
+#define ACPI_FDE_MAX_FD 4
+    uint32_t fde_buf[5] = {
+        0, 0, 0, 0,     /* presence of floppy drives #0 - #3 */
+        cpu_to_le32(2)  /* tape presence (2 == never present) */
+    };
+
+    crs = aml_resource_template();
+    aml_append(crs, aml_io(AML_DECODE16, 0x03F2, 0x03F2, 0x00, 0x04));
+    aml_append(crs, aml_io(AML_DECODE16, 0x03F7, 0x03F7, 0x00, 0x01));
+    aml_append(crs, aml_irq_no_flags(6));
+    aml_append(crs,
+        aml_dma(AML_COMPATIBILITY, AML_NOTBUSMASTER, AML_TRANSFER8, 2));
+
+    dev = aml_device("FDC0");
+    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0700")));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+
+    for (i = 0; i < MIN(MAX_FD, ACPI_FDE_MAX_FD); i++) {
+        FloppyDriveType type = isa_fdc_get_drive_type(isadev, i);
+
+        if (type < FLOPPY_DRIVE_TYPE_NONE) {
+            fde_buf[i] = cpu_to_le32(1);  /* drive present */
+            aml_append(dev, build_fdinfo_aml(i, type));
+        }
+    }
+    aml_append(dev, aml_name_decl("_FDE",
+               aml_buffer(sizeof(fde_buf), (uint8_t *)fde_buf)));
+
+    aml_append(scope, dev);
+}
+
+static const VMStateDescription vmstate_isa_fdc = {
+    .name = "fdc",
+    .version_id = 2,
+    .minimum_version_id = 2,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(state, FDCtrlISABus, 0, vmstate_fdc, FDCtrl),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property isa_fdc_properties[] = {
+    DEFINE_PROP_UINT32("iobase", FDCtrlISABus, iobase, 0x3f0),
+    DEFINE_PROP_UINT32("irq", FDCtrlISABus, irq, 6),
+    DEFINE_PROP_UINT32("dma", FDCtrlISABus, dma, 2),
+    DEFINE_PROP_SIGNED("fdtypeA", FDCtrlISABus, state.qdev_for_drives[0].type,
+                        FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
+                        FloppyDriveType),
+    DEFINE_PROP_SIGNED("fdtypeB", FDCtrlISABus, state.qdev_for_drives[1].type,
+                        FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
+                        FloppyDriveType),
+    DEFINE_PROP_SIGNED("fallback", FDCtrlISABus, state.fallback,
+                        FLOPPY_DRIVE_TYPE_288, qdev_prop_fdc_drive_type,
+                        FloppyDriveType),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void isabus_fdc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
+
+    dc->realize = isabus_fdc_realize;
+    dc->fw_name = "fdc";
+    dc->reset = fdctrl_external_reset_isa;
+    dc->vmsd = &vmstate_isa_fdc;
+    isa->build_aml = fdc_isa_build_aml;
+    device_class_set_props(dc, isa_fdc_properties);
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+}
+
+static void isabus_fdc_instance_init(Object *obj)
+{
+    FDCtrlISABus *isa = ISA_FDC(obj);
+
+    device_add_bootindex_property(obj, &isa->bootindexA,
+                                  "bootindexA", "/floppy@0",
+                                  DEVICE(obj));
+    device_add_bootindex_property(obj, &isa->bootindexB,
+                                  "bootindexB", "/floppy@1",
+                                  DEVICE(obj));
+}
+
+static const TypeInfo isa_fdc_info = {
+    .name          = TYPE_ISA_FDC,
+    .parent        = TYPE_ISA_DEVICE,
+    .instance_size = sizeof(FDCtrlISABus),
+    .class_init    = isabus_fdc_class_init,
+    .instance_init = isabus_fdc_instance_init,
+};
+
+static void isa_fdc_register_types(void)
+{
+    type_register_static(&isa_fdc_info);
+}
+
+type_init(isa_fdc_register_types)
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 20ddeb98d83..aa70eb97c6a 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -32,7 +32,6 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/timer.h"
-#include "hw/acpi/aml-build.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
@@ -785,19 +784,6 @@ struct FDCtrlSysBus {
     struct FDCtrl state;
 };
 
-OBJECT_DECLARE_SIMPLE_TYPE(FDCtrlISABus, ISA_FDC)
-
-struct FDCtrlISABus {
-    ISADevice parent_obj;
-
-    uint32_t iobase;
-    uint32_t irq;
-    uint32_t dma;
-    struct FDCtrl state;
-    int32_t bootindexA;
-    int32_t bootindexB;
-};
-
 uint32_t fdctrl_read(void *opaque, uint32_t reg)
 {
     FDCtrl *fdctrl = opaque;
@@ -1121,14 +1107,6 @@ static void fdctrl_external_reset_sysbus(DeviceState *d)
     fdctrl_reset(s, 0);
 }
 
-static void fdctrl_external_reset_isa(DeviceState *d)
-{
-    FDCtrlISABus *isa = ISA_FDC(d);
-    FDCtrl *s = &isa->state;
-
-    fdctrl_reset(s, 0);
-}
-
 static void fdctrl_handle_tc(void *opaque, int irq, int level)
 {
     trace_fdctrl_tc_pulse(level);
@@ -2389,11 +2367,6 @@ void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds)
     }
 }
 
-void isa_fdc_init_drives(ISADevice *fdc, DriveInfo **fds)
-{
-    fdctrl_init_drives(&ISA_FDC(fdc)->state.bus, fds);
-}
-
 void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
                         hwaddr mmio_base, DriveInfo **fds)
 {
@@ -2464,14 +2437,6 @@ void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl, Error **errp)
     fdctrl->config = FD_CONFIG_EIS | FD_CONFIG_EFIFO; /* Implicit seek, polling & FIFO enabled */
     fdctrl->num_floppies = MAX_FD;
 
-    if (fdctrl->dma_chann != -1) {
-        IsaDmaClass *k;
-        assert(fdctrl->dma);
-        k = ISADMA_GET_CLASS(fdctrl->dma);
-        k->register_channel(fdctrl->dma, fdctrl->dma_chann,
-                            &fdctrl_transfer_handler, fdctrl);
-    }
-
     floppy_bus_create(fdctrl, &fdctrl->bus, dev);
 
     for (i = 0; i < MAX_FD; i++) {
@@ -2482,41 +2447,6 @@ void fdctrl_realize_common(DeviceState *dev, FDCtrl *fdctrl, Error **errp)
     }
 }
 
-static const MemoryRegionPortio fdc_portio_list[] = {
-    { 1, 5, 1, .read = fdctrl_read, .write = fdctrl_write },
-    { 7, 1, 1, .read = fdctrl_read, .write = fdctrl_write },
-    PORTIO_END_OF_LIST(),
-};
-
-static void isabus_fdc_realize(DeviceState *dev, Error **errp)
-{
-    ISADevice *isadev = ISA_DEVICE(dev);
-    FDCtrlISABus *isa = ISA_FDC(dev);
-    FDCtrl *fdctrl = &isa->state;
-    Error *err = NULL;
-
-    isa_register_portio_list(isadev, &fdctrl->portio_list,
-                             isa->iobase, fdc_portio_list, fdctrl,
-                             "fdc");
-
-    isa_init_irq(isadev, &fdctrl->irq, isa->irq);
-    fdctrl->dma_chann = isa->dma;
-    if (fdctrl->dma_chann != -1) {
-        fdctrl->dma = isa_get_dma(isa_bus_from_device(isadev), isa->dma);
-        if (!fdctrl->dma) {
-            error_setg(errp, "ISA controller does not support DMA");
-            return;
-        }
-    }
-
-    qdev_set_legacy_instance_id(dev, isa->iobase, 2);
-    fdctrl_realize_common(dev, fdctrl, &err);
-    if (err != NULL) {
-        error_propagate(errp, err);
-        return;
-    }
-}
-
 static void sysbus_fdc_initfn(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -2564,200 +2494,6 @@ static void sysbus_fdc_common_realize(DeviceState *dev, Error **errp)
     fdctrl_realize_common(dev, fdctrl, errp);
 }
 
-FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i)
-{
-    FDCtrlISABus *isa = ISA_FDC(fdc);
-
-    return isa->state.drives[i].drive;
-}
-
-static void isa_fdc_get_drive_max_chs(FloppyDriveType type, uint8_t *maxc,
-                                      uint8_t *maxh, uint8_t *maxs)
-{
-    const FDFormat *fdf;
-
-    *maxc = *maxh = *maxs = 0;
-    for (fdf = fd_formats; fdf->drive != FLOPPY_DRIVE_TYPE_NONE; fdf++) {
-        if (fdf->drive != type) {
-            continue;
-        }
-        if (*maxc < fdf->max_track) {
-            *maxc = fdf->max_track;
-        }
-        if (*maxh < fdf->max_head) {
-            *maxh = fdf->max_head;
-        }
-        if (*maxs < fdf->last_sect) {
-            *maxs = fdf->last_sect;
-        }
-    }
-    (*maxc)--;
-}
-
-static Aml *build_fdinfo_aml(int idx, FloppyDriveType type)
-{
-    Aml *dev, *fdi;
-    uint8_t maxc, maxh, maxs;
-
-    isa_fdc_get_drive_max_chs(type, &maxc, &maxh, &maxs);
-
-    dev = aml_device("FLP%c", 'A' + idx);
-
-    aml_append(dev, aml_name_decl("_ADR", aml_int(idx)));
-
-    fdi = aml_package(16);
-    aml_append(fdi, aml_int(idx));  /* Drive Number */
-    aml_append(fdi,
-        aml_int(cmos_get_fd_drive_type(type)));  /* Device Type */
-    /*
-     * the values below are the limits of the drive, and are thus independent
-     * of the inserted media
-     */
-    aml_append(fdi, aml_int(maxc));  /* Maximum Cylinder Number */
-    aml_append(fdi, aml_int(maxs));  /* Maximum Sector Number */
-    aml_append(fdi, aml_int(maxh));  /* Maximum Head Number */
-    /*
-     * SeaBIOS returns the below values for int 0x13 func 0x08 regardless of
-     * the drive type, so shall we
-     */
-    aml_append(fdi, aml_int(0xAF));  /* disk_specify_1 */
-    aml_append(fdi, aml_int(0x02));  /* disk_specify_2 */
-    aml_append(fdi, aml_int(0x25));  /* disk_motor_wait */
-    aml_append(fdi, aml_int(0x02));  /* disk_sector_siz */
-    aml_append(fdi, aml_int(0x12));  /* disk_eot */
-    aml_append(fdi, aml_int(0x1B));  /* disk_rw_gap */
-    aml_append(fdi, aml_int(0xFF));  /* disk_dtl */
-    aml_append(fdi, aml_int(0x6C));  /* disk_formt_gap */
-    aml_append(fdi, aml_int(0xF6));  /* disk_fill */
-    aml_append(fdi, aml_int(0x0F));  /* disk_head_sttl */
-    aml_append(fdi, aml_int(0x08));  /* disk_motor_strt */
-
-    aml_append(dev, aml_name_decl("_FDI", fdi));
-    return dev;
-}
-
-int cmos_get_fd_drive_type(FloppyDriveType fd0)
-{
-    int val;
-
-    switch (fd0) {
-    case FLOPPY_DRIVE_TYPE_144:
-        /* 1.44 Mb 3"5 drive */
-        val = 4;
-        break;
-    case FLOPPY_DRIVE_TYPE_288:
-        /* 2.88 Mb 3"5 drive */
-        val = 5;
-        break;
-    case FLOPPY_DRIVE_TYPE_120:
-        /* 1.2 Mb 5"5 drive */
-        val = 2;
-        break;
-    case FLOPPY_DRIVE_TYPE_NONE:
-    default:
-        val = 0;
-        break;
-    }
-    return val;
-}
-
-static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
-{
-    Aml *dev;
-    Aml *crs;
-    int i;
-
-#define ACPI_FDE_MAX_FD 4
-    uint32_t fde_buf[5] = {
-        0, 0, 0, 0,     /* presence of floppy drives #0 - #3 */
-        cpu_to_le32(2)  /* tape presence (2 == never present) */
-    };
-
-    crs = aml_resource_template();
-    aml_append(crs, aml_io(AML_DECODE16, 0x03F2, 0x03F2, 0x00, 0x04));
-    aml_append(crs, aml_io(AML_DECODE16, 0x03F7, 0x03F7, 0x00, 0x01));
-    aml_append(crs, aml_irq_no_flags(6));
-    aml_append(crs,
-        aml_dma(AML_COMPATIBILITY, AML_NOTBUSMASTER, AML_TRANSFER8, 2));
-
-    dev = aml_device("FDC0");
-    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0700")));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-
-    for (i = 0; i < MIN(MAX_FD, ACPI_FDE_MAX_FD); i++) {
-        FloppyDriveType type = isa_fdc_get_drive_type(isadev, i);
-
-        if (type < FLOPPY_DRIVE_TYPE_NONE) {
-            fde_buf[i] = cpu_to_le32(1);  /* drive present */
-            aml_append(dev, build_fdinfo_aml(i, type));
-        }
-    }
-    aml_append(dev, aml_name_decl("_FDE",
-               aml_buffer(sizeof(fde_buf), (uint8_t *)fde_buf)));
-
-    aml_append(scope, dev);
-}
-
-static const VMStateDescription vmstate_isa_fdc ={
-    .name = "fdc",
-    .version_id = 2,
-    .minimum_version_id = 2,
-    .fields = (VMStateField[]) {
-        VMSTATE_STRUCT(state, FDCtrlISABus, 0, vmstate_fdc, FDCtrl),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static Property isa_fdc_properties[] = {
-    DEFINE_PROP_UINT32("iobase", FDCtrlISABus, iobase, 0x3f0),
-    DEFINE_PROP_UINT32("irq", FDCtrlISABus, irq, 6),
-    DEFINE_PROP_UINT32("dma", FDCtrlISABus, dma, 2),
-    DEFINE_PROP_SIGNED("fdtypeA", FDCtrlISABus, state.qdev_for_drives[0].type,
-                        FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
-                        FloppyDriveType),
-    DEFINE_PROP_SIGNED("fdtypeB", FDCtrlISABus, state.qdev_for_drives[1].type,
-                        FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
-                        FloppyDriveType),
-    DEFINE_PROP_SIGNED("fallback", FDCtrlISABus, state.fallback,
-                        FLOPPY_DRIVE_TYPE_288, qdev_prop_fdc_drive_type,
-                        FloppyDriveType),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void isabus_fdc_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
-
-    dc->realize = isabus_fdc_realize;
-    dc->fw_name = "fdc";
-    dc->reset = fdctrl_external_reset_isa;
-    dc->vmsd = &vmstate_isa_fdc;
-    isa->build_aml = fdc_isa_build_aml;
-    device_class_set_props(dc, isa_fdc_properties);
-    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
-}
-
-static void isabus_fdc_instance_init(Object *obj)
-{
-    FDCtrlISABus *isa = ISA_FDC(obj);
-
-    device_add_bootindex_property(obj, &isa->bootindexA,
-                                  "bootindexA", "/floppy@0",
-                                  DEVICE(obj));
-    device_add_bootindex_property(obj, &isa->bootindexB,
-                                  "bootindexB", "/floppy@1",
-                                  DEVICE(obj));
-}
-
-static const TypeInfo isa_fdc_info = {
-    .name          = TYPE_ISA_FDC,
-    .parent        = TYPE_ISA_DEVICE,
-    .instance_size = sizeof(FDCtrlISABus),
-    .class_init    = isabus_fdc_class_init,
-    .instance_init = isabus_fdc_instance_init,
-};
-
 static const VMStateDescription vmstate_sysbus_fdc ={
     .name = "fdc",
     .version_id = 2,
@@ -2841,7 +2577,6 @@ static const TypeInfo sysbus_fdc_type_info = {
 
 static void fdc_register_types(void)
 {
-    type_register_static(&isa_fdc_info);
     type_register_static(&sysbus_fdc_type_info);
     type_register_static(&sysbus_fdc_info);
     type_register_static(&sun4m_fdc_info);
diff --git a/MAINTAINERS b/MAINTAINERS
index 153335e8a2e..df941492c46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1660,6 +1660,7 @@ L: qemu-block@nongnu.org
 S: Supported
 F: hw/block/fdc.c
 F: hw/block/fdc-internal.h
+F: hw/block/fdc-isa.c
 F: hw/block/fdc-isa-stubs.c
 F: include/hw/block/fdc.h
 F: tests/qtest/fdc-test.c
diff --git a/hw/block/Kconfig b/hw/block/Kconfig
index 295441e64ab..8c3be60a197 100644
--- a/hw/block/Kconfig
+++ b/hw/block/Kconfig
@@ -1,8 +1,10 @@
 config FDC
     bool
-    # FIXME: there is no separate file for the MMIO floppy disk controller, so
-    # select ISA_BUS here instead of polluting each board that requires one
-    select ISA_BUS
+
+config FDC_ISA
+    bool
+    depends on ISA_BUS
+    select FDC
 
 config SSI_M25P80
     bool
diff --git a/hw/block/meson.build b/hw/block/meson.build
index bb5b331d86a..7cc3cc7daae 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -4,7 +4,8 @@
   'hd-geometry.c'
 ))
 softmmu_ss.add(when: 'CONFIG_ECC', if_true: files('ecc.c'))
-softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'),
+softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'))
+softmmu_ss.add(when: 'CONFIG_FDC_ISA', if_true: files('fdc-isa.c'),
                                        if_false: files('fdc-isa-stubs.c'))
 softmmu_ss.add(when: 'CONFIG_NAND', if_true: files('nand.c'))
 softmmu_ss.add(when: 'CONFIG_ONENAND', if_true: files('onenand.c'))
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877f..bb475648c97 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -23,7 +23,7 @@ config PC
     imply TPM_TIS_ISA
     imply VGA_PCI
     imply VIRTIO_VGA
-    select FDC
+    select FDC_ISA
     select I8259
     select I8254
     select PCKBD
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 7216f66a54a..96db170eff3 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -17,7 +17,7 @@ config ISA_SUPERIO
     bool
     select ISA_BUS
     select PCKBD
-    select FDC
+    select FDC_ISA
 
 config PC87312
     bool
@@ -28,7 +28,7 @@ config PC87312
     select MC146818RTC
     select SERIAL_ISA
     select PARALLEL
-    select FDC
+    select FDC_ISA
     select IDE_ISA
 
 config PIIX3
@@ -47,7 +47,7 @@ config VT82C686
     select ISA_SUPERIO
     select ACPI_SMBUS
     select SERIAL_ISA
-    select FDC
+    select FDC_ISA
     select USB_UHCI
     select APM
 
@@ -56,7 +56,7 @@ config SMC37C669
     select ISA_SUPERIO
     select SERIAL_ISA
     select PARALLEL
-    select FDC
+    select FDC_ISA
 
 config LPC_ICH9
     bool
diff --git a/hw/sparc64/Kconfig b/hw/sparc64/Kconfig
index 980a201bb73..7e557ad17b0 100644
--- a/hw/sparc64/Kconfig
+++ b/hw/sparc64/Kconfig
@@ -6,7 +6,7 @@ config SUN4U
     imply PARALLEL
     select M48T59
     select ISA_BUS
-    select FDC
+    select FDC_ISA
     select SERIAL_ISA
     select PCI_SABRE
     select IDE_CMD646
-- 
2.26.3


