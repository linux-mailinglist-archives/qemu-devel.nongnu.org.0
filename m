Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A9E4A8AFA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 18:54:47 +0100 (CET)
Received: from localhost ([::1]:39818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgJi-0000O7-2a
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 12:54:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzl-0004q0-VG
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:09 -0500
Received: from [2a00:1450:4864:20::632] (port=47073
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFfzi-0008Ew-9N
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:09 -0500
Received: by mail-ej1-x632.google.com with SMTP id o12so10939408eju.13
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nu8kIltxv+Y+9cFk4li6c/c4F9agDzLDSz4VZtxJdu4=;
 b=ozU4jkQXHShyhe5yLxxTT77VE2wlSCF97PzeYZQFhrkSZxQGKVrcL7YNUqGT5yWgAu
 pQYUiZS6e2ZHv+9LLSycElN3pjhq1IKtynVBpSztndRWSshSvpAKTvdzqsdFIQt+oy6a
 iX5GMfYMm5tvrfQvyWJIC9FbgZPkx9MkkVKCtTrd4xiM5dFn1Ps8knTO2lPTgTvv/4YL
 DuMHiG94gvE8d1S34eg/5Gs32/sb5/zsa6zc3Lg0X5JDQGE3uTC2hcTBb8oDrGs2lW2U
 Og2TZ1QXtp//h7h7cUjeLE3/F6ICzxkGs7a2CWMtHpL6yrT996EBVvuuZNvH44alCCWT
 rlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nu8kIltxv+Y+9cFk4li6c/c4F9agDzLDSz4VZtxJdu4=;
 b=si3qsQ5nRSwEm6mNNI2TCh6UNM6475XwCsTdJ5BXU3OjgEYMLkwAMTgbtKHX77Qd6w
 v+3jQc4RyVhRchlRLr8GiIh7e4UPsTytsX2DprXaCZ60HVq27kUX5lpFj41dbWH/b3ox
 dsHY++wP3hImIK2i96ZaaHc9YZkQhuJcc40HlARmKc5oeHGBIYYf4E826zxjpG0grK99
 /L/bUG9xxpP0VHYb36Y+OIJw925C8mhu5k1Pzw5R/bvkjoFt7XzD6PGYqhiMaKju4ah+
 AF3FjffxFGIz2FAHGO1o6rH/uJNQQVBsy9aaozRL5TWrZvCjJ0HwObet6+v7yfhA/a+m
 6dew==
X-Gm-Message-State: AOAM533MJlPR2YyRdvY60X2FALUNj6z7vZpc7nWHPar7HglNfU789rGL
 /GxKc9Jpf2hb+ImEvN4/9m2cl6kwdLQ=
X-Google-Smtp-Source: ABdhPJxw09LRFKSv+UD11lbAk8WnaQUp5Zw8X9daYkJUzOw2fZTh1EGm+n9V5K8klnauZYcATvEMdg==
X-Received: by 2002:a17:906:478b:: with SMTP id
 cw11mr31148282ejc.35.1643909644973; 
 Thu, 03 Feb 2022 09:34:04 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/27] configure, meson: move AF_ALG test to meson
Date: Thu,  3 Feb 2022 18:33:37 +0100
Message-Id: <20220203173359.292068-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 36 -----------------------------------
 crypto/meson.build            |  4 +++-
 meson.build                   | 16 +++++++++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 5 files changed, 23 insertions(+), 38 deletions(-)

diff --git a/configure b/configure
index 9dc0d79b0e..cdaab251c8 100755
--- a/configure
+++ b/configure
@@ -329,7 +329,6 @@ want_tools="$default_feature"
 coroutine=""
 coroutine_pool="$default_feature"
 debug_stack_usage="no"
-crypto_afalg="no"
 tls_priority="NORMAL"
 tpm="$default_feature"
 live_block_migration=${default_feature:-yes}
@@ -976,10 +975,6 @@ for opt do
   ;;
   --enable-debug-stack-usage) debug_stack_usage="yes"
   ;;
-  --enable-crypto-afalg) crypto_afalg="yes"
-  ;;
-  --disable-crypto-afalg) crypto_afalg="no"
-  ;;
   --disable-vhost-net) vhost_net="no"
   ;;
   --enable-vhost-net) vhost_net="yes"
@@ -1416,7 +1411,6 @@ cat << EOF
   vvfat           vvfat image format support
   qed             qed image format support
   parallels       parallels image format support
-  crypto-afalg    Linux AF_ALG crypto backend driver
   debug-mutex     mutex debugging support
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
   gio             libgio support
@@ -2838,32 +2832,6 @@ if test "$fortify_source" != "no"; then
   fi
 fi
 
