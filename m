Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBD96481C8
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:31:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bXG-0005wm-JQ; Fri, 09 Dec 2022 06:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bW1-0004ca-G6
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bVq-0001ZN-0w
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hi9wAKVzCZ1hT1TsF3V5eUrMQ7ppn0EvxBQacimafSo=;
 b=EYOCI+0oCmuuqGMqvNPCOsI7OM+2KGw0Ex7SrKqHnJov0+pIKItbuEw0Gon3jGoLECUYJg
 oEZ4MynlqnulKoQ15OimB3Ck5DXkwwtxJR8VX47EKZpeqGyT3MHQUitrlro9ORjZAROYYz
 AKzVjKZ+2tEyJbAuUF/it9gX6oC8UEc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-kXKQrkhkMUiTKBIAY7sH5Q-1; Fri, 09 Dec 2022 06:25:42 -0500
X-MC-Unique: kXKQrkhkMUiTKBIAY7sH5Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 ds15-20020a170907724f00b007c0abebc958so2892867ejc.2
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hi9wAKVzCZ1hT1TsF3V5eUrMQ7ppn0EvxBQacimafSo=;
 b=nnbxcsP06hsuHKqj9yKrH5leTNj4mouD5MTyYWksqrmIUw/HAxN8CCp4MMUE5xolhr
 pZBDMcNLnq5Z4h1/ZkI53Fv0AoVPerqvpEZHC9p3JxQJSNjm2M5g6ciFALraQKOCz4rh
 deA0l3JJbIk9w6pHSq8YWNrPDURuwDy82FjNB1gW4jnIXYt+Jmk1RGRBxMLnAgGS9z7T
 SMQvPf+br1iP9OVhqaOXZoGl12nExVNK84loOawuHgaEwhPzC0dH4HRCDh6+QQOaWPL4
 kwchYoFYdb0891SEMDh9HYhPPTZ3+ppU1ha59j78eS9R5eySy88LosuMyLzku+V/+B+Y
 9LCg==
X-Gm-Message-State: ANoB5pkfmajsA4yXqJS6uVuCI0dncu8vALpGvVTACsl/fOSTnUSkSqrS
 ARTmlIztDQp3cxEY5Z1WuJ7gjgEacdM46CkqNP1gzWKh3kdhLCbDFTTR3KTktLz/qf98CfhcqW1
 9dWItv1jRzt2V+unVaDCANvX+0Bfr9pUQI4eGu6qlUi0lqJo94yjg/kSBuV/gtD3aZPA=
X-Received: by 2002:a17:906:f856:b0:7c0:b0f9:e360 with SMTP id
 ks22-20020a170906f85600b007c0b0f9e360mr4512634ejb.16.1670585141299; 
 Fri, 09 Dec 2022 03:25:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4H+o29F1rU7fRcwelOoA8l+BetiuHfH9JhrPQcIDCtTKZ1v4ifg9lzPVjC9Jlmj75G3ry4ew==
X-Received: by 2002:a17:906:f856:b0:7c0:b0f9:e360 with SMTP id
 ks22-20020a170906f85600b007c0b0f9e360mr4512613ejb.16.1670585140755; 
 Fri, 09 Dec 2022 03:25:40 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a170906292900b007c0aefd9339sm451176ejd.175.2022.12.09.03.25.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:25:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/30] build: move remaining compiler flag tests to meson
Date: Fri,  9 Dec 2022 12:24:05 +0100
Message-Id: <20221209112409.184703-27-pbonzini@redhat.com>
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

Remove the only remaining uses of QEMU_CFLAGS.  Now that no
feature tests are done in configure, it is possible to remove
CONFIGURE_CFLAGS and CONFIGURE_LDFLAGS as well.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 79 ++++++++---------------------------------------------
 meson.build | 49 ++++++++++++++++++++++++++++++++-
 2 files changed, 59 insertions(+), 69 deletions(-)

diff --git a/configure b/configure
index 6df61f4337e4..d5491fc3b986 100755
--- a/configure
+++ b/configure
@@ -158,14 +158,14 @@ do_cc() {
 
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
@@ -351,19 +351,6 @@ windres="${WINDRES-${cross_prefix}windres}"
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
@@ -442,21 +429,13 @@ openbsd)
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
@@ -589,8 +568,6 @@ fi
 
 if test "$mingw32" = "yes" ; then
   EXESUF=".exe"
-  # MinGW needs -mthreads for TLS and macro _MT.
-  CONFIGURE_CFLAGS="-mthreads $CONFIGURE_CFLAGS"
   prefix="/qemu"
   bindir=""
   qemu_suffix=""
@@ -1102,59 +1079,26 @@ static THREAD int tls_var;
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
-    QEMU_CFLAGS="-fno-pie -no-pie $QEMU_CFLAGS"
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
@@ -1834,7 +1778,6 @@ echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "PKG_CONFIG=${pkg_config_exe}" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
-echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
 # use included Linux headers
diff --git a/meson.build b/meson.build
index 4ec8104b73a3..01c6ac0045bc 100644
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
2.38.1


