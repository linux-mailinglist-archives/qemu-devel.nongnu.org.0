Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DC7418A65
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:59:21 +0200 (CEST)
Received: from localhost ([::1]:58206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUYQq-0005ht-LQ
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUYOe-0003GI-31; Sun, 26 Sep 2021 13:57:04 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUYOc-0007MY-HH; Sun, 26 Sep 2021 13:57:03 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i23so45139008wrb.2;
 Sun, 26 Sep 2021 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9YUN00M5wKMJ+847wyzLLmd2IsVZb71HnbACubJCRK4=;
 b=cIyLuyx1aVviM9BoEQzToHvV2LcvxRl+tb9AHPT5dkRgBZ8Wqn1MP8ULhVOMfd/QBO
 zKTPWBsSkhl1k44R7gIGmU18XrX+o5G4FWnQ0EWeqfGnRH67FxEzP5bWfMMOZ2tsnght
 4WVzP4Iu+cjt4P4rdJyoOGmaVDk+8N3ETCoYbLN28udb5+YjHf+I5bRyl2PHAs+7Qbjm
 rD6nFjG4vAoZphXrq4XN+IkwkxGIUW22vZCUJJfzjDhMsNfPBgMvnGojE0XnzrH6/+WX
 ecyWzuMGRrvMEdIMCc2a77luGnNSt6nhwvQweIMCZufrIynxh3069WF61RKm0FLWcXdK
 19fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9YUN00M5wKMJ+847wyzLLmd2IsVZb71HnbACubJCRK4=;
 b=7baecXjTLJG23uH3W9/VyZeY38/+vVQl9su2flU9xETJk/5FV/D6KVLi0XVe96aNI9
 1inVvLU91HGiu0sREeUOyKKZZwYGulJwlUMUxiteSqINo/sxIA5gsjYD/10pTvAA8Arb
 zG6/A7YViNrMcRkUAVGnxK03CkK2MFs7l4kqyvXQfNiHNnSV0g0G6QRlvf0Dw5Jagjyu
 VX60KaW/OhkucdmvaN4cv1MS8E6COCXDty2dqt8yOLsmCVc5VBpQAEqAsAScRgv5GXM/
 QFL+eOkmeRM+j+xS+5Gn3StVfBIfZiEktim2bjoLIGYU2jW5RKy7/IOOjaxeiQ9iryCY
 W1iQ==
X-Gm-Message-State: AOAM532WzdGpbNsGNMHb6t6oXnrXPjCgqBiImNBL4npbDLfIQKAJoTIl
 aRJ2Od65heHRD7ydM48UYiOktZA+ZcY=
X-Google-Smtp-Source: ABdhPJx9rg9I2S3wjmIYQA2UnBhC/3+FF4XwEfngp31Wb/+AQ9uuDPe3rMxewlOvjLpfybjW2CU8hw==
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr12539543wmc.141.1632679020715; 
 Sun, 26 Sep 2021 10:57:00 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 a3sm1734158wrn.16.2021.09.26.10.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 10:57:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/i386/amd_iommu: Rename SysBus specific functions as
 amdvi_sysbus_X()
Date: Sun, 26 Sep 2021 19:56:47 +0200
Message-Id: <20210926175648.1649075-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926175648.1649075-1-f4bug@amsat.org>
References: <20210926175648.1649075-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Various functions are SysBus specific. Rename them using the
consistent amdvi_sysbus_XXX() pattern, to differentiate them
from PCI specific functions (which we'll add in the next
commit).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/amd_iommu.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 0c994facde9..9014690ba3a 100644
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
2.31.1


