Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7057241DDBE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:40:06 +0200 (CEST)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyAH-00028F-CJ
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjV-0000NB-BG
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjQ-00045t-IB
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:23 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 b192-20020a1c1bc9000000b0030cfaf18864so4601222wmb.4
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=prEV87x91iZDmCND6IZHC08ppGLS8d5D7g1utOkuyiQ=;
 b=EMWY70aNkal4Y2LqYw2RDQcrHqfSHXB9icWcIx2QMseJmwUfIdvEpwY2G8mbqxiozh
 IEcViRZjbDImdrdC5pKDwU+6kQNqTv0vzBEUvtcRDOnWF3omKN1Fbr+FOKAWMyy0UYFk
 haO/z1b3UPZVTyJQS73wVr96wXszPO2LuQk5Ff5xCdXuVNukDMdD3FgGhfn4VmbP5cJy
 JAVO+bIqP7tCw3f+FmTvIX/KOaerXV3Cz1Cjc8NqTvqoBPpvd7zL7gzvgZuXP7aNLBA5
 ViqcdbGXmpzQAduml0zQSsiyXzwAhUdrcEhoOYKO9Zhazru2IVh4FlvEf27HEBQaERXr
 GgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=prEV87x91iZDmCND6IZHC08ppGLS8d5D7g1utOkuyiQ=;
 b=bQkYhKDI7MGHUeMNsnwr+r1pubzla2BSlQBK/Pmyezbaz/9YcNwTT77qCYvGsMTVls
 LEdLhJx29z1q0uN4hXWSUBgXA62YjRKPjLqzI8oGovEYcTM42We5RMVvSUzfcSMTRG9U
 2hvep3Zz6sCJZX1sqRoj/KBAaouDUdJAwdf1UbAAaZzzFOUV8H40CrJvfRM2NvKCpVg6
 QAsl4Yb5RwbJR1scVMRBxM3HbRk4/a8nj8vABUuBoknehuPkcBaWmki1i+WejPh+t1u/
 8AQTIz0d/tuBKTovYcp7qntr71bMpWESG0O9blvIuxTxKC2zr9NlIifco7ncj4CfFzqI
 BkRQ==
X-Gm-Message-State: AOAM531xe1smmUQpyUxuJJgz7CECiZM2D+lgDoDHNizehE3EY9Y7dZQZ
 o9vcQceUK2i9jFVMpwH2FnrbL+O5Zo1Y4A==
X-Google-Smtp-Source: ABdhPJzfTSoLDHcZPCSFs6KPGoK4lRwCzPKdhWweRf6QFaxrKQ/FhdAvgggmWkb2jigv0aLfL4DZsQ==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr5806398wmc.6.1633014738828;
 Thu, 30 Sep 2021 08:12:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/22] qbus: Rename qbus_create_inplace() to qbus_init()
Date: Thu, 30 Sep 2021 16:11:58 +0100
Message-Id: <20210930151201.9407-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename qbus_create_inplace() to qbus_init(); this is more in line
with our usual naming convention for functions that in-place
initialize objects.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20210923121153.23754-5-peter.maydell@linaro.org
---
 include/hw/qdev-core.h        |  4 ++--
 hw/audio/intel-hda.c          |  2 +-
 hw/block/fdc.c                |  2 +-
 hw/block/swim.c               |  3 +--
 hw/char/virtio-serial-bus.c   |  4 ++--
 hw/core/bus.c                 | 11 ++++++-----
 hw/core/sysbus.c              | 10 ++++++----
 hw/gpio/bcm2835_gpio.c        |  3 +--
 hw/ide/qdev.c                 |  2 +-
 hw/ipack/ipack.c              |  2 +-
 hw/misc/mac_via.c             |  4 ++--
 hw/misc/macio/cuda.c          |  4 ++--
 hw/misc/macio/macio.c         |  4 ++--
 hw/misc/macio/pmu.c           |  4 ++--
 hw/nubus/nubus-bridge.c       |  2 +-
 hw/nvme/ctrl.c                |  4 ++--
 hw/nvme/subsys.c              |  3 +--
 hw/pci/pci.c                  |  2 +-
 hw/pci/pci_bridge.c           |  4 ++--
 hw/s390x/event-facility.c     |  4 ++--
 hw/s390x/virtio-ccw.c         |  3 +--
 hw/scsi/scsi-bus.c            |  2 +-
 hw/sd/allwinner-sdhost.c      |  4 ++--
 hw/sd/bcm2835_sdhost.c        |  4 ++--
 hw/sd/pl181.c                 |  3 +--
 hw/sd/pxa2xx_mmci.c           |  4 ++--
 hw/sd/sdhci.c                 |  3 +--
 hw/sd/ssi-sd.c                |  3 +--
 hw/usb/bus.c                  |  2 +-
 hw/usb/dev-smartcard-reader.c |  3 +--
 hw/virtio/virtio-mmio.c       |  3 +--
 hw/virtio/virtio-pci.c        |  3 +--
 32 files changed, 54 insertions(+), 61 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 34c8a7506a1..ebca8cf9fca 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -678,8 +678,8 @@ DeviceState *qdev_find_recursive(BusState *bus, const char *id);
 typedef int (qbus_walkerfn)(BusState *bus, void *opaque);
 typedef int (qdev_walkerfn)(DeviceState *dev, void *opaque);
 
