Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DCE4B6835
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:53:19 +0100 (CET)
Received: from localhost ([::1]:47612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuWM-0000eR-LG
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:53:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCN-0004Gs-9V
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:39 -0500
Received: from [2a00:1450:4864:20::635] (port=40544
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCK-0008Rq-GJ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:38 -0500
Received: by mail-ej1-x635.google.com with SMTP id p15so42876177ejc.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N26I4OZsfW/6GiGWy3g2VG+knZRMe3uhswXNhKvQ0bA=;
 b=hrLXEwTo2tMdymdDBNqbpGPYOjXLN5wbcU7ku5cb9a//rtmXVd97meIZrifd44uowK
 OmAu525CJ5KlTxffo+23ATq8NIbO9BsDOdECxvsi5W2SHIymXFfbOi64ZKjNT/XCeZ0l
 lZjmgObI09M1VToq8CEW2+gDMjdeKQ7a0lI5nberFCFcOf4QTGS7IEe9dG6Kb8srqW6Y
 l3DvtQhkwpIblcsDFuoprr8KzQ1E8oAj9PPM2R9mJ0rVhO6enulSBgav3Rz30sy5/1Z2
 bN41Fla2R1FVRSF1GTa5hwyHmcPlkU0fPDACCAS/1aBhFnMx/WbmYh6pHLlRghcGqG0I
 jQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N26I4OZsfW/6GiGWy3g2VG+knZRMe3uhswXNhKvQ0bA=;
 b=ZqatiCgzPIrxIAJgU9NDQ+dkKxXA7su9OCnhj3pRjCDyq+/OvZMIq+xp636L3P55zh
 MKVzJS7NatGviMw/IywI1CPrybeQogSPF3XsdEIePlnn0zX8JhbtM7SKXy3gIoiyZYRA
 sszyoJZ7ngGG7tOdtXSbwlTdwbFahlXClXzAm3W1qnyCmSvHQCh7g0lKanju3IxxWcqu
 DK4KwolM/piZEyBsVe1k85z++e8uALStO4iShsldYslLzk+2PPh8iQ5r8vFFF6ovoKJM
 lzchyciEAZXJVac+ZeMN6WShStVVJ2KAp5bcX4fo9XXBwGt1Oec6suMQoUSxOFxVR7T8
 PQqA==
X-Gm-Message-State: AOAM531JFNhrlTY4ZL8ssD8yaz/tTFS/0mQjBRIwuWwMHX8IF112wn6B
 iVHImXhGidK3kfnusi7nb39RFYUGDcs=
X-Google-Smtp-Source: ABdhPJypQWTk6VFuFIBY0sAP19Gfu2ibbwRc51rebQbmb9b9NvnPaFiEFTeg2e0rAb/y4ix3fxOgdw==
X-Received: by 2002:a17:906:6b0c:: with SMTP id
 q12mr2127728ejr.640.1644917555173; 
 Tue, 15 Feb 2022 01:32:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/30] configure,
 meson: move some default-disabled options to meson_options.txt
Date: Tue, 15 Feb 2022 10:32:08 +0100
Message-Id: <20220215093223.110827-16-pbonzini@redhat.com>
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

These do not depend on --with-default-features, so they become
booleans in meson too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                      | 61 +---------------------------------
 crypto/meson.build             |  2 +-
 meson.build                    | 23 +++++++++----
 meson_options.txt              | 12 +++++++
 scripts/meson-buildoptions.sh  | 21 ++++++++++++
 tests/check-block.sh           |  4 ---
 tests/qemu-iotests/meson.build |  2 +-
 7 files changed, 53 insertions(+), 72 deletions(-)

diff --git a/configure b/configure
index 1a15e2325e..5a4a642846 100755
--- a/configure
+++ b/configure
@@ -238,7 +238,6 @@ cross_prefix=""
 audio_drv_list="default"
 block_drv_rw_whitelist=""
 block_drv_ro_whitelist=""
-block_drv_whitelist_tools="no"
 host_cc="cc"
 debug_info="yes"
 lto="false"
@@ -299,7 +298,6 @@ vhost_user_fs="$default_feature"
 vhost_vdpa="$default_feature"
 rdma="$default_feature"
 pvrdma="$default_feature"
-gprof="no"
 debug_tcg="no"
 debug="no"
 sanitizers="no"
@@ -311,13 +309,11 @@ modules="no"
 module_upgrades="no"
 prefix="/usr/local"
 qemu_suffix="qemu"
-profiler="no"
 softmmu="yes"
 linux_user=""
 bsd_user=""
 pkgversion=""
 pie=""
-qom_cast_debug="yes"
 trace_backends="log"
 trace_file="trace"
 opengl="$default_feature"
@@ -329,9 +325,7 @@ coroutine=""
 coroutine_pool="$default_feature"
 debug_stack_usage="no"
 tls_priority="NORMAL"
-debug_mutex="no"
 plugins="$default_feature"
-rng_none="no"
 secret_keyring="$default_feature"
 meson=""
 meson_args=""
@@ -806,8 +800,6 @@ for opt do
   ;;
   --without-default-features) # processed above
   ;;
