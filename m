Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A3F4A8A6C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:42:56 +0100 (CET)
Received: from localhost ([::1]:50976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFg8E-0005Cp-UZ
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:42:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzo-0004wE-L5
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:12 -0500
Received: from [2a00:1450:4864:20::533] (port=37567
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzl-0008GH-Qx
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:12 -0500
Received: by mail-ed1-x533.google.com with SMTP id c24so7630081edy.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MucpTZE/wQedR0UeC9D6hRTd++QCX1t2KymMGVhyZI8=;
 b=YmhIfcoJqCjx4fVPvnZ8k7BEwH2N7SSizhijAQgj+suLrEI+aUWMzPSqjNa9XDjM1y
 GSvq2lRrCHWJQPYkMM1JSNRgx1yOS6zNDpWqpbPsUorxVnP15bXVqaSh9fH6fIytJFB2
 Xq7pocMZMCkmL+rGDepBlg0IN213277rxcvs7K4qgVEQIGlDv47drCmD68JlTrjSLQsX
 dGmgqHBDAfnH4swGnEj55wzAbIUVjlJmvS5KiCeDO/63UtfBRErv9I2y33BCGlc0n2YA
 WtZ1/6Cp7C1mJV7qDdL1/Qe/gmruA9HDb4e1RQ8If1zeHWb4lOFYIyeIyCIAZseG0jqL
 H/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MucpTZE/wQedR0UeC9D6hRTd++QCX1t2KymMGVhyZI8=;
 b=wAmoJ84YUjyDl4zgvmDqBrtP7TNyKwHWDN8N4L7JT+oYuV6rDgYEzIiTZChZASUE3Z
 zceW38kmzo1fsdi5Im4jGyGka8MEE0UGIxyk9DOPnd5ms9/fCPe8YQNiWDsFcQwuvKae
 Xa75r68N3u5wOYyFCTktTBHZ5Ylr3meTd6CVB3AVps/Aru5VIXD5oOljzoP3aw++BYzh
 s2cgG1QEjAXvAw8nJV5MG77VE7R+iNGwZ9mGN2k05pmho4/0obxmvQVQhsRoJcrC3T+B
 3f3ic4JPihnGbwG5K1YOkRHbQ+ZkXnETnijSvwtnLi+1s0Z+9DfwUNxKPp/M7NRTL0bn
 aFLg==
X-Gm-Message-State: AOAM533FhTr7VLo2PeAnvr/vUovbIseVxMEJablbJinjygM+p97K+o5M
 Zgoq1S/UtAxQQaTTT2Vv41t8Hil8mY0=
X-Google-Smtp-Source: ABdhPJw7LBZTIEpjh1VKHmRivcUYN6rPAvS6/IUNZPIRi1joWp1p1TsrqnoQbnxRcKEGdwGmRvA7lw==
X-Received: by 2002:aa7:d313:: with SMTP id p19mr37241980edq.380.1643909648560; 
 Thu, 03 Feb 2022 09:34:08 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/27] configure,
 meson: move block layer options to meson_options.txt
Date: Thu,  3 Feb 2022 18:33:42 +0100
Message-Id: <20220203173359.292068-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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

Unlike image formats, these also require an entry in config-host.h.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/meson.build             |  4 +++-
 configure                     | 20 --------------------
 meson.build                   | 11 ++++++++---
 meson_options.txt             |  4 ++++
 migration/meson.build         |  4 +++-
 scripts/meson-buildoptions.sh |  7 +++++++
 tests/unit/meson.build        |  2 +-
 7 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index 4afde2ebf8..8a1ce58c9c 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -80,7 +80,9 @@ block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c')
 block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
 block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
 block_ss.add(when: 'CONFIG_LINUX', if_true: files('nvme.c'))
-block_ss.add(when: 'CONFIG_REPLICATION', if_true: files('replication.c'))
+if not get_option('replication').disabled()
+  block_ss.add(files('replication.c'))
+endif
 block_ss.add(when: libaio, if_true: files('linux-aio.c'))
 block_ss.add(when: linux_io_uring, if_true: files('io_uring.c'))
 
diff --git a/configure b/configure
index acee571fbc..785d52ef2b 100755
--- a/configure
+++ b/configure
@@ -329,8 +329,6 @@ coroutine=""
 coroutine_pool="$default_feature"
 debug_stack_usage="no"
 tls_priority="NORMAL"
-live_block_migration=${default_feature:-yes}
-replication=${default_feature:-yes}
 debug_mutex="no"
 plugins="$default_feature"
 rng_none="no"
@@ -1028,14 +1026,6 @@ for opt do
   ;;
   --disable-pvrdma) pvrdma="no"
   ;;
