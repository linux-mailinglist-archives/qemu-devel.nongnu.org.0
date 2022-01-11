Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A7448A49B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 01:59:58 +0100 (CET)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n75W0-0002Gc-UW
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 19:59:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75SS-0007t7-Ut; Mon, 10 Jan 2022 19:56:16 -0500
Received: from [2607:f8b0:4864:20::932] (port=42631
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75SR-0003qY-4A; Mon, 10 Jan 2022 19:56:16 -0500
Received: by mail-ua1-x932.google.com with SMTP id p1so26867856uap.9;
 Mon, 10 Jan 2022 16:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ulWnj7DnciFK5BbmO2nNr3F06z2CczGJN0dmkz0OFbs=;
 b=e2vAFK/SOxs53ZlCXbpKG0MyQHt58ezCo9PY3iQqzx3JCxWpY4TxTk+Byx+/34OAMj
 DW8pFr5VXEpgP+YKa9TEY/1XlYBRB6f19RdZPHeM+9NjbJQmqz3mIOoDI8L543yRCgzM
 QzAE4dDglZcodJKbgT67Tv5qKSE2+8ouovkl3aRtxY1DlWB3eBJvyCbPh2shOdvnTanJ
 iQrE9c4VGKzOLSPSVL/kVqC5PKedqlWAuAE/PS6sGpElyar/kEQJzvYFFhqKRRb/Wif/
 HWBqZKxmp2aEJQ1CD7YfUCOXpRE0oqakWWsKyUI2TW1p5IOkV6DhzYXNSqLoK8am2eKZ
 HXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ulWnj7DnciFK5BbmO2nNr3F06z2CczGJN0dmkz0OFbs=;
 b=sCEubETxqMhEe6J5HKzpxg0jzfZ5EAafj6GbAt7jEckLzducKdQ/EPN2DfEesV7i/e
 g5z5uEj0i3r8AMBkT2ADY9HLN9f8omDXJnVSdTDG5A8OKNo0eFXgrpWqekSOIcQyjD4D
 JWNSxRUYbPb4FMvpr6GEPBY4cK2yYZ0GtpI0Fi1+3+i1qVjGEmoj66w0xcKcksc+l5YV
 xjpiKHzAdjp6lnTWBeE8Tu2hmxDw+o/HF+q/f/8XPjvjIpdRGqxYoZomKkfJ0hBRfsWv
 f9cSTvbTUDwwnUiYgilYiMncgYUi+moZhPYVVG7pzIZn45bqpfouStggjU7sx6S1h3px
 y+/Q==
X-Gm-Message-State: AOAM530lC6SGDG9Z8JEMoHyADKRV/8QNr/iFLjpflubIjkbfPur8e/TD
 Sd/u30CTBfk1FC9+EPA4d8iBbibffV4FzyC1
X-Google-Smtp-Source: ABdhPJzvv19X+lFVN+GnPO65VRgqP7jaTwJJELWVK+jSkwq7spm/3J6BHANJjm+7hItuzJJ4Rlw0zg==
X-Received: by 2002:a05:6102:3913:: with SMTP id
 e19mr975655vsu.3.1641862573782; 
 Mon, 10 Jan 2022 16:56:13 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id x190sm4645562vkf.56.2022.01.10.16.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 16:56:13 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/5] ppc/pnv: turn 'phb' into a pointer in struct
 PnvPhb4PecStack
Date: Mon, 10 Jan 2022 21:55:56 -0300
Message-Id: <20220111005558.549685-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111005558.549685-1-danielhb413@gmail.com>
References: <20220111005558.549685-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::932
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x932.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

At this moment, stack->phb is the plain PnvPHB4 device itself instead of
a pointer to the device. This will present a problem when adding user
creatable devices because we can't deal with this struct and the
realize() callback from the user creatable device.

We can't get rid of this attribute, similar to what we did when enabling
pnv-phb3 user creatable devices, because pnv_phb4_update_regions() needs
to access stack->phb to do its job. This function is called twice in
pnv_pec_stk_update_map(), which is one of the nested xscom write
callbacks (via pnv_pec_stk_nest_xscom_write()). In fact,
pnv_pec_stk_update_map() code comment is explicit about how the order of
the unmap/map operations relates with the PHB subregions.

All of this indicates that this code is tied together in a way that we
either go on a crusade, featuring lots of refactories and redesign and
considerable pain, to decouple stack and phb mapping, or we allow stack
update_map operations to access the associated PHB as it is today even
after introducing pnv-phb4 user devices.

This patch chooses the latter. Instead of getting rid of stack->phb,
turn it into a PHB pointer. This will allow us to assign an user created
PHB to an existing stack later. In this process,
pnv_pec_stk_instance_init() is removed because stack->phb is being
initialized in stk_realize() instead.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         |  2 +-
 hw/pci-host/pnv_phb4_pec.c     | 20 +++++++-------------
 include/hw/pci-host/pnv_phb4.h |  7 +++++--
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 1bd74fd932..3ffa8f51e9 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1728,7 +1728,7 @@ type_init(pnv_phb4_register_types);
 
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
 {
-    PnvPHB4 *phb = &stack->phb;
+    PnvPHB4 *phb = stack->phb;
 
     /* Unmap first always */
     if (memory_region_is_mapped(&phb->mr_regs)) {
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index bf0fdf33fd..d4c52a5d28 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -275,13 +275,6 @@ static const TypeInfo pnv_pec_type_info = {
     }
 };
 
-static void pnv_pec_stk_instance_init(Object *obj)
-{
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
-
-    object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
-}
-
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
@@ -289,15 +282,17 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
 
-    object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id,
+    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
+
+    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
                             &error_fatal);
-    object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
+    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
                             &error_fatal);
-    object_property_set_int(OBJECT(&stack->phb), "version", pecc->version,
+    object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
                             &error_fatal);
-    object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack),
+    object_property_set_link(OBJECT(stack->phb), "stack", OBJECT(stack),
                              &error_abort);
-    if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
         return;
     }
 }
@@ -324,7 +319,6 @@ static const TypeInfo pnv_pec_stk_type_info = {
     .name          = TYPE_PNV_PHB4_PEC_STACK,
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(PnvPhb4PecStack),
-    .instance_init = pnv_pec_stk_instance_init,
     .class_init    = pnv_pec_stk_class_init,
     .interfaces    = (InterfaceInfo[]) {
         { TYPE_PNV_XSCOM_INTERFACE },
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 5ee996ebc6..82f054cf21 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -177,8 +177,11 @@ struct PnvPhb4PecStack {
     /* The owner PEC */
     PnvPhb4PecState *pec;
 
-    /* The actual PHB */
-    PnvPHB4 phb;
+    /*
+     * PHB4 pointer. pnv_phb4_update_regions() needs to access
+     * the PHB4 via a PnvPhb4PecStack pointer.
+     */
+    PnvPHB4 *phb;
 };
 
 struct PnvPhb4PecState {
-- 
2.33.1


