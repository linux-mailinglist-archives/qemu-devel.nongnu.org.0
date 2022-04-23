Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8440E50CA59
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 15:06:09 +0200 (CEST)
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niFSh-0006x6-OT
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 09:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFL-00075i-CY
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:19 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niFFJ-00057r-Kv
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 08:52:19 -0400
Received: by mail-ed1-x52e.google.com with SMTP id be20so5112732edb.12
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dNmPnWSLR4JpGKD8F5bvT0F6bgApgbbgz90D+2MI2jc=;
 b=D00WE/1UcauiiwD0mrRr2Dd9Sl0000dopoyp/cpiQgVRRHBPHuWP8FvXW1GvvTD5DK
 z6oupthqVf+uNXrBAmEO5fZqA98OD5OiP71auZ+qiwtFwo7x91tKnv/sF7sEWMIdzvs8
 CSW0U0+HfF1ftQw6hv86RZHJA6j5mJpaeeCuMEnA4/Wxq4jqhy2kJEpaMaGyxgqn6rPH
 FHcl6YoqN+uvhimksH9ESj+vGMsD7Yc+QsMJC0GsAD2d7YC++nk50xaFnCNnZJkaNPFJ
 03Ld/zF70Dloc8U8NGcHhet0fD61EPXOA2j6ZCRgMkdcWgMW6xQ8hsVU5tAobpUE4y2j
 ZiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dNmPnWSLR4JpGKD8F5bvT0F6bgApgbbgz90D+2MI2jc=;
 b=FxDcgFfwJULsZnOaJLR4pHThSkAD8teCc95Y3dA+9mpDBshDto0VDQ4zlIvaCGYMK7
 f678Xy7BYRNCh+xlW52Ya3rAj87wwA3yFdcgOWkgmOUKyMMD/EBNNYtugTWOmMdKHjBh
 Hmmy53qfCYOQgGm6IgG8spCSk+njVhE0E1VjNTxefz9b5p+YF3y+RKgNrlgdMmLBC84d
 8PEUC1AkPrf6w0vga+CCXCYwrGoyzR9+oJ5U9h1HTeC6oqFP6zoWTi/aw+jZEFra2U5K
 xdIfVi+ezhiYoTgSGZ9BCTpJJz2zTxHyzyB0DcU+cgIwHTjXC+6S0SiFTtg7KiAY4uow
 hJGg==
X-Gm-Message-State: AOAM531xzZRlNhRYhvTObPQK/kRdP82+UMBKFA4wjllJB9C2q7Fd87Z4
 Q8vN0GFleYdANOLsr8snwQ1IPiTBKYg7fg==
X-Google-Smtp-Source: ABdhPJwBzMNo/s+5x5pI8Kyu799k2m5RsBLM95ahhPNpZlaOBuMec2m11NS1wVUeNYzcQnmZ5Fve4w==
X-Received: by 2002:a05:6402:190a:b0:424:890:e4e1 with SMTP id
 e10-20020a056402190a00b004240890e4e1mr10059987edz.169.1650718336299; 
 Sat, 23 Apr 2022 05:52:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1655573ejb.194.2022.04.23.05.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 05:52:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/34] meson, configure: move keyctl test to meson
Date: Sat, 23 Apr 2022 14:51:26 +0200
Message-Id: <20220423125151.27821-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220423125151.27821-1-pbonzini@redhat.com>
References: <20220423125151.27821-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                     | 44 -----------------------------------
 crypto/meson.build            |  4 +++-
 meson.build                   | 15 +++++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 5 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/configure b/configure
index 4deca94235..313579019d 100755
--- a/configure
+++ b/configure
@@ -322,7 +322,6 @@ trace_file="trace"
 coroutine=""
 tls_priority="NORMAL"
 plugins="$default_feature"
-secret_keyring="$default_feature"
 meson=""
 meson_args=""
 ninja=""
@@ -1009,10 +1008,6 @@ for opt do
   ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
-  --enable-keyring) secret_keyring="yes"
-  ;;
-  --disable-keyring) secret_keyring="no"
-  ;;
   --enable-gio) gio=yes
   ;;
   --disable-gio) gio=no
@@ -2440,41 +2435,6 @@ case "$slirp" in
     ;;
 esac
 