-  --enable-gprof) gprof="yes"
-  ;;
   --enable-gcov) gcov="yes"
   ;;
   --static)
@@ -848,20 +840,12 @@ for opt do
     # configure to be used by RPM and similar macros that set
     # lots of directory switches by default.
   ;;
-  --disable-qom-cast-debug) qom_cast_debug="no"
-  ;;
-  --enable-qom-cast-debug) qom_cast_debug="yes"
-  ;;
   --audio-drv-list=*) audio_drv_list="$optarg"
   ;;
   --block-drv-rw-whitelist=*|--block-drv-whitelist=*) block_drv_rw_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
   ;;
   --block-drv-ro-whitelist=*) block_drv_ro_whitelist=$(echo "$optarg" | sed -e 's/,/ /g')
   ;;
-  --enable-block-drv-whitelist-in-tools) block_drv_whitelist_tools="yes"
-  ;;
-  --disable-block-drv-whitelist-in-tools) block_drv_whitelist_tools="no"
-  ;;
   --enable-debug-tcg) debug_tcg="yes"
   ;;
   --disable-debug-tcg) debug_tcg="no"
@@ -869,7 +853,7 @@ for opt do
   --enable-debug)
       # Enable debugging options that aren't excessively noisy
       debug_tcg="yes"
-      debug_mutex="yes"
+      meson_option_parse --enable-debug-mutex ""
       debug="yes"
       fortify_source="no"
   ;;
@@ -898,8 +882,6 @@ for opt do
   ;;
   --enable-tcg) tcg="enabled"
   ;;
-  --enable-profiler) profiler="yes"
-  ;;
   --disable-system) softmmu="no"
   ;;
   --enable-system) softmmu="yes"
@@ -1051,10 +1033,6 @@ for opt do
   --with-git-submodules=*)
       git_submodules_action="$optarg"
   ;;
-  --enable-debug-mutex) debug_mutex=yes
-  ;;
-  --disable-debug-mutex) debug_mutex=no
-  ;;
   --enable-plugins) if test "$mingw32" = "yes"; then
                         error_exit "TCG plugins not currently supported on Windows platforms"
                     else
@@ -1069,10 +1047,6 @@ for opt do
   ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
-  --enable-rng-none) rng_none=yes
-  ;;
-  --disable-rng-none) rng_none=no
-  ;;
   --enable-keyring) secret_keyring="yes"
   ;;
   --disable-keyring) secret_keyring="no"
@@ -1275,8 +1249,6 @@ Advanced options (experts only):
   --block-drv-ro-whitelist=L
                            set block driver read-only whitelist
                            (by default affects only QEMU, not tools like qemu-img)
-  --enable-block-drv-whitelist-in-tools
-                           use block whitelist also in tools instead of only QEMU
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --cpu=CPU                Build for host CPU [$cpu]
@@ -1286,8 +1258,6 @@ Advanced options (experts only):
   --with-vss-sdk=SDK-path  enable Windows VSS support in QEMU Guest Agent
   --with-win-sdk=SDK-path  path to Windows Platform SDK (to build VSS .tlb)
   --tls-priority           default TLS protocol/cipher priority string
