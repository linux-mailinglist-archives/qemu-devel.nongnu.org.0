Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF283B19CB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:21:59 +0200 (CEST)
Received: from localhost ([::1]:40560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1tG-0007kj-Fl
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m6-0003vD-85
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:34 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m3-00020C-5X
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:33 -0400
Received: by mail-ej1-x62f.google.com with SMTP id hq39so3679778ejc.5
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GLj4HwwMombY8CaOsQjh5wwXRLnVD6SOn+E3r9+SCmQ=;
 b=o6It/hu7gTbQpBF6FQPcRg2iV/gopfAIkBu2M6MBTKGXLjypdDiL4P9cf/CcOAX1/p
 yhpgq4XTQ+Dy6mOAntEacf/oaUlZ7DYYdUZKZy+SumyPi92KG9umAN9CT9xaOAUd4pCZ
 CuPiAMJXV0VTPepA+IdEuJBGTAeH2uuIg92hQic0ECXHJKMdchgEuTSVBQyVeeCiF/sj
 L0EoPpVp0PbwjmbQDfwbHh6roXIY4eGQu987c84nVbjH3p/hzt4zay1eyytChqAiekW3
 hRI9WvcFj2iGvUmNQjqKzXNlaEWz5GQj0wKl/dVafI93Mf+i/zjFURhMr4bSxFUbicgN
 IWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GLj4HwwMombY8CaOsQjh5wwXRLnVD6SOn+E3r9+SCmQ=;
 b=M9gJeUYQM3ZLsWjg94YfgVM2BosxEIGnBFCVXFuCZ19fOUIi6rdaUze2oO0iunjjG8
 hFbjlguoVG0/qYa0nLCv5s3Xa/mbhPGzGMRwkAA6TAEkH5Uh1iDE/hbRV1Lms7kYtfd7
 rtKEpqQlx2Tg/lvCZGS9Mmi90s8DCpCIr373vPxwq2IL/M57eS/RNrJk8Z/8o4dhKlDS
 KZR2ItK7ge3AaZMrw77vFnZqP4svV+AF+5R+VUFuqCIuDECQDlEqCZeMJImi8b0Zv8xX
 dFDzd8Eq1o6r0giqiZNNAYJXqdQEc7RXnr+A0v/44OqbuL0yVvsXc+OxtdLFxczE8vVc
 4heQ==
X-Gm-Message-State: AOAM533hsvcAW99fvktCmjjSfjY6XwqVtdKNknZR0m3MaBJZkavXAdSH
 AvWmfK5iEKxbRQ18NcTkafUT4upJfoE=
X-Google-Smtp-Source: ABdhPJwRyd1k9Qs7Qdy3YrgM1uOFGPUdUpFCG7WTe4KeyoJTTDsQ+86Yrz7ICVKxA0z4WQ37mCCj4g==
X-Received: by 2002:a17:906:1c84:: with SMTP id
 g4mr9167246ejh.99.1624450469727; 
 Wed, 23 Jun 2021 05:14:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o5sm1680778edt.44.2021.06.23.05.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:14:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] configure, meson: convert crypto detection to meson
Date: Wed, 23 Jun 2021 14:14:18 +0200
Message-Id: <20210623121424.1259496-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623121424.1259496-1-pbonzini@redhat.com>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@liaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 188 +++--------------------------------------
 crypto/meson.build     |  41 +++------
 meson.build            |  81 +++++++++++++-----
 meson_options.txt      |   6 ++
 tests/unit/meson.build |   6 +-
 5 files changed, 90 insertions(+), 232 deletions(-)

diff --git a/configure b/configure
index 00e7dd749a..897e968e02 100755
--- a/configure
+++ b/configure
@@ -404,10 +404,9 @@ seccomp="auto"
 glusterfs="auto"
 gtk="auto"
 tls_priority="NORMAL"
-gnutls="$default_feature"
-nettle="$default_feature"
-gcrypt="$default_feature"
-qemu_private_xts="yes"
+gnutls="auto"
+nettle="auto"
+gcrypt="auto"
 auth_pam="$default_feature"
 vte="$default_feature"
 virglrenderer="$default_feature"
@@ -1372,17 +1371,17 @@ for opt do
   ;;
   --tls-priority=*) tls_priority="$optarg"
   ;;
-  --disable-gnutls) gnutls="no"
+  --disable-gnutls) gnutls="disabled"
   ;;
