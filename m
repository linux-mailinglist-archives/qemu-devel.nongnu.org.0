Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBDF427D88
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:13:31 +0200 (CEST)
Received: from localhost ([::1]:45398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJes-0002QQ-Ez
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJac-00051g-8Z
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:09:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJaa-0008G6-Ab
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:09:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633813743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlGQH7tT+dv3NlEIwKaVuvZxQ8G3doM3wk5rMJgTbVk=;
 b=KPpP2vQX6hy3aFCSuHVMAn3KzEOj6ubC+XOlTXCe7gXEWSFlX7GyTsllVUvsmQU82fiwm1
 JQzdEl/HJ0p+wIvWUWVGkGs0YGWK9Dwn1TsUjGa5ARRsqWmLa43j/GadNVyJy9pi6v82f0
 b8lorxg2S5JAgsL+VQ6qI6sQ6YwxDTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-xRAu9noCNoS6F0DYmfiELg-1; Sat, 09 Oct 2021 17:09:02 -0400
X-MC-Unique: xRAu9noCNoS6F0DYmfiELg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43E6B8042C3
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:09:01 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA1105C1B4;
 Sat,  9 Oct 2021 21:08:51 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/37] build-sys: move Spice configure handling to meson
Date: Sun, 10 Oct 2021 01:08:02 +0400
Message-Id: <20211009210838.2219430-2-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add meson feature options for Spice and Spice protocol, and move
detection logic out of configure.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure           | 48 ++-------------------------------------------
 meson.build         | 27 ++++++++++++-------------
 chardev/meson.build |  2 +-
 meson_options.txt   |  4 ++++
 ui/meson.build      |  4 ++--
 5 files changed, 22 insertions(+), 63 deletions(-)

diff --git a/configure b/configure
index 877bf3d76a..375cde2b44 100755
--- a/configure
+++ b/configure
@@ -372,7 +372,7 @@ pie=""
 qom_cast_debug="yes"
 trace_backends="log"
 trace_file="trace"
-spice="$default_feature"
+spice="auto"
 spice_protocol="auto"
 rbd="auto"
 smartcard="auto"
@@ -3525,41 +3525,6 @@ EOF
   fi
 fi
 
-##########################################
-# spice probe
-if test "$spice_protocol" != "no" ; then
-  spice_protocol_cflags=$($pkg_config --cflags spice-protocol 2>/dev/null)
-  if $pkg_config --atleast-version=0.12.3 spice-protocol; then
-    spice_protocol="yes"
-  else
-    if test "$spice_protocol" = "yes" ; then
-      feature_not_found "spice_protocol" \
-          "Install spice-protocol(>=0.12.3) devel"
-    fi
-    spice_protocol="no"
-  fi
-fi
-
-if test "$spice" != "no" ; then
-  cat > $TMPC << EOF
-#include <spice.h>
-int main(void) { spice_server_new(); return 0; }
-EOF
-  spice_cflags=$($pkg_config --cflags spice-protocol spice-server 2>/dev/null)
-  spice_libs=$($pkg_config --libs spice-protocol spice-server 2>/dev/null)
-  if $pkg_config --atleast-version=0.12.5 spice-server && \
-     test "$spice_protocol" = "yes" && \
-     compile_prog "$spice_cflags" "$spice_libs" ; then
-    spice="yes"
-  else
-    if test "$spice" = "yes" ; then
-      feature_not_found "spice" \
-          "Install spice-server(>=0.12.5) devel"
-    fi
-    spice="no"
-  fi
-fi
-
 ##########################################
 # check if we have VSS SDK headers for win
 
@@ -4659,16 +4624,6 @@ if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
   echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
 fi
 
-if test "$spice_protocol" = "yes" ; then
-  echo "CONFIG_SPICE_PROTOCOL=y" >> $config_host_mak
-  echo "SPICE_PROTOCOL_CFLAGS=$spice_protocol_cflags" >> $config_host_mak
-fi
-if test "$spice" = "yes" ; then
-  echo "CONFIG_SPICE=y" >> $config_host_mak
-  echo "SPICE_CFLAGS=$spice_cflags $spice_protocol_cflags" >> $config_host_mak
-  echo "SPICE_LIBS=$spice_libs" >> $config_host_mak
-fi
-
 if test "$opengl" = "yes" ; then
   echo "CONFIG_OPENGL=y" >> $config_host_mak
   echo "OPENGL_CFLAGS=$opengl_cflags" >> $config_host_mak
@@ -5202,6 +5157,7 @@ if test "$skip_meson" = no; then
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
+        -Dspice=$spice -Dspice_protocol=$spice_protocol \
         $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
 	-Dtcg_interpreter=$tcg_interpreter \
         $cross_arg \
