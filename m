Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9045435FD1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:58:06 +0200 (CEST)
Received: from localhost ([::1]:37298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVlt-0004zH-PF
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVYI-0002aa-Kf
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:44:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVYH-0004JH-3V
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634813040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAHZVTTSpFR2aYi9YoixPjZOJE9O81a6qTEA4Wx3tno=;
 b=hYQeYmQoci+uTgnWcZCPLpUUzW0oBHoyBZ01uBLX50f4WvGhNWokM1bF49OkAcHEsdwiiw
 WTNRqRjwohuEnBUdJW7P7nD1p7+dGsnT/x7ypYr43y4BmsS5OsDOQwgHhP1/SSWX12UPow
 zgRdxQEcFFwC14aynbPl7Vi6ZyaYyUE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-nDf7SAVGPsukRpxukQXWSw-1; Thu, 21 Oct 2021 06:43:59 -0400
X-MC-Unique: nDf7SAVGPsukRpxukQXWSw-1
Received: by mail-pl1-f199.google.com with SMTP id
 h3-20020a170902704300b0013dbfc88e14so60670plt.13
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAHZVTTSpFR2aYi9YoixPjZOJE9O81a6qTEA4Wx3tno=;
 b=Bh9nsOMfePFO4fu4yf1aYs9wmoSk9dJFP2hhBmV70KT0Eio078sVpePKVBYtFuTtD6
 wTOSbfLOfWL7HV/+PwMcy5Mes4kiQnOrY7JMKqY8b+dp/6apu3CeRQ0Yk60Q50kZeStz
 DnRjxcUuK2fb6e7Qgk4XTMyVqz6CaQ2cNs9srCBaS+FAtyMJWIxbGqkOMShyVMbI/RmQ
 qPLQGwbatzCAlnuaifxWvUYXCRem9gfxMyx6qcYnCEaoAezsGniQT3B7+DmGdoS3Q75t
 MWEhkUwWe/ZNCgMlVCzko5BNbqxzp2msCDW+tG3asIuA2Zpa8Y+yjvcoXnzBYXqneAXM
 EY2Q==
X-Gm-Message-State: AOAM531Paqtd8rXbxjne1HsHrcYYSuhEhpId6VOI3jm5jQGJsc1aWfYj
 WoL7GVeYpW65jzguWRmKgLERNCY1ZV4SJbUBi9MHieuTZRjuQy2GUpRJ/ZyeehrNliRzG7CWCFD
 5jdH4bGEVzXXaPwsaJTuOYeSIt4ApUQ+fhSVWfjql5KlowvhCyS+lBMSLkb7/Wbsk
X-Received: by 2002:a62:7656:0:b0:44c:591b:5a42 with SMTP id
 r83-20020a627656000000b0044c591b5a42mr4744644pfc.57.1634813037938; 
 Thu, 21 Oct 2021 03:43:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7T8Rrvr/LBsD+hJPH7C6Z0SSgGsqjwF5DZ0l1IK+3zQYA94se44x37sRul01libGydPdLHQ==
X-Received: by 2002:a62:7656:0:b0:44c:591b:5a42 with SMTP id
 r83-20020a627656000000b0044c591b5a42mr4744598pfc.57.1634813037593; 
 Thu, 21 Oct 2021 03:43:57 -0700 (PDT)
Received: from localhost.localdomain ([84.17.34.135])
 by smtp.gmail.com with ESMTPSA id e1sm5246893pgi.43.2021.10.21.03.43.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Oct 2021 03:43:56 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] x86-iommu: Fail early if vIOMMU specified after vfio-pci
Date: Thu, 21 Oct 2021 18:42:59 +0800
Message-Id: <20211021104259.57754-9-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211021104259.57754-1-peterx@redhat.com>
References: <20211021104259.57754-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, peterx@redhat.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Scan the pci bus to make sure there's no vfio-pci device attached before vIOMMU
is realized.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/x86-iommu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index 86ad03972e..58abce7edc 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -21,6 +21,7 @@
 #include "hw/sysbus.h"
 #include "hw/i386/x86-iommu.h"
 #include "hw/qdev-properties.h"
+#include "hw/vfio/pci.h"
 #include "hw/i386/pc.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -103,6 +104,16 @@ IommuType x86_iommu_get_type(void)
     return x86_iommu_default->type;
 }
 
+static void x86_iommu_pci_dev_hook(PCIBus *bus, PCIDevice *dev, void *opaque)
+{
+    Error **errp = (Error **)opaque;
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_VFIO_PCI)) {
+        error_setg(errp, "Device '%s' must be specified before vIOMMUs",
+                   TYPE_VFIO_PCI);
+    }
+}
+
 static void x86_iommu_realize(DeviceState *dev, Error **errp)
 {
     X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
@@ -120,6 +131,12 @@ static void x86_iommu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* Make sure there's no special device plugged before vIOMMU */
+    pci_for_each_device_all(x86_iommu_pci_dev_hook, (void *)errp);
+    if (*errp) {
+        return;
+    }
+
     /* If the user didn't specify IR, choose a default value for it */
     if (x86_iommu->intr_supported == ON_OFF_AUTO_AUTO) {
         x86_iommu->intr_supported = irq_all_kernel ?
@@ -151,6 +168,7 @@ static Property x86_iommu_properties[] = {
 static void x86_iommu_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+
     dc->realize = x86_iommu_realize;
     device_class_set_props(dc, x86_iommu_properties);
 }
-- 
2.32.0


