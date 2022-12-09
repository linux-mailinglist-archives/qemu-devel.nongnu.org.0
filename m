Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D126481EC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bX7-0005qs-Ee; Fri, 09 Dec 2022 06:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVo-0004Sa-BI
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVe-0001UB-Aw
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOwX9wpZTs+zF4AW3wtB/CLmwtvj3wE48v6r8TJJLJ8=;
 b=RP+e/6uwX+0eKqNZiewScoRFNVXLqgi+dq9UcU89y0QhSl7MdjMrfFrFUVQJgedkr+/wqA
 Z/CleZWw3Mx7ASuGdUsD/lrK4Or8C6NWkQSMTGyFowHoKqdf378ulT62bU0NbKV14FTGIT
 9Q6vM3ep4wDK3AGgInmFkByCMfWZjfY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-ZJZLlkWPOSa8c08eGFilew-1; Fri, 09 Dec 2022 06:25:28 -0500
X-MC-Unique: ZJZLlkWPOSa8c08eGFilew-1
Received: by mail-ej1-f71.google.com with SMTP id
 nc4-20020a1709071c0400b0078a5ceb571bso2907437ejc.4
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOwX9wpZTs+zF4AW3wtB/CLmwtvj3wE48v6r8TJJLJ8=;
 b=23UjmZiD+bKru7A8MSyla6NZG2Fox6dOVww0iOD1LAJ6KA4ZOI/Y+aFRV4wbCi4MZL
 wjYrCIxHzvGrrpIp+I9oIUD3M68fYeUcj2L2bflg9VD0zAyzK2Y/WCBCgxJxCRiEcjgu
 uXYngI0O10Td1lzTaA0EDtOKA8oHl37UcAA2ZBK+S9nn84Q9syx2XXqWxgj1nWiYMUIG
 QHkREbUijGw52HKUf0lFkF0eKVHqY7u+uyu63LCNBkMiCX9SjZWHlKil0o8zIGvU4J58
 oNlAWP+GsCjAu25amGlAD89NpfLxqNAYDEjgqUQxqSiC6MgOSfUfM9IwrE2HgSzTbxm2
 gqFw==
X-Gm-Message-State: ANoB5plaxIh0ppYVdVxq/J0x33lylsMZhoSWYtr9prlb3Z7HPi9YaSWB
 EeestxSiNxV+TYIRjCExygAEsidGmNmorTtqJ8EaR0/gi6K1viqJE2V6wZ1+XH9iRfQE+XL++4e
 Ub/OMhCMKvyx3MoU94udSdO5kt6+DrfP01fVKuePW5pqTrNG5B19uIZbf5SNOuKythak=
X-Received: by 2002:a17:906:5a54:b0:7c0:eba2:f9dd with SMTP id
 my20-20020a1709065a5400b007c0eba2f9ddmr4880491ejc.53.1670585127058; 
 Fri, 09 Dec 2022 03:25:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5z9I8zUmdsLRU6ceffCKNPOAopwLHZmYB558+XpQQ9PP4V1C28p74OCpi2YGQU6lGYm4DNBQ==
X-Received: by 2002:a17:906:5a54:b0:7c0:eba2:f9dd with SMTP id
 my20-20020a1709065a5400b007c0eba2f9ddmr4880470ejc.53.1670585126433; 
 Fri, 09 Dec 2022 03:25:26 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a1709061bb100b0073d7b876621sm432648ejg.205.2022.12.09.03.25.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/30] build: move sanitizer tests to meson
Date: Fri,  9 Dec 2022 12:24:00 +0100
Message-Id: <20221209112409.184703-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                      | 151 ---------------------------------
 docs/devel/build-system.rst    |   4 -
 meson.build                    |  63 +++++++++++++-
 meson_options.txt              |   4 +
 scripts/meson-buildoptions.sh  |   6 ++
 tests/qemu-iotests/meson.build |   2 +-
 tests/unit/meson.build         |   2 +-
 7 files changed, 73 insertions(+), 159 deletions(-)

