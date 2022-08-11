Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBACC59041C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:47:19 +0200 (CEST)
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBL5-0003DK-1h
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBEB-0001Uf-7z; Thu, 11 Aug 2022 12:40:11 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:41945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBE9-0003hk-L0; Thu, 11 Aug 2022 12:40:10 -0400
Received: by mail-vs1-xe29.google.com with SMTP id k2so74254vsk.8;
 Thu, 11 Aug 2022 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=k7eQB0qCw+ac1Khyewk6vwUj/mlVwVUXElBNJJLxczI=;
 b=RasseyUL27EZRptTOEs6S5/EJXoaGA48/ATwrMUPuo3p0mX7jgBPJLjqLAJsIZ2ICt
 DCQa6bH49Yt5adMgCsHr1yNEmeyChvYB9PBSZ+xyp0EvgsFZW+V+x0s1a2a3cnSAvNbo
 WkRKFDzX44o2Vry26VZfXAIeBUtWnHNCzz7013WFwiMrTnOxmEhx7qn8SegCVEPliMIb
 vbPSGJ60sYMWRCbgzvFv3aNgul0N1hvW/L1y+qsYhgXuINugCmi9STVaM3Tcsz+J2/EJ
 3sPSN9z/MsOivhFD2OEZGRfi/+smtKhqZfO9v7gkQCehBzk/+6miP7HL1/BXgoUr5iMs
 SwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=k7eQB0qCw+ac1Khyewk6vwUj/mlVwVUXElBNJJLxczI=;
 b=BUE+CcQXs/Yn2+Q8Bw/qvp/6p9+9jrA9BnBqT4/kWVuyzZl4Bx8t92rp0+3KLQe/No
 hw/hPKLyl941CE1rHPiELVvR5JUAqinrajL9Mb9GntVVhCjWgOqcZKwGIirHuk+dguHY
 T/9/zn9n/FhiMZIn0QfQ48ILWP53cqjH/hGtj5aQLXoXVp3poixJHpONNwX3vy2UqTlm
 8FxG3zLGFKiQMkoRo0LVMFQTtRLlyBckLQQvzXA466jcnAINLVFQL2r8nme5C7i+WTMI
 l2kF3E09qyUFLH0weZenCJkNwe5O1A44wtVXWarL6e8BfWzd0RlMQt1s7HspDnkjapLM
 x5YA==
X-Gm-Message-State: ACgBeo0Ln1nh5X5BXWpiL/80hCvgZN6Zh6vxlPZSc2vjL5phmoDCER/E
 QOFM7CcRJd8I3OyJnsGKcXAgkQBfiCI=
X-Google-Smtp-Source: AA6agR40CycEiHbVbZumsNaOFYuoewVzF6jKingurguEvYZypskXnU6GqJyEkZMGA0nXkd1j7eIl0A==
X-Received: by 2002:a67:b009:0:b0:357:af40:6b7e with SMTP id
 z9-20020a67b009000000b00357af406b7emr14274738vse.67.1660236008169; 
 Thu, 11 Aug 2022 09:40:08 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:40:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 06/11] ppc/pnv: enable user created pnv-phb for
 powernv8
Date: Thu, 11 Aug 2022 13:39:45 -0300
Message-Id: <20220811163950.578927-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811163950.578927-1-danielhb413@gmail.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe29.google.com
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

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c |  9 +++++++--
 hw/ppc/pnv.c          | 32 ++++++++++++++++++--------------
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 5dc44f45d1..1f53ff77c5 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -17,6 +17,7 @@
 #include "hw/ppc/pnv.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 
 
 /*
@@ -166,6 +167,10 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
+    if (phb->version == 3 && !defaults_enabled()) {
+        return;
+    }
+
     pnv_phb_attach_root_port(pci);
 }
 
@@ -201,7 +206,7 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
     dc->realize = pnv_phb_realize;
     device_class_set_props(dc, pnv_phb_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 }
 
 static void pnv_phb_root_port_reset(DeviceState *dev)
@@ -292,7 +297,7 @@ static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
     device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
                                   &rpc->parent_reset);
     dc->reset = &pnv_phb_root_port_reset;
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     k->vendor_id = PCI_VENDOR_ID_IBM;
     /* device_id will be written during realize() */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index e53e9e297d..e82d6522f0 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1178,20 +1178,22 @@ static void pnv_chip_power8_instance_init(Object *obj)
 
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
 
-    chip8->num_phbs = pcc->num_phbs;
-
-    for (i = 0; i < chip8->num_phbs; i++) {
-        Object *phb = object_new(TYPE_PNV_PHB);
-
-        /*
-         * We need the chip to parent the PHB to allow the DT
-         * to build correctly (via pnv_xscom_dt()).
-         *
-         * TODO: the PHB should be parented by a PEC device that, at
-         * this moment, is not modelled powernv8/phb3.
-         */
-        object_property_add_child(obj, "phb[*]", phb);
-        chip8->phbs[i] = PNV_PHB(phb);
+    if (defaults_enabled()) {
+        chip8->num_phbs = pcc->num_phbs;
+
+        for (i = 0; i < chip8->num_phbs; i++) {
+            Object *phb = object_new(TYPE_PNV_PHB);
+
+            /*
+             * We need the chip to parent the PHB to allow the DT
+             * to build correctly (via pnv_xscom_dt()).
+             *
+             * TODO: the PHB should be parented by a PEC device that, at
+             * this moment, is not modelled powernv8/phb3.
+             */
+            object_property_add_child(obj, "phb[*]", phb);
+            chip8->phbs[i] = PNV_PHB(phb);
+        }
     }
 
 }
@@ -2130,6 +2132,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
-- 
2.36.1


