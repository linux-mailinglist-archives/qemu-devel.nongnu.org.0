Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4CD3B2650
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 06:25:47 +0200 (CEST)
Received: from localhost ([::1]:45038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwGvy-0002S8-SG
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 00:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwGtu-0000JM-82
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 00:23:38 -0400
Received: from mga06.intel.com ([134.134.136.31]:55797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwGtr-0003kg-9I
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 00:23:38 -0400
IronPort-SDR: qN1RAU2uwDvt1ZFN5JQneMtSURUgHT75P7iRnARpbOYbiHjkDVpCp5osmHeP6ccUY4LCBGLIJO
 tcMoJvKO6EEQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="268526360"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="268526360"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 21:23:24 -0700
IronPort-SDR: O5Xbwh97KCnAooB6ZlDTLuPhNx76TmSb84i7VsJlXYcm7rKHaWDphrDR5k42WaLjU2xXVvXJim
 gP+0f/R5fZ9w==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="624049666"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 21:23:24 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC v1 1/1] ui: Add a plain Wayland backend for Qemu UI
Date: Wed, 23 Jun 2021 21:10:40 -0700
Message-Id: <20210624041040.1250631-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624041040.1250631-1-vivek.kasireddy@intel.com>
References: <20210624041040.1250631-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=vivek.kasireddy@intel.com; helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 configure         |  17 ++
 meson.build       |  25 +++
 meson_options.txt |   2 +
 qapi/ui.json      |  19 ++-
 ui/meson.build    |  52 ++++++
 ui/wayland.c      | 402 ++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 516 insertions(+), 1 deletion(-)
 create mode 100644 ui/wayland.c

diff --git a/configure b/configure
index 8dcb9965b2..f6caaa6329 100755
--- a/configure
+++ b/configure
@@ -403,6 +403,7 @@ cfi_debug="false"
 seccomp="auto"
 glusterfs="auto"
 gtk="auto"
+wayland="auto"
 tls_priority="NORMAL"
 gnutls="$default_feature"
 nettle="$default_feature"
@@ -1372,6 +1373,10 @@ for opt do
   ;;
   --enable-gtk) gtk="enabled"
   ;;
+  --disable-wayland) wayland="disabled"
+  ;;
+  --enable-wayland) wayland="enabled"
+  ;;
   --tls-priority=*) tls_priority="$optarg"
   ;;
   --disable-gnutls) gnutls="no"
@@ -1845,6 +1850,7 @@ disabled with --disable-FEATURE, default is enabled if available
   sdl             SDL UI
   sdl-image       SDL Image support for icons
   gtk             gtk UI
+  wayland         Wayland UI
   vte             vte support for the gtk UI
   curses          curses UI
   iconv           font glyph conversion support
@@ -3616,6 +3622,11 @@ if $pkg_config gbm; then
     gbm="yes"
 fi
 
+if $pkg_config wayland-client; then
+    wayland_cflags="$($pkg_config --cflags wayland-client)"
+    wayland_libs="$($pkg_config --libs wayland-client)"
+fi
+
 if test "$opengl" != "no" ; then
   epoxy=no
   if $pkg_config epoxy; then
@@ -5870,6 +5881,11 @@ if test "$gbm" = "yes" ; then
     echo "GBM_CFLAGS=$gbm_cflags" >> $config_host_mak
 fi
 
+if test "$wayland" = "enabled" ; then
+    echo "CONFIG_WAYLAND=y" >> $config_host_mak
+    echo "WAYLAND_LIBS=$wayland_libs" >> $config_host_mak
+    echo "WAYLAND_CFLAGS=$wayland_cflags" >> $config_host_mak
+fi
 
 if test "$avx2_opt" = "yes" ; then
   echo "CONFIG_AVX2_OPT=y" >> $config_host_mak
@@ -6436,6 +6452,7 @@ if test "$skip_meson" = no; then
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
+        -Dwayland=$wayland \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Dbrlapi=$brlapi \
diff --git a/meson.build b/meson.build
index 626cf932c1..dbafe4a5d4 100644
--- a/meson.build
+++ b/meson.build
@@ -855,6 +855,29 @@ if gtkx11.found()
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
                    kwargs: static_kwargs)
 endif
