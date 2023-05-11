Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE476FEF5E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:53:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2x1-0000b0-MG; Thu, 11 May 2023 05:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2ww-0000VA-Pt
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2wu-0006jX-LL
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9TfR6aQ9CkPOJAw96wHOkiISY5IQVFJNrbTyaj5LRI=;
 b=fAXpErLa/D2sMb70c9hNC2YPEyg7mw38ssgyZuPT+FSy4Ohexu8GApDg90J0f0XlClhjtH
 K/fLZmO6jIigKP+hVLgAZTNwpjB9l8SjKuuC6vkQK5tt2GE1V50cHtc3JDsvduBxvTKZOE
 3BZy4Y8wkwPp123A2DH2VxEEW1ZwIYQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-avXaMiNtMlCC0l_yOqYVcw-1; Thu, 11 May 2023 05:50:58 -0400
X-MC-Unique: avXaMiNtMlCC0l_yOqYVcw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-969f12b2818so428226266b.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798657; x=1686390657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O9TfR6aQ9CkPOJAw96wHOkiISY5IQVFJNrbTyaj5LRI=;
 b=RfQ6jUrqE8bfeHbFqsOj8tTzh/u7Veaw7phwltYwvouOhPgoR8HM2jcf+86qNK1jGG
 tIYiT/3Y+BknWgXNxkYidxYO8cBNx6uIGi3BMbtigm0mefBkYASHzvCxCyg9jSXVcthu
 bdwHbNO0e08C6YId7l6aeHTQyi2WOd8eR7Uz8dCY3DpSpYgc8ZnxBuHHWFHj+B3sF3XR
 40FdSadu8epP75I61tnTER3ULgMfe5TP6MlTSoI5h2yJMQbuaeB3Rc1vww/WT31CfW+6
 CZZAY4AGJHn42oaWIYybhl2+NKfeIYlkqSBZSPXCtg68509fxPP9j2bgZ+5M6eRTbMiu
 EvJA==
X-Gm-Message-State: AC+VfDyevhMdGDDO4YetGumqhs1cnb5zMhVawkNmBZEiD/gS+Z0CkZ3u
 lGW/vhyuDslECfcVEuYb1c1JvAKpkHKa1j0reK/3rE35WQGLcWm6T7SXGAhvLhS/C23x59MtcnI
 D65OFcEJH3TF46fazi9ON/z+QMz1+S4o38UDX5OdTNNXHO53KaWne/H1jWSHWrBaG07yKtZrr4V
 E=
X-Received: by 2002:a17:907:9712:b0:967:b02c:b06a with SMTP id
 jg18-20020a170907971200b00967b02cb06amr13728244ejc.27.1683798656878; 
 Thu, 11 May 2023 02:50:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63nL28XA0t3MKl/uiVNeA9phr8XiT2LdhS6ItqrJRAlA4ODc32NttJ3dPpOg35d+el39mU3Q==
X-Received: by 2002:a17:907:9712:b0:967:b02c:b06a with SMTP id
 jg18-20020a170907971200b00967b02cb06amr13728227ejc.27.1683798656477; 
 Thu, 11 May 2023 02:50:56 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 ku11-20020a170907788b00b0094f5179540fsm3701320ejc.83.2023.05.11.02.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 14/24] build: move stack protector flag selection to meson
Date: Thu, 11 May 2023 11:50:11 +0200
Message-Id: <20230511095021.1397802-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511095021.1397802-1-pbonzini@redhat.com>
References: <20230511095021.1397802-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 44 ++---------------------------------
 meson.build                   | 28 +++++++++++++++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 4 files changed, 34 insertions(+), 43 deletions(-)

diff --git a/configure b/configure
index c264bf4cadee..ca9238e31d46 100755
--- a/configure
+++ b/configure
@@ -180,7 +180,7 @@ compile_prog() {
   local_cflags="$1"
   local_ldflags="$2"
   do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC \
-      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $QEMU_LDFLAGS $local_ldflags
+      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $local_ldflags
 }
 
 # symbolically link $1 to $2.  Portable version of "ln -sf".
@@ -226,7 +226,6 @@ static="no"
 cross_compile="no"
 cross_prefix=""
 host_cc="cc"
-stack_protector=""
 use_containers="yes"
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 gdb_arches=""
@@ -395,8 +394,6 @@ sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
-QEMU_LDFLAGS=
-
 # Flags that are needed during configure but later taken care of by Meson
 CONFIGURE_CFLAGS="-std=gnu11 -Wall"
 CONFIGURE_LDFLAGS=
@@ -824,10 +821,6 @@ for opt do
   ;;
   --disable-werror) werror="no"
   ;;
-  --enable-stack-protector) stack_protector="yes"
-  ;;
-  --disable-stack-protector) stack_protector="no"
-  ;;
   --enable-cfi)
       cfi="true";
       meson_option_add -Db_lto=true
@@ -998,7 +991,6 @@ Advanced options (experts only):
   --with-devices-ARCH=NAME override default configs/devices
   --enable-debug           enable common debug build options
   --disable-werror         disable compilation abort on warning
-  --disable-stack-protector disable compiler-provided stack protection
   --cpu=CPU                Build for host CPU [$cpu]
   --enable-plugins
                            enable plugins via shared library loading
