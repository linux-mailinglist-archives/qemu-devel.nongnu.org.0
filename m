Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63A1422E6E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:52:14 +0200 (CEST)
Received: from localhost ([::1]:44758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnfp-0001M9-V3
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmwC-0002Tq-Eb
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:05:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmw6-0007j9-EX
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++Qz2MnOf8zg/IFXbMLXXteEF/1jvb/4aDH9kffcAs0=;
 b=YbIN0+cDGI/nYAz13FMKXsW7/ZPAw+gpHZ08TSkWpUZOY/pV0KIlOlsVWoqPt1zB2w5pva
 RVMwEz2Eem2WgygqMF8SE5xDz3SOt2hW3+tixvsMNxsjFVWkoSSacvz/PE5+VaoSxlABKj
 I9omY4h8h6rpolPhBf/5xNO14HBhsBs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-0zl13TizMuyzwGV5DL9lLQ-1; Tue, 05 Oct 2021 12:04:55 -0400
X-MC-Unique: 0zl13TizMuyzwGV5DL9lLQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h24-20020a7bc938000000b0030d400be5b5so6535133wml.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=++Qz2MnOf8zg/IFXbMLXXteEF/1jvb/4aDH9kffcAs0=;
 b=0x7X7pdxrZLYGHW75M2Hnu0oslDs/iq/DUJTyTE5M0HQO+6661gSthwWyh5EGeo5qT
 emkaGu4ZZ8wS1pZLF2q6n01lFNmO1MyVGJb1SOkhvN729/loRo1oOGJHXlYFMnTHYFkK
 rYROTUgqvPJyAkJCw+blKpCZYIRZi+su7cSMVjb2nfCFcX0lZUY9U2Oz2sARjJw4rpuB
 tN8E8f3MrClPW/HOK1pkfeliE9IBTIqhs0Cy2P3WrnyI/5P7AagliJtfy5bTbaj90uLi
 I16aiNtFBXFGSoTNawbAeCtF/d5KXUgsSnEKDlvnckmlDyrsBH/psqeJ2owGt3B3GrfD
 LhFA==
X-Gm-Message-State: AOAM5306xqbPcsYr1MEwdWaL0h/88b9Q3KXVgjFh/BLZ/geg1HZM8NIR
 fuU3xTjtA3eFzDPhuTqncgQABpd9AIaxTijDhdp8P/KnS9nKVJHwO/6PZoFKgz7MDdsubZ7rJMo
 joFnIKQ/GZ1n2K73uXqdt08KDSEp0KyXEpnolVLGIvTJRZ1AopOAhDau17V4p
X-Received: by 2002:a1c:21d7:: with SMTP id h206mr4293868wmh.23.1633449893309; 
 Tue, 05 Oct 2021 09:04:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKURsWXpFTlOk3UwlZ/clIicKn5ewxJNd6B7StKVgNJuHRA0Yz50/Otn/gv/udhcR8CANppQ==
X-Received: by 2002:a1c:21d7:: with SMTP id h206mr4293729wmh.23.1633449892237; 
 Tue, 05 Oct 2021 09:04:52 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id k26sm3319286wms.39.2021.10.05.09.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:51 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 56/57] hw/i386/amd_iommu: Rename SysBus specific functions as
 amdvi_sysbus_X()
Message-ID: <20211005155946.513818-57-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Various functions are SysBus specific. Rename them using the
consistent amdvi_sysbus_XXX() pattern, to differentiate them
from PCI specific functions (which we'll add in the next
commit).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210926175648.1649075-3-f4bug@amsat.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/amd_iommu.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 0c994facde..9014690ba3 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1526,7 +1526,7 @@ static void amdvi_init(AMDVIState *s)
             AMDVI_MAX_PH_ADDR | AMDVI_MAX_GVA_ADDR | AMDVI_MAX_VA_ADDR);
 }
 
-static void amdvi_reset(DeviceState *dev)
+static void amdvi_sysbus_reset(DeviceState *dev)
 {
     AMDVIState *s = AMD_IOMMU_DEVICE(dev);
 
@@ -1534,7 +1534,7 @@ static void amdvi_reset(DeviceState *dev)
     amdvi_init(s);
 }
 
-static void amdvi_realize(DeviceState *dev, Error **errp)
+static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
 {
     int ret = 0;
     AMDVIState *s = AMD_IOMMU_DEVICE(dev);
@@ -1585,27 +1585,27 @@ static void amdvi_realize(DeviceState *dev, Error **errp)
     amdvi_init(s);
 }
 
-static const VMStateDescription vmstate_amdvi = {
+static const VMStateDescription vmstate_amdvi_sysbus = {
     .name = "amd-iommu",
     .unmigratable = 1
 };
 
-static void amdvi_instance_init(Object *klass)
+static void amdvi_sysbus_instance_init(Object *klass)
 {
     AMDVIState *s = AMD_IOMMU_DEVICE(klass);
 
     object_initialize(&s->pci, sizeof(s->pci), TYPE_AMD_IOMMU_PCI);
 }
 
-static void amdvi_class_init(ObjectClass *klass, void* data)
+static void amdvi_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     X86IOMMUClass *dc_class = X86_IOMMU_DEVICE_CLASS(klass);
 
-    dc->reset = amdvi_reset;
-    dc->vmsd = &vmstate_amdvi;
+    dc->reset = amdvi_sysbus_reset;
+    dc->vmsd = &vmstate_amdvi_sysbus;
     dc->hotpluggable = false;
-    dc_class->realize = amdvi_realize;
+    dc_class->realize = amdvi_sysbus_realize;
     dc_class->int_remap = amdvi_int_remap;
     /* Supported by the pc-q35-* machine types */
     dc->user_creatable = true;
@@ -1613,12 +1613,12 @@ static void amdvi_class_init(ObjectClass *klass, void* data)
     dc->desc = "AMD IOMMU (AMD-Vi) DMA Remapping device";
 }
 
-static const TypeInfo amdvi = {
+static const TypeInfo amdvi_sysbus = {
     .name = TYPE_AMD_IOMMU_DEVICE,
     .parent = TYPE_X86_IOMMU_DEVICE,
     .instance_size = sizeof(AMDVIState),
-    .instance_init = amdvi_instance_init,
-    .class_init = amdvi_class_init
+    .instance_init = amdvi_sysbus_instance_init,
+    .class_init = amdvi_sysbus_class_init
 };
 
 static const TypeInfo amdvi_pci = {
@@ -1648,7 +1648,7 @@ static const TypeInfo amdvi_iommu_memory_region_info = {
 static void amdvi_register_types(void)
 {
     type_register_static(&amdvi_pci);
-    type_register_static(&amdvi);
+    type_register_static(&amdvi_sysbus);
     type_register_static(&amdvi_iommu_memory_region_info);
 }
 
-- 
MST


