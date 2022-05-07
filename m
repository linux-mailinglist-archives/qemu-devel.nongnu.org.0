Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A551E95B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:14:54 +0200 (CEST)
Received: from localhost ([::1]:49202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPtF-0002hU-OA
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPld-0005r7-KP; Sat, 07 May 2022 15:07:03 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:43760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlc-0001Zt-51; Sat, 07 May 2022 15:07:01 -0400
Received: by mail-oi1-x229.google.com with SMTP id v65so11105183oig.10;
 Sat, 07 May 2022 12:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lyrqtu/ju6nIMFNI5M52L71ErShd0EbZtz7+D8xmNmM=;
 b=GEaIdZgjMsYAJPz0HSB9oLIsA2XlI1wATZYzC/rsPTYcmTvAM4q+kRwZY5DRWA5q7F
 LSXAq+zGb0k7fdNdteMPNAhB4T1Fz1TklWxaQ5PVkpzEr1qFsjz0mADSGImnrPIjhznc
 4+qtBwmIFJZuEnPhqqDwuWjur7rg8K3lVW1EDrL8B7bHbMhEtKLXgiKdElPdtBF/t6pz
 KRfI8iCo9tc8wnzVBvJbh4bxoOATHPx+/lN7lfZO+S3DnCTVC7nnP9dvDU5bTShj4kBL
 qKXh+EM/Kxha3O+toFTWTBFJMdSPXumypriumym++bQUZVwMWfZaf1/kz9Sm8URE8PRP
 3uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lyrqtu/ju6nIMFNI5M52L71ErShd0EbZtz7+D8xmNmM=;
 b=gKDM1x/mm7hudxN6rClelrv6IWvBkzFv7P1ZnKAaA3PAh22C5ymKyooHhKv6YWpN1O
 qEOL0SXz9FL2lZpvXmT+VqoLaC6lzMBvnd0NLrWpRuI3SuDLqNKGZQp5d77M7BFrOlh3
 PH68PVydInELBq8391VsbZOi/urWzoXTPGAboNYd/DmP92RnfP3q4vE845Jq6ZejgjxX
 2gjPhCIzCK0KYYmovR7ASOf56HY0bANBHuuxlaVGx67IOft4WwdSYc0AvpkMgJPRk+AU
 sdcSMqVuuFD3VCGJRlQXKpVgHc94R1tlbruF7G4JMqENcpIhScqlshz/d+Cv+nyHuS6Z
 LLHA==
X-Gm-Message-State: AOAM5337867T+IyGPLLi0qIXMFZBRlif6JPuHP4namNSRlBq3Uus384v
 tzcGnCegPp5yEDhxltJo69R3+AYfF1Y=
X-Google-Smtp-Source: ABdhPJxkFcvTQyMZK5+Htm1UDk4M6DcKBN4abk5TlFgvT6I9GJ9mRbVjk+RBARvfWoYUP4JMROIAEg==
X-Received: by 2002:a05:6808:ecc:b0:322:319c:cd3 with SMTP id
 q12-20020a0568080ecc00b00322319c0cd3mr7670277oiv.148.1651950418753; 
 Sat, 07 May 2022 12:06:58 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:58 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 11/17] ppc/pnv: change pnv_phb4_get_pec() to also retrieve
 chip10->pecs
Date: Sat,  7 May 2022 16:06:18 -0300
Message-Id: <20220507190624.507419-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
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

The function assumes that we're always dealing with a PNV9_CHIP()
object. This is not the case when the pnv-phb device belongs to a
powernv10 machine.

Change pnv_phb4_get_pec() to be able to work with PNV10_CHIP() if
necessary.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 262251ebcf..f911957f10 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1547,17 +1547,29 @@ void pnv_phb4_instance_init(Object *obj)
 static PnvPhb4PecState *pnv_phb4_get_pec(PnvChip *chip, PnvPHB *phb,
                                          Error **errp)
 {
-    Pnv9Chip *chip9 = PNV9_CHIP(chip);
+    PnvPhb4PecState *pecs = NULL;
     int chip_id = phb->chip_id;
     int index = phb->phb_id;
     int i, j;
 
+    if (phb->version == PHB_VERSION_4) {
+        Pnv9Chip *chip9 = PNV9_CHIP(chip);
+
+        pecs = chip9->pecs;
+    } else if (phb->version == PHB_VERSION_5) {
+        Pnv10Chip *chip10 = PNV10_CHIP(chip);
+
+        pecs = chip10->pecs;
+    } else {
+        return NULL;
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
2.32.0


