Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E915A86AE
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:22:51 +0200 (CEST)
Received: from localhost ([::1]:38864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTIY-0005Ic-Uo
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoc-0003M7-Ry; Wed, 31 Aug 2022 14:51:54 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:45898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSob-000843-69; Wed, 31 Aug 2022 14:51:54 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-11ba6e79dd1so26219691fac.12; 
 Wed, 31 Aug 2022 11:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3WUtwszn8AZ5W3kFllr5QINaJ1puUIQ/z/baIovAi2A=;
 b=nxBlW6N3geZAr+/Wf/fuP3OOhNEcw22ag056me3o5ZMHQrTVBfLPzBS/Xlqq4JiR5o
 8zhd9zvCs+YzPs8E/xp82Gdd+7f41emJIRU0fKV6gvmHsHdYNBzxa3eS54un6lwwPLLg
 /edBqETc+IZpNWnqwvsTfPi6blx3jj54O/6YS/TvIC/02/re2+SM4JWByao0PbcWwWpy
 lV/0/XOBVMMsc9fvVmI8ddXq1r1ZQFT1nsZynsZm4xno8V6ZveOrREWr/ibj2Zz1aPoy
 Ock3vU0YolLP1dr+5MrKj2K3sWhwYmFUdP5rKG617LpGZ8AOrQzRFeF4hA7VzrELZC1t
 u84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3WUtwszn8AZ5W3kFllr5QINaJ1puUIQ/z/baIovAi2A=;
 b=x0lZYtdzZ9KlB1IS5AM3mlB0RjcBkOvUYQTP8/YBUQZe/21+Y/UL97Cljc9mDewfY/
 2ckHDFc6pNS/M8jlZBei0rLbmsuFU2A2z9SHSSSyLaIRUN0HxvAvVAX3nhEPQC3uNZNg
 I00/08lHJ5dmq972LlFSbLdFt5Ngn8+nXL8nBc4c84gZzkF6L0ZgiXQD1TWtF+sRDhSh
 BXDvpetBNLP51oGWQTXZoUViqGvdZEe0Dku/Ge3woZ/0NjsdmckEIZSRLAVGI2R647kj
 cCQ0h+a4r2aNSNpoqPO0kx+R35rR/xjMwtqCgaKrVEfqQ1exwp5mzF7N+bOkrc/0rEPm
 dE8A==
X-Gm-Message-State: ACgBeo2qCqukecrd/ofwMDILD7rzgloNP8S1V2F/pc4uOyyBvgw3xfs3
 io2wMHikwXrwSxq//KCmgOsw5liS7nQ=
X-Google-Smtp-Source: AA6agR4odMUVi+fV1y5tLzlbzX2pkPZymiVx54fXmkzZXQesge9BNgRhHAIF5Wo6UU/rZRP1+CD2PQ==
X-Received: by 2002:a05:6870:d683:b0:10d:a90:d4a1 with SMTP id
 z3-20020a056870d68300b0010d0a90d4a1mr2073969oap.240.1661971911648; 
 Wed, 31 Aug 2022 11:51:51 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 24/60] ppc/pnv: add PHB4 helpers for user created pnv-phb
Date: Wed, 31 Aug 2022 15:49:58 -0300
Message-Id: <20220831185034.23240-25-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
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
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220811163950.578927-8-danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 9ce1ae7752..c34967cac7 100644
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
2.37.2


