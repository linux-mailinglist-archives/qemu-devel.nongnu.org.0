Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F96029CDA0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 04:14:02 +0100 (CET)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXbuT-00013P-Cc
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 23:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kXbns-0003j6-PN
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 23:07:12 -0400
Received: from mail-pj1-f52.google.com ([209.85.216.52]:38971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kXbnq-0006hO-SX
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 23:07:12 -0400
Received: by mail-pj1-f52.google.com with SMTP id m3so1759514pjf.4
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 20:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TFv+jzbcxfBCXHrHML15OJRYt8oDAHyplY5ejHivOFI=;
 b=J0Wox2Qao1RuQLmf43H67uiSy66t3sqYUmK+tmRUMuZ1rzSZiV3lD6Nm2yGh6/KF6Y
 Xt7MqSoc//N2uvDLwx+l8HO1oVRCfPrfFC1o5EEiCJFX36h7imgch3WxCst2b0rFhjQD
 +e89WOEnaFDqbKLLN3qWSkxxw5WxPJOuOFRXciNWV5CbgI7Ylv8jWf+/kEQFsKiTI6e4
 VrLl/31tbhAXf54XvwcVGwFAaWfa6uRI1fIFakgTEVNjHi2nL9MI9472MfRjhVSdMHnG
 0ttuMAWcLmRYGw19nRy7OKzr0F7WrpWcyloUM/CTmokwU1FE3BkBlJqODrNCJxiunu3L
 DBqA==
X-Gm-Message-State: AOAM531Dfe3USg+sXQv2yPMOD6fA+xcEKVmehWkVGnSc86nAYRH+MQLF
 v5UO7Wf8oSQYmapi+Hoo/cr8F3eJbO8=
X-Google-Smtp-Source: ABdhPJzasArS4ehRnltbUkz5AoGBss1vFCNtpU9DoS7iKao8pCiOy/AkVxGaHEytTQRPv+baclMwgA==
X-Received: by 2002:a17:90b:4a83:: with SMTP id
 lp3mr5025354pjb.138.1603854429286; 
 Tue, 27 Oct 2020 20:07:09 -0700 (PDT)
Received: from localhost.localdomain ([73.93.155.93])
 by smtp.gmail.com with ESMTPSA id n6sm3407219pjj.34.2020.10.27.20.07.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 20:07:08 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/7] coroutine: add libucontext as external library
Date: Tue, 27 Oct 2020 20:06:58 -0700
Message-Id: <20201028030701.14086-5-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028030701.14086-1-j@getutm.app>
References: <20201028030701.14086-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.52; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f52.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 23:07:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Joelle van Dyne <j@getutm.app>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

iOS does not support ucontext natively for aarch64 and the sigaltstack is
also unsupported (even worse, it fails silently, see:
https://openradar.appspot.com/13002712 )

As a workaround we include a library implementation of ucontext and add it
as a build option.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure                 | 23 ++++++++++++++++++++---
 meson.build               | 29 ++++++++++++++++++++++++++++-
 util/coroutine-ucontext.c |  9 +++++++++
 .gitmodules               |  3 +++
 libucontext               |  1 +
 meson_options.txt         |  2 ++
 6 files changed, 63 insertions(+), 4 deletions(-)
 create mode 160000 libucontext

diff --git a/configure b/configure
index 7fbaefc255..0fef867a9c 100755
--- a/configure
+++ b/configure
@@ -1745,7 +1745,7 @@ Advanced options (experts only):
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
-                           ucontext, sigaltstack, windows
+                           ucontext, libucontext, sigaltstack, windows
   --enable-gcov            enable test coverage analysis with gcov
   --disable-blobs          disable installing provided firmware blobs
   --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
@@ -4869,6 +4869,8 @@ if test "$coroutine" = ""; then
     coroutine=win32
   elif test "$ucontext_works" = "yes"; then
     coroutine=ucontext
+  elif test "$ios" = "yes"; then
+    coroutine=libucontext
   else
     coroutine=sigaltstack
   fi
@@ -4892,12 +4894,27 @@ else
       error_exit "only the 'windows' coroutine backend is valid for Windows"
     fi
     ;;
+  libucontext)
+  ;;
   *)
     error_exit "unknown coroutine backend $coroutine"
     ;;
   esac
 fi
 
+case $coroutine in
+libucontext)
+  git_submodules="${git_submodules} libucontext"
+  mkdir -p libucontext
+  coroutine_impl=ucontext
+  libucontext="enabled"
+  ;;
+*)
+  coroutine_impl=$coroutine
+  libucontext="disabled"
+  ;;
+esac
+
 if test "$coroutine_pool" = ""; then
   coroutine_pool=yes
 fi
