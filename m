Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A441FA210
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 22:54:34 +0200 (CEST)
Received: from localhost ([::1]:56970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkw7l-0007Hl-6l
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 16:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuT-0003Hz-6V
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27779
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuK-0000Zl-F4
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/L3NZ99SdzmABA5zB/fdcOJrjBQcqB8LFNWCusONdI=;
 b=X8badhKAksZBYwY7CtK+VUbR7d8YIa7CSMyxe3xkU7yMrMrf4qhrcAdG7r9zR94Zda+Zfm
 SiDWbddvXmsq/E8kr6PvxpwsmMq06tuRXWEDMgllXgV78Hfhh8GxSmH1nGz0Sf4MnTf3UY
 H9KbSl+rvBTKeh8ZErv+uxaa8++76VI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-icnlmgrmMACD7Jxxw3i1nw-1; Mon, 15 Jun 2020 16:40:38 -0400
X-MC-Unique: icnlmgrmMACD7Jxxw3i1nw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20118100CCC6
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 20:40:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD8177FE95;
 Mon, 15 Jun 2020 20:40:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C2D431132E87; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 46/84] isa: Convert uses of isa_create(),
 isa_try_create() manually
Date: Mon, 15 Jun 2020 22:39:30 +0200
Message-Id: <20200615204008.3069956-47-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 16:40:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same transformation as in the previous commit.  Manual, because
convincing Coccinelle to transform these cases is not worthwhile.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200610053247.1583243-21-armbru@redhat.com>
---
 include/hw/net/ne2000-isa.h | 5 +++--
 hw/block/fdc.c              | 4 ++--
 hw/i386/pc.c                | 4 ++--
 hw/ppc/pnv.c                | 9 ++++-----
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/net/ne2000-isa.h b/include/hw/net/ne2000-isa.h
index eef17a680d..af59ee0b02 100644
--- a/include/hw/net/ne2000-isa.h
+++ b/include/hw/net/ne2000-isa.h
@@ -13,6 +13,7 @@
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
 #include "net/net.h"
+#include "qapi/error.h"
 
 #define TYPE_ISA_NE2000 "ne2k_isa"
 
@@ -23,14 +24,14 @@ static inline ISADevice *isa_ne2000_init(ISABus *bus, int base, int irq,
 
     qemu_check_nic_model(nd, "ne2k_isa");
 
-    d = isa_try_create(bus, TYPE_ISA_NE2000);
+    d = isa_try_new(TYPE_ISA_NE2000);
     if (d) {
         DeviceState *dev = DEVICE(d);
 
         qdev_prop_set_uint32(dev, "iobase", base);
         qdev_prop_set_uint32(dev, "irq",    irq);
         qdev_set_nic_properties(dev, nd);
-        qdev_init_nofail(dev);
+        isa_realize_and_unref(d, bus, &error_fatal);
     }
     return d;
 }
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 1feb398875..a3250f6fdb 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -2544,7 +2544,7 @@ ISADevice *fdctrl_init_isa(ISABus *bus, DriveInfo **fds)
     DeviceState *dev;
     ISADevice *isadev;
 
-    isadev = isa_try_create(bus, TYPE_ISA_FDC);
+    isadev = isa_try_new(TYPE_ISA_FDC);
     if (!isadev) {
         return NULL;
     }
@@ -2558,7 +2558,7 @@ ISADevice *fdctrl_init_isa(ISABus *bus, DriveInfo **fds)
         qdev_prop_set_drive(dev, "driveB", blk_by_legacy_dinfo(fds[1]),
                             &error_fatal);
     }
-    qdev_init_nofail(dev);
+    isa_realize_and_unref(isadev, bus, &error_fatal);
 
     return isadev;
 }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index ab2380c01f..30a2b5eb30 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1158,14 +1158,14 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
     i8042 = isa_create_simple(isa_bus, "i8042");
     if (!no_vmport) {
         isa_create_simple(isa_bus, TYPE_VMPORT);
-        vmmouse = isa_try_create(isa_bus, "vmmouse");
+        vmmouse = isa_try_new("vmmouse");
     } else {
         vmmouse = NULL;
     }
     if (vmmouse) {
         object_property_set_link(OBJECT(vmmouse), OBJECT(i8042),
                                  "i8042", &error_abort);
-        qdev_init_nofail(DEVICE(vmmouse));
+        isa_realize_and_unref(vmmouse, isa_bus, &error_fatal);
     }
     port92 = isa_create_simple(isa_bus, TYPE_PORT92);
 
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index e0588285a2..ffaf12b006 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -694,12 +694,11 @@ static bool pnv_match_cpu(const char *default_type, const char *cpu_type)
 
 static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmc *bmc, uint32_t irq)
 {
-    Object *obj;
+    ISADevice *dev = isa_new("isa-ipmi-bt");
 
-    obj = OBJECT(isa_create(bus, "isa-ipmi-bt"));
-    object_property_set_link(obj, OBJECT(bmc), "bmc", &error_fatal);
-    object_property_set_int(obj, irq, "irq", &error_fatal);
-    object_property_set_bool(obj, true, "realized", &error_fatal);
+    object_property_set_link(OBJECT(dev), OBJECT(bmc), "bmc", &error_fatal);
+    object_property_set_int(OBJECT(dev), irq, "irq", &error_fatal);
+    isa_realize_and_unref(dev, bus, &error_fatal);
 }
 
 static void pnv_chip_power10_pic_print_info(PnvChip *chip, Monitor *mon)
-- 
2.26.2


