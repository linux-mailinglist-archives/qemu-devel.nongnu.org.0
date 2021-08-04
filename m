Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98BF3E0363
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:34:14 +0200 (CEST)
Received: from localhost ([::1]:33776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHyH-0006d8-Nj
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHsH-00038S-9V
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHsE-0003Qc-FC
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUtcPKkcpAvixTwhou1hQK/9qEHfpZ/obicDdxAHEEc=;
 b=LbxwTHbtqyxyMJpEoSJzVdsvg4G2uJ06BTRpr7gSn5EqKFSW88MSegS6qwYmbOFhm2ebry
 qnxJHVlQqrMvtHjU1aPQkgBWS3kgISPZdzVu1OIl/XtoP3bm1zwMuO+v17vbTdo+8zjZca
 mm/3kyA7o/sjz2ZUQY9mHKfsoFbDZ6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-gJPUBdY5M8iLN7YweBwRpA-1; Wed, 04 Aug 2021 10:27:56 -0400
X-MC-Unique: gJPUBdY5M8iLN7YweBwRpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 702A5106F8DE;
 Wed,  4 Aug 2021 14:27:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D38F3226E9;
 Wed,  4 Aug 2021 14:27:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 64EF81800989; Wed,  4 Aug 2021 16:27:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] floppy: move fdctrl_init_sysbus
Date: Wed,  4 Aug 2021 16:27:33 +0200
Message-Id: <20210804142737.3366441-4-kraxel@redhat.com>
In-Reply-To: <20210804142737.3366441-1-kraxel@redhat.com>
References: <20210804142737.3366441-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Needed by mips machine init.

Move to separate source file so we can keep it in core qemu
when building floppy as module.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/block/fdc-internal.h | 15 +++++++++++++++
 hw/block/fdc-module.c   | 21 +++++++++++++++++++++
 hw/block/fdc-sysbus.c   | 34 ----------------------------------
 3 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/hw/block/fdc-internal.h b/hw/block/fdc-internal.h
index a74cd5e4b9f2..f6c56f6e827f 100644
--- a/hw/block/fdc-internal.h
+++ b/hw/block/fdc-internal.h
@@ -30,6 +30,7 @@
 #include "hw/block/block.h"
 #include "hw/block/fdc.h"
 #include "hw/isa/isa.h"
+#include "hw/sysbus.h"
 #include "qapi/qapi-types-block.h"
 
 typedef struct FDCtrl FDCtrl;
@@ -159,6 +160,20 @@ struct FDCtrlISABus {
     int32_t bootindexB;
 };
 
+#define TYPE_SYSBUS_FDC "base-sysbus-fdc"
+typedef struct FDCtrlSysBusClass FDCtrlSysBusClass;
+typedef struct FDCtrlSysBus FDCtrlSysBus;
+DECLARE_OBJ_CHECKERS(FDCtrlSysBus, FDCtrlSysBusClass,
+                     SYSBUS_FDC, TYPE_SYSBUS_FDC)
+
+struct FDCtrlSysBus {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    struct FDCtrl state;
+};
+
 extern const FDFormat fd_formats[];
 extern const VMStateDescription vmstate_fdc;
 
diff --git a/hw/block/fdc-module.c b/hw/block/fdc-module.c
index 8309e99361bc..11e6ae7c0cb9 100644
--- a/hw/block/fdc-module.c
+++ b/hw/block/fdc-module.c
@@ -29,10 +29,31 @@
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
 #include "hw/block/fdc.h"
+#include "hw/sysbus.h"
 #include "qapi/error.h"
 #include "sysemu/blockdev.h"
 #include "fdc-internal.h"
 
+void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
+                        hwaddr mmio_base, DriveInfo **fds)
+{
+    FDCtrl *fdctrl;
+    DeviceState *dev;
+    SysBusDevice *sbd;
+    FDCtrlSysBus *sys;
+
+    dev = qdev_new("sysbus-fdc");
+    sys = SYSBUS_FDC(dev);
+    fdctrl = &sys->state;
+    fdctrl->dma_chann = dma_chann; /* FIXME */
+    sbd = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(sbd, &error_fatal);
+    sysbus_connect_irq(sbd, 0, irq);
+    sysbus_mmio_map(sbd, 0, mmio_base);
+
+    fdctrl_init_drives(&sys->state.bus, fds);
+}
+
 void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds)
 {
     DeviceState *dev;
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 57fc8773f124..5a8d393d31c2 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -32,12 +32,6 @@
 #include "fdc-internal.h"
 #include "trace.h"
 
-#define TYPE_SYSBUS_FDC "base-sysbus-fdc"
-typedef struct FDCtrlSysBusClass FDCtrlSysBusClass;
-typedef struct FDCtrlSysBus FDCtrlSysBus;
-DECLARE_OBJ_CHECKERS(FDCtrlSysBus, FDCtrlSysBusClass,
-                     SYSBUS_FDC, TYPE_SYSBUS_FDC)
-
 struct FDCtrlSysBusClass {
     /*< private >*/
     SysBusDeviceClass parent_class;
@@ -46,14 +40,6 @@ struct FDCtrlSysBusClass {
     bool use_strict_io;
 };
 
-struct FDCtrlSysBus {
-    /*< private >*/
-    SysBusDevice parent_obj;
-    /*< public >*/
-
-    struct FDCtrl state;
-};
-
 static uint64_t fdctrl_read_mem(void *opaque, hwaddr reg, unsigned ize)
 {
     return fdctrl_read(opaque, (uint32_t)reg);
@@ -94,26 +80,6 @@ static void fdctrl_handle_tc(void *opaque, int irq, int level)
     trace_fdctrl_tc_pulse(level);
 }
 
-void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
-                        hwaddr mmio_base, DriveInfo **fds)
-{
-    FDCtrl *fdctrl;
-    DeviceState *dev;
-    SysBusDevice *sbd;
-    FDCtrlSysBus *sys;
-
-    dev = qdev_new("sysbus-fdc");
-    sys = SYSBUS_FDC(dev);
-    fdctrl = &sys->state;
-    fdctrl->dma_chann = dma_chann; /* FIXME */
-    sbd = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(sbd, &error_fatal);
-    sysbus_connect_irq(sbd, 0, irq);
-    sysbus_mmio_map(sbd, 0, mmio_base);
-
-    fdctrl_init_drives(&sys->state.bus, fds);
-}
-
 void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
                        DriveInfo **fds, qemu_irq *fdc_tc)
 {
-- 
2.31.1


