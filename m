Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3132943D6D9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 00:42:40 +0200 (CEST)
Received: from localhost ([::1]:58588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfrd1-0002UB-AW
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 18:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMQ-0007xC-2G
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:30 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:39557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mfrMN-0002qc-MC
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 18:25:29 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F261C75619D;
 Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4A2B675619C; Thu, 28 Oct 2021 00:25:16 +0200 (CEST)
Message-Id: <24142b6436e44591d9afc861c9d6c467ff9ececb.1635371671.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635371671.git.balaton@eik.bme.hu>
References: <cover.1635371671.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 12/18] hw/intc/sh_intc: Move sh_intc_register() closer to
 its only user
Date: Wed, 27 Oct 2021 23:54:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sh_intc_register() function is only used at one place. Move them
together so it's easier to see what's going on.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/intc/sh_intc.c | 60 +++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 763ebbfec2..54803bc2ca 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -270,36 +270,6 @@ struct intc_source *sh_intc_source(struct intc_desc *desc, intc_enum id)
     return NULL;
 }
 
-static unsigned int sh_intc_register(MemoryRegion *sysmem,
-                                     struct intc_desc *desc,
-                                     const unsigned long address,
-                                     const char *type,
-                                     const char *action,
-                                     const unsigned int index)
-{
-    char name[60];
-    MemoryRegion *iomem, *iomem_p4, *iomem_a7;
-
-    if (!address) {
-        return 0;
-    }
-
-    iomem = &desc->iomem;
-    iomem_p4 = desc->iomem_aliases + index;
-    iomem_a7 = iomem_p4 + 1;
-
-    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "p4");
-    memory_region_init_alias(iomem_p4, NULL, name, iomem, A7ADDR(address), 4);
-    memory_region_add_subregion(sysmem, P4ADDR(address), iomem_p4);
-
-    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "a7");
-    memory_region_init_alias(iomem_a7, NULL, name, iomem, A7ADDR(address), 4);
-    memory_region_add_subregion(sysmem, A7ADDR(address), iomem_a7);
-
-    /* used to increment aliases index */
-    return 2;
-}
-
 static void sh_intc_register_source(struct intc_desc *desc,
                                     intc_enum source,
                                     struct intc_group *groups,
@@ -399,6 +369,36 @@ void sh_intc_register_sources(struct intc_desc *desc,
     }
 }
 
+static unsigned int sh_intc_register(MemoryRegion *sysmem,
+                                     struct intc_desc *desc,
+                                     const unsigned long address,
+                                     const char *type,
+                                     const char *action,
+                                     const unsigned int index)
+{
+    char name[60];
+    MemoryRegion *iomem, *iomem_p4, *iomem_a7;
+
+    if (!address) {
+        return 0;
+    }
+
+    iomem = &desc->iomem;
+    iomem_p4 = desc->iomem_aliases + index;
+    iomem_a7 = iomem_p4 + 1;
+
+    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "p4");
+    memory_region_init_alias(iomem_p4, NULL, name, iomem, A7ADDR(address), 4);
+    memory_region_add_subregion(sysmem, P4ADDR(address), iomem_p4);
+
+    snprintf(name, sizeof(name), "intc-%s-%s-%s", type, action, "a7");
+    memory_region_init_alias(iomem_a7, NULL, name, iomem, A7ADDR(address), 4);
+    memory_region_add_subregion(sysmem, A7ADDR(address), iomem_a7);
+
+    /* used to increment aliases index */
+    return 2;
+}
+
 int sh_intc_init(MemoryRegion *sysmem,
                  struct intc_desc *desc,
                  int nr_sources,
-- 
2.21.4