-  --disable-live-block-migration) live_block_migration="no"
-  ;;
-  --enable-live-block-migration) live_block_migration="yes"
-  ;;
-  --disable-replication) replication="no"
-  ;;
-  --enable-replication) replication="yes"
-  ;;
   --disable-vhost-user) vhost_user="no"
   ;;
   --enable-vhost-user) vhost_user="yes"
@@ -1343,9 +1333,7 @@ cat << EOF
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
   vhost-vdpa      vhost-vdpa kernel backend support
-  live-block-migration   Block migration in the main migration stream
   coroutine-pool  coroutine freelist (better performance)
-  replication     replication support
   opengl          opengl support
   qom-cast-debug  cast debugging support
   tools           build qemu-io, qemu-nbd and qemu-img tools
@@ -3216,10 +3204,6 @@ if test "$cmpxchg128" = "yes" ; then
   echo "CONFIG_CMPXCHG128=y" >> $config_host_mak
 fi
 
-if test "$live_block_migration" = "yes" ; then
-  echo "CONFIG_LIVE_BLOCK_MIGRATION=y" >> $config_host_mak
-fi
-
 if test "$rdma" = "yes" ; then
   echo "CONFIG_RDMA=y" >> $config_host_mak
   echo "RDMA_LIBS=$rdma_libs" >> $config_host_mak
@@ -3229,10 +3213,6 @@ if test "$pvrdma" = "yes" ; then
   echo "CONFIG_PVRDMA=y" >> $config_host_mak
 fi
 
-if test "$replication" = "yes" ; then
-  echo "CONFIG_REPLICATION=y" >> $config_host_mak
-fi
-
 if test "$debug_mutex" = "yes" ; then
   echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index ba1c468620..1199279209 100644
--- a/meson.build
+++ b/meson.build
@@ -1539,6 +1539,9 @@ config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 config_host_data.set('HOST_WORDS_BIGENDIAN', host_machine.endian() == 'big')
 
+config_host_data.set('CONFIG_LIVE_BLOCK_MIGRATION', get_option('live_block_migration').allowed())
+config_host_data.set('CONFIG_REPLICATION', get_option('live_block_migration').allowed())
+
 # has_header
 config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
 config_host_data.set('CONFIG_LINUX_MAGIC_H', cc.has_header('linux/magic.h'))
@@ -2688,7 +2691,9 @@ if have_block
     'job.c',
     'qemu-io-cmds.c',
   ))
-  block_ss.add(when: 'CONFIG_REPLICATION', if_true: files('replication.c'))
+  if config_host_data.get('CONFIG_REPLICATION')
+    block_ss.add(files('replication.c'))
+  endif
 
   subdir('nbd')
   subdir('scsi')
@@ -3465,8 +3470,8 @@ if have_block
   summary_info += {'Use block whitelist in tools': config_host.has_key('CONFIG_BDRV_WHITELIST_TOOLS')}
   summary_info += {'VirtFS support':    have_virtfs}
   summary_info += {'build virtiofs daemon': have_virtiofsd}
-  summary_info += {'Live block migration': config_host.has_key('CONFIG_LIVE_BLOCK_MIGRATION')}
-  summary_info += {'replication support': config_host.has_key('CONFIG_REPLICATION')}
+  summary_info += {'Live block migration': config_host_data.get('CONFIG_LIVE_BLOCK_MIGRATION')}
+  summary_info += {'replication support': config_host_data.get('CONFIG_REPLICATION')}
   summary_info += {'bochs support':     get_option('bochs').allowed()}
   summary_info += {'cloop support':     get_option('cloop').allowed()}
   summary_info += {'dmg support':       get_option('dmg').allowed()}
