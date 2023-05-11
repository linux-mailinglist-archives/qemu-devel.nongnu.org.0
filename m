Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264426FEF3B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:51:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2x3-0000iH-Np; Thu, 11 May 2023 05:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x0-0000Z7-O8
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wx-0006k8-5X
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZ+2LujaG2D42uSiK5itxI9CJY/3DaZZRSoKksgyuP0=;
 b=ONS5syzclO6+JiZmGMj0ctQsQnHfDBwq+AVyb/vlru787jZWxt16TFIlU6cebjtGDTa3/j
 5OCLvpiobshA7luA60NXXwvfYYeIqxxnasfPpS5rmdrAmJCebSobECN0mMvUj3rvXGtlNz
 JZ7HlBs55LGWWIZxNCcGbXJdA1SeaoE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-gL8qrzOtO5uxpVsuxTHFQg-1; Thu, 11 May 2023 05:51:00 -0400
X-MC-Unique: gL8qrzOtO5uxpVsuxTHFQg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a341ee4fcso1057563266b.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798658; x=1686390658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lZ+2LujaG2D42uSiK5itxI9CJY/3DaZZRSoKksgyuP0=;
 b=fMuVARRItpcGP6OkjLWhIl46SYtmzlhU7sseWFcZsAyd7BuqDIJvX91vHdevmF6gg4
 Uy5V9/i/9NVDYdxNcFx07YrajNy0Ppe7AhUGUzvcddNHrUR+yg18QMrW88ytnK/hLg5h
 4mENCYLIN806Q3h4jcW0ryucaeJKNAkebNUBVW9utAJBKZyFQx2QgoI/lzHSwgHchrOV
 u5ruUnvY3jCnyUs2H3G+xDBctXldlKo+2jXypPslLEiv9WVxZIkqs3uzhkCTXa15reKE
 XaQd1LtjWB5BwwwiIC63VHy35nAhTy9KY6f52Ra4PsqUsztIVZvtah99DLKX6XV2uUix
 Uzvg==
X-Gm-Message-State: AC+VfDym44hOxHO+2T9nE9WXcZ2MeYETOfq4Lp1NCLs0lCBM9qAVync5
 yjHsuiJIzEuP2EykPUknqU4RnDgM8Yx1jfxYnB9dbQOBqpmnXvh11gw7/o804z0++4m9U4j6il1
 iLZDUWkVomG5BlB20tfacLbeljqtyLJBICR2q1dPpbfe7Wgg1NCdj0anMu0ExXXNxAVKwgjEVxt
 g=
X-Received: by 2002:a17:907:d01:b0:965:ffda:b9d2 with SMTP id
 gn1-20020a1709070d0100b00965ffdab9d2mr21677696ejc.11.1683798658575; 
 Thu, 11 May 2023 02:50:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6BQNzglNpJc2tsoUL7RQjpHVLmmAisJWRBiuOjwpXtSXXNeWUDYLHS1eam5y75P+cqNuwlUQ==
X-Received: by 2002:a17:907:d01:b0:965:ffda:b9d2 with SMTP id
 gn1-20020a1709070d0100b00965ffdab9d2mr21677682ejc.11.1683798658256; 
 Thu, 11 May 2023 02:50:58 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 gx1-20020a1709068a4100b00965a0f30fbfsm3764007ejc.186.2023.05.11.02.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 15/24] build: move warning flag selection to meson
Date: Thu, 11 May 2023 11:50:12 +0200
Message-Id: <20230511095021.1397802-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Meson already knows to test with the positive form of the flag, which
simplifies the test.  Warnings are now tested explicitly for the C++
compiler, instead of hardcoding those that are only available for
the C language.

At this point all compiler flags in QEMU_CFLAGS are global and only
depend on the OS.  No feature tests are performed in configure.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                | 86 ----------------------------------------
 contrib/plugins/Makefile |  3 +-
 meson.build              | 70 ++++++++++++++++++++++----------
 3 files changed, 49 insertions(+), 110 deletions(-)

diff --git a/configure b/configure
index ca9238e31d46..10a9025beaf8 100755
--- a/configure
+++ b/configure
@@ -79,7 +79,6 @@ fi
 TMPB="qemu-conf"
 TMPC="${TMPDIR1}/${TMPB}.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
-TMPM="${TMPDIR1}/${TMPB}.m"
 TMPE="${TMPDIR1}/${TMPB}.exe"
 
 rm -f config.log
@@ -162,15 +161,6 @@ do_cc() {
     do_compiler_werror "$cc" $CPU_CFLAGS "$@"
 }
 
