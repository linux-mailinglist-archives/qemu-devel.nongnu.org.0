Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFD74253E4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:18:23 +0200 (CEST)
Received: from localhost ([::1]:50748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTHx-00047j-Vp
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8W-0005IF-0i
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:36 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT8U-0007jP-0W
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:08:35 -0400
Received: by mail-ed1-x533.google.com with SMTP id t16so1024417eds.9
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=253DHPUaQfSlfr/I1gEiZWVlFhz2hinLphlD3e30Mkk=;
 b=VIEFHeY156iESrIfjDWjjjGZXmQlatBsyhXjiIRQu0XtPrpNhI9WtI2ARkuWpE/XTG
 m0HOblKy6v6e7Ey7Orn/LOGqeTJ0OVYTM7kQPtJqIQcZsOa1hk2c42BmpRz9ViOHILXV
 4vmMhGeevZe+UxSUF6IDANw53jpDEB2sHYEWrbuVLsdUw6mGFoxxnM+Ly41RVUdezk04
 S81zkjn/r+pFdQyoDbC68wL43b6yV7AVbdWLfs1OdJsu7qpiKMbYSja+ASa8w/C3Sm+l
 qQUppYsEowAVx7arHTkaKTrRipbp7Lz/ymnRrrsboOFB03msCSsol8MMs+AkQF8BteVb
 TGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=253DHPUaQfSlfr/I1gEiZWVlFhz2hinLphlD3e30Mkk=;
 b=wE/oJVPkEukyYc0JhUisL5lag1ElA+vMDag/pkRSygdHzLLXHkzTaCTK41BY9YUm9I
 kOgOCKFWeQBtDTq1QVd4OPGr/U/esGe0AVzwTh5yDVCP9Atgur657bM2KwMYeQarXfHI
 JmrkrH+kTHzBFxo4Dec1wJFids8VUTVCyDy1oH50sXJKAIiHRQFn1VnMpKryGSDe0jDq
 JqSiv3zLiZXabF9N7sYwSLOOUqQSsGsPWu9rYyGogfBGCvEcRbt1gm6sAj9PiujVuLs6
 fg/rWJS+ZlKFPWQboReZ7bEQjB2rVeVXMHaH+kDuMkmjWEtcLT/+MmLv+zwobC26LLcz
 WV5g==
X-Gm-Message-State: AOAM5328v7EI3PsSYbo4mcU4Fhhwbh254Gf7vMeBzsO1CQC8UB9JH1b9
 yftGtmDfU/hpe2kX/nmyF/+9bx9kBuI=
X-Google-Smtp-Source: ABdhPJzt/GQq4raQdE9fpEnK1b9ppL4envs0HiLr2DzQPYUUBx2WJgLulKMwAaJFDf9cx3YOoVgeiQ==
X-Received: by 2002:a05:6402:26d1:: with SMTP id
 x17mr4532101edd.367.1633612111591; 
 Thu, 07 Oct 2021 06:08:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o12sm791254edw.84.2021.10.07.06.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:08:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/24] configure, meson: move fuzzing configuration to Meson
Date: Thu,  7 Oct 2021 15:08:12 +0200
Message-Id: <20211007130829.632254-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007130630.632028-1-pbonzini@redhat.com>
References: <20211007130630.632028-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alexander Oleinik <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Alexander Oleinik <alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                    | 71 +++---------------------------------
 meson.build                  | 51 +++++++++++++++++++++++---
 meson_options.txt            |  4 ++
 tests/qtest/fuzz/meson.build |  6 ++-
 4 files changed, 59 insertions(+), 73 deletions(-)

diff --git a/configure b/configure
index 5541671b58..f5dfcf1a08 100755
--- a/configure
+++ b/configure
@@ -436,7 +436,7 @@ debug_mutex="no"
 libpmem="auto"
 default_devices="true"
 plugins="$default_feature"
-fuzzing="no"
+fuzzing="false"
 rng_none="no"
 secret_keyring="$default_feature"
 libdaxctl="auto"
@@ -566,15 +566,6 @@ int main(void) { return 0; }
 EOF
 }
 
-write_c_fuzzer_skeleton() {
-    cat > $TMPC <<EOF
-#include <stdint.h>
-#include <sys/types.h>
-int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size);
-int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size) { return 0; }
-EOF
-}
-
 if check_define __linux__ ; then
   targetos="Linux"
 elif check_define _WIN32 ; then
@@ -1538,9 +1529,9 @@ for opt do
   ;;
   --disable-containers) use_containers="no"
   ;;
-  --enable-fuzzing) fuzzing=yes
+  --enable-fuzzing) fuzzing=true
   ;;
-  --disable-fuzzing) fuzzing=no
+  --disable-fuzzing) fuzzing=false
   ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
@@ -4055,26 +4046,6 @@ EOF
   fi
 fi
 
