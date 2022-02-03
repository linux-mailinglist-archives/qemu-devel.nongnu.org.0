Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44D14A8A39
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:38:02 +0100 (CET)
Received: from localhost ([::1]:42278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFg3V-0007fJ-Pg
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:38:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzi-0004ky-8j
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:06 -0500
Received: from [2a00:1450:4864:20::62a] (port=37645
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzf-0008EY-Tx
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:05 -0500
Received: by mail-ej1-x62a.google.com with SMTP id ah7so10954134ejc.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yyvCpeDksj6CAh++Ga/ZmKPlAI3Y8Jz7GLBG6NJLt1g=;
 b=equnzJQSUysrj3D27xol5QVJ7lAni2tksR7qA/rTJiHYFd+cq90+GZt1Ani892XeRA
 P79N4mYwDP4hYb7blMRjAN9AI1k51uXveoRcaWDSTIpo8GFHtbEr0rcqUbLyRbrIGpDg
 SZ0+4cvjwIi3i6zG7cV562UMhV8DZhEo1xW+8p9Og0ZtpYK+TbJowlXV/Qch05XLK1Fr
 /puhG2gsjnn+tw0mu1JT5iz8Itr89xFtULfZEjoEHgdXivIPQBz7XxiMAKV8eyDuFY35
 RIaEPSk7PwdWXWqrB2THLJHBVLalJUm1ZvPkfphQn7mj0y3KpJJRw2eoiXrouqvuKStg
 cPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yyvCpeDksj6CAh++Ga/ZmKPlAI3Y8Jz7GLBG6NJLt1g=;
 b=z4T1m+4xgwgTkuMHXgWoQwp/WFmaJkEoF7JFDgpw4C3uFAZlQYiWiqqM3kFMvvFpS8
 9/6TKlcdUU032R06HnZWRw5raaPqmW4ZtajRQ7hE8knfrqnObiJwX2aGZwncOK+PpO1F
 FS43Mceya1FHAcFyKGZTQ43Pib1k6D8X0XjInRmrf42/A2yX0zdsu5vTfK5SXC2j2rLa
 KNRyQmPAvg3rwRJ2aOwBHgPf5IuImx6OZs5Fjn6m6oGedOEkC1ZrAwTLls1Qodu3eVD+
 07n6ChASQ1iXN5WDXnD+hDbr8cxpaD7FLX3A7xmT9kX2udvy/N6eGlfUZyc7HW+RbaBm
 C9aQ==
X-Gm-Message-State: AOAM531c4zbAnivLiYWhHBU8nEPMfEYLwzdXA0GfDiHc317Q5oCSbfrE
 JPWBZ08v13VMqKlmbwVbUwDfVjmM4go=
X-Google-Smtp-Source: ABdhPJzG4IlbCwbGidUhpbTkL35K9yfU58Pv+bpxoRJbwUKfJO9QHpi4xPT5AHTEQ9Xhissc+raeIA==
X-Received: by 2002:a17:907:7ba0:: with SMTP id
 ne32mr31589443ejc.540.1643909642214; 
 Thu, 03 Feb 2022 09:34:02 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/27] meson: use .allowed() method for features
Date: Thu,  3 Feb 2022 18:33:33 +0100
Message-Id: <20220203173359.292068-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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

The method is now in 0.59, using it simplifies some boolean conditions.
The other new methods .require() and .disable_auto_if() can be used too,
but introducing them is not just a matter of search-and-replace.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build       | 42 +++++++++++++++++++++---------------------
 tests/meson.build |  2 +-
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meson.build b/meson.build
index 82db1e7e74..637ee08eb1 100644
--- a/meson.build
+++ b/meson.build
@@ -1,4 +1,4 @@
-project('qemu', ['c'], meson_version: '>=0.58.2',
+project('qemu', ['c'], meson_version: '>=0.59.3',
         default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
                           'b_staticpic=false', 'stdsplit=false'],
         version: files('VERSION'))
@@ -99,7 +99,7 @@ else
 endif
 
 kvm_targets_c = '""'
-if not get_option('kvm').disabled() and targetos == 'linux'
+if get_option('kvm').allowed() and targetos == 'linux'
   kvm_targets_c = '"' + '" ,"'.join(kvm_targets) + '"'
 endif
 config_host_data.set('CONFIG_KVM_TARGETS', kvm_targets_c)
@@ -276,7 +276,7 @@ endif
 if targetos != 'linux' and get_option('multiprocess').enabled()
   error('Multiprocess QEMU is supported only on Linux')
 endif
-multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
+multiprocess_allowed = targetos == 'linux' and get_option('multiprocess').allowed()
 
 # Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
@@ -313,7 +313,7 @@ elif targetos == 'haiku'
             cc.find_library('network'),
             cc.find_library('bsd')]
 elif targetos == 'openbsd'
-  if not get_option('tcg').disabled() and target_dirs.length() > 0
+  if get_option('tcg').allowed() and target_dirs.length() > 0
     # Disable OpenBSD W^X if available
     emulator_link_args = cc.get_supported_link_arguments('-Wl,-z,wxneeded')
   endif
@@ -321,16 +321,16 @@ endif
 
 # Target-specific configuration of accelerators
 accelerators = []
-if not get_option('kvm').disabled() and targetos == 'linux'
+if get_option('kvm').allowed() and targetos == 'linux'
   accelerators += 'CONFIG_KVM'
 endif
-if not get_option('xen').disabled() and 'CONFIG_XEN_BACKEND' in config_host
+if get_option('xen').allowed() and 'CONFIG_XEN_BACKEND' in config_host
   accelerators += 'CONFIG_XEN'
