Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CD6508C5D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:45:38 +0200 (CEST)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCWP-00030S-Bf
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLa-0001OD-D0
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:28 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLY-0000ui-GF
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:26 -0400
Received: by mail-wr1-x436.google.com with SMTP id p18so2792299wru.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IswL544krc2bs9Blk4cXA0C6mPdV4B6VvXc9SDPTH08=;
 b=Sxr0683d1JhqqlZlhuWYo63cfDQrM952gDdTUsacfE+ThEY/O3fESPzi3CUVfyt3+h
 v616OSkzTG3kf8aw31trWjBX0khagvfWWx/RJ4pGoSv0UcyGWM0XB4RriG0s3m5kNZCS
 kMqBY4e378NC9ROVXNd4vcHJypWWeiyU0XFXoVb/kkKfl+0YYNNRykz2FoLkHpZrAG11
 9ghUsG1kxEQnrxLzCM4vEIVU06ypdYa3JfT4eRW+zab/DnGfBJYuwKitbx/4AhDriNN1
 G2tUi387Yxrw98n2XibeQTWcxqZ63lRWdV+F3DWfShfENHVPQL93PxwqsbYPqpVPP4Y6
 8EFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IswL544krc2bs9Blk4cXA0C6mPdV4B6VvXc9SDPTH08=;
 b=L0HXkBjy8scnRoNYXxzq/FDaIpYi8ESHNY2apcdYzIwbSeQYaX9YE/0+A62Ue0IJJT
 NxsTc+v7h/5KZ5/u1xIyGZnMp+7d4wAPn4bh6QeZ58pzOI81Sy2brs+ynGfhL3+UZkvZ
 IiPD/136ic9nImIYrRI0hpCBAVi1322incOwe+mUO4ecN72i1zxUinjCvYLlZqETVag6
 Nt5UQQN+4sZnFQJ2yn1F5HJkNPnWgZ5TM3jIJZQZumD+zGPv1PEuKwtOdmNNlSPcl21t
 05Yjddpl2dYzvqo0UBV4JUeQnCXVmsFmBroYBMuwAKbJfmA6dbBG0x/RQj7zY350GBEo
 63YQ==
X-Gm-Message-State: AOAM533wVtN//iQsdt3ErBB0aXSkzXf9TsKHn/eZWlyXw7HKf7E4Dea6
 r3YGJ4vj3xZc9hSeSsNXmdmoJOCkOk2b9A==
X-Google-Smtp-Source: ABdhPJzdQrPhQ+XE5XzW0ml+li2SJzRx8xgj0rRYtYhv9TsXawQ8xDcbQsbG3W2dumqIldUVdzwdjA==
X-Received: by 2002:a5d:5248:0:b0:207:a421:1a26 with SMTP id
 k8-20020a5d5248000000b00207a4211a26mr15889852wrc.271.1650468862294; 
 Wed, 20 Apr 2022 08:34:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/34] meson, configure: move keyctl test to meson
Date: Wed, 20 Apr 2022 17:33:42 +0200
Message-Id: <20220420153407.73926-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 configure                     | 44 -----------------------------------
 crypto/meson.build            |  4 +++-
 meson.build                   | 15 +++++++++++-
 meson_options.txt             |  2 ++
 scripts/meson-buildoptions.sh |  3 +++
 5 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/configure b/configure
index cfd15c3518..1c74d2c5f2 100755
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
index bdee186702..066bb69174 100644
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
@@ -3684,7 +3697,7 @@ if nettle.found()
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



