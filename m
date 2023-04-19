Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DCF6E7DFD
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 17:18:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp9YZ-0002Dk-Rt; Wed, 19 Apr 2023 11:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9YW-0002CV-LW
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 11:17:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9YU-0001yd-KP
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 11:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1qywIM3PSPm4u0V0yB57cICscdrKSPEJAz0977NsRcg=; b=AdmurUTSxQxegMZa7tXh/ebz25
 a4ON4Br9ZkB79dhpjCMuwGk+pbMp32lbhCVP0pcVYxzwkb/KQGidZWxi5rXrcFVYS4oLgfimXW/Ud
 fg7pYy7ppeqKp+Dg0suc6+aPNCxQFyk+f/wVwnu+S3BNO29KBr+2lk8sX2+y/EXF4aNKRGjXHK6l3
 mkntRkXY5JjFiGgacBUP21Pennb6f5bvIRDN61/0jXjh4phQcDz9HwFGFv4sOIvQqT2D+jcBnpTfH
 M8fFh4DkoP0MkGiaTqBbP9I9eNRtX8gShCBkzRvvpIgH2p3mwmp0dThM7NM2fJv2p7cJ5seWpBJql
 UpOQMm0SfkSnoe0Ij/OO3QPBmpZEA0g5P38kFzlPovQEbc2bAsxGmwamkFbXN6M3knUinPHQQ8ycW
 e5e5fV6+46ksYmQMtUfNsf5FLuBNszdF6Zz8jfOD0EgovttAsx8RbWkH3mEXH7KGMLkoZuOr3qhvo
 kY//PY5OkGGAXWjc5STcVnOPJV1TuLoVgi8eR/om0K/hvoLk6NZ2splLuiuVGbKY+bInTQL+mvIvT
 k7YInIdS2Hlo1zVDr/PvYo10YVftLfDXnX5EhE3eCQxGnboVr/q1osc6piGYjvChZkcgHCUaD4KZO
 DraTDpmU703mwZR2/qcNvTZ0VlWkqBEOus7VauJiQ=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pp9XZ-00041C-PA; Wed, 19 Apr 2023 16:16:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 19 Apr 2023 16:16:52 +0100
Message-Id: <20230419151652.362717-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/3] softmmu/ioport.c: make MemoryRegionPortioList owner of
 portio_list MemoryRegions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Currently when portio_list MemoryRegions are freed using portio_list_destroy() the RCU
thread segfaults generating a backtrace similar to that below:

    #0 0x5555599a34b6 in phys_section_destroy ../softmmu/physmem.c:996
    #1 0x5555599a37a3 in phys_sections_free ../softmmu/physmem.c:1011
    #2 0x5555599b24aa in address_space_dispatch_free ../softmmu/physmem.c:2430
    #3 0x55555996a283 in flatview_destroy ../softmmu/memory.c:292
    #4 0x55555a2cb9fb in call_rcu_thread ../util/rcu.c:284
    #5 0x55555a29b71d in qemu_thread_start ../util/qemu-thread-posix.c:541
    #6 0x7ffff4a0cea6 in start_thread nptl/pthread_create.c:477
    #7 0x7ffff492ca2e in __clone (/lib/x86_64-linux-gnu/libc.so.6+0xfca2e)

The problem here is that portio_list_destroy() unparents the portio_list MemoryRegions
causing them to be freed immediately, however the flatview still has a reference to the
MemoryRegion and so causes a use-after-free segfault when the RCU thread next updates
the flatview.

Solve the lifetime issue by making MemoryRegionPortioList the owner of the portio_list
MemoryRegions, and then reparenting them to the portio_list owner. This ensures that they
can be accessed as QOM childen via the portio_list owner, yet the MemoryRegionPortioList
owns the refcount.

Update portio_list_destroy() to unparent the MemoryRegion from the portio_list owner and
then add a finalize() method to MemoryRegionPortioList, so that the portio_list
MemoryRegions remain allocated until flatview_destroy() removes the final refcount upon
the next flatview update.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 softmmu/ioport.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index 238625a36f..d89c659662 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -26,6 +26,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/rcu.h"
 #include "cpu.h"
 #include "exec/ioport.h"
 #include "exec/memory.h"
@@ -152,8 +153,7 @@ void portio_list_destroy(PortioList *piolist)
     for (i = 0; i < piolist->nr; ++i) {
         mrpio = container_of(piolist->regions[i], MemoryRegionPortioList, mr);
         object_unparent(OBJECT(&mrpio->mr));
-        g_free(mrpio->ports);
-        g_free(mrpio);
+        object_unref(mrpio);
     }
     g_free(piolist->regions);
 }
@@ -230,6 +230,8 @@ static void portio_list_add_1(PortioList *piolist,
                               unsigned off_low, unsigned off_high)
 {
     MemoryRegionPortioList *mrpio;
+    Object *owner;
+    char *name;
     unsigned i;
 
     /* Copy the sub-list and null-terminate it.  */
@@ -246,8 +248,25 @@ static void portio_list_add_1(PortioList *piolist,
         mrpio->ports[i].base = start + off_low;
     }
 
-    memory_region_init_io(&mrpio->mr, piolist->owner, &portio_ops, mrpio,
+    /*
+     * The MemoryRegion owner is the MemoryRegionPortioList since that manages
+     * the lifecycle via the refcount
+     */
+    memory_region_init_io(&mrpio->mr, OBJECT(mrpio), &portio_ops, mrpio,
                           piolist->name, off_high - off_low);
+
+    /* Reparent the MemoryRegion to the piolist owner */
+    object_ref(&mrpio->mr);
+    object_unparent(OBJECT(&mrpio->mr));
+    if (!piolist->owner) {
+        owner = container_get(qdev_get_machine(), "/unattached");
+    } else {
+        owner = piolist->owner;
+    }
+    name = g_strdup_printf("%s[*]", piolist->name);
+    object_property_add_child(owner, name, OBJECT(&mrpio->mr));
+    g_free(name);
+
     if (piolist->flush_coalesced_mmio) {
         memory_region_set_flush_coalesced(&mrpio->mr);
     }
@@ -305,10 +324,19 @@ void portio_list_del(PortioList *piolist)
     }
 }
 
+static void memory_region_portio_list_finalize(Object *obj)
+{
+    MemoryRegionPortioList *mrpio = MEMORY_REGION_PORTIO_LIST(obj);
+
+    object_unref(&mrpio->mr);
+    g_free(mrpio->ports);
+}
+
 static const TypeInfo memory_region_portio_list_info = {
     .parent             = TYPE_OBJECT,
     .name               = TYPE_MEMORY_REGION_PORTIO_LIST,
     .instance_size      = sizeof(MemoryRegionPortioList),
+    .instance_finalize  = memory_region_portio_list_finalize,
 };
 
 static void ioport_register_types(void)
-- 
2.30.2


