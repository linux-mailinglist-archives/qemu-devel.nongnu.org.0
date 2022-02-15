Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B10A4B681D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:47:36 +0100 (CET)
Received: from localhost ([::1]:34794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuQp-000263-8v
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:47:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCI-0003xF-Ec
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:34 -0500
Received: from [2a00:1450:4864:20::635] (port=37674
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCG-0008Qi-L5
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:34 -0500
Received: by mail-ej1-x635.google.com with SMTP id h8so16382970ejy.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=931YQ/n8R//7jvPgZB7qt0my6F42icBbcLTxZP+VAfM=;
 b=gHJflh9XqrzEWRTmfR5/Ul5ZDaRrMDxb202oO1gVlK2jlrmdaL3vmcp3kU50JvU71J
 6M1E7OKUl2sBO0JWXZksyNxw1m9NzY0HZUhbSLIl8XosqhhMuFTm7QWCxzk8ByqDVElu
 KhsFIA5mMA8unjuWYbxSCJilPsxShhPIIdeZbBI/GHZfZ6qmkj+Nh0V/kpR36Oe3rkF9
 p9gFtBQfb4eXM+2icM1XiQHW+wp9IQgsxS8GQhFH6iLWzbQxlOEXohuH+GecXfRwsPAV
 YUF317W74kttGZ3RWEHqEe39fTZMVMmbqHoYxOOemzuL97BSnrtC0kYD8GhWGFU16nWH
 QTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=931YQ/n8R//7jvPgZB7qt0my6F42icBbcLTxZP+VAfM=;
 b=hG88xwcfqLS1XM+NDl/UnCJY0/r0kwEDP2G+hf6nSOKKdtZaKGmd9EMuB+dpOMpbfK
 Gsh7uQPpEui8BJPAIYZcY3o6XCnSHztWyWuqDeBkK2xKFhdtiauDaMoY8l0AZlAm2LT8
 saXPSdPWgclZvFBNGySPmt1BsI2RiAXj+/cBGpVL/YoHw4IA2reYb+r33c1o+chLEAd/
 cvRMiKo1HTjD9pOAZHUpeMkdri//uT8IbUqlpkEi/VjujRu6QvQfgREmaLMpXTRLHDEu
 BShWDEfOC+mkGAHAiCZAbILc+vzUKTFnlihS3R5K/kVTIBnG7GvsR5Ff5iu89vhpmr5k
 7KpQ==
X-Gm-Message-State: AOAM531t6+sV30Tg/zcVpTyAgVHGWCTpq2Vok4txwMMWsIlb4yFMXbup
 /pxaI70jBvQrbhWWMzvBI6Mlm01+4CI=
X-Google-Smtp-Source: ABdhPJzBaFQm7uv/D3i+Df74xppaCXK5WmnH9G5Ou7z2y1E9eOOq7Rf3wsWUlWdRUmRYNw2SW9Fkjg==
X-Received: by 2002:a17:906:779b:: with SMTP id
 s27mr2180122ejm.389.1644917551312; 
 Tue, 15 Feb 2022 01:32:31 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/30] configure, meson: move libnuma detection to meson
Date: Tue, 15 Feb 2022 10:32:02 +0100
Message-Id: <20220215093223.110827-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 31 -------------------------------
 meson.build                   | 25 ++++++++++++++++++++-----
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 4 files changed, 25 insertions(+), 36 deletions(-)

diff --git a/configure b/configure
index 07ea08cd08..f536f53106 100755
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
@@ -1384,7 +1379,6 @@ cat << EOF
   live-block-migration   Block migration in the main migration stream
   coroutine-pool  coroutine freelist (better performance)
   tpm             TPM support
-  numa            libnuma support
   replication     replication support
   opengl          opengl support
   qom-cast-debug  cast debugging support
@@ -2455,26 +2449,6 @@ EOF
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
@@ -3442,11 +3416,6 @@ if test "$default_targets" = "yes"; then
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
index 9e1acb98aa..f8b83f64db 100644
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
@@ -3548,7 +3563,7 @@ summary_info += {'snappy support':    snappy}
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
index a20d40e685..d46d7181e7 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -71,6 +71,7 @@ meson_options_help() {
   printf "%s\n" '  multiprocess    Out of process device emulation support'
   printf "%s\n" '  netmap          netmap network backend support'
   printf "%s\n" '  nettle          nettle cryptography support'
+  printf "%s\n" '  numa            libnuma support'
   printf "%s\n" '  nvmm            NVMM acceleration support'
   printf "%s\n" '  oss             OSS sound support'
   printf "%s\n" '  pa              PulseAudio sound support'
@@ -218,6 +219,8 @@ _meson_option_parse() {
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



