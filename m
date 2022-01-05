Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3179C485A9C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:29:52 +0100 (CET)
Received: from localhost ([::1]:35358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Dqx-0002Gn-9n
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:29:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dlh-0002Y4-S9; Wed, 05 Jan 2022 16:24:26 -0500
Received: from [2607:f8b0:4864:20::92e] (port=41764
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dlg-0007vr-5O; Wed, 05 Jan 2022 16:24:25 -0500
Received: by mail-ua1-x92e.google.com with SMTP id p37so822896uae.8;
 Wed, 05 Jan 2022 13:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/fcCoHayFBWwy0sLceY20zLZ7XRn7nlbBeVaF2p2vY=;
 b=Y9gY9rJ/joDkGoZLyzGul0LDTjjJVOszYPqNMCNhBjvHmwXdglkHwkVnhOXW4erBwa
 +xgc4j810jGlbwFkJDDLgqOXtUZmeIFfNTaJpsUl0YQjY5pwat2GHIkFQStXOABs/wAf
 Awflz4xwVKt2+8r6vdWeZPxyiZ93yp6E0yw7gFmvdhUBIl7zqmIKEKsjPTxHZNaoxtYd
 4fc0BHy9ja37AfNIlpPzO1dIBmUs/wU3RLb60HIJXc6qSCrkNF1W26fybURMH1b1YWPx
 BRxwLzGIxcO7VmYkTwz+W/5QmKJDCpL0T2HSNffCXc/aBewguHYTl3qzn9xBGsQaxkwm
 QdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/fcCoHayFBWwy0sLceY20zLZ7XRn7nlbBeVaF2p2vY=;
 b=U2iJMn7kwcaK4bgXgmPHnXy9+5a+6RFwFvrE8Sei187N7wUajLTTWfskl5NjzhtDmj
 nqT14qYn801NVY0ZynqLlrQ2EaoE/bEGvDcN4iWvbWJoZ6+hFwIev5J18taekpYyKmf0
 qirrDs3tMZS7uKztkjgr5kj/vPx5YOsHo9YZiJwjOTXpaHuTt5LrTcRAYZNYa+Mbh1Vf
 mSx5ODLyZUPlDivEbL1V1b99p8HHSLEg+lnmpChQON85XxJTD4QEMM5wuPG9qtZUwKuZ
 gSUyh+HXZgpaZ9TNtyOiw6Z6N31ruYNtDAVH0vvSqkdjaQoBB3sh6c71TUWDH30eYRli
 Um1g==
X-Gm-Message-State: AOAM533mli8luFr+vQN3B32hfRtCCVlMtIiGwedZY06PSYQDx5KegwHM
 /jLAEIT+5EimuzVKJ6qnlSvVpL3UEiQ=
X-Google-Smtp-Source: ABdhPJys2xKo8Dtc+KD36BCpHKwMevpNmhA6FUOiAGNgoYckvnPD6/u8SepN+/WbuXQi4DcAdj73kA==
X-Received: by 2002:ab0:6f8a:: with SMTP id f10mr14105790uav.18.1641417863013; 
 Wed, 05 Jan 2022 13:24:23 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:22 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/18] pnv_phb4_pec.c: use 'default_enabled()' to init
 stack->phb
Date: Wed,  5 Jan 2022 18:23:35 -0300
Message-Id: <20220105212338.49899-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92e.google.com
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next step before enabling user creatable pnv-phb4 devices is to
decople the init of the stack->phb object from
pnv_pec_stk_instance_init().

First, use 'defaults_enabled()' inside pnv_pec_realize() to create the
stack->phb object, while removing the equivalent object_initiate_child()
call from stk_instance_init(). Create a new "phb" stack property link so
we can assign stack->phb in an idiomatic manner.

Then we need to handle stack->phb->index assignment. The value is
retrieved with pnv_phb4_pec_get_phd_id() and, until this patch, this was
being assigned to a 'phb-id' stack link to phb->index. It is simpler to
assign this directly given that now we need to interact with the PnvPHB4
object directly to set its other attributes. Assign phb->index directly
with the value of pnv_phb4_pec_get_phb_id(), and remove the now unused
link.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index be6eefdbb1..638691783b 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -19,6 +19,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/ppc/pnv.h"
 #include "hw/qdev-properties.h"
+#include "sysemu/sysemu.h"
 
 #include <libfdt.h>
 
@@ -392,11 +393,29 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
         Object *stk_obj = OBJECT(stack);
-        int phb_id =  pnv_phb4_pec_get_phb_id(pec, i);
 
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
-        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
+
+        /* Create and realize the default stack->phb */
+        if (defaults_enabled()) {
+            PnvPHB4 *phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
+            int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
+
+            object_property_set_int(OBJECT(phb), "index",
+                                    phb_id, &error_abort);
+            object_property_set_link(OBJECT(phb), "stack",
+                                     stk_obj, &error_abort);
+
+            pnv_phb4_set_stack_phb_props(stack, phb);
+            if (!sysbus_realize_and_unref(SYS_BUS_DEVICE(phb), errp)) {
+                return;
+            }
+
+            object_property_set_link(stk_obj, "phb", OBJECT(phb),
+                                     &error_abort);
+        }
+
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
         }
@@ -531,10 +550,6 @@ static const TypeInfo pnv_pec_type_info = {
 
 static void pnv_pec_stk_instance_init(Object *obj)
 {
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
-
-    object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
-    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");
 }
 
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
@@ -588,6 +603,8 @@ static Property pnv_pec_stk_properties[] = {
         DEFINE_PROP_UINT32("stack-no", PnvPhb4PecStack, stack_no, 0),
         DEFINE_PROP_LINK("pec", PnvPhb4PecStack, pec, TYPE_PNV_PHB4_PEC,
                          PnvPhb4PecState *),
+        DEFINE_PROP_LINK("phb", PnvPhb4PecStack, phb, TYPE_PNV_PHB4,
+                         PnvPHB4 *),
         DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.33.1