-##########################################
-# checks for fuzzer
-if test "$fuzzing" = "yes" ; then
-  write_c_fuzzer_skeleton
-  if test -z "${LIB_FUZZING_ENGINE+xxx}"; then
-    if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer" ""; then
-      have_fuzzer=yes
-    else
-      error_exit "Your compiler doesn't support -fsanitize=fuzzer"
-      exit 1
-    fi
-  fi
-
-  have_clang_coverage_filter=no
-  echo > $TMPTXT
-  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=fuzzer -fsanitize-coverage-allowlist=$TMPTXT" ""; then
-    have_clang_coverage_filter=yes
-  fi
-fi
-
 # Thread sanitizer is, for now, much noisier than the other sanitizers;
 # keep it separate until that is not the case.
 if test "$tsan" = "yes" && test "$sanitizers" = "yes"; then
@@ -4700,34 +4671,6 @@ fi
 if test "$have_mlockall" = "yes" ; then
   echo "HAVE_MLOCKALL=y" >> $config_host_mak
 fi
-if test "$fuzzing" = "yes" ; then
-  # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
-  # needed CFLAGS have already been provided
-  if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
-    # Add CFLAGS to tell clang to add fuzzer-related instrumentation to all the
-    # compiled code.
-    QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
-    # To build non-fuzzer binaries with --enable-fuzzing, link everything with
-    # fsanitize=fuzzer-no-link. Otherwise, the linker will be unable to bind
-    # the fuzzer-related callbacks added by instrumentation.
-    QEMU_LDFLAGS="$QEMU_LDFLAGS -fsanitize=fuzzer-no-link"
-    # For the actual fuzzer binaries, we need to link against the libfuzzer
-    # library. Provide the flags for doing this in FUZZ_EXE_LDFLAGS. The meson
-    # rule for the fuzzer adds these to the link_args. They need to be
-    # configurable, to support OSS-Fuzz
-    FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"
-  else
-    FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
-  fi
-
-  # Specify a filter to only instrument code that is directly related to
-  # virtual-devices.
-  if test "$have_clang_coverage_filter" = "yes" ; then
-    cp "$source_path/scripts/oss-fuzz/instrumentation-filter-template" \
-       instrumentation-filter
-    QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize-coverage-allowlist=instrumentation-filter"
-  fi
-fi
 
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
@@ -4791,11 +4734,6 @@ if test "$gcov" = "yes" ; then
   echo "CONFIG_GCOV=y" >> $config_host_mak
 fi
 
-if test "$fuzzing" != "no"; then
-    echo "CONFIG_FUZZ=y" >> $config_host_mak
-fi
-echo "FUZZ_EXE_LDFLAGS=$FUZZ_EXE_LDFLAGS" >> $config_host_mak
-
 if test "$rng_none" = "yes"; then
   echo "CONFIG_RNG_NONE=y" >> $config_host_mak
 fi
@@ -5031,7 +4969,8 @@ if test "$skip_meson" = no; then
         -Dstrip=$(if test "$strip_opt" = yes; then echo true; else echo false; fi) \
         -Db_pie=$(if test "$pie" = yes; then echo true; else echo false; fi) \
         -Db_coverage=$(if test "$gcov" = yes; then echo true; else echo false; fi) \
-        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug \
+        -Db_lto=$lto -Dcfi=$cfi -Dcfi_debug=$cfi_debug -Dfuzzing=$fuzzing \
+        $(test -n "${LIB_FUZZING_ENGINE+xxx}" && echo "-Dfuzzing_engine=$LIB_FUZZING_ENGINE") \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf -Dnvmm=$nvmm \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
diff --git a/meson.build b/meson.build
index f03bfff7a1..745b8c3c46 100644
--- a/meson.build
+++ b/meson.build
@@ -117,10 +117,37 @@ endforeach
 
 # Specify linker-script with add_project_link_arguments so that it is not placed
 # within a linker --start-group/--end-group pair