diff --git a/meson.build b/meson.build
index 99a0a3e689..fe621413a4 100644
--- a/meson.build
+++ b/meson.build
@@ -442,17 +442,14 @@ jack = not_found
 if 'CONFIG_LIBJACK' in config_host
   jack = declare_dependency(link_args: config_host['JACK_LIBS'].split())
 endif
-spice = not_found
-spice_headers = not_found
-spice_protocol = not_found
-if 'CONFIG_SPICE' in config_host
-  spice = declare_dependency(compile_args: config_host['SPICE_CFLAGS'].split(),
-                             link_args: config_host['SPICE_LIBS'].split())
-  spice_headers = declare_dependency(compile_args: config_host['SPICE_CFLAGS'].split())
-endif
-if 'CONFIG_SPICE_PROTOCOL' in config_host
-  spice_protocol = declare_dependency(compile_args: config_host['SPICE_PROTOCOL_CFLAGS'].split())
-endif
+spice_protocol = dependency('spice-protocol', version: '>=0.12.3',
+                            required: get_option('spice_protocol'))
+spice = dependency('spice-server', version: '>=0.12.5',
+                   required: get_option('spice'))
+if spice.found()
+  config_host += { 'CONFIG_SPICE': 'y' } # for audio/meson.build
+endif
+spice_headers = spice.partial_dependency(compile_args: true, includes: true)
 rt = cc.find_library('rt', required: false)
 libdl = not_found
 if 'CONFIG_PLUGIN' in config_host
@@ -1293,6 +1290,9 @@ config_host_data.set('CONFIG_ZSTD', zstd.found())
 config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
 config_host_data.set('CONFIG_X11', x11.found())
+config_host_data.set('CONFIG_SPICE_PROTOCOL', spice_protocol.found())
+config_host_data.set('CONFIG_SPICE', spice.found())
+config_host_data.set('CONFIG_X11', x11.found())
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
 config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0])
@@ -1516,7 +1516,7 @@ endif
 have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
   ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
-  ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
+  (spice.found() ? ['CONFIG_SPICE=y'] : []) + \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
   ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
   (x11.found() ? ['CONFIG_X11=y'] : []) + \
@@ -3082,8 +3082,7 @@ summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
 summary_info += {'libcap-ng support': libcap_ng}
 summary_info += {'bpf support':       libbpf}
-# TODO: add back protocol and server version
-summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
+summary_info += {'spice support':     spice}
 summary_info += {'rbd support':       rbd}
 summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
 summary_info += {'smartcard support': cacard}
diff --git a/chardev/meson.build b/chardev/meson.build
index 32377af383..325ba2bdb9 100644
--- a/chardev/meson.build
+++ b/chardev/meson.build
@@ -35,7 +35,7 @@ if brlapi.found()
   chardev_modules += { 'baum': module_ss }
 endif
 
-if config_host.has_key('CONFIG_SPICE')
+if spice.found()
   module_ss = ss.source_set()
   module_ss.add(when: [spice], if_true: files('spice.c'))
   chardev_modules += { 'spice': module_ss }
diff --git a/meson_options.txt b/meson_options.txt
index 2c89e79e8b..b064b0b46c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -114,6 +114,10 @@ option('smartcard', type : 'feature', value : 'auto',
        description: 'CA smartcard emulation support')
 option('snappy', type : 'feature', value : 'auto',
        description: 'snappy compression support')
+option('spice', type : 'feature', value : 'auto',
+       description: 'Spice support')
+option('spice_protocol', type : 'feature', value : 'auto',
+       description: 'Spice protocol support')
 option('u2f', type : 'feature', value : 'auto',
        description: 'U2F emulation support')
 option('usb_redir', type : 'feature', value : 'auto',
diff --git a/ui/meson.build b/ui/meson.build
index a73beb0e54..ee8ef27714 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -89,7 +89,7 @@ if sdl.found()
   ui_modules += {'sdl' : sdl_ss}
 endif
 
-if config_host.has_key('CONFIG_SPICE')
+if spice.found()
   spice_core_ss = ss.source_set()
   spice_core_ss.add(spice, pixman, files(
     'spice-core.c',
@@ -99,7 +99,7 @@ if config_host.has_key('CONFIG_SPICE')
   ui_modules += {'spice-core' : spice_core_ss}
 endif
 
-if config_host.has_key('CONFIG_SPICE') and config_host.has_key('CONFIG_GIO')
+if spice.found() and config_host.has_key('CONFIG_GIO')
   spice_ss = ss.source_set()
   spice_ss.add(spice, gio, pixman, files('spice-app.c'))
   ui_modules += {'spice-app': spice_ss}
-- 
2.33.0.721.g106298f7f9