-void qbus_create_inplace(void *bus, size_t size, const char *typename,
-                         DeviceState *parent, const char *name);
+void qbus_init(void *bus, size_t size, const char *typename,
+               DeviceState *parent, const char *name);
 BusState *qbus_create(const char *typename, DeviceState *parent, const char *name);
 bool qbus_realize(BusState *bus, Error **errp);
 void qbus_unrealize(BusState *bus);
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 4330213fff1..8ce9df64e3e 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -52,7 +52,7 @@ void hda_codec_bus_init(DeviceState *dev, HDACodecBus *bus, size_t bus_size,
                         hda_codec_response_func response,
                         hda_codec_xfer_func xfer)
 {
-    qbus_create_inplace(bus, bus_size, TYPE_HDA_BUS, dev, NULL);
+    qbus_init(bus, bus_size, TYPE_HDA_BUS, dev, NULL);
     bus->response = response;
     bus->xfer = xfer;
 }
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 9014cd30b3a..fa933cd3263 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -77,7 +77,7 @@ static const TypeInfo floppy_bus_info = {
 
 static void floppy_bus_create(FDCtrl *fdc, FloppyBus *bus, DeviceState *dev)
 {
-    qbus_create_inplace(bus, sizeof(FloppyBus), TYPE_FLOPPY_BUS, dev, NULL);
+    qbus_init(bus, sizeof(FloppyBus), TYPE_FLOPPY_BUS, dev, NULL);
     bus->fdc = fdc;
 }
 
diff --git a/hw/block/swim.c b/hw/block/swim.c
index 509c2f49003..333da08ce09 100644
--- a/hw/block/swim.c
+++ b/hw/block/swim.c
@@ -421,8 +421,7 @@ static void sysbus_swim_realize(DeviceState *dev, Error **errp)
     Swim *sys = SWIM(dev);
     SWIMCtrl *swimctrl = &sys->ctrl;
 
-    qbus_create_inplace(&swimctrl->bus, sizeof(SWIMBus), TYPE_SWIM_BUS, dev,
-                        NULL);
+    qbus_init(&swimctrl->bus, sizeof(SWIMBus), TYPE_SWIM_BUS, dev, NULL);
     swimctrl->bus.ctrl = swimctrl;
 }
 
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index dd6bc27b3b5..f01ec2137c9 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -1048,8 +1048,8 @@ static void virtio_serial_device_realize(DeviceState *dev, Error **errp)
                 config_size);
 
     /* Spawn a new virtio-serial bus on which the ports will ride as devices */
-    qbus_create_inplace(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
-                        dev, vdev->bus_name);
+    qbus_init(&vser->bus, sizeof(vser->bus), TYPE_VIRTIO_SERIAL_BUS,
+              dev, vdev->bus_name);
     qbus_set_hotplug_handler(BUS(&vser->bus), OBJECT(vser));
     vser->bus.vser = vser;
     QTAILQ_INIT(&vser->ports);
diff --git a/hw/core/bus.c b/hw/core/bus.c
index 9cfbc3a6877..cec49985024 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -99,7 +99,8 @@ static void bus_reset_child_foreach(Object *obj, ResettableChildCallback cb,
     }
 }
 
