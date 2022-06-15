Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6A54C691
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 12:56:56 +0200 (CEST)
Received: from localhost ([::1]:60626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Qhj-0006Mb-Cl
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 06:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1QdV-0003DC-Ad
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:52:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1QdT-0001zP-A6
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:52:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655290350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SqACr8XAZqnnni/I56xuXU/IjF4pXbLnsf3r9TfaUPo=;
 b=gGgo6P7zQFj80KaRE6d5OSAKl147yG1r0pRR9L52v5t+nJ/SJPpUXrCTmKhIlGRMya0JwV
 xQGF41EdBP4+Vzw7lTm6hPUX6IEBr4P2AE/TXy+7v/gNBI1KrO4ezuwb3V/rrl2+Mm8DGy
 4Hq++dWHy1+rY6v9ot5MpdGFN1mZDAs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-o_j1E6iHPHekaLchkcSDIw-1; Wed, 15 Jun 2022 06:52:27 -0400
X-MC-Unique: o_j1E6iHPHekaLchkcSDIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 254613831C46;
 Wed, 15 Jun 2022 10:52:27 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 653A71131D;
 Wed, 15 Jun 2022 10:52:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 3/4] ui: find icons using qemu_find_file
Date: Wed, 15 Jun 2022 11:52:11 +0100
Message-Id: <20220615105212.780256-4-berrange@redhat.com>
In-Reply-To: <20220615105212.780256-1-berrange@redhat.com>
References: <20220615105212.780256-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SDL/GTK/Cocoa UIs currently fail to load icons when run from the
build directory as get_resource returns a bogus path.

To address this we first re-arrange the ui/icons sub-directory
so that its layout reflects the contents that will be installed.

Then we introduce QEMU_FILE_TYPE_ICON to qemu_find_file such
that it can locate icons from the build dir.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 configure                                     |   1 +
 docs/conf.py                                  |   4 +--
 include/qemu/datadir.h                        |   2 ++
 softmmu/datadir.c                             |  12 +++++++-
 softmmu/trace-events                          |   2 +-
 ui/cocoa.m                                    |   3 +-
 ui/gtk.c                                      |   3 +-
 .../apps/qemu.png}                            | Bin
 .../{qemu_16x16.png => 16x16/apps/qemu.png}   | Bin
 .../{qemu_24x24.png => 24x24/apps/qemu.png}   | Bin
 .../apps/qemu.png}                            | Bin
 .../{qemu_32x32.bmp => 32x32/apps/qemu.bmp}   | Bin
 .../{qemu_32x32.png => 32x32/apps/qemu.png}   | Bin
 .../{qemu_48x48.png => 48x48/apps/qemu.png}   | Bin
 .../apps/qemu.png}                            | Bin
 .../{qemu_64x64.png => 64x64/apps/qemu.png}   | Bin
 ui/icons/meson.build                          |  27 ++++++++++++------
 ui/icons/{ => scalable/apps}/qemu.svg         |   0
 ui/sdl2.c                                     |   5 ++--
 19 files changed, 43 insertions(+), 16 deletions(-)
 rename ui/icons/{qemu_128x128.png => 128x128/apps/qemu.png} (100%)
 rename ui/icons/{qemu_16x16.png => 16x16/apps/qemu.png} (100%)
 rename ui/icons/{qemu_24x24.png => 24x24/apps/qemu.png} (100%)
 rename ui/icons/{qemu_256x256.png => 256x256/apps/qemu.png} (100%)
 rename ui/icons/{qemu_32x32.bmp => 32x32/apps/qemu.bmp} (100%)
 rename ui/icons/{qemu_32x32.png => 32x32/apps/qemu.png} (100%)
 rename ui/icons/{qemu_48x48.png => 48x48/apps/qemu.png} (100%)
 rename ui/icons/{qemu_512x512.png => 512x512/apps/qemu.png} (100%)
 rename ui/icons/{qemu_64x64.png => 64x64/apps/qemu.png} (100%)
 rename ui/icons/{ => scalable/apps}/qemu.svg (100%)

diff --git a/configure b/configure
index 4b12a8094c..fdcbfbc1b1 100755
--- a/configure
+++ b/configure
@@ -2218,6 +2218,7 @@ LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
+LINKS="$LINKS ui/icons "
 for f in $LINKS ; do
     if [ -e "$source_path/$f" ]; then
         mkdir -p `dirname ./$f`
diff --git a/docs/conf.py b/docs/conf.py
index 49dab44cca..16d5d96228 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -180,9 +180,9 @@
         "navigation_with_keys": True,
     }
 
