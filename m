Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED0842E1B2
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 20:54:44 +0200 (CEST)
Received: from localhost ([::1]:45638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb5sI-0002hK-TS
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 14:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mb5qj-0001dr-5u
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 14:53:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mb5qf-0007hL-4a
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 14:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634237578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1C20tJ0MbN+fAcF4BydAUBRGas28OxC6MKlxWIkn3EU=;
 b=WNfdrz8L79SUsQ2S3djEjA059Bg0FurmckCmi8Hr+Y/35tHskx87h18zPQWc75oKgSYCAW
 7zFmngRUT3hkl3j7jym85unSKkNuHqwYyLzlD8sntoWMxfTQBu+foOeq/h4LRAY0gVzYBw
 LHb+x1yXnijQcVX1Bp2ZbgrfNO2QP9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-gz-apRbEOKeyCbOIbImepg-1; Thu, 14 Oct 2021 14:52:54 -0400
X-MC-Unique: gz-apRbEOKeyCbOIbImepg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEE36107B0EF;
 Thu, 14 Oct 2021 18:52:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.192.248])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BBAB60CC4;
 Thu, 14 Oct 2021 18:52:50 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	eblake@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH] Fix %#08 misuses
Date: Thu, 14 Oct 2021 19:52:45 +0100
Message-Id: <20211014185245.69803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, alistair.francis@wdc.com,
 richard.henderson@linaro.org, shorne@gmail.com, atar4qemu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Joe Perches pointed out on lkml [1] that the format special %# (which
adds 0x) is included in the character count, i.e.:

  printf("0: %#08x\n0: %#08x\n", 0xabcdef01,1);
gives:
0: 0xabcdef01
0: 0x000001

rather than padding to the expected 8 data characters.
It looks like we use '%#.8x' in some places and that
seems like it works:

  printf(".: %#.8x\n.: %#.8x\n", 0xabcdef01,1);
.: 0xabcdef01
.: 0x00000001

Replace all the '%#08' cases by '%#.8' ; I've not
attacked the other lengths yet.

Although I'm tempted to think that perhaps we should just
prefer '0x%08' which seems clearer.

(Note I've not managed to test most of these)

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

[1] https://lore.kernel.org/lkml/9499203f1e993872b384aabdec59ac223a8ab931.camel@perches.com/
---
 disas/alpha.c           | 2 +-
 disas/sparc.c           | 2 +-
 hw/arm/omap1.c          | 2 +-
 hw/timer/a9gtimer.c     | 4 ++--
 include/hw/arm/omap.h   | 4 ++--
 softmmu/device_tree.c   | 2 +-
 target/openrisc/disas.c | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/disas/alpha.c b/disas/alpha.c
index 3db90fa665..6da5c473d8 100644
--- a/disas/alpha.c
+++ b/disas/alpha.c
@@ -1851,7 +1851,7 @@ print_insn_alpha (bfd_vma memaddr, struct disassemble_info *info)
     }
 
   /* No instruction found */
-  (*info->fprintf_func) (info->stream, ".long %#08x", insn);
+  (*info->fprintf_func) (info->stream, ".long %#.8x", insn);
 
   return 4;
 
diff --git a/disas/sparc.c b/disas/sparc.c
index 5689533ce1..9f1160ab1c 100644
--- a/disas/sparc.c
+++ b/disas/sparc.c
@@ -3231,6 +3231,6 @@ print_insn_sparc (bfd_vma memaddr, disassemble_info *info)
     }
 
   info->insn_type = dis_noninsn;        /* Mark as non-valid instruction.  */
-  (*info->fprintf_func) (stream, ".long %#08lx", insn);
+  (*info->fprintf_func) (stream, ".long %#.8lx", insn);
   return sizeof (buffer);
 }
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 180d3788f8..cff8ecb7d6 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -42,7 +42,7 @@
 
 static inline void omap_log_badwidth(const char *funcname, hwaddr addr, int sz)
 {
-    qemu_log_mask(LOG_GUEST_ERROR, "%s: %d-bit register %#08" HWADDR_PRIx "\n",
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: %d-bit register %#.8" HWADDR_PRIx "\n",
                   funcname, 8 * sz, addr);
 }
 
diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 7233068a37..c53edd8b44 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -169,7 +169,7 @@ static uint64_t a9_gtimer_read(void *opaque, hwaddr addr, unsigned size)
         return 0;
     }
 
-    DB_PRINT("addr:%#x data:%#08" PRIx64 "\n", (unsigned)addr, ret);
+    DB_PRINT("addr:%#x data:%#.8" PRIx64 "\n", (unsigned)addr, ret);
     return ret;
 }
 
@@ -180,7 +180,7 @@ static void a9_gtimer_write(void *opaque, hwaddr addr, uint64_t value,
     A9GTimerState *s = gtb->parent;
     int shift = 0;
 
-    DB_PRINT("addr:%#x data:%#08" PRIx64 "\n", (unsigned)addr, value);
+    DB_PRINT("addr:%#x data:%#.8" PRIx64 "\n", (unsigned)addr, value);
 
     switch (addr) {
     case R_COUNTER_HI:
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index ff6a173f8a..47616bbba3 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -1003,10 +1003,10 @@ void omap_badwidth_write32(void *opaque, hwaddr addr,
 void omap_mpu_wakeup(void *opaque, int irq, int req);
 
 # define OMAP_BAD_REG(paddr)		\
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad register %#08"HWADDR_PRIx"\n", \
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad register %#.8"HWADDR_PRIx"\n", \
                       __func__, paddr)
 # define OMAP_RO_REG(paddr)		\
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Read-only register %#08" \
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Read-only register %#.8" \
                                        HWADDR_PRIx "\n", \
                       __func__, paddr)
 
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index b621f63fba..bd271ab66e 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -367,7 +367,7 @@ int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
 
     r = fdt_setprop_cell(fdt, findnode_nofail(fdt, node_path), property, val);
     if (r < 0) {
-        error_report("%s: Couldn't set %s/%s = %#08x: %s", __func__,
+        error_report("%s: Couldn't set %s/%s = %#.8x: %s", __func__,
                      node_path, property, val, fdt_strerror(r));
         exit(1);
     }
diff --git a/target/openrisc/disas.c b/target/openrisc/disas.c
index dc025bd64d..024f243a45 100644
--- a/target/openrisc/disas.c
+++ b/target/openrisc/disas.c
@@ -45,7 +45,7 @@ int print_insn_or1k(bfd_vma addr, disassemble_info *info)
     insn = bfd_getb32(buffer);
 
     if (!decode(info, insn)) {
-        output(".long", "%#08x", insn);
+        output(".long", "%#.8x", insn);
     }
     return 4;
 }
-- 
2.31.1


