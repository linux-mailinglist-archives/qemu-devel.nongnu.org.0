Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8294BD91E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:36:43 +0100 (CET)
Received: from localhost ([::1]:50008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM63e-0006Ez-OB
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:36:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM61j-00055G-44
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 05:34:43 -0500
Received: from [2a00:1450:4864:20::535] (port=42636
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nM61g-00037E-8f
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 05:34:42 -0500
Received: by mail-ed1-x535.google.com with SMTP id i11so26692785eda.9
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 02:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJsattkAGDiqLfvIU39+AHVLjqU4ldIKfm3DvFXV0i4=;
 b=UjnkB09WbC4bTGaAFpvVemMoGv2zlyb4KDDiktz4MrTA9Soje7O0/88tLRHLs+nbSk
 LFQsstrxneNlokLb4QIfv1D2hJBoCsq8f6HJ8lW1wBMO/S3ycCl6WHRXsgq8C4RWDWLK
 Z/gh2zdaaIBoog17oeGLVQQoeGI1ACGm6Hmv0/UX7hBDLBrUy7hgwHYfJBKuUwS0e2dZ
 twsxN6zt0VFrm+UIknoAhHqAWi/oJrdTQXggNZdEwdMYqeUlN5Ele8pz8itpBUCBgk0K
 uP4+r8fAXI9uijeDISxbIoWSD7T00njeKmfjHuN2Hxs08Ck8iX/fW18o9wEyQWbjONzB
 UJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QJsattkAGDiqLfvIU39+AHVLjqU4ldIKfm3DvFXV0i4=;
 b=jay56mU/xrsc9/J88OSJwU3s9/uXYxcPiDdi402YriM8iYozWDNCQgUK4/0JXddkb6
 /ccep1PNjg3XWor6LFFcpsWHkgznyx+vMve9LNAyAOu9SRcyOQUvE52yD1BrhK4Xgo7E
 +vMRd7xTx4kyHaSmKQSgvSJLHH4pyiRkwUAdZm4IF6GPFmcVPd+PaqQ+edEkILdanrAM
 BPekzEI1IJ6piOqEGPz33hhtQ2qZXYYNWFrMG1YJc3qTDVgpuzIl1tCB9EDiIGXgtApG
 tk01UGlm5H7h1GTUouhnOvLkMGbXpzzfJ3sHrg6+OJBo+JAHUVWE9c+AB4fbMfbO9uvx
 aOuA==
X-Gm-Message-State: AOAM533U2iJndC1WgB/HMHCNR4ONxrKKhKUUP6aBmyhKDnva4wlitr6b
 8IILghO66SJbxub+H6cR/VdboL81MbY=
X-Google-Smtp-Source: ABdhPJx3s9G6kaYvzxdAZJ133UQJ74JPN61fDeRPi0gcpNR3wcnfRwGVi7A4KIDE0Wx4tdIPLLqlOA==
X-Received: by 2002:a05:6402:51cb:b0:409:e99f:bc1c with SMTP id
 r11-20020a05640251cb00b00409e99fbc1cmr20625738edd.68.1645439678678; 
 Mon, 21 Feb 2022 02:34:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id eg42sm6571608edb.79.2022.02.21.02.34.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 02:34:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/29] configure, meson: move AF_ALG test to meson
Date: Mon, 21 Feb 2022 11:34:35 +0100
Message-Id: <20220221103435.65501-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220221103435.65501-1-pbonzini@redhat.com>
References: <20220221103435.65501-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
index 49f14f960e..67592d47b3 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -113,6 +113,8 @@ option('nettle', type : 'feature', value : 'auto',
        description: 'nettle cryptography support')
 option('gcrypt', type : 'feature', value : 'auto',
        description: 'libgcrypt cryptography support')
+option('crypto_afalg', type : 'feature', value : 'disabled',
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