-  --enable-gnutls) gnutls="yes"
+  --enable-gnutls) gnutls="enabled"
   ;;
-  --disable-nettle) nettle="no"
+  --disable-nettle) nettle="disabled"
   ;;
-  --enable-nettle) nettle="yes"
+  --enable-nettle) nettle="enabled"
   ;;
-  --disable-gcrypt) gcrypt="no"
+  --disable-gcrypt) gcrypt="disabled"
   ;;
-  --enable-gcrypt) gcrypt="yes"
+  --enable-gcrypt) gcrypt="enabled"
   ;;
   --disable-auth-pam) auth_pam="no"
   ;;
@@ -2800,156 +2799,6 @@ EOF
   fi
 fi
 
-##########################################
-# GNUTLS probe
-
-if test "$gnutls" != "no"; then
-    pass="no"
-    if $pkg_config --exists "gnutls >= 3.5.18"; then
-        gnutls_cflags=$($pkg_config --cflags gnutls)
-        gnutls_libs=$($pkg_config --libs gnutls)
-        # Packaging for the static libraries is not always correct.
-        # At least ubuntu 18.04 ships only shared libraries.
-        write_c_skeleton
-        if compile_prog "" "$gnutls_libs" ; then
-            pass="yes"
-        fi
-    fi
-    if test "$pass" = "no" && test "$gnutls" = "yes"; then
-	feature_not_found "gnutls" "Install gnutls devel >= 3.1.18"
-    else
-        gnutls="$pass"
-    fi
-fi
-
-
-# If user didn't give a --disable/enable-gcrypt flag,
-# then mark as disabled if user requested nettle
-# explicitly
-if test -z "$gcrypt"
-then
-    if test "$nettle" = "yes"
-    then
-        gcrypt="no"
-    fi
-fi
-
-# If user didn't give a --disable/enable-nettle flag,
-# then mark as disabled if user requested gcrypt
-# explicitly
-if test -z "$nettle"
-then
-    if test "$gcrypt" = "yes"
-    then
-        nettle="no"
-    fi
-fi
-
-has_libgcrypt() {
-    if ! has "libgcrypt-config"
-    then
-	return 1
-    fi
-
-    if test -n "$cross_prefix"
-    then
-	host=$(libgcrypt-config --host)
-	if test "$host-" != $cross_prefix
-	then
-	    return 1
-	fi
-    fi
-
-    maj=`libgcrypt-config --version | awk -F . '{print $1}'`
-    min=`libgcrypt-config --version | awk -F . '{print $2}'`
-
-    if test $maj != 1 || test $min -lt 8
-    then
-       return 1
-    fi
-
-    return 0
-}
-
-
-if test "$nettle" != "no"; then
-    pass="no"
-    if $pkg_config --exists "nettle >= 3.4"; then
-        nettle_cflags=$($pkg_config --cflags nettle)
-        nettle_libs=$($pkg_config --libs nettle)
-        # Link test to make sure the given libraries work (e.g for static).
-        write_c_skeleton
-        if compile_prog "" "$nettle_libs" ; then
-            if test -z "$gcrypt"; then
-               gcrypt="no"
-            fi
-            pass="yes"
-        fi
-    fi
-    if test "$pass" = "yes"
-    then
-        cat > $TMPC << EOF
-#include <nettle/xts.h>
-int main(void) {
-  return 0;
-}
-EOF
-        if compile_prog "$nettle_cflags" "$nettle_libs" ; then
-            qemu_private_xts=no
-        fi
-    fi
-    if test "$pass" = "no" && test "$nettle" = "yes"; then
-        feature_not_found "nettle" "Install nettle devel >= 2.7.1"
-    else
-        nettle="$pass"
-    fi
-fi
-
-if test "$gcrypt" != "no"; then
-    pass="no"
-    if has_libgcrypt; then
-        gcrypt_cflags=$(libgcrypt-config --cflags)
-        gcrypt_libs=$(libgcrypt-config --libs)
-        # Debian has removed -lgpg-error from libgcrypt-config
-        # as it "spreads unnecessary dependencies" which in
-        # turn breaks static builds...
-        if test "$static" = "yes"
-        then
-            gcrypt_libs="$gcrypt_libs -lgpg-error"
-        fi
-
-        # Link test to make sure the given libraries work (e.g for static).
-        write_c_skeleton
-        if compile_prog "" "$gcrypt_libs" ; then
-            pass="yes"
-        fi
-    fi
-    if test "$pass" = "yes"; then
-        gcrypt="yes"
-        cat > $TMPC << EOF
-#include <gcrypt.h>
-int main(void) {
-  gcry_cipher_hd_t handle;
-  gcry_cipher_open(&handle, GCRY_CIPHER_AES, GCRY_CIPHER_MODE_XTS, 0);
-  return 0;
-}
-EOF
-        if compile_prog "$gcrypt_cflags" "$gcrypt_libs" ; then
-            qemu_private_xts=no
-        fi
-    elif test "$gcrypt" = "yes"; then
-        feature_not_found "gcrypt" "Install gcrypt devel >= 1.5.0"
-    else
-        gcrypt="no"
-    fi
-fi
-
-
-if test "$gcrypt" = "yes" && test "$nettle" = "yes"
-then
-    error_exit "Only one of gcrypt & nettle can be enabled"
-fi
-
 ##########################################
 # libtasn1 - only for the TLS creds/session test suite
 
