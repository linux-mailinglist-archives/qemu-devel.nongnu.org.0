Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71463550424
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 13:06:50 +0200 (CEST)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2WHx-0006SS-HZ
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 07:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDa-0007qd-LF; Sat, 18 Jun 2022 07:02:21 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:38560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDY-0005es-UE; Sat, 18 Jun 2022 07:02:18 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-101b4f9e825so3991009fac.5; 
 Sat, 18 Jun 2022 04:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eckipunu8DdgKOEbpsdAZWxd3eae/mTpVb8Dq8go+VI=;
 b=RETRNzPxKDV02DAxTF1uPFVsGVRUqYFa7YwCWoFTN/cvX8ML/yMDwgFI/eyP+gJmFz
 2dui/f81frGxdxP4tagXrrGQpD0BJhztpe6S9mB/d79Fi0FT4QPONUGsma6D5N99mRwN
 Pt7N0XlluhDtOjXBXl+KxCKTGVEHMZrl5OesUU8cTFVcixTKT3+8aG1V5q3O55/evWHF
 PQiVaKMikBYJwEhJaGFAeyC/Q7rWxtBOk8HY8R2FEHLX3MaTljwRhpBimdEJuwFMwrO0
 Tz1ygdCjfXQD+FGmC8uyLoJKD/Ox6Z9bnIqaLrAur98ehyTXiRtoYKnzEZ5Vdger6sId
 0GGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eckipunu8DdgKOEbpsdAZWxd3eae/mTpVb8Dq8go+VI=;
 b=fKICW05bsY6SRIy5YmxcFviQ+m6EVM1/BNEuWCx4bHpWGI0RvXy0OzJASlnmwvU+b3
 hBKCBRtwNLGSLwQcDxC8xyH+8Qsoe82+j9MrCgA3kOkNKAIjrOs1H1UFhjQX1bw33NRO
 0CExEEtyvg2nDVPQqoL7i9avtPptqh+MP0fdcrsfYsHLYScYcz8fcUdKs91SRj9lOjL+
 OnTov1F873wIzRTmsDMv6btCbXkPyYuGWkvggP3L/WZxfWJAtt6diiacodrF0rCqwF4W
 9/WJS8UjD+D+wi33dyBt7ysfc+caNycY5QUXe+MVu6oOEniyuVlkYgSGKqCcd0fVCoLw
 CsDQ==
X-Gm-Message-State: AJIora9Kv8SQx2lGLwetq1fh5w3fxcSV2r7FUOVqHViK9QHDqmkn+d4G
 dT19YxV7wvALMczE7GGdEm3QpwxJlq8=
X-Google-Smtp-Source: AGRyM1tBCtMDDDSgP/JvIMk6H45IuX26NxDE7ydjZmCj+9ok6oxJCtpJVK4o6wIARN4DFbXwnqFw4g==
X-Received: by 2002:a05:6870:23a8:b0:101:ae39:a0f3 with SMTP id
 e40-20020a05687023a800b00101ae39a0f3mr3590237oap.236.1655550135531; 
 Sat, 18 Jun 2022 04:02:15 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a9d5a90000000b0060603221280sm4075456oth.80.2022.06.18.04.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 04:02:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 3/9] ppc/pnv: use dev->parent_bus->parent to get the PHB
Date: Sat, 18 Jun 2022 08:01:56 -0300
Message-Id: <20220618110202.87735-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618110202.87735-1-danielhb413@gmail.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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

It is not advisable to execute an object_dynamic_cast() to poke into
bus->qbus.parent and follow it up with a C cast into the PnvPHB type we
think we got.

A better way is to access the PnvPHB object via a QOM macro accessing
the existing parent links of the DeviceState. For a given
pnv-phb3/4-root-port 'dev', dev->parent_bus will give us the PHB bus,
and dev->parent_bus->parent is the PHB. Use the adequate QOM macro to
assert the type, and keep the NULL check in case we didn't get the
object we were expecting.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 10 +++++++---
 hw/pci-host/pnv_phb4.c | 10 +++++++---
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 4ba660f8b9..5e7f827415 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1139,12 +1139,16 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PCIDevice *pci = PCI_DEVICE(dev);
-    PCIBus *bus = pci_get_bus(pci);
     PnvPHB3 *phb = NULL;
     Error *local_err = NULL;
 
-    phb = (PnvPHB3 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
-                                          TYPE_PNV_PHB3);
+    /*
+     * dev->parent_bus gives access to the pnv-phb-root bus.
+     * The PnvPHB3 is the owner (parent) of the bus.
+     */
+    if (dev->parent_bus) {
+        phb = PNV_PHB3(dev->parent_bus->parent);
+    }
 
     if (!phb) {
         error_setg(errp,
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index ffd9d8a947..a0ee52e820 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1782,12 +1782,16 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
     PCIDevice *pci = PCI_DEVICE(dev);
-    PCIBus *bus = pci_get_bus(pci);
     PnvPHB4 *phb = NULL;
     Error *local_err = NULL;
 
-    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
-                                          TYPE_PNV_PHB4);
+    /*
+     * dev->parent_bus gives access to the pnv-phb-root bus.
+     * The PnvPHB4 is the owner (parent) of the bus.
+     */
+    if (dev->parent_bus) {
+        phb = PNV_PHB4(dev->parent_bus->parent);
+    }
 
     if (!phb) {
         error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
-- 
2.36.1


