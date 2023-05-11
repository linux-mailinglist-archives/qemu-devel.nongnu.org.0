Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2596FEF42
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:52:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2xF-0000zK-DZ; Thu, 11 May 2023 05:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x2-0000j5-G5
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1px2x0-0006kL-E5
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683798664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CeKvvM1jIb2vxrKSY2nYgD30BwzZrIEtxd7XjUxzTiI=;
 b=SIzB9YMvgsTHxxntFbaPftRphcf60vhWcXdfaYOq0IBEjUzd1aBLTob9f1kBWWTYrneBn6
 QBIifp5yWcovOsX3NS8y9gTSrwYVkkPi+1ojlNbxyrHF2Koxy9r35bk7ZFstvqqdRSIMKq
 muHsbeeZhX9KZdStmyBeOQy+lD6hBd0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-cVZFkB1VOniKV5u9NxxAyw-1; Thu, 11 May 2023 05:51:02 -0400
X-MC-Unique: cVZFkB1VOniKV5u9NxxAyw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-965c6f849b9so917739666b.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683798660; x=1686390660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CeKvvM1jIb2vxrKSY2nYgD30BwzZrIEtxd7XjUxzTiI=;
 b=hlv8/oTcraZhfkA738jsErw7Mn+Y853nHnvkzIU3ctW3tWPSG4dYh5xR+pizBkvsV/
 LjKe9Ug97Xc5xqKf4RU2zo/14xgvXAqO7Ce9ua3twBPovi9PQbGW70BOk7mwq2qdaMxs
 yzoyt0KirdVW8lnU90TislJ/TbTLJZeSkaMbm8B2IHkur5Db2tnbfiMqtIwPvJ7REyFK
 NlAB5fZ5h8Z1/CIhi1ze4SlclLiN9xo/91rM/fJrdZGlS/0hllLSJkCMPrQlV63Au6RW
 bSWQdSesToUL3eeoQX5pg9+dXbtRnW4fWmBTZugK5k1WkPsyTXxb5qZJ5WC259eJmxHj
 iDTg==
X-Gm-Message-State: AC+VfDxr+GPPfHdrY6MjhFHdYZqjPGy7PMYX5cNhlhFctgzDiaKYKY1o
 cQMhffLodtuk+b26/PyHo7sBA9WAYx/sgqPKOlQowjXbFFoELWUErJTz9zYU8EjN0u1EnYJLZWs
 g9Bwvso6jFPEGUYhH9/qjtMhyndQX3M5dUMNgdxhk4OAUn5Mjr1cc8FbV08jh9cRWOQ9Pf9KuIJ
 U=
X-Received: by 2002:a17:907:804:b0:94f:adb2:171f with SMTP id
 wv4-20020a170907080400b0094fadb2171fmr16631975ejb.28.1683798660575; 
 Thu, 11 May 2023 02:51:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6PpVUDt+cegdHpqeusmI/jpjhdU8GTr+6Xq++R7V7p9DmWeuutcKw9LMIv6NL4AQHxU/8fhw==
X-Received: by 2002:a17:907:804:b0:94f:adb2:171f with SMTP id
 wv4-20020a170907080400b0094fadb2171fmr16631955ejb.28.1683798660124; 
 Thu, 11 May 2023 02:51:00 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 nr1-20020a1709068b8100b00959b3c30f2csm3768559ejc.222.2023.05.11.02.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:50:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 16/24] build: move remaining compiler flag tests to meson
Date: Thu, 11 May 2023 11:50:13 +0200
Message-Id: <20230511095021.1397802-17-pbonzini@redhat.com>
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

Remove the only remaining uses of QEMU_CFLAGS.  Now that no
feature tests are done in configure, it is possible to remove
CONFIGURE_CFLAGS and CONFIGURE_LDFLAGS as well.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 79 ++++++++---------------------------------------------
 meson.build | 49 ++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 69 deletions(-)

