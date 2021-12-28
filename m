Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7FD480CE0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 20:54:39 +0100 (CET)
Received: from localhost ([::1]:36906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2IYQ-0000TI-I9
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 14:54:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIy-0003oK-3q; Tue, 28 Dec 2021 14:38:40 -0500
Received: from [2607:f8b0:4864:20::735] (port=41820
 helo=mail-qk1-x735.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n2IIu-00045c-Gu; Tue, 28 Dec 2021 14:38:37 -0500
Received: by mail-qk1-x735.google.com with SMTP id m2so16410609qkd.8;
 Tue, 28 Dec 2021 11:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zLe//ch48ZEy/Xo4bh9yQktCRczkd5ojG/PJyiMgfbk=;
 b=daqYKiZkSXbj6OAshbvmPQTeFsZ53MxPCmzIuW3ntXcOGByME7InCtsK+uts506s9L
 wP0mN+2VjZ8X+XUpM1n2ATnMvO4RVlRIEBUBCKkAdEnHKmyRb1kRpUsN8+tihV/r21Eu
 bEgpw5z7G26x1umhQiUrmeIoQbm4AlvlBgS2kX6hNJIoMlY0QqGrW5dmUbw+2I+TrK9C
 Ouo+xDD2jfwPaXa7CbS2Omf5njbDVT1cy0StKz9zg1pTjmrXqJyft5ctaEfzVbbe01O1
 ehJV/EU1+jlebdJpv1Gpa7lmrkh589Gdjw3rypWtDNiVNssDIMe8seV6qVZYt55cJyDV
 MZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLe//ch48ZEy/Xo4bh9yQktCRczkd5ojG/PJyiMgfbk=;
 b=jUCTaLVsP024J6j47JPf1YvGf/egUhHZOzIir9+nay+vF4qsG7dMteZkIjBUovXfsO
 ujs8sV1tDGdCnwUhFivt7WCs0NPsG5d4D6NrDFMJJLzQ8vaIZeH2as4Ra1W5CV4V5DQI
 btZqr1WPzxMXPnqJ4UhoQ+NF00r0dxmOUS1uHL38A+JJFa9FeSRMMWKHpylraS6llPKK
 sCLK+j60gDEHLPzkGUxEkaFKP0cAmApqTqqP8xA+p2ALvUaqkoFUdwHC4Z7q24XWqVOT
 5gMTBKktCsEsCiyNuO97/ZpHu/jGH+22MQdkIJGoffZoSv7uce01WviCludYiX2qo8xW
 yMIQ==
X-Gm-Message-State: AOAM532GLVNABg0TQrJH8f92xqzV3T834wtf7c7lA4vQuYS6Eq5uC3iL
 M0nLQJze+u5IiGlyc2BAh1iwz2wZnK0=
X-Google-Smtp-Source: ABdhPJxach8w4AoJgE99myOhcvdtLwPxISOEOJnMrwOXXfyMk+LPM92q7LClvv39WV0rxd2L1mzYYQ==
X-Received: by 2002:a37:6706:: with SMTP id b6mr16236837qkc.16.1640720314379; 
 Tue, 28 Dec 2021 11:38:34 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id r20sm16924059qkp.21.2021.12.28.11.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 11:38:34 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/17] pnv_phb4_pec.c: move pnv_pec_phb_offset() to pnv_phb4.c
Date: Tue, 28 Dec 2021 16:37:58 -0300
Message-Id: <20211228193806.1198496-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::735
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The logic inside pnv_pec_phb_offset() wiil be useful in the next patch
to determine the stack that should contain a PHB4 device.

Move the function to pnv_phb4.c and make it public since there's no
pnv_phb4_pec.h header. While we're at it, add 'stack_index' as a
parameter and make the function return 'phb-id' directly. And rename it
to pnv_pec_get_phb_id() to be even clearer about the function intent.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 17 +++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c     | 15 +--------------
 include/hw/pci-host/pnv_phb4.h |  2 ++
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 0ea505cc94..36c56007ba 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1164,6 +1164,23 @@ static AddressSpace *pnv_phb4_dma_iommu(PCIBus *bus, void *opaque, int devfn)
     return &ds->dma_as;
 }
 
+/*
+ * Return the index/phb-id of a PHB4 that belongs to a
+ * pec->stacks[stack_index] stack.
+ */
+int pnv_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index)
+{
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    int index = pec->index;
+    int offset = 0;
+
+    while (index--) {
+        offset += pecc->num_stacks[index];
+    }
+
+    return offset + stack_index;
+}
+
 /*
  * Set the object properties of a phb in relation with its stack.
  *
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 700ee4b185..bc2f8bb8b1 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -374,19 +374,6 @@ static void pnv_pec_instance_init(Object *obj)
     }
 }
 
-static int pnv_pec_phb_offset(PnvPhb4PecState *pec)
-{
-    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
-    int index = pec->index;
-    int offset = 0;
-
-    while (index--) {
-        offset += pecc->num_stacks[index];
-    }
-
-    return offset;
-}
-
 static void pnv_pec_realize(DeviceState *dev, Error **errp)
 {
     PnvPhb4PecState *pec = PNV_PHB4_PEC(dev);
@@ -422,7 +409,7 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < pec->num_stacks; i++) {
         PnvPhb4PecStack *stack = &pec->stacks[i];
         Object *stk_obj = OBJECT(stack);
-        int phb_id = pnv_pec_phb_offset(pec) + i;
+        int phb_id =  pnv_pec_get_phb_id(pec, i);
 
         object_property_set_int(stk_obj, "stack-no", i, &error_abort);
         object_property_set_int(stk_obj, "phb-id", phb_id, &error_abort);
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index d7838513f1..0fa88ca3fa 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -15,6 +15,7 @@
 #include "hw/ppc/xive.h"
 #include "qom/object.h"
 
+typedef struct PnvPhb4PecState PnvPhb4PecState;
 typedef struct PnvPhb4PecStack PnvPhb4PecStack;
 typedef struct PnvPHB4 PnvPHB4;
 typedef struct PnvChip PnvChip;
@@ -134,6 +135,7 @@ struct PnvPHB4 {
 void pnv_phb4_pic_print_info(PnvPHB4 *phb, Monitor *mon);
 void pnv_phb4_update_regions(PnvPhb4PecStack *stack);
 void pnv_phb4_set_stack_phb_props(PnvPhb4PecStack *stack, PnvPHB4 *phb);
+int pnv_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index);
 extern const MemoryRegionOps pnv_phb4_xscom_ops;
 
 /*
-- 
2.33.1


