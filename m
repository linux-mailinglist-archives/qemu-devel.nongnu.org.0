Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C589651E36
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 10:58:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7YaR-0000Xi-Pd; Tue, 20 Dec 2022 04:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaO-0000Vp-7L
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7YaK-0006T3-Cp
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671527211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/qJzzvnyiQP8s7Ve6nFldPFjX4qf8pjPtNf8Vja4uA=;
 b=by48zxxYXsZdnSkPb7+9exy8VVZWtedAXApXPpEb6GBoOdZzvIp1Uhu+dy05vOAq8IBjE6
 wXoUw6BLeIGmJFOqfArAJFWAfMNVbTWUuo4hHUsmVuQrxgYHw2hYzMEv18yhQRdZAIhapY
 joL/nYAapzujJ/vdEpodJ/SceS0k9BA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-xo37eaSkPayCj_73uRcnaw-1; Tue, 20 Dec 2022 04:06:48 -0500
X-MC-Unique: xo37eaSkPayCj_73uRcnaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19B7E87A9E1;
 Tue, 20 Dec 2022 09:06:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3647C16027;
 Tue, 20 Dec 2022 09:06:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7B9A521E6939; Tue, 20 Dec 2022 10:06:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v3 05/18] ui/spice: Require spice-server >= 0.14.0
Date: Tue, 20 Dec 2022 10:06:32 +0100
Message-Id: <20221220090645.2844881-6-armbru@redhat.com>
In-Reply-To: <20221220090645.2844881-1-armbru@redhat.com>
References: <20221220090645.2844881-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Version 0.14.0 is now old enough to have made it into the major
distributions:

     Debian 11: 0.14.3
     RHEL-8: 0.14.3
     FreeBSD (ports): 0.15.0
     Fedora 35: 0.15.0
     Ubuntu 20.04: 0.14.2
     OpenSUSE Leap 15.3: 0.14.3

Requiring it lets us drop a number of version checks.  The next commit
will clean up some more.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build                | 2 +-
 hw/display/qxl.h           | 2 --
 include/ui/qemu-spice.h    | 6 +-----
 include/ui/spice-display.h | 2 --
 chardev/spice.c            | 2 --
 hw/display/qxl.c           | 7 +------
 6 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/meson.build b/meson.build
index 9f27c5cea3..31705f7fe9 100644
--- a/meson.build
+++ b/meson.build
@@ -746,7 +746,7 @@ if not get_option('spice_protocol').auto() or have_system
 endif
 spice = not_found
 if not get_option('spice').auto() or have_system
-  spice = dependency('spice-server', version: '>=0.12.5',
+  spice = dependency('spice-server', version: '>=0.14.0',
                      required: get_option('spice'),
                      method: 'pkg-config', kwargs: static_kwargs)
 endif
diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index 7894bd5134..5bec25cdd3 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -100,9 +100,7 @@ struct PCIQXLDevice {
     QXLModes           *modes;
     uint32_t           rom_size;
     MemoryRegion       rom_bar;
-#if SPICE_SERVER_VERSION >= 0x000c06 /* release 0.12.6 */
     uint16_t           max_outputs;
-#endif
 
     /* vram pci bar */
     uint64_t           vram_size;
diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index 21fe195e18..a7a1890b3f 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -34,13 +34,9 @@ int qemu_spice_add_display_interface(QXLInstance *qxlin, QemuConsole *con);
 int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
                             const char *subject);
 
-#if !defined(SPICE_SERVER_VERSION) || (SPICE_SERVER_VERSION < 0xc06)
-#define SPICE_NEEDS_SET_MM_TIME 1
-#else
 #define SPICE_NEEDS_SET_MM_TIME 0
-#endif
 
-#if defined(SPICE_SERVER_VERSION) && (SPICE_SERVER_VERSION >= 0x000f00)
+#if SPICE_SERVER_VERSION >= 0x000f00 /* release 0.15.0 */
 #define SPICE_HAS_ATTACHED_WORKER 1
 #else
 #define SPICE_HAS_ATTACHED_WORKER 0
diff --git a/include/ui/spice-display.h b/include/ui/spice-display.h
index e271e011da..5aa13664d6 100644
--- a/include/ui/spice-display.h
+++ b/include/ui/spice-display.h
@@ -28,11 +28,9 @@
 #include "ui/console.h"
 
 #if defined(CONFIG_OPENGL) && defined(CONFIG_GBM)
-# if SPICE_SERVER_VERSION >= 0x000d01 /* release 0.13.1 */
 #  define HAVE_SPICE_GL 1
 #  include "ui/egl-helpers.h"
 #  include "ui/egl-context.h"
-# endif
 #endif
 
 #define NUM_MEMSLOTS 8
diff --git a/chardev/spice.c b/chardev/spice.c
index bbffef4913..e843d961a7 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -98,9 +98,7 @@ static SpiceCharDeviceInterface vmc_interface = {
     .write              = vmc_write,
     .read               = vmc_read,
     .event              = vmc_event,
-#if SPICE_SERVER_VERSION >= 0x000c06
     .flags              = SPICE_CHAR_DEVICE_NOTIFY_WRITABLE,
-#endif
 };
 
 
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 6772849dec..ddca611804 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -260,8 +260,7 @@ static void qxl_spice_monitors_config_async(PCIQXLDevice *qxl, int replay)
                     QXL_COOKIE_TYPE_POST_LOAD_MONITORS_CONFIG,
                     0));
     } else {
-/* >= release 0.12.6, < release 0.14.2 */
-#if SPICE_SERVER_VERSION >= 0x000c06 && SPICE_SERVER_VERSION < 0x000e02
+#if SPICE_SERVER_VERSION < 0x000e02 /* release 0.14.2 */
         if (qxl->max_outputs) {
             spice_qxl_set_max_monitors(&qxl->ssd.qxl, qxl->max_outputs);
         }
@@ -1089,12 +1088,10 @@ static int interface_client_monitors_config(QXLInstance *sin,
         return 1;
     }
 
-#if SPICE_SERVER_VERSION >= 0x000c06 /* release 0.12.6 */
     /* limit number of outputs based on setting limit */
     if (qxl->max_outputs && qxl->max_outputs <= max_outputs) {
         max_outputs = qxl->max_outputs;
     }
-#endif
 
     config_changed = qxl_rom_monitors_config_changed(rom,
                                                      monitors_config,
@@ -2487,9 +2484,7 @@ static Property qxl_properties[] = {
         DEFINE_PROP_UINT32("vram64_size_mb", PCIQXLDevice, vram_size_mb, -1),
         DEFINE_PROP_UINT32("vgamem_mb", PCIQXLDevice, vgamem_size_mb, 16),
         DEFINE_PROP_INT32("surfaces", PCIQXLDevice, ssd.num_surfaces, 1024),
-#if SPICE_SERVER_VERSION >= 0x000c06 /* release 0.12.6 */
         DEFINE_PROP_UINT16("max_outputs", PCIQXLDevice, max_outputs, 0),
-#endif
         DEFINE_PROP_UINT32("xres", PCIQXLDevice, xres, 0),
         DEFINE_PROP_UINT32("yres", PCIQXLDevice, yres, 0),
         DEFINE_PROP_BOOL("global-vmstate", PCIQXLDevice, vga.global_vmstate, false),
-- 
2.38.1


