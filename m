Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B914B67F4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:44:02 +0100 (CET)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuNN-0005ls-5W
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:44:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCL-0004Aw-JQ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:37 -0500
Received: from [2a00:1450:4864:20::62e] (port=45711
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCJ-0008RR-70
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:37 -0500
Received: by mail-ej1-x62e.google.com with SMTP id lw4so12088735ejb.12
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hw+TtQhEdnn/JekCaaI7QAaA/Gtqjg2yxmHMUB1QuVg=;
 b=bLsaiM4UznU2B92lOHXy8Zj0+oO0D6SHW05ZCXKR+vUvcm4EkOmvdI51KSR0hGM21i
 w47cRM7jrlZIV+6b01eyWoZ0M823VkyNbL5uCHM3iQ6G2h8H4tvB4CCtOuBCXKmctXR1
 MTs6fES7evym9vio3cBJa6vEgUZiDrrofV5fEyLcFBZAJPDayzIB8NFWcXl3CuHH96tH
 6/Gnt02Yk1WiScodv0PUdnnS4p4dsy3/b5cVCcVwkbgDsST2UgGm+uzoYdr1QnoNr0dL
 7zmLTOG/vdG7pCniAK8nrW6/cabxGxxkTfJOu/1rGeMERY87WA/eOSBH3UwN4Z1cxLir
 5zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hw+TtQhEdnn/JekCaaI7QAaA/Gtqjg2yxmHMUB1QuVg=;
 b=4xnavWs9Ke25GThK3YH4hn2Aod8g+nF5OTBclNnlgHCT/nbdRidqZkHtIfTQbWiQbq
 pWwFMB//l7gzuGDQ7CAoDtNBTqHZTIj7RfCSfF/niK6TptpAVHKUWh8CyqhXPASt/ZQb
 lURSVfJrjmfam2y502e2rAC/7iiBEx5Xmxcv8CfFL0sWI4bkBmVmHeJS5yia84w6Mtrq
 dcnFgVDWvv9Ut7Ayzrgn2gEzkHpsg1vHOEl9U+GNtvKZZeFj4z63kiW4uM1i8eMCvBSe
 rNkQQNfgPxIPzn97Ea+i5RTi08VtwS+iRJMo2Qr8qJZyQaxnvd+ZqjIVZUyTkd9g9tmS
 dEOA==
X-Gm-Message-State: AOAM531VtMNl3WMithEJs5VBP7LUla4o5cuT/9yzJekxtSwpOQdq30gI
 klZEJ4ITGVESd3eQCpRT1PTGzdjuy1s=
X-Google-Smtp-Source: ABdhPJwzM8kItQ/nAdN1JKzV6vsjki7b7XiSiA4NrvTbyasxvJq/Lq/5HilDu90uBmuV6P7EfE8RNw==
X-Received: by 2002:a17:907:7e97:: with SMTP id
 qb23mr2288727ejc.355.1644917553890; 
 Tue, 15 Feb 2022 01:32:33 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/30] configure,
 meson: move block layer options to meson_options.txt
Date: Tue, 15 Feb 2022 10:32:06 +0100
Message-Id: <20220215093223.110827-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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
index 4ee1567419..1a15e2325e 100755
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
@@ -1329,9 +1319,7 @@ cat << EOF
   vhost-kernel    vhost kernel backend support
   vhost-user      vhost-user backend support
   vhost-vdpa      vhost-vdpa kernel backend support
-  live-block-migration   Block migration in the main migration stream
   coroutine-pool  coroutine freelist (better performance)
-  replication     replication support
   opengl          opengl support
   qom-cast-debug  cast debugging support
   tools           build qemu-io, qemu-nbd and qemu-img tools
@@ -3195,10 +3183,6 @@ if test "$cmpxchg128" = "yes" ; then
   echo "CONFIG_CMPXCHG128=y" >> $config_host_mak
 fi
 
-if test "$live_block_migration" = "yes" ; then
-  echo "CONFIG_LIVE_BLOCK_MIGRATION=y" >> $config_host_mak
-fi
-
 if test "$rdma" = "yes" ; then
   echo "CONFIG_RDMA=y" >> $config_host_mak
   echo "RDMA_LIBS=$rdma_libs" >> $config_host_mak
@@ -3208,10 +3192,6 @@ if test "$pvrdma" = "yes" ; then
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
index 38e3ea46e1..031bbf468c 100644
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
@@ -2684,7 +2687,9 @@ if have_block
     'job.c',
     'qemu-io-cmds.c',
   ))
-  block_ss.add(when: 'CONFIG_REPLICATION', if_true: files('replication.c'))
+  if config_host_data.get('CONFIG_REPLICATION')
+    block_ss.add(files('replication.c'))
+  endif
 
   subdir('nbd')
   subdir('scsi')
@@ -3461,8 +3466,8 @@ if have_block
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
index 50a985abec..ffd712936d 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -66,6 +66,8 @@ meson_options_help() {
   printf "%s\n" '  libusb          libusb support for USB passthrough'
   printf "%s\n" '  linux-aio       Linux AIO support'
   printf "%s\n" '  linux-io-uring  Linux io_uring support'
+  printf "%s\n" '  live-block-migration'
+  printf "%s\n" '                  block migration in the main migration stream'
   printf "%s\n" '  lzfse           lzfse support for DMG images'
   printf "%s\n" '  lzo             lzo compression support'
   printf "%s\n" '  malloc-trim     enable libc malloc_trim() for memory optimization'
@@ -82,6 +84,7 @@ meson_options_help() {
   printf "%s\n" '  qcow1           qcow1 image format support'
   printf "%s\n" '  qed             qed image format support'
   printf "%s\n" '  rbd             Ceph block device driver'
+  printf "%s\n" '  replication     replication support'
   printf "%s\n" '  sdl             SDL user interface'
   printf "%s\n" '  sdl-image       SDL Image support for icons'
   printf "%s\n" '  seccomp         seccomp support'
@@ -217,6 +220,8 @@ _meson_option_parse() {
     --disable-linux-aio) printf "%s" -Dlinux_aio=disabled ;;
     --enable-linux-io-uring) printf "%s" -Dlinux_io_uring=enabled ;;
     --disable-linux-io-uring) printf "%s" -Dlinux_io_uring=disabled ;;
+    --enable-live-block-migration) printf "%s" -Dlive_block_migration=enabled ;;
+    --disable-live-block-migration) printf "%s" -Dlive_block_migration=disabled ;;
     --enable-lzfse) printf "%s" -Dlzfse=enabled ;;
     --disable-lzfse) printf "%s" -Dlzfse=disabled ;;
     --enable-lzo) printf "%s" -Dlzo=enabled ;;
@@ -250,6 +255,8 @@ _meson_option_parse() {
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