-if 'CONFIG_FUZZ' in config_host
-   add_project_link_arguments(['-Wl,-T,',
-                               (meson.current_source_dir() / 'tests/qtest/fuzz/fork_fuzz.ld')],
+if get_option('fuzzing')
+  add_project_link_arguments(['-Wl,-T,',
+                              (meson.current_source_dir() / 'tests/qtest/fuzz/fork_fuzz.ld')],
+                             native: false, language: ['c', 'cpp', 'objc'])
+
+  # Specify a filter to only instrument code that is directly related to
+  # virtual-devices.
+  configure_file(output: 'instrumentation-filter',
+                 input: 'scripts/oss-fuzz/instrumentation-filter-template',
+                 copy: true)
+  add_global_arguments(
+      cc.get_supported_arguments('-fsanitize-coverage-allowlist=instrumentation-filter'),
+      native: false, language: ['c', 'cpp', 'objc'])
+
+  if get_option('fuzzing_engine') == ''
+    # Add CFLAGS to tell clang to add fuzzer-related instrumentation to all the
+    # compiled code.  To build non-fuzzer binaries with --enable-fuzzing, link
+    # everything with fsanitize=fuzzer-no-link. Otherwise, the linker will be
+    # unable to bind the fuzzer-related callbacks added by instrumentation.
+    add_global_arguments('-fsanitize=fuzzer-no-link',
+                         native: false, language: ['c', 'cpp', 'objc'])
+    add_global_link_arguments('-fsanitize=fuzzer-no-link',
                               native: false, language: ['c', 'cpp', 'objc'])
+    # For the actual fuzzer binaries, we need to link against the libfuzzer
+    # library. They need to be configurable, to support OSS-Fuzz
+    fuzz_exe_ldflags = ['-fsanitize=fuzzer']
+  else
+    # LIB_FUZZING_ENGINE was set; assume we are running on OSS-Fuzz, and
+    # the needed CFLAGS have already been provided
+    fuzz_exe_ldflags = get_option('fuzzing_engine').split()
+  endif
 endif
 
 add_global_arguments(config_host['QEMU_CFLAGS'].split(),
@@ -163,6 +190,17 @@ endif
 # Target-specific checks and dependencies #
 ###########################################
 
+if get_option('fuzzing') and get_option('fuzzing_engine') == '' and \
+    not cc.links('''
+          #include <stdint.h>
+          #include <sys/types.h>
+          int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size);
+          int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size) { return 0; }
+        ''',
+        args: ['-Werror', '-fsanitize=fuzzer'])
+  error('Your compiler does not support -fsanitize=fuzzer')
+endif
+
 if targetos != 'linux' and get_option('mpath').enabled()
   error('Multipath is supported only on Linux')
 endif
@@ -1327,6 +1365,7 @@ config_host_data.set_quoted('CONFIG_SYSCONFDIR', get_option('prefix') / get_opti
 config_host_data.set('CONFIG_ATTR', libattr.found())
 config_host_data.set('CONFIG_BRLAPI', brlapi.found())
 config_host_data.set('CONFIG_COCOA', cocoa.found())
+config_host_data.set('CONFIG_FUZZ', get_option('fuzzing'))
 config_host_data.set('CONFIG_LIBUDEV', libudev.found())
 config_host_data.set('CONFIG_LZO', lzo.found())
 config_host_data.set('CONFIG_MPATH', mpathpersist.found())
@@ -1602,7 +1641,7 @@ endif
 
 have_ivshmem = config_host_data.get('CONFIG_EVENTFD')
 host_kconfig = \
-  ('CONFIG_FUZZ' in config_host ? ['CONFIG_FUZZ=y'] : []) + \
+  (get_option('fuzzing') ? ['CONFIG_FUZZ=y'] : []) + \
   ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
   ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
@@ -2729,7 +2768,7 @@ foreach target : target_dirs
         'dependencies': []
       }]
     endif
-    if config_host.has_key('CONFIG_FUZZ')
+    if get_option('fuzzing')
       specific_fuzz = specific_fuzz_ss.apply(config_target, strict: false)
       execs += [{
         'name': 'qemu-fuzz-' + target_name,
@@ -2969,7 +3008,7 @@ summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
 endif
-summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
+summary_info += {'fuzzing support':   get_option('fuzzing')}
 if have_system
   summary_info += {'Audio drivers':     ' '.join(audio_drivers_selected)}
 endif
diff --git a/meson_options.txt b/meson_options.txt
index 052c4f088e..100c30e967 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -11,9 +11,13 @@ option('default_devices', type : 'boolean', value : true,
 option('audio_drv_list', type: 'array', value: ['default'],
        choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl'],
        description: 'Set audio driver list')
+option('fuzzing_engine', type : 'string', value : '',
+       description: 'fuzzing engine library for OSS-Fuzz')
 
 option('docs', type : 'feature', value : 'auto',
        description: 'Documentations build support')
+option('fuzzing', type : 'boolean', value: false,
+       description: 'build fuzzing targets')
 option('gettext', type : 'feature', value : 'auto',
        description: 'Localization of the GTK+ user interface')
 option('install_blobs', type : 'boolean', value : true,
diff --git a/tests/qtest/fuzz/meson.build b/tests/qtest/fuzz/meson.build
index 8af6848cd5..189901d4a2 100644
--- a/tests/qtest/fuzz/meson.build
+++ b/tests/qtest/fuzz/meson.build
@@ -1,3 +1,7 @@
+if not get_option('fuzzing')
+  subdir_done()
+endif
+
 specific_fuzz_ss.add(files('fuzz.c', 'fork_fuzz.c', 'qos_fuzz.c',
                            'qtest_wrappers.c'), qos)
 
@@ -9,7 +13,7 @@ specific_fuzz_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio_blk_fuzz.
 specific_fuzz_ss.add(files('generic_fuzz.c'))
 
 fork_fuzz = declare_dependency(
-  link_args: config_host['FUZZ_EXE_LDFLAGS'].split() +
+  link_args: fuzz_exe_ldflags +
              ['-Wl,-wrap,qtest_inb',
               '-Wl,-wrap,qtest_inw',
               '-Wl,-wrap,qtest_inl',
-- 
2.31.1



