Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA5248EFA9
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:10:27 +0100 (CET)
Received: from localhost ([::1]:36924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8R1s-00005p-6W
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:10:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzF-0005gI-7g; Fri, 14 Jan 2022 13:07:41 -0500
Received: from [2607:f8b0:4864:20::c34] (port=35730
 helo=mail-oo1-xc34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzD-0000Oi-Hx; Fri, 14 Jan 2022 13:07:40 -0500
Received: by mail-oo1-xc34.google.com with SMTP id
 q15-20020a4a6c0f000000b002dc415427d3so2785626ooc.2; 
 Fri, 14 Jan 2022 10:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qSLl+cOxpZwCNfrBCEshtGdu1AAwLTRzg6xsRSIPD+k=;
 b=nui1qTQ0c+3JvoXW3BvvrnprwaFU4ueVqPfLKqRoCbbDOE+Hv+fM/xemueukL7JrjB
 4Us+hYiZSdr/tW/Epf7sCOZ3sGKH9JRwfjKJMNEok6Mx41oWzU26ADZNy8tZmfVH4+BJ
 csvWhO/nTIbjAzfwWiUKOgGfEEwy3q7EtzObJb0aDzBEbMl0K8l3QVQxUuOJoJC0DMhc
 /AsGn5NdnHTAcbFzWlAOIKcas6kq+fDCFl/ydrBsZ0jCqp93hpzmfnrYWDfz5CLcCYPL
 XxSSo1BlgGTPzziOrj1uXUrSQ6bqvghHBLyOwcD5CzTr07uZzRNzvhU+zHzMxdiRLBbw
 XMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qSLl+cOxpZwCNfrBCEshtGdu1AAwLTRzg6xsRSIPD+k=;
 b=TNtHFb92xFZ64nXdEWDeuzfQPj77SMmYDmMXoGec1/cmU/pMhdObrr50iJK3eeQ6Rn
 3A5Cg4dhDbxra78xTCxkUVKN2zQyc/4AdaCRUDpKax90wQKrS9jzLa3zrGDIEtjnW71x
 7fJLwLYkTWTD+K5ow1xwaZPdCBE2TFhPH+VoNdWPRn6dL8JiSyMJ8KE+/uqWE0AbWqax
 HGNLtNDJ33qHUKAfI4PE7f/foBzRJwM8GDb4ie2rzH4zva9gKqZjLiccPjsSkavs3xy3
 KxIuC+En3pvvnig7SIogh+HKu5IkFKknm8VFZQCZNbKj9yH2Jo56KFbV3n+Qg7uaHNiQ
 iinQ==
X-Gm-Message-State: AOAM532O6u9CKqFMMYJXSOszHOA2y+SBqteb8EbcT2oYYIvEbtdPmnFi
 4INOSuMyv7v1Aa/WaMoZD9ZMnL8jBWSxDkBl
X-Google-Smtp-Source: ABdhPJycENJsrO28Ewh77z9NIEMAfT4jTtMx2kNpPfHKrisdJ4ZUf6FBMAMh2Wt1BdgPhH1JjTeGkg==
X-Received: by 2002:a4a:b2c3:: with SMTP id l3mr7349502ooo.58.1642183657172;
 Fri, 14 Jan 2022 10:07:37 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id e17sm1353584otr.13.2022.01.14.10.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:07:36 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] ppc/pnv: move default_phb_realize() to pec_realize()
Date: Fri, 14 Jan 2022 15:07:15 -0300
Message-Id: <20220114180719.52117-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220114180719.52117-1-danielhb413@gmail.com>
References: <20220114180719.52117-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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

Move the current pnv_pec_stk_default_phb_realize() call to
pec_realize(), renaming the function to pnv_pec_default_phb_realize(),
and set the PHB attributes using the PEC object directly.

This will be important to allow for PECs devices to handle PHB4s
directly later on.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 63 ++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 30 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index ed1d644182..a80a21db77 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -112,6 +112,30 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
+static void pnv_pec_default_phb_realize(PnvPhb4PecStack *stack,
+                                        int stack_no,
+                                        Error **errp)
+{
+    PnvPhb4PecState *pec = stack->pec;
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    int phb_id = pnv_phb4_pec_get_phb_id(pec, stack_no);
+
+    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
+
+    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
+                             &error_abort);
+    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
+                            &error_fatal);
+    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
+                            &error_fatal);
+    object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
+                            &error_fatal);
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
+        return;
+    }
+}
+
 static void pnv_pec_instance_init(Object *obj)
 {
     PnvPhb4PecState *pec = PNV_PHB4_PEC(obj);
@@ -144,6 +168,15 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
 
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
+
+        if (defaults_enabled()) {
+            pnv_pec_default_phb_realize(stack, i, errp);
+        }
+
+        /*
+         * qdev gets angry if we don't realize 'stack' here, even
+         * if stk_realize() is now empty.
+         */
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
         }
@@ -276,38 +309,8 @@ static const TypeInfo pnv_pec_type_info = {
     }
 };
 
-static void pnv_pec_stk_default_phb_realize(PnvPhb4PecStack *stack,
-                                            Error **errp)
-{
-    PnvPhb4PecState *pec = stack->pec;
-    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
-    int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
-
-    stack->phb = PNV_PHB4(qdev_new(TYPE_PNV_PHB4));
-
-    object_property_set_link(OBJECT(stack->phb), "pec", OBJECT(pec),
-                             &error_abort);
-    object_property_set_int(OBJECT(stack->phb), "chip-id", pec->chip_id,
-                            &error_fatal);
-    object_property_set_int(OBJECT(stack->phb), "index", phb_id,
-                            &error_fatal);
-    object_property_set_int(OBJECT(stack->phb), "version", pecc->version,
-                            &error_fatal);
-
-    if (!sysbus_realize(SYS_BUS_DEVICE(stack->phb), errp)) {
-        return;
-    }
-}
-
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
 {
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
-
-    if (!defaults_enabled()) {
-        return;
-    }
-
-    pnv_pec_stk_default_phb_realize(stack, errp);
 }
 
 static Property pnv_pec_stk_properties[] = {
-- 
2.33.1


