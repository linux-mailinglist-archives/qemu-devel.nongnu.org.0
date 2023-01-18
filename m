Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7248670EB5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 01:36:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwPw-0005vB-6v; Tue, 17 Jan 2023 19:35:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHwPr-0005tr-62; Tue, 17 Jan 2023 19:35:01 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pHwPp-00055Y-3K; Tue, 17 Jan 2023 19:34:58 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5FB84746E58;
 Wed, 18 Jan 2023 01:32:34 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 411FC746E06; Wed, 18 Jan 2023 01:32:34 +0100 (CET)
Message-Id: <165a4ea190af7c09832f50f02004fad82f704898.1674001242.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1674001241.git.balaton@eik.bme.hu>
References: <cover.1674001241.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/4] hw/misc/macio: Remove some single use local variables
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Wed, 18 Jan 2023 01:32:34 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Drop some local variables that could just be substituted at the single
place they were used. This makes the code shorter and simpler.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/misc/macio/macio.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 4d7223cc85..ae2a9a960d 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -53,10 +53,8 @@
  */
 static void macio_escc_legacy_setup(MacIOState *s)
 {
-    ESCCState *escc = ESCC(&s->escc);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(escc);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(&s->escc);
     MemoryRegion *escc_legacy = g_new(MemoryRegion, 1);
-    MemoryRegion *bar = &s->bar;
     int i;
     static const int maps[] = {
         0x00, 0x00, /* Command B */
@@ -80,16 +78,15 @@ static void macio_escc_legacy_setup(MacIOState *s)
         memory_region_add_subregion(escc_legacy, maps[i], port);
     }
 
-    memory_region_add_subregion(bar, 0x12000, escc_legacy);
+    memory_region_add_subregion(&s->bar, 0x12000, escc_legacy);
 }
 
 static void macio_bar_setup(MacIOState *s)
 {
-    ESCCState *escc = ESCC(&s->escc);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(escc);
-    MemoryRegion *bar = &s->bar;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(&s->escc);
+    MemoryRegion *bar = sysbus_mmio_get_region(sbd, 0);
 
-    memory_region_add_subregion(bar, 0x13000, sysbus_mmio_get_region(sbd, 0));
+    memory_region_add_subregion(&s->bar, 0x13000, bar);
     macio_escc_legacy_setup(s);
 }
 
-- 
2.30.6


