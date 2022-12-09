Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D31B6481C7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:31:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bWE-0004vU-6G; Fri, 09 Dec 2022 06:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUx-0003yz-0O
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUv-00011F-2U
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FKVqDpGdK8B/+N9LpyhXBN01lnpX+uhdgTjONzNUl6Q=;
 b=W001Wh3VDCAtGzUCQKsl5GxfrLjkpbhoUVDHcU7qR3RsnSesJ+gNOvKRrHmMpowYUPUQMa
 yv7YzpskzFTAN2TvJEbPOwCE3HvAhtfeTxRdkO4Pn4Y8eQGpXy8VsOrbKwzlMSx6TN4n6U
 10K/V5V9aKBbWwaR7qXa8y6Chj6lwrQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-kBxHcI_NOWiLfvyLNb4qIA-1; Fri, 09 Dec 2022 06:24:55 -0500
X-MC-Unique: kBxHcI_NOWiLfvyLNb4qIA-1
Received: by mail-ed1-f69.google.com with SMTP id
 t4-20020a056402524400b004620845ba7bso1205606edd.4
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FKVqDpGdK8B/+N9LpyhXBN01lnpX+uhdgTjONzNUl6Q=;
 b=o1FzgStCJPQ3Q08EImABKoXzmyGegIoms3ezoI7PqMWqU8HTLFDF+eB3OlMhHZK/bL
 0vb1FbnwguKBDJczQ8DCRWmr8Xb+FwnPLtp3d0aj1J3IHgpc+ZCQxIkoHljuDClAjIGL
 pEDNV8pfELF/nwMEb6TBfuZLGXdG19yuWKe05patz9MMjfa3MXBuXYHlovVts/8i4Uki
 3NVTm5yvJkM9H6pgfrig+QOcRUvr2nqfKf4OSYOF6e0QDskfifw3dbGqIUdktgK8JXkR
 v4d3ZuqC6oa4a84YT1L802m0rNexq9wOE2FbS4V9jCEAjLugNwTBlROZ3ztpS4x/u3iW
 qXCA==
X-Gm-Message-State: ANoB5pmkUuTS00O+liPN0GtpGCXSbKglYQtvO7LmG53Hrp2cemvr6aWf
 2rNETE2S3AkgWy2dYOzdq3FzV4gNBPinLb5K0s3upezzl3R25rev7/vAwHMNb1PD+FCBe1TQPl0
 dzvAsdOPoM0BwTtNLmCNNr0uSebOZ++kD1aPp98qHoVmea7Nhkdss4XkMVHXC81OvlE0=
X-Received: by 2002:a17:907:8b87:b0:7bc:14f7:9daa with SMTP id
 tb7-20020a1709078b8700b007bc14f79daamr5146037ejc.39.1670585093770; 
 Fri, 09 Dec 2022 03:24:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4QTjBg7LYin/ZQm5LUZM8IcVXznyciPemQfgPa6Wm3tTJMr7BwTpffjfhhoqTySfRDl2oQcQ==
X-Received: by 2002:a17:907:8b87:b0:7bc:14f7:9daa with SMTP id
 tb7-20020a1709078b8700b007bc14f79daamr5146009ejc.39.1670585093333; 
 Fri, 09 Dec 2022 03:24:53 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a170906769000b00782e3cf7277sm438151ejm.120.2022.12.09.03.24.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:52 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/30] meson: cleanup compiler detection
Date: Fri,  9 Dec 2022 12:23:54 +0100
Message-Id: <20221209112409.184703-16-pbonzini@redhat.com>
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

Detect all compilers at the beginning of meson.build, and store
the available languages in an array.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 62 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/meson.build b/meson.build
index 8a9ed5628317..c4fa82ae8ba4 100644
--- a/meson.build
+++ b/meson.build
@@ -15,9 +15,21 @@ ss = import('sourceset')
 fs = import('fs')
 
 sh = find_program('sh')
-cc = meson.get_compiler('c')
 config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
 enable_modules = 'CONFIG_MODULES' in config_host
+targetos = host_machine.system()
+
+cc = meson.get_compiler('c')
+all_languages = ['c']
+if add_languages('cpp', required: false, native: false)
+  all_languages += ['cpp']
+  cxx = meson.get_compiler('cpp')
+endif
+if targetos == 'darwin' and \
+   add_languages('objc', required: get_option('cocoa'), native: false)
+  all_languages += ['objc']
+  objc = meson.get_compiler('objc')
+endif
 
 # Temporary directory used for files created while
 # configure runs. Since it is in the build directory
@@ -54,8 +66,6 @@ if cpu in ['riscv32', 'riscv64']
   cpu = 'riscv'
 endif
 
-targetos = host_machine.system()
-
 target_dirs = config_host['TARGET_DIRS'].split()
 have_linux_user = false
 have_bsd_user = false
@@ -161,7 +171,7 @@ if 'dtrace' in get_option('trace_backends')
     # semaphores are linked into the main binary and not the module's shared
     # object.
     add_global_arguments('-DSTAP_SDT_V2',
-                         native: false, language: ['c', 'cpp', 'objc'])
+                         native: false, language: all_languages)
   endif
 endif
 
@@ -203,7 +213,7 @@ endif
 if get_option('fuzzing')
   add_project_link_arguments(['-Wl,-T,',
                               (meson.current_source_dir() / 'tests/qtest/fuzz/fork_fuzz.ld')],
-                             native: false, language: ['c', 'cpp', 'objc'])
+                             native: false, language: all_languages)
 
   # Specify a filter to only instrument code that is directly related to
   # virtual-devices.
