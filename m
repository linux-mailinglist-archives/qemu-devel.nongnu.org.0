Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055C659990A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 11:53:58 +0200 (CEST)
Received: from localhost ([::1]:50164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOyhQ-0005Cl-UY
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 05:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOybf-0000PU-V3; Fri, 19 Aug 2022 05:48:01 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:46975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oOybd-0006gd-VX; Fri, 19 Aug 2022 05:47:59 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11c5505dba2so4634740fac.13; 
 Fri, 19 Aug 2022 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=l2jG350q1kWFMbnETbVmOPR/7vr+uaxszonmxsSsv2Q=;
 b=aHHVngn9DA73coGh/+dY6IqaN0MnWT8CGgMug+Vq1kI1fP0gckIqJTce9L6VFKdDe1
 wpZcd4KGu4z+kNSCwAw72xHe6abaoMNaPi6pxa00f5U6mA5XyU+aCOC1fGU3PcXIYT9s
 nqhS/oBflsIVJ6/HCXxZhkPE0xhCF2ThR7I9SSt9gDHTmzthSzaagTyNM0u1z0fbwwPH
 lOpG6Ita1bCwypxSa3ln80p91T72HV7iXgKoJspI//g/HLmALT4UpeeJRa+FW7COqalQ
 nqF25Ty/fFn7XlMKzGihnnBdBglsmdWrkIBJ7Tc4lG62cFL4ZaXYNsk4AV/cBWCIzM1n
 pT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=l2jG350q1kWFMbnETbVmOPR/7vr+uaxszonmxsSsv2Q=;
 b=Erl3GszjM2Mu9JdshfXL4uRx0DGHZ8ww4sAriyC8aWi3ofnsf3j8fH0E/MNTk5BdM3
 B2CJH93ZO/axnqC72diBogmvth1zftDrbljS5h6yKxHghgbM/e7VHZ04/EpXghrZjsLG
 Reycn3+BjD9s6FEukAKXOau+rtrTG3ePQ1onAuHKFFSoEaeCi91lj93uVt98JtJSgxt5
 4YmtWznxhu2TqK1+s4eI4KW0BPRPRC/mpeqGkYo7+vuJRQInW33Fkm8tw3JonKmX7b9A
 8Z6Y5A/vzP7y9EbMXQEcqAnmEVtE6MtlmSf/zRpYQk47f3qJ2WoEKQhjnRowzmX4smQa
 1hpQ==
X-Gm-Message-State: ACgBeo0XZdjMNLC6kMlNYL2gEMUD+qvHEEqW5BPs+sKM9TOfUVz3jxpQ
 ofYx9nIDJBmmKUu9Gr6HOB/BZusM7fmWgA==
X-Google-Smtp-Source: AA6agR6Vq9eXXOUOOeS9Qz2Vf/LCOcl76lyRNL3YR2TqdLE4UguDylQ20PAe0UipRqmVO8MPbPIbDQ==
X-Received: by 2002:a05:6870:3486:b0:10e:62b:159a with SMTP id
 n6-20020a056870348600b0010e062b159amr3525770oah.254.1660902475761; 
 Fri, 19 Aug 2022 02:47:55 -0700 (PDT)
Received: from balboa.ibmmodules.com ([189.110.115.28])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a4ad845000000b0044b06d0eae7sm228112oov.33.2022.08.19.02.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 02:47:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v2 1/2] ppc/pnv: consolidate pnv_parent_*_fixup()
 helpers
Date: Fri, 19 Aug 2022 06:47:47 -0300
Message-Id: <20220819094748.400578-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819094748.400578-1-danielhb413@gmail.com>
References: <20220819094748.400578-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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


