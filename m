Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFBC1D9AF4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 17:15:35 +0200 (CEST)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb3xt-0008ID-Ve
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 11:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3fF-0001n0-3t
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33047
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f3-0003XH-Fm
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589900164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=btpUKcfTYVSO9TqlU9CvIWc5eRu3RaodCzx0RKYqr6g=;
 b=YHTUoCuQBBeSlLDcNthjfv7UlaN57Bst+mi1FGn4Ps0qmYX/zyvpsXARVAHZWSwIB21AH/
 UgW2StBYFfh0AnIEb782MO4oobdrR6abjRo7bRQrBYBOfX4mK34Kcdf/4UPwCD+3oDtcNr
 BIKeU5TwamlnZ5hgZfL8dN0Z0IRo4ME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-zYedSbOpNO-dTZSIYWBzkQ-1; Tue, 19 May 2020 10:55:58 -0400
X-MC-Unique: zYedSbOpNO-dTZSIYWBzkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D6201005510;
 Tue, 19 May 2020 14:55:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 156785C1C8;
 Tue, 19 May 2020 14:55:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 078AE11358D2; Tue, 19 May 2020 16:55:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/55] ssi: ssi_auto_connect_slaves() never does anything, drop
Date: Tue, 19 May 2020 16:55:17 +0200
Message-Id: <20200519145551.22836-22-armbru@redhat.com>
In-Reply-To: <20200519145551.22836-1-armbru@redhat.com>
References: <20200519145551.22836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 09:19:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, Alistair Francis <alistair@alistair23.me>,
 berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ssi_auto_connect_slaves(parent, cs_line, bus) iterates over @parent's
QOM children @dev of type TYPE_SSI_SLAVE.  It puts these on @bus, and
sets cs_line[] to qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0).

Suspicious: there is no protection against overrunning cs_line[].

Turns out it's safe because ssi_auto_connect_slaves() never finds any
such children.  Its called by realize methods of some (but not all)
devices providing an SSI bus, and gets passed the device.

SSI slave devices are always created with ssi_create_slave_no_init(),
optionally via ssi_create_slave().  This adds them to their SSI bus.
It doesn't set their QOM parent.

ssi_create_slave_no_init() is always immediately followed by
qdev_init_nofail(), with no QOM parent assigned, so
device_set_realized() puts the device into the /machine/unattached/
orphanage.  None become QOM children of a device providing an SSI bus.

ssi_auto_connect_slaves() was added in commit b4ae3cfa57 "ssi: Add
slave autoconnect helper".  I can't see which slaves it was supposed
to connect back then.

Cc: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/ssi/ssi.h  |  4 ----
 hw/ssi/aspeed_smc.c   |  1 -
 hw/ssi/imx_spi.c      |  2 --
 hw/ssi/mss-spi.c      |  1 -
 hw/ssi/ssi.c          | 33 ---------------------------------
 hw/ssi/xilinx_spi.c   |  1 -
 hw/ssi/xilinx_spips.c |  4 ----
 7 files changed, 46 deletions(-)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index 1107cb89ee..1725b13c32 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -86,10 +86,6 @@ SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
 
 uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
 
-/* Automatically connect all children nodes a spi controller as slaves */
-void ssi_auto_connect_slaves(DeviceState *parent, qemu_irq *cs_lines,
-                             SSIBus *bus);
-
 /* max111x.c */
 void max111x_set_input(DeviceState *dev, int line, uint8_t value);
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 2edccef2d5..4fab1f5f85 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1356,7 +1356,6 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
     /* Setup cs_lines for slaves */
     s->cs_lines = g_new0(qemu_irq, s->num_cs);