+
+wayland = not_found
+if not get_option('wayland').auto()
+  wlclientdep = dependency('wayland-client', version: '>= 1.18.90',
+                           method: 'pkg-config',
+                           required: get_option('wayland'),
+                           kwargs: static_kwargs)
+  wlprotocolsdep = dependency('wayland-protocols', version: '>= 1.14.91',
+                              method: 'pkg-config',
+                              required: get_option('wayland'),
+                              kwargs: static_kwargs)
+
+  if not wlprotocolsdep.found()
+    wlproto_dir = subproject('wayland-protocols').get_variable('wayland_protocols_srcdir')
+  else
+    wlproto_dir = wlprotocolsdep.get_pkgconfig_variable('pkgdatadir')
+  endif
+
+  wayland = declare_dependency(dependencies: [wlclientdep, wlprotocolsdep],
+                               compile_args: config_host['WAYLAND_CFLAGS'].split(),
+                               link_args: config_host['WAYLAND_LIBS'].split())
+endif
+
 vnc = not_found
 png = not_found
 jpeg = not_found
@@ -1146,6 +1169,7 @@ if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 endif
 config_host_data.set('CONFIG_GTK', gtk.found())
+config_host_data.set('CONFIG_WAYLAND', wayland.found())
 config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
 config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
 config_host_data.set('CONFIG_EBPF', libbpf.found())
@@ -2695,6 +2719,7 @@ summary_info += {'SDL support':       sdl.found()}
 summary_info += {'SDL image support': sdl_image.found()}
 # TODO: add back version
 summary_info += {'GTK support':       gtk.found()}
+summary_info += {'Wayland support':   wayland.found()}
 summary_info += {'pixman':            pixman.found()}
 # TODO: add back version
 summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
diff --git a/meson_options.txt b/meson_options.txt
index 3d304cac96..86066c63c9 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -86,6 +86,8 @@ option('rbd', type : 'feature', value : 'auto',
        description: 'Ceph block device driver')
 option('gtk', type : 'feature', value : 'auto',
        description: 'GTK+ user interface')
+option('wayland', type : 'feature', value : 'auto',
+       description: 'Wayland user interface')
 option('sdl', type : 'feature', value : 'auto',
        description: 'SDL user interface')
 option('sdl_image', type : 'feature', value : 'auto',
diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..55e5967889 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1057,6 +1057,20 @@
 { 'struct'  : 'DisplayEGLHeadless',
   'data'    : { '*rendernode' : 'str' } }
 
+##
+# @DisplayWayland:
+#
+# Wayland display options.
+#
+# @rendernode: Which DRM render node should be used. Default is the first
+#              available node on the host.
+#
+# Since: 3.1
+#
+##
+{ 'struct'  : 'DisplayWayland',
+  'data'    : { '*rendernode' : 'str' } }
+
  ##
  # @DisplayGLMode:
  #
@@ -1108,6 +1122,8 @@
 #                DRI device. Graphical display need to be paired with
 #                VNC or Spice. (Since 3.1)
 #
+# @wayland: The Wayland user interface.
+#
 # @curses: Display video output via curses.  For graphics device
 #          models which support a text mode, QEMU can display this
 #          output using a curses/ncurses interface. Nothing is
@@ -1128,7 +1144,7 @@
 { 'enum'    : 'DisplayType',
   'data'    : [ 'default', 'none', 'gtk', 'sdl',
                 'egl-headless', 'curses', 'cocoa',
-                'spice-app'] }
+                'wayland', 'spice-app'] }
 
 ##
 # @DisplayOptions:
@@ -1154,6 +1170,7 @@
   'discriminator' : 'type',
   'data'    : { 'gtk'            : 'DisplayGTK',
                 'curses'         : 'DisplayCurses',
+                'wayland'        : 'DisplayWayland',
                 'egl-headless'   : 'DisplayEGLHeadless'} }
 
 ##
