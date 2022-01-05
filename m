Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE0E485ADE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:40:36 +0100 (CET)
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5E1J-0005SS-OK
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:40:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dlf-0002WR-Mo; Wed, 05 Jan 2022 16:24:24 -0500
Received: from [2607:f8b0:4864:20::935] (port=41770
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5Dle-0007vS-7d; Wed, 05 Jan 2022 16:24:23 -0500
Received: by mail-ua1-x935.google.com with SMTP id p37so822751uae.8;
 Wed, 05 Jan 2022 13:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KmyYqKayCDfuaYPl0j8gBuCk1z2d2eTcKTsmR4s9dIU=;
 b=a5vxxBAuifijk+xjQnRaL2QOlP6nxUk5wwagIOUenXEQNAFRTkt0VXdbSMeCZFWp4q
 EtdF8q5djs/xlVlpmS3SRlhMSYi9mIqNuq3e6ZW0Ok8RH8nwE9AZh3/YlSk1m60YgDAF
 6sNGpaGlNpAiO/peI8TgjSKHEpx4kjoxy8u74I63vY7amUB1boZekwskrvSZh1+b/fbe
 tBPNHFBEnUQOJ7CEJPi5RsBWAeGv/ZIWzP4zK228jTEbLw2A1w/MRN6b8xYoodXfHVon
 hiVxBilR6byEJE40x6QlCHF52BJO0Ymc99/DKgRnOIwYLoE767SWa35OYoa1aAy1IPrm
 sRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KmyYqKayCDfuaYPl0j8gBuCk1z2d2eTcKTsmR4s9dIU=;
 b=fdkN9F4CK8kUF5+Kl6vlJKPBkwqHJ0TuX5yozocUniygvObP5JMgAHzetTNbnIwVGT
 8pOiPjdwjg193Xo0PPMqljq/ZN2zdF9WBLqoAXM9jcfrL+39oPISOoIIDFymqn1qNF8N
 md4FmAcPlmnrnBpXB9hth8bZX/7FAinvTFkCfPVQL5sJERvo6pl7Dzf35zCEf7fr+POF
 +pPInELWi5BbKnoq8ljnzX4p7LqtzMvPfeIGcePLhgSwAaczvEy6GVIgosA8bLcJPPXR
 cTgHG6WMWuaGqZjvWKEdFn1Mai61tONhX43RaQ8PsNFIdSTxKBXZFyxZ+ocRoEIl8fho
 q74g==
X-Gm-Message-State: AOAM532iHmhuOTXj8kNFq4qJZmU8YSdYzQKfIQJ4U9jY9Q7kk+iTwuSA
 Vm0OBddwVswugIkfrtkxl8msFZrkr84=
X-Google-Smtp-Source: ABdhPJzJQUd6fw6ML4zeGq1ixcAq7qV38Tk5OtKeWl7+Ey/A47UV4hJyGj5HIeJgK1tIGKZ8u5m//w==
X-Received: by 2002:a05:6102:34f5:: with SMTP id
 bi21mr17465252vsb.1.1641417861017; 
 Wed, 05 Jan 2022 13:24:21 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:20 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/18] pnv_phb4.h: turn phb into a pointer in struct
 PnvPhb4PecStack
Date: Wed,  5 Jan 2022 18:23:34 -0300
Message-Id: <20220105212338.49899-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
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
index 4c785bbe4c..9e670e41d2 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1449,7 +1449,7 @@ type_init(pnv_phb4_register_types);
 
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack)
 {
-    PnvPHB4 *phb = &stack->phb;
+    PnvPHB4 *phb = stack->phb;
 
     /* Unmap first always */
     if (memory_region_is_mapped(&phb->mr_regs)) {
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 0675fc55bc..be6eefdbb1 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -563,7 +563,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
                           PHB4_PEC_PCI_STK_REGS_COUNT);
 
     /* PHB pass-through */
-    pnv_phb4_set_stack_phb_props(stack, &stack->phb);
+    pnv_phb4_set_stack_phb_props(stack, stack->phb);
     if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
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