-html_logo = os.path.join(qemu_docdir, "../ui/icons/qemu_128x128.png")
+html_logo = os.path.join(qemu_docdir, "../ui/icons/128x128/apps/qemu.png")
 
-html_favicon = os.path.join(qemu_docdir, "../ui/icons/qemu_32x32.png")
+html_favicon = os.path.join(qemu_docdir, "../ui/icons/32x32/apps/qemu.png")
 
 # Add any paths that contain custom static files (such as style sheets) here,
 # relative to this directory. They are copied after the builtin static files,
diff --git a/include/qemu/datadir.h b/include/qemu/datadir.h
index a333cd9b0d..427e90787a 100644
--- a/include/qemu/datadir.h
+++ b/include/qemu/datadir.h
@@ -3,6 +3,8 @@
 
 #define QEMU_FILE_TYPE_BIOS   0
 #define QEMU_FILE_TYPE_KEYMAP 1
+#define QEMU_FILE_TYPE_ICON   2
+
 /**
  * qemu_find_file:
  * @type: QEMU_FILE_TYPE_BIOS (for BIOS, VGA BIOS)
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 32c765d228..e5d1fd0116 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -35,6 +35,7 @@ static char **extra_firmware_dirs;
 
 /* Default built-in directories */
 static char *default_data_dir;
+static char *default_icon_dir;
 
 /* Whether we're known to be executing from a build tree */
 static bool in_build_dir;
@@ -66,6 +67,12 @@ char *qemu_find_file(int type, const char *name)
         default_install_dir = default_data_dir;
         break;
 
+    case QEMU_FILE_TYPE_ICON:
+        rel_install_dir = "hicolor";
+        rel_build_dir = "ui/icons";
+        default_install_dir = default_icon_dir;
+        break;
+
     default:
         abort();
     }
@@ -132,8 +139,11 @@ void qemu_add_default_firmwarepath(void)
 
     /* Add default dirs relative to the executable path */
     default_data_dir = get_relocated_path(CONFIG_QEMU_DATADIR);
+    default_icon_dir = get_relocated_path(CONFIG_QEMU_ICONDIR);
 
-    trace_datadir_init(default_data_dir, in_build_dir);
+    trace_datadir_init(default_data_dir,
+                       default_icon_dir,
+                       in_build_dir);
 }
 
 void qemu_list_data_dirs(void)
diff --git a/softmmu/trace-events b/softmmu/trace-events
index a9ba53f50d..9c00e9f389 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -6,7 +6,7 @@ balloon_event(void *opaque, unsigned long addr) "opaque %p addr %lu"
 
 # datadir.c
 datadir_load_file(const char *name, const char *path, int err) "name %s location %s errno %d"
