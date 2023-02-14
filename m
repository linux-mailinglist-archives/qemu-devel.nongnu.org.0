Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4169645B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:16:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9g-0007cU-Lc; Tue, 14 Feb 2023 08:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9a-0007XV-Cm
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:26 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9V-0003v3-4Y
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:25 -0500
Received: by mail-ej1-x635.google.com with SMTP id ml19so40086646ejb.0
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9J72yIOu4Uf13Rs2fXrKUf9MXOPBOsiFdWbshX8z2DI=;
 b=kYx3QyPhCEFjcLNjW2M51LPIcpnOGUfDKj8YSZdk2YlBsZVOIUq+2k2sMx0YnfSgyO
 dvaKyFiBvY/riP3OwnYQrc+uWZUauNVjxWWfYlm+GZPS5IUtJW/bPSGpP5TIuLplesO9
 Bi75GbqvmUkJZ/VRYqRiMMf0X2xNg2y2Z79qjDbgNdzVBdoLgqc1OPjQZPBo9QAcPVvS
 R0a7wn4K/txNBbAEaXuoPKnJuaqxO0tOeYSxAa26KK8Y7nWyfXnP/KSU+MzmGWgf9FXH
 GbFLCKaurgjW5bIyqm3eKrQ5OVcRi6eraLq7dftw4jP0kOfVrwgjNaEIko3JWVtQQ9qT
 j9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9J72yIOu4Uf13Rs2fXrKUf9MXOPBOsiFdWbshX8z2DI=;
 b=Cfl4TTNELNxxVxm9MNZa39fpPnDfM5uC7w44wYgQRxvsREPC2rzfNs2LHC8YLgCD1Q
 mIAtznSmCFFuldKdKMuy8WoYv8J9xTAoQdtThxEHKQ0u83xYqdVTZ1Uv/uYoQ67cllGe
 AKX1yVlguxyN+6ucGdaahAsD1qE7ErG5IX4RQ8vSw0MEdbyqRlYWV3pzdC+7AFmzSouW
 vRsoZMZEEJnXGyouV5lX2aRP1Z+fXnyVfZbDGN3awDyoJb4s7IV2Xjem6CVfmASal88R
 0ax/pD5094TIvjUv+WOZ/mInrDju+6fn5YKj1ePs6J+M0lLjUjYya9HXiX9nSn8pZIeN
 o5nA==
X-Gm-Message-State: AO0yUKUXP0hJ11pDzRkeDsibCEdRtw8zfqGHVH6ptNcLRgnXf40AaXkQ
 ISVRVxhkaei4g8+wo9krdXm8uw+s3n0=
X-Google-Smtp-Source: AK7set+FQD97Kz+U7HjBntzc8A4G2aYNxSbGUeIla27N5r8bIAXOxG+35xrjidv88ner8oIhrtlffA==
X-Received: by 2002:a17:906:c787:b0:84d:4e4f:1f85 with SMTP id
 cw7-20020a170906c78700b0084d4e4f1f85mr2633230ejb.59.1676380519480; 
 Tue, 14 Feb 2023 05:15:19 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:18 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 08/12] hw/pci-host/q35: Turn PCI hole properties into class
 properties
Date: Tue, 14 Feb 2023 14:14:37 +0100
Message-Id: <20230214131441.101760-9-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These properties are class properties in i440fx. No need to handle them
differently in q35.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/q35.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 468bbfde51..2fc047a9c6 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -199,6 +199,22 @@ static void q35_host_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->fw_name = "pci";
+
+    object_class_property_add(klass, PCI_HOST_PROP_PCI_HOLE_START, "uint32",
+                              q35_host_get_pci_hole_start,
+                              NULL, NULL, NULL);
+
+    object_class_property_add(klass, PCI_HOST_PROP_PCI_HOLE_END, "uint32",
+                              q35_host_get_pci_hole_end,
+                              NULL, NULL, NULL);
+
+    object_class_property_add(klass, PCI_HOST_PROP_PCI_HOLE64_START, "uint64",
+                              q35_host_get_pci_hole64_start,
+                              NULL, NULL, NULL);
+
+    object_class_property_add(klass, PCI_HOST_PROP_PCI_HOLE64_END, "uint64",
+                              q35_host_get_pci_hole64_end,
+                              NULL, NULL, NULL);
 }
 
 static void q35_host_initfn(Object *obj)
@@ -216,22 +232,6 @@ static void q35_host_initfn(Object *obj)
     qdev_prop_set_int32(DEVICE(&s->mch), "addr", PCI_DEVFN(0, 0));
     qdev_prop_set_bit(DEVICE(&s->mch), "multifunction", false);
 
-    object_property_add(obj, PCI_HOST_PROP_PCI_HOLE_START, "uint32",
-                        q35_host_get_pci_hole_start,
-                        NULL, NULL, NULL);
-
-    object_property_add(obj, PCI_HOST_PROP_PCI_HOLE_END, "uint32",
-                        q35_host_get_pci_hole_end,
-                        NULL, NULL, NULL);
-
-    object_property_add(obj, PCI_HOST_PROP_PCI_HOLE64_START, "uint64",
-                        q35_host_get_pci_hole64_start,
-                        NULL, NULL, NULL);
-
-    object_property_add(obj, PCI_HOST_PROP_PCI_HOLE64_END, "uint64",
-                        q35_host_get_pci_hole64_end,
-                        NULL, NULL, NULL);
-
     object_property_add_uint64_ptr(obj, PCIE_HOST_MCFG_SIZE,
                                    &pehb->size, OBJ_PROP_FLAG_READ);
 
-- 
2.39.1


