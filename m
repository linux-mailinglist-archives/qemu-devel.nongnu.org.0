Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1E14B67E6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:42:38 +0100 (CET)
Received: from localhost ([::1]:52208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuM1-0002ek-VK
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:42:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCG-0003pV-4g
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:32 -0500
Received: from [2a00:1450:4864:20::632] (port=39608
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCE-0008Pm-1I
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:31 -0500
Received: by mail-ej1-x632.google.com with SMTP id p9so20020774ejd.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=43tWTC/QmGlzNc8eErt+KiOBhEr8qRUI8niGq88khb4=;
 b=ps4JRhbA9nE/+gDREjIusWiQQXjB753unQI57s4BK72qFTixRnYcth3QIJPUJzxkoE
 Bx0QINIiypR3G00+M9b8uFZE2NDZexfSfYbSZcL4Agi8wjIBu/MI61++X8/nZjCQMdTn
 QYLXYeo4Nmn66pjuoTB/mz49RpYIer73f8epLtHI9aql9D0kKCSq6D2gN1LLlz72x1e3
 TYYpMYCo9JlXaw9FaNJEsMpkiRiEfWCErFSJVAy3a/bvKdhYYG+pD0wI51KxI4hRCEZ3
 FnjZQ77WssIATTOYK+0Pa9BAGsmknt75PIofYst1NAW9LHVJc9TikZnsATWWtPcBCtwc
 xNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=43tWTC/QmGlzNc8eErt+KiOBhEr8qRUI8niGq88khb4=;
 b=Ryw2NeS+EcnDSqBAO5v6APIfv7WKAjY6x2FQ7hboCVQCHLgCdoS7dZb7vlHboOKjuC
 wzdC2Zr3DlQTuXR61DiFs0Ht4oLyXwfIy0Vuq55JFAFhbd/txsC0smAHDzUghHQqJm+F
 DszpniJZ8TA50gshMLhFzXGSR3bDtRz9h7I7SmdOTm50H5AXLn49xfNWYfhnbqpgWuUl
 QTfLVtAYxLBvSUbgg0MszD4PqDniW1p3pCzXIKctdiV8K1nOqHJIu1o+Ke5loo6lKRid
 CRGoCQz6qihTeOP+sgCjOm5oQeYo1g+d7wVFD+IYAVi+0L7PagDni0gNeTmuhNC21w9n
 fCsQ==
X-Gm-Message-State: AOAM530ViaGksqUPc/iDNN2NBsjhz39QSBFO6N/RFVh2nxymYtWyKp70
 3H2iazfhiuvLU/kpqw0vPa98aiso08k=
X-Google-Smtp-Source: ABdhPJyszuqNOgUwsxWQ+TKMtl/YJYlc+NfisqyzeEavOfV0lbyRQMg8I8/1siXiG8u42omeRtXQsg==
X-Received: by 2002:a17:906:190d:: with SMTP id
 a13mr2170033eje.339.1644917548737; 
 Tue, 15 Feb 2022 01:32:28 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/30] meson: use .require() and .disable_auto_if() method for
 features
Date: Tue, 15 Feb 2022 10:31:58 +0100
Message-Id: <20220215093223.110827-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The method is now in 0.59, using it simplifies some conditionals.

There is a small change, which is to build virtfs-proxy-helper in a
tools-only build.  This is done for consistency with other tools,
which are not culled by the absence of system emulator binaries.

.disable_auto_if() would also be useful to check for packages,
for example

-linux_io_uring = not_found
-if not get_option('linux_io_uring').auto() or have_block
-  linux_io_uring = dependency('liburing', required: get_option('linux_io_uring'),
-                              method: 'pkg-config', kwargs: static_kwargs)
-endif
+linux_io_uring = dependency('liburing',
+  required: get_option('linux_io_uring').disable_auto_if(not have_block),
+  method: 'pkg-config', kwargs: static_kwargs)

This change however is much larger and I am not sure about the improved
readability, so I am not performing it right now.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build       | 74 ++++++++++++++++++-----------------------------
 tools/meson.build | 31 ++++++--------------
 2 files changed, 37 insertions(+), 68 deletions(-)

diff --git a/meson.build b/meson.build
index af136b780d..15dfd66a3e 100644
--- a/meson.build
+++ b/meson.build
@@ -269,14 +269,12 @@ if 'syslog' in get_option('trace_backends') and not cc.compiles('''
 endif
 
 # Miscellaneous Linux-only features
-if targetos != 'linux' and get_option('mpath').enabled()
-  error('Multipath is supported only on Linux')
-endif
+get_option('mpath') \
+  .require(targetos == 'linux', error_message: 'Multipath is supported only on Linux')
 
-if targetos != 'linux' and get_option('multiprocess').enabled()
-  error('Multiprocess QEMU is supported only on Linux')
-endif
-multiprocess_allowed = targetos == 'linux' and get_option('multiprocess').allowed()
+multiprocess_allowed = get_option('multiprocess') \
+  .require(targetos == 'linux', error_message: 'Multiprocess QEMU is supported only on Linux') \
+  .allowed()
 
 # Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
@@ -1268,19 +1266,13 @@ statx_test = gnu_source_prefix + '''
 
 has_statx = cc.links(statx_test)
 
-have_vhost_user_blk_server = (targetos == 'linux' and
-    'CONFIG_VHOST_USER' in config_host)
-
-if get_option('vhost_user_blk_server').enabled()
-    if targetos != 'linux'
-        error('vhost_user_blk_server requires linux')
-    elif 'CONFIG_VHOST_USER' not in config_host
-        error('vhost_user_blk_server requires vhost-user support')
-    endif
-elif get_option('vhost_user_blk_server').disabled() or not have_system
-    have_vhost_user_blk_server = false
-endif
-
+have_vhost_user_blk_server = get_option('vhost_user_blk_server') \
+  .require(targetos == 'linux',
+           error_message: 'vhost_user_blk_server requires linux') \
+  .require('CONFIG_VHOST_USER' in config_host,
+           error_message: 'vhost_user_blk_server requires vhost-user support') \
+  .disable_auto_if(not have_system) \
+  .allowed()
 
 if get_option('fuse').disabled() and get_option('fuse_lseek').enabled()
   error('Cannot enable fuse-lseek while fuse is disabled')
@@ -1407,36 +1399,26 @@ endif
 have_host_block_device = (targetos != 'darwin' or
     cc.has_header('IOKit/storage/IOMedia.h'))
 
-dbus_display = false
-if not get_option('dbus_display').disabled()
-  # FIXME enable_modules shouldn't be necessary, but: https://github.com/mesonbuild/meson/issues/8333
-  dbus_display = gio.version().version_compare('>=2.64') and config_host.has_key('GDBUS_CODEGEN') and enable_modules
-  if get_option('dbus_display').enabled() and not dbus_display
-    error('Requirements missing to enable -display dbus (glib>=2.64 && --enable-modules)')
-  endif
-endif
+# FIXME enable_modules shouldn't be necessary, but: https://github.com/mesonbuild/meson/issues/8333
+dbus_display = get_option('dbus_display') \
+  .require(gio.version().version_compare('>=2.64'),
+           error_message: '-display dbus requires glib>=2.64') \
+  .require(enable_modules,
+           error_message: '-display dbus requires --enable-modules') \
+  .require(config_host.has_key('GDBUS_CODEGEN'),
+           error_message: '-display dbus requires gdbus-codegen') \
+  .allowed()
 
-have_virtfs = (targetos == 'linux' and
-    have_system and
-    libattr.found() and
-    libcap_ng.found())
+have_virtfs = get_option('virtfs') \
+    .require(targetos == 'linux',
+             error_message: 'virtio-9p (virtfs) requires Linux') \
+    .require(libattr.found() and libcap_ng.found(),
+             error_message: 'virtio-9p (virtfs) requires libcap-ng-devel and libattr-devel') \
+    .disable_auto_if(not have_tools and not have_system) \
+    .allowed()
 
 have_virtfs_proxy_helper = have_virtfs and have_tools
 
-if get_option('virtfs').enabled()
-  if not have_virtfs
-    if targetos != 'linux'
-      error('virtio-9p (virtfs) requires Linux')
-    elif not libcap_ng.found() or not libattr.found()
-      error('virtio-9p (virtfs) requires libcap-ng-devel and libattr-devel')
-    elif not have_system
-      error('virtio-9p (virtfs) needs system emulation support')
-    endif
-  endif
-elif get_option('virtfs').disabled()
-  have_virtfs = false
-endif
-
 foreach k : get_option('trace_backends')
   config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
 endforeach
diff --git a/tools/meson.build b/tools/meson.build
index 3e5a0abfa2..46977af84f 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -1,25 +1,12 @@
-have_virtiofsd = (targetos == 'linux' and
-    have_tools and
-    seccomp.found() and
-    libcap_ng.found() and
-    'CONFIG_VHOST_USER' in config_host)
-
-if get_option('virtiofsd').enabled()
-  if not have_virtiofsd
-    if targetos != 'linux'
-      error('virtiofsd requires Linux')
-    elif not seccomp.found() or not libcap_ng.found()
-      error('virtiofsd requires libcap-ng-devel and seccomp-devel')
-    elif 'CONFIG_VHOST_USER' not in config_host
-      error('virtiofsd needs vhost-user support')
-    else
-      # Disabled all the tools but virtiofsd.
-      have_virtiofsd = true
-    endif
-  endif
-elif get_option('virtiofsd').disabled() or not have_system
-  have_virtiofsd = false
-endif
+have_virtiofsd = get_option('virtiofsd') \
+    .require(targetos == 'linux',
+             error_message: 'virtiofsd requires Linux') \
+    .require(seccomp.found() and libcap_ng.found(),
+             error_message: 'virtiofsd requires libcap-ng-devel and seccomp-devel') \
+    .require('CONFIG_VHOST_USER' in config_host,
+             error_message: 'virtiofsd needs vhost-user-support') \
+    .disable_auto_if(not have_tools and not have_system) \
+    .allowed()
 
 if have_virtiofsd
   subdir('virtiofsd')
-- 
2.34.1



