Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0EA3E0329
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:29:34 +0200 (CEST)
Received: from localhost ([::1]:48340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHtl-0005o1-RP
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHsE-0002w6-EN
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHsA-0003OK-Pe
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KFXTVs+sC+WW8MRDSK2vVKiIDqTn49cLiD4FYlXIYog=;
 b=D5KDRV+/rGwhuYO6L2gaaRO5keg/eTbtXPVyTFKNPqtQXAzNjgiDBtAK4Z36ZeATeApHa+
 kPs+ghykAriznB/UlRBtNBe1DzDSwmdffJQyVK8dE5rDbkGukpsPGSwwVfRqsja/3C4L5E
 XLGc8d/2jBiCCaUcwzipbx14CEZ/h68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-xqhrEpGWP06jOabukpIAjg-1; Wed, 04 Aug 2021 10:27:51 -0400
X-MC-Unique: xqhrEpGWP06jOabukpIAjg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED540801B3D;
 Wed,  4 Aug 2021 14:27:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABDA560BF4;
 Wed,  4 Aug 2021 14:27:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 71F19180098A; Wed,  4 Aug 2021 16:27:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] floppy: move sun4m_fdctrl_init
Date: Wed,  4 Aug 2021 16:27:34 +0200
Message-Id: <20210804142737.3366441-5-kraxel@redhat.com>
In-Reply-To: <20210804142737.3366441-1-kraxel@redhat.com>
References: <20210804142737.3366441-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Needed by sparc machine init.

Move to separate source file so we can keep it in core qemu
when building floppy as module.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/block/fdc-module.c | 16 ++++++++++++++++
 hw/block/fdc-sysbus.c | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/block/fdc-module.c b/hw/block/fdc-module.c
index 11e6ae7c0cb9..3682b5c1ebd1 100644
--- a/hw/block/fdc-module.c
+++ b/hw/block/fdc-module.c
@@ -54,6 +54,22 @@ void fdctrl_init_sysbus(qemu_irq irq, int dma_chann,
     fdctrl_init_drives(&sys->state.bus, fds);
 }
 
+void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
+                       DriveInfo **fds, qemu_irq *fdc_tc)
+{
+    DeviceState *dev;
+    FDCtrlSysBus *sys;
+
+    dev = qdev_new("sun-fdtwo");
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sys = SYSBUS_FDC(dev);
+    sysbus_connect_irq(SYS_BUS_DEVICE(sys), 0, irq);
+    sysbus_mmio_map(SYS_BUS_DEVICE(sys), 0, io_base);
+    *fdc_tc = qdev_get_gpio_in(dev, 0);
+
+    fdctrl_init_drives(&sys->state.bus, fds);
+}
+
 void fdctrl_init_drives(FloppyBus *bus, DriveInfo **fds)
 {
     DeviceState *dev;
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index 5a8d393d31c2..b358b6467ef5 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -80,22 +80,6 @@ static void fdctrl_handle_tc(void *opaque, int irq, int level)
     trace_fdctrl_tc_pulse(level);
 }
 
-void sun4m_fdctrl_init(qemu_irq irq, hwaddr io_base,
-                       DriveInfo **fds, qemu_irq *fdc_tc)
-{
-    DeviceState *dev;
-    FDCtrlSysBus *sys;
-
-    dev = qdev_new("sun-fdtwo");
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    sys = SYSBUS_FDC(dev);
-    sysbus_connect_irq(SYS_BUS_DEVICE(sys), 0, irq);
-    sysbus_mmio_map(SYS_BUS_DEVICE(sys), 0, io_base);
-    *fdc_tc = qdev_get_gpio_in(dev, 0);
-
-    fdctrl_init_drives(&sys->state.bus, fds);
-}
-
 static void sysbus_fdc_common_instance_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
-- 
2.31.1