-static void qbus_init(BusState *bus, DeviceState *parent, const char *name)
+static void qbus_init_internal(BusState *bus, DeviceState *parent,
+                               const char *name)
 {
     const char *typename = object_get_typename(OBJECT(bus));
     BusClass *bc;
@@ -151,11 +152,11 @@ static void bus_unparent(Object *obj)
     bus->parent = NULL;
 }
 
-void qbus_create_inplace(void *bus, size_t size, const char *typename,
-                         DeviceState *parent, const char *name)
+void qbus_init(void *bus, size_t size, const char *typename,
+               DeviceState *parent, const char *name)
 {
     object_initialize(bus, size, typename);
-    qbus_init(bus, parent, name);
+    qbus_init_internal(bus, parent, name);
 }
 
 BusState *qbus_create(const char *typename, DeviceState *parent, const char *name)
@@ -163,7 +164,7 @@ BusState *qbus_create(const char *typename, DeviceState *parent, const char *nam
     BusState *bus;
 
     bus = BUS(object_new(typename));
-    qbus_init(bus, parent, name);
+    qbus_init_internal(bus, parent, name);
 
     return bus;
 }
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index aaae8e23cc4..05c1da3d311 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -340,11 +340,13 @@ static BusState *main_system_bus;
 
 static void main_system_bus_create(void)
 {
-    /* assign main_system_bus before qbus_create_inplace()
-     * in order to make "if (bus != sysbus_get_default())" work */
+    /*
+     * assign main_system_bus before qbus_init()
+     * in order to make "if (bus != sysbus_get_default())" work
+     */
     main_system_bus = g_malloc0(system_bus_info.instance_size);
-    qbus_create_inplace(main_system_bus, system_bus_info.instance_size,
-                        TYPE_SYSTEM_BUS, NULL, "main-system-bus");
+    qbus_init(main_system_bus, system_bus_info.instance_size,
+              TYPE_SYSTEM_BUS, NULL, "main-system-bus");
     OBJECT(main_system_bus)->free = g_free;
 }
 
diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c
index abdddbc67c2..c995bba1d9f 100644
--- a/hw/gpio/bcm2835_gpio.c
+++ b/hw/gpio/bcm2835_gpio.c
@@ -299,8 +299,7 @@ static void bcm2835_gpio_init(Object *obj)
     DeviceState *dev = DEVICE(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
-                        TYPE_SD_BUS, DEVICE(s), "sd-bus");
+    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, DEVICE(s), "sd-bus");
 
     memory_region_init_io(&s->iomem, obj,
             &bcm2835_gpio_ops, s, "bcm2835_gpio", 0x1000);
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index e70ebc83a07..ca844419106 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -71,7 +71,7 @@ static const TypeInfo ide_bus_info = {
 void ide_bus_new(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
                  int bus_id, int max_units)
 {
-    qbus_create_inplace(idebus, idebus_size, TYPE_IDE_BUS, dev, NULL);
+    qbus_init(idebus, idebus_size, TYPE_IDE_BUS, dev, NULL);
     idebus->bus_id = bus_id;
     idebus->max_units = max_units;
 }
diff --git a/hw/ipack/ipack.c b/hw/ipack/ipack.c
index d28e7f6449e..ae20f36da68 100644
--- a/hw/ipack/ipack.c
+++ b/hw/ipack/ipack.c
@@ -35,7 +35,7 @@ void ipack_bus_init(IPackBus *bus, size_t bus_size,
                     uint8_t n_slots,
                     qemu_irq_handler handler)
 {
-    qbus_create_inplace(bus, bus_size, TYPE_IPACK_BUS, parent, NULL);
+    qbus_init(bus, bus_size, TYPE_IPACK_BUS, parent, NULL);
     bus->n_slots = n_slots;
     bus->set_irq = handler;
 }
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index d1abcd97b51..993bac017db 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1038,8 +1038,8 @@ static void mos6522_q800_via1_init(Object *obj)
     sysbus_init_mmio(sbd, &v1s->via_mem);
 
     /* ADB */
-    qbus_create_inplace((BusState *)&v1s->adb_bus, sizeof(v1s->adb_bus),
-                        TYPE_ADB_BUS, DEVICE(v1s), "adb.0");
+    qbus_init((BusState *)&v1s->adb_bus, sizeof(v1s->adb_bus),
+              TYPE_ADB_BUS, DEVICE(v1s), "adb.0");
 
     qdev_init_gpio_in(DEVICE(obj), via1_irq_request, VIA1_IRQ_NB);
 }