diff --git a/configure b/configure
index b0df6c3cf754..babcf5d28a85 100755
--- a/configure
+++ b/configure
@@ -269,9 +269,6 @@ EXTRA_OBJCFLAGS=""
 EXTRA_LDFLAGS=""
 
 debug_tcg="no"
-sanitizers="no"
-tsan="no"
-fortify_source="yes"
 EXESUF=""
 prefix="/usr/local"
 qemu_suffix="qemu"
@@ -392,14 +389,6 @@ EOF
   compile_object
 }
 
-check_include() {
-cat > $TMPC <<EOF
-#include <$1>
-int main(void) { return 0; }
-EOF
-  compile_object
-}
-
 write_c_skeleton() {
     cat > $TMPC <<EOF
 int main(void) { return 0; }
@@ -755,15 +744,6 @@ for opt do
       debug_tcg="yes"
       meson_option_parse --enable-debug-mutex ""
       meson_option_add -Doptimization=0
-      fortify_source="no"
-  ;;
-  --enable-sanitizers) sanitizers="yes"
-  ;;
-  --disable-sanitizers) sanitizers="no"
-  ;;
-  --enable-tsan) tsan="yes"
-  ;;
-  --disable-tsan) tsan="no"
   ;;
   --disable-tcg) tcg="disabled"
                  plugins="no"
@@ -971,8 +951,6 @@ Advanced options (experts only):
                            desired devices in configs/devices/)
   --with-devices-ARCH=NAME override default configs/devices
   --enable-debug           enable common debug build options
-  --enable-sanitizers      enable default sanitizers
-  --enable-tsan            enable thread sanitizer
   --disable-werror         disable compilation abort on warning
   --disable-stack-protector disable compiler-provided stack protection
   --cpu=CPU                Build for host CPU [$cpu]
@@ -1547,91 +1525,6 @@ if ! compile_object "-Werror"; then
     ccache_cpp2=yes
 fi
 
-#################################################
-# clang does not support glibc + FORTIFY_SOURCE.
-
-if test "$fortify_source" != "no"; then
-  if echo | $cc -dM -E - | grep __clang__ > /dev/null 2>&1 ; then
-    fortify_source="no";
-  elif test -n "$cxx" && has $cxx &&
-       echo | $cxx -dM -E - | grep __clang__ >/dev/null 2>&1 ; then
-    fortify_source="no";
-  else
-    fortify_source="yes"
-  fi
-fi
-
-##########################################
-# checks for sanitizers
-
-have_asan=no
-have_ubsan=no
-have_asan_iface_h=no
-have_asan_iface_fiber=no
-
-if test "$sanitizers" = "yes" ; then
-  write_c_skeleton
-  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=address" ""; then
-      have_asan=yes
-  fi
-
-  # we could use a simple skeleton for flags checks, but this also
-  # detect the static linking issue of ubsan, see also:
-  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=84285
-  cat > $TMPC << EOF
-#include <stdlib.h>
-int main(void) {
-    void *tmp = malloc(10);
-    if (tmp != NULL) {
-        return *(int *)(tmp + 2);
-    }
-    return 1;
-}
-EOF
-  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=undefined" ""; then
-      have_ubsan=yes
-  fi
-
-  if check_include "sanitizer/asan_interface.h" ; then
-      have_asan_iface_h=yes
-  fi
-
-  cat > $TMPC << EOF
-#include <sanitizer/asan_interface.h>
-int main(void) {
-  __sanitizer_start_switch_fiber(0, 0, 0);
-  return 0;
-}
-EOF
-  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=address" "" ; then
-      have_asan_iface_fiber=yes
-  fi
-fi
-
-# Thread sanitizer is, for now, much noisier than the other sanitizers;
-# keep it separate until that is not the case.
-if test "$tsan" = "yes" && test "$sanitizers" = "yes"; then
-  error_exit "TSAN is not supported with other sanitiziers."
-fi
-have_tsan=no
-have_tsan_iface_fiber=no
-if test "$tsan" = "yes" ; then
-  write_c_skeleton
-  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=thread" "" ; then
-      have_tsan=yes
-  fi
-  cat > $TMPC << EOF
-#include <sanitizer/tsan_interface.h>
-int main(void) {
-  __tsan_create_fiber(0);
-  return 0;
-}
-EOF
-  if compile_prog "$CPU_CFLAGS -Werror -fsanitize=thread" "" ; then
-      have_tsan_iface_fiber=yes
-  fi
-fi
-
 ##########################################
 # functions to probe cross compilers
 