diff --git a/configure b/configure
index 10a9025beaf8..a7c3fcc26609 100755
--- a/configure
+++ b/configure
@@ -163,14 +163,14 @@ do_cc() {
 
 compile_object() {
   local_cflags="$1"
-  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
+  do_cc $CFLAGS $EXTRA_CFLAGS $local_cflags -c -o $TMPO $TMPC
 }
 
 compile_prog() {
   local_cflags="$1"
   local_ldflags="$2"
-  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC \
-      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $local_ldflags
+  do_cc $CFLAGS $EXTRA_CFLAGS $local_cflags -o $TMPE $TMPC \
+      $LDFLAGS $EXTRA_LDFLAGS $local_ldflags
 }
 
 # symbolically link $1 to $2.  Portable version of "ln -sf".
@@ -376,19 +376,6 @@ windmc="${WINDMC-${cross_prefix}windmc}"
 pkg_config="${PKG_CONFIG-${cross_prefix}pkg-config}"
 sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 
-# default flags for all hosts
-# We use -fwrapv to tell the compiler that we require a C dialect where
-# left shift of signed integers is well defined and has the expected
-# 2s-complement style results. (Both clang and gcc agree that it
-# provides these semantics.)
-QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv"
-QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
-
-# Flags that are needed during configure but later taken care of by Meson
-CONFIGURE_CFLAGS="-std=gnu11 -Wall"
-CONFIGURE_LDFLAGS=
-
-
 check_define() {
 cat > $TMPC <<EOF
 #if !defined($1)
@@ -467,21 +454,13 @@ openbsd)
 darwin)
   bsd="yes"
   darwin="yes"
-  # Disable attempts to use ObjectiveC features in os/object.h since they
-  # won't work when we're compiling with gcc as a C compiler.
-  QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
 ;;
 sunos)
   solaris="yes"
   make="${MAKE-gmake}"
-# needed for CMSG_ macros in sys/socket.h
-  QEMU_CFLAGS="-D_XOPEN_SOURCE=600 $QEMU_CFLAGS"
-# needed for TIOCWIN* defines in termios.h
-  QEMU_CFLAGS="-D__EXTENSIONS__ $QEMU_CFLAGS"
 ;;
 haiku)
   pie="no"
-  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU_CFLAGS"
 ;;
 linux)
   linux="yes"
@@ -634,8 +613,6 @@ done
 
 if test "$mingw32" = "yes" ; then
   EXESUF=".exe"
-  # MinGW needs -mthreads for TLS and macro _MT.
-  CONFIGURE_CFLAGS="-mthreads $CONFIGURE_CFLAGS"
   prefix="/qemu"
   bindir=""
   qemu_suffix=""
@@ -1196,59 +1173,26 @@ static THREAD int tls_var;
 int main(void) { return tls_var; }
 EOF
 
-# Meson currently only handles pie as a boolean for now so if we have
-# explicitly disabled PIE we need to extend our cflags because it wont.
 if test "$static" = "yes"; then
   if test "$pie" != "no" && compile_prog "-Werror -fPIE -DPIE" "-static-pie"; then
-    CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
     pie="yes"
   elif test "$pie" = "yes"; then
     error_exit "-static-pie not available due to missing toolchain support"
   else
     pie="no"
-    QEMU_CFLAGS="-fno-pie $QEMU_CFLAGS"
   fi
-elif test "$pie" = "no"; then
-  if compile_prog "-Werror -fno-pie" "-no-pie"; then
-    CONFIGURE_CFLAGS="-fno-pie $CONFIGURE_CFLAGS"
-    CONFIGURE_LDFLAGS="-no-pie $CONFIGURE_LDFLAGS"
-    QEMU_CFLAGS="-fno-pie -no-pie $QEMU_CFLAGS"
+elif test "$pie" != "no"; then
+  if compile_prog "-Werror -fPIE -DPIE" "-pie"; then
+    pie="yes"
+  elif test "$pie" = "yes"; then
+    error_exit "PIE not available due to missing toolchain support"
+  else
+    echo "Disabling PIE due to missing toolchain support"
+    pie="no"
   fi
-elif compile_prog "-Werror -fPIE -DPIE" "-pie"; then
-  CONFIGURE_CFLAGS="-fPIE -DPIE $CONFIGURE_CFLAGS"
-  CONFIGURE_LDFLAGS="-pie $CONFIGURE_LDFLAGS"
-  pie="yes"
-elif test "$pie" = "yes"; then
-  error_exit "PIE not available due to missing toolchain support"
-else
-  echo "Disabling PIE due to missing toolchain support"
-  pie="no"
 fi
 
 ##########################################