diff --git a/hw/misc/macio/cuda.c b/hw/misc/macio/cuda.c
index edbd4186b2a..e917a6a095b 100644
--- a/hw/misc/macio/cuda.c
+++ b/hw/misc/macio/cuda.c
@@ -553,8 +553,8 @@ static void cuda_init(Object *obj)
     memory_region_init_io(&s->mem, obj, &mos6522_cuda_ops, s, "cuda", 0x2000);
     sysbus_init_mmio(sbd, &s->mem);
 
-    qbus_create_inplace(&s->adb_bus, sizeof(s->adb_bus), TYPE_ADB_BUS,
-                        DEVICE(obj), "adb.0");
+    qbus_init(&s->adb_bus, sizeof(s->adb_bus), TYPE_ADB_BUS,
+              DEVICE(obj), "adb.0");
 }
 
 static Property cuda_properties[] = {
diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 4515296e66a..c1fad43f6c6 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -387,8 +387,8 @@ static void macio_instance_init(Object *obj)
 
     memory_region_init(&s->bar, obj, "macio", 0x80000);
 
-    qbus_create_inplace(&s->macio_bus, sizeof(s->macio_bus), TYPE_MACIO_BUS,
-                        DEVICE(obj), "macio.0");
+    qbus_init(&s->macio_bus, sizeof(s->macio_bus), TYPE_MACIO_BUS,
+              DEVICE(obj), "macio.0");
 
     object_initialize_child(OBJECT(s), "dbdma", &s->dbdma, TYPE_MAC_DBDMA);
 
diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index 71924d4768c..4ad4f50e08c 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -754,8 +754,8 @@ static void pmu_realize(DeviceState *dev, Error **errp)
     timer_mod(s->one_sec_timer, s->one_sec_target);
 
     if (s->has_adb) {
-        qbus_create_inplace(&s->adb_bus, sizeof(s->adb_bus), TYPE_ADB_BUS,
-                            dev, "adb.0");
+        qbus_init(&s->adb_bus, sizeof(s->adb_bus), TYPE_ADB_BUS,
+                  dev, "adb.0");
         adb_register_autopoll_callback(adb_bus, pmu_adb_poll, s);
     }
 }
diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index c517a8a7047..a42c86080f2 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -18,7 +18,7 @@ static void nubus_bridge_init(Object *obj)
     NubusBridge *s = NUBUS_BRIDGE(obj);
     NubusBus *bus = &s->bus;
 
-    qbus_create_inplace(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
+    qbus_init(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
 
     qdev_init_gpio_out(DEVICE(s), bus->irqs, NUBUS_IRQS);
 }
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 2f247a9275c..6a571d18cfa 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -6539,8 +6539,8 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
         return;
     }
 
-    qbus_create_inplace(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
-                        &pci_dev->qdev, n->parent_obj.qdev.id);
+    qbus_init(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
+              &pci_dev->qdev, n->parent_obj.qdev.id);
 
     nvme_init_state(n);
     if (nvme_init_pci(n, pci_dev, errp)) {
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 93c35950d69..495dcff5ebb 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -50,8 +50,7 @@ static void nvme_subsys_realize(DeviceState *dev, Error **errp)
 {
     NvmeSubsystem *subsys = NVME_SUBSYS(dev);
 
-    qbus_create_inplace(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev,
-                        dev->id);
+    qbus_init(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev, dev->id);
 
     nvme_subsys_setup(subsys);
 }
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 19881c84f23..14cb15a0aa1 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -466,7 +466,7 @@ void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
                        MemoryRegion *address_space_io,
                        uint8_t devfn_min, const char *typename)
 {
-    qbus_create_inplace(bus, bus_size, typename, parent, name);
+    qbus_init(bus, bus_size, typename, parent, name);
     pci_root_bus_internal_init(bus, parent, address_space_mem,
                                address_space_io, devfn_min);
 }
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 3789c17edc2..d1f902ee862 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -374,8 +374,8 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
             br->bus_name = dev->qdev.id;
     }
 
