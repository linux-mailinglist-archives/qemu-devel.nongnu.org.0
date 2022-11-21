Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A85B632472
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:56:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox7H3-0008Rz-LY; Mon, 21 Nov 2022 08:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ox7H1-0008Qy-6O; Mon, 21 Nov 2022 08:55:47 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1ox7Gz-0003mG-3s; Mon, 21 Nov 2022 08:55:46 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 95CFC2202B;
 Mon, 21 Nov 2022 13:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669038942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=g9q4FGhZw2UgBomtwqm8QUraGc89iBR5ZHkBmLrF/U8=;
 b=iFc4MeTDXEmAj2IXzxBzjM7jeafvW4qydF52zWDHQgMBBILcCPTXMXhAWJ4eWIAE97bkW2
 3QcQMFt4W2TJlc2HCsCHM3Xzh6AkSklo8AtDVTBdUcbitzOA9Jg2DAIITThsspY/y89MEC
 /lYFUxJ+rLV/PwwHrp2APsqO2H3nTqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669038942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=g9q4FGhZw2UgBomtwqm8QUraGc89iBR5ZHkBmLrF/U8=;
 b=7Zurpk1OUHm/Y6EgwiDI2HFAymyw4Q7Ek39UtXKxE0TOV+ZHWrR79CgNuyGA22b7M0KgR4
 Ck84y7B1wV9JCuCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50C6B1377F;
 Mon, 21 Nov 2022 13:55:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WSQQEl6De2NnCgAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 21 Nov 2022 13:55:42 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Jim Fehlig <jfehlig@suse.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
Subject: [PATCH v2] gtk: disable GTK Clipboard with a new meson option
Date: Mon, 21 Nov 2022 14:55:38 +0100
Message-Id: <20221121135538.14625-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
---
 meson.build                   | 5 +++++
 meson_options.txt             | 7 +++++++
 scripts/meson-buildoptions.sh | 3 +++
 ui/gtk.c                      | 2 ++
 ui/meson.build                | 5 ++++-
 5 files changed, 21 insertions(+), 1 deletion(-)

v1 -> v2:

* fixed a too long line in scripts/meson-buildoptions.sh (checkpatch)

* meson.build: set have_gtk_clipboard variable once, avoid duplication (Jim)

* mention the warnings about experimental nature of the feature in commit

diff --git a/meson.build b/meson.build
index cf3e517e56..5c6b5a1c75 100644
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
diff --git a/meson_options.txt b/meson_options.txt
index 66128178bf..4b749ca549 100644
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
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 2cb0de5601..aa6e30ea91 100644
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
diff --git a/ui/gtk.c b/ui/gtk.c
index 7ec21f7798..4817623c8f 100644
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
diff --git a/ui/meson.build b/ui/meson.build
index ec13949776..c1b137bf33 100644
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
2.26.2


