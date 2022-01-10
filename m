Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A91489B7C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 15:42:47 +0100 (CET)
Received: from localhost ([::1]:59932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vsk-0003E2-9e
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 09:42:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkQ-0001p1-0h; Mon, 10 Jan 2022 09:34:10 -0500
Received: from [2607:f8b0:4864:20::932] (port=44738
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n6vkO-0007PY-7N; Mon, 10 Jan 2022 09:34:09 -0500
Received: by mail-ua1-x932.google.com with SMTP id l15so12300189uai.11;
 Mon, 10 Jan 2022 06:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OneMw1VqmZNcVdBJPyfxEcxT2KtQmEF4L7LMqx4uY2w=;
 b=BNG7etJt0Eq4lbKVCZlX4sSoQb6LdL8NkZ68UCyHhqgREdwdDTzsNCalCOIYHfcvjs
 tJBLP6cD+RD6lvCjVei2Kqxzg+q72xJwUi5aMmAz+yHGcpK7kt7eyLUvzxZdnFenwswv
 1CIV6d0wURydr2YQUtZvp5fQQsfq2yVNTexDBMH4vuL3vZjw3IU6+eKSc0ktsPBh9fEB
 U13xhE93qoQ/l5r8fQCRbjdJsOOALpimSs1T4n5k+zd3wE7MQL7H1ABLshsk8+mRIUrL
 p0KMpAZ66eZRvuShP9xz1p88mGPSVe/7llGY22aLDK3bYn9kSdChq31hYz21Njks0kfq
 XRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OneMw1VqmZNcVdBJPyfxEcxT2KtQmEF4L7LMqx4uY2w=;
 b=GMJ6ZyUzvXRHE3aA6o/ettzxV+JfTd62u7WUZIqsbmAW9aJAx4Q+E+Af27qj8d296q
 t8kb4KSs597HD1MgjZEm9rhGiKTpD7tpi+neS57UC9Gx7UtPISuoYKyjBlGOsTw1CMJy
 EmqnpwFVpJzpffdE7KyP8v+84Psa5F87n5Qnd5bBbn5p7rLm0PDOIIpbcsumucU9WamT
 90JJ6HQrBJtxDOPLf+KWRIk9rkwz9RRa7FOsH3zmuAdxV1EZXx2yvRc5HhO3GtK/rTpp
 mCU4pLgMLPJRsjXA51wkryE9sJCaHxOb/IZWPbTyZ580g4UUaRBUYcLrHDU+mhLk89vQ
 IwRQ==
X-Gm-Message-State: AOAM533q7ZhSAMe0Z87BYSHeDENXzXaK+fZPnX5uVvNnf/s8VDD/1yUn
 khfbkD8MvtphxeDnlJmccR9kx6DQhpAYst63
X-Google-Smtp-Source: ABdhPJyyOgasqrwa0l9p++UIIFL+IA3RqhdDOM+toVO12O0eiaPhNMao3zPmoSFWYJZZejbRb1lKlQ==
X-Received: by 2002:a05:6102:3ec1:: with SMTP id
 n1mr4213505vsv.1.1641825246897; 
 Mon, 10 Jan 2022 06:34:06 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id o11sm3709677vkf.41.2022.01.10.06.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 06:34:06 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/10] ppc/pnv: turn 'phb' into a pointer in struct
 PnvPhb4PecStack
Date: Mon, 10 Jan 2022 11:33:42 -0300
Message-Id: <20220110143346.455901-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110143346.455901-1-danielhb413@gmail.com>
References: <20220110143346.455901-1-danielhb413@gmail.com>
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

At this moment, stack->phb is the plain PnvPHB4 device itself instead
of a pointer to the device. This will present a problem when adding user
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
PHB to an existing stack later.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         |  2 +-
 hw/pci-host/pnv_phb4_pec.c     | 12 ++++++------
 include/hw/pci-host/pnv_phb4.h |  7 +++++--
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index fb6c4f993a..1a7395772f 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1443,7 +1443,7 @@ type_init(pnv_phb4_register_types);
 
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
 {
-    PnvPHB4 *phb = &stack->phb;
+    PnvPHB4 *phb = stack->phb;
 
     /* Unmap first always */
     if (memory_region_is_mapped(&phb->mr_regs)) {
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index d2851e8040..042dc0b775 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -403,9 +403,9 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
          * available here via the 'i' iterator so it's convenient to
          * do it now.
          */
-        object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
+        object_property_set_int(OBJECT(stack->phb), "index", phb_id,
                                 &error_abort);
-        pnv_phb4_set_stack_phb_props(stack, &stack->phb);
+        pnv_phb4_set_stack_phb_props(stack, stack->phb);
 
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
@@ -543,7 +543,7 @@ static void pnv_pec_stk_instance_init(Object *obj)
 {
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
 
-    object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
+    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
 }
 
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
@@ -574,10 +574,10 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     /* PHB pass-through */
     snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
              pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
-                          &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
+    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(stack->phb),
+                          &pnv_phb4_xscom_ops, stack->phb, name, 0x40);
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
+    if (stack->phb && !sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
         return;
     }
 
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index b2c4a6b263..2fb5e119c4 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -178,8 +178,11 @@ struct PnvPhb4PecStack {
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