@@ -6451,7 +6468,7 @@ if test "$rbd" = "yes" ; then
   echo "RBD_LIBS=$rbd_libs" >> $config_host_mak
 fi
 
-echo "CONFIG_COROUTINE_BACKEND=$coroutine" >> $config_host_mak
+echo "CONFIG_COROUTINE_BACKEND=$coroutine_impl" >> $config_host_mak
 if test "$coroutine_pool" = "yes" ; then
   echo "CONFIG_COROUTINE_POOL=1" >> $config_host_mak
 else
@@ -7033,7 +7050,7 @@ NINJA=$ninja $meson setup \
         -Dcocoa=$cocoa -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f \
-        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
+        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Ducontext=$libucontext \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         $cross_arg \
diff --git a/meson.build b/meson.build
index 48c95150fe..0beb199303 100644
--- a/meson.build
+++ b/meson.build
@@ -1243,9 +1243,35 @@ if not fdt.found() and fdt_required.length() > 0
   error('fdt not available but required by targets ' + ', '.join(fdt_required))
 endif
 
+ucontext = not_found
+slirp_opt = 'disabled'
+if get_option('ucontext').enabled()
+  if not fs.is_dir(meson.current_source_dir() / 'libucontext/arch' / cpu)
+    error('libucontext is wanted but not implemented for host ' + cpu)
+  endif
+  arch = host_machine.cpu()
+  ucontext_cargs = ['-DG_LOG_DOMAIN="ucontext"', '-DCUSTOM_IMPL']
+  ucontext_files = [
+    'libucontext/arch' / arch / 'getcontext.S',
+    'libucontext/arch' / arch / 'setcontext.S',
+    'libucontext/arch' / arch / 'makecontext.c',
+    'libucontext/arch' / arch / 'startcontext.S',
+    'libucontext/arch' / arch / 'swapcontext.S',
+  ]
+
+  ucontext_inc = include_directories('libucontext/include')
+  libucontext = static_library('ucontext',
+                               sources: ucontext_files,
+                               c_args: ucontext_cargs,
+                               include_directories: ucontext_inc)
+  ucontext = declare_dependency(link_with: libucontext,
+                                include_directories: ucontext_inc)
+endif
+
 config_host_data.set('CONFIG_CAPSTONE', capstone.found())
 config_host_data.set('CONFIG_FDT', fdt.found())
 config_host_data.set('CONFIG_SLIRP', slirp.found())
+config_host_data.set('CONFIG_LIBUCONTEXT', ucontext.found())
 
 #####################
 # Generated sources #
@@ -1461,7 +1487,7 @@ util_ss.add_all(trace_ss)
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), m, glib, socket, malloc])
+                             dependencies: [util_ss.dependencies(), m, glib, socket, malloc, ucontext])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
@@ -2118,6 +2144,7 @@ if targetos == 'windows'
   summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
 endif
 summary_info += {'seccomp support':   config_host.has_key('CONFIG_SECCOMP')}
+summary_info += {'libucontext support': ucontext.found()}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
 summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
 summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
index 904b375192..1e1dd43512 100644
--- a/util/coroutine-ucontext.c
+++ b/util/coroutine-ucontext.c
@@ -23,7 +23,16 @@
 #undef _FORTIFY_SOURCE
 #endif
 #include "qemu/osdep.h"
+#if defined(CONFIG_LIBUCONTEXT)
+#include <libucontext.h>
+#define ucontext_t libucontext_ucontext_t
+#define getcontext libucontext_getcontext
+#define setcontext libucontext_setcontext
+#define swapcontext libucontext_swapcontext
+#define makecontext libucontext_makecontext
+#else
 #include <ucontext.h>
+#endif
 #include "qemu/coroutine_int.h"
 
 #ifdef CONFIG_VALGRIND_H
diff --git a/.gitmodules b/.gitmodules
index 2bdeeacef8..065b52867f 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://git.qemu.org/git/vbootrom.git
+[submodule "libucontext"]
+	path = libucontext
+	url = https://github.com/utmapp/libucontext.git
diff --git a/libucontext b/libucontext
new file mode 160000
index 0000000000..7094e4c427
--- /dev/null
+++ b/libucontext
@@ -0,0 +1 @@
+Subproject commit 7094e4c42723b6178a4e2b60d4631d8a88f40719
diff --git a/meson_options.txt b/meson_options.txt
index 48ab4ce7d0..c62c696729 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -62,6 +62,8 @@ option('vnc_sasl', type : 'feature', value : 'auto',
        description: 'SASL authentication for VNC server')
 option('xkbcommon', type : 'feature', value : 'auto',
        description: 'xkbcommon support')
+option('ucontext', type : 'feature', value : 'disabled',
+       description: 'libucontext support')
 
 option('capstone', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
-- 
2.28.0


