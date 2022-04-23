Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702B550CA54
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:05:02 +0200 (CEST)
Received: from localhost ([::1]:35912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFRd-0004OK-IN
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFJ-0006zs-KM
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:17 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFH-00055y-7v
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:17 -0400
Received: by mail-ed1-x52b.google.com with SMTP id d6so8355690ede.8
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+k9jZOFwU7I4PkMF/kaxCvOtEknZXqE5wy9ewcLGyVc=;
 b=XAo14YHb0HrtzK1Hu8eYPdWORTXvlBU1dYmBpAEU5uYkIb/m2PNwBBYrutGfAsbXkK
 1gbtarbqehtOQuky6Gio4dF/Z/R7JwlNjpmcC/zBKQxXD4jy5xMl7mycJlWOgPkXpYxb
 YrWjqM4j5E/0YmaLBPUKtWoRMCMFWeFgKaF6pTL6ldSKXzHgoBUVRNcs20pZP/XzWNZH
 hWze+9fd5RVDfDREjIhscC+YVgFcGYM1e5l6rFwvm6uyeCNeDhs5iYw9GWW/7kNHKhFZ
 pvZY8XcA8yzAzv1KoUARZzzeGODDE1nHVPXf5Cn+yJQG8u6FHvGXb/K0k2z8ZnRkibxS
 Vfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+k9jZOFwU7I4PkMF/kaxCvOtEknZXqE5wy9ewcLGyVc=;
 b=rPRiPkt0k1We0FiSyn0goz8Fsoag9CJNtT2aHwYGnpv0CSiInFMzRs9/nIz3ZW7HO1
 G7KwoI/pZfZ/FwycA+ZBcPp4MTIsXgSpG/GQwhLH7F/rW65omX+U4XB0WFWpSTX+eqVI
 qBUHwlVEpFNFHyDifyv3ItSNBtOE0jRKMyYi2NEoLRNUjIhiohTcKCNiHqIzrposwBAO
 fKepGRBPyjsMG8Bf/7y2DIzh6hUiMJ7EJm8BkS4Wg+ixjoYM9qbyzRnNg1ebSaQUP3ik
 o/gmvJt3eiTaFt7cLWOwTwlNrGGLlv8culbS8FaIZOvsjUUbToslmZjI0dSp7Rkq5xsh
 vQXw==
X-Gm-Message-State: AOAM532N6Z2CKV4TrKS8HX0HtTnY91/Xw186MsUnXHG9PziPv7xiXe/3
 /FzNiIwkITcYndqBtUElSg6Tv6w+WGGrCA==
X-Google-Smtp-Source: ABdhPJxQ6DF+rYy3EsL0OxlsnV8aK0iKQI4kiLoIjGg8YvSWpJU7A9pXvFbhvCU5wm5LLXEIkLD7/w==
X-Received: by 2002:a05:6402:14c2:b0:41d:816a:4eb0 with SMTP id
 f2-20020a05640214c200b0041d816a4eb0mr9875134edx.301.1650718333873; 
 Sat, 23 Apr 2022 05:52:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/34] meson, configure: move RDMA options to meson
Date: Sat, 23 Apr 2022 14:51:25 +0200
Message-Id: <20220423125151.27821-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                      | 115 ---------------------------------
 contrib/rdmacm-mux/meson.build |   4 +-
 meson.build                    |  56 ++++++++++++++--
 meson_options.txt              |   4 ++
 migration/meson.build          |   2 +-
 scripts/meson-buildoptions.sh  |   6 ++
 6 files changed, 62 insertions(+), 125 deletions(-)

diff --git a/configure b/configure
index 1aefbc2f68..4deca94235 100755
--- a/configure
+++ b/configure
@@ -301,8 +301,6 @@ vhost_vsock="$default_feature"
 vhost_user="no"
 vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
-rdma="$default_feature"
-pvrdma="$default_feature"
 debug_info="yes"
 debug_tcg="no"
 debug="no"
@@ -972,14 +970,6 @@ for opt do
   ;;
   --tls-priority=*) tls_priority="$optarg"
   ;;
