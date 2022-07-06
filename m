Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C37569339
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:23:17 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BYJ-0001RW-PY
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLQ-0008TP-1g; Wed, 06 Jul 2022 16:09:56 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:33291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLO-0003Ex-FJ; Wed, 06 Jul 2022 16:09:55 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id j6so16270414vsi.0;
 Wed, 06 Jul 2022 13:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JGy2CgJ232vjVWURfpgAafMxtjiYgOvM8Z0RmGya7F4=;
 b=ZFWQkRgGCQweUWUZpX4sMzW9+xba5wcFctOf/rVxIjTIXBGRe9kNNGoA/qFK3AAMzA
 3IbwEO/EbGRgV8sYLEGsEMtRIzmS9IyRKUW+i4Hhx1ug7V8zfpsh361dXgLs3jMf2HTT
 W+CQ6BASlt11QiQGuF3NMNDwBlvf7xuXTtleqxlj+eYkWoLyDiOSQjkMRUjTEFslkslf
 /EbK0oohPHQeOjJaP+axscGkRi5zFtQbA3IcZGNOKX5C8euSrB/wF1Xsbyye1njKTtwk
 uQf39mq15S6XBT1EGymvqYvihxbM6Mwx17tNPtoPyr+WCK4d1MSllpaaqT/VlyXDbJ/Y
 VPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JGy2CgJ232vjVWURfpgAafMxtjiYgOvM8Z0RmGya7F4=;
 b=JLpbxez5ize4Z1MfNa/6y2X4GWiEbvI49unRVf2OYW9/927verUOlnR3OW/DVINKp3
 0y2Gjj72enFOYWd8Yx5eE2tCfVQQX8+0Aq7j8UND8ip6Bpn6fP3PgPeAKoioL+jVctz9
 wqBwEtKU3vx1TonEKiWqyf+GxEBZx0RdYDnpP/E+Mg5061etwTgYZEJJva2MFPxCmh8q
 K1cHhnchPt7aSXeDgcuKVEzdRfLvz+S4N9YnWw43eZMVr/mUAlgk/XOMlS09PceKecLq
 eOzwwYjkYiTnSoXk6MerlO+psYTHz6e1OxxnTMD6lpYPHiz2RGiNT54+f9a17ohZFNGv
 Hr7w==
X-Gm-Message-State: AJIora+GfDK0YZvXD3okEP1Pj5rhCny6cAJDABzSfLBooImHNNO4DopN
 tUx1YaJXxs7JFvfFwa9mZrv+kbgIfyY=
X-Google-Smtp-Source: AGRyM1veKS1A3uVnhl2U6B1WSud9I1pyzBJ2guYrSx9SdoG+iBQUaNi5YWy4nUSZnVAZzb7S0e8Atw==
X-Received: by 2002:a05:6102:159f:b0:357:147b:bb55 with SMTP id
 g31-20020a056102159f00b00357147bbb55mr2862683vsv.34.1657138193037; 
 Wed, 06 Jul 2022 13:09:53 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:09:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 01/34] ppc/pnv: move root port attach to pnv_phb4_realize()
Date: Wed,  6 Jul 2022 17:09:13 -0300
Message-Id: <20220706200946.471114-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2a.google.com
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
Message-Id: <20220621173436.165912-2-danielhb413@gmail.com>
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


