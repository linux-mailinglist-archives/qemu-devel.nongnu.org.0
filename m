Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283EF24D373
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:02:27 +0200 (CEST)
Received: from localhost ([::1]:51318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k94oU-0002cJ-5t
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94E7-0002q0-2l
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Dz-0001hY-IG
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:24:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9r6uDVTHDKLZnA3Jn5FBJKsuDtcZX7C2n/FCTxLRXM=;
 b=AkNNqQeb7AqtuMU45QN4Ztp4eO+FenuCmJ7Qo8LAERl2hp5uEcEs8DQTTzMfI/vpNdbngn
 950/1EnCyeDUm5hmesALfnOz7kw+4GiCXSlO8pleXrShu3L8RKtel3S/wnukP11CFxMPBc
 djqFIhtYVRjgAOamvyqzgZ6c5hl0kUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-gN4c52UYNEq8dU3itEBQjA-1; Fri, 21 Aug 2020 06:24:32 -0400
X-MC-Unique: gN4c52UYNEq8dU3itEBQjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0743456B2D
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:24:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AA2375C1D0;
 Fri, 21 Aug 2020 10:24:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 072/152] meson: convert ui directory to Meson
Date: Fri, 21 Aug 2020 06:22:09 -0400
Message-Id: <20200821102329.29777-73-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 04:26:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.objs    |  8 +++--
 Makefile.target  |  8 ++---
 configure        |  6 ++++
 meson.build      | 50 +++++++++++++++++++++++++++++
 ui/Makefile.objs | 73 ------------------------------------------
 ui/meson.build   | 82 +++++++++++++++++++++++++++++++++++++++++++++++-
 ui/shader.c      |  6 ++--
 7 files changed, 149 insertions(+), 84 deletions(-)
 delete mode 100644 ui/Makefile.objs

diff --git a/Makefile.objs b/Makefile.objs
index ec7627a4c6..72e935023d 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -68,6 +68,11 @@ common-obj-$(CONFIG_AUDIO_OSS) += audio-oss$(DSOSUF)
 common-obj-$(CONFIG_AUDIO_PA) += audio-pa$(DSOSUF)
 common-obj-$(CONFIG_AUDIO_SDL) += audio-sdl$(DSOSUF)
 
+common-obj-$(if $(CONFIG_CURSES),m) += ui-curses$(DSOSUF)
+common-obj-$(if $(CONFIG_GTK),m) += ui-gtk$(DSOSUF)
+common-obj-$(if $(CONFIG_SDL),m) += ui-sdl$(DSOSUF)
+common-obj-$(if $(CONFIG_SPICE),m) += ui-spice-app$(DSOSUF)
+
 common-obj-$(if $(CONFIG_CURL),m) += block-curl$(DSOSUF)
 common-obj-$(if $(CONFIG_GLUSTERFS),m) += block-gluster$(DSOSUF)
 common-obj-$(if $(CONFIG_LIBISCSI),m) += block-iscsi$(DSOSUF)
@@ -83,9 +88,6 @@ common-obj-m += hw/
 
 common-obj-y += replay/
 
-common-obj-y += ui/
-common-obj-m += ui/
-
 common-obj-y += dma-helpers.o
 common-obj-$(CONFIG_TPM) += tpm.o
 
diff --git a/Makefile.target b/Makefile.target
index ff0e1b2d10..16f1e781e9 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -167,8 +167,9 @@ LIBS := $(libs_softmmu) $(LIBS)
 LIBS := $(LIBS) @../block.syms @../qemu.syms
 ifneq ($(CONFIG_MODULES),y)
 LIBS := $(LIBS) $(ALSA_LIBS) $(OSS_LIBS) $(PULSE_LIBS) $(SDL_LIBS)
+LIBS := $(LIBS) $(GTK_LIBS) $(VTE_LIBS) $(X11_LIBS) $(CURSES_LIBS) $(ICONV_LIBS) $(GIO_LIBS)
 endif
-LIBS := $(LIBS) $(BRLAPI_LIBS) $(SDL_LIBS) $(SPICE_LIBS)
+LIBS := $(LIBS) $(BRLAPI_LIBS) $(SDL_LIBS) $(SPICE_LIBS) $(OPENGL_LIBS)
 LIBS := $(LIBS) $(COREAUDIO_LIBS) $(DSOUND_LIBS)
 
 # Hardware support
@@ -207,9 +208,8 @@ dummy := $(call fix-paths,../,, \
               crypto-obj-y \
               io-obj-y \
               qom-obj-y)
