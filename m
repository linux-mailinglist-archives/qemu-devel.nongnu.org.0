Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10B740A02D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 00:36:12 +0200 (CEST)
Received: from localhost ([::1]:53824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPuYd-0008Aa-ST
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 18:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mPuWe-0005Pq-3r
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:34:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:34057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1mPuWa-0007zA-Sz
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:34:07 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="244139501"
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="244139501"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 15:33:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,290,1624345200"; d="scan'208";a="432749437"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 15:33:52 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 2/2] ui: Add a plain Wayland backend for Qemu UI
Date: Mon, 13 Sep 2021 15:20:36 -0700
Message-Id: <20210913222036.3193732-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913222036.3193732-1-vivek.kasireddy@intel.com>
References: <20210913222036.3193732-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=vivek.kasireddy@intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 configure         |   8 +-
 meson.build       |  33 +++
 meson_options.txt |   2 +
 qapi/ui.json      |   3 +
 ui/meson.build    |  52 ++++
 ui/wayland.c      | 628 ++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 725 insertions(+), 1 deletion(-)
 create mode 100644 ui/wayland.c

diff --git a/configure b/configure
index da2501489f..02339681dc 100755
--- a/configure
+++ b/configure
@@ -406,6 +406,7 @@ cfi_debug="false"
 seccomp="auto"
 glusterfs="auto"
 gtk="auto"
+wayland="auto"
 tls_priority="NORMAL"
 gnutls="auto"
 nettle="auto"
@@ -1383,6 +1384,10 @@ for opt do
   ;;
   --enable-gtk) gtk="enabled"
   ;;
+  --disable-wayland) wayland="disabled"
+  ;;
+  --enable-wayland) wayland="enabled"
+  ;;
   --tls-priority=*) tls_priority="$optarg"
   ;;
   --disable-gnutls) gnutls="disabled"
@@ -1868,6 +1873,7 @@ disabled with --disable-FEATURE, default is enabled if available
   sdl             SDL UI
   sdl-image       SDL Image support for icons
   gtk             gtk UI
+  wayland         Wayland UI
   vte             vte support for the gtk UI
   curses          curses UI
   iconv           font glyph conversion support
@@ -5191,7 +5197,7 @@ if test "$skip_meson" = no; then
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
-        -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
+        -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dwayland=$wayland -Dsdl_image=$sdl_image \
         -Dlibusb=$libusb -Dsmartcard=$smartcard -Dusb_redir=$usb_redir -Dvte=$vte \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
diff --git a/meson.build b/meson.build
index 7d7d14a4bc..cda10b7d0f 100644
--- a/meson.build
+++ b/meson.build
@@ -927,6 +927,37 @@ if gtkx11.found()
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
+  wayland = declare_dependency(dependencies: [wlclientdep, wlprotocolsdep])
+endif
+
+if wayland.found() and get_option('sdl').enabled()
+  error('Wayland and SDL cannot be enabled at the same time')
+endif
+if wayland.found() and get_option('gtk').enabled()
+  error('Wayland and GTK+ cannot be enabled at the same time')
+endif
+if wayland.found() and get_option('cocoa').enabled()
+  error('Wayland and Cocoa cannot be enabled at the same time')
+endif
+
 vnc = not_found
 png = not_found
 jpeg = not_found
@@ -1256,6 +1287,7 @@ if glusterfs.found()
   config_host_data.set('CONFIG_GLUSTERFS_IOCB_HAS_STAT', glusterfs_iocb_has_stat)
 endif
 config_host_data.set('CONFIG_GTK', gtk.found())
+config_host_data.set('CONFIG_WAYLAND', wayland.found())
 config_host_data.set('CONFIG_VTE', vte.found())
 config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
 config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
@@ -3052,6 +3084,7 @@ summary_info += {'SDL support':       sdl.found()}
 summary_info += {'SDL image support': sdl_image.found()}
 # TODO: add back version
 summary_info += {'GTK support':       gtk.found()}
+summary_info += {'Wayland support':   wayland.found()}
 summary_info += {'pixman':            pixman.found()}
 # TODO: add back version
 summary_info += {'VTE support':       vte.found()}
diff --git a/meson_options.txt b/meson_options.txt
index a9a9b8f4c6..6c0e27e83b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -104,6 +104,8 @@ option('rbd', type : 'feature', value : 'auto',
        description: 'Ceph block device driver')
 option('gtk', type : 'feature', value : 'auto',
        description: 'GTK+ user interface')
