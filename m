Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9106F480CD6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:45:57 +0100 (CET)
Received: from localhost ([::1]:38788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IQ0-0007zo-J8
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:45:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIp-0003le-1t; Tue, 28 Dec 2021 14:38:32 -0500
Received: from [2607:f8b0:4864:20::f2c] (port=41485
 helo=mail-qv1-xf2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIn-00044Z-4Q; Tue, 28 Dec 2021 14:38:30 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id h5so17250074qvh.8;
 Tue, 28 Dec 2021 11:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jnMv/5hIl0V178unfqwgd3QFIUiErNAVfl6i1TwmTC4=;
 b=SzxpmiAheiYxTHj/Mdzc75y+duNKhz50soFpVpeTU9lCbyuHhS9kekpu05BR0TaPmM
 PR+Bv7is893hCMOOU7+55dvEcl0Q8UVp8jHhG/G7hAECcdAlBfEHwXp4Mx34orJBsq6C
 mUrO3ypDCt9tQQl6rElC1WDIRBJXzFEW5RjZ02Gxr16U171aad9qMm5IF+tM5kfBwI5l
 ndae1kXsFZGLIhIu1Z30Lb4/p97u1TaPghgGZHeTfPepEtJNBQow6+e6Uw0kiFyI3EDL
 c2II84cZ0q6DNDvm/MSRvhir9f5WIUVJ+HY0POK1wxLX+OE7kdACbfU7PnLFiYSGsKtP
 fAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jnMv/5hIl0V178unfqwgd3QFIUiErNAVfl6i1TwmTC4=;
 b=xjRgW8HFSzDMvSh4fDAEp8l2Jiuj8du/6z5us51mxmxLj/R5IFP/bsek2uyaEer8tL
 0hrrJGVxA7/YBAR2EuYOpMxhXWwl0+WxQNmxoW7FOz3SclpfBNQFC1GFtUL2q/MlaGMi
 5+XvwY/kfAyCYRkZmUEWUbsE6uJKDMMc6wuAY3Mpt66YOVsBjxhVcJ0lwGnyi+eGTToy
 1UpyZQTU8OWvf+ZLrvRGEvHkc3Br03/wuFhLQGGOt9LIzr0qFDRl++SMXicJgFckIK9y
 Gkw1apdkZIPw0ihi0PvsjFvoYn4qwLVOOfSEbhYJy3iHzvnELhVXikNgholO6gnOVn/R
 /Yvg==
X-Gm-Message-State: AOAM532Gms+pNVjFw8YlPZ7BXvoDVYOJ6xnRaiEStOScbyO7kA/Zl3hQ
 0UJ/wSBOT40GMz6dB42HJR92t+7RC/Y=
X-Google-Smtp-Source: ABdhPJzFO7qJICbURovH/hBsauDJGihO0WV7gO54nfwf1oQ0WTn9FhUr/Z6PQBZVPac9mFI59eYr2A==
X-Received: by 2002:ad4:5cac:: with SMTP id q12mr20724568qvh.37.1640720304396; 
 Tue, 28 Dec 2021 11:38:24 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:24 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/17] pnv_phb4.c: add unique chassis and slot for
 pnv_phb4_root_port
Date: Tue, 28 Dec 2021 16:37:53 -0300
Message-Id: <20211228193806.1198496-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
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
index 23ab3ba594..4554490e51 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1396,8 +1396,23 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
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


