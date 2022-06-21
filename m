Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C3E5538FB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:36:46 +0200 (CEST)
Received: from localhost ([::1]:38106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hnx-0005iV-PF
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hm3-0002pH-P8; Tue, 21 Jun 2022 13:34:47 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:35694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hm1-0002Ks-5b; Tue, 21 Jun 2022 13:34:47 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-101d96fe0a5so9772478fac.2; 
 Tue, 21 Jun 2022 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2sjQ1PEwzNrRmTof4HPK2BqFxFXmrYidB2rpovzMR6g=;
 b=XOPrwHfjrZ9Uwbggcwb6xxuScjtYScmKz8XOey3OtsxDPRya3UttTD/ixw5dK5/W/5
 4p+ZYyFMB1h75PKjBnmRB3HSKAsMxluiIzbL9wGE5OjYgIaRkB4sEwDCKTNtuM2YcuUE
 4pKF9XlR8Vq6Zl8tKvIlCFpYrOUjdvPJv5HogARAzXSowFiPQ/oGNbvO4M0dwCxKgYL/
 1Q6PHLf6xQorUP72yrJUgN4H8FSXUzk0lPLEpVf8vni3dCX4ay+PTdJSdRwFTIK1HGuf
 pEHT4K3emVvlPHcVi78hIFH0Ia3qiIzK+ieQ/Ip2GFXFbAWgjZIjhPxZQPULPQEv4wvN
 0vbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sjQ1PEwzNrRmTof4HPK2BqFxFXmrYidB2rpovzMR6g=;
 b=sGolaJKpaH3BzrbsLzbYawdKS+lI4Qcg/BrSp8cU1sFIJwLliGiAU+2GdYjL2hQDWq
 oSy3zyhWebRR8DZxFCkmcmomPyRgm4iWLj9yjbmEcpNzGMYwnByoMyE0ZGJcJjjAd20f
 9h4Yc6uZIIq/GtcvMGlvGLSqP4IuU/Arll8HLHezDiMGPgNxgC44Gn01mCnA6HXOJekr
 oDgbGM4TRQPUbugw4R1tLkg+VCAx9xDV5LxOw3LNi6Yny5h6Ud+wDzdtxwE+yJwbikhF
 5hTEio5VEzeu+U79PVwhkpxzpFOritS8WLpkY/3BTvlDvZnYPNYgGq9LElTpUy0Dt/LD
 e8mg==
X-Gm-Message-State: AJIora+HJYJfmcLHf+oV2y/W1zLJ63zkKOQH/Y5cpJC9WCwFnYdGW6Z+
 nwBQjizZ7N4dqva5mTlgwsBWF/VmJHoEmw==
X-Google-Smtp-Source: AGRyM1tK35admpkHyMOWEVMlLWGNVBMHtLfJQ/ReRbl/uLEHzg+8xmulFPtZf4kxIbBVJjK8+4T0BA==
X-Received: by 2002:a05:6870:d2a5:b0:104:95f5:4d63 with SMTP id
 d37-20020a056870d2a500b0010495f54d63mr1421786oae.215.1655832883516; 
 Tue, 21 Jun 2022 10:34:43 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a056870385600b0010200e2828fsm2886556oal.30.2022.06.21.10.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:34:43 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 1/8] ppc/pnv: move root port attach to pnv_phb4_realize()
Date: Tue, 21 Jun 2022 14:34:29 -0300
Message-Id: <20220621173436.165912-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621173436.165912-1-danielhb413@gmail.com>
References: <20220621173436.165912-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Creating a root port is something related to the PHB, not the PEC. It
also makes the logic more in line with what pnv-phb3 does.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c     | 4 ++++
 hw/pci-host/pnv_phb4_pec.c | 3 ---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 6594016121..23ad8de7ee 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1547,6 +1547,7 @@ static void pnv_phb4_instance_init(Object *obj)
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB4 *phb = PNV_PHB4(dev);
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     XiveSource *xsrc = &phb->xsrc;
     int nr_irqs;
@@ -1583,6 +1584,9 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
+    /* Add a single Root port if running with defaults */
+    pnv_phb_attach_root_port(pci, pecc->rp_model);
+
     /* Setup XIVE Source */
     if (phb->big_phb) {
         nr_irqs = PNV_PHB4_MAX_INTs;
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 8b7e823fa5..c9aaf1c28e 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -130,9 +130,6 @@ static void pnv_pec_default_phb_realize(PnvPhb4PecState *pec,
     if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
         return;
     }
-
-    /* Add a single Root port if running with defaults */
-    pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), pecc->rp_model);
 }
 
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
-- 
2.36.1