-##########################################
-# check for usable AF_ALG environment
-have_afalg=no
-cat > $TMPC << EOF
-#include <errno.h>
-#include <sys/types.h>
-#include <sys/socket.h>
-#include <linux/if_alg.h>
-int main(void) {
-    int sock;
-    sock = socket(AF_ALG, SOCK_SEQPACKET, 0);
-    return sock;
-}
-EOF
-if compile_prog "" "" ; then
-    have_afalg=yes
-fi
-if test "$crypto_afalg" = "yes"
-then
-    if test "$have_afalg" != "yes"
-    then
-	error_exit "AF_ALG requested but could not be detected"
-    fi
-fi
-
-
 ##########################################
 # checks for sanitizers
 
@@ -3329,10 +3297,6 @@ if test "$debug_stack_usage" = "yes" ; then
   echo "CONFIG_DEBUG_STACK_USAGE=y" >> $config_host_mak
 fi
 
-if test "$crypto_afalg" = "yes" ; then
-  echo "CONFIG_AF_ALG=y" >> $config_host_mak
-fi
-
 if test "$have_asan_iface_fiber" = "yes" ; then
     echo "CONFIG_ASAN_IFACE_FIBER=y" >> $config_host_mak
 fi
diff --git a/crypto/meson.build b/crypto/meson.build
index 95a6a83504..9bf3a431fe 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -35,7 +35,9 @@ else
 endif
 
 crypto_ss.add(when: 'CONFIG_SECRET_KEYRING', if_true: files('secret_keyring.c'))
-crypto_ss.add(when: 'CONFIG_AF_ALG', if_true: files('afalg.c', 'cipher-afalg.c', 'hash-afalg.c'))
+if have_afalg
+  crypto_ss.add(if_true: files('afalg.c', 'cipher-afalg.c', 'hash-afalg.c'))
+endif
 crypto_ss.add(when: gnutls, if_true: files('tls-cipher-suites.c'))
 
 util_ss.add(files('aes.c'))
diff --git a/meson.build b/meson.build
index 16f7563360..1d4ba12f52 100644
--- a/meson.build
+++ b/meson.build
@@ -1828,6 +1828,20 @@ config_host_data.set('CONFIG_MEMBARRIER', get_option('membarrier') \
   .require(have_membarrier, error_message: 'membarrier system call not available') \
   .allowed())
 
+have_afalg = get_option('crypto_afalg') \
+  .require(cc.compiles(gnu_source_prefix + '''
+    #include <errno.h>
+    #include <sys/types.h>
+    #include <sys/socket.h>
+    #include <linux/if_alg.h>
+    int main(void) {
+      int sock;
+      sock = socket(AF_ALG, SOCK_SEQPACKET, 0);
+      return sock;
+    }
+  '''), error_message: 'AF_ALG requested but could not be detected').allowed()
+config_host_data.set('CONFIG_AF_ALG', have_afalg)
+
 config_host_data.set('CONFIG_AF_VSOCK', cc.compiles(gnu_source_prefix + '''
   #include <errno.h>
   #include <sys/types.h>
@@ -3457,7 +3471,7 @@ summary_info += {'nettle':            nettle}
 if nettle.found()
    summary_info += {'  XTS':             xts != 'private'}
 endif
-summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
+summary_info += {'AF_ALG support':    have_afalg}
 summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
 summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary(summary_info, bool_yn: true, section: 'Crypto')
diff --git a/meson_options.txt b/meson_options.txt
index 49f14f960e..6efad01528 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -113,6 +113,8 @@ option('nettle', type : 'feature', value : 'auto',
        description: 'nettle cryptography support')
 option('gcrypt', type : 'feature', value : 'auto',
        description: 'libgcrypt cryptography support')
+option('crypto_afalg', type : 'feature', value : 'auto',
+       description: 'Linux AF_ALG crypto backend driver')
 option('libdaxctl', type : 'feature', value : 'auto',
        description: 'libdaxctl support')
 option('libpmem', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 61716e827c..c558fe6761 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -34,6 +34,7 @@ meson_options_help() {
   printf "%s\n" '  cap-ng          cap_ng support'
   printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
   printf "%s\n" '  coreaudio       CoreAudio sound support'
+  printf "%s\n" '  crypto-afalg    Linux AF_ALG crypto backend driver'
   printf "%s\n" '  curl            CURL block device driver'
   printf "%s\n" '  curses          curses UI'
   printf "%s\n" '  dbus-display    -display dbus support'
@@ -136,6 +137,8 @@ _meson_option_parse() {
     --disable-cocoa) printf "%s" -Dcocoa=disabled ;;
     --enable-coreaudio) printf "%s" -Dcoreaudio=enabled ;;
     --disable-coreaudio) printf "%s" -Dcoreaudio=disabled ;;
+    --enable-crypto-afalg) printf "%s" -Dcrypto_afalg=enabled ;;
+    --disable-crypto-afalg) printf "%s" -Dcrypto_afalg=disabled ;;
     --enable-curl) printf "%s" -Dcurl=enabled ;;
     --disable-curl) printf "%s" -Dcurl=disabled ;;
     --enable-curses) printf "%s" -Dcurses=enabled ;;
-- 
2.34.1