diff --git a/meson_options.txt b/meson_options.txt
index aef951eba1..3bfaa77805 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -222,6 +222,10 @@ option('fdt', type: 'combo', value: 'auto',
 
 option('selinux', type: 'feature', value: 'auto',
        description: 'SELinux support in qemu-nbd')
+option('live_block_migration', type: 'feature', value: 'auto',
+       description: 'block migration in the main migration stream')
+option('replication', type: 'feature', value: 'auto',
+       description: 'replication support')
 option('bochs', type: 'feature', value: 'auto',
        description: 'bochs image format support')
 option('cloop', type: 'feature', value: 'auto',
diff --git a/migration/meson.build b/migration/meson.build
index f8714dcb15..8b5ca5c047 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -28,7 +28,9 @@ softmmu_ss.add(files(
 ), gnutls)
 
 softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
-softmmu_ss.add(when: 'CONFIG_LIVE_BLOCK_MIGRATION', if_true: files('block.c'))
+if get_option('live_block_migration').allowed()
+  softmmu_ss.add(files('block.c'))
+endif
 softmmu_ss.add(when: zstd, if_true: files('multifd-zstd.c'))
 
 specific_ss.add(when: 'CONFIG_SOFTMMU',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index e72c5f582e..3ead845808 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -67,6 +67,8 @@ meson_options_help() {
   printf "%s\n" '  libxml2         libxml2 support for Parallels image format'
   printf "%s\n" '  linux-aio       Linux AIO support'
   printf "%s\n" '  linux-io-uring  Linux io_uring support'
+  printf "%s\n" '  live-block-migration'
+  printf "%s\n" '                  block migration in the main migration stream'
   printf "%s\n" '  lzfse           lzfse support for DMG images'
   printf "%s\n" '  lzo             lzo compression support'
   printf "%s\n" '  malloc-trim     enable libc malloc_trim() for memory optimization'
@@ -83,6 +85,7 @@ meson_options_help() {
   printf "%s\n" '  qcow1           qcow1 image format support'
   printf "%s\n" '  qed             qed image format support'
   printf "%s\n" '  rbd             Ceph block device driver'
+  printf "%s\n" '  replication     replication support'
   printf "%s\n" '  sdl             SDL user interface'
   printf "%s\n" '  sdl-image       SDL Image support for icons'
   printf "%s\n" '  seccomp         seccomp support'
@@ -220,6 +223,8 @@ _meson_option_parse() {
     --disable-linux-aio) printf "%s" -Dlinux_aio=disabled ;;
     --enable-linux-io-uring) printf "%s" -Dlinux_io_uring=enabled ;;
     --disable-linux-io-uring) printf "%s" -Dlinux_io_uring=disabled ;;
+    --enable-live-block-migration) printf "%s" -Dlive_block_migration=enabled ;;
+    --disable-live-block-migration) printf "%s" -Dlive_block_migration=disabled ;;
     --enable-lzfse) printf "%s" -Dlzfse=enabled ;;
     --disable-lzfse) printf "%s" -Dlzfse=disabled ;;
     --enable-lzo) printf "%s" -Dlzo=enabled ;;
@@ -253,6 +258,8 @@ _meson_option_parse() {
     --disable-qed) printf "%s" -Dqed=disabled ;;
     --enable-rbd) printf "%s" -Drbd=enabled ;;
     --disable-rbd) printf "%s" -Drbd=disabled ;;
+    --enable-replication) printf "%s" -Dreplication=enabled ;;
+    --disable-replication) printf "%s" -Dreplication=disabled ;;
     --enable-sdl) printf "%s" -Dsdl=enabled ;;
     --disable-sdl) printf "%s" -Dsdl=disabled ;;
     --enable-sdl-image) printf "%s" -Dsdl_image=enabled ;;
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 64a5e7bfde..0959061faf 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -106,7 +106,7 @@ if have_block
   if 'CONFIG_POSIX' in config_host
     tests += {'test-image-locking': [testblock]}
   endif
-  if 'CONFIG_REPLICATION' in config_host
+  if config_host_data.get('CONFIG_REPLICATION')
     tests += {'test-replication': [testblock]}
   endif
   if nettle.found() or gcrypt.found()
-- 
2.34.1



