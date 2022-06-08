Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E0A543255
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:17:42 +0200 (CEST)
Received: from localhost ([::1]:33518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywVB-0000TJ-Ay
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8E-0001OR-VH
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8D-0004Mg-8V
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eV7+JHRtk79WvcaqEUilLTKHiCIfu00XgdJhlWLepAE=;
 b=fRQsr/A3ihAtghv/nprUbBmggwslgOeUmUvydbnyR6PQtFtQ/VQGRu82L6vi5hk8QTdFM+
 bNU84PJGhkK3MuKvgM930TGsx8n+4a0+jXqE2CEhwOtzu8Y5pkxspzPdozC3Xu/pYBt7rN
 shx7NgATxDq7kmQOMhrxL8ivR3Tpe9Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-nBcmQvscPWauSSe3GfNBKg-1; Wed, 08 Jun 2022 09:53:55 -0400
X-MC-Unique: nBcmQvscPWauSSe3GfNBKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DC6C85A582
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:55 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD962C27E97;
 Wed,  8 Jun 2022 13:53:54 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 15/35] acpi: ich9-smb: add support for AcpiDevAmlIf
 interface
Date: Wed,  8 Jun 2022 09:53:20 -0400
Message-Id: <20220608135340.3304695-16-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
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