@@ -216,7 +226,7 @@ if get_option('fuzzing')
                  args: ['-fsanitize-coverage-allowlist=/dev/null',
                         '-fsanitize-coverage=trace-pc'] )
     add_global_arguments('-fsanitize-coverage-allowlist=instrumentation-filter',
-                         native: false, language: ['c', 'cpp', 'objc'])
+                         native: false, language: all_languages)
   endif
 
   if get_option('fuzzing_engine') == ''
@@ -225,9 +235,9 @@ if get_option('fuzzing')
     # everything with fsanitize=fuzzer-no-link. Otherwise, the linker will be
     # unable to bind the fuzzer-related callbacks added by instrumentation.
     add_global_arguments('-fsanitize=fuzzer-no-link',
-                         native: false, language: ['c', 'cpp', 'objc'])
+                         native: false, language: all_languages)
     add_global_link_arguments('-fsanitize=fuzzer-no-link',
-                              native: false, language: ['c', 'cpp', 'objc'])
+                              native: false, language: all_languages)
     # For the actual fuzzer binaries, we need to link against the libfuzzer
     # library. They need to be configurable, to support OSS-Fuzz
     fuzz_exe_ldflags = ['-fsanitize=fuzzer']
@@ -238,15 +248,11 @@ if get_option('fuzzing')
   endif
 endif
 
-add_global_arguments(qemu_cflags, native: false, language: ['c'])
-add_global_arguments(qemu_objcflags, native: false, language: ['objc'])
-
 # Check that the C++ compiler exists and works with the C compiler.
 link_language = 'c'
 linker = cc
 qemu_cxxflags = []
-if add_languages('cpp', required: false, native: false)
-  cxx = meson.get_compiler('cpp')
+if 'cpp' in all_languages
   add_global_arguments(['-D__STDC_LIMIT_MACROS', '-D__STDC_CONSTANT_MACROS', '-D__STDC_FORMAT_MACROS'],
                        native: false, language: 'cpp')
   foreach k: qemu_cflags
@@ -255,7 +261,6 @@ if add_languages('cpp', required: false, native: false)
       qemu_cxxflags += [k]
     endif
   endforeach
-  add_global_arguments(qemu_cxxflags, native: false, language: 'cpp')
 
   if cxx.links(files('scripts/main.c'), args: qemu_cflags)
     link_language = 'cpp'
@@ -271,22 +276,21 @@ if targetos != 'sunos' and not config_host.has_key('CONFIG_TSAN')
   qemu_ldflags += linker.get_supported_link_arguments('-Wl,--warn-common')
 endif
 
-add_global_link_arguments(qemu_ldflags, native: false, language: ['c', 'cpp', 'objc'])
+add_global_link_arguments(qemu_ldflags, native: false, language: all_languages)
 
+add_global_arguments(qemu_cflags, native: false, language: 'c')
+add_global_arguments(qemu_cxxflags, native: false, language: 'cpp')
+add_global_arguments(qemu_objcflags, native: false, language: 'objc')
 if targetos == 'linux'
   add_project_arguments('-isystem', meson.current_source_dir() / 'linux-headers',
                         '-isystem', 'linux-headers',
-                        language: ['c', 'cpp'])
+                        language: all_languages)
 endif
 
 add_project_arguments('-iquote', '.',
                       '-iquote', meson.current_source_dir(),
                       '-iquote', meson.current_source_dir() / 'include',
-                      language: ['c', 'cpp', 'objc'])
-
-if host_machine.system() == 'darwin'
-  add_languages('objc', required: false, native: false)
-endif
+                      language: all_languages)
 
 sparse = find_program('cgcc', required: get_option('sparse'))
 if sparse.found()
@@ -468,7 +472,7 @@ if get_option('tcg').allowed()
     tcg_arch = 'ppc'
   endif
   add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
-                        language: ['c', 'cpp', 'objc'])
+                        language: all_languages)
 
   accelerators += 'CONFIG_TCG'
   config_host += { 'CONFIG_TCG': 'y' }
@@ -494,7 +498,7 @@ endif
 # The path to glib.h is added to all compilation commands.  This was
 # grandfathered in from the QEMU Makefiles.
 add_project_arguments(config_host['GLIB_CFLAGS'].split(),
-                      native: false, language: ['c', 'cpp', 'objc'])
+                      native: false, language: all_languages)
 glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
                           link_args: config_host['GLIB_LIBS'].split(),
                           version: config_host['GLIB_VERSION'],
@@ -1674,8 +1678,8 @@ if get_option('cfi')
       error('-fno-sanitize-trap=cfi-icall is not supported by the compiler')
     endif
   endif
-  add_global_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
-  add_global_link_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
+  add_global_arguments(cfi_flags, native: false, language: all_languages)
+  add_global_link_arguments(cfi_flags, native: false, language: all_languages)
 endif
 
 have_host_block_device = (targetos != 'darwin' or
@@ -3713,8 +3717,12 @@ if link_args.length() > 0
   summary_info += {'LDFLAGS':         ' '.join(link_args)}
 endif
 summary_info += {'QEMU_CFLAGS':       ' '.join(qemu_cflags)}
-summary_info += {'QEMU_CXXFLAGS':     ' '.join(qemu_cxxflags)}
-summary_info += {'QEMU_OBJCFLAGS':    ' '.join(qemu_objcflags)}
+if 'cpp' in all_languages
+  summary_info += {'QEMU_CXXFLAGS':     ' '.join(qemu_cxxflags)}
+endif
+if 'objc' in all_languages
+  summary_info += {'QEMU_OBJCFLAGS':    ' '.join(qemu_objcflags)}
+endif
 summary_info += {'QEMU_LDFLAGS':      ' '.join(qemu_ldflags)}
 summary_info += {'profiler':          get_option('profiler')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
-- 
2.38.1


