Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495B342541B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:29:33 +0200 (CEST)
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTSm-0007eV-B7
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8d-0005UX-C1
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:44 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8a-0007p0-G8
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:43 -0400
Received: by mail-ed1-x52a.google.com with SMTP id v18so22984916edc.11
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RDAgDr0ZqKWLzUuXz4UUGwIjly2iH/mSexR4KG3vqcM=;
 b=pJhV3EzRMuRoBHL+ZUoyPXsQtfeLmawVqXLFtl59cQKGxSd4n9tewuMKssmo81DRkY
 Bk4E2hF+PNnTT7djjS8lCwcNWoxHzEVL2txf1i8AWHRnbnw7wcplJLdqVQrzjFg+XO+K
 VW22LpBRNLgYxPSE5YPK9zQFgQ5wyieekHDIVAjOClQxljHEA2xpC/V4EP3FC4paUHkp
 zaso+VaY4El07qvRiUsvZ8ANKv1/nblOUYz07NUWn9xnsPU1NVFCVH6xlpKbGG8A1klK
 zYaR8b2w2xHVrKAQcPFIvabWcE1LVtqWmne3JoW+dez5X6M+Om+XOtb6VdZ8y5uhY1Ez
 uJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RDAgDr0ZqKWLzUuXz4UUGwIjly2iH/mSexR4KG3vqcM=;
 b=QzuAKhWbKTu6+/uGwfadPKcCwK8ZRiqO2dY7ctdxy4RWO5AmVqs6b/JKiy2SGVzxy8
 zdmmrR83O4FGvltEqJkR08t/dMdXGeHzjwU0i0xgP2IvrdKvODZaO1SRVS58ppLX2rJu
 /NVBeccyqMzqF3FcyEyfmXX/2Xlijb1PhFcyPr36nXGYJ9EVmhUF9vsokARdg0d1KTjs
 e6bk5qnMdLYLJ9XTU8Il3VPqRS2D1rzSQpuEZ+7M0DbBCjRTkjbymCsxiGOI74v0+KFh
 Astg5MGwaSvCM7pMGT4JwjdroJFu8zeaSrU4kDpJgXHU3XCdY8uppH1X/D1p+D84VaPB
 pDWg==
X-Gm-Message-State: AOAM532RGXmWo6W65GJl88Ucr2VIPKHIj4PeYSQuop5NJFNFZ8Kz1/lq
 TTNLyNAke+YypIfOOSFHNwnI/DiANHU=
X-Google-Smtp-Source: ABdhPJz9gP2OELbYaIiKey9RvA1jMkYPsiPWJMebWZaBndzSBt1m3OU6OBk92b2Ge/Z9jO3mrrD9ZQ==
X-Received: by 2002:a17:906:1e0c:: with SMTP id
 g12mr5517734ejj.155.1633612119004; 
 Thu, 07 Oct 2021 06:08:39 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/24] configure, meson: move Spice configure handling to meson
Date: Thu,  7 Oct 2021 15:08:23 +0200
Message-Id: <20211007130829.632254-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Add meson feature options for Spice and Spice protocol, and move
detection logic out of configure.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20211007102453.978041-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 chardev/meson.build |  2 +-
 configure           | 47 +--------------------------------------------
 meson.build         | 29 +++++++++++++++++-----------
 meson_options.txt   |  4 ++++
 ui/meson.build      |  4 ++--
 5 files changed, 26 insertions(+), 60 deletions(-)

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
diff --git a/configure b/configure
index bb3bb3e58f..016814d23b 100755
--- a/configure
+++ b/configure
@@ -369,7 +369,7 @@ pie=""
 qom_cast_debug="yes"
 trace_backends="log"
 trace_file="trace"
-spice="$default_feature"
+spice="auto"
 spice_protocol="auto"
 rbd="auto"
 smartcard="auto"
@@ -3229,41 +3229,6 @@ EOF
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
 
@@ -4233,16 +4198,6 @@ if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
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
diff --git a/meson.build b/meson.build
index 96f87630f0..0721309ed1 100644
--- a/meson.build
+++ b/meson.build
@@ -542,17 +542,20 @@ if not get_option('jack').auto() or have_system
                     method: 'pkg-config', kwargs: static_kwargs)
 endif
 
-spice = not_found
-spice_headers = not_found
 spice_protocol = not_found
-if 'CONFIG_SPICE' in config_host
-  spice = declare_dependency(compile_args: config_host['SPICE_CFLAGS'].split(),
-                             link_args: config_host['SPICE_LIBS'].split())
-  spice_headers = declare_dependency(compile_args: config_host['SPICE_CFLAGS'].split())
+if not get_option('spice_protocol').auto() or have_system
+  spice_protocol = dependency('spice-protocol', version: '>=0.12.3',
+                              required: get_option('spice_protocol'),
+                              method: 'pkg-config', kwargs: static_kwargs)
 endif
-if 'CONFIG_SPICE_PROTOCOL' in config_host
-  spice_protocol = declare_dependency(compile_args: config_host['SPICE_PROTOCOL_CFLAGS'].split())
+spice = not_found
+if not get_option('spice').auto() or have_system
+  spice = dependency('spice-server', version: '>=0.12.5',
+                     required: get_option('spice'),
+                     method: 'pkg-config', kwargs: static_kwargs)
 endif
+spice_headers = spice.partial_dependency(compile_args: true, includes: true)
+
 rt = cc.find_library('rt', required: false)
 libdl = not_found
 if 'CONFIG_PLUGIN' in config_host
@@ -1483,6 +1486,8 @@ config_host_data.set('CONFIG_STATX', has_statx)
 config_host_data.set('CONFIG_ZSTD', zstd.found())
 config_host_data.set('CONFIG_FUSE', fuse.found())
 config_host_data.set('CONFIG_FUSE_LSEEK', fuse_lseek.found())
+config_host_data.set('CONFIG_SPICE_PROTOCOL', spice_protocol.found())
+config_host_data.set('CONFIG_SPICE', spice.found())
 config_host_data.set('CONFIG_X11', x11.found())
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
@@ -1764,7 +1769,7 @@ have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
   (get_option('fuzzing') ? ['CONFIG_FUZZ=y'] : []) + \
   ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
-  ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
+  (spice.found() ? ['CONFIG_SPICE=y'] : []) + \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
   ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
   (x11.found() ? ['CONFIG_X11=y'] : []) + \
@@ -3342,8 +3347,10 @@ summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
 summary_info += {'libcap-ng support': libcap_ng}
 summary_info += {'bpf support':       libbpf}
-# TODO: add back protocol and server version
-summary_info += {'spice support':     config_host.has_key('CONFIG_SPICE')}
+summary_info += {'spice protocol support': spice_protocol}
+if spice_protocol.found()
+  summary_info += {'  spice server support': spice}
+endif
 summary_info += {'rbd support':       rbd}
 summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
 summary_info += {'smartcard support': cacard}
diff --git a/meson_options.txt b/meson_options.txt
index d8e67ae481..5a140af7f7 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -125,6 +125,10 @@ option('smartcard', type : 'feature', value : 'auto',
        description: 'CA smartcard emulation support')
 option('snappy', type : 'feature', value : 'auto',
        description: 'snappy compression support')
+option('spice', type : 'feature', value : 'auto',
+       description: 'Spice server support')
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
2.31.1



