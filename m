Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D721868C91F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:08:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9eo-0005CG-I6; Mon, 06 Feb 2023 17:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9el-00050g-Bo; Mon, 06 Feb 2023 17:08:11 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9ej-0007ND-JN; Mon, 06 Feb 2023 17:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4GCBhycclOLdUY3669hxwsOM89ABiRANTe/Z/jzfKK8=; b=XkLVjLdAJVp2gXJLsmot13cU9S
 Utt8Z/CHxY8G+9zGDupMQNiqZSU/hawuqjbAgBHXeGUiT2wmCPmqhcGi9j4VZDoLQyYXha45Ubmiu
 8XwVEWYpMbQ9Y3cFGfWAxxi01vOcAuWf4jO2z9ZwImWj8iEipvW+Z5C3Gf18u4MIq7qw3eiiF0Tx0
 A6XRyt1XBznKHeYSYQ7PcpxSHhO1br47XyLMCWI4GlpJx8wQegWcOnA8GBL2v3//wOwhm7XEbs+1w
 jV1RlLpJltrOthBD3RuUWqpaqKMRv9UOLxadUn9qNqsDHodHb5S8rSq8iy/fppzYeDqWTSpjU1mkw
 +NI2RZN0C3zyQeFhyqk8nXNc9+BQJcGzG9+4A3YQm50as5SjRh22bIypi+B5viL7VHv8py6pASSPq
 GQOdX+dslN2Jv4oMNCuGdKww/RStYTlt90X0QeXF/zSR3YMrkarmeJVzXgxBLSkwpwqkR59tIiTt7
 HoRkxRilrUVfmn1ijdjsIF20Y2umqZ8tFNF/KQnSnut4h86491ZoZmQAk+zftsneJvHMtdZP7ykgd
 KoFQ7hhr41qK3VVQlr28VFuDgB29HUND/8JuGx5HlaDGx4UxXrX1xPFG3FTuzZdnrb3og3LZE/RC8
 vdONEv9Dt5O9yo77mN6N2txAalIrwyJbZ5/kJkO5A=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eA-00039N-Jc; Mon, 06 Feb 2023 22:07:38 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Mon,  6 Feb 2023 22:07:21 +0000
Message-Id: <20230206220722.125814-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
References: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 7/8] mac_nvram: Add block backend to persist NVRAM contents
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Add a way to set a backing store for the mac_nvram similar to what
spapr_nvram or mac_via PRAM already does to allow to save its contents
between runs.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <4b1605a9e484cc95f6e141f297487a070fd418ac.1675297286.git.balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
2.30.2