-  --enable-gprof           QEMU profiling with gprof
-  --enable-profiler        profiler support
   --enable-debug-stack-usage
                            track the maximum stack usage of stacks created by qemu_alloc_stack
   --enable-plugins
@@ -1321,10 +1291,7 @@ cat << EOF
   vhost-vdpa      vhost-vdpa kernel backend support
   coroutine-pool  coroutine freelist (better performance)
   opengl          opengl support
-  qom-cast-debug  cast debugging support
   tools           build qemu-io, qemu-nbd and qemu-img tools
-  debug-mutex     mutex debugging support
-  rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
   gio             libgio support
   slirp-smbd      use smbd (at path --smbd=*) in slirp networking
 
@@ -2848,11 +2815,6 @@ alpha)
 ;;
 esac
 
-if test "$gprof" = "yes" ; then
-  QEMU_CFLAGS="-p $QEMU_CFLAGS"
-  QEMU_LDFLAGS="-p $QEMU_LDFLAGS"
-fi
-
 if test "$have_asan" = "yes"; then
   QEMU_CFLAGS="-fsanitize=address $QEMU_CFLAGS"
   QEMU_LDFLAGS="-fsanitize=address $QEMU_LDFLAGS"
@@ -3047,9 +3009,6 @@ fi
 if test "$static" = "yes" ; then
   echo "CONFIG_STATIC=y" >> $config_host_mak
 fi
-if test "$profiler" = "yes" ; then
-  echo "CONFIG_PROFILER=y" >> $config_host_mak
-fi
 if test "$want_tools" = "yes" ; then
   echo "CONFIG_TOOLS=y" >> $config_host_mak
 fi
@@ -3060,14 +3019,8 @@ if test "$slirp_smbd" = "yes" ; then
   echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
   echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
 fi
-if test "$gprof" = "yes" ; then
-  echo "CONFIG_GPROF=y" >> $config_host_mak
-fi
 echo "CONFIG_BDRV_RW_WHITELIST=$block_drv_rw_whitelist" >> $config_host_mak
 echo "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
-if test "$block_drv_whitelist_tools" = "yes" ; then
-  echo "CONFIG_BDRV_WHITELIST_TOOLS=y" >> $config_host_mak
-fi
 qemu_version=$(head $source_path/VERSION)
 echo "PKGVERSION=$pkgversion" >>$config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
@@ -3148,10 +3101,6 @@ if [ "$bsd" = "yes" ] ; then
   echo "CONFIG_BSD=y" >> $config_host_mak
 fi
 
-if test "$qom_cast_debug" = "yes" ; then
-  echo "CONFIG_QOM_CAST_DEBUG=y" >> $config_host_mak
-fi
-
 echo "CONFIG_COROUTINE_BACKEND=$coroutine" >> $config_host_mak
 if test "$coroutine_pool" = "yes" ; then
   echo "CONFIG_COROUTINE_POOL=1" >> $config_host_mak
@@ -3192,10 +3141,6 @@ if test "$pvrdma" = "yes" ; then
   echo "CONFIG_PVRDMA=y" >> $config_host_mak
 fi
 
-if test "$debug_mutex" = "yes" ; then
-  echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
-fi
-
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
 fi
@@ -3239,10 +3184,6 @@ echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
 echo "STRIP=$strip" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
-if test "$rng_none" = "yes"; then
-  echo "CONFIG_RNG_NONE=y" >> $config_host_mak
-fi
-
 # use included Linux headers
 if test "$linux" = "yes" ; then
   mkdir -p linux-headers
diff --git a/crypto/meson.build b/crypto/meson.build
index 9bf3a431fe..19c44bea89 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -50,7 +50,7 @@ if gcrypt.found()
   util_ss.add(gcrypt, files('random-gcrypt.c'))
 elif gnutls.found()
   util_ss.add(gnutls, files('random-gnutls.c'))