@@ -5705,24 +5554,6 @@ if test "$gdbus_codegen" != "" ; then
     echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
 fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
-if test "$gnutls" = "yes" ; then
-  echo "CONFIG_GNUTLS=y" >> $config_host_mak
-  echo "GNUTLS_CFLAGS=$gnutls_cflags" >> $config_host_mak
-  echo "GNUTLS_LIBS=$gnutls_libs" >> $config_host_mak
-fi
-if test "$gcrypt" = "yes" ; then
-  echo "CONFIG_GCRYPT=y" >> $config_host_mak
-  echo "GCRYPT_CFLAGS=$gcrypt_cflags" >> $config_host_mak
-  echo "GCRYPT_LIBS=$gcrypt_libs" >> $config_host_mak
-fi
-if test "$nettle" = "yes" ; then
-  echo "CONFIG_NETTLE=y" >> $config_host_mak
-  echo "NETTLE_CFLAGS=$nettle_cflags" >> $config_host_mak
-  echo "NETTLE_LIBS=$nettle_libs" >> $config_host_mak
-fi
-if test "$qemu_private_xts" = "yes" ; then
-  echo "CONFIG_QEMU_PRIVATE_XTS=y" >> $config_host_mak
-fi
 if test "$tasn1" = "yes" ; then
   echo "CONFIG_TASN1=y" >> $config_host_mak
 fi
@@ -6439,6 +6270,7 @@ if test "$skip_meson" = no; then
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
+        -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Dattr=$attr -Ddefault_devices=$default_devices \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
diff --git a/crypto/meson.build b/crypto/meson.build
index af7e80c6f6..7cbf1a6ba7 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -22,48 +22,31 @@ crypto_ss.add(files(
   'tlssession.c',
 ))
 
-if 'CONFIG_NETTLE' in config_host
-  crypto_ss.add(files('hash-nettle.c', 'hmac-nettle.c', 'pbkdf-nettle.c'))
-elif 'CONFIG_GCRYPT' in config_host
-  crypto_ss.add(files('hash-gcrypt.c', 'pbkdf-gcrypt.c'))
-  crypto_ss.add(files('hmac-gcrypt.c'))
+if nettle.found()
+  crypto_ss.add(nettle, files('hash-nettle.c', 'hmac-nettle.c', 'pbkdf-nettle.c'))
+elif gcrypt.found()
+  crypto_ss.add(gcrypt, files('hash-gcrypt.c', 'hmac-gcrypt.c', 'pbkdf-gcrypt.c'))
 else
   crypto_ss.add(files('hash-glib.c', 'hmac-glib.c', 'pbkdf-stub.c'))
 endif
+if xts == 'private'
+  crypto_ss.add(files('xts.c'))
+endif
 
 crypto_ss.add(when: 'CONFIG_SECRET_KEYRING', if_true: files('secret_keyring.c'))
-crypto_ss.add(when: 'CONFIG_QEMU_PRIVATE_XTS', if_true: files('xts.c'))
 crypto_ss.add(when: 'CONFIG_AF_ALG', if_true: files('afalg.c', 'cipher-afalg.c', 'hash-afalg.c'))
