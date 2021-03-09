Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA688331D8B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 04:27:31 +0100 (CET)
Received: from localhost ([::1]:47396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJT1u-0000oA-RX
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 22:27:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJT19-0000Nk-Hx
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 22:26:43 -0500
Received: from mail-pl1-f170.google.com ([209.85.214.170]:45988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJT17-0003Zp-Ic
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 22:26:43 -0500
Received: by mail-pl1-f170.google.com with SMTP id u18so5855485plc.12
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 19:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JHux4Vj0a3895MKSpvKMl3Nm9rrh8xma7G117mXJNoI=;
 b=nn2L9MDW/FFYSIQGN7JDrE7NTZDJGrowbMp0P05lL/fDd7jVX9QkjgMem9frpwnmZJ
 8uECapj9/QC9ItGGZE39lR5B/8bOOLoY7O9HkWMRVouf3KDSeQRJeB5dFfta+w58e65L
 0X4PIgeGeZA6rZgISIQskr8If3xxgNZtPge6Hpc2hxznm4+wcVWcL+Dly1eMUdTu/Zxj
 UZudMuUplQtem+2SZyYKBybHb88cIHLYpakKeS7wIn10bD3el8bxxiXs7c2v8toHZlT7
 UGxgYPYE+3w1WVDQorSFcN9rr2f5QeQZlCqmNcRgSdr6b4MusVbFxZq9lztdkHMtA086
 E/Ow==
X-Gm-Message-State: AOAM532jxyddrD/NDQmaidF+/Dm6wp8g2GtTczATE7JOsAtt/7tiuQV1
 /vbB/j9CSztYZ+pmXv62IbJ/jUDNmbo=
X-Google-Smtp-Source: ABdhPJzwSn6GNzMkq/L56AqyEAuiz4Vyexnv2ciU2cu8x2iE2iIZu5kZQjM2wc2cbr0DIoe/fXp15A==
X-Received: by 2002:a17:902:a40b:b029:e0:1096:7fb with SMTP id
 p11-20020a170902a40bb02900e0109607fbmr1938832plq.40.1615260399860; 
 Mon, 08 Mar 2021 19:26:39 -0800 (PST)
Received: from localhost.localdomain ([73.93.153.84])
 by smtp.gmail.com with ESMTPSA id i128sm10932247pfe.64.2021.03.08.19.26.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Mar 2021 19:26:39 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH] coroutine: add libucontext as external library
Date: Mon,  8 Mar 2021 19:26:36 -0800
Message-Id: <20210309032637.41778-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.170;
 envelope-from=osy86github@gmail.com; helo=mail-pl1-f170.google.com
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
 configure                 | 21 ++++++++++++++++++---
 meson.build               | 12 +++++++++++-
 util/coroutine-ucontext.c |  9 +++++++++
 .gitmodules               |  3 +++
 MAINTAINERS               |  6 ++++++
 meson_options.txt         |  2 ++
 subprojects/libucontext   |  1 +
 7 files changed, 50 insertions(+), 4 deletions(-)
 create mode 160000 subprojects/libucontext

diff --git a/configure b/configure
index 34fccaa2ba..5f225894a9 100755
--- a/configure
+++ b/configure
@@ -1773,7 +1773,7 @@ Advanced options (experts only):
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
   --with-coroutine=BACKEND coroutine backend. Supported options:
-                           ucontext, sigaltstack, windows
+                           ucontext, libucontext, sigaltstack, windows
   --enable-gcov            enable test coverage analysis with gcov
   --disable-blobs          disable installing provided firmware blobs
   --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
@@ -4517,12 +4517,27 @@ else
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
@@ -5858,7 +5873,7 @@ if test "$qom_cast_debug" = "yes" ; then
   echo "CONFIG_QOM_CAST_DEBUG=y" >> $config_host_mak
 fi
 
-echo "CONFIG_COROUTINE_BACKEND=$coroutine" >> $config_host_mak
+echo "CONFIG_COROUTINE_BACKEND=$coroutine_impl" >> $config_host_mak
 if test "$coroutine_pool" = "yes" ; then
   echo "CONFIG_COROUTINE_POOL=1" >> $config_host_mak
 else
@@ -6421,7 +6436,7 @@ NINJA=$ninja $meson setup \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
-        -Dattr=$attr -Ddefault_devices=$default_devices \
+        -Dattr=$attr -Ddefault_devices=$default_devices -Ducontext=$libucontext \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi \
diff --git a/meson.build b/meson.build
index adeec153d9..2440d90734 100644
--- a/meson.build
+++ b/meson.build
@@ -1633,9 +1633,18 @@ if not fdt.found() and fdt_required.length() > 0
   error('fdt not available but required by targets ' + ', '.join(fdt_required))
 endif
 
+ucontext = dependency('libucontext', kwargs: static_kwargs, required : false)
+if not ucontext.found() and get_option('ucontext').enabled()
+  libucontext_proj = subproject('libucontext',
+                                default_options: ['default_library=static',
+                                                  'freestanding=true'])
+  ucontext = libucontext_proj.get_variable('libucontext_dep')
+endif
+
 config_host_data.set('CONFIG_CAPSTONE', capstone.found())
 config_host_data.set('CONFIG_FDT', fdt.found())
 config_host_data.set('CONFIG_SLIRP', slirp.found())
+config_host_data.set('CONFIG_LIBUCONTEXT', ucontext.found())
 
 #####################
 # Generated sources #
@@ -1883,7 +1892,7 @@ util_ss.add_all(trace_ss)
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), m, glib, socket, malloc])
+                             dependencies: [util_ss.dependencies(), m, glib, socket, malloc, ucontext])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
@@ -2579,6 +2588,7 @@ summary(summary_info, bool_yn: true, section: 'Targets and accelerators')
 
 # Block layer
 summary_info = {}
+summary_info += {'libucontext support': ucontext.found()}
 summary_info += {'coroutine backend': config_host['CONFIG_COROUTINE_BACKEND']}
 summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1'}
 if have_block
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
index 08b1b48a09..6434b98c49 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://gitlab.com/qemu-project/vbootrom.git
+[submodule "libucontext"]
+	path = subprojects/libucontext
+	url = https://github.com/kaniini/libucontext.git
diff --git a/MAINTAINERS b/MAINTAINERS
index f22d83c178..76de0c7dcb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2893,6 +2893,12 @@ F: hw/core/clock-vmstate.c
 F: hw/core/qdev-clock.c
 F: docs/devel/clocks.rst
 
+libucontext in QEMU
+M: Joelle van Dyne <j@getutm.app>
+S: Maintained
+F: subprojects/libucontext
+K: ^Subject:.*(?i)libucontext
+
 Usermode Emulation
 ------------------
 Overall usermode emulation
diff --git a/meson_options.txt b/meson_options.txt
index 9734019995..5db4ef21f8 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -108,6 +108,8 @@ option('fuse', type: 'feature', value: 'auto',
        description: 'FUSE block device export')
 option('fuse_lseek', type : 'feature', value : 'auto',
        description: 'SEEK_HOLE/SEEK_DATA support for FUSE exports')
+option('ucontext', type : 'feature', value : 'disabled',
+       description: 'libucontext support')
 
 option('vhost_user_blk_server', type: 'feature', value: 'auto',
        description: 'build vhost-user-blk server')
diff --git a/subprojects/libucontext b/subprojects/libucontext
new file mode 160000
index 0000000000..464f98a01b
--- /dev/null
+++ b/subprojects/libucontext
@@ -0,0 +1 @@
+Subproject commit 464f98a01b41006f9dc68ff0eee0aa2656709acc
-- 
2.28.0