-datadir_init(const char *defdatadir, bool inbuilddir) "default data dir %s in build dir %d"
+datadir_init(const char *defdatadir, const char *deficondir, bool inbuilddir) "default data dir %s icon dir %s in build dir %d"
 
 # ioport.c
 cpu_in(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 09a62817f2..c906e618f6 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -45,6 +45,7 @@
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "qemu/datadir.h"
 #include <Carbon/Carbon.h>
 #include "hw/core/cpu.h"
 
@@ -1558,7 +1559,7 @@ - (BOOL)verifyQuit
 - (IBAction) do_about_menu_item: (id) sender
 {
     NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
-    char *icon_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
+    char *icon_path_c = qemu_find_file(QEMU_FILE_TYPE_ICON, "512x512/apps/qemu.png");
     NSString *icon_path = [NSString stringWithUTF8String:icon_path_c];
     g_free(icon_path_c);
     NSImage *icon = [[NSImage alloc] initWithContentsOfFile:icon_path];
diff --git a/ui/gtk.c b/ui/gtk.c
index c57c36749e..7f798a0560 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -31,6 +31,7 @@
 #define LOCALEDIR "po"
 
 #include "qemu/osdep.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-control.h"
 #include "qapi/qapi-commands-machine.h"
@@ -2314,7 +2315,7 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     s->opts = opts;
 
     theme = gtk_icon_theme_get_default();
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR);
+    dir = qemu_find_file(QEMU_FILE_TYPE_ICON, NULL);
     gtk_icon_theme_prepend_search_path(theme, dir);
     g_free(dir);
     g_set_prgname("qemu");
diff --git a/ui/icons/qemu_128x128.png b/ui/icons/128x128/apps/qemu.png
similarity index 100%
rename from ui/icons/qemu_128x128.png
rename to ui/icons/128x128/apps/qemu.png
diff --git a/ui/icons/qemu_16x16.png b/ui/icons/16x16/apps/qemu.png
similarity index 100%
rename from ui/icons/qemu_16x16.png
rename to ui/icons/16x16/apps/qemu.png
diff --git a/ui/icons/qemu_24x24.png b/ui/icons/24x24/apps/qemu.png
similarity index 100%
rename from ui/icons/qemu_24x24.png
rename to ui/icons/24x24/apps/qemu.png
diff --git a/ui/icons/qemu_256x256.png b/ui/icons/256x256/apps/qemu.png
similarity index 100%
rename from ui/icons/qemu_256x256.png
rename to ui/icons/256x256/apps/qemu.png
diff --git a/ui/icons/qemu_32x32.bmp b/ui/icons/32x32/apps/qemu.bmp
similarity index 100%
rename from ui/icons/qemu_32x32.bmp
rename to ui/icons/32x32/apps/qemu.bmp
diff --git a/ui/icons/qemu_32x32.png b/ui/icons/32x32/apps/qemu.png
similarity index 100%
rename from ui/icons/qemu_32x32.png
rename to ui/icons/32x32/apps/qemu.png
diff --git a/ui/icons/qemu_48x48.png b/ui/icons/48x48/apps/qemu.png
similarity index 100%
rename from ui/icons/qemu_48x48.png
rename to ui/icons/48x48/apps/qemu.png
diff --git a/ui/icons/qemu_512x512.png b/ui/icons/512x512/apps/qemu.png
similarity index 100%
rename from ui/icons/qemu_512x512.png
rename to ui/icons/512x512/apps/qemu.png
diff --git a/ui/icons/qemu_64x64.png b/ui/icons/64x64/apps/qemu.png
similarity index 100%
rename from ui/icons/qemu_64x64.png
rename to ui/icons/64x64/apps/qemu.png
diff --git a/ui/icons/meson.build b/ui/icons/meson.build
index 12c52080eb..ac9111260b 100644
--- a/ui/icons/meson.build
+++ b/ui/icons/meson.build
@@ -1,13 +1,24 @@
-foreach s: [16, 24, 32, 48, 64, 128, 256, 512]
-  s = '@0@x@0@'.format(s.to_string())
-  install_data('qemu_@0@.png'.format(s),
-               rename: 'qemu.png',
-               install_dir: qemu_icondir / 'hicolor' / s / 'apps')
+
+png_icon_sizes = [
+    '16x16',
+    '24x24',
+    '32x32',
+    '48x48',
+    '64x64',
+    '128x128',
+    '256x256',
+    '512x512',
+]
+
+foreach icon_size: png_icon_sizes
+  install_data(
+    join_paths(icon_size, 'apps', 'qemu.png'),
+    install_dir: join_paths(qemu_icondir, 'hicolor', icon_size, 'apps')
+  )
 endforeach
 
-install_data('qemu_32x32.bmp',
-             rename: 'qemu.bmp',
+install_data('32x32/apps/qemu.bmp',
              install_dir: qemu_icondir / 'hicolor' / '32x32' / 'apps')
 
-install_data('qemu.svg',
+install_data('scalable/apps/qemu.svg',
              install_dir: qemu_icondir / 'hicolor' / 'scalable' / 'apps')
diff --git a/ui/icons/qemu.svg b/ui/icons/scalable/apps/qemu.svg
similarity index 100%
rename from ui/icons/qemu.svg
rename to ui/icons/scalable/apps/qemu.svg
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 8cb77416af..64435221cd 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
+#include "qemu/datadir.h"
 #include "ui/console.h"
 #include "ui/input.h"
 #include "ui/sdl2.h"
@@ -910,11 +911,11 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
     }
 
 #ifdef CONFIG_SDL_IMAGE
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/128x128/apps/qemu.png");
+    dir = qemu_find_file(QEMU_FILE_TYPE_ICON, "128x128/apps/qemu.png");
     icon = IMG_Load(dir);
 #else
     /* Load a 32x32x4 image. White pixels are transparent. */
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/32x32/apps/qemu.bmp");
+    dir = qemu_find_file(QEMU_FILE_TYPE_ICON, "32x32/apps/qemu.bmp");
     icon = SDL_LoadBMP(dir);
     if (icon) {
         uint32_t colorkey = SDL_MapRGB(icon->format, 255, 255, 255);
-- 
2.36.1


