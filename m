Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C97729361E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 09:53:42 +0200 (CEST)
Received: from localhost ([::1]:35032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUmSj-0000ke-L5
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 03:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUmOL-0005AS-EP
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 03:49:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUmOE-0001qP-EQ
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 03:49:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603180140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3YEpD+A54YL0EmstK7u8/+0duVoJMgnQOtRH4CPS8Q=;
 b=Bqt0ZZmF+hiFG5b98kuUD53qRDW5h0vbcrmXwS6x3t1NqhrgU5xP+00I8n4FHoZGwtBBtu
 VoC32omMt9s+7XxAnBihbcNXdflumwWU3jnamNvPsE5RaaNW1WtWm+jAnCFTF01ajmP6o3
 3tCiiqsSFZ2h8Ep7ecRArEho47aupUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-9DeYJy1gOaClHgVT4hvBtA-1; Tue, 20 Oct 2020 03:48:56 -0400
X-MC-Unique: 9DeYJy1gOaClHgVT4hvBtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 226D9803F5E;
 Tue, 20 Oct 2020 07:48:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E82F55763;
 Tue, 20 Oct 2020 07:48:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 44A4F9D8F; Tue, 20 Oct 2020 09:48:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/10] usb/xhci: add xhci_sysbus_build_aml() helper
Date: Tue, 20 Oct 2020 09:48:37 +0200
Message-Id: <20201020074844.5304-4-kraxel@redhat.com>
In-Reply-To: <20201020074844.5304-1-kraxel@redhat.com>
References: <20201020074844.5304-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The helper generates an acpi dsdt device entry
for the xhci sysbus device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/usb/xhci.h    |  2 ++
 hw/usb/hcd-xhci-sysbus.c | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/usb/xhci.h b/include/hw/usb/xhci.h
index dc0c29930dcc..5c90e1373e55 100644
--- a/include/hw/usb/xhci.h
+++ b/include/hw/usb/xhci.h
@@ -16,4 +16,6 @@
 /* must be power of 2 */
 #define XHCI_LEN_REGS 0x4000
 
+void xhci_sysbus_build_aml(Aml *scope, uint32_t mmio, unsigned int irq);
+
 #endif
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index 570618467356..29185d2261fb 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -13,6 +13,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "hcd-xhci-sysbus.h"
+#include "hw/acpi/aml-build.h"
 #include "hw/irq.h"
 
 static void xhci_sysbus_intr_raise(XHCIState *xhci, int n, bool level)
@@ -68,6 +69,20 @@ static void xhci_sysbus_instance_init(Object *obj)
     s->xhci.intr_raise = xhci_sysbus_intr_raise;
 }
 
+void xhci_sysbus_build_aml(Aml *scope, uint32_t mmio, unsigned int irq)
+{
+    Aml *dev = aml_device("XHCI");
+    Aml *crs = aml_resource_template();
+
+    aml_append(crs, aml_memory32_fixed(mmio, XHCI_LEN_REGS, AML_READ_WRITE));
+    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                                  AML_EXCLUSIVE, &irq, 1));
+
+    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0D10")));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 static Property xhci_sysbus_props[] = {
     DEFINE_PROP_UINT32("intrs", XHCISysbusState, xhci.numintrs, XHCI_MAXINTRS),
     DEFINE_PROP_UINT32("slots", XHCISysbusState, xhci.numslots, XHCI_MAXSLOTS),
-- 
2.27.0


