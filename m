Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F882590519
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:52:04 +0200 (CEST)
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBPf-0000n4-Ol
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBEJ-0001Xt-Ah; Thu, 11 Aug 2022 12:40:21 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:36635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBEG-0003ic-KO; Thu, 11 Aug 2022 12:40:18 -0400
Received: by mail-vk1-xa36.google.com with SMTP id x128so6182235vke.3;
 Thu, 11 Aug 2022 09:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BfZMAEw8CxnggpIovNw/1aV7gBAighNHrEPUCh8dDCc=;
 b=M6tgeut7hNcPtde/0fL1hrdTiNuKXM4LT9KkkAUrLNt6otKMnxyJk4roLmRAhezda8
 K7xILszICLEsbrxJWaRAG8++Vv6Pf9ywS2CbXz3RF1a4ij8hgsmpXaH3NWSuEHoW+h8H
 sl1wZibIFnkYmgzrbjcK3B2N5pVUACS+PVI/UMe7oYei1Dj5jjxRzqnKc22XVGTI5xDO
 Ho6UzZZvEpTxzNYSZE1WKacQR8Go1sHRjwj2P8nwNraJGQG7fMeDOl9auvDHsf3Hwg8x
 X2RfvpD/BcjgF5sSToHFrTdO0qZ15u0c3/L6UHxG1Sb0w76jlEKdn/coJ9R8ZR6tGOSc
 61GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BfZMAEw8CxnggpIovNw/1aV7gBAighNHrEPUCh8dDCc=;
 b=iIhLGXnwMs+UiDJa0VY9k2vfg+HEnWbtDXogmlJuJLz5k2KeSGQXhyz99AHrialFQl
 bWqSOPaiVMXET8FWoZF/gR55F//aZvxrcAEPZgXITDFxek6cUcLs/7f2T7OhpEbe9qoJ
 g1763VWjSugxSZ8YjFKrOxVbk8HNaob++tC5AgUkGS8HvOnxbSqvPKRG+fl2JNTBm/TR
 hmQAXgubDg9Xt+3Mz4PPqlK+VjgH/y6IOlUMlo9E7ZiA13ZkL/lV/IUt8r1V3w2oBnPZ
 Eug8UHswQC1n1sJSJR2qz5n2dHmyu13kDu8GhNJjBj/u9kJ58KY3ZrkPAW1r/g+v0hyD
 jCwA==
X-Gm-Message-State: ACgBeo3TukYGVEAJfG0pRYlF66bVqR8L5uD8GOYo8tw+fSoyPxtwOmUQ
 0RDSZuVS19Zmn+30LtWNcfS0ltUE2P4=
X-Google-Smtp-Source: AA6agR7tJhu6pW3Sgsju3oE/hTosmj3mjFUN0VXDQH0potRDoDy8EJKsif5HampAPH5Aoe+XvV+5Kw==
X-Received: by 2002:a1f:3206:0:b0:377:d5aa:620f with SMTP id
 y6-20020a1f3206000000b00377d5aa620fmr14351483vky.38.1660236014401; 
 Thu, 11 Aug 2022 09:40:14 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:40:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 09/11] ppc/pnv: change pnv_phb4_get_pec() to also
 retrieve chip10->pecs
Date: Thu, 11 Aug 2022 13:39:48 -0300
Message-Id: <20220811163950.578927-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811163950.578927-1-danielhb413@gmail.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa36.google.com
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

The function assumes that we're always dealing with a PNV9_CHIP()
object. This is not the case when the pnv-phb device belongs to a
powernv10 machine.

Change pnv_phb4_get_pec() to be able to work with PNV10_CHIP() if
necessary.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index ec0558ed1c..e6c14fe231 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -284,17 +284,30 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
 static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
                                          Error **errp)
 {
-    Pnv9Chip *chip9 = PNV9_CHIP(chip);
+    PnvPHB *phb_base = phb->phb_base;
+    PnvPhb4PecState *pecs = NULL;
     int chip_id = phb->chip_id;
     int index = phb->phb_id;
     int i, j;
 
+    if (phb_base->version == 4) {
+        Pnv9Chip *chip9 = PNV9_CHIP(chip);
+
+        pecs = chip9->pecs;
+    } else if (phb_base->version == 5) {
+        Pnv10Chip *chip10 = PNV10_CHIP(chip);
+
+        pecs = chip10->pecs;
+    } else {
+        g_assert_not_reached();
+    }
+
     for (i = 0; i < chip->num_pecs; i++) {
         /*
          * For each PEC, check the amount of phbs it supports
          * and see if the given phb4 index matches an index.
          */
-        PnvPhb4PecState *pec = &chip9->pecs[i];
+        PnvPhb4PecState *pec = &pecs[i];
 
         for (j = 0; j < pec->num_phbs; j++) {
             if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
-- 
2.36.1


