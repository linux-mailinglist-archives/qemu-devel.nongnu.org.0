Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74342EA353
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 03:25:32 +0100 (CET)
Received: from localhost ([::1]:39924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwc2N-0005Es-Sq
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 21:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwbyE-0000nG-Vo
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:21:15 -0500
Received: from mail-pg1-f176.google.com ([209.85.215.176]:42647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1kwbyA-0001zh-5x
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 21:21:12 -0500
Received: by mail-pg1-f176.google.com with SMTP id g15so20309141pgu.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 18:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v5BNWwkrmsr0+1jr5dkAm77cFUsSTxwd9AJb5H3W96g=;
 b=YjWgUl4FmBV2bXmL1Tm8qutVeObO3mH5bxjQg8f9ULwHVn5B7XL+FzzlkAPsRx9dZP
 0wzf2Sq7gDj5WD7BwHWupLwPEZaoVqhg29Hc+yOdSxGKeVKWxZ4ei64sEHBC45evOrt+
 gLuf5Sjos0czHdn3L+SLX9ILr3KSXdjy5r8yQhyBzSZKQPOXzNjNgmTU4C6MLXUixR7K
 zz0PQhkdMF5sWsDabbRvbadNb8daXgy6uPtJf6Ms75xJPdij6caOlwVzrE3u+lVmHC9f
 WLCl4QQCo10rG9lUIFK8QxRgl+3CjKEhFfqVZNGy7Q6wQHFAHus/Cnt1p9AHnCzSfxr3
 5wPw==
X-Gm-Message-State: AOAM531eQW7uhv3+D6yUk4bD3OUBTYIIW0MibbWA/YmHwvshCUO5btHC
 Aw84/oYVg1rGXw5s1qxc6sCt61EpA6k=
X-Google-Smtp-Source: ABdhPJzSAwsgsWglXpqN0n/X3ZsZwe2Rq38nXWuNCcwC4RWo3b1+ythfjPIR8jRoFELCt0ZDsX84oQ==
X-Received: by 2002:a63:1401:: with SMTP id u1mr61580204pgl.229.1609813263330; 
 Mon, 04 Jan 2021 18:21:03 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.186])
 by smtp.gmail.com with ESMTPSA id y27sm57674386pfr.78.2021.01.04.18.21.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Jan 2021 18:21:02 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/7] coroutine: add libucontext as external library
Date: Mon,  4 Jan 2021 18:20:52 -0800
Message-Id: <20210105022055.12113-5-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210105022055.12113-1-j@getutm.app>
References: <20210105022055.12113-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.176;
 envelope-from=osy86github@gmail.com; helo=mail-pg1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>
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
 meson.build               | 11 ++++++++++-
 util/coroutine-ucontext.c |  9 +++++++++
 .gitmodules               |  3 +++
 meson_options.txt         |  2 ++
 subprojects/libucontext   |  1 +
 6 files changed, 45 insertions(+), 4 deletions(-)
 create mode 160000 subprojects/libucontext

diff --git a/configure b/configure
index c1a08f0171..09dd22ebad 100755
--- a/configure
+++ b/configure
@@ -1767,7 +1767,7 @@ Advanced options (experts only):
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
-                           ucontext, sigaltstack, windows
+                           ucontext, libucontext, sigaltstack, windows
   --enable-gcov            enable test coverage analysis with gcov
   --disable-blobs          disable installing provided firmware blobs
   --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
@@ -4913,6 +4913,8 @@ if test "$coroutine" = ""; then
     coroutine=win32
   elif test "$ucontext_works" = "yes"; then
     coroutine=ucontext
+  elif test "$ios" = "yes"; then
+    coroutine=libucontext
   else
     coroutine=sigaltstack
   fi
@@ -4936,12 +4938,27 @@ else
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
+  git_submodules="${git_submodules} subprojects/libucontext"
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
@@ -6487,7 +6504,7 @@ if test "$rbd" = "yes" ; then
   echo "RBD_LIBS=$rbd_libs" >> $config_host_mak
 fi
 
-echo "CONFIG_COROUTINE_BACKEND=$coroutine" >> $config_host_mak
+echo "CONFIG_COROUTINE_BACKEND=$coroutine_impl" >> $config_host_mak
 if test "$coroutine_pool" = "yes" ; then
   echo "CONFIG_COROUTINE_POOL=1" >> $config_host_mak
 else
@@ -7069,7 +7086,7 @@ NINJA=$ninja $meson setup \
         -Dcocoa=$cocoa -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
-        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
+        -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt -Ducontext=$libucontext \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
diff --git a/meson.build b/meson.build
index ee333b7a94..900dbc36c8 100644
--- a/meson.build
+++ b/meson.build
@@ -1308,9 +1308,17 @@ if not fdt.found() and fdt_required.length() > 0
   error('fdt not available but required by targets ' + ', '.join(fdt_required))
 endif
 
+ucontext = dependency('libucontext', required : false)
+if not ucontext.found() and get_option('ucontext').enabled()
+  libucontext_proj = subproject('libucontext',
+                                default_options: ['freestanding=true'])
+  ucontext = libucontext_proj.get_variable('libucontext_dep')
+endif
+
 config_host_data.set('CONFIG_CAPSTONE', capstone.found())
 config_host_data.set('CONFIG_FDT', fdt.found())
 config_host_data.set('CONFIG_SLIRP', slirp.found())
+config_host_data.set('CONFIG_LIBUCONTEXT', ucontext.found())
 
 #####################
 # Generated sources #
@@ -1528,7 +1536,7 @@ util_ss.add_all(trace_ss)
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), m, glib, socket, malloc])
+                             dependencies: [util_ss.dependencies(), m, glib, socket, malloc, ucontext])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
@@ -2188,6 +2196,7 @@ if targetos == 'windows'
   summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
 endif
 summary_info += {'seccomp support':   config_host.has_key('CONFIG_SECCOMP')}
+summary_info += {'libucontext support': ucontext.found()}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
 summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
 summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
index 904b375192..220c57a743 100644
--- a/util/coroutine-ucontext.c
+++ b/util/coroutine-ucontext.c
@@ -23,7 +23,16 @@
 #undef _FORTIFY_SOURCE
 #endif
 #include "qemu/osdep.h"
+#if defined(CONFIG_LIBUCONTEXT)
+#include <libucontext/libucontext.h>
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
index 2bdeeacef8..4f02eed79a 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://git.qemu.org/git/vbootrom.git
+[submodule "libucontext"]
+	path = subprojects/libucontext
+	url = https://github.com/utmapp/libucontext.git
diff --git a/meson_options.txt b/meson_options.txt
index 74ac853548..0a93bccea3 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -70,6 +70,8 @@ option('fuse', type: 'feature', value: 'auto',
        description: 'FUSE block device export')
 option('fuse_lseek', type : 'feature', value : 'auto',
        description: 'SEEK_HOLE/SEEK_DATA support for FUSE exports')
+option('ucontext', type : 'feature', value : 'disabled',
+       description: 'libucontext support')
 
 option('capstone', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
diff --git a/subprojects/libucontext b/subprojects/libucontext
new file mode 160000
index 0000000000..fc3b5e724e
--- /dev/null
+++ b/subprojects/libucontext
@@ -0,0 +1 @@
+Subproject commit fc3b5e724e21c2c01e2c93b344ab0e34b5a6649b
-- 
2.28.0


