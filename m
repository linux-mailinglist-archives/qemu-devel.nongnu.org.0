Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B44485A98
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:28:35 +0100 (CET)
Received: from localhost ([::1]:57836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Dpi-0006nc-5N
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:28:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlI-00018h-Ek; Wed, 05 Jan 2022 16:24:00 -0500
Received: from [2607:f8b0:4864:20::930] (port=40642
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlG-0007r8-VT; Wed, 05 Jan 2022 16:24:00 -0500
Received: by mail-ua1-x930.google.com with SMTP id v12so823832uar.7;
 Wed, 05 Jan 2022 13:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=09oUM6fPrjpWihLkEOruGhAM+iBsNP8mc0Mn2B7WtX8=;
 b=PVKrVKGWz4hm4+l+svlRZUG2Wv/l/4OBy0itim+5h6YR20bv4MdcX4HtgtEwlDCjeE
 lTrHmY50toIKTxeP5AhuhbmMXzv6FjByGaUMPbO2ERAPLARIJXjvb3/m+gv6t9tx7Jkl
 w4+Q+qtDf5Wu91d7kZXONatw9wuYyal95k+y22N2g6+L7h8k3qs1QpIh+Eb2CkNGTHie
 IPCQMq4kNNAxz5tgngF0NSV6iVIJCcIMDtWiKgJhNJn8Hmz0j0mtLccalFk33vEnyjkG
 hwfuSkt5Cr/cbcK0L+4Kk4eBJECdKq0YLKE8H75hufTapZpa8IGOGwqiaIpBxg0D6gw/
 i9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=09oUM6fPrjpWihLkEOruGhAM+iBsNP8mc0Mn2B7WtX8=;
 b=IXiZK2MLraIMXgvVQQm+ETe03yq+cTA/sJuVls6giZVzmnS1R1x/dgJMrdt7S6FjJj
 MF1Xl7cUjcDZoTh8b+ZqEvuRtoRXKcckeCTfIcuXBCMyu7KdcVIoIwNzVIVIKfZqIITS
 iVIsUDLANCD77eAvMr4uLylMhGTX1ZPMmzbCK68UTjKG+N7V3wzKR1ldgf09ygVAGpwg
 xdFHGxbdqpB9NcRzy//SuZLIMnkf4v44+jYlZIZ8NbUrw96YW7c04XCa33uKCKVMtwlH
 ANstOnfsElefcMNXncfDm1lKFhlbsToJdyieDp72YcwvjUQRQJgeLIGq4LRoBZHKat3V
 Z8ng==
X-Gm-Message-State: AOAM531ClGpJBkumrvnlzGetRosQdSqKksD7KK5l/URrOTPruF8KUhxZ
 hcV6O+91CDhIwErs921gCsdZ+zYtSB8=
X-Google-Smtp-Source: ABdhPJzEz1lwIoqXLCafjOeVkkFI9pAY9F2Yok2pssHtLrLCOMGvIraw3aHHolSa/5NQeEuihQHEZw==
X-Received: by 2002:a05:6102:2927:: with SMTP id
 cz39mr17301397vsb.59.1641417836800; 
 Wed, 05 Jan 2022 13:23:56 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:23:56 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/18] pnv_phb4.c: add unique chassis and slot for
 pnv_phb4_root_port
Date: Wed,  5 Jan 2022 18:23:22 -0300
Message-Id: <20220105212338.49899-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A similar situation as described previously with pnv_phb3_root_port
devices also happens with pnv_phb4_root_ports.

The solution is the same: assign an unique chassis/slot combo for them.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 5ba26e250a..836b0c156c 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1338,8 +1338,23 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
 static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
+    PCIDevice *pci = PCI_DEVICE(dev);
+    PCIBus *bus = pci_get_bus(pci);
+    PnvPHB4 *phb = NULL;
     Error *local_err = NULL;
 
+    phb = (PnvPHB4 *) object_dynamic_cast(OBJECT(bus->qbus.parent),
+                                          TYPE_PNV_PHB4);
+
+    if (!phb) {
+        error_setg(errp, "%s must be connected to pnv-phb4 buses", dev->id);
+        return;
+    }
+
+    /* Set unique chassis/slot values for the root port */
+    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
+    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
+
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.33.1


