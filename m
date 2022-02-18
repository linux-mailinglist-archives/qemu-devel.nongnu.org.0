Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF784BC12F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 21:29:38 +0100 (CET)
Received: from localhost ([::1]:34498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL9sn-0000OG-FS
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 15:29:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nL9rV-0007w7-Vr; Fri, 18 Feb 2022 15:28:18 -0500
Received: from [2607:f8b0:4864:20::c2d] (port=43872
 helo=mail-oo1-xc2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nL9rU-0006MQ-1P; Fri, 18 Feb 2022 15:28:17 -0500
Received: by mail-oo1-xc2d.google.com with SMTP id
 w10-20020a4ae08a000000b0031bdf7a6d76so4852757oos.10; 
 Fri, 18 Feb 2022 12:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nQDxcHjvSEMiJDZ35VlzUJQYSmG3uxXsFJsTJzdSpGo=;
 b=UnnmNLbWpg4DqOcTrPByLShhIlaQvu10WBYkJWLGMML71UgvJlV07PTHDJeloKc0n3
 /icdYjnmIFWLGkmbbnUoWGLlhKsBtMd3D5GJA7D4+GlqoqR0hubgK/u6E15W1+ypnzbU
 j8cQT6A3Z+U3Z0s7ehdnlYdE2BJer3gZZVmP53A9EoMqVyM9BbCafC/7B+WgIJ0hbzd5
 ntyvHeRp1bHYqg6JH/KhZ+poaiio4BCzPwRLdojVlhfO1kQWAIubUCaYFFuvi8CFib1N
 zQz/7Hbk0Ae283E0/S+EWEfYWNesnNOavzqyDiHhyW7TdyQG4H7PV5qbtuTlnrrLvN/u
 WW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nQDxcHjvSEMiJDZ35VlzUJQYSmG3uxXsFJsTJzdSpGo=;
 b=bHHlwRK0iqXUQ4QivFWcRWnSEnJMhWeP03QzDPM8gXLpXjPyAd+Ty24lW77xAtvZE3
 kJhHlBOUY30e3syKVC8xbZEbpqkc/dsm/9V/Mn0LuhPOFYVNiYMBx/L1UF4IKxgmlK5p
 +jQqcMeJGpVdd0cvxaJwmO5ebY5AE2AEYxQ5H0uFBg+1iSZstqV25NYkVsQ0wnogG+75
 MlqFLWD1hSJP4tA6FIB6j5Hf8XvdDim7SNCUzA98FNDQrUsJ723vOolKAQyIY9z4gXgO
 2LM2PUUHA+UQRPiRL9G4iEjpGetsUklppL/diax1vgy4GTHoLGBd7E5MZ+Lntuh2xcgc
 WaCw==
X-Gm-Message-State: AOAM530S34p2WKHBjMVuQS2vuCv71gif9fe27y5ioeg4OgtJASi0dLjB
 hNNtmulq1AbhHr1H4bIcVAf4S+Nz3ag=
X-Google-Smtp-Source: ABdhPJyC2751oRoj8Q6anYlFZrJej5iLdZ+4k/5/qcSTnQv03jHH+QhDEOwr6QVUHMHU/EVT0euYLw==
X-Received: by 2002:a05:6870:11cd:b0:d0:9f44:26f2 with SMTP id
 13-20020a05687011cd00b000d09f4426f2mr4977472oav.58.1645216094126; 
 Fri, 18 Feb 2022 12:28:14 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id eh38sm15643849oab.36.2022.02.18.12.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 12:28:13 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ppc/pnv: fix default PHB4 QOM hierarchy
Date: Fri, 18 Feb 2022 17:28:04 -0300
Message-Id: <20220218202804.413157-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Commit 3f4c369ea63e ("ppc/pnv: make PECs create and realize PHB4s")
changed phb4_pec code to create the default PHB4 objects in
pnv_pec_default_phb_realize(). In this process the stacks[] PEC array was
removed and each PHB4 object is tied together with its PEC via the
phb->pec pointer.

This change also broke the previous QOM hierarchy - the PHB4 objects are
being created and not being parented to their respective chips. This can
be verified by 'info pic' in a powernv9 domain with default settings.
pnv_chip_power9_pic_print_info() will fail to find the PHBs because
object_child_foreach_recursive() won't find any.

The solution is to set the parent chip and the parent bus, in the same
way done for user created PHB4 devices, for all PHB4 devices.

Fixes: 3f4c369ea63e ("ppc/pnv: make PECs create and realize PHB4s")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index e91249ef64..846e7d0c3e 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1568,40 +1568,36 @@ static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 {
     PnvPHB4 *phb = PNV_PHB4(dev);
+    PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
+    PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
     PCIHostState *pci = PCI_HOST_BRIDGE(dev);
     XiveSource *xsrc = &phb->xsrc;
+    BusState *s;
     Error *local_err = NULL;
     int nr_irqs;
     char name[32];
 
-    /* User created PHB */
-    if (!phb->pec) {
-        PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
-        PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
-        BusState *s;
-
-        if (!chip) {
-            error_setg(errp, "invalid chip id: %d", phb->chip_id);
-            return;
-        }
+    if (!chip) {
+        error_setg(errp, "invalid chip id: %d", phb->chip_id);
+        return;
+    }
 
+    /* User created PHBs need to be assigned to a PEC */
+    if (!phb->pec) {
         phb->pec = pnv_phb4_get_pec(chip, phb, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
+    }
 
-        /*
-         * Reparent user created devices to the chip to build
-         * correctly the device tree.
-         */
-        pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
+    /* Reparent the PHB to the chip to build the device tree */
+    pnv_chip_parent_fixup(chip, OBJECT(phb), phb->phb_id);
 
-        s = qdev_get_parent_bus(DEVICE(chip));
-        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
-            error_propagate(errp, local_err);
-            return;
-        }
+    s = qdev_get_parent_bus(DEVICE(chip));
+    if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
+        error_propagate(errp, local_err);
+        return;
     }
 
     /* Set the "big_phb" flag */
-- 
2.34.1