-  --enable-rdma) rdma="yes"
-  ;;
-  --disable-rdma) rdma="no"
-  ;;
-  --enable-pvrdma) pvrdma="yes"
-  ;;
-  --disable-pvrdma) pvrdma="no"
-  ;;
   --disable-vhost-user) vhost_user="no"
   ;;
   --enable-vhost-user) vhost_user="yes"
@@ -1244,8 +1234,6 @@ cat << EOF
   lto             Enable Link-Time Optimization.
   safe-stack      SafeStack Stack Smash Protection. Depends on
                   clang/llvm >= 3.7 and requires coroutine backend ucontext.
-  rdma            Enable RDMA-based migration
-  pvrdma          Enable PVRDMA support
   vhost-net       vhost-net kernel acceleration support
   vhost-vsock     virtio sockets device support
   vhost-scsi      vhost-scsi kernel target support
@@ -2037,100 +2025,6 @@ EOF
   fi
 fi
 
-##########################################
-# RDMA needs OpenFabrics libraries
-if test "$rdma" != "no" ; then
-  cat > $TMPC <<EOF
-#include <rdma/rdma_cma.h>
-int main(void) { return 0; }
-EOF
-  rdma_libs="-lrdmacm -libverbs -libumad"
-  if compile_prog "" "$rdma_libs" ; then
-    rdma="yes"
-  else
-    if test "$rdma" = "yes" ; then
-        error_exit \
-            " OpenFabrics librdmacm/libibverbs/libibumad not present." \
-            " Your options:" \
-            "  (1) Fast: Install infiniband packages (devel) from your distro." \
-            "  (2) Cleanest: Install libraries from www.openfabrics.org" \
-            "  (3) Also: Install softiwarp if you don't have RDMA hardware"
-    fi
-    rdma="no"
-  fi
-fi
-
-##########################################
-# PVRDMA detection
-
-cat > $TMPC <<EOF &&
-#include <sys/mman.h>
-
-int
-main(void)
-{
-    char buf = 0;
-    void *addr = &buf;
-    addr = mremap(addr, 0, 1, MREMAP_MAYMOVE | MREMAP_FIXED);
-
-    return 0;
-}
-EOF
-
-if test "$rdma" = "yes" ; then
-    case "$pvrdma" in
-    "")
-        if compile_prog "" ""; then
-            pvrdma="yes"
-        else
-            pvrdma="no"
-        fi
-        ;;
-    "yes")
-        if ! compile_prog "" ""; then
-            error_exit "PVRDMA is not supported since mremap is not implemented"
-        fi
-        pvrdma="yes"
-        ;;
-    "no")
-        pvrdma="no"
-        ;;
-    esac
-else
-    if test "$pvrdma" = "yes" ; then
-        error_exit "PVRDMA requires rdma suppport"
-    fi
-    pvrdma="no"
-fi
-
-# Let's see if enhanced reg_mr is supported
-if test "$pvrdma" = "yes" ; then
-
-cat > $TMPC <<EOF &&
-#include <infiniband/verbs.h>
-
-int
-main(void)
-{
-    struct ibv_mr *mr;
-    struct ibv_pd *pd = NULL;
-    size_t length = 10;
-    uint64_t iova = 0;
-    int access = 0;
-    void *addr = NULL;
-
-    mr = ibv_reg_mr_iova(pd, addr, length, iova, access);
-
-    ibv_dereg_mr(mr);
-
-    return 0;
-}
-EOF
-    if ! compile_prog "" "-libverbs"; then
-        QEMU_CFLAGS="$QEMU_CFLAGS -DLEGACY_RDMA_REG_MR"
-    fi
-fi
-
 ##########################################
 # glib support probe
 
@@ -2855,15 +2749,6 @@ if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
     echo "CONFIG_TSAN=y" >> $config_host_mak
 fi
 
-if test "$rdma" = "yes" ; then
-  echo "CONFIG_RDMA=y" >> $config_host_mak
-  echo "RDMA_LIBS=$rdma_libs" >> $config_host_mak
-fi
-
-if test "$pvrdma" = "yes" ; then
-  echo "CONFIG_PVRDMA=y" >> $config_host_mak
-fi
-
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
 fi
