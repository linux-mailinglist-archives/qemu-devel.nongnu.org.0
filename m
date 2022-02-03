Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56294A8A98
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:48:24 +0100 (CET)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgDX-0002gX-TJ
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:48:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzl-0004ok-Bl
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:09 -0500
Received: from [2a00:1450:4864:20::631] (port=41882
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzi-0008FR-UL
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:09 -0500
Received: by mail-ej1-x631.google.com with SMTP id a8so10955617ejc.8
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yItvXj5D3oHrNCygVEAQbFSg9MsznUGvcvDkTY3s/kM=;
 b=cAa2oGtNPFKOFBRQgpsfL6WiSS0t7t3KfHLR7XQVi8Wv3i2AQHn5U1rrZ7ze9mKnwe
 QmZqCjKvyNa0cT0hrMqn+hrpS4S9i7Ne7cl49C1jZZL2A0pB+/4GXWEGYexaKZpx8OTI
 t6sD9bmOs+bpm0Yu0wY1Tua+pH484Lnu8pB0uW0EDf6NqolX93ovvE9aMbNK4inTM3Dc
 66yivQpvx7hKJT7ETYJsT1x9y1VGtlhxD8d1CqhPjLCGllGAZTxkA/8ydX3WEPNI6wSJ
 Wo6DB5pui2dtW1NNskmlhMeBFWJJr4l91tS3F2I8q9tIkLMYkLSrFM4OdU/qsh175yGX
 7p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yItvXj5D3oHrNCygVEAQbFSg9MsznUGvcvDkTY3s/kM=;
 b=JzUx+UlqqgPs6FZ70ZLzQQltr1nxj5/JMGzcIJnuha9epzgwHPBF2NhG3ZVswKNJ1p
 j31mOLefvjr9A5KpKu37OrQAnPvhpEjdgmt5yWJokHs5CPsvBgJnyV2QBSAv8UTOkzmz
 QcBoUi+DM713cP+80lCrNHXGHZ2RlhUz5P8UD1AXw2aRC8lMZjAX4j5pvCN4G8Sp2pPX
 2iPTHPM6w8QJOP80PNckiA/GV+32xUEWQBc822AWvdrPkW4ax1WtjtDULkQO69/pq2sG
 T8JzvR7H26HlqLTCNIbWrnlJnUappt4KY0fiCmUNt4dLmdbWjtVz0BKEn9YDtIOSx5Sw
 5QXA==
X-Gm-Message-State: AOAM531cVJQjaNZ+FKnJiBs7bOPp6cCO69RaZKDsvNY1H6hgPGYtJc5i
 95pPKCx+vu1Xe2p6SNHYzscGX+bSI9U=
X-Google-Smtp-Source: ABdhPJytvUd+M+BtY7cRxP0/1z3y4diNko7/yandq3/rt+EM2FxlBAKBNI659Z+zGTjMDJz51vPfZA==
X-Received: by 2002:a17:906:7812:: with SMTP id
 u18mr30058549ejm.335.1643909645642; 
 Thu, 03 Feb 2022 09:34:05 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:05 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/27] configure, meson: move libnuma detection to meson
Date: Thu,  3 Feb 2022 18:33:38 +0100
Message-Id: <20220203173359.292068-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 31 -------------------------------
 meson.build                   | 25 ++++++++++++++++++++-----
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 4 files changed, 25 insertions(+), 36 deletions(-)

diff --git a/configure b/configure
index cdaab251c8..afb6e8744a 100755
--- a/configure
+++ b/configure
@@ -332,7 +332,6 @@ debug_stack_usage="no"
 tls_priority="NORMAL"
 tpm="$default_feature"
 live_block_migration=${default_feature:-yes}
-numa="$default_feature"
 replication=${default_feature:-yes}
 bochs=${default_feature:-yes}
 cloop=${default_feature:-yes}
@@ -1048,10 +1047,6 @@ for opt do
   ;;
   --enable-live-block-migration) live_block_migration="yes"
   ;;
-  --disable-numa) numa="no"
-  ;;
-  --enable-numa) numa="yes"
-  ;;
   --disable-replication) replication="no"
   ;;
   --enable-replication) replication="yes"
@@ -1398,7 +1393,6 @@ cat << EOF
   live-block-migration   Block migration in the main migration stream
   coroutine-pool  coroutine freelist (better performance)
   tpm             TPM support
-  numa            libnuma support
   replication     replication support
   opengl          opengl support
   qom-cast-debug  cast debugging support
@@ -2476,26 +2470,6 @@ EOF
   fi
 fi
 