-dummy := $(call unnest-vars,.., \
-               common-obj-y \
-               common-obj-m)
+dummy := $(call unnest-vars,..,common-obj-y)
+
 all-obj-y += $(common-obj-y)
 all-obj-y += $(qom-obj-y)
 all-obj-$(CONFIG_SOFTMMU) += $(authz-obj-y)
diff --git a/configure b/configure
index 396472b332..98252ca38a 100755
--- a/configure
+++ b/configure
@@ -7065,12 +7065,18 @@ fi
 if test "$vnc_sasl" = "yes" ; then
   echo "CONFIG_VNC_SASL=y" >> $config_host_mak
 fi
+echo "SASL_CFLAGS=$vnc_sasl_cflags" >> $config_host_mak
+echo "SASL_LIBS=$vnc_sasl_libs" >> $config_host_mak
 if test "$vnc_jpeg" = "yes" ; then
   echo "CONFIG_VNC_JPEG=y" >> $config_host_mak
 fi
+echo "JPEG_CFLAGS=$vnc_jpeg_cflags" >> $config_host_mak
+echo "JPEG_LIBS=$vnc_jpeg_libs" >> $config_host_mak
 if test "$vnc_png" = "yes" ; then
   echo "CONFIG_VNC_PNG=y" >> $config_host_mak
 fi
+echo "PNG_CFLAGS=$vnc_png_cflags" >> $config_host_mak
+echo "PNG_LIBS=$vnc_png_libs" >> $config_host_mak
 if test "$xkbcommon" = "yes" ; then
   echo "CONFIG_XKBCOMMON=y" >> $config_host_mak
   echo "XKBCOMMON_CFLAGS=$xkbcommon_cflags" >> $config_host_mak
diff --git a/meson.build b/meson.build
index e1e70d4b48..ca1e6906b7 100644
--- a/meson.build
+++ b/meson.build
@@ -243,6 +243,56 @@ coreaudio = not_found
 if 'CONFIG_AUDIO_COREAUDIO' in config_host
   coreaudio = declare_dependency(link_args: config_host['COREAUDIO_LIBS'].split())
 endif
+opengl = not_found
+if 'CONFIG_OPENGL' in config_host
+  opengl = declare_dependency(link_args: config_host['OPENGL_LIBS'].split())
+else
+endif
+gtk = not_found
+if 'CONFIG_GTK' in config_host
+  gtk = declare_dependency(compile_args: config_host['GTK_CFLAGS'].split(),
+                              link_args: config_host['GTK_LIBS'].split())
+endif
+vte = not_found
+if 'CONFIG_VTE' in config_host
+  vte = declare_dependency(compile_args: config_host['VTE_CFLAGS'].split(),
+                           link_args: config_host['VTE_LIBS'].split())
+endif
+x11 = not_found
+if 'CONFIG_X11' in config_host
+  x11 = declare_dependency(compile_args: config_host['X11_CFLAGS'].split(),
+                           link_args: config_host['X11_LIBS'].split())
+endif
+curses = not_found
+if 'CONFIG_CURSES' in config_host
+  curses = declare_dependency(compile_args: config_host['CURSES_CFLAGS'].split(),
+                              link_args: config_host['CURSES_LIBS'].split())
+endif
+iconv = not_found
+if 'CONFIG_ICONV' in config_host
+  iconv = declare_dependency(compile_args: config_host['ICONV_CFLAGS'].split(),
+                             link_args: config_host['ICONV_LIBS'].split())
+endif
+gio = not_found
+if 'CONFIG_GIO' in config_host
+  gio = declare_dependency(compile_args: config_host['GIO_CFLAGS'].split(),
+                           link_args: config_host['GIO_LIBS'].split())
+endif
+png = not_found
+if 'CONFIG_VNC_PNG' in config_host
+  png = declare_dependency(compile_args: config_host['PNG_CFLAGS'].split(),
+                           link_args: config_host['PNG_LIBS'].split())
+endif
+jpeg = not_found
+if 'CONFIG_VNC_JPEG' in config_host
+  jpeg = declare_dependency(compile_args: config_host['JPEG_CFLAGS'].split(),
+                            link_args: config_host['JPEG_LIBS'].split())
+endif
+sasl = not_found
+if 'CONFIG_VNC_SASL' in config_host
+  sasl = declare_dependency(compile_args: config_host['SASL_CFLAGS'].split(),
+                            link_args: config_host['SASL_LIBS'].split())
+endif
 
 create_config = find_program('scripts/create_config')
 minikconf = find_program('scripts/minikconf.py')
