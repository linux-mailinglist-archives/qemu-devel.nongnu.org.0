Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6778448AF1A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:05:56 +0100 (CET)
Received: from localhost ([::1]:56722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Hmd-0000A9-GX
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:05:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7GvO-0003hW-IE; Tue, 11 Jan 2022 08:10:54 -0500
Received: from [2607:f8b0:4864:20::934] (port=34494
 helo=mail-ua1-x934.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7GvG-0007R0-F8; Tue, 11 Jan 2022 08:10:48 -0500
Received: by mail-ua1-x934.google.com with SMTP id y4so29620989uad.1;
 Tue, 11 Jan 2022 05:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ugUtWpAHRMF5nzUo/rvlJcah7cbaFYhJwimtBiXs0uY=;
 b=mqoCdGhx0SeDDfKcrl+ttyp1iclupo7434d8ZFfefUFrVwCzBGo5acxUmjmKPeLpAB
 qArdNVuTN/ZZl+A/rTz1+xISe5HKB4Ac4piY2sMDPgSO9bHYlH2WnPde8p/wHGwmbi+P
 ztLl6v+dlmCVnPhEoGmtbV6vmRIXgD+Cn1yMlg7bx1u021dXXGA8Dp+zEq3hhLzNUWpK
 CjGzJF3fMGoSF4l4MP9YGz7y8F6SiI75DCYQJMutjSpVG5V4MyIosBGnYMs8GjePEY2B
 FSbZsRQEmSE7FRRgHARAC6TOHpszbaECh2Ceet0CHzZgqkK/pmq2btsTkz4LiIp3ZRes
 TPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ugUtWpAHRMF5nzUo/rvlJcah7cbaFYhJwimtBiXs0uY=;
 b=EocSlElYw9ic3kuM6Y6qQ1jjmfGoKLfLcULPZk/r/Sw9n6LBVAREsDbPku82057LPq
 io2IO2RsHM08TuiAdlfvLnS17iSegakIkwzysPUu99aIOLngSCTM5TN4EW9f0dAvHd7n
 RzCokdaSP836KTDkom2dxhDrUlo9O3/M1jwwEUIvtUFtaQ/l3qZqxlkJR0J100pVy0KJ
 ilfzWdvgp/hd9RZewZswU9QGLfS+izvoVqfkTNh2oS3pxxc8f1H4BxHksHM2MJoCt9LE
 lRQKJ2L9kNfzP4ktwzC1YFztJA+BL6bCDJyyGfM+xofAqP7H58WZXCYHgU3c98qA3skX
 Qu8Q==
X-Gm-Message-State: AOAM530kvJhsXJ5ul3i5TtMj9mvsxoh2yzranCQ3WhI24huUWssMyWAn
 SuM/scBlJo5+i0+5wSxAt214/6kORfKnzWw0
X-Google-Smtp-Source: ABdhPJxLytYMnUg4wasI0VvaT9LT4wfvIjDMteikxUoNZoSI9sxosRVIKyj/8NfPRrWSGhJXjYjubA==
X-Received: by 2002:ab0:7c5c:: with SMTP id d28mr2045139uaw.123.1641906641137; 
 Tue, 11 Jan 2022 05:10:41 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id f1sm5386381uae.5.2022.01.11.05.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 05:10:40 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/5] ppc/pnv: turn 'phb' into a pointer in struct
 PnvPhb4PecStack
Date: Tue, 11 Jan 2022 10:10:25 -0300
Message-Id: <20220111131027.599784-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111131027.599784-1-danielhb413@gmail.com>
References: <20220111131027.599784-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::934
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x934.google.com
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

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         |  2 +-
 hw/pci-host/pnv_phb4_pec.c     | 20 +++++++-------------
 include/hw/pci-host/pnv_phb4.h |  7 +++++--
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 94fd8c858d..ee046725ac 100644
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


