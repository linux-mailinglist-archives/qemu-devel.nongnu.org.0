Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5265A869E
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:19:12 +0200 (CEST)
Received: from localhost ([::1]:55858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTEw-0007TO-HK
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSob-0003Ga-Ax; Wed, 31 Aug 2022 14:51:53 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:46815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoX-0007yo-Ni; Wed, 31 Aug 2022 14:51:52 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-11f4e634072so12019995fac.13; 
 Wed, 31 Aug 2022 11:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=LKAmlZENKXGchsEzbn624wJMFg+mC22n6L8F4Epu9Us=;
 b=Ko7sk+mQVwHp+KiFSc1GYFmAAe8R1d14IDZegFfmjyN6glQLQ+r9rRH2JHMBouoYmV
 erSY+UE5o4SE5gWTf103/hvXvEE+yyUuX5DkjJqNtY1ksT4tXOxoBD5plUDQJfOvOkW2
 LKcD84E6MmV9lw/21FXtTr6XNgedblIwYhBNVF1YwVuqhU8zz4/967Tpo4rOmfGje3eR
 tOWz7+sH8YrKV2bqTsyC36mQ0tfJGbgazT5+ETMldNfjrPS+ykBMFzu4ZkCwt6RPBiLB
 r8tGtaSRHCDX9bWhlB1D7TFoYgRm1mxIKiemkwXb81xaOE1bCxxWiXvf/hJ+flRULPua
 jgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LKAmlZENKXGchsEzbn624wJMFg+mC22n6L8F4Epu9Us=;
 b=rLv1cJfbjYZK+SNCv1A2m8MMPTQz670+zEM2NCZ9GEy+hgzZ1vdXDLJfCxy0T5Hazl
 GzzAvm86J6q8VcpyIyJxiOB4AebsFOIhEarOM6uUNDO7Jj5He4wNv1kOalD78CzfOblm
 uBHvSsK2sNENgIZRJpaB+j/uguSlTbd75arFf9PZ3w2zhZvOJwQzUFz4In9Hu0ElAply
 mXyvykcFkCBWTEWUeLNka5kBhw6bpQeejcAXQW1pTEjg6ZJNTdtBvAl1Yy0pS9aG84SK
 Bx9zBUtmbGxihEMq1FBP0PKUj38NJofRpmsU4P0zcdmUk0X8h72dkCm8l8HjIRxMF8Yo
 Q3Xg==
X-Gm-Message-State: ACgBeo1p99bYiisCUzlF9trYVnnUrDrB8hVEMGUShW6r5ZFApQpXw1Zt
 RLMMtOQKfjVCTQOKaBOAMKtf8/wueY4=
X-Google-Smtp-Source: AA6agR790hMRx0beBHONR54LYwKVXiDRfcXQagmBCAw7h1yEYrbqI/YgTqb69NQItgWo+AU77FQMhA==
X-Received: by 2002:a05:6808:19a3:b0:345:d279:dd70 with SMTP id
 bj35-20020a05680819a300b00345d279dd70mr1773835oib.274.1661971908609; 
 Wed, 31 Aug 2022 11:51:48 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 23/60] ppc/pnv: enable user created pnv-phb for powernv8
Date: Wed, 31 Aug 2022 15:49:57 -0300
Message-Id: <20220831185034.23240-24-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
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
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220811163950.578927-7-danielhb413@gmail.com>
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
index 0208517f1a..9ce1ae7752 100644
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
@@ -2155,6 +2157,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
-- 
2.37.2


