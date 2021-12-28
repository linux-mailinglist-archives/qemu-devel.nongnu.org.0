Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72313480CE1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:54:44 +0100 (CET)
Received: from localhost ([::1]:37452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IYV-0000sW-JW
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:54:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJ5-0003pp-Aw; Tue, 28 Dec 2021 14:38:51 -0500
Received: from [2607:f8b0:4864:20::f31] (port=46018
 helo=mail-qv1-xf31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IJ3-00046U-Es; Tue, 28 Dec 2021 14:38:46 -0500
Received: by mail-qv1-xf31.google.com with SMTP id a9so17271494qvd.12;
 Tue, 28 Dec 2021 11:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BwiPurepIdu2ui5Uj2Sm66gn0qyrXmboe6qAgQoXMj8=;
 b=h3oixMnsKdB33OXF4OvHTHkWwZY+E0F3xbi0B4weX5mjExC+DwFLXzkPe8kiMk+o+Z
 N68wssGrjUnQ+EB2huWzlaK1I+iTk1EPw1Tbzu1LlHd4i7j3o74LITJb+6sHL8LU118V
 zobFvNf0blO+mO3BuwWLMGm4gj17zW+Vcj1cn6DqEYBJt/E3IwicTKJr7Mb1CM8x3DBg
 GMjU6z/WT2UewdR82SGIwNlzfkHwmTvI5KZmpe3MaLWMQrCV9ZLji3F+ilk6A9ilBEP6
 dQQ3mOyFcW9//RWryaXeFClSwgDRx2ubDQmkE5BqgJoBWCoWOnv1AS3XOdRNf13jNIYq
 3LkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BwiPurepIdu2ui5Uj2Sm66gn0qyrXmboe6qAgQoXMj8=;
 b=5RdVxfPYsv+g0/6FGRTTnThKGloac6R5egyo4O7zOMLDcPNrW//JpcTpd/SkFKeOSN
 gxwV+6felUsZ3sYLW4iXFJj5/IWFom/wfLja4Hvz/SXt/pwGFgUANxa6s2ycYJ4drRMm
 sDJScdLrTbXP8NBRtR8v3MJcmqWKX+NvkB+HDGUKa/jZbKQBSYceaoGOUpniuzR/pi6U
 qYKgMFM047S8gZdZyE6aGsmoz+eQOTT9Y5D2ovxONE6rs8n93L0J+rDdUC+DZlfOXE3b
 Y5h/+E7yDYupgwWyFdbaA9cDKsqrpKCgGGia+wMtroNx1q/6IBVN7x4okbZNySc3ZJKC
 QE4A==
X-Gm-Message-State: AOAM53036z+z5jI6g1Onts8S2WEqNUQvnSQhVSEN2LdBgmJ3ap4mnDiV
 p+QAv+EiEDZtgll9nNviQfU8UDFN6kI=
X-Google-Smtp-Source: ABdhPJzsjtRbPlK546gQM7jo+pEVhGKmu4qx/fUa4rHp9A2RGO36dOSPhbZhAo9M8SKecmONDvXD1g==
X-Received: by 2002:a05:6214:f23:: with SMTP id
 iw3mr7319611qvb.83.1640720322326; 
 Tue, 28 Dec 2021 11:38:42 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:42 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/17] pnv_phb4.h: turn phb into a pointer in struct
 PnvPhb4PecStack
Date: Tue, 28 Dec 2021 16:38:02 -0300
Message-Id: <20211228193806.1198496-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf31.google.com
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
 hw/pci-host/pnv_phb4.c         | 2 +-
 hw/pci-host/pnv_phb4_pec.c     | 2 +-
 include/hw/pci-host/pnv_phb4.h | 7 +++++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 31284e0460..5b2f644662 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1564,7 +1564,7 @@ type_init(pnv_phb4_register_types);
 
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
 {
-    PnvPHB4 *phb = &stack->phb;
+    PnvPHB4 *phb = stack->phb;
 
     /* Unmap first always */
     if (memory_region_is_mapped(&phb->mr_regs)) {
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 031e98f1f4..3797696e8f 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -592,7 +592,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
     /* PHB pass-through */
-    pnv_phb4_set_stack_phb_props(stack, &stack->phb);
+    pnv_phb4_set_stack_phb_props(stack, stack->phb);
     if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
         return;
     }
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 0f6c81c9cb..d67e33924b 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -181,8 +181,11 @@ struct PnvPhb4PecStack {
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