-crypto_ss.add(when: 'CONFIG_GNUTLS', if_true: files('tls-cipher-suites.c'))
-
-if 'CONFIG_NETTLE' in config_host
-  crypto_ss.add(nettle)
-elif 'CONFIG_GCRYPT' in config_host
-  crypto_ss.add(gcrypt)
-endif
-
-if 'CONFIG_GNUTLS' in config_host
-  crypto_ss.add(gnutls)
-endif
-
+crypto_ss.add(when: gnutls, if_true: files('tls-cipher-suites.c'))
 
 util_ss.add(files('aes.c'))
 util_ss.add(files('init.c'))
 
-if 'CONFIG_GCRYPT' in config_host
-  util_ss.add(files('random-gcrypt.c'))
-elif 'CONFIG_GNUTLS' in config_host
-  util_ss.add(files('random-gnutls.c'))
+if gcrypt.found()
+  util_ss.add(gcrypt, files('random-gcrypt.c'))
+elif gnutls.found()
+  util_ss.add(gnutls, files('random-gnutls.c'))
 elif 'CONFIG_RNG_NONE' in config_host
   util_ss.add(files('random-none.c'))
 else
   util_ss.add(files('random-platform.c'))
 endif
 
-if 'CONFIG_GCRYPT' in config_host
-  util_ss.add(gcrypt)
-endif
-
-if 'CONFIG_GNUTLS' in config_host
-  util_ss.add(gnutls)
-endif
diff --git a/meson.build b/meson.build
index 3809f51f7f..286b37aecb 100644
--- a/meson.build
+++ b/meson.build
@@ -320,21 +320,6 @@ urcubp = not_found
 if 'CONFIG_TRACE_UST' in config_host
   urcubp = declare_dependency(link_args: config_host['URCU_BP_LIBS'].split())
 endif
-gcrypt = not_found
-if 'CONFIG_GCRYPT' in config_host
-  gcrypt = declare_dependency(compile_args: config_host['GCRYPT_CFLAGS'].split(),
-                              link_args: config_host['GCRYPT_LIBS'].split())
-endif
-nettle = not_found
-if 'CONFIG_NETTLE' in config_host
-  nettle = declare_dependency(compile_args: config_host['NETTLE_CFLAGS'].split(),
-                              link_args: config_host['NETTLE_LIBS'].split())
-endif
-gnutls = not_found
-if 'CONFIG_GNUTLS' in config_host
-  gnutls = declare_dependency(compile_args: config_host['GNUTLS_CFLAGS'].split(),
-                              link_args: config_host['GNUTLS_LIBS'].split())
-endif
 pixman = not_found
 if have_system or have_tools
   pixman = dependency('pixman-1', required: have_system, version:'>=0.21.8',
@@ -829,6 +814,54 @@ if 'CONFIG_OPENGL' in config_host
                               link_args: config_host['OPENGL_LIBS'].split())
 endif
 
+gnutls = not_found
+if not get_option('gnutls').auto() or have_system
+  gnutls = dependency('gnutls', version: '>=3.5.18',
+                      method: 'pkg-config',
+                      required: get_option('gnutls'),
+                      kwargs: static_kwargs)
+endif
+
+# Nettle has priority over gcrypt
+gcrypt = not_found
+nettle = not_found
+xts = 'private'
+if get_option('nettle').enabled() and get_option('gcrypt').enabled()
+  error('Only one of gcrypt & nettle can be enabled')
+elif (not get_option('nettle').auto() or have_system) and not get_option('gcrypt').enabled()
+  nettle = dependency('nettle', version: '>=3.4',
+                      method: 'pkg-config',
+                      required: get_option('nettle'),
+                      kwargs: static_kwargs)
+  if nettle.found() and cc.has_header('nettle/xts.h', dependencies: nettle)
+    xts = 'nettle'
+  endif
+endif
+if (not get_option('gcrypt').auto() or have_system) and not nettle.found()
+  gcrypt = dependency('libgcrypt', version: '>=1.5',
+                         method: 'config-tool',
+                         required: get_option('gcrypt'),
+                         kwargs: static_kwargs)
+  if gcrypt.found() and cc.compiles('''
+    #include <gcrypt.h>
+    int main(void) {
+      gcry_cipher_hd_t handle;
+      gcry_cipher_open(&handle, GCRY_CIPHER_AES, GCRY_CIPHER_MODE_XTS, 0);
+      return 0;
+    }
+    ''', dependencies: gcrypt)
+    xts = 'gcrypt'
+  endif
+  # Debian has removed -lgpg-error from libgcrypt-config
+  # as it "spreads unnecessary dependencies" which in
+  # turn breaks static builds...
+  if gcrypt.found() and enable_static
+    gcrypt = declare_dependency(dependencies: [
+      gcrypt,
+      cc.find_library('gpg-error', required: true, kwargs: static_kwargs)])
+  endif
+endif
+
 gtk = not_found
 gtkx11 = not_found
 if not get_option('gtk').auto() or (have_system and not cocoa.found())
