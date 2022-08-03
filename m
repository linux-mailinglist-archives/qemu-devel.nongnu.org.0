Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D541588E4F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:12:41 +0200 (CEST)
Received: from localhost ([::1]:34788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJF72-0001K0-L9
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgf-00035S-Ui; Wed, 03 Aug 2022 09:45:25 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:37660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgb-0004nz-MX; Wed, 03 Aug 2022 09:45:25 -0400
Received: by mail-vs1-xe32.google.com with SMTP id 66so17876021vse.4;
 Wed, 03 Aug 2022 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=qFovJpe3Ilxf0VBZbr5cmTOO/a10Qs+IAfnAcwsSVuM=;
 b=eE7QS+eH+4q93ty0cU5g76eAKwINrir2p0olZHTerrD6YTeuemIL6acozmruhOju2c
 PlKYm+nAd9Ag2CuHvd8PEkj37lbtrVzrrIwX3g9SKqcncvgbVGXjWatpvyuKLXBLyHpB
 yWIUap3RLrXHwBv0GOcyz1j9UVksdj3Oa896y6pbGZy5G0GM8akDSDDDAw/nQwf8M/ga
 CK+OCnJNbAFHkrMzjtozYwVpJ4jN05jKZvrgkyNi4j4AXpDfpViNZfwvlPQAi892eCV1
 I8wO63C4CVE8ER8rV7EWwVKFqLxrUFsQrQBzTWhKhIwgqCf0eceQrUCfLmDa5CNogY9j
 03XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=qFovJpe3Ilxf0VBZbr5cmTOO/a10Qs+IAfnAcwsSVuM=;
 b=QJfkDlx4CLaLFFA9pq2fw4cvGuiQYiaUrqwrS2XaR0sqDzN96qKiSnV9S9PnFgEOxh
 KX5TTJvrMwcyhVb70/2bbcKWgaendrtbi2mogKM8hV09fymI+vWI1OBe31ZfhokFwKCC
 Qj0fmwMGbSqMtsxTem6WoXCHZfEsOHYwlEP47WjhTI5zM+Wh10gg/MqqOcJXCSkLDaYT
 c/f2DOl0FqJNdHqO1rediJT/JDPFrfr7+wnh9YKzJfgEdOz0UsFW2VsrAGdchOHNLybD
 HTnMsgk+W4WTrZjYR7365DbjjIPItU6Hk0S/P5pD2x7eTT1R9yiI9xvXuzSrWldBh+Yb
 mVyA==
X-Gm-Message-State: AJIora+FxAdX1xotSkNORoa5nCQAdSCzRoYCc6faDEcrrulKDfj3q4zu
 ErzbUbMuWatYfmIiRJa/4QBzIndxcrc=
X-Google-Smtp-Source: AGRyM1u40xq0TKUsV72C1aqG9gDmISkOXW4G+qe1AnC2WQMox8poWzg//QJZwWSk2M7FVljNLkr2Pg==
X-Received: by 2002:a05:6102:3910:b0:358:3092:8bb4 with SMTP id
 e16-20020a056102391000b0035830928bb4mr9294569vsu.15.1659534316298; 
 Wed, 03 Aug 2022 06:45:16 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 q201-20020a1f2ad2000000b00377fba67271sm932420vkq.34.2022.08.03.06.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:45:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 05/10] ppc/pnv: turn chip8->phbs[] into a PnvPHB* array
Date: Wed,  3 Aug 2022 10:44:54 -0300
Message-Id: <20220803134459.2633902-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220803134459.2633902-1-danielhb413@gmail.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe32.google.com
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
 hw/pci-host/pnv_phb.c | 11 +++++++++++
 hw/ppc/pnv.c          | 20 +++++++++++++++-----
 include/hw/ppc/pnv.h  |  6 +++++-
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index da779dc298..077f391d59 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -89,6 +89,17 @@ static void pnv_phb_user_device_init(PnvPHB *phb)
         return;
     }
 
+    if (phb->version == 3) {
+        Pnv8Chip *chip8 = PNV8_CHIP(chip);
+
+        phb->chip = chip;
+
+        chip8->phbs[chip8->num_phbs] = phb;
+        chip8->num_phbs++;
+
+        parent = OBJECT(phb->chip);
+    }
+
     /*
      * Reparent user created devices to the chip to build
      * correctly the device tree. pnv_xscom_dt() needs every
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


