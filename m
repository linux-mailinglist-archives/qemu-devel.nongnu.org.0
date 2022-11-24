Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EB56372D9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 08:26:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy6bb-0007Py-0P; Thu, 24 Nov 2022 02:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oy6bV-0007PD-Sy
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:25:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oy6bT-00008Z-Vh
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:25:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669274699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zjq55+9FxN57mufm4SGK33kA6iAZqhKHKnlB2qrQYtg=;
 b=BcFXoPt07M6gxUf5MGhbcK947UUoam3JN9Sq4pVCvIS3gwDf8KY8Ck+GkdvKfx1mJ2nFhF
 yOR7yIF/DVCD9F3/cy6rMb8bUhhLdo7x0TrTSA1yzX58emDmQbpTC4wkEPqQ8f1ZdBrUb+
 ZxhHRMnTVq4/mGYweqH59irl3Z/1Cnc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-JAD4HqUgNVmBuim-Rp4rMQ-1; Thu, 24 Nov 2022 02:24:55 -0500
X-MC-Unique: JAD4HqUgNVmBuim-Rp4rMQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28F6E85A59D;
 Thu, 24 Nov 2022 07:24:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9090B111E3EB;
 Thu, 24 Nov 2022 07:24:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 613711800620; Thu, 24 Nov 2022 08:16:02 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Jim Fehlig <jfehlig@suse.com>
Subject: [PULL 2/4] gtk: disable GTK Clipboard with a new meson option
Date: Thu, 24 Nov 2022 08:16:00 +0100
Message-Id: <20221124071602.1109150-3-kraxel@redhat.com>
In-Reply-To: <20221124071602.1109150-1-kraxel@redhat.com>
References: <20221124071602.1109150-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

From: Claudio Fontana <cfontana@suse.de>

The GTK Clipboard implementation may cause guest hangs.

Therefore implement new configure switch: --enable-gtk-clipboard,

as a meson option disabled by default, which warns in the help
text about the experimental nature of the feature.
Regenerate the meson build options to include it.

The initialization of the clipboard is gtk.c, as well as the
compilation of gtk-clipboard.c are now conditional on this new
option to be set.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1150
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jim Fehlig <jfehlig@suse.com>
Message-Id: <20221121135538.14625-1-cfontana@suse.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson_options.txt             | 7 +++++++
 ui/gtk.c                      | 2 ++
 meson.build                   | 5 +++++
 scripts/meson-buildoptions.sh | 3 +++
 ui/meson.build                | 5 ++++-
 5 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meson_options.txt b/meson_options.txt
index 66128178bffa..4b749ca54900 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -219,6 +219,13 @@ option('vnc_sasl', type : 'feature', value : 'auto',
        description: 'SASL authentication for VNC server')
 option('vte', type : 'feature', value : 'auto',
        description: 'vte support for the gtk UI')
+
+# GTK Clipboard implementation is disabled by default, since it may cause hangs
+# of the guest VCPUs. See gitlab issue 1150:
+# https://gitlab.com/qemu-project/qemu/-/issues/1150
+
+option('gtk_clipboard', type: 'feature', value : 'disabled',
+       description: 'clipboard support for the gtk UI (EXPERIMENTAL, MAY HANG)')
 option('xkbcommon', type : 'feature', value : 'auto',
        description: 'xkbcommon support')
 option('zstd', type : 'feature', value : 'auto',
diff --git a/ui/gtk.c b/ui/gtk.c
index 7ec21f7798ef..4817623c8f3f 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2403,7 +2403,9 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         opts->u.gtk.show_tabs) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->show_tabs_item));
     }
+#ifdef CONFIG_GTK_CLIPBOARD
     gd_clipboard_init(s);
+#endif /* CONFIG_GTK_CLIPBOARD */
 }
 
 static void early_gtk_display_init(DisplayOptions *opts)
diff --git a/meson.build b/meson.build
index cf3e517e56d8..5c6b5a1c757f 100644
--- a/meson.build
+++ b/meson.build
@@ -1246,6 +1246,8 @@ endif
 gtk = not_found
 gtkx11 = not_found
 vte = not_found
+have_gtk_clipboard = get_option('gtk_clipboard').enabled()
+
 if not get_option('gtk').auto() or have_system
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
@@ -1264,6 +1266,8 @@ if not get_option('gtk').auto() or have_system
                        required: get_option('vte'),
                        kwargs: static_kwargs)
     endif
+  elif have_gtk_clipboard
+    error('GTK clipboard requested, but GTK not found')
   endif
 endif
 
@@ -1842,6 +1846,7 @@ if glusterfs.found()
 endif
 config_host_data.set('CONFIG_GTK', gtk.found())
 config_host_data.set('CONFIG_VTE', vte.found())
+config_host_data.set('CONFIG_GTK_CLIPBOARD', have_gtk_clipboard)
 config_host_data.set('CONFIG_LIBATTR', have_old_libattr)
 config_host_data.set('CONFIG_LIBCAP_NG', libcap_ng.found())
 config_host_data.set('CONFIG_EBPF', libbpf.found())
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 2cb0de5601ef..aa6e30ea911e 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -93,6 +93,7 @@ meson_options_help() {
   printf "%s\n" '  glusterfs       Glusterfs block device driver'
   printf "%s\n" '  gnutls          GNUTLS cryptography support'
   printf "%s\n" '  gtk             GTK+ user interface'
+  printf "%s\n" '  gtk-clipboard   clipboard support for GTK (EXPERIMENTAL, MAY HANG)'
   printf "%s\n" '  guest-agent     Build QEMU Guest Agent'
   printf "%s\n" '  guest-agent-msi Build MSI package for the QEMU Guest Agent'
   printf "%s\n" '  hax             HAX acceleration support'
@@ -274,6 +275,8 @@ _meson_option_parse() {
     --disable-gprof) printf "%s" -Dgprof=false ;;
     --enable-gtk) printf "%s" -Dgtk=enabled ;;
     --disable-gtk) printf "%s" -Dgtk=disabled ;;
+    --enable-gtk-clipboard) printf "%s" -Dgtk_clipboard=enabled ;;
+    --disable-gtk-clipboard) printf "%s" -Dgtk_clipboard=disabled ;;
     --enable-guest-agent) printf "%s" -Dguest_agent=enabled ;;
     --disable-guest-agent) printf "%s" -Dguest_agent=disabled ;;
     --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=enabled ;;
diff --git a/ui/meson.build b/ui/meson.build
index ec139497766a..c1b137bf330c 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -97,7 +97,10 @@ if gtk.found()
   softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
 
   gtk_ss = ss.source_set()
-  gtk_ss.add(gtk, vte, pixman, files('gtk.c', 'gtk-clipboard.c'))
+  gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
+  if have_gtk_clipboard
+    gtk_ss.add(files('gtk-clipboard.c'))
+  endif
   gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
   gtk_ss.add(when: opengl, if_true: files('gtk-gl-area.c'))
   gtk_ss.add(when: [x11, opengl], if_true: files('gtk-egl.c'))
-- 
2.38.1