@@ -1257,7 +1249,7 @@ EOF
     optflag="$(echo $1 | sed -e 's/^-Wno-/-W/')"
     do_objc -Werror $optflag \
       $OBJCFLAGS $EXTRA_OBJCFLAGS $CONFIGURE_OBJCFLAGS $QEMU_OBJCFLAGS \
-      -o $TMPE $TMPM $QEMU_LDFLAGS
+      -o $TMPE $TMPM
 }
 
 for flag in $gcc_flags; do
@@ -1269,37 +1261,6 @@ for flag in $gcc_flags; do
     fi
 done
 
-if test "$stack_protector" != "no"; then
-  cat > $TMPC << EOF
-int main(int argc, char *argv[])
-{
-    char arr[64], *p = arr, *c = argv[argc - 1];
-    while (*c) {
-        *p++ = *c++;
-    }
-    return 0;
-}
-EOF
-  gcc_flags="-fstack-protector-strong -fstack-protector-all"
-  sp_on=0
-  for flag in $gcc_flags; do
-    # We need to check both a compile and a link, since some compiler
-    # setups fail only on a .c->.o compile and some only at link time
-    if compile_object "-Werror $flag" &&
-       compile_prog "-Werror $flag" ""; then
-      QEMU_CFLAGS="$QEMU_CFLAGS $flag"
-      QEMU_LDFLAGS="$QEMU_LDFLAGS $flag"
-      sp_on=1
-      break
-    fi
-  done
-  if test "$stack_protector" = yes; then
-    if test $sp_on = 0; then
-      error_exit "Stack protector not supported"
-    fi
-  fi
-fi
-
 if test "$static" = "yes" ; then
   if test "$plugins" = "yes"; then
     error_exit "static and plugins are mutually incompatible"
@@ -2057,7 +2018,6 @@ echo "PKG_CONFIG=${pkg_config}" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
 echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "QEMU_OBJCFLAGS=$QEMU_OBJCFLAGS" >> $config_host_mak
-echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
 # use included Linux headers
diff --git a/meson.build b/meson.build
index 2d34ff8a61ec..4a98d7a929af 100644
--- a/meson.build
+++ b/meson.build
@@ -200,7 +200,7 @@ foreach arg : config_host['QEMU_CFLAGS'].split()
   endif
 endforeach
 qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
-qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
+qemu_ldflags = []
 
 if get_option('gprof')
   qemu_common_flags += ['-p']
@@ -211,6 +211,32 @@ if get_option('prefer_static')
   qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
 endif
 
+if not get_option('stack_protector').disabled()
+  stack_protector_probe = '''
+    int main(int argc, char *argv[])
+    {
+      char arr[64], *p = arr, *c = argv[argc - 1];
+      while (*c) {
+          *p++ = *c++;
+      }
+      return 0;
+    }'''
+  have_stack_protector = false
+  foreach arg : ['-fstack-protector-strong', '-fstack-protector-all']
+    # We need to check both a compile and a link, since some compiler
+    # setups fail only on a .c->.o compile and some only at link time
+    if cc.compiles(stack_protector_probe, args: ['-Werror', arg]) and \
+       cc.links(stack_protector_probe, args: ['-Werror', arg])
+      have_stack_protector = true
+      qemu_cflags += arg
+      qemu_ldflags += arg
+      break
+    endif
+  endforeach
+  get_option('stack_protector') \
+    .require(have_stack_protector, error_message: 'Stack protector not supported')
+endif
+
 coroutine_backend = get_option('coroutine_backend')
 ucontext_probe = '''
   #include <ucontext.h>
diff --git a/meson_options.txt b/meson_options.txt
index 9ddd500f8998..2323d1ca272d 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -91,6 +91,8 @@ option('sanitizers', type: 'boolean', value: false,
        description: 'enable default sanitizers')
 option('tsan', type: 'boolean', value: false,
        description: 'enable thread sanitizer')
+option('stack_protector', type: 'feature', value: 'auto',
+       description: 'compiler-provided stack protection')
 option('cfi', type: 'boolean', value: false,
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: false,
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 1d14390d972c..dd1c83f6f1b9 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -163,6 +163,7 @@ meson_options_help() {
   printf "%s\n" '  sparse          sparse checker'
   printf "%s\n" '  spice           Spice server support'
   printf "%s\n" '  spice-protocol  Spice protocol support'
+  printf "%s\n" '  stack-protector compiler-provided stack protection'
   printf "%s\n" '  tcg             TCG support'
   printf "%s\n" '  tools           build support utilities that come with QEMU'
   printf "%s\n" '  tpm             TPM support'
@@ -434,6 +435,8 @@ _meson_option_parse() {
     --disable-spice) printf "%s" -Dspice=disabled ;;
     --enable-spice-protocol) printf "%s" -Dspice_protocol=enabled ;;
     --disable-spice-protocol) printf "%s" -Dspice_protocol=disabled ;;
+    --enable-stack-protector) printf "%s" -Dstack_protector=enabled ;;
+    --disable-stack-protector) printf "%s" -Dstack_protector=disabled ;;
     --enable-strip) printf "%s" -Dstrip=true ;;
     --disable-strip) printf "%s" -Dstrip=false ;;
     --sysconfdir=*) quote_sh "-Dsysconfdir=$2" ;;
-- 
2.40.1