-elif 'CONFIG_RNG_NONE' in config_host
+elif get_option('rng_none')
   util_ss.add(files('random-none.c'))
 else
   util_ss.add(files('random-platform.c'))
diff --git a/meson.build b/meson.build
index c520d6af68..8fc23df33d 100644
--- a/meson.build
+++ b/meson.build
@@ -167,6 +167,12 @@ qemu_cflags = config_host['QEMU_CFLAGS'].split()
 qemu_cxxflags = config_host['QEMU_CXXFLAGS'].split()
 qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
 
+if get_option('gprof')
+  qemu_cflags += ['-p']
+  qemu_cxxflags += ['-p']
+  qemu_ldflags += ['-p']
+endif
+
 # Specify linker-script with add_project_link_arguments so that it is not placed
 # within a linker --start-group/--end-group pair
 if get_option('fuzzing')
@@ -1459,6 +1465,7 @@ config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_opti
 config_host_data.set('HOST_' + host_arch.to_upper(), 1)
 
 config_host_data.set('CONFIG_ATTR', libattr.found())
+config_host_data.set('CONFIG_BDRV_WHITELIST_TOOLS', get_option('block_drv_whitelist_in_tools'))
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
 config_host_data.set('CONFIG_FUZZ', get_option('fuzzing'))
@@ -1492,6 +1499,7 @@ config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
 config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
 config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
 config_host_data.set('CONFIG_NUMA', numa.found())
+config_host_data.set('CONFIG_PROFILER', get_option('profiler'))
 config_host_data.set('CONFIG_RBD', rbd.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
@@ -1540,7 +1548,10 @@ config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
 config_host_data.set('HOST_WORDS_BIGENDIAN', host_machine.endian() == 'big')
 
+config_host_data.set('CONFIG_DEBUG_MUTEX', get_option('debug_mutex'))
+config_host_data.set('CONFIG_GPROF', get_option('gprof'))
 config_host_data.set('CONFIG_LIVE_BLOCK_MIGRATION', get_option('live_block_migration').allowed())
+config_host_data.set('CONFIG_QOM_CAST_DEBUG', get_option('qom_cast_debug'))
 config_host_data.set('CONFIG_REPLICATION', get_option('live_block_migration').allowed())
 
 # has_header
@@ -3340,7 +3351,7 @@ if 'simple' in get_option('trace_backends')
   summary_info += {'Trace output file': get_option('trace_file') + '-<pid>'}
 endif
 summary_info += {'D-Bus display':     dbus_display}
-summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
+summary_info += {'QOM debugging':     get_option('qom_cast_debug')}
 summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
 summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
@@ -3386,18 +3397,18 @@ if link_args.length() > 0
 endif
 summary_info += {'QEMU_CFLAGS':       config_host['QEMU_CFLAGS']}
 summary_info += {'QEMU_LDFLAGS':      config_host['QEMU_LDFLAGS']}
-summary_info += {'profiler':          config_host.has_key('CONFIG_PROFILER')}
+summary_info += {'profiler':          get_option('profiler')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
 summary_info += {'PIE':               get_option('b_pie')}
 summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'membarrier':        have_membarrier}
 summary_info += {'debug stack usage': config_host.has_key('CONFIG_DEBUG_STACK_USAGE')}
-summary_info += {'mutex debugging':   config_host.has_key('CONFIG_DEBUG_MUTEX')}
+summary_info += {'mutex debugging':   get_option('debug_mutex')}
 summary_info += {'memory allocator':  get_option('malloc')}
 summary_info += {'avx2 optimization': config_host_data.get('CONFIG_AVX2_OPT')}
 summary_info += {'avx512f optimization': config_host_data.get('CONFIG_AVX512F_OPT')}
-summary_info += {'gprof enabled':     config_host.has_key('CONFIG_GPROF')}
+summary_info += {'gprof enabled':     get_option('gprof')}
 summary_info += {'gcov':              get_option('b_coverage')}
 summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'CFI support':       get_option('cfi')}