-    ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
 
     for (i = 0; i < s->num_cs; ++i) {
         sysbus_init_irq(sbd, &s->cs_lines[i]);
diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index 2dd9a631e1..2f09f15892 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -424,8 +424,6 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
-    ssi_auto_connect_slaves(dev, s->cs_lines, s->bus);
-
     for (i = 0; i < 4; ++i) {
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
index 3050fabb69..b2432c5a13 100644
--- a/hw/ssi/mss-spi.c
+++ b/hw/ssi/mss-spi.c
@@ -376,7 +376,6 @@ static void mss_spi_realize(DeviceState *dev, Error **errp)
     s->spi = ssi_create_bus(dev, "spi");
 
     sysbus_init_irq(sbd, &s->irq);
-    ssi_auto_connect_slaves(dev, &s->cs_line, s->spi);
     sysbus_init_irq(sbd, &s->cs_line);
 
     memory_region_init_io(&s->mmio, OBJECT(s), &spi_ops, s,
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index c6415eb6e3..54106f5ef8 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -142,36 +142,3 @@ static void ssi_slave_register_types(void)
 }
 
 type_init(ssi_slave_register_types)
-
-typedef struct SSIAutoConnectArg {
-    qemu_irq **cs_linep;
-    SSIBus *bus;
-} SSIAutoConnectArg;
-
-static int ssi_auto_connect_slave(Object *child, void *opaque)
-{
-    SSIAutoConnectArg *arg = opaque;
-    SSISlave *dev = (SSISlave *)object_dynamic_cast(child, TYPE_SSI_SLAVE);
-    qemu_irq cs_line;
-
-    if (!dev) {
-        return 0;
-    }
-
-    cs_line = qdev_get_gpio_in_named(DEVICE(dev), SSI_GPIO_CS, 0);
-    qdev_set_parent_bus(DEVICE(dev), BUS(arg->bus));
-    **arg->cs_linep = cs_line;
-    (*arg->cs_linep)++;
-    return 0;
-}
-
-void ssi_auto_connect_slaves(DeviceState *parent, qemu_irq *cs_line,
-                             SSIBus *bus)
-{
-    SSIAutoConnectArg arg = {
-        .cs_linep = &cs_line,
-        .bus = bus
-    };
-
-    object_child_foreach(OBJECT(parent), ssi_auto_connect_slave, &arg);
-}
diff --git a/hw/ssi/xilinx_spi.c b/hw/ssi/xilinx_spi.c
index eba7ccd46a..80d1488dc7 100644
--- a/hw/ssi/xilinx_spi.c
+++ b/hw/ssi/xilinx_spi.c
@@ -334,7 +334,6 @@ static void xilinx_spi_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_irq(sbd, &s->irq);
     s->cs_lines = g_new0(qemu_irq, s->num_cs);
-    ssi_auto_connect_slaves(dev, s->cs_lines, s->spi);
     for (i = 0; i < s->num_cs; ++i) {
         sysbus_init_irq(sbd, &s->cs_lines[i]);
     }
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index e76cf290c8..b9371dbf8d 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1270,7 +1270,6 @@ static void xilinx_spips_realize(DeviceState *dev, Error **errp)
     XilinxSPIPS *s = XILINX_SPIPS(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     XilinxSPIPSClass *xsc = XILINX_SPIPS_GET_CLASS(s);
-    qemu_irq *cs;
     int i;
 
     DB_PRINT_L(0, "realized spips\n");
@@ -1297,9 +1296,6 @@ static void xilinx_spips_realize(DeviceState *dev, Error **errp)
 
     s->cs_lines = g_new0(qemu_irq, s->num_cs * s->num_busses);
     s->cs_lines_state = g_new0(bool, s->num_cs * s->num_busses);
-    for (i = 0, cs = s->cs_lines; i < s->num_busses; ++i, cs += s->num_cs) {
-        ssi_auto_connect_slaves(DEVICE(s), cs, s->spi[i]);
-    }
 
     sysbus_init_irq(sbd, &s->irq);
     for (i = 0; i < s->num_cs * s->num_busses; ++i) {
-- 
2.21.1


