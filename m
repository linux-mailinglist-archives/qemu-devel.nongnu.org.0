Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC91553919
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:43:57 +0200 (CEST)
Received: from localhost ([::1]:47990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3huu-00045v-8c
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hm9-0002zC-Er; Tue, 21 Jun 2022 13:34:53 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:35541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3hm7-0002MI-RG; Tue, 21 Jun 2022 13:34:53 -0400
Received: by mail-oi1-x229.google.com with SMTP id k24so17969763oij.2;
 Tue, 21 Jun 2022 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNCrfeyPMijzRW6iJN0vEt6mhnSTXfUXk7S0j1xt9Zk=;
 b=lyMYXI7ML7raekdgKNeuw6sbnhZ5JxkQ7Lk1XwXesZu99NLikZ9+kgMP4PC3GrAZ8C
 R1FjdZyzcT9QcjVokdiobNsv0NLJEZLwScYzHW4613NDBasDi78HP2FDfJuGbSxoBYuj
 gIyKgFFsIfnTtwgZpo7Q6u63GqumfxdRLI4eijddcU/ICqhsFRqJeKxWp4hRB7fAgZJc
 BHZpJvyovdmf4NJnTwl4s85jMK5KTdkq4QUOyoTCZNNuksLTqAaoM26o4QvNcefiJvMD
 njoYb9nG3Ncla057c6+DhmzcTSks6cb/gV/1Jx3pRNGLSZWaA3emPczxlRmyy+RBpt8M
 EfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNCrfeyPMijzRW6iJN0vEt6mhnSTXfUXk7S0j1xt9Zk=;
 b=W5Am4AA2LrtwLuZCnzkgX2t6RPb7cTMIDoKWo4BWOZg9nnEi3qcZA5xehL2o7HCk8U
 /ZTd/cuh4rTDd9/aKGhrhld2HMdiU3h+AZ50MoFklSu9zPe+MRi4EpoGRhDT6+uS2/Hm
 MaC6N0z2jSp3x1FJKksQkRBYU54fNUKhBdOKYRXVDACFE4QKPaSVDu26467WMrD4nTqH
 rJdD0MIofukOR4nHCdLzei3N8RMNVJ63bSaFVgDoBIKg8tzTGrNTEBUvS84vt6nF/hzM
 r5zKvDs0MB65TcVURht7BBPCisBAAiDT+gbKNzRJw+n3Eajtj+cpjsxtEGL2ON51roB0
 UQCQ==
X-Gm-Message-State: AJIora8RaFWJ2qjPAxIlXaC139/ED9UdLty4HW4404WVikjcJyvxFGYH
 V/OhcDP9aW0b8u2wC2g9irNuMQ7PSGpchg==
X-Google-Smtp-Source: AGRyM1vTEdHRyMin/M2pODvncsO/0f2KTjAPIHO9ZMKRPzJO5m8luIe+GtEQM0/8I+F1XIiC5bk8rA==
X-Received: by 2002:aca:3bd6:0:b0:32f:e706:606 with SMTP id
 i205-20020aca3bd6000000b0032fe7060606mr14345949oia.257.1655832890274; 
 Tue, 21 Jun 2022 10:34:50 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a056870385600b0010200e2828fsm2886556oal.30.2022.06.21.10.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 10:34:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 4/8] ppc/pnv: make pnv_ics_get() use the chip8->phbs[] array
Date: Tue, 21 Jun 2022 14:34:32 -0300
Message-Id: <20220621173436.165912-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621173436.165912-1-danielhb413@gmail.com>
References: <20220621173436.165912-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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


