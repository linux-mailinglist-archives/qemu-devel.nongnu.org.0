Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F44A78E4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:47:50 +0100 (CET)
Received: from localhost ([::1]:60626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLbZ-0002u5-7b
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:47:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFKSl-0000j0-9N
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:34:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFKSd-0007DR-0c
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643826869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=shFHqOtZMlot1MYce/edh45LVQIQqnY5ryrPaxgniYA=;
 b=hkhNnDAR1AIb2w5pv61cw1DHXytsgEbDuy5TyrDqMz5Mn2CzxQ+d3hm07KPyL5H4zcWbXH
 C3WCDVFsBJ70l7z7uTwRdy4sQi3a//rBaeZmxCxltCPfG6eq0usx6kLGy+nnIEPR1Yqsrn
 sp5hH0ez32UVagdewEcIgVWB1ZyAmAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-dnqg2AeWOF6w6E-ShlmyXw-1; Wed, 02 Feb 2022 13:34:25 -0500
X-MC-Unique: dnqg2AeWOF6w6E-ShlmyXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D0621015DA0;
 Wed,  2 Feb 2022 18:34:24 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33CA884791;
 Wed,  2 Feb 2022 18:34:22 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	shorne@gmail.com,
	richard.henderson@linaro.org
Subject: [PATCH v2] Fix %#0 misuses
Date: Wed,  2 Feb 2022 18:34:17 +0000
Message-Id: <20220202183417.116478-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
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

Replace all the '%#08' cases by '0x%08' and
also handle a '%#02'; there are some other cases mostly
in testing and a few that look like the authors have
thought about the size, that I've ignored for now.

(Note I've not managed to test most of these)

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

[1] https://lore.kernel.org/lkml/9499203f1e993872b384aabdec59ac223a8ab931.camel@perches.com/

Fixup %#
---
 chardev/baum.c          | 2 +-
 disas/alpha.c           | 2 +-
 disas/sparc.c           | 2 +-
 hw/arm/omap1.c          | 2 +-
 hw/timer/a9gtimer.c     | 4 ++--
 include/hw/arm/omap.h   | 5 +++--
 softmmu/device_tree.c   | 2 +-
 target/openrisc/disas.c | 2 +-
 8 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index 79d618e350..9a842c2bbb 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -366,7 +366,7 @@ static int baum_eat_packet(BaumChardev *baum, const uint8_t *buf, int len)
         if (!len--) \
             return 0; \
         if (*cur++ != ESC) { \
-            DPRINTF("Broken packet %#2x, tossing\n", req); \
+            DPRINTF("Broken packet 0x%02x, tossing\n", req); \
             if (timer_pending(baum->cellCount_timer)) {    \
                 timer_del(baum->cellCount_timer);     \
                 baum_cellCount_timer_cb(baum);             \
diff --git a/disas/alpha.c b/disas/alpha.c
index 3db90fa665..f218bf023a 100644
--- a/disas/alpha.c
+++ b/disas/alpha.c
@@ -1851,7 +1851,7 @@ print_insn_alpha (bfd_vma memaddr, struct disassemble_info *info)
     }
 
   /* No instruction found */
-  (*info->fprintf_func) (info->stream, ".long %#08x", insn);
+  (*info->fprintf_func) (info->stream, ".long 0x%08x", insn);
 
   return 4;
 
diff --git a/disas/sparc.c b/disas/sparc.c
index 5689533ce1..adc8438aa2 100644
--- a/disas/sparc.c
+++ b/disas/sparc.c
@@ -3231,6 +3231,6 @@ print_insn_sparc (bfd_vma memaddr, disassemble_info *info)
     }
 
   info->insn_type = dis_noninsn;        /* Mark as non-valid instruction.  */
-  (*info->fprintf_func) (stream, ".long %#08lx", insn);
+  (*info->fprintf_func) (stream, ".long 0x%08lx", insn);
   return sizeof (buffer);
 }
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 9852c2a07e..c9e0ae87b1 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -42,7 +42,7 @@
 
 static inline void omap_log_badwidth(const char *funcname, hwaddr addr, int sz)
 {
-    qemu_log_mask(LOG_GUEST_ERROR, "%s: %d-bit register %#08" HWADDR_PRIx "\n",
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: %d-bit register 0x%08" HWADDR_PRIx "\n",
                   funcname, 8 * sz, addr);
 }
 
diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 7233068a37..2ea51a137e 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -169,7 +169,7 @@ static uint64_t a9_gtimer_read(void *opaque, hwaddr addr, unsigned size)
         return 0;
     }
 
-    DB_PRINT("addr:%#x data:%#08" PRIx64 "\n", (unsigned)addr, ret);
+    DB_PRINT("addr:0x%x data:0x%08" PRIx64 "\n", (unsigned)addr, ret);
     return ret;
 }
 
@@ -180,7 +180,7 @@ static void a9_gtimer_write(void *opaque, hwaddr addr, uint64_t value,
     A9GTimerState *s = gtb->parent;
     int shift = 0;
 
-    DB_PRINT("addr:%#x data:%#08" PRIx64 "\n", (unsigned)addr, value);
+    DB_PRINT("addr:0x%x data:0x%08" PRIx64 "\n", (unsigned)addr, value);
 
     switch (addr) {
     case R_COUNTER_HI:
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index ff6a173f8a..8b1c2365d5 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -1003,10 +1003,11 @@ void omap_badwidth_write32(void *opaque, hwaddr addr,
 void omap_mpu_wakeup(void *opaque, int irq, int req);
 
 # define OMAP_BAD_REG(paddr)		\
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad register %#08"HWADDR_PRIx"\n", \
+        qemu_log_mask(LOG_GUEST_ERROR,  \
+                      "%s: Bad register 0x%08"HWADDR_PRIx"\n", \
                       __func__, paddr)
 # define OMAP_RO_REG(paddr)		\
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Read-only register %#08" \
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Read-only register 0x%08" \
                                        HWADDR_PRIx "\n", \
                       __func__, paddr)
 
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 6ca3fad285..338e1c03fd 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -369,7 +369,7 @@ int qemu_fdt_setprop_cell(void *fdt, const char *node_path,
 
     r = fdt_setprop_cell(fdt, findnode_nofail(fdt, node_path), property, val);
     if (r < 0) {
-        error_report("%s: Couldn't set %s/%s = %#08x: %s", __func__,
+        error_report("%s: Couldn't set %s/%s = 0x%08x: %s", __func__,
                      node_path, property, val, fdt_strerror(r));
         exit(1);
     }
diff --git a/target/openrisc/disas.c b/target/openrisc/disas.c
index dc025bd64d..72f1476a13 100644
--- a/target/openrisc/disas.c
+++ b/target/openrisc/disas.c
@@ -45,7 +45,7 @@ int print_insn_or1k(bfd_vma addr, disassemble_info *info)
     insn = bfd_getb32(buffer);
 
     if (!decode(info, insn)) {
-        output(".long", "%#08x", insn);
+        output(".long", "0x%08x", insn);
     }
     return 4;
 }
-- 
2.34.1


