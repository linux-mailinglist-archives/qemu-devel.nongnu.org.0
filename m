Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765BC48AF25
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 15:08:07 +0100 (CET)
Received: from localhost ([::1]:33860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Hoj-0003tm-3U
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 09:08:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7GvS-0003nO-KX; Tue, 11 Jan 2022 08:11:03 -0500
Received: from [2607:f8b0:4864:20::929] (port=40890
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n7GvO-0007Qa-4I; Tue, 11 Jan 2022 08:10:58 -0500
Received: by mail-ua1-x929.google.com with SMTP id v12so29560056uar.7;
 Tue, 11 Jan 2022 05:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mL32hyhTes7jx530XhjuJGDdDmqvwezifm77V28qMko=;
 b=FiYQtj9y+rUr16Qhxdj6Y7w8EtDY34s1uwX7QjbjtIAfan3Wy2AVoEVry1lMVk5Epo
 offz+nQv/cidQdoFqWc6HHMpq/DXZbX4+GLnsHhrUed4KStKB4cuu5F4TkcnYV1jH/C0
 YVxEDYLkseRwB2qEVslKkGSnZ6+n5S7H/YkVQ2luFnruAsrB7s/amzcBSdOVmeI7dOOQ
 cINXhqp/V3VvYbb85QaQn76E5JW/1vYjtyHc1whZHF5oyz9wAtRQI3jJ3cLSk5EyLc4t
 3ndzbR8KuFazFeDD8Qka4LuUh4/F1/AFxIVG8dVIuNoHa1o8BUSmLqKf18pb8A0OHI0g
 WHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mL32hyhTes7jx530XhjuJGDdDmqvwezifm77V28qMko=;
 b=NbP+WwokLAywd4mS7eBCCZYwcvY284T50hch8FdJbBHycxQfLpehKIDIXGQkXkvXVT
 t+CaZvDvqCnhYro0sEWPmva4KQO57ly0zZrQHaD9MLQyOyH0PHZ+ZgLH1d7m7Gk6/01T
 6046/kVxdt+8T3MtEMCrGJOeZwqR9OQavX4mjqJOW35yE2MgVS7spgTVJmeEZDqvkrxt
 UVOGdkefKaNAJD2EFCtp7Buav/8YyLe1Afe9o1wJipZpK9G0S+F2sWEnZWkFQx+whklW
 XsK9YdSEbu56tRoG1e/isKk1i3GyyIkVqdOym5qu/fbDoeC+tAXBkbZepNJt/ypmpJ1g
 HDHQ==
X-Gm-Message-State: AOAM531GwnUnNK6LyF74LWLWIe56dVW1SGtc5rbOoYzE8KfGfR41G2DT
 QkMreliSoTS44j6hYYB6mJaeVzge7V7E/MTZ
X-Google-Smtp-Source: ABdhPJwE1HjVEfpuj6ca43Ieey+IUD6+LctCFjCm0lHQzFpgkLRIMSW9xiTQ+G1vJv5U1uKEujxxeA==
X-Received: by 2002:a05:6102:cca:: with SMTP id
 g10mr1829347vst.75.1641906637576; 
 Tue, 11 Jan 2022 05:10:37 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id f1sm5386381uae.5.2022.01.11.05.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 05:10:37 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/5] ppc/pnv: set phb4 properties in stk_realize()
Date: Tue, 11 Jan 2022 10:10:23 -0300
Message-Id: <20220111131027.599784-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111131027.599784-1-danielhb413@gmail.com>
References: <20220111131027.599784-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
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

Moving all phb4 properties setup to stk_realize() keeps this logic in
a single place instead of having it scattered between stk_realize() and
pec_realize().

'phb->index' can be retrieved using stack->stack_no and
pnv_phb4_pec_get_phb_id(), deprecating the use of 'phb-id' alias that
was being used for this purpose in pec_realize().

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index d64310e7db..f8038dff17 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -392,10 +392,8 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
         Object *stk_obj = OBJECT(stack);
-        int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
 
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
-        object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
         if (!qdev_realize(DEVICE(stk_obj), NULL, errp)) {
             return;
@@ -534,7 +532,6 @@ static void pnv_pec_stk_instance_init(Object *obj)
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(obj);
 
     object_initialize_child(obj, "phb", &stack->phb, TYPE_PNV_PHB4);
-    object_property_add_alias(obj, "phb-id", OBJECT(&stack->phb), "index");
 }
 
 static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
@@ -543,6 +540,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     PnvPhb4PecState *pec = stack->pec;
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
     PnvChip *chip = pec->chip;
+    int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
     uint32_t pec_nest_base;
     uint32_t pec_pci_base;
     char name[64];
@@ -570,6 +568,8 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
 
     object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id,
                             &error_fatal);
+    object_property_set_int(OBJECT(&stack->phb), "index", phb_id,
+                            &error_fatal);
     object_property_set_int(OBJECT(&stack->phb), "version", pecc->version,
                             &error_fatal);
     object_property_set_link(OBJECT(&stack->phb), "stack", OBJECT(stack),
-- 
2.33.1