+option('wayland', type : 'feature', value : 'auto',
+       description: 'Wayland user interface')
 option('sdl', type : 'feature', value : 'auto',
        description: 'SDL user interface')
 option('sdl_image', type : 'feature', value : 'auto',
diff --git a/qapi/ui.json b/qapi/ui.json
index b2cf7a6759..8da0baa0bd 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1112,6 +1112,8 @@
 #                DRI device. Graphical display need to be paired with
 #                VNC or Spice. (Since 3.1)
 #
+# @wayland: The Wayland user interface.
+#
 # @curses: Display video output via curses.  For graphics device
 #          models which support a text mode, QEMU can display this
 #          output using a curses/ncurses interface. Nothing is
@@ -1135,6 +1137,7 @@
     { 'name': 'none' },
     { 'name': 'gtk', 'if': 'CONFIG_GTK' },
     { 'name': 'sdl', 'if': 'CONFIG_SDL' },
+    { 'name': 'wayland', 'if': 'CONFIG_WAYLAND' },
     { 'name': 'egl-headless',
               'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
     { 'name': 'curses', 'if': 'CONFIG_CURSES' },
diff --git a/ui/meson.build b/ui/meson.build
index a73beb0e54..86fc324c82 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -64,6 +64,58 @@ if config_host.has_key('CONFIG_OPENGL') and gbm.found()
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
index 0000000000..9e011bd701
--- /dev/null
+++ b/ui/wayland.c
@@ -0,0 +1,628 @@
+/*
+ * Wayland UI -- A simple Qemu UI backend to share Guest Compositor buffers
+ * with Host Wayland compositors directly.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * Mostly (boilerplate) based on:
+ * https://cgit.freedesktop.org/wayland/weston/tree/clients/simple-dmabuf-egl.c
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "sysemu/sysemu.h"
+#include "ui/console.h"
+#include "ui/input.h"
+#include "ui/kbd-state.h"
+#include "keymaps.h"
+#include <linux/input.h>
+#include <wayland-client.h>
+#include "xdg-shell-client-protocol.h"
+#include "fullscreen-shell-unstable-v1-client-protocol.h"
+#include "linux-dmabuf-unstable-v1-client-protocol.h"
+
+#define MAX_BUFFERS 4
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
+    QKbdState *kbd;
+    struct wl_surface *surface;
+    struct xdg_surface *xdg_surface;
+    struct xdg_toplevel *xdg_toplevel;
+    struct wl_callback *callback;
+    wayland_buffer buffers[MAX_BUFFERS];
+    wayland_buffer *new_buffer;
+    int width, height;
+    bool wait_for_configure;
+    int last_x, last_y;
+    bool last_set;
+} wayland_window;
+
+typedef struct wayland_input {
+    wayland_window *focus;
+    struct wl_seat *seat;
+    struct wl_pointer *pointer;
+    struct wl_keyboard *keyboard;
+    const uint16_t *keycode_map;
+    size_t keycode_maplen;
+} wayland_input;
+
+static const struct wl_callback_listener frame_listener;
+
+static void xdg_surface_handle_configure(void *data,
+                                         struct xdg_surface *surface,
+			                 uint32_t serial)
+{
+    wayland_window *window = data;
+
+    xdg_surface_ack_configure(surface, serial);
+    window->wait_for_configure = false;
+}
+
+static const struct xdg_surface_listener xdg_surface_listener = {
+    xdg_surface_handle_configure,
+};
+
+static void xdg_toplevel_handle_configure(void *data,
+                                          struct xdg_toplevel *toplevel,
+			                  int32_t width, int32_t height,
+			                  struct wl_array *states)
+{
+}
+
+static void xdg_toplevel_handle_close(void *data,
+                                      struct xdg_toplevel *xdg_toplevel)
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
+static void wayland_window_redraw(void *data, struct wl_callback *callback,
+                                  uint32_t time)
+{
+    wayland_window *window = data;
+
+    if (callback) {
+        assert(window->callback == callback);
+        wl_callback_destroy(callback);
+        window->callback = NULL;
+    }
+    graphic_hw_gl_block(window->dcl.con, false);
+    graphic_hw_gl_flushed(window->dcl.con);
+}
+
+static const struct wl_callback_listener frame_listener = {
+    wayland_window_redraw
+};
+
+static void wayland_buffer_release(void *data, struct wl_buffer *buf)
+{
+    wayland_buffer *buffer = data;
+    QemuDmaBuf *dmabuf = buffer->dmabuf;
+
+    dmabuf->fence_fd = -1;
+    graphic_hw_gl_flushed(buffer->con);
+    buffer->busy = false;
+    wl_buffer_destroy(buf);
+}
+
+static const struct wl_buffer_listener buffer_listener = {
+    wayland_buffer_release
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
+        error_report("Can't find free buffer\n");
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
+    window->width = dmabuf->width;
+    window->height = dmabuf->height;
+    dmabuf->fence_fd = 1;
+    wl_buffer_add_listener(buffer->buffer, &buffer_listener, buffer);
+}
+
+static void wayland_scanout_flush(DisplayChangeListener *dcl,
+                                  uint32_t x, uint32_t y,
+                                  uint32_t w, uint32_t h)
+{
+    wayland_window *window = container_of(dcl, wayland_window, dcl);
+    struct wl_region *region;
+
+    graphic_hw_gl_block(window->new_buffer->con, true);
+    region = wl_compositor_create_region(window->display->compositor);
+    wl_region_add(region, 0, 0, window->width, window->height);
+    wl_surface_set_opaque_region(window->surface, region);
+    wl_region_destroy(region);
+
+    window->callback = wl_surface_frame(window->surface);
+    wl_callback_add_listener(window->callback, &frame_listener, window);
+    wl_surface_attach(window->surface, window->new_buffer->buffer, 0, 0);
+    wl_surface_damage(window->surface, 0, 0, window->width, window->height);
+    wl_surface_commit(window->surface);
+    wl_display_flush(window->display->display);
+    window->new_buffer->busy = true;
+}
+
+static void dmabuf_modifier(void *data,
+                            struct zwp_linux_dmabuf_v1 *zwp_linux_dmabuf,
+                            uint32_t format, uint32_t modifier_hi,
+                            uint32_t modifier_lo)
+{
+}
+
+static void dmabuf_format(void *data,
+                          struct zwp_linux_dmabuf_v1 *zwp_linux_dmabuf,
+                          uint32_t format)
+{
+}
+
+static const struct zwp_linux_dmabuf_v1_listener dmabuf_listener = {
+    dmabuf_format,
+    dmabuf_modifier
+};
+
+static void xdg_wm_base_ping(void *data, struct xdg_wm_base *shell,
+                             uint32_t serial)
+{
+    xdg_wm_base_pong(shell, serial);
+}
+
+static const struct xdg_wm_base_listener wm_base_listener = {
+    xdg_wm_base_ping,
+};
+
+static void pointer_handle_enter(void *data, struct wl_pointer *pointer,
+                                 uint32_t serial, struct wl_surface *surface,
+                                 wl_fixed_t sx, wl_fixed_t sy)
+{
+    wayland_input *input = data;
+
+    if (!surface) {
+        return;
+    }
+    input->focus = wl_surface_get_user_data(surface);
+    wl_pointer_set_cursor(pointer, serial, NULL, 0, 0);
+}
+
+static void pointer_handle_leave(void *data, struct wl_pointer *pointer,
+                                 uint32_t serial, struct wl_surface *surface)
+{
+    wayland_input *input = data;
+
+    if (!surface || !input->focus) {
+        return;
+    }
+    input->focus = NULL;
+}
+
+static void pointer_handle_motion(void *data, struct wl_pointer *pointer,
+                                  uint32_t time, wl_fixed_t sx, wl_fixed_t sy)
+{
+    wayland_input *input = data;
+    wayland_window *window = input->focus;
+    int x, y;
+
+    if (!window) {
+        return;
+    }
+    x = wl_fixed_to_int(sx);
+    y = wl_fixed_to_int(sy);
+    if (qemu_input_is_absolute()) {
+        qemu_input_queue_abs(window->dcl.con, INPUT_AXIS_X,
+                             x, 0, window->width);
+        qemu_input_queue_abs(window->dcl.con, INPUT_AXIS_Y,
+                             y, 0, window->height);
+        qemu_input_event_sync();
+    } else if (window->last_set) {
+        qemu_input_queue_rel(window->dcl.con, INPUT_AXIS_X,
+                             x - window->last_x);
+        qemu_input_queue_rel(window->dcl.con, INPUT_AXIS_Y,
+                             y - window->last_y);
+        qemu_input_event_sync();
+    }
+    window->last_x = x;
+    window->last_y = y;
+    window->last_set = true;
+}
+
+static void pointer_handle_button(void *data, struct wl_pointer *wl_pointer,
+                                  uint32_t serial, uint32_t time,
+                                  uint32_t button, uint32_t state)
+{
+    wayland_input *input = data;
+    wayland_window *window = input->focus;
+    InputButton btn;
+
+    if (!window) {
+        return;
+    }
+    if (button == BTN_LEFT) {
+        btn = INPUT_BUTTON_LEFT;
+    } else if (button == BTN_MIDDLE) {
+        btn = INPUT_BUTTON_MIDDLE;
+    } else if (button == BTN_RIGHT) {
+        btn = INPUT_BUTTON_RIGHT;
+    } else if (button == BTN_SIDE) {
+        btn = INPUT_BUTTON_SIDE;
+    } else {
+        return;
+    }
+    qemu_input_queue_btn(window->dcl.con, btn,
+                         state == WL_POINTER_BUTTON_STATE_PRESSED);
+    qemu_input_event_sync();
+}
+
+static void pointer_handle_axis(void *data, struct wl_pointer *wl_pointer,
+                                uint32_t time, uint32_t axis, wl_fixed_t value)
+{
+    wayland_input *input = data;
+    wayland_window *window = input->focus;
+    InputButton btn;
+    int delta_y = 0;
+
+    if (!window) {
+        return;
+    }
+    if (axis == WL_POINTER_AXIS_VERTICAL_SCROLL) {
+        delta_y = wl_fixed_to_int(value) / 10;
+    }
+    if (delta_y > 0) {
+        btn = INPUT_BUTTON_WHEEL_DOWN;
+    } else {
+        btn = INPUT_BUTTON_WHEEL_UP;
+    }
+
+    qemu_input_queue_btn(window->dcl.con, btn, true);
+    qemu_input_event_sync();
+    qemu_input_queue_btn(window->dcl.con, btn, false);
+    qemu_input_event_sync();
+}
+
+static const struct wl_pointer_listener pointer_listener = {
+    pointer_handle_enter,
+    pointer_handle_leave,
+    pointer_handle_motion,
+    pointer_handle_button,
+    pointer_handle_axis,
+};
+
+static void keyboard_handle_keymap(void *data, struct wl_keyboard *keyboard,
+                                   uint32_t format, int fd, uint32_t size)
+{
+    close(fd);
+}
+
+static void keyboard_handle_enter(void *data, struct wl_keyboard *keyboard,
+                                  uint32_t serial, struct wl_surface *surface,
+                                  struct wl_array *keys)
+{
+}
+
+static void keyboard_handle_leave(void *data, struct wl_keyboard *keyboard,
+                                  uint32_t serial, struct wl_surface *surface)
+{
+}
+
+static void keyboard_handle_key(void *data, struct wl_keyboard *keyboard,
+                                uint32_t serial, uint32_t time, uint32_t key,
+                                uint32_t state)
+{
+    wayland_input *input = data;
+    wayland_window *window = input->focus;
+    int keycode = key + 8, qcode;
+
+    if (!window || !input->keycode_map ||
+        keycode > input->keycode_maplen) {
+        return;
+    }
+    qcode = input->keycode_map[keycode];
+    qkbd_state_key_event(window->kbd, qcode, state);
+}
+
+static void keyboard_handle_modifiers(void *data, struct wl_keyboard *keyboard,
+                                      uint32_t serial, uint32_t mods_depressed,
+                                      uint32_t mods_latched, uint32_t mods_locked,
+                                      uint32_t group)
+{
+}
+
+static const struct wl_keyboard_listener keyboard_listener = {
+    keyboard_handle_keymap,
+    keyboard_handle_enter,
+    keyboard_handle_leave,
+    keyboard_handle_key,
+    keyboard_handle_modifiers,
+};
+
+static void seat_handle_capabilities(void *data, struct wl_seat *seat,
+                                     enum wl_seat_capability caps)
+{
+    wayland_input *input = data;
+
+    if ((caps & WL_SEAT_CAPABILITY_POINTER) && !input->pointer) {
+        input->pointer = wl_seat_get_pointer(seat);
+        wl_pointer_add_listener(input->pointer, &pointer_listener, input);
+    } else if (!(caps & WL_SEAT_CAPABILITY_POINTER) && input->pointer) {
+        wl_pointer_destroy(input->pointer);
+        input->pointer = NULL;
+    }
+
+    if ((caps & WL_SEAT_CAPABILITY_KEYBOARD) && !input->keyboard) {
+        input->keyboard = wl_seat_get_keyboard(seat);
+        wl_keyboard_add_listener(input->keyboard, &keyboard_listener, input);
+    } else if (!(caps & WL_SEAT_CAPABILITY_KEYBOARD) && input->keyboard) {
+        wl_keyboard_destroy(input->keyboard);
+        input->keyboard = NULL;
+    }
+}
+
+static const struct wl_seat_listener seat_listener = {
+    seat_handle_capabilities,
+};
+
+static void registry_handle_global(void *data, struct wl_registry *registry,
+                                   uint32_t id, const char *interface,
+                                   uint32_t version)
+{
+    wayland_display *display = data;
+    wayland_input *input;
+
+    if (strcmp(interface, "wl_compositor") == 0) {
+        display->compositor = wl_registry_bind(registry,
+			                 id, &wl_compositor_interface, 1);
+    } else if (strcmp(interface, "xdg_wm_base") == 0) {
+	display->wm_base = wl_registry_bind(registry,
+				      id, &xdg_wm_base_interface, 1);
+	xdg_wm_base_add_listener(display->wm_base, &wm_base_listener, display);
+    } else if (strcmp(interface, "wl_seat") == 0) {
+        input = g_new0(wayland_input, 1);
+        input->keycode_maplen = qemu_input_map_xorgevdev_to_qcode_len;
+        input->keycode_map = qemu_input_map_xorgevdev_to_qcode;
+        input->seat = wl_registry_bind(registry, id,
+                                       &wl_seat_interface, 1);
+        wl_seat_add_listener(input->seat, &seat_listener, input);
+    } else if (strcmp(interface, "zwp_fullscreen_shell_v1") == 0) {
+	display->fshell = wl_registry_bind(registry,
+	                             id, &zwp_fullscreen_shell_v1_interface,
+	                             1);
+    } else if (strcmp(interface, "zwp_linux_dmabuf_v1") == 0) {
+	display->dmabuf = wl_registry_bind(registry,
+	                             id, &zwp_linux_dmabuf_v1_interface, 3);
+	zwp_linux_dmabuf_v1_add_listener(display->dmabuf, &dmabuf_listener,
+	                                 display);
+    }
+}
+
+static void registry_handle_global_remove(void *data,
+                                          struct wl_registry *registry,
+                                          uint32_t name)
+{
+}
+
+static const struct wl_registry_listener registry_listener = {
+    registry_handle_global,
+    registry_handle_global_remove
+};
+
+static const DisplayChangeListenerOps wayland_ops = {
+    .dpy_name                = "wayland",
+    .dpy_refresh             = wayland_refresh,
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
+static wayland_display *wayland_create_display(void)
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
+        error_report("No zwp_linux_dmabuf global\n");
+	exit(1);
+    }
+    return display;
+}
+
+static wayland_window *wayland_create_window(wayland_display *display)
+{
+    wayland_window *window;
+
+    window = g_new0(wayland_window, 1);
+    window->display = display;
+    window->surface = wl_compositor_create_surface(display->compositor);
+    wl_surface_set_user_data(window->surface, window);
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
+        window->wait_for_configure = true;
+        wl_surface_commit(window->surface);
+    } else if (display->fshell) {
+        zwp_fullscreen_shell_v1_present_surface(display->fshell,
+	                        window->surface,
+		                ZWP_FULLSCREEN_SHELL_V1_PRESENT_METHOD_DEFAULT,
+		                NULL);
+    } else {
+         assert(0);
+    }
+    wl_display_roundtrip(display->display);
+    return window;
+}
+
+static void wayland_prepare_for_events(struct wl_display *display)
+{
+    while (wl_display_prepare_read(display) != 0)
+        wl_display_dispatch_pending(display);
+    wl_display_flush(display);
+}
+
+static void wayland_dispatch_handler(void *opaque)
+{
+    wayland_display *display = opaque;
+
+    wl_display_read_events(display->display);
+    wl_display_dispatch_pending(display->display);
+    wayland_prepare_for_events(display->display);
+}
+
+static void wayland_init(DisplayState *ds, DisplayOptions *opts)
+{
+    QemuConsole *con;
+    wayland_display *display;
+    wayland_window *window;
+    int idx;
+
+    warn_report("Wayland UI backend should not be used with Guest compositors \
+                 that do single buffer/frontbuffer rendering\n");
+
+    display = wayland_create_display();
+    for (idx = 0;; idx++) {
+        con = qemu_console_lookup_by_index(idx);
+        if (!con || !qemu_console_is_graphic(con)) {
+            break;
+        }
+
+        window = wayland_create_window(display);
+        window->dcl.con = con;
+        window->dcl.ops = &wayland_ops;
+        window->kbd = qkbd_state_init(con);
+        register_displaychangelistener(&window->dcl);
+    }
+    wayland_prepare_for_events(display->display);
+    qemu_set_fd_handler(wl_display_get_fd(display->display),
+                        wayland_dispatch_handler, NULL, display);
+}
+
+static void early_wayland_init(DisplayOptions *opts)
+{
+    display_opengl = 1;
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