diff --git a/ui/meson.build b/ui/meson.build
index a3a187d633..fe255aec04 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -62,6 +62,58 @@ if config_host.has_key('CONFIG_OPENGL') and gbm.found()
   ui_modules += {'egl-headless' : egl_headless_ss}
 endif
 
+wayland_scanner = find_program('wayland-scanner')
+proto_sources = [
+  ['xdg-shell', 'stable', ],
+  ['fullscreen-shell', 'unstable', 'v1', ],
+  ['linux-dmabuf', 'unstable', 'v1', ],
+]
+wayland_headers = []
+wayland_proto_sources = []
+
+if wayland.found()
+  foreach p: proto_sources
+    proto_name = p.get(0)
+    proto_stability = p.get(1)
+
+    if proto_stability == 'stable'
+      output_base = proto_name
+      input = files(join_paths(wlproto_dir, '@0@/@1@/@2@.xml'.format(proto_stability, proto_name, output_base)))
+    else
+      proto_version = p.get(2)
+      output_base = '@0@-@1@-@2@'.format(proto_name, proto_stability, proto_version)
+      input = files(join_paths(wlproto_dir, '@0@/@1@/@2@.xml'.format(proto_stability, proto_name, output_base)))
+    endif
+
+    wayland_headers += custom_target('@0@ client header'.format(output_base),
+      input: input,
+      output: '@0@-client-protocol.h'.format(output_base),
+      command: [
+        wayland_scanner,
+        'client-header',
+        '@INPUT@', '@OUTPUT@',
+      ], build_by_default: true
+    )
+
+    wayland_proto_sources += custom_target('@0@ source'.format(output_base),
+      input: input,
+      output: '@0@-protocol.c'.format(output_base),
+      command: [
+        wayland_scanner,
+        'private-code',
+        '@INPUT@', '@OUTPUT@',
+      ], build_by_default: true
+    )
+  endforeach
+endif
+
+if wayland.found()
+  wayland_ss = ss.source_set()
+  wayland_ss.add(when: wayland, if_true: files('wayland.c', 'xdg-shell-protocol.c', 'fullscreen-shell-unstable-v1-protocol.c','linux-dmabuf-unstable-v1-protocol.c'))
+  #wayland_ss.add(when: wayland, if_true: files('wayland.c'), [wayland_proto_sources])
+  ui_modules += {'wayland' : wayland_ss}
+endif
+
 if gtk.found()
   softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
 
