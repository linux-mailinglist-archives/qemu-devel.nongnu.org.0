Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D919D67F5EF
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 09:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLgJR-0005sH-Um; Sat, 28 Jan 2023 03:11:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJM-0005rx-5P
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:44 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1pLgJK-0007pB-3J
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 03:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1s+k58HiQAUy30j+zS6PHsHeom0mydJzKEvQuFxxmGU=; b=gymUvzmYPxkBgyFRu8U6DnV0Gg
 SjSYODnICpuroQnhPrIx5Q5A1+aBWRSj0SNeiUzsb4lDlafsykgEW+AYB/y9aUBaDnJC8EowCLsnI
 du92Xn4y2qIhBRzkaR3ku2VAN4esfNi8LPRl/+xZ6iR7rfiVmUlOYeNBBER39/B6xA5+Q7N+Iu5/D
 0lo1iK5yA3htEWjGmKQ1aeddA7lqh3pRmReGLx2lHCDaUJrlxdpRs5zp27BHePXlyCTr4VE3iBQFO
 xLlknKuF7ZD778V27Fq5Xe6LJ1ColXAG9PIIsTcUPKzX9EB5Uy/Er5U+ta+tqlNFK0jWa7yLxCwad
 S/O9SaMA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pLgIQ-0039wC-16; Sat, 28 Jan 2023 08:10:50 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pLgIw-006mIC-14; Sat, 28 Jan 2023 08:11:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v9 08/58] xen-platform: allow its creation with XEN_EMULATE
 mode
Date: Sat, 28 Jan 2023 08:10:23 +0000
Message-Id: <20230128081113.1615111-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230128081113.1615111-1-dwmw2@infradead.org>
References: <20230128081113.1615111-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+e8fc867402dd322853dc+7097+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Joao Martins <joao.m.martins@oracle.com>

The only thing we need to fix to make this build is the PIO hack which
sets the BIOS memory areas to R/W v.s. R/O. Theoretically we could hook
that up to the PAM registers on the emulated PIIX, but in practice
nobody cares, so just leave it doing nothing.

Now it builds without actual Xen, move it to CONFIG_XEN_BUS to include it
in the KVM-only builds.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/xen/meson.build    |  5 ++++-
 hw/i386/xen/xen_platform.c | 39 +++++++++++++++++++++++++-------------
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index be84130300..2e64a34e16 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -2,6 +2,9 @@ i386_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-hvm.c',
   'xen-mapcache.c',
   'xen_apic.c',
-  'xen_platform.c',
   'xen_pvdevice.c',
 ))
+
+i386_ss.add(when: 'CONFIG_XEN_BUS', if_true: files(
+  'xen_platform.c',
+))
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index d601a5509d..319049d80c 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -28,9 +28,9 @@
 #include "hw/ide.h"
 #include "hw/ide/pci.h"
 #include "hw/pci/pci.h"
-#include "hw/xen/xen_common.h"
 #include "migration/vmstate.h"
-#include "hw/xen/xen-legacy-backend.h"
+#include "hw/xen/xen.h"
+#include "net/net.h"
 #include "trace.h"
 #include "sysemu/xen.h"
 #include "sysemu/block-backend.h"
@@ -38,6 +38,11 @@
 #include "qemu/module.h"
 #include "qom/object.h"
 
+#ifdef CONFIG_XEN
+#include "hw/xen/xen_common.h"
+#include "hw/xen/xen-legacy-backend.h"
+#endif
+
 //#define DEBUG_PLATFORM
 
 #ifdef DEBUG_PLATFORM
@@ -280,18 +285,26 @@ static void platform_fixed_ioport_writeb(void *opaque, uint32_t addr, uint32_t v
     PCIXenPlatformState *s = opaque;
 
     switch (addr) {
-    case 0: /* Platform flags */ {
-        hvmmem_type_t mem_type = (val & PFFLAG_ROM_LOCK) ?
-            HVMMEM_ram_ro : HVMMEM_ram_rw;
-        if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
-            DPRINTF("unable to change ro/rw state of ROM memory area!\n");
-        } else {
+    case 0: /* Platform flags */
+        if (xen_mode == XEN_EMULATE) {
+            /* XX: Use i440gx/q35 PAM setup to do this? */
             s->flags = val & PFFLAG_ROM_LOCK;
-            DPRINTF("changed ro/rw state of ROM memory area. now is %s state.\n",
-                    (mem_type == HVMMEM_ram_ro ? "ro":"rw"));
+#ifdef CONFIG_XEN
+        } else {
+            hvmmem_type_t mem_type = (val & PFFLAG_ROM_LOCK) ?
+                HVMMEM_ram_ro : HVMMEM_ram_rw;
+
+            if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
+                DPRINTF("unable to change ro/rw state of ROM memory area!\n");
+            } else {
+                s->flags = val & PFFLAG_ROM_LOCK;
+                DPRINTF("changed ro/rw state of ROM memory area. now is %s state.\n",
+                        (mem_type == HVMMEM_ram_ro ? "ro" : "rw"));
+            }
+#endif
         }
         break;
-    }
+
     case 2:
         log_writeb(s, val);
         break;
@@ -509,8 +522,8 @@ static void xen_platform_realize(PCIDevice *dev, Error **errp)
     uint8_t *pci_conf;
 
     /* Device will crash on reset if xen is not initialized */
-    if (!xen_enabled()) {
-        error_setg(errp, "xen-platform device requires the Xen accelerator");
+    if (xen_mode == XEN_DISABLED) {
+        error_setg(errp, "xen-platform device requires a Xen guest");
         return;
     }
 
-- 
2.39.0