@@ -3464,7 +3475,7 @@ summary_info += {'coroutine pool':    config_host['CONFIG_COROUTINE_POOL'] == '1
 if have_block
   summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
   summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
-  summary_info += {'Use block whitelist in tools': config_host.has_key('CONFIG_BDRV_WHITELIST_TOOLS')}
+  summary_info += {'Use block whitelist in tools': get_option('block_drv_whitelist_in_tools')}
   summary_info += {'VirtFS support':    have_virtfs}
   summary_info += {'build virtiofs daemon': have_virtiofsd}
   summary_info += {'Live block migration': config_host_data.get('CONFIG_LIVE_BLOCK_MIGRATION')}
@@ -3494,7 +3505,7 @@ if nettle.found()
    summary_info += {'  XTS':             xts != 'private'}
 endif
 summary_info += {'AF_ALG support':    have_afalg}
-summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
+summary_info += {'rng-none':          get_option('rng_none')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary(summary_info, bool_yn: true, section: 'Crypto')
 
diff --git a/meson_options.txt b/meson_options.txt
index 3bfaa77805..781e4d5170 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -242,3 +242,15 @@ option('qed', type: 'feature', value: 'auto',
        description: 'qed image format support')
 option('parallels', type: 'feature', value: 'auto',
        description: 'parallels image format support')
+option('block_drv_whitelist_in_tools', type: 'boolean', value: false,
+       description: 'use block whitelist also in tools instead of only QEMU')
+option('rng_none', type: 'boolean', value: false,
+       description: 'dummy RNG, avoid using /dev/(u)random and getrandom()')
+option('debug_mutex', type: 'boolean', value: false,
+       description: 'mutex debugging support')
+option('qom_cast_debug', type: 'boolean', value: false,
+       description: 'cast debugging support')
+option('gprof', type: 'boolean', value: false,
+       description: 'QEMU profiling with gprof')
+option('profiler', type: 'boolean', value: false,
+       description: 'profiler support')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index ffd712936d..a2d6f34b21 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -1,16 +1,25 @@
 # This file is generated by meson-buildoptions.py, do not edit!
 meson_options_help() {
+  printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
+  printf "%s\n" '                           use block whitelist also in tools instead of only'
+  printf "%s\n" '                           QEMU'
   printf "%s\n" '  --enable-capstone[=CHOICE]'
   printf "%s\n" '                           Whether and how to find the capstone library'
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-cfi             Control-Flow Integrity (CFI)'
   printf "%s\n" '  --enable-cfi-debug       Verbose errors in case of CFI violation'
+  printf "%s\n" '  --enable-debug-mutex     mutex debugging support'
   printf "%s\n" '  --enable-fdt[=CHOICE]    Whether and how to find the libfdt library'
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-fuzzing         build fuzzing targets'
+  printf "%s\n" '  --enable-gprof           QEMU profiling with gprof'
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
   printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to use [system] (choices:'
   printf "%s\n" '                           jemalloc/system/tcmalloc)'
+  printf "%s\n" '  --enable-profiler        profiler support'
+  printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
+  printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
+  printf "%s\n" '                           getrandom()'
   printf "%s\n" '  --enable-slirp[=CHOICE]  Whether and how to find the slirp library'
   printf "%s\n" '                           (choices: auto/disabled/enabled/internal/system)'
   printf "%s\n" '  --enable-strip           Strip targets on install'
@@ -130,6 +139,8 @@ _meson_option_parse() {
     --disable-avx2) printf "%s" -Davx2=disabled ;;
     --enable-avx512f) printf "%s" -Davx512f=enabled ;;
     --disable-avx512f) printf "%s" -Davx512f=disabled ;;
+    --enable-block-drv-whitelist-in-tools) printf "%s" -Dblock_drv_whitelist_in_tools=true ;;
+    --disable-block-drv-whitelist-in-tools) printf "%s" -Dblock_drv_whitelist_in_tools=false ;;
     --enable-bochs) printf "%s" -Dbochs=enabled ;;
     --disable-bochs) printf "%s" -Dbochs=disabled ;;
     --enable-bpf) printf "%s" -Dbpf=enabled ;;
