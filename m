Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6862B2CB7BC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:52:36 +0100 (CET)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNsJ-00046M-Dm
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCh-0003JS-7c
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCJ-0003iN-3c
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rb20XKOkJc7zfvAvncCe6o2RFXtycVYClMRrjGxVaY=;
 b=LlxbAiLa9SvLD3OI4HbwbbwjXf/UvDhe+qmhGW1q8pESaAXzFSBRgqY2fnIgiatsG0gTwD
 ehAJRwTmIlMJ1IqmxBr2ftS25INbcMC9EiU/H6MMl7cy5UJBBd/mRV3RcAit2d/4xKRSXR
 GzK1lNeqCFtK16mUIOtEQvEK8YB20b4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-fC6eiBX6MOSL-PLNIcCEvw-1; Wed, 02 Dec 2020 03:09:08 -0500
X-MC-Unique: fC6eiBX6MOSL-PLNIcCEvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D09461074641
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF411346F
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:07 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 049/113] make ram_size local to vl.c
Date: Wed,  2 Dec 2020 03:07:45 -0500
Message-Id: <20201202080849.4125477-50-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the machine properties for the leftovers too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/generic-loader.c   |  3 ++-
 hw/core/numa.c             | 10 +++++-----
 hw/virtio/virtio-balloon.c |  3 ++-
 include/exec/cpu-common.h  |  2 --
 monitor/qmp-cmds.c         |  3 ++-
 softmmu/vl.c               |  2 +-
 6 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
index a242c076f6..2b2a7b5e9a 100644
--- a/hw/core/generic-loader.c
+++ b/hw/core/generic-loader.c
@@ -35,6 +35,7 @@
 #include "hw/sysbus.h"
 #include "sysemu/dma.h"
 #include "sysemu/reset.h"
+#include "hw/boards.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -154,7 +155,7 @@ static void generic_loader_realize(DeviceState *dev, Error **errp)
 
         if (size < 0 || s->force_raw) {
             /* Default to the maximum size being the machine's ram size */
-            size = load_image_targphys_as(s->file, s->addr, ram_size, as);
+            size = load_image_targphys_as(s->file, s->addr, current_machine->ram_size, as);
         } else {
             s->addr = entry;
         }
diff --git a/hw/core/numa.c b/hw/core/numa.c
index 7c4dd4e68e..68cee65f61 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -642,7 +642,7 @@ void numa_complete_configuration(MachineState *ms)
 
     /*
      * If memory hotplug is enabled (slot > 0) or memory devices are enabled
-     * (ms->maxram_size > ram_size) but without '-numa' options explicitly on
+     * (ms->maxram_size > ms->ram_size) but without '-numa' options explicitly on
      * CLI, guests will break.
      *
      *   Windows: won't enable memory hotplug without SRAT table at all
@@ -663,7 +663,7 @@ void numa_complete_configuration(MachineState *ms)
          mc->auto_enable_numa)) {
             NumaNodeOptions node = { };
             parse_numa_node(ms, &node, &error_abort);
-            numa_info[0].node_mem = ram_size;
+            numa_info[0].node_mem = ms->ram_size;
     }
 
     assert(max_numa_nodeid <= MAX_NODES);
@@ -687,10 +687,10 @@ void numa_complete_configuration(MachineState *ms)
         for (i = 0; i < ms->numa_state->num_nodes; i++) {
             numa_total += numa_info[i].node_mem;
         }
-        if (numa_total != ram_size) {
+        if (numa_total != ms->ram_size) {
             error_report("total memory for NUMA nodes (0x%" PRIx64 ")"
                          " should equal RAM size (0x" RAM_ADDR_FMT ")",
-                         numa_total, ram_size);
+                         numa_total, ms->ram_size);
             exit(1);
         }
 
@@ -702,7 +702,7 @@ void numa_complete_configuration(MachineState *ms)
             }
             ms->ram = g_new(MemoryRegion, 1);
             memory_region_init(ms->ram, OBJECT(ms), mc->default_ram_id,
-                               ram_size);
+                               ms->ram_size);
             numa_init_memdev_container(ms, ms->ram);
         }
         /* QEMU needs at least all unique node pair distances to build
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index b22b5beda3..e83017c02d 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -20,6 +20,7 @@
 #include "hw/virtio/virtio.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/qdev-properties.h"
+#include "hw/boards.h"
 #include "sysemu/balloon.h"
 #include "hw/virtio/virtio-balloon.h"
 #include "exec/address-spaces.h"
@@ -748,7 +749,7 @@ static int build_dimm_list(Object *obj, void *opaque)
 static ram_addr_t get_current_ram_size(void)
 {
     GSList *list = NULL, *item;
-    ram_addr_t size = ram_size;
+    ram_addr_t size = current_machine->ram_size;
 
     build_dimm_list(qdev_get_machine(), &list);
     for (item = list; item; item = g_slist_next(item)) {
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 19805ed6db..bd5e15dd7d 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -42,8 +42,6 @@ typedef uintptr_t ram_addr_t;
 #  define RAM_ADDR_FMT "%" PRIxPTR
 #endif
 
-extern ram_addr_t ram_size;
-
 /* memory API */
 
 void qemu_ram_remap(ram_addr_t addr, ram_addr_t length);
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index a08143b323..6299c0c8c7 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -392,8 +392,9 @@ ACPIOSTInfoList *qmp_query_acpi_ospm_status(Error **errp)
 MemoryInfo *qmp_query_memory_size_summary(Error **errp)
 {
     MemoryInfo *mem_info = g_malloc0(sizeof(MemoryInfo));
+    MachineState *ms = MACHINE(qdev_get_machine());
 
-    mem_info->base_memory = ram_size;
+    mem_info->base_memory = ms->ram_size;
 
     mem_info->plugged_memory = get_plugged_memory_size();
     mem_info->has_plugged_memory =
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 2b82e6f5cd..3819a4abf2 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -122,7 +122,7 @@ static int data_dir_idx;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 int display_opengl;
 const char* keyboard_layout = NULL;
-ram_addr_t ram_size;
+static ram_addr_t ram_size;
 bool enable_mlock = false;
 bool enable_cpu_pm = false;
 int nb_nics;
-- 
2.26.2



