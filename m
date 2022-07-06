Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E3E569368
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:37:52 +0200 (CEST)
Received: from localhost ([::1]:43028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BmR-000706-UK
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLY-0000I0-MC; Wed, 06 Jul 2022 16:10:04 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLW-0003FR-Qg; Wed, 06 Jul 2022 16:10:04 -0400
Received: by mail-ua1-x932.google.com with SMTP id l7so6256343ual.9;
 Wed, 06 Jul 2022 13:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0vgyXhGBkVs5WNtiV5TnrvCoVqcJKm/b9T1eOBzf/LU=;
 b=nVkCVtYIQ42zKzd9SSkZMP4JxMJGdrZicdIOGOXxqa4yVz7Q2Su+YJqmoJIyPWWPX1
 oSIlV3HxyB/NfrhnVrlpFaUdBdU4AznlKmcvKjkdfZt5VfrJ27nlsJieFEq+/+2ykkPH
 ggMdc16eFSq9sWzbqHqgaij33eS7oA+9O+RNXVjd76X3IiXMpHjImsBqD2YNBLRHI5oK
 rcQkKCp0zMQvkaKAawiRjnsH8ipThK+Ag2ydgt77k75Ur7wPaRFtjnkaYt0n4tghaZeK
 ZGhIn+zQ8XJb0RhChq+vEL+ixlxvLyJ+eMuT8VqLZAFGbTBjDaVvvbyotpCC7WZCTA7D
 PePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0vgyXhGBkVs5WNtiV5TnrvCoVqcJKm/b9T1eOBzf/LU=;
 b=TAW5gr2V7JrNzA61yOAtRQyS1CGn0cv9H61mwGKmGBWpftKvch59C0pv54H3NFqv8v
 eeAYPXwhBkDmqE97yUrKmkJDwLNaWcwFMRA8bMtqlfGHFGNBv35P2WvOOwKFA9UIA7+O
 RGMpUh3LtyywNjvinDLZpGVRgLb9pStC5apYdc25tnwQH13oIeYdiW+g4GvjPP4IbEan
 4FTNpr0H4vDArVXFs4TLl199G9qHe/CJ8etHOkdn8STFugY2MP1hzkHbF44WqqcQMhfN
 jkX2sRhEaBW/Ef9X27RpYKE1ZeAY52H9cczL8FZ+CeJxLLWBNWn8WnUpOG6khHD3EIeX
 AbjA==
X-Gm-Message-State: AJIora9dp+XTzmcPEljEHBp0UGPzV+m4nkrbBB9KsYq2cpkHUWQR25jz
 Jiu/5ee36dd4pnSEpfdpo+eVEa3DBss=
X-Google-Smtp-Source: AGRyM1te5hobtnYkcW/TDo/xkRJZ7cqjCCWjzClI8mO4h1wlYZvbFJoqu0hEGTkOQTMyxKchVksr5w==
X-Received: by 2002:a9f:23c2:0:b0:365:958:e807 with SMTP id
 60-20020a9f23c2000000b003650958e807mr20233457uao.114.1657138199068; 
 Wed, 06 Jul 2022 13:09:59 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:09:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 04/34] ppc/pnv: make pnv_ics_get() use the chip8->phbs[] array
Date: Wed,  6 Jul 2022 17:09:16 -0300
Message-Id: <20220706200946.471114-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x932.google.com
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

The function is working today by getting all the child objects of the
chip, interacting with each of them to check whether the child is a PHB,
and then doing what needs to be done.

We have all the chip PHBs in the phbs[] array so interacting with all
child objects is unneeded. Open code pnv_ics_get_phb_ics() into
pnv_ics_get() and remove both pnv_ics_get_phb_ics() and the
ForeachPhb3Args struct.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220621173436.165912-5-danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 38 +++++++++++---------------------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index c5e63bede7..e6cea789f8 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1950,44 +1950,28 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir)
     return NULL;
 }
 
-typedef struct ForeachPhb3Args {
-    int irq;
-    ICSState *ics;
-} ForeachPhb3Args;
-
-static int pnv_ics_get_child(Object *child, void *opaque)
-{
-    ForeachPhb3Args *args = opaque;
-    PnvPHB3 *phb3 = (PnvPHB3 *) object_dynamic_cast(child, TYPE_PNV_PHB3);
-
-    if (phb3) {
-        if (ics_valid_irq(&phb3->lsis, args->irq)) {
-            args->ics = &phb3->lsis;
-        }
-        if (ics_valid_irq(ICS(&phb3->msis), args->irq)) {
-            args->ics = ICS(&phb3->msis);
-        }
-    }
-    return args->ics ? 1 : 0;
-}
-
 static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
 {
     PnvMachineState *pnv = PNV_MACHINE(xi);
-    ForeachPhb3Args args = { irq, NULL };
-    int i;
+    int i, j;
 
     for (i = 0; i < pnv->num_chips; i++) {
-        PnvChip *chip = pnv->chips[i];
         Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
 
         if (ics_valid_irq(&chip8->psi.ics, irq)) {
             return &chip8->psi.ics;
         }
 
-        object_child_foreach(OBJECT(chip), pnv_ics_get_child, &args);
-        if (args.ics) {
-            return args.ics;
+        for (j = 0; j < chip8->num_phbs; j++) {
+            PnvPHB3 *phb3 = &chip8->phbs[j];
+
+            if (ics_valid_irq(&phb3->lsis, irq)) {
+                return &phb3->lsis;
+            }
+
+            if (ics_valid_irq(ICS(&phb3->msis), irq)) {
+                return ICS(&phb3->msis);
+            }
         }
     }
     return NULL;
-- 
2.36.1


