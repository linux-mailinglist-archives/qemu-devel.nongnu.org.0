Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3605A86B9
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:28:27 +0200 (CEST)
Received: from localhost ([::1]:45034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTNy-0003mT-QA
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSon-0003la-Jj; Wed, 31 Aug 2022 14:52:05 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSol-00087D-Ls; Wed, 31 Aug 2022 14:52:05 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-11e9a7135easo23776644fac.6; 
 Wed, 31 Aug 2022 11:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=LIveazW63TmFGRHsjJLfehFAxD+MI+7/hexZlKmhdng=;
 b=FMSQvGT0zhsIAPJqpgCtG0Gytaq5yXIsZWijLKtKb4NzOS9rEZzNoXDvXyka9NBn9w
 rRL5lZyOlNa6zVVfIiEqwn5VNsvFsV694tau9maNRWB3Xz6m08WzCS4QaWVg0hK5hHVp
 G3OtQhyC+tvUXxELMA3aZ+Yzugb8xAVox8shXGIu2DS3TjP1NHbM++ZRL3wh0Prt8a5y
 wczjVeHA1iTNYuJ7Zx1dg5qI4RwHBw4MdUM1JFiAgfQWwOTARkbPunx6i5XtZRVCr1wK
 VkBWzbs52JqcTcaT1+1yh7pw8iSBcHDVF7ClZc+v4XlzXGf+BCwpjK5NVabh7lViexJr
 9M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LIveazW63TmFGRHsjJLfehFAxD+MI+7/hexZlKmhdng=;
 b=D1HoSFFZeTJ4QpG4uawyt94zBfFcklhVZ7PJFyqUg08JV4QBBBJBPYq65a2PjsPVG/
 PeORzR6MfUH/r7LU0uLv3d8kz1UYSuJvVFxW0A1Tf/Ig8F83wg02n3FCGztJ39k0Y4Td
 /URjntGeuRi6eyfBtTbgYxpaqAmcEy2YimcpF9due4UagiF+yY7TC/CS6pLDFsIl0RxE
 sorvkel4dRonAgUHCTyZMr36n9DJvDIeeQh95xOUzlmik/Ix4gWOPxnnonOVu3WzN1yT
 P7PK3AM5K9gN0yXATQxZZqcpokwg9PKXTHHdvnyxkvh7CNpyZRHsaeDakpbUoESwdvKW
 hyTA==
X-Gm-Message-State: ACgBeo1+JCkojjXldtztfuY74dobvbpM45Ttv5zea+cIZCvWtsunEi9v
 5YeTpPC3z8gK8SxgcOeLdgDz/zeSAS8=
X-Google-Smtp-Source: AA6agR6Lw+gb4Dcottyo6pnr4bFcLIboi1p/kIQAL7AAab5jjJUgsluMlArMxODNppSRaHdu9O3XZw==
X-Received: by 2002:a05:6870:5713:b0:11c:e8a2:bc8e with SMTP id
 k19-20020a056870571300b0011ce8a2bc8emr2073819oap.191.1661971922127; 
 Wed, 31 Aug 2022 11:52:02 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 28/60] ppc/pnv: consolidate pnv_parent_*_fixup() helpers
Date: Wed, 31 Aug 2022 15:50:02 -0300
Message-Id: <20220831185034.23240-29-danielhb413@gmail.com>
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

We have 2 helpers that amends the QOM and parent bus of a given object,
repectively. These 2 helpers are called together, and not by accident.
Due to QOM internals, doing an object_unparent() will result in the
device being removed from its parent bus. This means that changing the
QOM parent requires reassigning the parent bus again.

Create a single helper called pnv_parent_fixup(), documenting some of
the QOM specifics that we're dealing with the unparenting/parenting
mechanics, and handle both the QOM and the parent bus assignment.

Next patch will make use of this function to handle a case where we need
to change the QOM parent while keeping the same parent bus assigned
beforehand.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220819094748.400578-2-danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 43 ++++++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 17d9960aa1..4ea33fb6ba 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -21,34 +21,45 @@
 
 
 /*
- * Set the QOM parent of an object child. If the device state
- * associated with the child has an id, use it as QOM id. Otherwise
- * use object_typename[index] as QOM id.
+ * Set the QOM parent and parent bus of an object child. If the device
+ * state associated with the child has an id, use it as QOM id.
+ * Otherwise use object_typename[index] as QOM id.
+ *
+ * This helper does both operations at the same time because seting
+ * a new QOM child will erase the bus parent of the device. This happens
+ * because object_unparent() will call object_property_del_child(),
+ * which in turn calls the property release callback prop->release if
+ * it's defined. In our case this callback is set to
+ * object_finalize_child_property(), which was assigned during the
+ * first object_property_add_child() call. This callback will end up
+ * calling device_unparent(), and this function removes the device
+ * from its parent bus.
+ *
+ * The QOM and parent bus to be set aren´t necessarily related, so
+ * let's receive both as arguments.
  */
-static void pnv_parent_qom_fixup(Object *parent, Object *child, int index)
+static bool pnv_parent_fixup(Object *parent, BusState *parent_bus,
+                             Object *child, int index,
+                             Error **errp)
 {
     g_autofree char *default_id =
         g_strdup_printf("%s[%d]", object_get_typename(child), index);
     const char *dev_id = DEVICE(child)->id;
 
     if (child->parent == parent) {
-        return;
+        return true;
     }
 
     object_ref(child);
     object_unparent(child);
     object_property_add_child(parent, dev_id ? dev_id : default_id, child);
     object_unref(child);
-}
-
-static void pnv_parent_bus_fixup(DeviceState *parent, DeviceState *child,
-                                 Error **errp)
-{
-    BusState *parent_bus = qdev_get_parent_bus(parent);
 
-    if (!qdev_set_parent_bus(child, parent_bus, errp)) {
-        return;
+    if (!qdev_set_parent_bus(DEVICE(child), parent_bus, errp)) {
+        return false;
     }
+
+    return true;
 }
 
 /*
@@ -101,8 +112,10 @@ static bool pnv_phb_user_device_init(PnvPHB *phb, Error **errp)
      * correctly the device tree. pnv_xscom_dt() needs every
      * PHB to be a child of the chip to build the DT correctly.
      */
-    pnv_parent_qom_fixup(parent, OBJECT(phb), phb->phb_id);
-    pnv_parent_bus_fixup(DEVICE(chip), DEVICE(phb), errp);
+    if (!pnv_parent_fixup(parent, qdev_get_parent_bus(DEVICE(chip)),
+                          OBJECT(phb), phb->phb_id, errp)) {
+        return false;
+    }
 
     return true;
 }
-- 
2.37.2


