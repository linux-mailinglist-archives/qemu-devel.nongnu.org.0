Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CA04400E4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:02:37 +0200 (CEST)
Received: from localhost ([::1]:38166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVH2-0000ip-L7
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUvr-0007CO-My
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:48 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:51114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUvo-00066h-Es
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:43 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5B28B756194;
 Fri, 29 Oct 2021 18:40:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A387875619C; Fri, 29 Oct 2021 18:40:26 +0200 (CEST)
Message-Id: <c17755a34793eef3e1be84c8e879d55caa4a9ca8.1635524617.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635524616.git.balaton@eik.bme.hu>
References: <cover.1635524616.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 14/25] hw/intc/sh_intc: Move sh_intc_register() closer to
 its only user
Date: Fri, 29 Oct 2021 18:23:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


