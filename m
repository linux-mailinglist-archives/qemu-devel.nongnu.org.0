Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4484480CD2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:44:29 +0100 (CET)
Received: from localhost ([::1]:37000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IOZ-0006n9-CG
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:44:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIh-0003k5-2R; Tue, 28 Dec 2021 14:38:23 -0500
Received: from [2607:f8b0:4864:20::833] (port=34698
 helo=mail-qt1-x833.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIf-000445-GO; Tue, 28 Dec 2021 14:38:22 -0500
Received: by mail-qt1-x833.google.com with SMTP id o17so17087437qtk.1;
 Tue, 28 Dec 2021 11:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0gqiZsTwBeBRumWsH7uAf7GyzP7xKDYzPW4/g4mv+D0=;
 b=DzHGjM7CyLLXS+SwhvRj9Hw0KJJ6M1+8lFYJvz5V2i5SftEdwk6B8Q/qC216B3khTm
 2yevhAOLG0J5mpCWbEPOyP39PEEdbrtlFoiaozG+NQGbhVqf6+CGN6CnrylTZH6CY935
 7tKjgG1RS7fOCPFaUxsKXKP3KmI6/yrGDKxpL2Z1fIx9GHQF4eISI5UFeOVd4VMkXxvx
 ocZKwloeJS2Kvop7m6HMVvyF5WAlRUo6jf2PNQOpw89jnaQ+mv3EeI6VFCniHM86R6W/
 zbfJVGKdF63r3GACmKDKJW5DUtmMkZ2kPz0sh/O5PRta84YUp7ymjtIMln9+DKEE3drH
 SEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0gqiZsTwBeBRumWsH7uAf7GyzP7xKDYzPW4/g4mv+D0=;
 b=5rWsjs7elchB7daaUmTFioCeOYNrDByC68LvFbTHeHaRGg/czOkIKYuc8KUg2UQ2Ll
 W4d8NmfaGxUSB4ny6VQDQm0PyeAu4Cp8J6oHFDjv9UbNSALceGet99qQc/3FTRBEWjVy
 dkBOd9+OngaIb0QcM1dVSWrWtHUoWS8fT/C5XJqucPMuoa/Yx/MUnl/hNmjN5TARXOzq
 e4jMaEsRgNz/uNdhUx74YeY72k8wCAu6rSCYrRtOoObCn3NjOKtwuj7i+O8tUf39+Ivk
 m7I7aoQ0xe7mPDvApX5wyj0hKqd0qUZcm3gCL8CxiNQ3vfcw/YrkzXNr+pmYT3V9eZ8O
 Ljaw==
X-Gm-Message-State: AOAM531UWEpYn8onMrlwu47MtIwhiBYaYegvJDnES2n6NcPLs7i1/Ibc
 Edh+6pMMIez+PxSix4aLk6WTPadUsiw=
X-Google-Smtp-Source: ABdhPJzTRkKbncKoQKA4IOGPkLrWyYDT+Z7R3tJMTsLhjD7zZOosppymqTfjVpGbcW+p0vge7P6jxw==
X-Received: by 2002:ac8:7e83:: with SMTP id w3mr20054975qtj.160.1640720300434; 
 Tue, 28 Dec 2021 11:38:20 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:20 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/17] pnv_phb3.c: do not set 'root-bus' as bus name
Date: Tue, 28 Dec 2021 16:37:51 -0300
Message-Id: <20211228193806.1198496-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::833
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x833.google.com
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

All pnv-phb3-root-bus buses are being created as 'root-bus'. This
makes it impossible to, for example, add a pnv-phb3-root-port in
a specific root bus, since they all have the same name. By default
the device will be parented by the pnv-phb3 device that precedeced it in
the QEMU command line.

Moreover, this doesn't all for custom bus naming. Libvirt, for instance,
likes to name these buses as 'pcie.N', where 'N' is the index value of
the controller in the domain XML, by using the 'id' command line
attribute. At this moment this is also being ignored - the created root
bus will always be named 'root-bus'.

This patch fixes both scenarios by removing the 'root-bus' name from the
pci_register_root_bus() call. If an "id" is provided, use that.
Otherwise use 'NULL' as bus name. The 'NULL' value will be handled in
qbus_init_internal() and it will defaulted as lowercase bus type + the
global bus_id value.

After this path we can define the bus name by using the 'id' attribute:

qemu-system-ppc64 -m 4G -machine powernv8,accel=tcg \
    -device pnv-phb3,chip-id=0,index=1,id=pcie.0

  dev: pnv-phb3, id "pcie.0"
    index = 1 (0x1)
    chip-id = 0 (0x0)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pcie.0
      type pnv-phb3-root-bus

And without an 'id' we will have the following default:

qemu-system-ppc64 -m 4G -machine powernv8,accel=tcg \
    -device pnv-phb3,chip-id=0,index=1

  dev: pnv-phb3, id ""
    index = 1 (0x1)
    chip-id = 0 (0x0)
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pnv-phb3-root-bus.0
      type pnv-phb3-root-bus

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 130d392b3e..f1b1f109a3 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1064,7 +1064,8 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
     memory_region_init(&phb->pci_mmio, OBJECT(phb), "pci-mmio",
                        PCI_MMIO_TOTAL_SIZE);
 
-    pci->bus = pci_register_root_bus(dev, "root-bus",
+    pci->bus = pci_register_root_bus(dev,
+                                     dev->id ? dev->id : NULL,
                                      pnv_phb3_set_irq, pnv_phb3_map_irq, phb,
                                      &phb->pci_mmio, &phb->pci_io,
                                      0, 4, TYPE_PNV_PHB3_ROOT_BUS);
-- 
2.33.1