diff --git a/contrib/rdmacm-mux/meson.build b/contrib/rdmacm-mux/meson.build
index 7674f54cc5..36c9c89630 100644
--- a/contrib/rdmacm-mux/meson.build
+++ b/contrib/rdmacm-mux/meson.build
@@ -1,7 +1,5 @@
-if 'CONFIG_PVRDMA' in config_host
-  # if not found, CONFIG_PVRDMA should not be set
+if have_pvrdma
   # FIXME: broken on big endian architectures
-  libumad = cc.find_library('ibumad', required: true)
   executable('rdmacm-mux', files('main.c'), genh,
              dependencies: [glib, libumad],
              build_by_default: false,
diff --git a/meson.build b/meson.build
index d21902e5d0..55ad65ce95 100644
--- a/meson.build
+++ b/meson.build
@@ -1217,9 +1217,22 @@ if numa.found() and not cc.links('''
 endif
 
 rdma = not_found
-if 'CONFIG_RDMA' in config_host
-  rdma = declare_dependency(link_args: config_host['RDMA_LIBS'].split())
+if not get_option('rdma').auto() or have_system
+  libumad = cc.find_library('ibumad', required: get_option('rdma'))
+  rdma_libs = [cc.find_library('rdmacm', has_headers: ['rdma/rdma_cma.h'],
+                               required: get_option('rdma'),
+                               kwargs: static_kwargs),
+               cc.find_library('ibverbs', required: get_option('rdma'),
+                               kwargs: static_kwargs),
+               libumad]
+  rdma = declare_dependency(dependencies: rdma_libs)
+  foreach lib: rdma_libs
+    if not lib.found()
+      rdma = not_found
+    endif
+  endforeach
 endif
+
 xen = not_found
 if 'CONFIG_XEN_BACKEND' in config_host
   xen = declare_dependency(compile_args: config_host['XEN_CFLAGS'].split(),
@@ -1552,6 +1565,7 @@ config_host_data.set('CONFIG_NUMA', numa.found())
 config_host_data.set('CONFIG_OPENGL', opengl.found())
 config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
 config_host_data.set('CONFIG_RBD', rbd.found())
+config_host_data.set('CONFIG_RDMA', rdma.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
 config_host_data.set('CONFIG_SECCOMP', seccomp.found())
@@ -1650,7 +1664,7 @@ config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '
 if rdma.found()
   config_host_data.set('HAVE_IBV_ADVISE_MR',
                        cc.has_function('ibv_advise_mr',
-                                       args: config_host['RDMA_LIBS'].split(),
+                                       dependencies: rdma,
                                        prefix: '#include <infiniband/verbs.h>'))
 endif
 
@@ -1970,6 +1984,36 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
     int main(int argc, char *argv[]) { return bar(argv[0]); }
   '''), error_message: 'AVX512F not available').allowed())
 
+have_pvrdma = get_option('pvrdma') \
+  .require(rdma.found(), error_message: 'PVRDMA requires OpenFabrics libraries') \
+  .require(cc.compiles('''
+    int main(void)
+    {
+      char buf = 0;
+      void *addr = &buf;
+      addr = mremap(addr, 0, 1, MREMAP_MAYMOVE | MREMAP_FIXED);
+
+      return 0;
+    }'''), error_message: 'PVRDMA requires mremap').allowed()
+
+if have_pvrdma
+  config_host_data.set('LEGACY_RDMA_REG_MR', not cc.compiles('''
+    #include <infiniband/verbs.h>
+    int main(void)
+    {
+      struct ibv_mr *mr;
+      struct ibv_pd *pd = NULL;
+      size_t length = 10;
+      uint64_t iova = 0;
+      int access = 0;
+      void *addr = NULL;
+
+      mr = ibv_reg_mr_iova(pd, addr, length, iova, access);
+      ibv_dereg_mr(mr);
+      return 0;
+    }'''))
+endif
+
 if get_option('membarrier').disabled()
   have_membarrier = false
 elif targetos == 'windows'
@@ -2104,7 +2148,7 @@ host_kconfig = \
   ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
