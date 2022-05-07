Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA551E959
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 21:12:51 +0200 (CEST)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnPrF-0005WV-8x
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 15:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlb-0005oT-QC; Sat, 07 May 2022 15:06:59 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:36835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nnPlZ-0001Zg-T5; Sat, 07 May 2022 15:06:59 -0400
Received: by mail-oi1-x22b.google.com with SMTP id v66so11126521oib.3;
 Sat, 07 May 2022 12:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YQKLhDM9WB+4se1Uy+XOaAY75EETpfaNLSKciOTKXd0=;
 b=mrKPMlL7SMIv1sWiUl//eIJDyoJgEvVLxt9wIqEOwWkuwLjN8SIBQ2YTRvRpo+ZBsp
 SBPCEv0PEvRGrvegGoobSkro5oxtmwzVILj+xJe6zhWw6K55J1w4K7dumnvYEYg4axPO
 JtKpghVd6wMUBQRJkW+OzVcuYr7c9uVFVcr8TXIVXpOIzC93TXupXwQJ6M9JCyJKAr+q
 zKgRIef8WIlG9Cpy0XOEpbv18JqhBsrB455+fpJWw+ASTF7oje5+R4OBZ6nu1D8TpQiU
 KnR/7sKDVsBHrnwz3O/6BWTyK9P5yJeJEA5WZwnAxLhtRo2NJ8yiaqcwgnaJPd02t2LG
 CZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YQKLhDM9WB+4se1Uy+XOaAY75EETpfaNLSKciOTKXd0=;
 b=qaVrNt2405WovtKSX2lrUz2wgEPQ/g59dc06PJzZzRlEjPAdLzv/mRMSx79tY7QyUS
 iaKGUVIF0vSMMQKAAnOPaOgxjvg2c46rw8qRTaf7pSUTOCq7f/5TstqdbS5YusQpvkS2
 N5wM7FjQSVG+8hvn1f39dxIkb5VIZNEupamJOw/wRLqZ3v3UDCKJXtJ1o0JaknfFcc8w
 23Yrjrj7hU6Brph069c/cVfl9+C0QjFyVEnMK9le9GqLZV6eodnpLMfGHj2SulzG9Igw
 PL5D4QDeammAoqwtYwXB7EbwRuo7vAk3ESiDb31aXTSKmcqWAIwA8Ui+MBLXr38jIkeU
 BKvQ==
X-Gm-Message-State: AOAM533CMvvysAatgh1sfpLTrV36dDhZq+t1pkMzYexCYJ+EQgzN1CDj
 eWi+J7g5OJI1dhz6aJ/tzW7SvdrC64U=
X-Google-Smtp-Source: ABdhPJwAJnTcyJO5Oeucp6FradsyPckpRPWBhW5TRPCdNXR5wryvKbgT3XsoU+6v95xeT8aEK8tFZg==
X-Received: by 2002:aca:ac8c:0:b0:326:13f6:5f5c with SMTP id
 v134-20020acaac8c000000b0032613f65f5cmr4330307oie.287.1651950416404; 
 Sat, 07 May 2022 12:06:56 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 p1-20020a0568301d4100b0060603221270sm2907397oth.64.2022.05.07.12.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 12:06:56 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 10/17] ppc/pnv: use PnvPHB.version
Date: Sat,  7 May 2022 16:06:17 -0300
Message-Id: <20220507190624.507419-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507190624.507419-1-danielhb413@gmail.com>
References: <20220507190624.507419-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
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

The 'version' attribute of the PnvPHB was never used. Instead of
removing it, let's make use of it by setting the PHB version the PnvPHB
device is currently running.

This distinction will be used next patch.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c         | 11 +++++++++++
 include/hw/pci-host/pnv_phb.h |  7 +++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 9583c703d4..cef6a57d50 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -63,6 +63,7 @@ static void pnv_phb_instance_init(Object *obj)
 
 static void pnv_phb_realize(DeviceState *dev, Error **errp)
 {
+    PnvPHB *phb = PNV_PHB(dev);
     g_autofree char *chip_typename = pnv_phb_get_chip_typename();
 
     g_assert(chip_typename != NULL);
@@ -71,10 +72,20 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8E) ||
         !strcmp(chip_typename, TYPE_PNV_CHIP_POWER8NVL)) {
         /* PnvPHB3 */
+        phb->version = PHB_VERSION_3;
         pnv_phb3_realize(dev, errp);
         return;
     }
 
+    if (!strcmp(chip_typename, TYPE_PNV_CHIP_POWER9)) {
+        phb->version = PHB_VERSION_4;
+    } else if (!strcmp(chip_typename, TYPE_PNV_CHIP_POWER10)) {
+        phb->version = PHB_VERSION_5;
+    } else {
+        error_setg(errp, "unknown PNV chip: %s", chip_typename);
+        return;
+    }
+
     pnv_phb4_realize(dev, errp);
 }
 
diff --git a/include/hw/pci-host/pnv_phb.h b/include/hw/pci-host/pnv_phb.h
index 46158e124f..cceb37d03c 100644
--- a/include/hw/pci-host/pnv_phb.h
+++ b/include/hw/pci-host/pnv_phb.h
@@ -103,9 +103,14 @@ typedef struct PnvPhb4PecState PnvPhb4PecState;
 #define TYPE_PNV_PHB "pnv-phb"
 OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
 
+#define PHB_VERSION_3    3
+#define PHB_VERSION_4    4
+#define PHB_VERSION_5    5
+
 struct PnvPHB {
     PCIExpressHost parent_obj;
 
+    uint64_t version;
     uint32_t chip_id;
     uint32_t phb_id;
     char bus_path[8];
@@ -142,8 +147,6 @@ struct PnvPHB {
     /*
      * PnvPHB4 attributes
      */
-    uint64_t version;
-
     /* The owner PEC */
     PnvPhb4PecState *pec;
 
-- 
2.32.0