@@ -1165,6 +1198,10 @@ config_host_data.set('CONFIG_VIRTFS', have_virtfs)
 config_host_data.set('CONFIG_XKBCOMMON', xkbcommon.found())
 config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
+config_host_data.set('CONFIG_GNUTLS', gnutls.found())
+config_host_data.set('CONFIG_GCRYPT', gcrypt.found())
+config_host_data.set('CONFIG_NETTLE', nettle.found())
+config_host_data.set('CONFIG_QEMU_PRIVATE_XTS', xts == 'private')
 config_host_data.set('CONFIG_MALLOC_TRIM', has_malloc_trim)
 config_host_data.set('CONFIG_STATX', has_statx)
 config_host_data.set('CONFIG_ZSTD', zstd.found())
@@ -2659,16 +2696,16 @@ summary(summary_info, bool_yn: true, section: 'Block layer support')
 # Crypto
 summary_info = {}
 summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
-summary_info += {'GNUTLS support':    config_host.has_key('CONFIG_GNUTLS')}
+summary_info += {'GNUTLS support':    gnutls.found()}
 # TODO: add back version
-summary_info += {'libgcrypt':         config_host.has_key('CONFIG_GCRYPT')}
-if config_host.has_key('CONFIG_GCRYPT')
-   summary_info += {'  XTS':             not config_host.has_key('CONFIG_QEMU_PRIVATE_XTS')}
+summary_info += {'libgcrypt':         gcrypt.found()}
+if gcrypt.found()
+   summary_info += {'  XTS':             xts != 'private'}
 endif
 # TODO: add back version
-summary_info += {'nettle':            config_host.has_key('CONFIG_NETTLE')}
-if config_host.has_key('CONFIG_NETTLE')
-   summary_info += {'  XTS':             not config_host.has_key('CONFIG_QEMU_PRIVATE_XTS')}
+summary_info += {'nettle':            nettle.found()}
+if nettle.found()
+   summary_info += {'  XTS':             xts != 'private'}
 endif
 summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
diff --git a/meson_options.txt b/meson_options.txt
index 3d304cac96..343ffffb7c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -76,6 +76,12 @@ option('iconv', type : 'feature', value : 'auto',
        description: 'Font glyph conversion support')
 option('curses', type : 'feature', value : 'auto',
        description: 'curses UI')
+option('gnutls', type : 'feature', value : 'auto',
+       description: 'GNUTLS cryptography support')
+option('nettle', type : 'feature', value : 'auto',
+       description: 'nettle cryptography support')
+option('gcrypt', type : 'feature', value : 'auto',
+       description: 'libgcrypt cryptography support')
 option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
 option('lzfse', type : 'feature', value : 'auto',
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index b3bc2109da..fcf6ed2ef5 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -83,7 +83,7 @@ if have_block
     'test-crypto-afsplit': [io],
     'test-crypto-block': [io],
   }
-  if 'CONFIG_GNUTLS' in config_host and \
+  if gnutls.found() and \
      'CONFIG_TASN1' in config_host and \
      'CONFIG_POSIX' in config_host
     tests += {
@@ -97,7 +97,7 @@ if have_block
   if 'CONFIG_AUTH_PAM' in config_host
     tests += {'test-authz-pam': [authz]}
   endif
-  if 'CONFIG_QEMU_PRIVATE_XTS' in config_host
+  if xts == 'private'
     tests += {'test-crypto-xts': [crypto, io]}
   endif
   if 'CONFIG_POSIX' in config_host
@@ -106,7 +106,7 @@ if have_block
   if 'CONFIG_REPLICATION' in config_host
     tests += {'test-replication': [testblock]}
   endif
-  if 'CONFIG_NETTLE' in config_host or 'CONFIG_GCRYPT' in config_host
+  if nettle.found() or gcrypt.found()
     tests += {'test-crypto-pbkdf': [io]}
   endif
   if 'CONFIG_EPOLL_CREATE1' in config_host
-- 
2.31.1