-  ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : []) + \
+  (have_pvrdma ? ['CONFIG_PVRDMA=y'] : []) + \
   (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
@@ -3698,8 +3742,8 @@ summary_info += {'l2tpv3 support':    have_l2tpv3}
 summary_info += {'Linux AIO support': libaio}
 summary_info += {'Linux io_uring support': linux_io_uring}
 summary_info += {'ATTR/XATTR support': libattr}
-summary_info += {'RDMA support':      config_host.has_key('CONFIG_RDMA')}
-summary_info += {'PVRDMA support':    config_host.has_key('CONFIG_PVRDMA')}
+summary_info += {'RDMA support':      rdma}
+summary_info += {'PVRDMA support':    have_pvrdma}
 summary_info += {'fdt support':       fdt_opt == 'disabled' ? false : fdt_opt}
 summary_info += {'libcap-ng support': libcap_ng}
 summary_info += {'bpf support':       libbpf}
diff --git a/meson_options.txt b/meson_options.txt
index bd8efe4fbf..c00e0866e9 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -151,6 +151,10 @@ option('rbd', type : 'feature', value : 'auto',
        description: 'Ceph block device driver')
 option('opengl', type : 'feature', value : 'auto',
        description: 'OpenGL support')
+option('rdma', type : 'feature', value : 'auto',
+       description: 'Enable RDMA-based migration')
+option('pvrdma', type : 'feature', value : 'auto',
+       description: 'Enable PVRDMA support')
 option('gtk', type : 'feature', value : 'auto',
        description: 'GTK+ user interface')
 option('sdl', type : 'feature', value : 'auto',
diff --git a/migration/meson.build b/migration/meson.build
index 8b5ca5c047..6880b61b10 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -27,7 +27,7 @@ softmmu_ss.add(files(
   'tls.c',
 ), gnutls)
 
-softmmu_ss.add(when: ['CONFIG_RDMA', rdma], if_true: files('rdma.c'))
+softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
 if get_option('live_block_migration').allowed()
   softmmu_ss.add(files('block.c'))
 endif
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index f91bd9231b..cd922614e8 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -95,10 +95,12 @@ meson_options_help() {
   printf "%s\n" '  oss             OSS sound support'
   printf "%s\n" '  pa              PulseAudio sound support'
   printf "%s\n" '  parallels       parallels image format support'
+  printf "%s\n" '  pvrdma          Enable PVRDMA support'
   printf "%s\n" '  qcow1           qcow1 image format support'
   printf "%s\n" '  qed             qed image format support'
   printf "%s\n" '  qga-vss         build QGA VSS support (broken with MinGW)'
   printf "%s\n" '  rbd             Ceph block device driver'
+  printf "%s\n" '  rdma            Enable RDMA-based migration'
   printf "%s\n" '  replication     replication support'
   printf "%s\n" '  sdl             SDL user interface'
   printf "%s\n" '  sdl-image       SDL Image support for icons'
@@ -282,6 +284,8 @@ _meson_option_parse() {
     --disable-parallels) printf "%s" -Dparallels=disabled ;;
     --enable-profiler) printf "%s" -Dprofiler=true ;;
     --disable-profiler) printf "%s" -Dprofiler=false ;;
+    --enable-pvrdma) printf "%s" -Dpvrdma=enabled ;;
+    --disable-pvrdma) printf "%s" -Dpvrdma=disabled ;;
     --enable-qcow1) printf "%s" -Dqcow1=enabled ;;
     --disable-qcow1) printf "%s" -Dqcow1=disabled ;;
     --enable-qed) printf "%s" -Dqed=enabled ;;
@@ -292,6 +296,8 @@ _meson_option_parse() {
     --disable-qom-cast-debug) printf "%s" -Dqom_cast_debug=false ;;
     --enable-rbd) printf "%s" -Drbd=enabled ;;
     --disable-rbd) printf "%s" -Drbd=disabled ;;
+    --enable-rdma) printf "%s" -Drdma=enabled ;;
+    --disable-rdma) printf "%s" -Drdma=disabled ;;
     --enable-replication) printf "%s" -Dreplication=enabled ;;
     --disable-replication) printf "%s" -Dreplication=disabled ;;
     --enable-rng-none) printf "%s" -Drng_none=true ;;
-- 
2.35.1



