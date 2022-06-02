Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3BC53C144
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 01:11:48 +0200 (CEST)
Received: from localhost ([::1]:37938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtym-00016Y-45
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 19:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwslT-0002R0-KY; Thu, 02 Jun 2022 17:53:59 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:46731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nwslS-00016G-3b; Thu, 02 Jun 2022 17:53:59 -0400
Received: by mail-oi1-x22c.google.com with SMTP id m82so8165525oif.13;
 Thu, 02 Jun 2022 14:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wNVbmP1WhTFSB4clVhdWhdOjjlMZzI2jKr0q+Ao2Uwk=;
 b=LJXJo6Ypv1uuUiKDe9g5PLAUxcfspBAD6fCZrtzzz3P06XhyJ8s5jPCoYjgbNL2fb5
 ppDi42r2tn3aPofID237R11aF5J7oE2nOFUn50032BEy0PixYdDg4b650zPZI534ARW9
 LHUCMnBc7wWNN/pLleZ6ENRLxcw4D2gwhAtyAJUgIUefkPjv34CKx3/brCf45yDWN8IK
 UHBgwRyW9mVbeMzY78x6lgrOuggxoPAsasNzKoe7GqzmR9WnuMMjfERiACPStSis1+S8
 9i8nsSxCUA7qlrt5gqnXKyrm0Fbg2e5bJRuFOn3+kmfxVWwWy0Exass8pkHYezXXRQM2
 DsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wNVbmP1WhTFSB4clVhdWhdOjjlMZzI2jKr0q+Ao2Uwk=;
 b=uAG0KettqE9iGxfhP84sWaaXjqkz+5fK6jbU3i8E9MJFWQM0bFV5SCO2BHG3iGaQ7G
 yEYBUoTPCEVll2QS7CHIOHxaSCwE2lgqZLNse5qypCjX1Uzp8+YepqZkZzzeDzVrcXaI
 TzPfhKSTudjgtgNCyT5AnJxKkU5rVBFenMpbBoBwm/NGDnQxbmz78SRYzU5qhf0CFkSL
 LkkJa5cA2YRjevjq77UnIU3c15IzWB7L9rYJ6HrL4mYyb8faya8DY/llyTDcVc/QVxeM
 hKu2ohdYyRVRc7nUSGLlt3EIY9E79zXdmIKKrs8MnHaBgD5us6aqDQx8NjYDF5yn5yEB
 yEuQ==
X-Gm-Message-State: AOAM530r0K4CiCZgF807qS0t6FQNqvXSfSCIyrmH/LPwYzNPVPVz22xu
 ZagPQLsQ+QvPec1oVe2ShrwDdegp1fa+Rw==
X-Google-Smtp-Source: ABdhPJxRvD3itDt+SO+PMNt25uRVYcRmkZe4fTpD6W9sSyslSf4VGldlN6AUBgD8RrBMTglT5Uctcw==
X-Received: by 2002:a05:6808:2206:b0:32b:5303:442f with SMTP id
 bd6-20020a056808220600b0032b5303442fmr19588988oib.23.1654206836495; 
 Thu, 02 Jun 2022 14:53:56 -0700 (PDT)
Received: from balboa.ibmuc.com ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a056820039300b00333220959b9sm2774884ooj.1.2022.06.02.14.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:53:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH] ppc/pnv: fix extra indent spaces with DEFINE_PROP*
Date: Thu,  2 Jun 2022 18:53:51 -0300
Message-Id: <20220602215351.149910-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
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

The DEFINE_PROP* macros in pnv files are using extra spaces for no good
reason.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c     |  8 ++++----
 hw/pci-host/pnv_phb4.c     | 10 +++++-----
 hw/pci-host/pnv_phb4_pec.c | 10 +++++-----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 3f03467dde..26ac9b7123 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1088,10 +1088,10 @@ static const char *pnv_phb3_root_bus_path(PCIHostState *host_bridge,
 }
 
 static Property pnv_phb3_properties[] = {
-        DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
-        DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
-        DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
-        DEFINE_PROP_END_OF_LIST(),
+    DEFINE_PROP_UINT32("index", PnvPHB3, phb_id, 0),
+    DEFINE_PROP_UINT32("chip-id", PnvPHB3, chip_id, 0),
+    DEFINE_PROP_LINK("chip", PnvPHB3, chip, TYPE_PNV_CHIP, PnvChip *),
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void pnv_phb3_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 13ba9e45d8..6594016121 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1692,11 +1692,11 @@ static void pnv_phb4_xive_notify(XiveNotifier *xf, uint32_t srcno,
 }
 
 static Property pnv_phb4_properties[] = {
-        DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
-        DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
-        DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
-                         PnvPhb4PecState *),
-        DEFINE_PROP_END_OF_LIST(),
+    DEFINE_PROP_UINT32("index", PnvPHB4, phb_id, 0),
+    DEFINE_PROP_UINT32("chip-id", PnvPHB4, chip_id, 0),
+    DEFINE_PROP_LINK("pec", PnvPHB4, pec, TYPE_PNV_PHB4_PEC,
+                     PnvPhb4PecState *),
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static void pnv_phb4_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 61bc0b503e..8b7e823fa5 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -215,11 +215,11 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
 }
 
 static Property pnv_pec_properties[] = {
-        DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
-        DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
-        DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
-                         PnvChip *),
-        DEFINE_PROP_END_OF_LIST(),
+    DEFINE_PROP_UINT32("index", PnvPhb4PecState, index, 0),
+    DEFINE_PROP_UINT32("chip-id", PnvPhb4PecState, chip_id, 0),
+    DEFINE_PROP_LINK("chip", PnvPhb4PecState, chip, TYPE_PNV_CHIP,
+                     PnvChip *),
+    DEFINE_PROP_END_OF_LIST(),
 };
 
 static uint32_t pnv_pec_xscom_pci_base(PnvPhb4PecState *pec)
-- 
2.36.1


