Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A13550427
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 13:09:03 +0200 (CEST)
Received: from localhost ([::1]:54574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2WK6-0000od-Mt
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 07:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDh-0007sh-2S; Sat, 18 Jun 2022 07:02:27 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDf-0005fz-KN; Sat, 18 Jun 2022 07:02:24 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so8405340fac.13; 
 Sat, 18 Jun 2022 04:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wFIPVAEq+m1icJUGifUbVeq3yFLPbRkYHZ6jQ/rYCBQ=;
 b=pTALJbg2Lt45HIHLoyRB60YfRDBWCMostgoid/kvl2n2iK0tKuxt/PwCGGLdjXpbiZ
 vBEXlLOBsSDEeDbPWNQsk4yFNNLcMqinsCRik81b7Pa4R5JL/kAbfMASCW0FnRnNXyKw
 2s9cN2HX7LG9CQFSbmdhJNsa+3NwxcifGoDp9YwLuFW5pfI/nO1reAvQrPug44cAa7YB
 vGJVcOR3CNT/STGEQSi5aN97AVwwSx11pya7hbdx0HUEzWYNgTPAHqH22ZlRWVhNe2dV
 nmG2WX8tDdLabBVgqL0KPK2dvK4P5HY/gfI5KXOiSJlxhCwuQveSfBP7RIqAYGokvRAh
 umUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wFIPVAEq+m1icJUGifUbVeq3yFLPbRkYHZ6jQ/rYCBQ=;
 b=Ku78z2RoGgXDTgAul7TG5zOqhJ9lA1MbNoXPsZTMEPnlUI+u7wrvrqOZZJyTVMCsWA
 j2KrXxKKwVy17PGLVGOEPUF+QIMwiUrGFM2u0h6esevgfSjKrkmhwaB3W9C16udbpC+H
 eGLNg7X6yb/2kXwIRWD5NfN+dFK+nUvnhiOVdBElWygzMX5YMUA+tlZ4rRZEBpG/h6Hs
 O/dUOz+/TdHGDkDJepcptrqiTf+PFRt0qUoRvG4q/GqYCs3AkHgglhsXj4qSJcZq7kBW
 KPZoNdJMDk3LW0u5W8uuG15FxsSQ+r0/+LBjl/sFyMu6XknfjGRD74rtHcfl0QMiqZLh
 8O9w==
X-Gm-Message-State: AJIora84bo7UF4NGiH5IaJlnbtzSRhDCmLZ2nvReAjNXOincREqF6pbg
 W9V2C3cbpFEYQbXgncrbRDPZaZRzGds=
X-Google-Smtp-Source: AGRyM1s/z9cl+VpPIctT5rvYUjm4yHNwfKdRc51oUUPeU5UQ+Yvo8vCIkAe75YNRT3zCPciw6mwCyw==
X-Received: by 2002:a05:6870:434d:b0:e5:9115:cb15 with SMTP id
 x13-20020a056870434d00b000e59115cb15mr13335794oah.53.1655550142048; 
 Sat, 18 Jun 2022 04:02:22 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a9d5a90000000b0060603221280sm4075456oth.80.2022.06.18.04.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 04:02:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 6/9] ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
Date: Sat, 18 Jun 2022 08:01:59 -0300
Message-Id: <20220618110202.87735-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618110202.87735-1-danielhb413@gmail.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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

pnv_ics_resend() is scrolling through all the child objects of the chip
to search for the PHBs. It's faster and simpler to just use the phbs[]
array.

pnv_ics_resend_child() was folded into pnv_ics_resend() since it's too
simple to justify its own function.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index ff7f803662..08136def8e 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1979,28 +1979,22 @@ PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
     return NULL;
 }
 
-static int pnv_ics_resend_child(Object *child, void *opaque)
-{
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
-
-    if (phb3) {
-        ics_resend(&phb3->lsis);
-        ics_resend(ICS(&phb3->msis));
-    }
-    return 0;
-}
-
 static void pnv_ics_resend(XICSFabric *xi)
 {
     PnvMachineState *pnv = PNV_MACHINE(xi);
-    int i;
+    int i, j;
 
     for (i = 0; i < pnv->num_chips; i++) {
-        PnvChip *chip = pnv->chips[i];
         Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
 
         ics_resend(&chip8->psi.ics);
-        object_child_foreach(OBJECT(chip), pnv_ics_resend_child, NULL);
+
+        for (j = 0; j < chip8->num_phbs; j++) {
+            PnvPHB3 *phb3 = &chip8->phbs[j];
+
+            ics_resend(&phb3->lsis);
+            ics_resend(ICS(&phb3->msis));
+        }
     }
 }
 
-- 
2.36.1