-    qbus_create_inplace(sec_bus, sizeof(br->sec_bus), typename, DEVICE(dev),
-                        br->bus_name);
+    qbus_init(sec_bus, sizeof(br->sec_bus), typename, DEVICE(dev),
+              br->bus_name);
     sec_bus->parent_dev = dev;
     sec_bus->map_irq = br->map_irq ? br->map_irq : pci_swizzle_map_irq_fn;
     sec_bus->address_space_mem = &br->address_space_mem;
diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index ed92ce510d9..6fa47b889ca 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -427,8 +427,8 @@ static void init_event_facility(Object *obj)
                              sclp_event_set_allow_all_mask_sizes);
 
     /* Spawn a new bus for SCLP events */
-    qbus_create_inplace(&event_facility->sbus, sizeof(event_facility->sbus),
-                        TYPE_SCLP_EVENTS_BUS, sdev, NULL);
+    qbus_init(&event_facility->sbus, sizeof(event_facility->sbus),
+              TYPE_SCLP_EVENTS_BUS, sdev, NULL);
 
     object_initialize_child(obj, TYPE_SCLP_QUIESCE,
                             &event_facility->quiesce,
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 6a2df1c1e9a..c845a92c3a8 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -1261,8 +1261,7 @@ static void virtio_ccw_bus_new(VirtioBusState *bus, size_t bus_size,
     DeviceState *qdev = DEVICE(dev);
     char virtio_bus_name[] = "virtio-bus";
 
-    qbus_create_inplace(bus, bus_size, TYPE_VIRTIO_CCW_BUS,
-                        qdev, virtio_bus_name);
+    qbus_init(bus, bus_size, TYPE_VIRTIO_CCW_BUS, qdev, virtio_bus_name);
 }
 
 static void virtio_ccw_bus_class_init(ObjectClass *klass, void *data)
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index e28a6ea053a..77325d8cc7a 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -137,7 +137,7 @@ void scsi_device_unit_attention_reported(SCSIDevice *s)
 void scsi_bus_init_named(SCSIBus *bus, size_t bus_size, DeviceState *host,
                          const SCSIBusInfo *info, const char *bus_name)
 {
-    qbus_create_inplace(bus, bus_size, TYPE_SCSI_BUS, host, bus_name);
+    qbus_init(bus, bus_size, TYPE_SCSI_BUS, host, bus_name);
     bus->busnr = next_scsi_bus++;
     bus->info = info;
     qbus_set_bus_hotplug_handler(BUS(bus));
diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index bea6d97ef87..9166d6638de 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -738,8 +738,8 @@ static void allwinner_sdhost_init(Object *obj)
 {
     AwSdHostState *s = AW_SDHOST(obj);
 
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
-                         TYPE_AW_SDHOST_BUS, DEVICE(s), "sd-bus");
+    qbus_init(&s->sdbus, sizeof(s->sdbus),
+              TYPE_AW_SDHOST_BUS, DEVICE(s), "sd-bus");
 
     memory_region_init_io(&s->iomem, obj, &allwinner_sdhost_ops, s,
                            TYPE_AW_SDHOST, 4 * KiB);
diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index 50f5fdb88bc..088a7ac6ed4 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -403,8 +403,8 @@ static void bcm2835_sdhost_init(Object *obj)
 {
     BCM2835SDHostState *s = BCM2835_SDHOST(obj);
 
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
-                        TYPE_BCM2835_SDHOST_BUS, DEVICE(s), "sd-bus");
+    qbus_init(&s->sdbus, sizeof(s->sdbus),
+              TYPE_BCM2835_SDHOST_BUS, DEVICE(s), "sd-bus");
 
     memory_region_init_io(&s->iomem, obj, &bcm2835_sdhost_ops, s,
                           TYPE_BCM2835_SDHOST, 0x1000);
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 960f1550981..5e554bd4676 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -506,8 +506,7 @@ static void pl181_init(Object *obj)
     qdev_init_gpio_out_named(dev, &s->card_readonly, "card-read-only", 1);
     qdev_init_gpio_out_named(dev, &s->card_inserted, "card-inserted", 1);
 
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
-                        TYPE_PL181_BUS, dev, "sd-bus");
+    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_PL181_BUS, dev, "sd-bus");
 }
 
 static void pl181_class_init(ObjectClass *klass, void *data)
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 3dd2fc7a83f..124fbf8bbd4 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -560,8 +560,8 @@ static void pxa2xx_mmci_instance_init(Object *obj)
     qdev_init_gpio_out_named(dev, &s->rx_dma, "rx-dma", 1);
     qdev_init_gpio_out_named(dev, &s->tx_dma, "tx-dma", 1);
 
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
-                        TYPE_PXA2XX_MMCI_BUS, DEVICE(obj), "sd-bus");
+    qbus_init(&s->sdbus, sizeof(s->sdbus),
+              TYPE_PXA2XX_MMCI_BUS, DEVICE(obj), "sd-bus");
 }
 
 static void pxa2xx_mmci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 5b8678110b0..c9dc065cc52 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1337,8 +1337,7 @@ static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
 
 void sdhci_initfn(SDHCIState *s)
 {
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
-                        TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");
+    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");
 
     s->insert_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_raise_insertion_irq, s);
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 97ee58e20cf..e60854eeefc 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -373,8 +373,7 @@ static void ssi_sd_realize(SSIPeripheral *d, Error **errp)
     DeviceState *carddev;
     DriveInfo *dinfo;
 
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS,
-                        DEVICE(d), "sd-bus");
+    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, DEVICE(d), "sd-bus");
 
     /* Create and plug in the sd card */
     /* FIXME use a qdev drive property instead of drive_get_next() */
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 07083349f51..5d441a70650 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -82,7 +82,7 @@ const VMStateDescription vmstate_usb_device = {
 void usb_bus_new(USBBus *bus, size_t bus_size,
                  USBBusOps *ops, DeviceState *host)
 {
-    qbus_create_inplace(bus, bus_size, TYPE_USB_BUS, host, NULL);
+    qbus_init(bus, bus_size, TYPE_USB_BUS, host, NULL);
     qbus_set_bus_hotplug_handler(BUS(bus));
     bus->ops = ops;
     bus->busnr = next_usb_bus++;
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index f7043075be5..91ffd9f8ae8 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -1320,8 +1320,7 @@ static void ccid_realize(USBDevice *dev, Error **errp)
 
     usb_desc_create_serial(dev);
     usb_desc_init(dev);
-    qbus_create_inplace(&s->bus, sizeof(s->bus), TYPE_CCID_BUS, DEVICE(dev),
-                        NULL);
+    qbus_init(&s->bus, sizeof(s->bus), TYPE_CCID_BUS, DEVICE(dev), NULL);
     qbus_set_hotplug_handler(BUS(&s->bus), OBJECT(dev));
     s->intr = usb_ep_get(dev, USB_TOKEN_IN, CCID_INT_IN_EP);
     s->bulk = usb_ep_get(dev, USB_TOKEN_IN, CCID_BULK_IN_EP);
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 1af48a1b044..7b3ebca1781 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -733,8 +733,7 @@ static void virtio_mmio_realizefn(DeviceState *d, Error **errp)
     VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
     SysBusDevice *sbd = SYS_BUS_DEVICE(d);
 
-    qbus_create_inplace(&proxy->bus, sizeof(proxy->bus), TYPE_VIRTIO_MMIO_BUS,
-                        d, NULL);
+    qbus_init(&proxy->bus, sizeof(proxy->bus), TYPE_VIRTIO_MMIO_BUS, d, NULL);
     sysbus_init_irq(sbd, &proxy->irq);
 
     if (!kvm_eventfds_enabled()) {
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 6e16e2705ce..750aa47ec14 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -2187,8 +2187,7 @@ static void virtio_pci_bus_new(VirtioBusState *bus, size_t bus_size,
     DeviceState *qdev = DEVICE(dev);
     char virtio_bus_name[] = "virtio-bus";
 
-    qbus_create_inplace(bus, bus_size, TYPE_VIRTIO_PCI_BUS, qdev,
-                        virtio_bus_name);
+    qbus_init(bus, bus_size, TYPE_VIRTIO_PCI_BUS, qdev, virtio_bus_name);
 }
 
 static void virtio_pci_bus_class_init(ObjectClass *klass, void *data)
-- 
2.20.1