@@ -161,6 +172,8 @@ _meson_option_parse() {
     --disable-curses) printf "%s" -Dcurses=disabled ;;
     --enable-dbus-display) printf "%s" -Ddbus_display=enabled ;;
     --disable-dbus-display) printf "%s" -Ddbus_display=disabled ;;
+    --enable-debug-mutex) printf "%s" -Ddebug_mutex=true ;;
+    --disable-debug-mutex) printf "%s" -Ddebug_mutex=false ;;
     --enable-dmg) printf "%s" -Ddmg=enabled ;;
     --disable-dmg) printf "%s" -Ddmg=disabled ;;
     --enable-docs) printf "%s" -Ddocs=enabled ;;
@@ -184,6 +197,8 @@ _meson_option_parse() {
     --disable-glusterfs) printf "%s" -Dglusterfs=disabled ;;
     --enable-gnutls) printf "%s" -Dgnutls=enabled ;;
     --disable-gnutls) printf "%s" -Dgnutls=disabled ;;
+    --enable-gprof) printf "%s" -Dgprof=true ;;
+    --disable-gprof) printf "%s" -Dgprof=false ;;
     --enable-gtk) printf "%s" -Dgtk=enabled ;;
     --disable-gtk) printf "%s" -Dgtk=disabled ;;
     --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=enabled ;;
@@ -249,14 +264,20 @@ _meson_option_parse() {
     --disable-pa) printf "%s" -Dpa=disabled ;;
     --enable-parallels) printf "%s" -Dparallels=enabled ;;
     --disable-parallels) printf "%s" -Dparallels=disabled ;;
+    --enable-profiler) printf "%s" -Dprofiler=true ;;
+    --disable-profiler) printf "%s" -Dprofiler=false ;;
     --enable-qcow1) printf "%s" -Dqcow1=enabled ;;
     --disable-qcow1) printf "%s" -Dqcow1=disabled ;;
     --enable-qed) printf "%s" -Dqed=enabled ;;
     --disable-qed) printf "%s" -Dqed=disabled ;;
+    --enable-qom-cast-debug) printf "%s" -Dqom_cast_debug=true ;;
+    --disable-qom-cast-debug) printf "%s" -Dqom_cast_debug=false ;;
     --enable-rbd) printf "%s" -Drbd=enabled ;;
     --disable-rbd) printf "%s" -Drbd=disabled ;;
     --enable-replication) printf "%s" -Dreplication=enabled ;;
     --disable-replication) printf "%s" -Dreplication=disabled ;;
+    --enable-rng-none) printf "%s" -Drng_none=true ;;
+    --disable-rng-none) printf "%s" -Drng_none=false ;;
     --enable-sdl) printf "%s" -Dsdl=enabled ;;
     --disable-sdl) printf "%s" -Dsdl=disabled ;;
     --enable-sdl-image) printf "%s" -Dsdl_image=enabled ;;
diff --git a/tests/check-block.sh b/tests/check-block.sh
index 720a46bc36..18f7433901 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -18,10 +18,6 @@ skip() {
     exit 0
 }
 
-if grep -q "CONFIG_GPROF=y" config-host.mak 2>/dev/null ; then
-    skip "GPROF is enabled ==> Not running the qemu-iotests."
-fi
-
 # Disable tests with any sanitizer except for specific ones
 SANITIZE_FLAGS=$( grep "CFLAGS.*-fsanitize" config-host.mak 2>/dev/null )
 ALLOWED_SANITIZE_FLAGS="safe-stack cfi-icall"
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 5be3c74127..9747bb68a5 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -1,4 +1,4 @@
-if have_tools and targetos != 'windows'
+if have_tools and targetos != 'windows' and not get_option('gprof')
   qemu_iotests_binaries = [qemu_img, qemu_io, qemu_nbd, qsd]
   qemu_iotests_env = {'PYTHON': python.full_path()}
   qemu_iotests_formats = {
-- 
2.34.1



