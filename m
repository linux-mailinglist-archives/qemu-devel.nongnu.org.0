Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF96485AC7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:35:40 +0100 (CET)
Received: from localhost ([::1]:50928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DwZ-0004t7-SV
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:35:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlW-00023W-L8; Wed, 05 Jan 2022 16:24:14 -0500
Received: from [2607:f8b0:4864:20::930] (port=39935
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlT-0007tj-Sx; Wed, 05 Jan 2022 16:24:14 -0500
Received: by mail-ua1-x930.google.com with SMTP id b26so840669uap.6;
 Wed, 05 Jan 2022 13:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nwmfNg75tN83aXuM8PjYJWXZYqpjCAofX0A7t9E7AHk=;
 b=T+UM4v5EH07++VAWfkPKuyKRnVzaj9upoJhdl64nzQHRPzMV29Ey5u/AkD0HPx908/
 Ng6h3fq+RWxSxesG4DpOjM6ZJ3dI0df/bLhmH/wjv5NpAXDr0cN9X5l2pjskr9hiAG9T
 h9vaX9VCd3QyaPm9PchxQYh0Ac8gVrdzxvchtKf9QMBIZtN7Og6Zt+uKnc4f77vRvOVL
 4oCYluLwDa5Em/Ub2aQSM8/LBnXASO2Sb4AU/t20uVxpimcnixL8F6oR8Nri1eZuck98
 4xUAdZQe5opY4HMSmxMLWEwoSL8NEOEX09NSTECqyIxWCDLC1LByxwANGL5b5osUy5Am
 IIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nwmfNg75tN83aXuM8PjYJWXZYqpjCAofX0A7t9E7AHk=;
 b=R+QPQvwJutJM2mXifZj32ET9R7aq6KtNETYOTiaP1+24NA8M2olHJLcAvir8K+Qhz/
 huk0x4L42HffcijsKJkplkbRIzA03jfXnAxYY92lHfftqWJx+2uzNpDSl1Bv0A9sJK1W
 uGlCS7om8jKOORpoQUXq/rFUYlypMKe5Ks3EAhgDDRKwzoeEjaH/7yLrTR9f4kfr/ejk
 pcvOxTek6XxQvmR8PWUUGtScFY1zvOyFuha/5+cTxvJgZT4lBL5ck98JYQ088Sf1CwmE
 yv0MD7GCuzkvsuE65WS/oEPo7hpBWG2D8e9lOpXNPx9K+caFGIPXlfnKv02iqPSycaWc
 gr1g==
X-Gm-Message-State: AOAM533qYY0Or5cNnJp0iVaPrU4o3KGOWLsKKL77DERwsHIOVg/shbSW
 qHIJwQAPNFM6wsKvet5XxHR2/UZedDM=
X-Google-Smtp-Source: ABdhPJypQZu/MI6SZOZgYMXG5KwakL6gQq6yfXYDjae/9wwyEknQJc5YgGOllk+ty4wjkL18UNi3eg==
X-Received: by 2002:a67:e0c6:: with SMTP id m6mr17783521vsl.54.1641417850785; 
 Wed, 05 Jan 2022 13:24:10 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:10 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/18] ppc/pnv: Move num_phbs under Pnv8Chip
Date: Wed,  5 Jan 2022 18:23:29 -0300
Message-Id: <20220105212338.49899-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
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

From: Cédric Le Goater <clg@kaod.org>

It is not used elsewhere so that's where it belongs.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c         | 7 +++----
 include/hw/ppc/pnv.h | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 8dc6382357..fe7e67e73a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1099,7 +1099,6 @@ static void pnv_chip_power10_intc_print_info(PnvChip *chip, PowerPCCPU *cpu,
 
 static void pnv_chip_power8_instance_init(Object *obj)
 {
-    PnvChip *chip = PNV_CHIP(obj);
     Pnv8Chip *chip8 = PNV8_CHIP(obj);
     PnvChipClass *pcc = PNV_CHIP_GET_CLASS(obj);
     int i;
@@ -1118,10 +1117,10 @@ static void pnv_chip_power8_instance_init(Object *obj)
     object_initialize_child(obj, "homer", &chip8->homer, TYPE_PNV8_HOMER);
 
     if (defaults_enabled()) {
-        chip->num_phbs = pcc->num_phbs;
+        chip8->num_phbs = pcc->num_phbs;
     }
 
-    for (i = 0; i < chip->num_phbs; i++) {
+    for (i = 0; i < chip8->num_phbs; i++) {
         object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
     }
 
@@ -1247,7 +1246,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
                                 &chip8->homer.regs);
 
     /* PHB3 controllers */
-    for (i = 0; i < chip->num_phbs; i++) {
+    for (i = 0; i < chip8->num_phbs; i++) {
         PnvPHB3 *phb = &chip8->phbs[i];
 
         object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index f4219da7c5..0e9e16544f 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -52,7 +52,6 @@ struct PnvChip {
     uint64_t     cores_mask;
     PnvCore      **cores;
 
-    uint32_t     num_phbs;
     uint32_t     num_pecs;
 
     MemoryRegion xscom_mmio;
@@ -82,6 +81,7 @@ struct Pnv8Chip {
 
 #define PNV8_CHIP_PHB3_MAX 4
     PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
+    uint32_t     num_phbs;
 
     XICSFabric    *xics;
 };
@@ -136,8 +136,8 @@ struct PnvChipClass {
     /*< public >*/
     uint64_t     chip_cfam_id;
     uint64_t     cores_mask;
-    uint32_t     num_phbs;
     uint32_t     num_pecs;
+    uint32_t     num_phbs;
 
     DeviceRealize parent_realize;
 
-- 
2.33.1


