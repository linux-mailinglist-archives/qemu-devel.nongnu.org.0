Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8B248EFB4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:14:18 +0100 (CET)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8R5d-0004Zh-5s
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:14:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzE-0005eI-Ep; Fri, 14 Jan 2022 13:07:40 -0500
Received: from [2607:f8b0:4864:20::22f] (port=34659
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzB-0000OZ-Ge; Fri, 14 Jan 2022 13:07:40 -0500
Received: by mail-oi1-x22f.google.com with SMTP id r131so13274781oig.1;
 Fri, 14 Jan 2022 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fgF5H6lNIGjSlEyrdCNMVwu51M54GmXO+JKSD0uKvAA=;
 b=I74iRHm1sdDMK3GDPFhqCsbhrSIterByM4pUCLJdek/sQnadoEomh+TGY/G7AFQFE5
 aaMm97/EE/3gDurx2M8KEHtqfSkc3EyY4adv8uafySdSkd7XexUOQ4h8NtYz7dpQizOt
 /FxUJxVDwKxUAmwgR3oEWk19nj8y7oeELgQHI6Gp7J7X6vAsAFDhkvGeq0Tjyp7e+JgH
 mrsiV37RKu69+fac3Zn23MNl2WXgFqMGzZ/2zK3TcEXqnMv3LVz9yhc4r4kXY7bjOD8R
 TNi6qdjc9z+3//h5EJk9i0K2musg/g4YrfQmYflipWUJNHiMkfrsjPsbr/1efomx6ku3
 zZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fgF5H6lNIGjSlEyrdCNMVwu51M54GmXO+JKSD0uKvAA=;
 b=X4Hqpsk8Q5xnibL0nUlgKKesmjEeM3ll2ZoB3GZAmeEuWPTroEz0C5XM6yWwOtBaHT
 y0aZAUg4RRSZzA7GBhrQ1tk9fRSbXgg9qEvPlNO1uOV6Y2UW2d32oz+eOQrGMBbqBo+I
 9sZL4Zit2phkf//Ws1BuKuzQGrzrdsssovbxkfEUXRWaRe5KfKimvjWH3kwwafWFqfyL
 u1laDweeJML6fTzVQl/uQCI3m9wQZ9fSsH9VkR2JvVoUG7DxapEiBnyAY8h2PM06Vs3k
 CZt3AavlaNJ0CnhnDSEp9xWj32DZsqypjH8oQX60FGGHroFlkMRpI7mQTrU8k9+Uvkoc
 skaQ==
X-Gm-Message-State: AOAM531VQs9cAOPCbskbLZ9h5WPkSxON7Zepmfa4/4C+srgtMUD2rf7Q
 72Jd+ZG0+s2/99/a9cWpRk3NCVFyJtuktlxh
X-Google-Smtp-Source: ABdhPJyBJwLSpi+HIGiVjS97Sqhk9i2oue2wODrJHaPMwjPrnOlSbvl4sX5036x48I/PqbBCLsDYqA==
X-Received: by 2002:a05:6808:1805:: with SMTP id
 bh5mr11663960oib.105.1642183655117; 
 Fri, 14 Jan 2022 10:07:35 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id e17sm1353584otr.13.2022.01.14.10.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:07:34 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] ppc/pnv: remove stack pointer from PnvPHB4
Date: Fri, 14 Jan 2022 15:07:14 -0300
Message-Id: <20220114180719.52117-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220114180719.52117-1-danielhb413@gmail.com>
References: <20220114180719.52117-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This pointer was being used for two reasons: pnv_phb4_update_regions()
was using it to access the PHB and phb4_realize() was using it as a way
to determine if the PHB was user created.

We can determine if the PHB is user created via phb->pec, introduced in
the previous patch, and pnv_phb4_update_regions() is no longer using
stack->phb.

Remove the pointer from the PnvPHB4 device.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 15 ++++-----------
 hw/pci-host/pnv_phb4_pec.c     |  2 --
 include/hw/pci-host/pnv_phb4.h |  2 --
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 4933fe57fe..2efd34518e 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1573,9 +1573,10 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     char name[32];
 
     /* User created PHB */
-    if (!phb->stack) {
+    if (!phb->pec) {
         PnvMachineState *pnv = PNV_MACHINE(qdev_get_machine());
         PnvChip *chip = pnv_get_chip(pnv, phb->chip_id);
+        PnvPhb4PecStack *stack;
         PnvPhb4PecClass *pecc;
         BusState *s;
 
@@ -1584,7 +1585,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        phb->stack = pnv_phb4_get_stack(chip, phb, &local_err);
+        stack = pnv_phb4_get_stack(chip, phb, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -1594,18 +1595,12 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
          * All other phb properties but 'pec' ad 'version' are
          * already set.
          */
-        object_property_set_link(OBJECT(phb), "pec", OBJECT(phb->stack->pec),
+        object_property_set_link(OBJECT(phb), "pec", OBJECT(stack->pec),
                                  &error_abort);
         pecc = PNV_PHB4_PEC_GET_CLASS(phb->pec);
         object_property_set_int(OBJECT(phb), "version", pecc->version,
                                 &error_fatal);
 
-        /*
-         * Assign stack->phb since pnv_phb4_update_regions() uses it
-         * to access the phb.
-         */
-        phb->stack->phb = phb;
-
         /*
          * Reparent user created devices to the chip to build
          * correctly the device tree.
@@ -1707,8 +1702,6 @@ static Property pnv_phb4_properties[] = {
         DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
         DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
         DEFINE_PROP_UINT64("version", PnvPHB4, version, 0),
-        DEFINE_PROP_LINK("stack", PnvPHB4, stack, TYPE_PNV_PHB4_PEC_STACK,
-                         PnvPhb4PecStack *),
         DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
                          PnvPhb4PecState *),
         DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 22194b8de2..ed1d644182 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -293,8 +293,6 @@ static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
                             &error_fatal);
     object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
                             &error_fatal);
-    object_property_set_link(OBJECT(stack->phb), "stack", OBJECT(stack),
-                             &error_abort);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
         return;
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 1d27e4c0cb..a9059b7279 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -151,8 +151,6 @@ struct PnvPHB4 {
     XiveSource xsrc;
     qemu_irq *qirqs;
 
-    PnvPhb4PecStack *stack;
-
     QLIST_HEAD(, PnvPhb4DMASpace) dma_spaces;
 };
 
-- 
2.33.1