-  have_xen_pci_passthrough = not get_option('xen_pci_passthrough').disabled() and targetos == 'linux'
+  have_xen_pci_passthrough = get_option('xen_pci_passthrough').allowed() and targetos == 'linux'
 else
   have_xen_pci_passthrough = false
 endif
-if not get_option('whpx').disabled() and targetos == 'windows'
+if get_option('whpx').allowed() and targetos == 'windows'
   if get_option('whpx').enabled() and host_machine.cpu() != 'x86_64'
     error('WHPX requires 64-bit host')
   elif cc.has_header('WinHvPlatform.h', required: get_option('whpx')) and \
@@ -338,14 +338,14 @@ if not get_option('whpx').disabled() and targetos == 'windows'
     accelerators += 'CONFIG_WHPX'
   endif
 endif
-if not get_option('hvf').disabled()
+if get_option('hvf').allowed()
   hvf = dependency('appleframeworks', modules: 'Hypervisor',
                    required: get_option('hvf'))
   if hvf.found()
     accelerators += 'CONFIG_HVF'
   endif
 endif
-if not get_option('hax').disabled()
+if get_option('hax').allowed()
   if get_option('hax').enabled() or targetos in ['windows', 'darwin', 'netbsd']
     accelerators += 'CONFIG_HAX'
   endif
@@ -358,7 +358,7 @@ if targetos == 'netbsd'
 endif
 
 tcg_arch = host_arch
-if not get_option('tcg').disabled()
+if get_option('tcg').allowed()
   if host_arch == 'unknown'
     if get_option('tcg_interpreter')
       warning('Unsupported CPU @0@, will use TCG with TCI (slow)'.format(cpu))
@@ -472,7 +472,7 @@ libattr_test = '''
 
 libattr = not_found
 have_old_libattr = false
-if not get_option('attr').disabled()
+if get_option('attr').allowed()
   if cc.links(libattr_test)
     libattr = declare_dependency()
   else
@@ -628,7 +628,7 @@ endif
 mpathlibs = [libudev]
 mpathpersist = not_found
 mpathpersist_new_api = false
-if targetos == 'linux' and have_tools and not get_option('mpath').disabled()
+if targetos == 'linux' and have_tools and get_option('mpath').allowed()
   mpath_test_source_new = '''
     #include <libudev.h>
     #include <mpath_persist.h>
@@ -697,7 +697,7 @@ endif
 
 iconv = not_found
 curses = not_found
-if have_system and not get_option('curses').disabled()
+if have_system and get_option('curses').allowed()
   curses_test = '''
     #if defined(__APPLE__) || defined(__OpenBSD__)
     #define _XOPEN_SOURCE_EXTENDED 1
@@ -759,7 +759,7 @@ if have_system and not get_option('curses').disabled()
       endforeach
     endif
   endif
-  if not get_option('iconv').disabled()
+  if get_option('iconv').allowed()
     foreach link_args : [ ['-liconv'], [] ]
       # Programs will be linked with glib and this will bring in libiconv on FreeBSD.
       # We need to use libiconv if available because mixing libiconv's headers with
@@ -938,7 +938,7 @@ if liblzfse.found() and not cc.links('''
 endif
 
 oss = not_found
-if have_system and not get_option('oss').disabled()
+if get_option('oss').allowed() and have_system
   if not cc.has_header('sys/soundcard.h')
     # not found
   elif targetos == 'netbsd'
@@ -1092,7 +1092,7 @@ vnc = not_found
 png = not_found
 jpeg = not_found
 sasl = not_found
-if have_system and not get_option('vnc').disabled()
+if get_option('vnc').allowed() and have_system
   vnc = declare_dependency() # dummy dependency
   png = dependency('libpng', required: get_option('vnc_png'),
                    method: 'pkg-config', kwargs: static_kwargs)
@@ -1236,7 +1236,7 @@ selinux = dependency('libselinux',
 malloc = []
 if get_option('malloc') == 'system'
   has_malloc_trim = \
-    not get_option('malloc_trim').disabled() and \
+    get_option('malloc_trim').allowed() and \
     cc.links('''#include <malloc.h>
                 int main(void) { malloc_trim(0); return 0; }''')
 else
@@ -1291,7 +1291,7 @@ fuse = dependency('fuse3', required: get_option('fuse'),
                   kwargs: static_kwargs)
 
 fuse_lseek = not_found
-if not get_option('fuse_lseek').disabled()
+if get_option('fuse_lseek').allowed()
   if fuse.version().version_compare('>=3.8')
     # Dummy dependency
     fuse_lseek = declare_dependency()
@@ -1714,7 +1714,7 @@ config_host_data.set('HAVE_MLOCKALL', cc.links(gnu_source_prefix + '''
   }'''))
 
 have_l2tpv3 = false
-if not get_option('l2tpv3').disabled() and have_system
+if get_option('l2tpv3').allowed() and have_system
   have_l2tpv3 = cc.has_type('struct mmsghdr',
     prefix: gnu_source_prefix + '''
       #include <sys/socket.h>
@@ -1723,7 +1723,7 @@ endif
 config_host_data.set('CONFIG_L2TPV3', have_l2tpv3)
 
 have_netmap = false
-if not get_option('netmap').disabled() and have_system
+if get_option('netmap').allowed() and have_system
   have_netmap = cc.compiles('''
     #include <inttypes.h>
     #include <net/if.h>
diff --git a/tests/meson.build b/tests/meson.build
index 079c8f3727..1d05109eb4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -85,7 +85,7 @@ if 'CONFIG_TCG' in config_all
   subdir('fp')
 endif
 
-if not get_option('tcg').disabled()
+if get_option('tcg').allowed()
   if 'CONFIG_PLUGIN' in config_host
     subdir('plugin')
   endif
-- 
2.34.1



