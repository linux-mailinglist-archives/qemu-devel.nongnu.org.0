Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE5A6481BE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:30:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bXI-0005xQ-HR; Fri, 09 Dec 2022 06:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVm-0004SH-Em
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVU-0001Qe-Gp
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pR26OFOoy6QKEyt1tQyJHyljdRra3eCvOh/6b4sB30I=;
 b=Ms/RJHvzCNdi9+1zmi+RoHZ9gTnrx/ku2RrZ7shZP3xmQqx9jnG20Y/Bi2K9kvCZXPJ3eW
 J36Y+vZSL6Kwcmdk/ANzWaaasYsTC6qkBWOX3HDJ8XH0gvbwYwkH5+4cNqXfT3FRxfindI
 EN+ISyctjQQbFvHsdiF/tVHtVu75vUQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-eS_KCv_oMOuB_tcmctgXKg-1; Fri, 09 Dec 2022 06:25:25 -0500
X-MC-Unique: eS_KCv_oMOuB_tcmctgXKg-1
Received: by mail-ed1-f71.google.com with SMTP id
 x20-20020a05640226d400b0046cbe2b85caso1206410edd.3
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pR26OFOoy6QKEyt1tQyJHyljdRra3eCvOh/6b4sB30I=;
 b=UVCzWJ3zQqcbyM875buYBcod5q/LrTBQW4meudQK3khpRcSb7JKeu+OMiuIlLqEw2P
 mUTHuINAwShT/LXLKjFopnTiMr+E3jAYwNaeGjMQqcWX2RsIea0O5XZytdM9nkSZjxAT
 qhrlpfdSTJSbJtmdVIBaZ76nA/wcWmM2pR1YdZ1Gflxe6WYz4b/wqQKAL+X8+rV43dtC
 Ce3AHdVj/ui+OiAsszuOAp7s643kQB2mQBenwuqSu9VCRgaAYp3SSSxqo695R3o/X3SY
 tAMpVk0HzMcbhbafufKobXj3Km16hbDRWZlcZUntrnKTpACoBbIJa9DXF+V9RzdTydTI
 AmnA==
X-Gm-Message-State: ANoB5pnVSgDZrcnUfjBLh7lmOXRBFSL7qzKtDrhbAbAEAaTQVLeYcf5L
 FZSzIUv9+stq9y2qSsaxQJFfP7nZuY7fdHOSn0dWfW5SItg20dV5AFX99StozBB9TncbKgQEuIJ
 xBai7EJzXADkltoq0nib1vyc80AmRoMtDgcpuWLKNAPOmXQSBKuzkxCsvdQhZ4vvz/7U=
X-Received: by 2002:a17:907:3e91:b0:7c1:13b5:c434 with SMTP id
 hs17-20020a1709073e9100b007c113b5c434mr7128924ejc.35.1670585123586; 
 Fri, 09 Dec 2022 03:25:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5SIPZST8b0DzEQ+7k2Zp/FUmA/QDhn5mthLOmEOCR/T9zehUQvUqFFhAhG46mWwl6eoUkbXw==
X-Received: by 2002:a17:907:3e91:b0:7c1:13b5:c434 with SMTP id
 hs17-20020a1709073e9100b007c113b5c434mr7128897ejc.35.1670585123227; 
 Fri, 09 Dec 2022 03:25:23 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0073d71792c8dsm434522ejt.180.2022.12.09.03.25.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/30] meson: prepare move of QEMU_CFLAGS to meson
Date: Fri,  9 Dec 2022 12:23:59 +0100
Message-Id: <20221209112409.184703-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Clean up the handling of compiler flags in meson.build, splitting
the general flags that should be included in subprojects as well,
from warning flags that only apply to QEMU itself.  The two were
mixed in both configure tests and meson tests.

This split makes it easier to move the compiler tests piecewise
from configure to Meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 53 +++++++++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/meson.build b/meson.build
index 99c1bde4d154..dac343d14797 100644
--- a/meson.build
+++ b/meson.build
@@ -190,10 +190,23 @@ endif
 # Compiler flags #
 ##################
 
-qemu_cflags = config_host['QEMU_CFLAGS'].split()
+qemu_common_flags = []
+qemu_cflags = []
+foreach arg : config_host['QEMU_CFLAGS'].split()
+  if arg.startswith('-W')
+    qemu_cflags += arg
+  else
+    qemu_common_flags += arg
+  endif
+endforeach
 qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
 qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
 
+if get_option('gprof')
+  qemu_common_flags += ['-p']
+  qemu_ldflags += ['-p']
+endif
+
 if get_option('prefer_static')
   qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
 endif
