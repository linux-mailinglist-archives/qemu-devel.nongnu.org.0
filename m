Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1206741F45B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 20:08:35 +0200 (CEST)
Received: from localhost ([::1]:47272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMxW-0007Sq-R9
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 14:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUI-0000Yr-EH
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:24 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUF-0000kw-P7
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:22 -0400
Received: by mail-wm1-x336.google.com with SMTP id z2so7769991wmc.3
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cdHPQI9tRbF9oA3co/8E8LRH7+4LnLYtNbcNQWk0r9Y=;
 b=B6uF6YCkgVF8BWzc6Hp8qYtX/8ubIaAe2PgfOsKlYkTC/sI0R8Qq1vZo+gxvE6a6QO
 ahbhdu6Dh1vymqaSMJhv3KiXcGD9cBT/jDSuTdViWTGO+Xt1niaY+FK8xq12ZE/WB2UP
 E00vvzJLUOlvoSosXAI67rDLUu/qBrmeUtcOrhEWQDKcQh1HyNH0uftSg80ZLVSIajmA
 jeCiKGOHOCIKPwQzJ+MN5vjKeskUKwn53+yY7sf/zuMrLrzHNYQQizDHFeYvLkpSAF8x
 GpEe8zVMLpl7lFj+tOYkoOwSDFozuCjK+1WNmeyu1oQOjsJT0BThBjR4DVEH2XXGV6DH
 9myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cdHPQI9tRbF9oA3co/8E8LRH7+4LnLYtNbcNQWk0r9Y=;
 b=vex5rinpHk9UCniQv47IneHqUtFRBcVVUX+huN+WjmlA2/itsTovqd2TN9GD1OTp2k
 G7rSbakSlqi14PWr3AnVFI6dfSGHqFmcAjUbKmTTOtJulGxTx8jQCYG39U8DCBJMnOqi
 plgVm98f+ZdhuS/Nv5pl73qr+2GccYTbHUL9xpPasdPSwcXnMaSRYW2lELmazLHEZcba
 PxA/o8O2m6R9N+LYpbJKRMQIrlUOxiAF57ZGIQm/ngxHyuSsrwQ6Vmr60NtfWb1p8Vd6
 HSuCspymnbVEE98PA1XxZ05t+UWerFlQdqnmvwzwu9qepP6Wl7ebtXYTkhGRuunGAooP
 t4TQ==
X-Gm-Message-State: AOAM5311qMFwSFEWO8ipWg23vXTnTFX7Y85eyoYI4J9g94hS7dDxZSOp
 H0yJ2ihIIQcy4Iln60iW6r+UMQ==
X-Google-Smtp-Source: ABdhPJwPejX9wVHaIicRPNfeEuCk6GJR4b/FycJDX7ieoBddivZylonLmUj0V9L/kiJykU9a6cX0QA==
X-Received: by 2002:a05:600c:214c:: with SMTP id
 v12mr5888474wml.179.1633109896927; 
 Fri, 01 Oct 2021 10:38:16 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:16 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 06/11] hw/i386: Move vIOMMU uniqueness check into pc.c
Date: Fri,  1 Oct 2021 18:33:54 +0100
Message-Id: <20211001173358.863017-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're about to need this check for a third vIOMMU, virtio-iommu, which
doesn't inherit X86IOMMUState as it doesn't support IRQ remapping and is
a virtio device. Move the check into the pre_plug callback to be shared
by all three vIOMMUs.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/i386/pc.c        | 10 +++++++++-
 hw/i386/x86-iommu.c |  6 ------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 557d49c9f8..789ccb6ef4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1367,6 +1367,13 @@ static void pc_virtio_md_pci_unplug(HotplugHandler *hotplug_dev,
 static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                           DeviceState *dev, Error **errp)
 {
+    if (object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE) &&
+        x86_iommu_get_default()) {
+        error_setg(errp, "QEMU does not support multiple vIOMMUs "
+                   "for x86 yet.");
+        return;
+    }
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         pc_memory_pre_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
@@ -1428,7 +1435,8 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_CPU) ||
         object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_PMEM_PCI) ||
-        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI)) {
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MEM_PCI) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_X86_IOMMU_DEVICE)) {
         return HOTPLUG_HANDLER(machine);
     }
 
diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index 86ad03972e..550e551993 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -84,12 +84,6 @@ static void x86_iommu_set_default(X86IOMMUState *x86_iommu)
 {
     assert(x86_iommu);
 
-    if (x86_iommu_default) {
-        error_report("QEMU does not support multiple vIOMMUs "
-                     "for x86 yet.");
-        exit(1);
-    }
-
     x86_iommu_default = x86_iommu;
 }
 
-- 
2.33.0


