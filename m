Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0C44A8A6D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:42:57 +0100 (CET)
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFg8G-0005AM-Kl
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:42:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzk-0004o7-HB
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:09 -0500
Received: from [2a00:1450:4864:20::530] (port=45847
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzg-0008Eh-8U
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:08 -0500
Received: by mail-ed1-x530.google.com with SMTP id p7so7423581edc.12
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=juIZeRSO6SXa5bRhnso0ZwIYdjLmQr9FDPRnCV9jBBU=;
 b=I8DiYSHGS5CWUaEY7PP+PPtm6lgjaGmpZ+n3/UDDw6M5Zil8TC9aY8HRisx6GqB7NR
 nmrxZdhYzubSh6zhl6MtDM0mKt2Fx6AeO4+U38s0BHqmQrg+T8daErai41a+9awWmRM/
 at4ykZ2bt6RO0+SOjxaBEgpfkBlW+UCgZWVGGQhGQhd/digv3hyC3wR+l64hiOnaBAxJ
 /EaBnGcCgquryk+EgoPIJtPm0jnyUxY53fp1wDSNe9r3JGpyZ43w2PJEgIssIzUMQRAl
 vptoSnZsVbrq9oJNbt0I0Ely/QXyi6Tkx+Ko8QYD2oTyTJRNbcVRLLixmfFb5ZjfE/zv
 enRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=juIZeRSO6SXa5bRhnso0ZwIYdjLmQr9FDPRnCV9jBBU=;
 b=wslEOHovbYFLPJSXZlk4/B5FBytx9QMI+KVyulsDtxLIiNsC1vscJYsxCnXD1pp5er
 FVbcMpT8ahstllkl1WnfFbBIzW9iad+61JiRM5vOl1N8ryDvSH/jQtqCGe5DInc3uIYr
 xSlBzJVyi3RtUVpfY9KoGSYeMexSzErpWMLvgRt1Ne02IJjj+crIj3zrGsBHvvan2DPo
 zinc3yMT0MXSCteniBtOYUpU1O2gjqFWkKpsgMND7kcgWtZbRW7anm2f8Gp5QMtbO5KY
 w6tAjdT1h5dfHjZHL7DflCpNJe4JFt78s9IEGVCm/Y7A6PzZQJfdRn/eFSvBeFxY4Jzx
 +PSg==
X-Gm-Message-State: AOAM532A6oxsKn0Jhjuu6yr3ejXX2HaB9z1VYwi1800xjPg2n8y3Uh+u
 7J8zdrfc5XWKVT8qa6AkLurun4hMGes=
X-Google-Smtp-Source: ABdhPJzGDk2WmszJ46PSNxLaDlV9nFRkRVszAHcgZGWs7SNED9H8qOmi/LVi0DZdw7feK/3YnL8xuw==
X-Received: by 2002:a05:6402:22ed:: with SMTP id
 dn13mr14338149edb.430.1643909642912; 
 Thu, 03 Feb 2022 09:34:02 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:02 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/27] meson: use .require() and .disable_auto_if() method for
 features
Date: Thu,  3 Feb 2022 18:33:34 +0100
Message-Id: <20220203173359.292068-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
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
index 637ee08eb1..9ef0286f21 100644
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