@@ -207,10 +220,9 @@ if targetos == 'windows'
   qemu_ldflags += cc.get_supported_link_arguments('-Wl,--dynamicbase', '-Wl,--high-entropy-va')
 endif
 
-if get_option('gprof')
-  qemu_cflags += ['-p']
-  qemu_objcflags += ['-p']
-  qemu_ldflags += ['-p']
+# Exclude --warn-common with TSan to suppress warnings from the TSan libraries.
+if targetos != 'sunos' and not config_host.has_key('CONFIG_TSAN')
+  qemu_ldflags += cc.get_supported_link_arguments('-Wl,--warn-common')
 endif
 
 # Specify linker-script with add_project_link_arguments so that it is not placed
@@ -230,8 +242,7 @@ if get_option('fuzzing')
                   name: '-fsanitize-coverage-allowlist=/dev/null',
                  args: ['-fsanitize-coverage-allowlist=/dev/null',
                         '-fsanitize-coverage=trace-pc'] )
-    add_global_arguments('-fsanitize-coverage-allowlist=instrumentation-filter',
-                         native: false, language: all_languages)
+    qemu_common_flags += ['-fsanitize-coverage-allowlist=instrumentation-filter']
   endif
 
   if get_option('fuzzing_engine') == ''
@@ -239,10 +250,8 @@ if get_option('fuzzing')
     # compiled code.  To build non-fuzzer binaries with --enable-fuzzing, link
     # everything with fsanitize=fuzzer-no-link. Otherwise, the linker will be
     # unable to bind the fuzzer-related callbacks added by instrumentation.
-    add_global_arguments('-fsanitize=fuzzer-no-link',
-                         native: false, language: all_languages)
-    add_global_link_arguments('-fsanitize=fuzzer-no-link',
-                              native: false, language: all_languages)
+    qemu_common_flags += ['-fsanitize=fuzzer-no-link']
+    qemu_ldflags += ['-fsanitize=fuzzer-no-link']
     # For the actual fuzzer binaries, we need to link against the libfuzzer
     # library. They need to be configurable, to support OSS-Fuzz
     fuzz_exe_ldflags = ['-fsanitize=fuzzer']
@@ -253,6 +262,9 @@ if get_option('fuzzing')
   endif
 endif
 
+add_global_arguments(qemu_common_flags, native: false, language: all_languages)
+add_global_link_arguments(qemu_ldflags, native: false, language: all_languages)
+
 # Check that the C++ compiler exists and works with the C compiler.
 link_language = 'c'
 linker = cc
@@ -276,16 +288,9 @@ if 'cpp' in all_languages
   endif
 endif
 
-# Exclude --warn-common with TSan to suppress warnings from the TSan libraries.
-if targetos != 'sunos' and not config_host.has_key('CONFIG_TSAN')
-  qemu_ldflags += linker.get_supported_link_arguments('-Wl,--warn-common')
-endif
-
-add_global_link_arguments(qemu_ldflags, native: false, language: all_languages)
-
-add_global_arguments(qemu_cflags, native: false, language: 'c')
-add_global_arguments(qemu_cxxflags, native: false, language: 'cpp')
-add_global_arguments(qemu_objcflags, native: false, language: 'objc')
+add_project_arguments(qemu_cflags, native: false, language: 'c')
+add_project_arguments(qemu_cxxflags, native: false, language: 'cpp')
+add_project_arguments(qemu_objcflags, native: false, language: 'objc')
 if targetos == 'linux'
   add_project_arguments('-isystem', meson.current_source_dir() / 'linux-headers',
                         '-isystem', 'linux-headers',
@@ -3778,12 +3783,12 @@ link_args = get_option(link_language + '_link_args')
 if link_args.length() > 0
   summary_info += {'LDFLAGS':         ' '.join(link_args)}
 endif
-summary_info += {'QEMU_CFLAGS':       ' '.join(qemu_cflags)}
+summary_info += {'QEMU_CFLAGS':       ' '.join(qemu_common_flags + qemu_cflags)}
 if 'cpp' in all_languages
-  summary_info += {'QEMU_CXXFLAGS':     ' '.join(qemu_cxxflags)}
+  summary_info += {'QEMU_CXXFLAGS':     ' '.join(qemu_common_flags + qemu_cxxflags)}
 endif
 if 'objc' in all_languages
-  summary_info += {'QEMU_OBJCFLAGS':    ' '.join(qemu_objcflags)}
+  summary_info += {'QEMU_OBJCFLAGS':    ' '.join(qemu_common_flags + qemu_objcflags)}
 endif
 summary_info += {'QEMU_LDFLAGS':      ' '.join(qemu_ldflags)}
 summary_info += {'profiler':          get_option('profiler')}
-- 
2.38.1