@@ -2057,42 +1950,6 @@ case "$vfio_user_server" in
     ;;
 esac
 
-##########################################
-# End of CC checks
-# After here, no more $cc or $ld runs
-
-write_c_skeleton
-
-if test "$fortify_source" = "yes" ; then
-  QEMU_CFLAGS="-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $QEMU_CFLAGS"
-fi
-
-if test "$have_asan" = "yes"; then
-  QEMU_CFLAGS="-fsanitize=address $QEMU_CFLAGS"
-  QEMU_LDFLAGS="-fsanitize=address $QEMU_LDFLAGS"
-  if test "$have_asan_iface_h" = "no" ; then
-      echo "ASAN build enabled, but ASAN header missing." \
-           "Without code annotation, the report may be inferior."
-  elif test "$have_asan_iface_fiber" = "no" ; then
-      echo "ASAN build enabled, but ASAN header is too old." \
-           "Without code annotation, the report may be inferior."
-  fi
-fi
-if test "$have_tsan" = "yes" ; then
-  if test "$have_tsan_iface_fiber" = "yes" ; then
-    QEMU_CFLAGS="-fsanitize=thread $QEMU_CFLAGS"
-    QEMU_LDFLAGS="-fsanitize=thread $QEMU_LDFLAGS"
-  else
-    error_exit "Cannot enable TSAN due to missing fiber annotation interface."
-  fi
-elif test "$tsan" = "yes" ; then
-  error_exit "Cannot enable TSAN due to missing sanitize thread interface."
-fi
-if test "$have_ubsan" = "yes"; then
-  QEMU_CFLAGS="-fsanitize=undefined $QEMU_CFLAGS"
-  QEMU_LDFLAGS="-fsanitize=undefined $QEMU_LDFLAGS"
-fi
-
 #######################################
 # cross-compiled firmware targets
 
@@ -2216,14 +2073,6 @@ fi
 
 echo "CONFIG_COROUTINE_BACKEND=$coroutine" >> $config_host_mak
 
-if test "$have_asan_iface_fiber" = "yes" ; then
-    echo "CONFIG_ASAN_IFACE_FIBER=y" >> $config_host_mak
-fi
-
-if test "$have_tsan" = "yes" && test "$have_tsan_iface_fiber" = "yes" ; then
-    echo "CONFIG_TSAN=y" >> $config_host_mak
-fi
-
 if test "$plugins" = "yes" ; then
     echo "CONFIG_PLUGIN=y" >> $config_host_mak
 fi
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 66cfe7b8bdc8..4a733fc0a747 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -91,10 +91,6 @@ developers in checking for system features:
 ``check_define $NAME``
    Determine if the macro $NAME is defined by the system C compiler
 
-``check_include $NAME``
-   Determine if the include $NAME file is available to the system C
-   compiler.  The replacement in Meson is ``cc.has_header()``.
-
 ``write_c_skeleton``
    Write a minimal C program main() function to the temporary file
    indicated by $TMPC
diff --git a/meson.build b/meson.build
index dac343d14797..41a45fa495b2 100644
--- a/meson.build
+++ b/meson.build
@@ -211,6 +211,42 @@ if get_option('prefer_static')
   qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
 endif
 
