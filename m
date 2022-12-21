Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7652F6535EC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:11:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Qe-0001D3-Pw; Wed, 21 Dec 2022 13:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QJ-0001CN-Ez
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83QH-0004LW-IR
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82nDtmiImedDhp3vkdUqEEQgeQIdwDkdoWjDJgK0/Po=;
 b=GOXoYAlBPvz/26yzMEP6eUZBr/3Ue5UcxWKXlwD4bFX9ygWNlGW5pUQ9uWxwrWoPvYZWR6
 ZGwfcUyFt9Jm/kWcGfhhMg64wm4JOJ8mcm5ykqkjVh/kq1yuW0gL1fituZQW1pmI1HCNxm
 Y6vwFl1gqIpCWgQL9fVVYhLLIPd63OQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-vGcvpPpbNbujURzwccR0mQ-1; Wed, 21 Dec 2022 13:02:31 -0500
X-MC-Unique: vGcvpPpbNbujURzwccR0mQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 jg25-20020a170907971900b007c0e98ad898so11106052ejc.15
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=82nDtmiImedDhp3vkdUqEEQgeQIdwDkdoWjDJgK0/Po=;
 b=XJG3+ct/u1VsxtHT+6D0GkJCL4ct73s9UNPt9s9DyLsZ7IZMf3W75+ZxU6LjJCZ6nE
 nCAqdEnpWHWLapJsWZYMKFkZ9XSBfrckIgUmXVTXN+Zj0HPRRDrIF6eT5wT5XvYRwMPo
 9M8moZM5UiXeyisGa5HBM6F7VR4HGUdkYi44qGFduNiF6r2KclbJbMIRsiofR2hZs/7D
 aYtodNQzIoWP3iYq1DVWlyibp6lMUgkTTc3f67ZVTF0xMbVW+emKxELSB/hdXvbr5tbM
 21BQDPeqUCM7yA7iVsianiZ9YUg0VwuDSXPJRO+IIgmm/EM8FBMuCQrYm5rSilMLrJML
 3+Wg==
X-Gm-Message-State: AFqh2krjeb17wrscbMeVYcZocuuolkjA4lfjALLhSXgzAqSjYRKpHAuW
 4lar7TDyY2tySRa+OybrUxN7tUbZQmgEX8Oto4Bf1qRX29alYnVCMA7ervoyWDXX0lpnmqG5XuL
 au6Jb09ZcGhnho1ezTdF0mrPpiradZ2Oo83QdNrkbRY6JnN2Wdy2jqNUblQcFGvoCCws=
X-Received: by 2002:a05:6402:1298:b0:461:75f1:9254 with SMTP id
 w24-20020a056402129800b0046175f19254mr2442585edv.2.1671645749888; 
 Wed, 21 Dec 2022 10:02:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvFBFaiqqKzulTgBrEfTvafb/vT5xbCd2liNi5GulqCFWX950bX0kuB1zBY9NqEXV8Q+FHvcg==
X-Received: by 2002:a05:6402:1298:b0:461:75f1:9254 with SMTP id
 w24-20020a056402129800b0046175f19254mr2442563edv.2.1671645749575; 
 Wed, 21 Dec 2022 10:02:29 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 rs13-20020a170907036d00b0077a1dd3e7b7sm7410423ejb.102.2022.12.21.10.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 17/24] meson: cleanup compiler detection
Date: Wed, 21 Dec 2022 19:01:34 +0100
Message-Id: <20221221180141.839616-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 62 ++++++++++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/meson.build b/meson.build
index dbd0b5563446..81920844448d 100644
--- a/meson.build
+++ b/meson.build
@@ -14,8 +14,8 @@ keyval = import('keyval')
 ss = import('sourceset')
 fs = import('fs')
 
+targetos = host_machine.system()
 sh = find_program('sh')
-cc = meson.get_compiler('c')
 config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
 enable_modules = 'CONFIG_MODULES' in config_host
 enable_static = 'CONFIG_STATIC' in config_host
