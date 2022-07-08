Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FC856BB0B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:39:54 +0200 (CEST)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9oD3-0005BU-5J
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzI-0002zG-O9; Fri, 08 Jul 2022 09:25:42 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:38622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9nzG-000715-Ej; Fri, 08 Jul 2022 09:25:40 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 cb12-20020a056830618c00b00616b871cef3so16196343otb.5; 
 Fri, 08 Jul 2022 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r0xJoGCzM8PSvF4db3gvvajKr+o1bn4SEDq0ERqtkXk=;
 b=OuLogYSD1ewl6N/dU2ssFgaoZIj1nbZgTtQIMkrA3vce0xzzNCM3aF+VCxJVyUBCXw
 tBfzJB6HXjN/BPsWmOBCJC+i2AB/FH+nkF52ZXaVw1EXV8Pnl/S6QNIp4HAgcImndPkA
 9occdb/e197SCcVvTm9WmlvZuDiB5JNPa2KfRJGnOIyN5MXwLnMtlQS35MY113XBqr7J
 qnRvEmkyucQ4TMVLB8Fs0120L1CT/LYXETE11mf8Y594vs4h+TNtDq9jDiIH5TFCI0Vk
 uhsdRySqdbcmOsmRQ8UQmWP8WgvE13OYj6uHoDMnAMbh7nJmpvgV1bxN+X+VF7dAXJEr
 EoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r0xJoGCzM8PSvF4db3gvvajKr+o1bn4SEDq0ERqtkXk=;
 b=oAn5KgPUvgIO+IPzsC8Pv+RTFuOifNsv5exV6liz4GTNx7LlJZ96e2/aP0Jqu0xLRQ
 SFAQELPN7m8ydf3y1fJekzKc+IT5Zsp0SmAcbc55PsbtKOlOPnP78ZMHZuEed1vikBpk
 xo2UphbeOGZBJ/nwd3Z9ZfcDkScTke47l9Zs/cqUiGUPf23f/ikVvLntqQApgwK58wkD
 dusC3TGB4zVsnAPcxVrH5n+2xRgn8NjbPLVxz1FJcolYEn4i+2Q5/YlrW15WQ7mi1BVJ
 y6XEizlhmZl0AYvdEmyabWzd08bN/Md7YMgP4G5EXdNX51GQZIrHajZiRDKfNmknFMNC
 XQ5w==
X-Gm-Message-State: AJIora/V20klt/BL8o3Bte53ngmPnWhAgfjnyR50UNhcAzGb89GPeUVm
 5M4k+9rl2AuikFaLCyNoj5MvVtJNc94=
X-Google-Smtp-Source: AGRyM1vpsJyguSm1/1VC3TfDEJ0GpPIZVS0DDkOOoa/hsgGGMnsqXFOt16WQ6uPsiXQmQknpAfQccQ==
X-Received: by 2002:a05:6830:1f41:b0:61c:1f8e:edc0 with SMTP id
 u1-20020a0568301f4100b0061c1f8eedc0mr1532662oth.366.1657286737256; 
 Fri, 08 Jul 2022 06:25:37 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 f108-20020a9d03f5000000b0060c00c3fde5sm18435797otf.72.2022.07.08.06.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 06:25:37 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 05/10] ppc/pnv: turn chip8->phbs[] into a PnvPHB* array
Date: Fri,  8 Jul 2022 10:25:17 -0300
Message-Id: <20220708132522.581382-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708132522.581382-1-danielhb413@gmail.com>
References: <20220708132522.581382-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32c.google.com
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
index d649ed6b1b..a94f269644 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -661,7 +661,7 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
     ics_pic_print_info(&chip8->psi.ics, mon);
 
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB *phb = &chip8->phbs[i];
+        PnvPHB *phb = chip8->phbs[i];
         PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
         pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
@@ -1158,7 +1158,17 @@ static void pnv_chip_power8_instance_init(Object *obj)
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
@@ -1274,7 +1284,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
 
     /* PHB controllers */
     for (i = 0; i < chip8->num_phbs; i++) {
-        PnvPHB *phb = &chip8->phbs[i];
+        PnvPHB *phb = chip8->phbs[i];
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
         object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
@@ -1942,7 +1952,7 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
         }
 
         for (j = 0; j < chip8->num_phbs; j++) {
-            PnvPHB *phb = &chip8->phbs[j];
+            PnvPHB *phb = chip8->phbs[j];
             PnvPHB3 *phb3 = PNV_PHB3(phb->backend);
 
             if (ics_valid_irq(&phb3->lsis, irq)) {
@@ -1981,7 +1991,7 @@ static void pnv_ics_resend(XICSFabric *xi)
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