-##########################################
-# libnuma probe
-
-if test "$numa" != "no" ; then
-  cat > $TMPC << EOF
-#include <numa.h>
-int main(void) { return numa_available(); }
-EOF
-
-  if compile_prog "" "-lnuma" ; then
-    numa=yes
-    numa_libs="-lnuma"
-  else
-    if test "$numa" = "yes" ; then
-      feature_not_found "numa" "install numactl devel"
-    fi
-    numa=no
-  fi
-fi
-
 # check for usbfs
 have_usbfs=no
 if test "$linux_user" = "yes"; then
@@ -3463,11 +3437,6 @@ if test "$default_targets" = "yes"; then
   echo "CONFIG_DEFAULT_TARGETS=y" >> $config_host_mak
 fi
 
-if test "$numa" = "yes"; then
-  echo "CONFIG_NUMA=y" >> $config_host_mak
-  echo "NUMA_LIBS=$numa_libs" >> $config_host_mak
-fi
-
 if test "$ccache_cpp2" = "yes"; then
   echo "export CCACHE_CPP2=y" >> $config_host_mak
 fi
diff --git a/meson.build b/meson.build
index 1d4ba12f52..cfb02f31ca 100644
--- a/meson.build
+++ b/meson.build
@@ -1164,14 +1164,28 @@ if lzo.found() and not cc.links('''
   endif
 endif
 
+numa = not_found
+if not get_option('numa').auto() or have_system or have_tools
+  numa = cc.find_library('numa', has_headers: ['numa.h'],
+                              required: get_option('numa'),
+                              kwargs: static_kwargs)
+endif
+if numa.found() and not cc.links('''
+   #include <numa.h>
+   int main(void) { return numa_available(); }
+   ''', dependencies: numa)
+  numa = not_found
+  if get_option('numa').enabled()
+    error('could not link numa')
+  else
+    warning('could not link numa, disabling')
+  endif
+endif
+
 rdma = not_found
 if 'CONFIG_RDMA' in config_host
   rdma = declare_dependency(link_args: config_host['RDMA_LIBS'].split())
 endif
-numa = not_found
-if 'CONFIG_NUMA' in config_host
-  numa = declare_dependency(link_args: config_host['NUMA_LIBS'].split())
-endif
 xen = not_found
 if 'CONFIG_XEN_BACKEND' in config_host
   xen = declare_dependency(compile_args: config_host['XEN_CFLAGS'].split(),
@@ -1472,6 +1486,7 @@ config_host_data.set('CONFIG_LIBSSH', libssh.found())
 config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
+config_host_data.set('CONFIG_NUMA', numa.found())
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
@@ -3552,7 +3567,7 @@ summary_info += {'snappy support':    snappy}
 summary_info += {'bzip2 support':     libbzip2}
 summary_info += {'lzfse support':     liblzfse}
 summary_info += {'zstd support':      zstd}
-summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
+summary_info += {'NUMA host support': numa}
 summary_info += {'capstone':          capstone_opt == 'internal' ? capstone_opt : capstone}
 summary_info += {'libpmem support':   libpmem}
 summary_info += {'libdaxctl support': libdaxctl}
diff --git a/meson_options.txt b/meson_options.txt
index 6efad01528..bb443023b5 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -103,6 +103,8 @@ option('libnfs', type : 'feature', value : 'auto',
        description: 'libnfs block device driver')
 option('mpath', type : 'feature', value : 'auto',
        description: 'Multipath persistent reservation passthrough')
+option('numa', type : 'feature', value : 'auto',
+       description: 'libnuma support')
 option('iconv', type : 'feature', value : 'auto',
        description: 'Font glyph conversion support')
 option('curses', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index c558fe6761..855c8df754 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -72,6 +72,7 @@ meson_options_help() {
   printf "%s\n" '  multiprocess    Out of process device emulation support'
   printf "%s\n" '  netmap          netmap network backend support'
   printf "%s\n" '  nettle          nettle cryptography support'
+  printf "%s\n" '  numa            libnuma support'
   printf "%s\n" '  nvmm            NVMM acceleration support'
   printf "%s\n" '  oss             OSS sound support'
   printf "%s\n" '  pa              PulseAudio sound support'
@@ -221,6 +222,8 @@ _meson_option_parse() {
     --disable-netmap) printf "%s" -Dnetmap=disabled ;;
     --enable-nettle) printf "%s" -Dnettle=enabled ;;
     --disable-nettle) printf "%s" -Dnettle=disabled ;;
+    --enable-numa) printf "%s" -Dnuma=enabled ;;
+    --disable-numa) printf "%s" -Dnuma=disabled ;;
     --enable-nvmm) printf "%s" -Dnvmm=enabled ;;
     --disable-nvmm) printf "%s" -Dnvmm=disabled ;;
     --enable-oss) printf "%s" -Doss=enabled ;;
-- 
2.34.1



