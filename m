Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE3B480CE2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:56:14 +0100 (CET)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IZx-0003lD-FM
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:56:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJ3-0003pc-N5; Tue, 28 Dec 2021 14:38:51 -0500
Received: from [2607:f8b0:4864:20::731] (port=41817
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIz-00046I-VO; Tue, 28 Dec 2021 14:38:44 -0500
Received: by mail-qk1-x731.google.com with SMTP id m2so16410818qkd.8;
 Tue, 28 Dec 2021 11:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GjKRBmPEKhn1TcAQb/t7oYLA8tdf6AgYCnXFZrqJgiA=;
 b=cxSof2AnYWdtJDRrd4TqJuW0yb1/z01CBriABVJq/B/wIv01cA6be61YJTSd8DQJjb
 o/NFpdnew0sso38ZnegLKbhI1PrTe6SYfix50iN0sojAYzAVyaVG4N6hmkxQbYXIPrSo
 HA2K7kL8121CHLDZMkFVbwrtkt/yRjRxwdzB0l9cWg80vbz1AqwMK3aXFIv6abCOoQa+
 TjMKGRdv9wag5TvA7tter+p9a47wajurmoVlTIBYlY4fBQYh4Jildfj/7Xp4ECI/enZw
 zHgnuq8nIpf5xKSk5riuh+ybYgU306Z5ur1xG7cfP3yUgZfZOdBw+++H4Rt/JB3r5/Hz
 SRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GjKRBmPEKhn1TcAQb/t7oYLA8tdf6AgYCnXFZrqJgiA=;
 b=KwXPoNeK3yUY1EsUmNzmXWZwyO2oGgc/SahrMaAl2UtCyAHPBclZd0+wPASTvezabH
 oqbFLW/ArntGmk5jaTeyeuNJUtkEjQdpmElzf6RJvTujYB7F49D2JhNJ68Ja3uGUzTzw
 PP+2gOgPo4wmOgYmxGZCXj7EejBaC3eR/yO90vxiwqJqxqJilncwuGsTW3U7UyCrltyk
 vBCLcz+IyP2zSZNbZ9TBxXY7YxpgvC9AC4xyNLSsXY6kkDkqic5/w0rZaWDnwyV2ZD97
 IO7lhvVAW9OV1teR9T5Iom8w/X28ngc5xT89X72JK+zHkPdsS4ngVd80GqqUZ4LPZgRA
 c9Pw==
X-Gm-Message-State: AOAM533GXMo4z5V7IKDQPHjXQjZ5kCyXDpNix+ebI1TrLCpjNk8CVoJF
 K4CIP2+q10kDmN+DcsPtyfTk4WwdbmA=
X-Google-Smtp-Source: ABdhPJwSeQbesm3BZQROdcIJnQGWAfxYvAy5BpEUG7uChj62/JGO5QnwrDKEEpeU7xedCqXW8905hA==
X-Received: by 2002:a05:620a:2f9:: with SMTP id
 a25mr16496939qko.498.1640720320188; 
 Tue, 28 Dec 2021 11:38:40 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:40 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/17] pnv_phb4_pec.c: use 'default_enabled()' to init
 stack->phb
Date: Tue, 28 Dec 2021 16:38:01 -0300
Message-Id: <20211228193806.1198496-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The next step before enabling user creatable pnv-phb4 devices is to
decople the init of the stack->phb object from
pnv_pec_stk_instance_init().

First, use 'defaults_enabled()' inside pnv_pec_realize() to create the
stack->phb object, while removing the equivalent object_initiate_child()
call from stk_instance_init(). Create a new "phb" stack property link so
we can assign stack->phb in an idiomatic manner.

Then we need to handle stack->phb->index assignment. The value is
retrieved with pnv_pec_get_phd_id() and, until this patch, this was
being assigned to a 'phb-id' stack link to phb->index. It is simpler to
assign this directly given that now we need to interact with the PnvPHB4
object directly to set its other attributes. Assign phb->index directly
with the value of pnv_pec_get_phb_id(), and remove the now unused link.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 56ffd446ab..031e98f1f4 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -19,6 +19,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/ppc/pnv.h"
 #include "hw/qdev-properties.h"
+#include "sysemu/sysemu.h"
 
 #include <libfdt.h>
 
@@ -409,11 +410,29 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
         Object *stk_obj = OBJECT(stack);
-        int phb_id =  pnv_pec_get_phb_id(pec, i);
 
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
-        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
+
+        /* Create and realize the default stack->phb */
+        if (defaults_enabled()) {
+            PnvPHB4 *phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
+            int phb_id =  pnv_pec_get_phb_id(pec, i);
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
@@ -549,10 +568,6 @@ static const TypeInfo pnv_pec_type_info = {
 
 static void pnv_pec_stk_instance_init(Object *obj)
 {
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
-
-    object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
-    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");
 }
 
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
@@ -589,6 +604,8 @@ static Property pnv_pec_stk_properties[] = {
         DEFINE_PROP_UINT32("stack-no", PnvPhb4PecStack, stack_no, 0),
         DEFINE_PROP_LINK("pec", PnvPhb4PecStack, pec, TYPE_PNV_PHB4_PEC,
                          PnvPhb4PecState *),
+        DEFINE_PROP_LINK("phb", PnvPhb4PecStack, phb, TYPE_PNV_PHB4,
+                         PnvPHB4 *),
         DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.33.1


