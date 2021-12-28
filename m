Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC742480CDA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:49:03 +0100 (CET)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IT1-0005Xh-0B
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:49:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIp-0003ld-1t; Tue, 28 Dec 2021 14:38:32 -0500
Received: from [2607:f8b0:4864:20::82c] (port=34692
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIn-00044e-3b; Tue, 28 Dec 2021 14:38:30 -0500
Received: by mail-qt1-x82c.google.com with SMTP id o17so17087660qtk.1;
 Tue, 28 Dec 2021 11:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vrkDjgKppKzQGTIo1wj0QuJKlu9Bp3LERFGDDCEreL0=;
 b=poR8A13lvSzVio4je5btxfZBwW10Ke1ZAYi/sEzVq+XXgcd7ZVtsCkCTxYHBs4Yx8n
 gH4/NXyl7OwimN1pCmwXZYYJHlOR+r0nDnSwWgTfeIsery6rPer9MDAjMHb3v34Ul26B
 yxSDX88rckuLiLy2pCFBi/pgNjfSqjaBs8Y/W+EyG5FQul8WiOgP6yYgeGlDHEFaNkD6
 n5Fsi/Cal0i/rhdGkVJbSdOcLZFd71s6to9byymL7Gygcil/+FvKwBDGQxE071SWItyR
 5kKH2R9yDYSrqb3MSvb0lED6A2Ike2bTjZwd36X3grt3GSVK5Uh/h6Dxka8MRm95c4oB
 r3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vrkDjgKppKzQGTIo1wj0QuJKlu9Bp3LERFGDDCEreL0=;
 b=pb3nIwtCx1dpu6IW2dPyuNJkCvRZIoRLXpvYsQvhaJtu6XNlbNnwEvrMcfuKjSTZ+D
 aGhsq4GmkhNYxPXNYCrwArO60Fx9HtA504uyuarglkdjanrzKtokPLZFSSHNeEFTcGt5
 KyywKhd/MHLIu7WG3cJunjlZ3Opg2BozBYiRBBnn+XT4fTS8zE8JFo2gfn1K5Wr5T0Ji
 aMGb9sz3RjWuG/zOjUC/WBVDosH8dabgD0/qgzfnHACFM7R1vRo2oOj2OUY9iiAsNNah
 78A8jC+/su+lRobsCIQ0YuND9Fb+pY5gOwirm8OKnBhSeJIXV+lmBzxyBVKy83Z8JCcp
 TU7g==
X-Gm-Message-State: AOAM5312/hr5VlvxPXWqXbTjShfkvsLPEsvGbeWCOgjUDOM2aA5xvdPh
 IhoAB7QS0bUagT53FhQyvwRFjhuvz78=
X-Google-Smtp-Source: ABdhPJwYN/NuDbcBAln5MNF0PmdqoF/i3lzpSTdDIhs+C5LdUNj5CFdLCY4rPoXQEIzSCQK0yxzAdQ==
X-Received: by 2002:ac8:5a42:: with SMTP id o2mr19665505qta.400.1640720306240; 
 Tue, 28 Dec 2021 11:38:26 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:26 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/17] pnv.c: simplify pnv_phb_attach_root_port()
Date: Tue, 28 Dec 2021 16:37:54 -0300
Message-Id: <20211228193806.1198496-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
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

The root port 'chassis' and 'slot' attributes are being set in the
realize() callback of phb3_root_port and phb4_root_port.

Remove the unneeded 'chassis' and 'slot' setting from
pnv_phb_attach_root_port().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 1bd84d20c1..605296fab5 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1222,12 +1222,10 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
 }
 
 /* Attach a root port */
-static void pnv_phb_attach_root_port(PCIHostState *pci, int id, const char *name)
+static void pnv_phb_attach_root_port(PCIHostState *pci, const char *name)
 {
     PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
 
-    qdev_prop_set_uint8(&root->qdev, "chassis", id);
-    qdev_prop_set_uint16(&root->qdev, "slot", id);
     pci_realize_and_unref(root, pci->bus, &error_fatal);
 }
 
@@ -1326,7 +1324,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), phb->phb_id,
+        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
                                  TYPE_PNV_PHB3_ROOT_PORT);
     }
 }
@@ -1506,7 +1504,7 @@ static void pnv_chip_power9_pec_realize(PnvChip *chip, Error **errp)
         for (j = 0; j < pec->num_stacks; j++) {
             PnvPHB4 *phb = &pec->stacks[j].phb;
 
-            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), phb->phb_id,
+            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
                                      TYPE_PNV_PHB4_ROOT_PORT);
         }
     }
@@ -1754,7 +1752,7 @@ static void pnv_chip_power10_phb_realize(PnvChip *chip, Error **errp)
         for (j = 0; j < pec->num_stacks; j++) {
             PnvPHB4 *phb = &pec->stacks[j].phb;
 
-            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), phb->phb_id,
+            pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
                                      TYPE_PNV_PHB5_ROOT_PORT);
         }
     }
-- 
2.33.1


