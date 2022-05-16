Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86F75288EE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:33:22 +0200 (CEST)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcin-0006EI-OI
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccJ-00047l-SZ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccI-0006Gf-Ae
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rb1eUdKMH3aAd+J8cxifsP/i75QINdc9GKcLd6uAaU0=;
 b=DXpWUN7mx8iO/9//0EPfdSus6bKZsL+eUyDFW20nUsqGKgKa7BIaHRwiSjuxh4mr4XvOzG
 avq+NeGhJOqz99u3JzmYu9PMhvYMcnV2dOI1swQzAsrPPmGtuu9o41ou93xfblCtdc4TVA
 sbt4RLCmE1xqoWhU2IUaBOqnBRnFagQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615--31JlRLRPTGnaH2hm2R4hA-1; Mon, 16 May 2022 11:26:34 -0400
X-MC-Unique: -31JlRLRPTGnaH2hm2R4hA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40244185A7BA;
 Mon, 16 May 2022 15:26:33 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 282F8492C14;
 Mon, 16 May 2022 15:26:32 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 15/35] acpi: ich9-smb: add support for AcpiDevAmlIf interface
Date: Mon, 16 May 2022 11:25:50 -0400
Message-Id: <20220516152610.1963435-16-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-1-imammedo@redhat.com>
References: <20220516152610.1963435-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

wire AcpiDevAmlIf interface to build ich9-smb and its slave
devices AML. It will be used by followup patches to switch
from creating AML in ad-hoc way to a more systematic one
that will scan present devices and ask them to provide
their AML code like it's done with ISA devices.

This patch is a partial conversion, as it only fetches
AML from slave devices attached to its I2C bus.

The conversion will be completed when PCI bus is
switched to use AcpiDevAmlIf and build_smb0() could be
dropped.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i2c/smbus_ich9.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index 44dd5653b7..ee50ba1f2c 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -29,6 +29,7 @@
 
 #include "hw/i386/ich9.h"
 #include "qom/object.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 OBJECT_DECLARE_SIMPLE_TYPE(ICH9SMBState, ICH9_SMB_DEVICE)
 
@@ -94,10 +95,22 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
                      &s->smb.io);
 }
 
+static void build_ich9_smb_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    BusChild *kid;
+    ICH9SMBState *s = ICH9_SMB_DEVICE(adev);
+    BusState *bus = BUS(s->smb.smbus);
+
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+            call_dev_aml_func(DEVICE(kid->child), scope);
+    }
+}
+
 static void ich9_smb_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_ICH9_6;
@@ -112,6 +125,7 @@ static void ich9_smb_class_init(ObjectClass *klass, void *data)
      * pc_q35_init()
      */
     dc->user_creatable = false;
+    adevc->build_dev_aml = build_ich9_smb_aml;
 }
 
 static void ich9_smb_set_irq(PMSMBus *pmsmb, bool enabled)
@@ -143,6 +157,7 @@ static const TypeInfo ich9_smb_info = {
     .class_init = ich9_smb_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { TYPE_ACPI_DEV_AML_IF },
         { },
     },
 };
-- 
2.31.1


