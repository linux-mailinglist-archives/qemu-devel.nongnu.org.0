Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E064B67F3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:43:53 +0100 (CET)
Received: from localhost ([::1]:56586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuNF-0005f1-38
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:43:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCI-0003wy-CL
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:34 -0500
Received: from [2a00:1450:4864:20::633] (port=37672
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCG-0008Qc-2y
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:33 -0500
Received: by mail-ej1-x633.google.com with SMTP id h8so16382918ejy.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9eEr9vypFvm/GDMW5MF5P0L/9K86tQJ32Kkz70oz/Mk=;
 b=bF0cwE7zeeD+Se7QQRThBYsohef3+1FvmOVCS2Im5E+iJ+GjwyPJucKq2sesemcCHV
 loX1zZXk4uNBwpHDE1zLsDU59rGwyrxkIh3NOxVXcza7B5MlqRZT1LDpL5tl830C4mgQ
 7XRXW254EwoqhQb+Vn2ceZ66sg5jzXPqnXRXg34P6nA5r564uQJXVv52fpOBN1sI0Ste
 ADPLsMe5QaAYjc2Vf8utcK7XVgbwF1dz24dIf7TN0tFWGRShRl1cZvVpWU7jpEuFQSlg
 6dX9Aup8W/M3yxuqeD7Zwga2+aU45SD8I7mYaIVfaTxpA92OMtlO5OTypMBE8h1i0mCH
 TSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9eEr9vypFvm/GDMW5MF5P0L/9K86tQJ32Kkz70oz/Mk=;
 b=tHfyniMJhtGA5pYTC5GDnqHS6ZKZQwk2Owt5/IARWjbFDcjvauJitDdOxpbU1DOolG
 0Y60pmqFZIoQOscjWVKpALwaxONMYrLpjKtwRJNn+oSDxs7A1JA7bkphXC8MgwFDWoCn
 +I9o+jeL/ccXQM+DY8OTpEtj/iRiXTQoafGXR3suSsJsnhd+GbwvByUUODtUfpHTlnsn
 4R+9qwap+pppLVYOS4ReuBV/LJo8cBqgGxQGoIhxyGIphAxj/HhDIwOVKEkbtD0C21Gs
 pcHriSXLZdGAIOmkXz+U4HCxU79X+xqY7c9ebVA+lP3t6Ye/LirGN7PUOKcLK5JyxNRM
 FGaQ==
X-Gm-Message-State: AOAM532QUKVaL4sEm9r/TqfvcqJ2ttOaw1g37I3pJPkrct5n7l663ELH
 gFI9FRunNnH29C1D9BQgmVGhYU0xBog=
X-Google-Smtp-Source: ABdhPJw8m5Rmb1jlA1bH3rSyRWzqhmsJXYez9yGUoOcuhrQCeRzrglrwEj6uMa0+pkkj5/k2ajBAZg==
X-Received: by 2002:a17:906:8592:: with SMTP id
 v18mr689703ejx.207.1644917550737; 
 Tue, 15 Feb 2022 01:32:30 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/30] configure, meson: move AF_ALG test to meson
Date: Tue, 15 Feb 2022 10:32:01 +0100
Message-Id: <20220215093223.110827-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index c49797012d..07ea08cd08 100755
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
@@ -1402,7 +1397,6 @@ cat << EOF
   vvfat           vvfat image format support
   qed             qed image format support
   parallels       parallels image format support
-  crypto-afalg    Linux AF_ALG crypto backend driver
   debug-mutex     mutex debugging support
   rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
   gio             libgio support
@@ -2817,32 +2811,6 @@ if test "$fortify_source" != "no"; then
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
 
@@ -3308,10 +3276,6 @@ if test "$debug_stack_usage" = "yes" ; then
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
index 6dc38a7916..9e1acb98aa 100644
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
@@ -3453,7 +3467,7 @@ summary_info += {'nettle':            nettle}
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
index c204ede02b..a20d40e685 100644
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
@@ -135,6 +136,8 @@ _meson_option_parse() {
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



