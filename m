Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253D6545F1A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:33:02 +0200 (CEST)
Received: from localhost ([::1]:41942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nza4j-0003RD-2f
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWj-0007Hn-6g
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWh-0006F0-Km
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E4XMO6SNV8cB5seqMqIW7M9vTpFNU/jgvVEGvtachsk=;
 b=LOCk/SiX6v80QTFMzru6Iag6NQuZPzdOKl2BjkyjzbG5BrYEVFX1A16jI3uI/hk0ktaIkf
 ixPR8pYAKlveS6LMbJMvdPbhfyBhwY9EINF47CxYIf2Zpr5fF0NB2XtmR3L0S5+/l8BExr
 iQizriXGYffyNG+7rzc73cRbhBn2Oak=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-Lon3WsnPNxiQCq298IPXOQ-1; Fri, 10 Jun 2022 03:57:49 -0400
X-MC-Unique: Lon3WsnPNxiQCq298IPXOQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z13-20020a7bc7cd000000b0039c4a238eadso4998540wmk.9
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E4XMO6SNV8cB5seqMqIW7M9vTpFNU/jgvVEGvtachsk=;
 b=AgB460XiGg8BrvwSIIHdLg4DOG5w+DhqDX6/0fY+ztGZWY4mIRUMKKHHreODJKHvsi
 MZQg1KYi3gbTtsEENP5rk4SokCWegANQFabUq9dpzC3o5Zaq7nsA2JnoClgM0ObHpht8
 4+cRNFXiSD9EMhuzSKZ0+gMFKbI7OgshwpvL3Z+QxjTR/xudJ3Gao0hcdLrjdo+aC4Wc
 1XHkVLhat3lHVxw54LUVawwtQCmUmEUmAYDpsRWNggv39W+cFNzS2WLiOjCgj5R9TCrp
 +tpXW+XnNJNQNzagwFP6Z5y0zTD4TEcWLmEcRcfwVpvZ+OQrL1LhmQ7B2Zc81ow2VsTe
 W9gA==
X-Gm-Message-State: AOAM532iBF6WoWD5MdSS0De/H/cPe4iGMqivsK5Wrp1UJ419tRgPI8Sy
 DU5d7TJ67RRXUcA2VY3Qkr+fVDv+hyEZ1hN8swdKswbyrdgXv/zvpNOQo0P0b7tMYMMSnFzwhmY
 rrpUsH0mOzuhlQ/H/869vlL/YE/QaEzcTjbEJZoKAgm2jiJXWrxBM2dGSsTG/
X-Received: by 2002:a05:600c:590:b0:39c:5cd4:8623 with SMTP id
 o16-20020a05600c059000b0039c5cd48623mr7370315wmd.45.1654847868459; 
 Fri, 10 Jun 2022 00:57:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ7+3FVmCkwWGPf5jxZObIKindZm7wQsebSguW7vfDX3pQkBHmLDiFGG9ukd4kw529Ckc10g==
X-Received: by 2002:a05:600c:590:b0:39c:5cd4:8623 with SMTP id
 o16-20020a05600c059000b0039c5cd48623mr7370292wmd.45.1654847868196; 
 Fri, 10 Jun 2022 00:57:48 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 l21-20020a1ced15000000b003942a244ed1sm1973338wmh.22.2022.06.10.00.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:47 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 15/54] acpi: ich9-smb: add support for AcpiDevAmlIf interface
Message-ID: <20220610075631.367501-16-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

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
Message-Id: <20220608135340.3304695-16-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


