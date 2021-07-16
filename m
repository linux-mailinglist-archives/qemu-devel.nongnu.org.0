Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F773CB9C5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:25:13 +0200 (CEST)
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4PiC-0005nL-Hf
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYw-0001Ai-A3
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYt-0004H8-Sp
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wGJK3zOQMsPUthycRa07iCj/XcAJGJjnk+sZAHLKKJI=;
 b=F1PqzIti39oITNiBXredNaJY4/xbifcQD6yZbX6zIZavTyQil1nB7yuVljUd3TxqjuLWoa
 vTWCG2X7wHmwZjf4I1lX4hkuU++5hED2OnjsVCx38eqEe7G5O3hRh7Bv/lgUAzS6dfCuyn
 f1aeCdOQASMHPELQB7ckUCvBBUJf2UM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-152UynXuNv2Ijy9AYCOcyg-1; Fri, 16 Jul 2021 11:15:33 -0400
X-MC-Unique: 152UynXuNv2Ijy9AYCOcyg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r18-20020adfce920000b029013bbfb19640so4916566wrn.17
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wGJK3zOQMsPUthycRa07iCj/XcAJGJjnk+sZAHLKKJI=;
 b=GiuTysMvrUCci4vMWKEiIrCK6wDoFmUrhD2eJ4fjEM5RgCEMPw052oBcVPP/H+gxuK
 X5KcY7eXFhP3pogqrjLvg+kybzDJzqHrOUubb0BQLtG2/BwfPnLprP9KGD4yJSyC60w0
 d4HaHal3ziVEZ0GDBsir1kCXMk/gt6H67yDErh9JV3Qd+PaBTOJBdi+N7GB0LiXk9GfX
 L3tfkO5BgJ1BZpUCEq/o9fQfPidL7FeBfgsYDCNTBpqc2C/7KN1Xrmx/gRaym0azZQHx
 6/zKSLFPMBvh9fpOSBbiIDySBFjToQeJYIEWVDagrxr1fI3ST/IGv5zDn28hmt4Genrs
 +OTw==
X-Gm-Message-State: AOAM531eBaY44j8L5nqA2Jy8x3ZUbD9dF/aX8mv97eBMrUDUQ7si4mFa
 iB6Tdwwtf3FxCQYKZA6rvlGFVEGgGRMZR+uJdUIDu1gTIQdkT3CbufFkshjnq9kFGLFxHR7P0c/
 1k5KnNrlSTW7I3UevpGDUs19UpFdHqGo7OGn6/f2pq9DLFmDYgfY/ZPqdzfdk
X-Received: by 2002:a5d:6e07:: with SMTP id h7mr3828705wrz.233.1626448532157; 
 Fri, 16 Jul 2021 08:15:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLWsiHhGRFWoBsSfob4GPgvl63z36HSPZieeSC5h1pJh/RX3PP0r5VQNPoFBL+LNgSofbPDA==
X-Received: by 2002:a5d:6e07:: with SMTP id h7mr3828677wrz.233.1626448531888; 
 Fri, 16 Jul 2021 08:15:31 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id l16sm12460724wmj.47.2021.07.16.08.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:31 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 12/19] hw/arm/virt: Add default_bus_bypass_iommu machine
 option
Message-ID: <20210716151416.155127-13-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Xingang Wang <wangxingang5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Add a default_bus_bypass_iommu machine option to enable/disable
bypass_iommu for default root bus. The option is disabled by
default and can be enabled with:
$QEMU -machine virt,iommu=smmuv3,default_bus_bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Message-Id: <1625748919-52456-4-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/arm/virt.h |  1 +
 hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 921416f918..9661c46699 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -147,6 +147,7 @@ struct VirtMachineState {
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
+    bool default_bus_bypass_iommu;
     VirtMSIControllerType msi_controller;
     uint16_t virtio_iommu_bdf;
     struct arm_boot_info bootinfo;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 93ab9d21ea..81eda46b0b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1367,6 +1367,7 @@ static void create_pcie(VirtMachineState *vms)
     }
 
     pci = PCI_HOST_BRIDGE(dev);
+    pci->bypass_iommu = vms->default_bus_bypass_iommu;
     vms->bus = pci->bus;
     if (vms->bus) {
         for (i = 0; i < nb_nics; i++) {
@@ -2322,6 +2323,21 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
     }
 }
 
+static bool virt_get_default_bus_bypass_iommu(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->default_bus_bypass_iommu;
+}
+
+static void virt_set_default_bus_bypass_iommu(Object *obj, bool value,
+                                              Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->default_bus_bypass_iommu = value;
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -2661,6 +2677,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set the IOMMU type. "
                                           "Valid values are none and smmuv3");
 
+    object_class_property_add_bool(oc, "default_bus_bypass_iommu",
+                                   virt_get_default_bus_bypass_iommu,
+                                   virt_set_default_bus_bypass_iommu);
+    object_class_property_set_description(oc, "default_bus_bypass_iommu",
+                                          "Set on/off to enable/disable "
+                                          "bypass_iommu for default root bus");
+
     object_class_property_add_bool(oc, "ras", virt_get_ras,
                                    virt_set_ras);
     object_class_property_set_description(oc, "ras",
@@ -2728,6 +2751,9 @@ static void virt_instance_init(Object *obj)
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
 
+    /* The default root bus is attached to iommu by default */
+    vms->default_bus_bypass_iommu = false;
+
     /* Default disallows RAS instantiation */
     vms->ras = false;
 
-- 
MST