-do_objc() {
-    do_compiler_werror "$objcc" $CPU_CFLAGS "$@"
-}
-
-# Append $2 to the variable named $1, with space separation
-add_to() {
-    eval $1=\${$1:+\"\$$1 \"}\$2
-}
-
 compile_object() {
   local_cflags="$1"
   do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
@@ -1186,81 +1176,6 @@ if ! compile_prog "" "" ; then
     error_exit "You need at least GCC v7.4 or Clang v10.0 (or XCode Clang v12.0)"
 fi
 
-# Accumulate -Wfoo and -Wno-bar separately.
-# We will list all of the enable flags first, and the disable flags second.
-# Note that we do not add -Werror, because that would enable it for all
-# configure tests. If a configure test failed due to -Werror this would
-# just silently disable some features, so it's too error prone.
-
-warn_flags=
-add_to warn_flags -Wundef
-add_to warn_flags -Wwrite-strings
-add_to warn_flags -Wmissing-prototypes
-add_to warn_flags -Wstrict-prototypes
-add_to warn_flags -Wredundant-decls
-add_to warn_flags -Wold-style-declaration
-add_to warn_flags -Wold-style-definition
-add_to warn_flags -Wtype-limits
-add_to warn_flags -Wformat-security
-add_to warn_flags -Wformat-y2k
-add_to warn_flags -Winit-self
-add_to warn_flags -Wignored-qualifiers
-add_to warn_flags -Wempty-body
-add_to warn_flags -Wnested-externs
-add_to warn_flags -Wendif-labels
-add_to warn_flags -Wexpansion-to-defined
-add_to warn_flags -Wimplicit-fallthrough=2
-add_to warn_flags -Wmissing-format-attribute
-
-if test "$targetos" != "darwin"; then
-    add_to warn_flags -Wthread-safety
-fi
-
-nowarn_flags=
-add_to nowarn_flags -Wno-initializer-overrides
-add_to nowarn_flags -Wno-missing-include-dirs
-add_to nowarn_flags -Wno-shift-negative-value
-add_to nowarn_flags -Wno-string-plus-int
-add_to nowarn_flags -Wno-typedef-redefinition
-add_to nowarn_flags -Wno-tautological-type-limit-compare
-add_to nowarn_flags -Wno-psabi
-add_to nowarn_flags -Wno-gnu-variable-sized-type-not-at-end
-
-gcc_flags="$warn_flags $nowarn_flags"
-
-cc_has_warning_flag() {
-    write_c_skeleton;
-
-    # Use the positive sense of the flag when testing for -Wno-wombat
-    # support (gcc will happily accept the -Wno- form of unknown
-    # warning options).
-    optflag="$(echo $1 | sed -e 's/^-Wno-/-W/')"
-    compile_prog "-Werror $optflag" ""
-}
-
-objcc_has_warning_flag() {
-    cat > $TMPM <<EOF
-int main(void) { return 0; }
-EOF
-
-    # Use the positive sense of the flag when testing for -Wno-wombat
-    # support (gcc will happily accept the -Wno- form of unknown
-    # warning options).
-    optflag="$(echo $1 | sed -e 's/^-Wno-/-W/')"
-    do_objc -Werror $optflag \
-      $OBJCFLAGS $EXTRA_OBJCFLAGS $CONFIGURE_OBJCFLAGS $QEMU_OBJCFLAGS \
-      -o $TMPE $TMPM
-}
-
-for flag in $gcc_flags; do
-    if cc_has_warning_flag $flag ; then
-        QEMU_CFLAGS="$QEMU_CFLAGS $flag"
-    fi
-    if objcc_has_warning_flag $flag ; then
-        QEMU_OBJCFLAGS="$QEMU_OBJCFLAGS $flag"
-    fi
-done
-
 if test "$static" = "yes" ; then
   if test "$plugins" = "yes"; then
     error_exit "static and plugins are mutually incompatible"
@@ -2017,7 +1932,6 @@ echo "NINJA=$ninja" >> $config_host_mak
 echo "PKG_CONFIG=${pkg_config}" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
-echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
 # use included Linux headers
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 8a316cd76f2f..b2b9db9f51af 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -27,8 +27,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 # The main QEMU uses Glib extensively so it's perfectly fine to use it
 # in plugins (which many example do).
 CFLAGS := $(shell $(PKG_CONFIG) --cflags glib-2.0)
-CFLAGS += -fPIC -Wall $(filter -W%, $(QEMU_CFLAGS))
-CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
+CFLAGS += -fPIC -Wall
 CFLAGS += $(if $(CONFIG_DEBUG_TCG), -ggdb -O0)
 CFLAGS += -I$(SRC_PATH)/include/qemu
 
diff --git a/meson.build b/meson.build
index 4a98d7a929af..00566ac26d3c 100644
--- a/meson.build
+++ b/meson.build
@@ -190,16 +190,8 @@ endif
 # Compiler flags #
 ##################
 
-qemu_common_flags = []
+qemu_common_flags = config_host['QEMU_CFLAGS'].split()
 qemu_cflags = []
-foreach arg : config_host['QEMU_CFLAGS'].split()
-  if arg.startswith('-W')
-    qemu_cflags += arg
-  else
-    qemu_common_flags += arg
-  endif
-endforeach
-qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
 qemu_ldflags = []
 
 if get_option('gprof')
@@ -369,20 +361,47 @@ endif
 add_global_arguments(qemu_common_flags, native: false, language: all_languages)
 add_global_link_arguments(qemu_ldflags, native: false, language: all_languages)
 
+# Collect warnings that we want to enable
+
+warn_flags = [
+  '-Wundef',
+  '-Wwrite-strings',
+  '-Wmissing-prototypes',
+  '-Wstrict-prototypes',
+  '-Wredundant-decls',
+  '-Wold-style-declaration',
+  '-Wold-style-definition',
+  '-Wtype-limits',
+  '-Wformat-security',
+  '-Wformat-y2k',
+  '-Winit-self',
+  '-Wignored-qualifiers',
+  '-Wempty-body',
+  '-Wnested-externs',
+  '-Wendif-labels',
+  '-Wexpansion-to-defined',
+  '-Wimplicit-fallthrough=2',
+  '-Wmissing-format-attribute',
+  '-Wno-initializer-overrides',
+  '-Wno-missing-include-dirs',
+  '-Wno-shift-negative-value',
+  '-Wno-string-plus-int',
+  '-Wno-typedef-redefinition',
+  '-Wno-tautological-type-limit-compare',
+  '-Wno-psabi',
+  '-Wno-gnu-variable-sized-type-not-at-end',
+]
+
+if targetos != 'darwin'
+  warn_flags += ['-Wthread-safety']
+endif
+
 # Check that the C++ compiler exists and works with the C compiler.
 link_language = 'c'
 linker = cc
 qemu_cxxflags = []
 if 'cpp' in all_languages
-  add_global_arguments(['-D__STDC_LIMIT_MACROS', '-D__STDC_CONSTANT_MACROS', '-D__STDC_FORMAT_MACROS'],
-                       native: false, language: 'cpp')
-  foreach k: qemu_cflags
-    if k not in ['-Wstrict-prototypes', '-Wmissing-prototypes', '-Wnested-externs',
-                 '-Wold-style-declaration', '-Wold-style-definition', '-Wredundant-decls']
-      qemu_cxxflags += [k]
-    endif
-  endforeach
-
+  qemu_cxxflags = ['-D__STDC_LIMIT_MACROS', '-D__STDC_CONSTANT_MACROS', '-D__STDC_FORMAT_MACROS'] + qemu_cflags
   if cxx.links(files('scripts/main.c'), args: qemu_cflags)
     link_language = 'cpp'
     linker = cxx
@@ -402,9 +421,16 @@ if get_option('optimization') != '0' and targetos == 'linux'
   endif
 endif
 
-add_project_arguments(qemu_cflags, native: false, language: 'c')
-add_project_arguments(qemu_cxxflags, native: false, language: 'cpp')
-add_project_arguments(qemu_objcflags, native: false, language: 'objc')
+add_project_arguments(qemu_cflags, native: false, language: 'objc')
+add_project_arguments(cc.get_supported_arguments(warn_flags), native: false, language: 'c')
+if 'cpp' in all_languages
+  add_project_arguments(qemu_cxxflags, native: false, language: 'cpp')
+  add_project_arguments(cxx.get_supported_arguments(warn_flags), native: false, language: 'cpp')
+endif
+if 'objc' in all_languages
+  # Note sanitizer flags are not applied to Objective-C sources!
+  add_project_arguments(objc.get_supported_arguments(warn_flags), native: false, language: 'objc')
+endif
 if targetos == 'linux'
   add_project_arguments('-isystem', meson.current_source_dir() / 'linux-headers',
                         '-isystem', 'linux-headers',
@@ -3983,7 +4009,7 @@ if 'cpp' in all_languages
   summary_info += {'QEMU_CXXFLAGS':     ' '.join(qemu_common_flags + qemu_cxxflags)}
 endif
 if 'objc' in all_languages
-  summary_info += {'QEMU_OBJCFLAGS':    ' '.join(qemu_common_flags + qemu_objcflags)}
+  summary_info += {'QEMU_OBJCFLAGS':    ' '.join(qemu_common_flags)}
 endif
 summary_info += {'QEMU_LDFLAGS':      ' '.join(qemu_ldflags)}
 summary_info += {'profiler':          get_option('profiler')}
-- 
2.40.1


