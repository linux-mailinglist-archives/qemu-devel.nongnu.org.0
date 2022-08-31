Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425A15A86AC
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:21:42 +0200 (CEST)
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTHR-0003Kk-DU
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoS-0003D5-FK; Wed, 31 Aug 2022 14:51:48 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:45898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoP-000843-Ux; Wed, 31 Aug 2022 14:51:43 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-11ba6e79dd1so26218425fac.12; 
 Wed, 31 Aug 2022 11:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=RsWHnlUa3B/O1eJ0bIH3c1mkZOC4L6Y71NhSwsvNTBg=;
 b=O++yklxmvYt8jzkWKgqLcrX9ekgjPQ6jhlnxe5vpBc3hVe+en1sFz92szGgdiwipAr
 gARlr0NotdRYlBsatzF3lfxO27T+1PLKiUndI0LN1ajYPytlQps64BfOVUX5Xr3KA+Ow
 Oppl+xl42cgm0uobcyDNeOtsYzIQcbQMQFRCSw0G9Ukcv9yf1ltJI1b0u7JXzbQofRpC
 g0/fIDe5UQ90OjBvB0zGyOU8+PnGV4yUo1mnmWJvTyUv7NnZXQfwgqjYWY7q7pJ3wiyo
 tbfvqC5aIboge9mbAizjfTL1bVclcimJyBoJWEXjq1CviQY3z4vg8EEKxk1CLzELLj0P
 4Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RsWHnlUa3B/O1eJ0bIH3c1mkZOC4L6Y71NhSwsvNTBg=;
 b=VGpDW2rwZggRZtwRkxJjSmLhKqTw3trBv3UM4my779mJvMAbYi3P94yf/eitGzie/t
 /9/n29bAES11EwFoTwonNnjwlMoMhvIb+yRdfkTAt34rk8/o2yPhsoc+61/XEAlt6JsZ
 cOPX1ae55CFXfvEKbY54YnateIc7f0v2vJHaGRejW5DYd8g76E/+OJp35TkIA2T3VpDl
 yMn7vEpVZJwyIu4/oK6HcMo3F5d5l87OgrMoNPtYi6CygsIm8gg6cv3zOmWqOyjlyRNC
 c9vESyWxaO+oj8rICCrlnHvzinVNkIenqn2Qk7mMZDNbYXcQu5xNn5MUkFw4RpLHP+Vf
 utcw==
X-Gm-Message-State: ACgBeo0w/NH+Xx1yS1EhS3VNXUOEbyltJEzGbnlcrJB2hwxQ1MU60P/0
 QOagUHc72t/h9RG1U0GR89PVKeF1hck=
X-Google-Smtp-Source: AA6agR5pIPIdjq1BYy7rscoZvQrn51JHRnsP4yRxgM2IJmDhhPGzIq9771q/WVo7vj8HFqRLawaIpg==
X-Received: by 2002:a05:6870:c18f:b0:11c:abda:ba81 with SMTP id
 h15-20020a056870c18f00b0011cabdaba81mr2263256oad.229.1661971900162; 
 Wed, 31 Aug 2022 11:51:40 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:39 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 20/60] ppc/pnv: set root port chassis and slot using Bus
 properties
Date: Wed, 31 Aug 2022 15:49:54 -0300
Message-Id: <20220831185034.23240-21-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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

For default root ports we have a way of accessing chassis and slot,
before root_port_realize(), via pnv_phb_attach_root_port(). For the
future user created root ports this won't be the case: we can't use
this helper because we don't have access to the PHB phb-id/chip-id
values.

In earlier patches we've added phb-id and chip-id to pnv-phb-root-bus
objects. We're now able to use the bus to retrieve them. The bus is
reachable for both user created and default devices, so we're changing
all the code paths. This also allow us to validate these changes with
the existing default devices.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220811163950.578927-4-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index c47ed92462..826c0c144e 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -25,21 +25,19 @@
  * QOM id. 'chip_id' is going to be used as PCIE chassis for the
  * root port.
  */
-static void pnv_phb_attach_root_port(PCIHostState *pci, int index, int chip_id)
+static void pnv_phb_attach_root_port(PCIHostState *pci)
 {
     PCIDevice *root = pci_new(PCI_DEVFN(0, 0), TYPE_PNV_PHB_ROOT_PORT);
-    g_autofree char *default_id = g_strdup_printf("%s[%d]",
-                                                  TYPE_PNV_PHB_ROOT_PORT,
-                                                  index);
     const char *dev_id = DEVICE(root)->id;
+    g_autofree char *default_id = NULL;
+    int index;
+
+    index = object_property_get_int(OBJECT(pci->bus), "phb-id", &error_fatal);
+    default_id = g_strdup_printf("%s[%d]", TYPE_PNV_PHB_ROOT_PORT, index);
 
     object_property_add_child(OBJECT(pci->bus), dev_id ? dev_id : default_id,
                               OBJECT(root));
 
-    /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(DEVICE(root), "chassis", chip_id);
-    qdev_prop_set_uint16(DEVICE(root), "slot", index);
-
     pci_realize_and_unref(root, pci->bus, &error_fatal);
 }
 
@@ -93,7 +91,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
-    pnv_phb_attach_root_port(pci, phb->phb_id, phb->chip_id);
+    pnv_phb_attach_root_port(pci);
 }
 
 static const char *pnv_phb_root_bus_path(PCIHostState *host_bridge,
@@ -162,9 +160,18 @@ static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
+    PCIBus *bus = PCI_BUS(qdev_get_parent_bus(dev));
     PCIDevice *pci = PCI_DEVICE(dev);
     uint16_t device_id = 0;
     Error *local_err = NULL;
+    int chip_id, index;
+
+    chip_id = object_property_get_int(OBJECT(bus), "chip-id", &error_fatal);
+    index = object_property_get_int(OBJECT(bus), "phb-id", &error_fatal);
+
+    /* Set unique chassis/slot values for the root port */
+    qdev_prop_set_uint8(dev, "chassis", chip_id);
+    qdev_prop_set_uint16(dev, "slot", index);
 
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
-- 
2.37.2


