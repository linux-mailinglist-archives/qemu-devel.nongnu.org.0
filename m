Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C6E1D9AD0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 17:11:17 +0200 (CEST)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb3qT-0008Bm-LA
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 11:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f6-0001N9-6V
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:08 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49640
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jb3f1-0003W9-GB
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:56:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589900162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edfFv7pTdQjs6nkhfmpe/HlioJvndWsvl1MjBi79YMs=;
 b=FIdQrAqu/3u0KtvCshnBtdTV5mHdhtm7nPFrSa75mNkxPJLYRNW7Ey8NqxZll4xDujCfrK
 M5u8HLfIQcw0/2dz7Nq/w5l6GvdNo6PnDgkvWxqR0frkSTEvfMPdfglqPr9xgsUxEGx/vD
 /EhkBhNnCt+Ypc1OFkchvOHzCFUFieE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-ggnyDww8M7isZBJzZ_M7Ag-1; Tue, 19 May 2020 10:56:00 -0400
X-MC-Unique: ggnyDww8M7isZBJzZ_M7Ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 005FD100962E
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 14:56:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DEE26E71C;
 Tue, 19 May 2020 14:55:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4A1561135226; Tue, 19 May 2020 16:55:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 41/55] sysbus: Tidy up sysbus_init_child_obj()'s @childsize
 arg, part 2
Date: Tue, 19 May 2020 16:55:37 +0200
Message-Id: <20200519145551.22836-42-armbru@redhat.com>
In-Reply-To: <20200519145551.22836-1-armbru@redhat.com>
References: <20200519145551.22836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 00:34:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The callers of sysbus_init_child_obj() commonly pass either &child,
sizeof(child), or pchild, sizeof(*pchild).  Tidy up the few that use
something else instead, mostly to keep future commits simpler.

Coccinelle script:

    @@
    expression parent, propname, type;
    expression child;
    type T;
    T proxy;
    @@
    (
         sysbus_init_child_obj(parent, propname, &child, sizeof(child), type)
    |
         sysbus_init_child_obj(parent, propname, child, sizeof(*child), type)
    |
    -    sysbus_init_child_obj(parent, propname, child, sizeof(proxy), type)
    +    sysbus_init_child_obj(parent, propname, child, sizeof(*child), type)
    )

This script is *unsound*: for each change we need to verify the
@childsize argument stays the same.  I did.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/mps2-tz.c | 15 +++++++--------
 hw/arm/musca.c   |  7 +++----
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index ad0bc9365a..90f4449b9d 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -193,7 +193,7 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
     SysBusDevice *s;
     DeviceState *orgate_dev = DEVICE(&mms->uart_irq_orgate);
 
-    sysbus_init_child_obj(OBJECT(mms), name, uart, sizeof(mms->uart[0]),
+    sysbus_init_child_obj(OBJECT(mms), name, uart, sizeof(*uart),
                           TYPE_CMSDK_APB_UART);
     qdev_prop_set_chr(DEVICE(uart), "chardev", serial_hd(i));
     qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", SYSCLK_FRQ);
@@ -214,8 +214,8 @@ static MemoryRegion *make_scc(MPS2TZMachineState *mms, void *opaque,
     DeviceState *sccdev;
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
-    sysbus_init_child_obj(OBJECT(mms), "scc", scc,
-                          sizeof(mms->scc), TYPE_MPS2_SCC);
+    sysbus_init_child_obj(OBJECT(mms), "scc", scc, sizeof(*scc),
+                          TYPE_MPS2_SCC);
     sccdev = DEVICE(scc);
     qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
     qdev_prop_set_uint32(sccdev, "scc-aid", 0x00200008);
@@ -229,8 +229,8 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
 {
     MPS2FPGAIO *fpgaio = opaque;
 
-    sysbus_init_child_obj(OBJECT(mms), "fpgaio", fpgaio,
-                          sizeof(mms->fpgaio), TYPE_MPS2_FPGAIO);
+    sysbus_init_child_obj(OBJECT(mms), "fpgaio", fpgaio, sizeof(*fpgaio),
+                          TYPE_MPS2_FPGAIO);
     object_property_set_bool(OBJECT(fpgaio), true, "realized", &error_fatal);
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
 }
@@ -267,7 +267,7 @@ static MemoryRegion *make_mpc(MPS2TZMachineState *mms, void *opaque,
 
     memory_region_init_ram(ssram, NULL, name, ramsize[i], &error_fatal);
 
-    sysbus_init_child_obj(OBJECT(mms), mpcname, mpc, sizeof(mms->ssram_mpc[0]),
+    sysbus_init_child_obj(OBJECT(mms), mpcname, mpc, sizeof(*mpc),
                           TYPE_TZ_MPC);
     object_property_set_link(OBJECT(mpc), OBJECT(ssram),
                              "downstream", &error_fatal);
@@ -363,8 +363,7 @@ static MemoryRegion *make_spi(MPS2TZMachineState *mms, void *opaque,
     int i = spi - &mms->spi[0];
     SysBusDevice *s;
 
-    sysbus_init_child_obj(OBJECT(mms), name, spi, sizeof(mms->spi[0]),
-                          TYPE_PL022);
+    sysbus_init_child_obj(OBJECT(mms), name, spi, sizeof(*spi), TYPE_PL022);
     object_property_set_bool(OBJECT(spi), true, "realized", &error_fatal);
     s = SYS_BUS_DEVICE(spi);
     sysbus_connect_irq(s, 0, get_sse_irq_in(mms, 51 + i));
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index b7f1c4e128..a1a6e887ed 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -256,7 +256,7 @@ static MemoryRegion *make_mpc(MuscaMachineState *mms, void *opaque,
         g_assert_not_reached();
     }
 
-    sysbus_init_child_obj(OBJECT(mms), mpcname, mpc, sizeof(mms->mpc[0]),
+    sysbus_init_child_obj(OBJECT(mms), mpcname, mpc, sizeof(*mpc),
                           TYPE_TZ_MPC);
     object_property_set_link(OBJECT(mpc), OBJECT(downstream),
                              "downstream", &error_fatal);
@@ -279,7 +279,7 @@ static MemoryRegion *make_rtc(MuscaMachineState *mms, void *opaque,
 {
     PL031State *rtc = opaque;
 
-    sysbus_init_child_obj(OBJECT(mms), name, rtc, sizeof(mms->rtc), TYPE_PL031);
+    sysbus_init_child_obj(OBJECT(mms), name, rtc, sizeof(*rtc), TYPE_PL031);
     object_property_set_bool(OBJECT(rtc), true, "realized", &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(rtc), 0, get_sse_irq_in(mms, 39));
     return sysbus_mmio_get_region(SYS_BUS_DEVICE(rtc), 0);
@@ -293,8 +293,7 @@ static MemoryRegion *make_uart(MuscaMachineState *mms, void *opaque,
     int irqbase = 7 + i * 6;
     SysBusDevice *s;
 
-    sysbus_init_child_obj(OBJECT(mms), name, uart, sizeof(mms->uart[0]),
-                          TYPE_PL011);
+    sysbus_init_child_obj(OBJECT(mms), name, uart, sizeof(*uart), TYPE_PL011);
     qdev_prop_set_chr(DEVICE(uart), "chardev", serial_hd(i));
     object_property_set_bool(OBJECT(uart), true, "realized", &error_fatal);
     s = SYS_BUS_DEVICE(uart);
-- 
2.21.1