diff --git a/ui/Makefile.objs b/ui/Makefile.objs
deleted file mode 100644
index 504b196479..0000000000
--- a/ui/Makefile.objs
+++ /dev/null
@@ -1,73 +0,0 @@
-vnc-obj-y += vnc.o
-vnc-obj-y += vnc-enc-zlib.o vnc-enc-hextile.o
-vnc-obj-y += vnc-enc-tight.o vnc-palette.o
-vnc-obj-y += vnc-enc-zrle.o
-vnc-obj-y += vnc-auth-vencrypt.o
-vnc-obj-$(CONFIG_VNC_SASL) += vnc-auth-sasl.o
-vnc-obj-y += vnc-ws.o
-vnc-obj-y += vnc-jobs.o
-
-common-obj-y += keymaps.o console.o cursor.o qemu-pixman.o
-common-obj-y += input.o input-keymap.o input-legacy.o kbd-state.o
-common-obj-y += input-barrier.o
-common-obj-$(CONFIG_LINUX) += input-linux.o
-common-obj-$(CONFIG_SPICE) += spice-core.o spice-input.o spice-display.o
-common-obj-$(CONFIG_COCOA) += cocoa.o
-common-obj-$(CONFIG_VNC) += $(vnc-obj-y)
-common-obj-$(call lnot,$(CONFIG_VNC)) += vnc-stubs.o
-ifneq (,$(findstring m,$(CONFIG_SDL)$(CONFIG_GTK)))
-common-obj-$(CONFIG_WIN32) += win32-kbd-hook.o
-endif
-
-# ui-sdl module
-common-obj-$(CONFIG_SDL) += sdl.mo
-sdl.mo-objs := sdl2.o sdl2-input.o sdl2-2d.o
-ifeq ($(CONFIG_OPENGL),y)
-sdl.mo-objs += sdl2-gl.o
-endif
-sdl.mo-cflags := $(SDL_CFLAGS)
-sdl.mo-libs := $(SDL_LIBS)
-
-# ui-gtk module
-common-obj-$(CONFIG_GTK) += gtk.mo
-gtk.mo-objs := gtk.o
-gtk.mo-cflags := $(GTK_CFLAGS) $(VTE_CFLAGS)
-gtk.mo-libs := $(GTK_LIBS) $(VTE_LIBS)
-ifeq ($(CONFIG_OPENGL),y)
-gtk.mo-objs += gtk-egl.o
-gtk.mo-libs += $(OPENGL_LIBS)
-ifeq ($(CONFIG_GTK_GL),y)
-gtk.mo-objs += gtk-gl-area.o
-endif
-endif
-
-ifeq ($(CONFIG_X11),y)
-sdl.mo-objs += x_keymap.o
-gtk.mo-objs += x_keymap.o
-x_keymap.o-cflags := $(X11_CFLAGS)
-x_keymap.o-libs := $(X11_LIBS)
-endif
-
-common-obj-$(CONFIG_CURSES) += curses.mo
-curses.mo-objs := curses.o
-curses.mo-cflags := $(CURSES_CFLAGS) $(ICONV_CFLAGS)
-curses.mo-libs := $(CURSES_LIBS) $(ICONV_LIBS)
-
-ifeq ($(CONFIG_GIO)$(CONFIG_SPICE),yy)
-common-obj-$(if $(CONFIG_MODULES),m,y) += spice-app.mo
-endif
-spice-app.mo-objs := spice-app.o
-spice-app.mo-cflags := $(GIO_CFLAGS)
-spice-app.mo-libs := $(GIO_LIBS)
-
-common-obj-$(CONFIG_OPENGL) += shader.o
-common-obj-$(CONFIG_OPENGL) += console-gl.o
-common-obj-$(CONFIG_OPENGL) += egl-helpers.o
-common-obj-$(CONFIG_OPENGL) += egl-context.o
-common-obj-$(CONFIG_OPENGL_DMABUF) += egl-headless.o
-
-shader.o-libs += $(OPENGL_LIBS)
-console-gl.o-libs += $(OPENGL_LIBS)
-egl-helpers.o-libs += $(OPENGL_LIBS)
-egl-context.o-libs += $(OPENGL_LIBS)
-egl-headless.o-libs += $(OPENGL_LIBS)
diff --git a/ui/meson.build b/ui/meson.build
index 35da0d8d26..66282c398d 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -1,3 +1,82 @@
+softmmu_ss.add(files(
+  'console.c',
+  'cursor.c',
+  'input-keymap.c',
+  'input-legacy.c',
+  'input-barrier.c',
+  'input.c',
+  'kbd-state.c',
+  'keymaps.c',
+  'qemu-pixman.c',
+))
+softmmu_ss.add(pixman)
+
+softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('input-linux.c'))
+softmmu_ss.add(when: 'CONFIG_SPICE', if_true: files('spice-core.c', 'spice-input.c', 'spice-display.c'))
+softmmu_ss.add(when: [cocoa, 'CONFIG_COCOA'], if_true: files('cocoa.m'))
+
+vnc_ss = ss.source_set()
+vnc_ss.add(files(
+  'vnc.c',
+  'vnc-enc-zlib.c',
+  'vnc-enc-hextile.c',
+  'vnc-enc-tight.c',
+  'vnc-palette.c',
+  'vnc-enc-zrle.c',
+  'vnc-auth-vencrypt.c',
+  'vnc-ws.c',
+  'vnc-jobs.c',
+))
+vnc_ss.add(zlib)
+vnc_ss.add(when: 'CONFIG_VNC_SASL', if_true: [files('vnc-auth-sasl.c'), sasl])
+softmmu_ss.add_all(when: 'CONFIG_VNC', if_true: vnc_ss)
+softmmu_ss.add(when: 'CONFIG_VNC', if_false: files('vnc-stubs.c'))
+softmmu_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('shader.c', 'console-gl.c', 'egl-helpers.c', 'egl-context.c'))
+softmmu_ss.add(when: [opengl, 'CONFIG_OPENGL_DMABUF'], if_true: files('egl-headless.c'))
+softmmu_ss.add(when: 'CONFIG_VNC_PNG', if_true: png)
+softmmu_ss.add(when: 'CONFIG_VNC_JPEG', if_true: jpeg)
+
+ui_modules = {}
+
+if config_host.has_key('CONFIG_CURSES')
+  curses_ss = ss.source_set()
+  curses_ss.add(when: [curses, iconv], if_true: files('curses.c'))
+  ui_modules += {'curses' : curses_ss}
+endif
+
+if config_host.has_key('CONFIG_GTK') and config_host.has_key('CONFIG_VTE')
+  softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
+
+  gtk_ss = ss.source_set()
+  gtk_ss.add(gtk, vte, files('gtk.c'))
+  gtk_ss.add(when: [x11, 'CONFIG_X11'], if_true: files('x_keymap.c'))
+  gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('gtk-egl.c'))
+  gtk_ss.add(when: [opengl, 'CONFIG_GTK_GL'], if_true: files('gtk-gl-area.c'))
+  ui_modules += {'gtk' : gtk_ss}
+endif
+
+if config_host.has_key('CONFIG_SDL')
+  softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
+
+  sdl_ss = ss.source_set()
+  sdl_ss.add(pixman, glib, files(
+    'sdl2-2d.c',
+    'sdl2-input.c',
+    'sdl2.c',
+  ))
+  sdl_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('sdl2-gl.c'))
+  sdl_ss.add(when: [x11, 'CONFIG_X11'], if_true: files('x_keymap.c'))
+  ui_modules += {'sdl' : sdl_ss}
+endif
+
+if config_host.has_key('CONFIG_SPICE') and config_host.has_key('CONFIG_GIO')
+  spice_ss = ss.source_set()
+  spice_ss.add(spice, gio, files('spice-app.c'))
+  ui_modules += {'spice-app': spice_ss}
+endif
+
+keymap_gen = find_program('keycodemapdb/tools/keymap-gen')
+
 keymaps = [
   ['atset1', 'qcode'],
   ['linux', 'qcode'],
@@ -24,7 +103,6 @@ if have_system
     genh += custom_target(output,
                   output: output,
                   capture: true,
-                  build_by_default: true, # to be removed when added to a target
                   input: files('keycodemapdb/data/keymaps.csv'),
                   command: [python.full_path(), files('keycodemapdb/tools/keymap-gen'),
                             '--lang', 'glib2',
@@ -34,3 +112,5 @@ if have_system
 endif
 
 subdir('shader')
+
+modules += {'ui': ui_modules}
diff --git a/ui/shader.c b/ui/shader.c
index d78829f43b..e8b8d321b7 100644
--- a/ui/shader.c
+++ b/ui/shader.c
@@ -27,9 +27,9 @@
 #include "qemu/osdep.h"
 #include "ui/shader.h"
 
-#include "shader/texture-blit-vert.h"
-#include "shader/texture-blit-flip-vert.h"
-#include "shader/texture-blit-frag.h"
+#include "ui/shader/texture-blit-vert.h"
+#include "ui/shader/texture-blit-flip-vert.h"
+#include "ui/shader/texture-blit-frag.h"
 
 struct QemuGLShader {
     GLint texture_blit_prog;
-- 
2.26.2



