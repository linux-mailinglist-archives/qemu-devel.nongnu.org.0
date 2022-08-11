Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACBE590518
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 18:51:35 +0200 (CEST)
Received: from localhost ([::1]:52444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBPC-0008Jd-HR
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 12:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBEG-0001XY-Gu; Thu, 11 Aug 2022 12:40:17 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:34508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oMBEB-0003iC-PW; Thu, 11 Aug 2022 12:40:14 -0400
Received: by mail-vk1-xa32.google.com with SMTP id b81so9225264vkf.1;
 Thu, 11 Aug 2022 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yHJHsxThJwV6Sv+iNGTxmAa9ZzuAIH4xwH/q+ac6rVI=;
 b=GrFen6rFv7IgXzC0sv9r9GSOVeOasfN7FrvhVfk5vF/c7WHjLTrl3RQVyz/Nbo3HuP
 dfL0eFmT1JM70VKCOvUE6KPigZMEqzQe9B2bMm7wuKCTti6sRah0QYLHd6kIm7tCcPWy
 OCRTUZ1iETPm854qpVdgtQHBTnywEZ0BfjSEZUBeSaq0TmhCi4niy3n6Kt/Cpc/vE1TJ
 zWkyAMt844RnnJ8Fg7LTUAzea3GrHZ7EYDC8JCDRGeMPe3P7g8pd2gQxGFnVIfOlCMVq
 xmgBeVnJA8yK83dFOtqyt/3DnT5fTxS3r04QqqL7FBZ70Ox3H91bSgu3nG5lhySjoIYm
 sT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yHJHsxThJwV6Sv+iNGTxmAa9ZzuAIH4xwH/q+ac6rVI=;
 b=ripcgEnCqouO3oxVL46PC55az7zjesn11ZP95/yNcFPlm2DhVcqqgYqxY327BLZg9s
 fpkFQ87ZDUct8h9eXuaCWDTdTWKvNGGmb3YszAhkJ4Q4VstHMZmHmYLT3j720zcRdjCp
 UKavF/kzIXduedpzTx4Bk0nydaSpgHsn77a0yGUhp1e/s32kdgvFfZAiPsCzNedu5NMv
 z3V/Y5wWlHaBJu0nDxR77JY5FjqM68WXaMSDoEG58r9sGmPmvrt60nAmNiCb5zJ+vH6a
 VsacoClq+72Uqn8/RFI5uWC7UqSGkIFmDvRkPSw6zQQFsyguMVGd5hTWteOVn2UvkN+J
 C5eA==
X-Gm-Message-State: ACgBeo1+dKnRE8qkOnAgHt68Y5U+XNDG0V8amgS4KGIBpYP+MQD317Q2
 fLQpLzSVJGFG+O9D4NKWg0SqWRHJ9qo=
X-Google-Smtp-Source: AA6agR6kLYsJidtSzTsvRZxdAgwww/IzOjRwgsfoEizebJ8GnvSdy7UhwQFkO6J0sPLeAb/oCQ8erg==
X-Received: by 2002:a1f:a7c4:0:b0:375:52b4:8249 with SMTP id
 q187-20020a1fa7c4000000b0037552b48249mr14367527vke.31.1660236010078; 
 Thu, 11 Aug 2022 09:40:10 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 j9-20020a67fa49000000b00373d697e3e2sm1755013vsq.19.2022.08.11.09.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:40:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 v4 07/11] ppc/pnv: add PHB4 helpers for user created
 pnv-phb
Date: Thu, 11 Aug 2022 13:39:46 -0300
Message-Id: <20220811163950.578927-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811163950.578927-1-danielhb413@gmail.com>
References: <20220811163950.578927-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa32.google.com
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

The PHB4 backend relies on a link with the corresponding PEC element.
This is trivial to do during machine_init() time for default devices,
but not so much for user created ones.

pnv_phb4_get_pec() is a small variation of the function that was
reverted by commit 9c10d86fee "ppc/pnv: Remove user-created PHB{3,4,5}
devices". We'll use it to determine the appropriate PEC for a given user
created pnv-phb that uses a PHB4 backend.

This is done during realize() time, in pnv_phb_user_device_init().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index e82d6522f0..0644f45a1d 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -281,6 +281,34 @@ static void pnv_dt_icp(PnvChip *chip, void *fdt, uint32_t pir,
     g_free(reg);
 }
 
+static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB4 *phb,
+                                         Error **errp)
+{
+    Pnv9Chip *chip9 = PNV9_CHIP(chip);
+    int chip_id = phb->chip_id;
+    int index = phb->phb_id;
+    int i, j;
+
+    for (i = 0; i < chip->num_pecs; i++) {
+        /*
+         * For each PEC, check the amount of phbs it supports
+         * and see if the given phb4 index matches an index.
+         */
+        PnvPhb4PecState *pec = &chip9->pecs[i];
+
+        for (j = 0; j < pec->num_phbs; j++) {
+            if (index == pnv_phb4_pec_get_phb_id(pec, j)) {
+                return pec;
+            }
+        }
+    }
+    error_setg(errp,
+               "pnv-phb4 chip-id %d index %d didn't match any existing PEC",
+               chip_id, index);
+
+    return NULL;
+}
+
 /*
  * Adds a PnvPHB to the chip. Returns the parent obj of the
  * PHB which varies with each version (phb version 3 is parented
@@ -302,10 +330,11 @@ Object *pnv_chip_add_phb(PnvChip *chip, PnvPHB *phb, Error **errp)
         chip8->num_phbs++;
 
         return OBJECT(chip);
-    } else {
-        /* phb4 support will be added later */
-        return NULL;
     }
+
+    phb->pec = pnv_phb4_get_pec(chip, PNV_PHB4(phb->backend), errp);
+
+    return OBJECT(phb->pec);
 }
 
 static void pnv_chip_power8_dt_populate(PnvChip *chip, void *fdt)
-- 
2.36.1