-# __sync_fetch_and_and requires at least -march=i486. Many toolchains
-# use i686 as default anyway, but for those that don't, an explicit
-# specification is necessary
-
-if test "$cpu" = "i386"; then
-  cat > $TMPC << EOF
-static int sfaa(int *ptr)
-{
-  return __sync_fetch_and_and(ptr, 0);
-}
-
-int main(void)
-{
-  int val = 42;
-  val = __sync_val_compare_and_swap(&val, 0, 1);
-  sfaa(&val);
-  return val;
-}
-EOF
-  if ! compile_prog "" "" ; then
-    QEMU_CFLAGS="-march=i486 $QEMU_CFLAGS"
-  fi
-fi
 
 if test -z "${target_list+xxx}" ; then
     default_targets=yes
@@ -1931,7 +1875,6 @@ echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "PKG_CONFIG=${pkg_config}" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
-echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
 # use included Linux headers
diff --git a/meson.build b/meson.build
index 00566ac26d3c..0c5d2cf634fa 100644
--- a/meson.build
+++ b/meson.build
@@ -190,10 +190,50 @@ endif
 # Compiler flags #
 ##################
 
-qemu_common_flags = config_host['QEMU_CFLAGS'].split()
+# default flags for all hosts
+# We use -fwrapv to tell the compiler that we require a C dialect where
+# left shift of signed integers is well defined and has the expected
+# 2s-complement style results. (Both clang and gcc agree that it
+# provides these semantics.)
+
+qemu_common_flags = [
+  '-D_GNU_SOURCE', '-D_FILE_OFFSET_BITS=64', '-D_LARGEFILE_SOURCE',
+  '-fno-strict-aliasing', '-fno-common', '-fwrapv' ]
 qemu_cflags = []
 qemu_ldflags = []
 
+if targetos == 'darwin'
+  # Disable attempts to use ObjectiveC features in os/object.h since they
+  # won't work when we're compiling with gcc as a C compiler.
+  qemu_common_flags += '-DOS_OBJECT_USE_OBJC=0'
+elif targetos == 'solaris'
+  # needed for CMSG_ macros in sys/socket.h
+  qemu_common_flags += '-D_XOPEN_SOURCE=600'
+  # needed for TIOCWIN* defines in termios.h
+  qemu_common_flags += '-D__EXTENSIONS__'
+elif targetos == 'haiku'
+  qemu_common_flags += ['-DB_USE_POSITIVE_POSIX_ERRORS', '-D_BSD_SOURCE', '-fPIC']
+endif
+
+# __sync_fetch_and_and requires at least -march=i486. Many toolchains
+# use i686 as default anyway, but for those that don't, an explicit
+# specification is necessary
+if host_arch == 'i386' and not cc.links('''
+  static int sfaa(int *ptr)
+  {
+    return __sync_fetch_and_and(ptr, 0);
+  }
+
+  int main(void)
+  {
+    int val = 42;
+    val = __sync_val_compare_and_swap(&val, 0, 1);
+    sfaa(&val);
+    return val;
+  }''')
+  qemu_common_flags = ['-march=i486'] + qemu_common_flags
+endif
+
 if get_option('gprof')
   qemu_common_flags += ['-p']
   qemu_ldflags += ['-p']
@@ -203,6 +243,13 @@ if get_option('prefer_static')
   qemu_ldflags += get_option('b_pie') ? '-static-pie' : '-static'
 endif
 
+# Meson currently only handles pie as a boolean for now, so if the user
+# has explicitly disabled PIE we need to extend our cflags.
+if not get_option('b_pie')
+  qemu_cflags += cc.get_supported_arguments('-fno-pie')
+  qemu_ldflags += cc.get_supported_link_arguments('-no-pie')
+endif
+
 if not get_option('stack_protector').disabled()
   stack_protector_probe = '''
     int main(int argc, char *argv[])
-- 
2.40.1