@@ -23,6 +23,18 @@ enable_static = 'CONFIG_STATIC' in config_host
 # Allow both shared and static libraries unless --enable-static
 static_kwargs = enable_static ? {'static': true} : {}
 
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
+
 # Temporary directory used for files created while
 # configure runs. Since it is in the build directory
 # we can safely blow away any previous version of it
@@ -58,8 +70,6 @@ if cpu in ['riscv32', 'riscv64']
   cpu = 'riscv'
 endif
 
-targetos = host_machine.system()
-
 target_dirs = config_host['TARGET_DIRS'].split()
 have_linux_user = false
 have_bsd_user = false
@@ -165,7 +175,7 @@ if 'dtrace' in get_option('trace_backends')
     # semaphores are linked into the main binary and not the module's shared
     # object.
     add_global_arguments('-DSTAP_SDT_V2',
-                         native: false, language: ['c', 'cpp', 'objc'])
+                         native: false, language: all_languages)
   endif
 endif
 
@@ -207,7 +217,7 @@ endif
 if get_option('fuzzing')
   add_project_link_arguments(['-Wl,-T,',
                               (meson.current_source_dir() / 'tests/qtest/fuzz/fork_fuzz.ld')],
-                             native: false, language: ['c', 'cpp', 'objc'])
+                             native: false, language: all_languages)
 
   # Specify a filter to only instrument code that is directly related to
   # virtual-devices.
@@ -220,7 +230,7 @@ if get_option('fuzzing')
                  args: ['-fsanitize-coverage-allowlist=/dev/null',
                         '-fsanitize-coverage=trace-pc'] )
     add_global_arguments('-fsanitize-coverage-allowlist=instrumentation-filter',
-                         native: false, language: ['c', 'cpp', 'objc'])
+                         native: false, language: all_languages)
   endif
 
   if get_option('fuzzing_engine') == ''
@@ -229,9 +239,9 @@ if get_option('fuzzing')
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
@@ -242,15 +252,11 @@ if get_option('fuzzing')
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
@@ -259,7 +265,6 @@ if add_languages('cpp', required: false, native: false)
       qemu_cxxflags += [k]
     endif
   endforeach
-  add_global_arguments(qemu_cxxflags, native: false, language: 'cpp')
 
   if cxx.links(files('scripts/main.c'), args: qemu_cflags)
     link_language = 'cpp'
@@ -275,22 +280,21 @@ if targetos != 'sunos' and not config_host.has_key('CONFIG_TSAN')
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
@@ -472,7 +476,7 @@ if get_option('tcg').allowed()
     tcg_arch = 'ppc'
   endif
   add_project_arguments('-iquote', meson.current_source_dir() / 'tcg' / tcg_arch,
-                        language: ['c', 'cpp', 'objc'])
+                        language: all_languages)
 
   accelerators += 'CONFIG_TCG'
   config_host += { 'CONFIG_TCG': 'y' }
@@ -498,7 +502,7 @@ endif
 # The path to glib.h is added to all compilation commands.  This was
 # grandfathered in from the QEMU Makefiles.
 add_project_arguments(config_host['GLIB_CFLAGS'].split(),
-                      native: false, language: ['c', 'cpp', 'objc'])
+                      native: false, language: all_languages)
 glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
                           link_args: config_host['GLIB_LIBS'].split(),
                           version: config_host['GLIB_VERSION'],
@@ -1723,8 +1727,8 @@ if get_option('cfi')
       error('-fno-sanitize-trap=cfi-icall is not supported by the compiler')
     endif
   endif
-  add_global_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
-  add_global_link_arguments(cfi_flags, native: false, language: ['c', 'cpp', 'objc'])
+  add_global_arguments(cfi_flags, native: false, language: all_languages)
+  add_global_link_arguments(cfi_flags, native: false, language: all_languages)
 endif
 
 have_host_block_device = (targetos != 'darwin' or
@@ -3768,8 +3772,12 @@ if link_args.length() > 0
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


