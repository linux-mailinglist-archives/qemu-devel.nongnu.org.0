Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD49F68724C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:28:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNR3-0005Tn-SX; Wed, 01 Feb 2023 19:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNNR1-0005Sd-2Y; Wed, 01 Feb 2023 19:26:39 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNNQx-0000PN-8x; Wed, 01 Feb 2023 19:26:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5208D74635C;
 Thu,  2 Feb 2023 01:24:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 2121B74634B; Thu,  2 Feb 2023 01:24:05 +0100 (CET)
Message-Id: <4b1605a9e484cc95f6e141f297487a070fd418ac.1675297286.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1675297286.git.balaton@eik.bme.hu>
References: <cover.1675297286.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 1/2] mac_nvram: Add block backend to persist NVRAM contents
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Thu,  2 Feb 2023 01:24:05 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, PP_MIME_FAKE_ASCII_TEXT=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add a way to set a backing store for the mac_nvram similar to what
spapr_nvram or mac_via PRAM already does to allow to save its contents
between runs.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nvram/mac_nvram.c         | 28 ++++++++++++++++++++++++++++
 include/hw/nvram/mac_nvram.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/hw/nvram/mac_nvram.c b/hw/nvram/mac_nvram.c
index 3d9ddda217..810e84f07e 100644
--- a/hw/nvram/mac_nvram.c
+++ b/hw/nvram/mac_nvram.c
@@ -24,9 +24,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/nvram/chrp_nvram.h"
 #include "hw/nvram/mac_nvram.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "sysemu/block-backend.h"
 #include "migration/vmstate.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
@@ -44,6 +47,9 @@ static void macio_nvram_writeb(void *opaque, hwaddr addr,
     addr = (addr >> s->it_shift) & (s->size - 1);
     trace_macio_nvram_write(addr, value);
     s->data[addr] = value;
+    if (s->blk) {
+        blk_pwrite(s->blk, addr, 1, &s->data[addr], 0);
+    }
 }
 
 static uint64_t macio_nvram_readb(void *opaque, hwaddr addr,
@@ -91,6 +97,27 @@ static void macio_nvram_realizefn(DeviceState *dev, Error **errp)
 
     s->data = g_malloc0(s->size);
 
+    if (s->blk) {
+        int64_t len = blk_getlength(s->blk);
+        if (len < 0) {
+            error_setg_errno(errp, -len,
+                             "could not get length of nvram backing image");
+            return;
+        } else if (len != s->size) {
+            error_setg_errno(errp, -len,
+                             "invalid size nvram backing image");
+            return;
+        }
+        if (blk_set_perm(s->blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
+                         BLK_PERM_ALL, errp) < 0) {
+            return;
+        }
+        if (blk_pread(s->blk, 0, s->size, s->data, 0) < 0) {
+            error_setg(errp, "can't read-nvram contents");
+            return;
+        }
+    }
+
     memory_region_init_io(&s->mem, OBJECT(s), &macio_nvram_ops, s,
                           "macio-nvram", s->size << s->it_shift);
     sysbus_init_mmio(d, &s->mem);
@@ -106,6 +133,7 @@ static void macio_nvram_unrealizefn(DeviceState *dev)
 static Property macio_nvram_properties[] = {
     DEFINE_PROP_UINT32("size", MacIONVRAMState, size, 0),
     DEFINE_PROP_UINT32("it_shift", MacIONVRAMState, it_shift, 0),
+    DEFINE_PROP_DRIVE("drive", MacIONVRAMState, blk),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/include/hw/nvram/mac_nvram.h b/include/hw/nvram/mac_nvram.h
index b780aca470..0c4dfaeff6 100644
--- a/include/hw/nvram/mac_nvram.h
+++ b/include/hw/nvram/mac_nvram.h
@@ -44,6 +44,7 @@ struct MacIONVRAMState {
 
     MemoryRegion mem;
     uint8_t *data;
+    BlockBackend *blk;
 };
 
 void pmac_format_nvram_partition(MacIONVRAMState *nvr, int len);
-- 
2.30.6


