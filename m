Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE32588E56
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:14:53 +0200 (CEST)
Received: from localhost ([::1]:39400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJF9B-0004lB-3r
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgg-00035z-3v; Wed, 03 Aug 2022 09:45:26 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:46012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgc-0004oM-QM; Wed, 03 Aug 2022 09:45:25 -0400
Received: by mail-vs1-xe34.google.com with SMTP id m67so10304561vsc.12;
 Wed, 03 Aug 2022 06:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6aw3d1S4YvDWEoGH/93ryuZ23GNUlonkJqJGi+2Ni1w=;
 b=GYbpiX6CfKlnG89WP/Ahdlj1cRB5hw39/7ExCN9qHKIqlJ377fMvf2NMxX4QM8d46p
 mou8tnhiPZxt+/B0C16f0PjKr8Mi8dunSu6f7IaWH+j31VVEAAYofg5IOQ8B9OaYpnju
 GHtHM/gThrv/JY03HxpGsoGWP9snIYL2eQKJyZZ91FcwkD2mhMcxrWQtdOJ7J3B+bcYm
 zgRu7dfnPNiObHSxkGwgqrFivWJTWunpW59squbGg+W05OLVj5BMHerRY3P0Y6nM9SOD
 vFJ4OwsQIDq4q512iNIKxEMBm/a6TMFrYymKaPAr1aX7Z8TQA3Blc2IR6pekL+LugXZG
 pwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6aw3d1S4YvDWEoGH/93ryuZ23GNUlonkJqJGi+2Ni1w=;
 b=6AhhP4zmhPJClTC3dUdTOCfp9AlaisjGvNaHgoKeRKx8iivP8m2h04Z/kydsoEHzzl
 SIgo0W7o4OlR8zRi6vjrFG2R4PbPshBtmo07KQLMD4ofeXBILBGAK74mCbgfJ/iucnI9
 QKFwFfk50dcs4x6CfZkboGoRe+Msi/SJmI9WG6bdlGy3fHOWflhJkHVVqhu4SLIX4HQq
 BZFg85oOaowtFBTRfdbObkEM+da7iBYalS9SyPMECqWrmDjmRn7TrrXyVwczqDckUPbI
 vFs76AIgzTTu3fv2uSSeOVkSXPV/B6niXxF6JQyTD6qhshJcyBezbpM50t3LKsGfRDXl
 o/VQ==
X-Gm-Message-State: ACgBeo0CU7dZL9qqUdL+b7gqUNJQIX9k7FNr4HA5Q8zIyl/rqiwYC/Wo
 0kt1CJJM/IJL5OhBb5JZn6J7GM2C/lQ=
X-Google-Smtp-Source: AA6agR5lEiJGwLXQ02L7bMpGvBt70pScbyChX9zGiEa6fKBc1omI+tSk3Gob4LxKSrerIstYkM3dEQ==
X-Received: by 2002:a67:e11a:0:b0:384:8320:3f20 with SMTP id
 d26-20020a67e11a000000b0038483203f20mr5637602vsl.57.1659534318120; 
 Wed, 03 Aug 2022 06:45:18 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 q201-20020a1f2ad2000000b00377fba67271sm932420vkq.34.2022.08.03.06.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:45:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 06/10] ppc/pnv: enable user created pnv-phb for
 powernv8
Date: Wed,  3 Aug 2022 10:44:55 -0300
Message-Id: <20220803134459.2633902-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220803134459.2633902-1-danielhb413@gmail.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

The bulk of the work was already done by previous patches.

Use defaults_enabled() to determine whether we need to create the
default devices or not.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 9 +++++++--
 hw/ppc/pnv.c          | 6 ++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 077f391d59..953c384bf6 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -17,6 +17,7 @@
 #include "hw/ppc/pnv.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 
 
 /*
@@ -171,6 +172,10 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
+    if (phb->version == 3 && !defaults_enabled()) {
+        return;
+    }
+
     pnv_phb_attach_root_port(pci);
 }
 
@@ -206,7 +211,7 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
     dc->realize = pnv_phb_realize;
     device_class_set_props(dc, pnv_phb_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 }
 
 static void pnv_phb_root_port_reset(DeviceState *dev)
@@ -297,7 +302,7 @@ static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
     device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
                                   &rpc->parent_reset);
     dc->reset = &pnv_phb_root_port_reset;
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     k->vendor_id = PCI_VENDOR_ID_IBM;
     /* device_id will be written during realize() */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 44066ffb8c..0d3a88578b 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1151,6 +1151,10 @@ static void pnv_chip_power8_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
 
+    if (!defaults_enabled()) {
+        return;
+    }
+
     chip8->num_phbs = pcc->num_phbs;
 
     for (i = 0; i < chip8->num_phbs; i++) {
@@ -2103,6 +2107,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
-- 
2.36.1


