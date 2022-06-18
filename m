Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11A455042B
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 13:11:33 +0200 (CEST)
Received: from localhost ([::1]:60886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2WMW-0005ZO-Qe
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 07:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDf-0007sb-CL; Sat, 18 Jun 2022 07:02:25 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:45613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDd-0005fj-ID; Sat, 18 Jun 2022 07:02:22 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1016409cf0bso8423180fac.12; 
 Sat, 18 Jun 2022 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nrYUXDrPZK9AjIy48/KoAnoYyl6xVl2VfnLNPEsV09s=;
 b=qjvYMjeq5NZwTne3JvgAKwtr/hlE5Y7Y9j2GWEnpa/bAYH0ZW0Q+cDmoVDwEU9l84B
 ctyoTydN1zjNxRtaIR4B2WYdBSZNlKCrKWOyEi/gR8ob0JPu5HBC+NWPblqAPH9FlvIc
 oVu1QnUChvzY/Gxznhx++uDrxoUMRWGF4VWCLRQnq5/xqTaEemnaY3/uiGYy97EsykGB
 1PgX/GYDqonveUHDJ4uRnt4u61uNq6CARUq7CXpR3aNynECvu3sWH8R3WLhvP6GQ1L5D
 X0cN02RFC8SnT61H2jWuLuw0k4K2V4uPVSVR7B9BYU9SgwYacJ9tazcfN6ioogNPGUTf
 jhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nrYUXDrPZK9AjIy48/KoAnoYyl6xVl2VfnLNPEsV09s=;
 b=ylW2EroXsJyun6G7S4E3PPyzb3cRC/s9qSUvYTkzjyZKmf2wNPBfG/99Wg9i7sXf50
 Gcoo4x3fuHxtW/ADxdFRUhjSt8LibG3W6RtS86Duk13zGYXxsEPAWW2x51TBsXsm6tAq
 52GJnl0YFeQMg8JPEddsqtbAuI/Fcj3Cf3lTAhNlNvFUBqn9iDAEv0wGHPglWEDYt2ou
 IlYotIT0uhFtD/NZ1WrRGXvrZYJ7tck8RAqxj3vnBqYJwBapAbZSDLxEK3So9QkEwRsP
 O2sr09+BBj9bZCCiIRISOvhgWMJAkn7IameSvfELD8FDi/2vrozwVfNNkRG+of1JnNCX
 sxtg==
X-Gm-Message-State: AJIora8vMhk/3tSbiEp9oALvNbXTw8KXz3emW8xCP4L7PdinqqlXzQX7
 A78pflb0sdkarvUwSMqe2xGw04CngG0=
X-Google-Smtp-Source: AGRyM1tdMZ6tdl0YlozXkcjiYpxGaemrECGqlx5AcdPBxnmh3LwZhaaYZcsJ7RvT7VBrS3TEQSfMHw==
X-Received: by 2002:a05:6870:d215:b0:f2:5fc9:6492 with SMTP id
 g21-20020a056870d21500b000f25fc96492mr7859786oac.112.1655550139777; 
 Sat, 18 Jun 2022 04:02:19 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a9d5a90000000b0060603221280sm4075456oth.80.2022.06.18.04.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 04:02:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 5/9] ppc/pnv: make pnv_ics_get() use the chip8->phbs[] array
Date: Sat, 18 Jun 2022 08:01:58 -0300
Message-Id: <20220618110202.87735-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618110202.87735-1-danielhb413@gmail.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
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

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pnv.c | 38 +++++++++++---------------------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 40e0cbd84d..ff7f803662 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1939,44 +1939,28 @@ PowerPCCPU *pnv_chip_find_cpu(PnvChip *chip, uint32_t pir)
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