diff --git a/ui/wayland.c b/ui/wayland.c
new file mode 100644
index 0000000000..351d7e1146
--- /dev/null
+++ b/ui/wayland.c
@@ -0,0 +1,402 @@
+/*
+ * Wayland UI -- A simple Qemu UI backend to share buffers with Wayland compositors
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * Mostly (boilerplate) based on cgit.freedesktop.org/wayland/weston/tree/clients/simple-dmabuf-egl.c
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "sysemu/sysemu.h"
+#include "ui/console.h"
+#include <wayland-client.h>
+#include "xdg-shell-client-protocol.h"
+#include "fullscreen-shell-unstable-v1-client-protocol.h"
+#include "linux-dmabuf-unstable-v1-client-protocol.h"
+
+#define MAX_BUFFERS 3
+
+typedef struct wayland_display {
+    struct wl_display *display;
+    struct wl_registry *registry;
+    struct wl_compositor *compositor;
+    struct xdg_wm_base *wm_base;
+    struct zwp_fullscreen_shell_v1 *fshell;
+    struct zwp_linux_dmabuf_v1 *dmabuf;
+} wayland_display;
+
+typedef struct wayland_buffer {
+    QemuConsole *con;
+    QemuDmaBuf *dmabuf;
+    struct wl_buffer *buffer;
+    bool busy;
+} wayland_buffer;
+
+typedef struct wayland_window {
+    wayland_display *display;
+    DisplayChangeListener dcl;
+    struct wl_surface *surface;
+    struct xdg_surface *xdg_surface;
+    struct xdg_toplevel *xdg_toplevel;
+    struct wl_callback *callback;
+    wayland_buffer buffers[MAX_BUFFERS];
+    wayland_buffer *new_buffer;
+    bool redraw;
+} wayland_window;
+
+static const struct wl_callback_listener frame_listener;
+
+static void
+xdg_surface_handle_configure(void *data, struct xdg_surface *surface,
+			     uint32_t serial)
+{
+    xdg_surface_ack_configure(surface, serial);
+}
+
+static const struct xdg_surface_listener xdg_surface_listener = {
+    xdg_surface_handle_configure,
+};
+
+static void
+xdg_toplevel_handle_configure(void *data, struct xdg_toplevel *toplevel,
+			      int32_t width, int32_t height,
+			      struct wl_array *states)
+{
+}
+
+static void
+xdg_toplevel_handle_close(void *data, struct xdg_toplevel *xdg_toplevel)
+{
+}
+
+static const struct xdg_toplevel_listener xdg_toplevel_listener = {
+    xdg_toplevel_handle_configure,
+    xdg_toplevel_handle_close,
+};
+
+static void wayland_refresh(DisplayChangeListener *dcl)
+{
+    graphic_hw_update(dcl->con);
+}
+
+static QEMUGLContext wayland_create_context(DisplayChangeListener *dcl,
+                                            QEMUGLParams *params)
+{
+    return NULL;
+}
+
+static void wayland_destroy_context(DisplayChangeListener *dcl,
+                                    QEMUGLContext ctx)
+{
+}
+
+static int wayland_make_context_current(DisplayChangeListener *dcl,
+                                        QEMUGLContext ctx)
+{
+    return 0;
+}
+
+static void wayland_scanout_disable(DisplayChangeListener *dcl)
+{
+}
+
+static void wayland_scanout_texture(DisplayChangeListener *dcl,
+                                    uint32_t backing_id,
+                                    bool backing_y_0_top,
+                                    uint32_t backing_width,
+                                    uint32_t backing_height,
+                                    uint32_t x, uint32_t y,
+                                    uint32_t w, uint32_t h)
+{
+}
+
+static void wayland_release_dmabuf(DisplayChangeListener *dcl,
+                                   QemuDmaBuf *dmabuf)
+{
+}
+
+static void wayland_dispatch_handler(void *opaque)
+{
+    wayland_display *wldpy = opaque;
+
+    wl_display_prepare_read(wldpy->display);
+    wl_display_read_events(wldpy->display);
+    wl_display_dispatch_pending(wldpy->display);
+    wl_display_flush(wldpy->display);
+}
+
+static void wayland_window_redraw(void *data, struct wl_callback *callback,
+                                  uint32_t time)
+{
+    wayland_window *window = data;
+    QemuDmaBuf *dmabuf = window->new_buffer->dmabuf;
+
+    if (callback) {
+        wl_callback_destroy(callback);
+        window->callback = NULL;
+    }
+    if (!window->redraw) {
+        return;
+    }
+    window->callback = wl_surface_frame(window->surface);
+    wl_callback_add_listener(window->callback, &frame_listener, window);
+
+    wl_surface_attach(window->surface, window->new_buffer->buffer, 0, 0);
+    wl_surface_damage(window->surface, 0, 0, dmabuf->width, dmabuf->height);
+    wl_surface_commit(window->surface);
+    wl_display_flush(window->display->display);
+    window->redraw = false;
+}
+
+static const struct wl_callback_listener frame_listener = {
+    wayland_window_redraw
+};
+
+static void buffer_release(void *data, struct wl_buffer *buf)
+{
+    wayland_buffer *buffer = data;
+    QemuDmaBuf *dmabuf = buffer->dmabuf;
+
+    dmabuf->fence_fd = -1;
+    graphic_hw_gl_block(buffer->con, false);
+    graphic_hw_gl_flushed(buffer->con);
+    buffer->busy = false;
+    wl_buffer_destroy(buf);
+}
+
+static const struct wl_buffer_listener buffer_listener = {
+    buffer_release
+};
+
+static wayland_buffer *window_next_buffer(wayland_window *window)
+{
+    int i;
+
+    for (i = 0; i < MAX_BUFFERS; i++) {
+        if (!window->buffers[i].busy) {
+            return &window->buffers[i];
+        }
+    }
+    return NULL;
+}
+
+static void wayland_scanout_dmabuf(DisplayChangeListener *dcl,
+                                   QemuDmaBuf *dmabuf)
+{
+    wayland_window *window = container_of(dcl, wayland_window, dcl);
+    wayland_display *display = window->display;
+    wayland_buffer *buffer = window_next_buffer(window);
+    struct zwp_linux_buffer_params_v1 *params;
+
+    if (!buffer) {
+	error_report("Can't find free buffer\n");
+        exit(1);
+    }
+    params = zwp_linux_dmabuf_v1_create_params(display->dmabuf);
+    zwp_linux_buffer_params_v1_add(params, dmabuf->fd, 0, 0, dmabuf->stride,
+                                   0, 0);
+    buffer->buffer = zwp_linux_buffer_params_v1_create_immed(params,
+                                                             dmabuf->width,
+                                                             dmabuf->height,
+                                                             dmabuf->fourcc,
+                                                             0);
+    zwp_linux_buffer_params_v1_destroy(params);
+    buffer->dmabuf = dmabuf;
+    buffer->con = window->dcl.con;
+    window->new_buffer = buffer;
+    dmabuf->fence_fd = 1;
+    wl_buffer_add_listener(buffer->buffer, &buffer_listener, buffer);
+}
+
+static void wayland_scanout_flush(DisplayChangeListener *dcl,
+                                  uint32_t x, uint32_t y,
+                                  uint32_t w, uint32_t h)
+{
+    wayland_window *window = container_of(dcl, wayland_window, dcl);
+    static bool first = true;
+
+    if (!window->new_buffer->busy && !first) {
+        graphic_hw_gl_block(window->new_buffer->con, true);
+    }
+
+    window->redraw = true;
+    if (first || !window->callback) {
+        wayland_window_redraw(window, NULL, 0);
+    }
+    window->new_buffer->busy = true;
+    first = false;
+}
+
+static const DisplayChangeListenerOps wayland_ops = {
+    .dpy_name                = "wayland",
+    .dpy_refresh             = wayland_refresh,
+
+    .dpy_gl_ctx_create       = wayland_create_context,
+    .dpy_gl_ctx_destroy      = wayland_destroy_context,
+    .dpy_gl_ctx_make_current = wayland_make_context_current,
+
+    .dpy_gl_scanout_disable  = wayland_scanout_disable,
+    .dpy_gl_scanout_texture  = wayland_scanout_texture,
+    .dpy_gl_scanout_dmabuf   = wayland_scanout_dmabuf,
+    .dpy_gl_release_dmabuf   = wayland_release_dmabuf,
+    .dpy_gl_update           = wayland_scanout_flush,
+};
+
+static void early_wayland_init(DisplayOptions *opts)
+{
+    display_opengl = 1;
+}
+
+static void
+dmabuf_modifier(void *data, struct zwp_linux_dmabuf_v1 *zwp_linux_dmabuf,
+		 uint32_t format, uint32_t modifier_hi, uint32_t modifier_lo)
+{
+}
+
+static void
+dmabuf_format(void *data, struct zwp_linux_dmabuf_v1 *zwp_linux_dmabuf,
+              uint32_t format)
+{
+}
+
+static const struct zwp_linux_dmabuf_v1_listener dmabuf_listener = {
+    dmabuf_format,
+    dmabuf_modifier
+};
+
+static void
+xdg_wm_base_ping(void *data, struct xdg_wm_base *shell, uint32_t serial)
+{
+    xdg_wm_base_pong(shell, serial);
+}
+
+static const struct xdg_wm_base_listener wm_base_listener = {
+    xdg_wm_base_ping,
+};
+
+static void
+registry_handle_global(void *data, struct wl_registry *registry,
+                       uint32_t id, const char *interface, uint32_t version)
+{
+    wayland_display *d = data;
+
+    if (strcmp(interface, "wl_compositor") == 0) {
+        d->compositor = wl_registry_bind(registry,
+			                 id, &wl_compositor_interface, 1);
+    } else if (strcmp(interface, "xdg_wm_base") == 0) {
+	d->wm_base = wl_registry_bind(registry,
+				      id, &xdg_wm_base_interface, 1);
+	xdg_wm_base_add_listener(d->wm_base, &wm_base_listener, d);
+    } else if (strcmp(interface, "zwp_fullscreen_shell_v1") == 0) {
+	d->fshell = wl_registry_bind(registry,
+	                             id, &zwp_fullscreen_shell_v1_interface,
+	                             1);
+    } else if (strcmp(interface, "zwp_linux_dmabuf_v1") == 0) {
+	d->dmabuf = wl_registry_bind(registry,
+	                             id, &zwp_linux_dmabuf_v1_interface, 3);
+	zwp_linux_dmabuf_v1_add_listener(d->dmabuf, &dmabuf_listener,
+	                                 d);
+    }
+}
+
+static void
+registry_handle_global_remove(void *data, struct wl_registry *registry,
+                              uint32_t name)
+{
+}
+
+static const struct wl_registry_listener registry_listener = {
+    registry_handle_global,
+    registry_handle_global_remove
+};
+
+static wayland_display *create_display(void)
+{
+    wayland_display *display;
+
+    display = g_new0(wayland_display, 1);
+    display->display = wl_display_connect(NULL);
+    assert(display->display);
+
+    display->registry = wl_display_get_registry(display->display);
+    wl_registry_add_listener(display->registry,
+                             &registry_listener, display);
+    wl_display_roundtrip(display->display);
+    if (display->dmabuf == NULL) {
+	error_report("No zwp_linux_dmabuf global\n");
+	exit(1);
+    }
+    return display;
+}
+
+static wayland_window *create_window(wayland_display *display)
+{
+    wayland_window *window;
+
+    window = g_new0(wayland_window, 1);
+    window->display = display;
+    window->surface = wl_compositor_create_surface(display->compositor);
+
+    if (display->wm_base) {
+        window->xdg_surface = xdg_wm_base_get_xdg_surface(display->wm_base,
+	                                                  window->surface);
+        assert(window->xdg_surface);
+        xdg_surface_add_listener(window->xdg_surface,
+                                 &xdg_surface_listener, window);
+        window->xdg_toplevel = xdg_surface_get_toplevel(window->xdg_surface);
+        assert(window->xdg_toplevel);
+        xdg_toplevel_add_listener(window->xdg_toplevel,
+                                  &xdg_toplevel_listener, window);
+        xdg_toplevel_set_title(window->xdg_toplevel, "qemu-wayland");
+        wl_surface_commit(window->surface);
+    } else if (display->fshell) {
+        zwp_fullscreen_shell_v1_present_surface(display->fshell,
+	                                        window->surface,
+		                                ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_DEFAULT,
+		                                NULL);
+    } else {
+         assert(0);
+    }
+
+    return window;
+}
+
+static void wayland_init(DisplayState *ds, DisplayOptions *opts)
+{
+    QemuConsole *con;
+    wayland_display *wldpy;
+    wayland_window *wlwdw;
+    int idx;
+
+    wldpy = create_display();
+    for (idx = 0;; idx++) {
+        con = qemu_console_lookup_by_index(idx);
+        if (!con || !qemu_console_is_graphic(con)) {
+            break;
+        }
+
+        wlwdw = create_window(wldpy);
+        wlwdw->dcl.con = con;
+        wlwdw->dcl.ops = &wayland_ops;
+        register_displaychangelistener(&wlwdw->dcl);
+    }
+    wl_display_roundtrip(wldpy->display);
+    qemu_set_fd_handler(wl_display_get_fd(wldpy->display),
+                        wayland_dispatch_handler, NULL, wldpy);
+}
+
+static QemuDisplay qemu_display_wayland = {
+    .type       = DISPLAY_TYPE_WAYLAND,
+    .early_init = early_wayland_init,
+    .init       = wayland_init,
+};
+
+static void register_wayland(void)
+{
+    qemu_display_register(&qemu_display_wayland);
+}
+
+type_init(register_wayland);
-- 
2.30.2


