Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAC75A86B3
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:25:00 +0200 (CEST)
Received: from localhost ([::1]:60050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTKd-0001Re-7x
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoZ-0003Fl-5R; Wed, 31 Aug 2022 14:51:52 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:34316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoW-00084X-SS; Wed, 31 Aug 2022 14:51:50 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso19836913fac.1; 
 Wed, 31 Aug 2022 11:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FUtxwO+VKZe96jRlHy43CoypJPbejpX5I3LKQUVGH9I=;
 b=hh26h/48b0XskUrz/XXRQFAB0hv9rS6h9xCFYzeVAB2RY+0VP1uw6gGDRX8kCWddTQ
 UTUMQG6UL5HTJFkJai1cJ2mdc0kK9kbSqO/Ao3XnOq+glZ/A8LakLbN146O5BTcU2to4
 dTZk416w4IvErrnTR9n9QiP8IbF88PXl2NvKXxn6t+UFEu9li1rNLy6KDOLX9/rOlbYu
 yHg2C2WIfhddLlmIJcrlSHQOkmTklaiAL7J9ZZ0/1MZTRAEIPfkgZZrHCbhKBCVTrSM/
 ffy1W5+7DVdZQEanzUyNJxdLR10IIF9j4vC8s/pTYlAM+3JQ8hAJWJrpFW6+j9eLDVeb
 XJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FUtxwO+VKZe96jRlHy43CoypJPbejpX5I3LKQUVGH9I=;
 b=qZBNvvAr6j/2AE4KUYeZiOqdR5Rtes1AZCcpMZxjlkqTEjqklRf097hKQjk7te9wz1
 FvmcP8/ZI7PUWonFeelA2nNSEh27MIkc6cgek3iDW9xZkiOhX1jqBO5E4mU6mirv9tEg
 ZhC4ZQ3DrWHB6cpbtppSbcdHw0QjeE/COA2tloll3I008pniUoR1wNmKae5V1Z0zBXEu
 FarkLFoNTjvqXMzoRa97NO0E0ZhPNmbwi/E249uDJ2Hwsc1O/W5oMTMaOwq74KtFqbGX
 tVFmue0wyVBSPuZ8ebZcwrPekEgCQIqUh6mOYlw9EAH5wVl+EurzQ8f3DDaqSU/Bbbv5
 Ok5w==
X-Gm-Message-State: ACgBeo2Tnfq0UpwoexrwCgNJHxK/ZndezE38AXbDLRo7pQvnOm22elFd
 82h7waG1o/wAuLmn/Lco8S3tCmb2JDg=
X-Google-Smtp-Source: AA6agR42ZIniddfHgjcv+8YKP+wM5+3F6WC1sYexH87JolPZn/nm3T+1cTmSiDe5qszWAr6WbVQbww==
X-Received: by 2002:a05:6870:ec88:b0:11f:963:1019 with SMTP id
 eo8-20020a056870ec8800b0011f09631019mr2181705oab.201.1661971905591; 
 Wed, 31 Aug 2022 11:51:45 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 22/60] ppc/pnv: turn chip8->phbs[] into a PnvPHB* array
Date: Wed, 31 Aug 2022 15:49:56 -0300
Message-Id: <20220831185034.23240-23-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2f.google.com
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
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220811163950.578927-6-danielhb413@gmail.com>
---
 hw/ppc/pnv.c         | 27 ++++++++++++++++++++++-----
 include/hw/ppc/pnv.h |  6 +++++-
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 737dee4980..0208517f1a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -294,6 +294,13 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
 Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
 {
     if (phb->version == 3) {
+        Pnv8Chip *chip8 = PNV8_CHIP(chip);
+
+        phb->chip = chip;
+
+        chip8->phbs[chip8->num_phbs] = phb;
+        chip8->num_phbs++;
+
         return OBJECT(chip);
     } else {
         /* phb4 support will be added later */
@@ -681,7 +688,7 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
     ics_pic_print_info(&chip8->psi.ics, mon);
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB *phb = &chip8->phbs[i];
+        PnvPHB *phb = chip8->phbs[i];
         PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
         pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
@@ -1174,7 +1181,17 @@ static void pnv_chip_power8_instance_init(Object *obj)
     chip8->num_phbs = pcc->num_phbs;
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB);
+        Object *phb = object_new(TYPE_PNV_PHB);
+
+        /*
+         * We need the chip to parent the PHB to allow the DT
+         * to build correctly (via pnv_xscom_dt()).
+         *
+         * TODO: the PHB should be parented by a PEC device that, at
+         * this moment, is not modelled powernv8/phb3.
+         */
+        object_property_add_child(obj, "phb[*]", phb);
+        chip8->phbs[i] = PNV_PHB(phb);
     }
 
 }
@@ -1290,7 +1307,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
 
     /* PHB controllers */
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB *phb = &chip8->phbs[i];
+        PnvPHB *phb = chip8->phbs[i];
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
@@ -1983,7 +2000,7 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
         }
 
         for (j = 0; j < chip8->num_phbs; j++) {
-            PnvPHB *phb = &chip8->phbs[j];
+            PnvPHB *phb = chip8->phbs[j];
             PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
             if (ics_valid_irq(&phb3->lsis, irq)) {
@@ -2022,7 +2039,7 @@ static void pnv_ics_resend(XICSFabric *xi)
         ics_resend(&chip8->psi.ics);
 
         for (j = 0; j < chip8->num_phbs; j++) {
-            PnvPHB *phb = &chip8->phbs[j];
+            PnvPHB *phb = chip8->phbs[j];
             PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
             ics_resend(&phb3->lsis);
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index c44f357bce..9ef7e2d0dc 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -82,7 +82,11 @@ struct Pnv8Chip {
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
2.37.2