+if get_option('sanitizers')
+  if cc.has_argument('-fsanitize=address')
+    qemu_cflags = ['-fsanitize=address'] + qemu_cflags
+    qemu_ldflags = ['-fsanitize=address'] + qemu_ldflags
+  endif
+
+  # Detect static linking issue with ubsan - https://gcc.gnu.org/bugzilla/show_bug.cgi?id=84285
+  if cc.links('''
+    #include <stdlib.h>
+    int main(void) {
+      void *tmp = malloc(10);
+      if (tmp != NULL) {
+        return *(int *)(tmp + 2);
+      }
+      return 1;
+  }''', args: [qemu_ldflags, '-fsanitize=undefined'])
+    qemu_cflags = ['-fsanitize=undefined'] + qemu_cflags
+    qemu_ldflags = ['-fsanitize=undefined'] + qemu_ldflags
+  endif
+endif
+
+# Thread sanitizer is, for now, much noisier than the other sanitizers;
+# keep it separate until that is not the case.
+if get_option('tsan')
+  if get_option('sanitizers')
+    error('TSAN is not supported with other sanitizers')
+  endif
+  if not cc.has_function('__tsan_create_fiber',
+                         args: '-fsanitize=thread',
+                         prefix: '#include <sanitizer/tsan_interface.h>')
+    error('Cannot enable TSAN due to missing fiber annotation interface')
+  endif
+  qemu_cflags = ['-fsanitize=thread'] + qemu_cflags
+  qemu_ldflags = ['-fsanitize=thread'] + qemu_ldflags
+endif
+
 # Detect support for PT_GNU_RELRO + DT_BIND_NOW.
 # The combination is known as "full relro", because .got.plt is read-only too.
 qemu_ldflags += cc.get_supported_link_arguments('-Wl,-z,relro', '-Wl,-z,now')
@@ -221,7 +257,7 @@ if targetos == 'windows'
 endif
 
 # Exclude --warn-common with TSan to suppress warnings from the TSan libraries.
-if targetos != 'sunos' and not config_host.has_key('CONFIG_TSAN')
+if targetos != 'sunos' and not get_option('tsan')
   qemu_ldflags += cc.get_supported_link_arguments('-Wl,--warn-common')
 endif
 
@@ -288,6 +324,16 @@ if 'cpp' in all_languages
   endif
 endif
 
+# clang does not support glibc + FORTIFY_SOURCE (is it still true?)
+if get_option('optimization') != '0' and targetos == 'linux'
+  if cc.get_id() == 'gcc'
+    qemu_cflags += ['-U_FORTIFY_SOURCE', '-D_FORTIFY_SOURCE=2']
+  endif
+  if 'cpp' in all_languages and cxx.get_id() == 'gcc'
+    qemu_cxxflags += ['-U_FORTIFY_SOURCE', '-D_FORTIFY_SOURCE=2']
+  endif
+endif
+
 add_project_arguments(qemu_cflags, native: false, language: 'c')
 add_project_arguments(qemu_cxxflags, native: false, language: 'cpp')
 add_project_arguments(qemu_objcflags, native: false, language: 'objc')
@@ -1890,6 +1936,7 @@ if seccomp.found()
 endif
 config_host_data.set('CONFIG_SNAPPY', snappy.found())
 config_host_data.set('CONFIG_TPM', have_tpm)
+config_host_data.set('CONFIG_TSAN', get_option('tsan'))
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_NET', have_vhost_net)
@@ -2018,6 +2065,18 @@ if rdma.found()
                                        prefix: '#include <infiniband/verbs.h>'))
 endif
 
+have_asan_fiber = false
+if get_option('sanitizers') and \
+   not cc.has_function('__sanitizer_start_switch_fiber',
+                         args: '-fsanitize=address',
+                         prefix: '#include <sanitizer/asan_interface.h>')
+  warning('Missing ASAN due to missing fiber annotation interface')
+  warning('Without code annotation, the report may be inferior.')
+else
+  have_asan_fiber = true
+endif
+config_host_data.set('CONFIG_ASAN_IFACE_FIBER', have_asan_fiber)
+
 # has_header_symbol
 config_host_data.set('CONFIG_BYTESWAP_H',
                      cc.has_header_symbol('byteswap.h', 'bswap_32'))