-##########################################
-# check for usable __NR_keyctl syscall
-
-if test "$linux" = "yes" ; then
-
-    have_keyring=no
-    cat > $TMPC << EOF
-#include <errno.h>
-#include <asm/unistd.h>
-#include <linux/keyctl.h>
-#include <unistd.h>
-int main(void) {
-    return syscall(__NR_keyctl, KEYCTL_READ, 0, NULL, NULL, 0);
-}
-EOF
-    if compile_prog "" "" ; then
-        have_keyring=yes
-    fi
-fi
-if test "$secret_keyring" != "no"
-then
-    if test "$have_keyring" = "yes"
-    then
-	secret_keyring=yes
-    else
-	if test "$secret_keyring" = "yes"
-	then
-	    error_exit "syscall __NR_keyctl requested, \
-but not implemented on your system"
-	else
-	    secret_keyring=no
-	fi
-    fi
-fi
-
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -2760,10 +2720,6 @@ if test -n "$gdb_bin"; then
     fi
 fi
 
-if test "$secret_keyring" = "yes" ; then
-  echo "CONFIG_SECRET_KEYRING=y" >> $config_host_mak
-fi
-
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
diff --git a/crypto/meson.build b/crypto/meson.build
index 19c44bea89..f065f2f277 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -34,7 +34,9 @@ else
   crypto_ss.add(files('hash-glib.c', 'hmac-glib.c', 'pbkdf-stub.c'))
 endif
 
-crypto_ss.add(when: 'CONFIG_SECRET_KEYRING', if_true: files('secret_keyring.c'))
+if have_keyring
+  crypto_ss.add(files('secret_keyring.c'))
+endif
 if have_afalg
   crypto_ss.add(if_true: files('afalg.c', 'cipher-afalg.c', 'hash-afalg.c'))
 endif
diff --git a/meson.build b/meson.build
index 55ad65ce95..b39b157222 100644
--- a/meson.build
+++ b/meson.build
@@ -1938,6 +1938,19 @@ config_host_data.set('CONFIG_GETAUXVAL', cc.links(gnu_source_prefix + '''
     return getauxval(AT_HWCAP) == 0;
   }'''))
 
+have_keyring = get_option('keyring') \
+  .require(targetos == 'linux', error_message: 'keyring is only available on Linux') \
+  .require(cc.compiles('''
+    #include <errno.h>
+    #include <asm/unistd.h>
+    #include <linux/keyctl.h>
+    #include <sys/syscall.h>
+    #include <unistd.h>
+    int main(void) {
+        return syscall(__NR_keyctl, KEYCTL_READ, 0, NULL, NULL, 0);
+    }'''), error_message: 'keyctl syscall not available on this system').allowed()
+config_host_data.set('CONFIG_SECRET_KEYRING', have_keyring)
+
 have_cpuid_h = cc.links('''
   #include <cpuid.h>
   int main(void) {
@@ -3696,7 +3709,7 @@ if nettle.found()
 endif
 summary_info += {'AF_ALG support':    have_afalg}
 summary_info += {'rng-none':          get_option('rng_none')}
-summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
+summary_info += {'Linux keyring':     have_keyring}
 summary(summary_info, bool_yn: true, section: 'Crypto')
 
 # Libraries
diff --git a/meson_options.txt b/meson_options.txt
index c00e0866e9..d58c69315c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -90,6 +90,8 @@ option('avx2', type: 'feature', value: 'auto',
        description: 'AVX2 optimizations')
 option('avx512f', type: 'feature', value: 'disabled',
        description: 'AVX512F optimizations')
+option('keyring', type: 'feature', value: 'auto',
+       description: 'Linux keyring support')
 
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index cd922614e8..0daeb11fd3 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -68,6 +68,7 @@ meson_options_help() {
   printf "%s\n" '  hvf             HVF acceleration support'
   printf "%s\n" '  iconv           Font glyph conversion support'
   printf "%s\n" '  jack            JACK sound support'
+  printf "%s\n" '  keyring         Linux keyring support'
   printf "%s\n" '  kvm             KVM acceleration support'
   printf "%s\n" '  l2tpv3          l2tpv3 network backend support'
   printf "%s\n" '  libdaxctl       libdaxctl support'
@@ -229,6 +230,8 @@ _meson_option_parse() {
     --disable-install-blobs) printf "%s" -Dinstall_blobs=false ;;
     --enable-jack) printf "%s" -Djack=enabled ;;
     --disable-jack) printf "%s" -Djack=disabled ;;
+    --enable-keyring) printf "%s" -Dkeyring=enabled ;;
+    --disable-keyring) printf "%s" -Dkeyring=disabled ;;
     --enable-kvm) printf "%s" -Dkvm=enabled ;;
     --disable-kvm) printf "%s" -Dkvm=disabled ;;
     --enable-l2tpv3) printf "%s" -Dl2tpv3=enabled ;;
-- 
2.35.1



