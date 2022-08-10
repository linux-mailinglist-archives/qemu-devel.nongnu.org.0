Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A2E58EA58
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 12:12:42 +0200 (CEST)
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLihd-0004DW-Os
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 06:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLib6-0006pr-KG; Wed, 10 Aug 2022 06:06:01 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:33373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLib4-0000uC-Ty; Wed, 10 Aug 2022 06:05:56 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id q15so14663195vsr.0;
 Wed, 10 Aug 2022 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=NQFqbwALdRiX7wwO3qFjaIKW0d0xtJ9AW0eJhFmjOKs=;
 b=e7k7MTjOYKzibWnMM3vXKvcGMm9cETFZaH8/SRbqSHaWA05Tazak54fBCk4ThKup7r
 b9dARi5mizJn6IoOmAesuDieLVjsXSXgFlC4LWKCo16ZG5DQfiN9aZ740QHG+9sdXSn3
 inK7gxfWEba2GVqSG62cJhluFN9i6UoA6WvjvAgvDLeAvva4K/GpUW13677jbrxlU9qI
 eq0EDjKR9EvJvhcJVVOPGXOEJ1JVJzZwYso1ka+T5ly0yzof9ehe6KC30Td392rGrTG4
 IyAXWNyRtgKq+O9uGBX15UdtO6InL6NHyaXG8j6R0bjaD6QH6ZhCVkgvRKMh2XZjQRop
 gPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=NQFqbwALdRiX7wwO3qFjaIKW0d0xtJ9AW0eJhFmjOKs=;
 b=aJUbWsXlCkSTdNhhcJslBWDS53TRhjo/CO3a+HlTVQGeME+MUbO6uzLOdnfSETHnFp
 V0A/bFPGGz0MhKjO3WOPPxjaQdx4mYCtR6kNS3z4hPVGh6COPSMQhiJF87cL/kLwZMVb
 Zu2qsK4PbWHDsODFNsnZAWrSOqioyRmH+50u4vyO1HoUKxZp690TaOVaI94lspYpbBBN
 5sv2w9cTrO471wygofcdiiiXwWK21cWAyMJSzXKVQBIaROJme8NTNgv8G/CQyL97Zb8r
 0GPpe5mSgb2DP0aOs9KJKisbKi13zHqBHJFfiG76VmrYzBsGzLMHx4FIOXWM1u+BzWAy
 2ceg==
X-Gm-Message-State: ACgBeo0oLkRgj6CCR3UQI4LwWlTPYxquT0TRGBzlHYh9ipw3hSiSKxnN
 XSGLryERTRqlXw9e3zl6+b8aFJlA/ro=
X-Google-Smtp-Source: AA6agR6/BQax4DpjndD9B02CXBUWCl+T0OWMrYdcDLW05yhct53BcSS87V6Z1AZzxpxpDvJ31AUsmw==
X-Received: by 2002:a67:ce08:0:b0:388:4407:b2fa with SMTP id
 s8-20020a67ce08000000b003884407b2famr11169222vsl.57.1660125953540; 
 Wed, 10 Aug 2022 03:05:53 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 2-20020a1f1602000000b0037613541b27sm12277919vkw.39.2022.08.10.03.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 03:05:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v3 05/11] ppc/pnv: turn chip8->phbs[] into a PnvPHB*
 array
Date: Wed, 10 Aug 2022 07:05:30 -0300
Message-Id: <20220810100536.473859-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220810100536.473859-1-danielhb413@gmail.com>
References: <20220810100536.473859-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2c.google.com
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

When enabling user created PHBs (a change reverted by commit 9c10d86fee)
we were handling PHBs created by default versus by the user in different
manners. The only difference between these PHBs is that one will have a
valid phb3->chip that is assigned during pnv_chip_power8_realize(),
while the user created needs to search which chip it belongs to.

Aside from that there shouldn't be any difference. Making the default
PHBs behave in line with the user created ones will make it easier to
re-introduce them later on. It will also make the code easier to follow
since we are dealing with them in equal manner.

The first step is to turn chip8->phbs[] into a PnvPHB3 pointer array.
This will allow us to assign user created PHBs into it later on. The way
we initilize the default case is now more in line with that would happen
with the user created case: the object is created, parented by the chip
because pnv_xscom_dt() relies on it, and then assigned to the array.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c |  7 +++++++
 hw/ppc/pnv.c          | 20 +++++++++++++++-----
 include/hw/ppc/pnv.h  |  6 +++++-
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 18a050a6d3..40a960c54c 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -90,6 +90,13 @@ static void pnv_phb_user_device_init(PnvPHB *phb)
     }
 
     if (phb->version == 3) {
+        Pnv8Chip *chip8 = PNV8_CHIP(chip);
+
+        phb->chip = chip;
+
+        chip8->phbs[chip8->num_phbs] = phb;
+        chip8->num_phbs++;
+
         parent = OBJECT(chip);
     } else {
         /* phb4 support will be added later */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index f9e5a3d248..44066ffb8c 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -661,7 +661,7 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
     ics_pic_print_info(&chip8->psi.ics, mon);
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB *phb = &chip8->phbs[i];
+        PnvPHB *phb = chip8->phbs[i];
         PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
         pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
@@ -1154,7 +1154,17 @@ static void pnv_chip_power8_instance_init(Object *obj)
     chip8->num_phbs = pcc->num_phbs;
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
+        PnvPHB *phb = PNV_PHB(object_new(TYPE_PNV_PHB));
+
+        /*
+         * We need the chip to parent the PHB to allow the DT
+         * to build correctly (via pnv_xscom_dt()).
+         *
+         * TODO: the PHB should be parented by a PEC device that, at
+         * this moment, is not modelled powernv8/phb3.
+         */
+        object_property_add_child(obj, "phb[*]", OBJECT(phb));
+        chip8->phbs[i] = phb;
     }
 
 }
@@ -1270,7 +1280,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
 
     /* PHB controllers */
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB *phb = &chip8->phbs[i];
+        PnvPHB *phb = chip8->phbs[i];
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
@@ -1938,7 +1948,7 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
         }
 
         for (j = 0; j < chip8->num_phbs; j++) {
-            PnvPHB *phb = &chip8->phbs[j];
+            PnvPHB *phb = chip8->phbs[j];
             PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
             if (ics_valid_irq(&phb3->lsis, irq)) {
@@ -1977,7 +1987,7 @@ static void pnv_ics_resend(XICSFabric *xi)
         ics_resend(&chip8->psi.ics);
 
         for (j = 0; j < chip8->num_phbs; j++) {
-            PnvPHB *phb = &chip8->phbs[j];
+            PnvPHB *phb = chip8->phbs[j];
             PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
             ics_resend(&phb3->lsis);
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index 033d907287..aea6128e7f 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -81,7 +81,11 @@ struct Pnv8Chip {
     PnvHomer     homer;
 
 #define PNV8_CHIP_PHB3_MAX 4
-    PnvPHB       phbs[PNV8_CHIP_PHB3_MAX];
+    /*
+     * The array is used to allow quick access to the phbs by
+     * pnv_ics_get_child() and pnv_ics_resend_child().
+     */
+    PnvPHB       *phbs[PNV8_CHIP_PHB3_MAX];
     uint32_t     num_phbs;
 
     XICSFabric    *xics;
-- 
2.36.1