@@ -3804,7 +3863,7 @@ summary_info += {'avx2 optimization': config_host_data.get('CONFIG_AVX2_OPT')}
 summary_info += {'avx512f optimization': config_host_data.get('CONFIG_AVX512F_OPT')}
 summary_info += {'gprof enabled':     get_option('gprof')}
 summary_info += {'gcov':              get_option('b_coverage')}
-summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
+summary_info += {'thread sanitizer':  get_option('tsan')}
 summary_info += {'CFI support':       get_option('cfi')}
 if get_option('cfi')
   summary_info += {'CFI debug support': get_option('cfi_debug')}
diff --git a/meson_options.txt b/meson_options.txt
index e492aaa73fbc..feeefa2ccbc1 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -84,6 +84,10 @@ option('tcg', type: 'feature', value: 'enabled',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
        description: 'TCG with bytecode interpreter (slow)')
+option('sanitizers', type: 'boolean', value: false,
+       description: 'enable default sanitizers')
+option('tsan', type: 'boolean', value: false,
+       description: 'enable thread sanitizer')
 option('cfi', type: 'boolean', value: false,
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: false,
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index cb277347bb18..bafc40ddfbf4 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -36,11 +36,13 @@ meson_options_help() {
   printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
   printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using /dev/(u)random and'
   printf "%s\n" '                           getrandom()'
+  printf "%s\n" '  --enable-sanitizers      enable default sanitizers'
   printf "%s\n" '  --enable-strip           Strip targets on install'
   printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode interpreter (slow)'
   printf "%s\n" '  --enable-trace-backends=CHOICES'
   printf "%s\n" '                           Set available tracing backends [log] (choices:'
   printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
+  printf "%s\n" '  --enable-tsan            enable thread sanitizer'
   printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-firmware]'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
   printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
@@ -388,6 +390,8 @@ _meson_option_parse() {
     --disable-replication) printf "%s" -Dreplication=disabled ;;
     --enable-rng-none) printf "%s" -Drng_none=true ;;
     --disable-rng-none) printf "%s" -Drng_none=false ;;
+    --enable-sanitizers) printf "%s" -Dsanitizers=true ;;
+    --disable-sanitizers) printf "%s" -Dsanitizers=false ;;
     --enable-sdl) printf "%s" -Dsdl=enabled ;;
     --disable-sdl) printf "%s" -Dsdl=disabled ;;
     --enable-sdl-image) printf "%s" -Dsdl_image=enabled ;;
@@ -427,6 +431,8 @@ _meson_option_parse() {
     --disable-tpm) printf "%s" -Dtpm=disabled ;;
     --enable-trace-backends=*) quote_sh "-Dtrace_backends=$2" ;;
     --with-trace-file=*) quote_sh "-Dtrace_file=$2" ;;
+    --enable-tsan) printf "%s" -Dtsan=true ;;
+    --disable-tsan) printf "%s" -Dtsan=false ;;
     --enable-u2f) printf "%s" -Du2f=enabled ;;
     --disable-u2f) printf "%s" -Du2f=disabled ;;
     --enable-usb-redir) printf "%s" -Dusb_redir=enabled ;;
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 323a4acb6a3f..583468c5b9b3 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -2,7 +2,7 @@ if not have_tools or targetos == 'windows' or get_option('gprof')
   subdir_done()
 endif
 
-foreach cflag: config_host['QEMU_CFLAGS'].split()
+foreach cflag: qemu_ldflags
   if cflag.startswith('-fsanitize') and \
      not cflag.contains('safe-stack') and not cflag.contains('cfi-icall')
     message('Sanitizers are enabled ==> Disabled the qemu-iotests.')
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index b497a4137830..46d88b49cbcf 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -143,7 +143,7 @@ if have_system
   # Some tests: test-char, test-qdev-global-props, and test-qga,
   # are not runnable under TSan due to a known issue.
   # https://github.com/google/sanitizers/issues/1116
-  if 'CONFIG_TSAN' not in config_host
+  if not get_option('tsan')
     if 'CONFIG_POSIX' in config_host
         tests += {
           'test-char': ['socket-helpers.c', qom, io, chardev]
-- 
2.38.1


