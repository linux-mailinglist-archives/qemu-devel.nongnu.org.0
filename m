Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF38758EA5E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:18:09 +0200 (CEST)
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLimu-0001Wj-Pu
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLib8-0006qT-EZ; Wed, 10 Aug 2022 06:06:05 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:45785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLib6-0000sb-Os; Wed, 10 Aug 2022 06:05:57 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id m67so14560752vsc.12;
 Wed, 10 Aug 2022 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qozOYMbguQmSINVzhYUd20P/ZvQLH2ZnIs4f+7OWCwU=;
 b=MLphplMLGUx1YlkYyYq885Zn7oC27ph0Pp4LMFyjzQlP8mMUuT9XTKd/96ezfqxrJO
 9IQbbNEkaR7BglIus/2oroPv8TrgLJ9WsFcSCQ3qZQjQAiYGTrrsk3Hd6T0yAcN4IUqK
 imRh4mMv3LiuuQIIC6h45J+SNtflOM9Z9nfHP2qpzKVGAhAwUcX5wNtC6jK8Cveof9mW
 OjTNtJNW2F0UMrA08367PGsHdS6ivfK67lgZhRI5C9cEEEFfx/pBTN2UDvAwt/eDzgU/
 T3Q7SkQx3IxCaczC3xbEdv5Cpq104OKlKpxgMGqZ3Gq82iCJNQ+QLyvOeKSISxfeNFaY
 UTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qozOYMbguQmSINVzhYUd20P/ZvQLH2ZnIs4f+7OWCwU=;
 b=tDDV7j+8cQq3KY104BIozXhmMDdZRFVAwsppR6SiBQcnU60Bs14XpCzO6IRMBtQNe9
 IeEGWnu8Bx5JJbI3eAUmQ4azNwVAdJRv+BgF4NTxOTkH50vEkH7323NFHqSeAWX8X2yM
 oPoKyxPGZGm0wS5WLyJaP1SzODBYV9NYHzmrmPtnDth/EODQzvg90AvY9BIyZ1IRL2Lg
 7wKsCl5VwnTXri/vspEpV5mnCilOnNuaEY+IioGb+zxTOw2tOCRaWZ4iJ3d1XQCdJeOy
 e7WvKo5Q2mradJ6aRaY9jlMu5VQHe7t3zHW0QptvR+gEjpE1HPGVMqYoacIqTAdEAxPy
 QhwQ==
X-Gm-Message-State: ACgBeo3eChaEk9jAa4pm6cr6KRSQORbLcDGVR+0hEzl8k4JEs+f40k0Y
 F2ZqW818dt+70kfzSUTT5ZcTtyzE9Xg=
X-Google-Smtp-Source: AA6agR6jpc9+S/HHGDemotmmDt/9gFLeV6QuvIVAs8E2L1FKNVyZI6hZDCcWTNYFjU4IGX0dHgjpUQ==
X-Received: by 2002:a67:b747:0:b0:388:9e5a:2fa1 with SMTP id
 l7-20020a67b747000000b003889e5a2fa1mr6844705vsh.1.1660125955622; 
 Wed, 10 Aug 2022 03:05:55 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 2-20020a1f1602000000b0037613541b27sm12277919vkw.39.2022.08.10.03.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:05:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 06/11] ppc/pnv: enable user created pnv-phb for
 powernv8
Date: Wed, 10 Aug 2022 07:05:31 -0300
Message-Id: <20220810100536.473859-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810100536.473859-1-danielhb413@gmail.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2c.google.com
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
index 40a960c54c..887b25d49e 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -17,6 +17,7 @@
 #include "hw/ppc/pnv.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 
 
 /*
@@ -174,6 +175,10 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
+    if (phb->version == 3 && !defaults_enabled()) {
+        return;
+    }
+
     pnv_phb_attach_root_port(pci);
 }
 
@@ -209,7 +214,7 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
     dc->realize = pnv_phb_realize;
     device_class_set_props(dc, pnv_phb_properties);
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 }
 
 static void pnv_phb_root_port_reset(DeviceState *dev)
@@ -300,7 +305,7 @@ static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
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


