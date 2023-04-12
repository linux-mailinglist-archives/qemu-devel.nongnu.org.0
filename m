Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965A46DFB77
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 18:36:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmdRQ-00064V-6D; Wed, 12 Apr 2023 12:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmdR9-00064C-6V
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 12:35:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pmdR6-0007Fv-SX
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 12:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681317307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2jD4H5gPXnaAqY8DUO1QMGzsP2+rnnVc7YftHAxjNAE=;
 b=BUsEwJOwinkAFJO5dXkSSHJv8pI87Q2b9fGAGDoGYsIZXX20+kj7yEpqFPO7+zrLUDp9uR
 x4Vx557hWxWH/A7C0ORxGQGLNI/Kvxxopb+e4mm5s+VC/jw4Z73+RGthcNkaU27rF8I5bm
 7upKJfi5+IPBjpXIojArNeEGCUqDqvk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-DOU_Or9LPdqe3Of3O_5ONQ-1; Wed, 12 Apr 2023 12:35:05 -0400
X-MC-Unique: DOU_Or9LPdqe3Of3O_5ONQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D2BA889058;
 Wed, 12 Apr 2023 16:35:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8626340C83A9;
 Wed, 12 Apr 2023 16:35:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.1] hw/display: Compile vga.c as target-independent code
Date: Wed, 12 Apr 2023 18:35:01 +0200
Message-Id: <20230412163501.36770-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The target checks here are only during the initialization, so they
are not performance critical. We can switch these to runtime checks
to avoid that we have to compile this file multiple times during
the build, and make the code ready for an universal build one day.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/vga.c       | 31 ++++++++++++++++++++++---------
 hw/display/meson.build |  2 +-
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index 7a5fdff649..37557c3442 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -26,7 +26,9 @@
 #include "qemu/units.h"
 #include "sysemu/reset.h"
 #include "qapi/error.h"
+#include "hw/core/cpu.h"
 #include "hw/display/vga.h"
+#include "hw/i386/x86.h"
 #include "hw/pci/pci.h"
 #include "vga_int.h"
 #include "vga_regs.h"
@@ -2244,11 +2246,8 @@ bool vga_common_init(VGACommonState *s, Object *obj, Error **errp)
      * into a device attribute set by the machine/platform to remove
      * all target endian dependencies from this file.
      */
-#if TARGET_BIG_ENDIAN
-    s->default_endian_fb = true;
-#else
-    s->default_endian_fb = false;
-#endif
+    s->default_endian_fb = target_words_bigendian();
+
     vga_dirty_log_start(s);
 
     return true;
@@ -2263,11 +2262,15 @@ static const MemoryRegionPortio vga_portio_list[] = {
     PORTIO_END_OF_LIST(),
 };
 
-static const MemoryRegionPortio vbe_portio_list[] = {
+static const MemoryRegionPortio vbe_portio_list_x86[] = {
     { 0, 1, 2, .read = vbe_ioport_read_index, .write = vbe_ioport_write_index },
-# ifdef TARGET_I386
     { 1, 1, 2, .read = vbe_ioport_read_data, .write = vbe_ioport_write_data },
-# endif
+    { 2, 1, 2, .read = vbe_ioport_read_data, .write = vbe_ioport_write_data },
+    PORTIO_END_OF_LIST(),
+};
+
+static const MemoryRegionPortio vbe_portio_list_no_x86[] = {
+    { 0, 1, 2, .read = vbe_ioport_read_index, .write = vbe_ioport_write_index },
     { 2, 1, 2, .read = vbe_ioport_read_data, .write = vbe_ioport_write_data },
     PORTIO_END_OF_LIST(),
 };
@@ -2278,9 +2281,19 @@ MemoryRegion *vga_init_io(VGACommonState *s, Object *obj,
                           const MemoryRegionPortio **vbe_ports)
 {
     MemoryRegion *vga_mem;
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    /*
+     * We unfortunately need two VBE lists since non-x86 machines might
+     * not be able to do 16-bit accesses at unaligned addresses (0x1cf)
+     */
+    if (object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
+        *vbe_ports = vbe_portio_list_x86;
+    } else {
+        *vbe_ports = vbe_portio_list_no_x86;
+    }
 
     *vga_ports = vga_portio_list;
-    *vbe_ports = vbe_portio_list;
 
     vga_mem = g_malloc(sizeof(*vga_mem));
     memory_region_init_io(vga_mem, obj, &vga_mem_ops, s,
diff --git a/hw/display/meson.build b/hw/display/meson.build
index 4191694380..17165bd536 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -36,7 +36,7 @@ softmmu_ss.add(when: 'CONFIG_CG3', if_true: files('cg3.c'))
 softmmu_ss.add(when: 'CONFIG_MACFB', if_true: files('macfb.c'))
 softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
 
-specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
+softmmu_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
 
 if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
     config_all_devices.has_key('CONFIG_VGA_PCI') or
-- 
2.31.1


