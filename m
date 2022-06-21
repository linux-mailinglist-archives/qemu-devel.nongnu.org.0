Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F89555391A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:44:03 +0200 (CEST)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hv0-0004V5-OQ
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hmD-00032R-3G; Tue, 21 Jun 2022 13:34:57 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:39562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hmA-0002Mp-Uw; Tue, 21 Jun 2022 13:34:56 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-101dc639636so9465417fac.6; 
 Tue, 21 Jun 2022 10:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OnMtBzp/vMnlWp2qSDKZyGSKtfNM2nyhMMNMzqjTutM=;
 b=mmGWRCUUj2dlS6g2nhH8hKoc8E/C/2yPcq1JfVRl2LG1wp40SPYJUEnAx7tL4XW3Xx
 /XuoWwTh2fOtOo6yvDqnJuUjwnrYRGg8pTq1rIi0yaroz/43MNUgYx1omyE4pLxoEek1
 Qb4/Wt6IygG28VgmWvA/wO6TnHfhBpxq0SHO1sTef2xxcUlH7YJ1Wt/dJyzF8QqIJAkR
 V37/Xq99+qSNgLx5BdXUF5zhYZ8VkYASeZKaHlkgngmmz0xiNGWTqLl3q9zf2SSvy7uT
 hUVSPI1RPfuvsQSQMJcYAtgunOEH61/atJJkDW9laalVap9oRKu13wvh0FqCsW1A4lvR
 gGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OnMtBzp/vMnlWp2qSDKZyGSKtfNM2nyhMMNMzqjTutM=;
 b=TQOhiljaSyEFsV6JqYG3ENS/QRPgYYi/tBAB3TEYjomaBsU3b9VvQIgcH87lfhit/c
 cJhxTF+gGvJUfHHX/Oo5eevGzYcUlT3KYEQnneVSq+ChqANG0NqVrcZZ9cTxmTB+ED7X
 uGSP0uK6nGABrVfh75P6zITgyL6C2qpzk4rsgfgmAA1R7y1hlbCvfrRfJxH0aFc+F/yw
 eoB9zI/0FCBfLDDa9xzw5RmxpGrLi7Zd22xpLaFxfH86aOdO1BZvwutRkvhYSZ5ptr2Q
 hL1lFincVwOStnDMWSdn3z0DEMHVCjYSLw6yENhG8g4c7LdRrW7902CMYigcXm7iudft
 EzXA==
X-Gm-Message-State: AJIora/3v6IOBHCEn2bQQbPvbfX2RfjMs4XiiecCbWGRLpnvAPug1EkF
 b4ziAqY58F3RdOdTrPkYy6O7I7NtYArofQ==
X-Google-Smtp-Source: AGRyM1s/TjsYjquAucuHUztbO4rKAoTksZr8Z027lugOB22wamrBAeeEpybxv+6MfZXLktIIGlQePw==
X-Received: by 2002:a05:6870:f693:b0:101:cb61:2937 with SMTP id
 el19-20020a056870f69300b00101cb612937mr8749408oab.151.1655832892560; 
 Tue, 21 Jun 2022 10:34:52 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a056870385600b0010200e2828fsm2886556oal.30.2022.06.21.10.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:34:52 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 5/8] ppc/pnv: make pnv_ics_resend() use chip8->phbs[]
Date: Tue, 21 Jun 2022 14:34:33 -0300
Message-Id: <20220621173436.165912-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621173436.165912-1-danielhb413@gmail.com>
References: <20220621173436.165912-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
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

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index e6cea789f8..74a6c88dd2 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1990,28 +1990,22 @@ PnvChip *pnv_get_chip(PnvMachineState *pnv, uint32_t chip_id)
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


