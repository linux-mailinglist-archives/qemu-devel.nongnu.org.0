Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D873B19C2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:19:24 +0200 (CEST)
Received: from localhost ([::1]:33824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1ql-0003CE-LW
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m6-0003vh-Lr
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:34 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m4-000223-Gz
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:34 -0400
Received: by mail-ed1-x52e.google.com with SMTP id i5so3189394eds.1
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdNBBsrW5vIL9utRkwMG1tSad8yWDV0BnIWqmy35G8s=;
 b=iVVyoTgyOEGcfBnP8byUhqjaNaImzxrvEe4DXfJU8bN7CMB0ANPnxJqUvCtY3GzBKw
 3L0m+ZxbHnxKfaX5aZ30OOgsHN/7VB6gU3oGYyWUK8LjB6Anm8G1Ou4P5BP64KME5fyh
 EX49n6aiGlQXj4hJtpPTGTyCTbfxuW7IG3Gi3Ffk2zxR1uq5Ih88dx1Eh5jDhuQQAIXX
 vh82mTemZr7sFC7Mi5k/eNjRikRcd2LqR1RoYhnceS94w0fBOs1CHD08dQFWk6lPuHzy
 WsukHrTa33sRHOzHALiuImaoP/RmfGp/9ed/b+3FPCKIJWW/tWjaPmXZBeadkXSNR741
 gzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wdNBBsrW5vIL9utRkwMG1tSad8yWDV0BnIWqmy35G8s=;
 b=StX14Y5BDPnB1Nf2R4b9vr91YyFuEoF2TS3M9+KMj3eIRfhInmohozxmVI/lW4mEkq
 dsc6uxj1Fhogu/w+/PG5aBk7Tr2FwGInOCQIKCdIhCm8ix107CeTiQgKpHkrQeQ/lily
 wJiPZJXgraMBzYH91PF34SYhoti7COhAFeI84UAY1ivGOGxKYwGUhLiN+t5Sxf+cfJAV
 nu3/FJa6LVVwbmnPKFjkU/39y05D7XG8eVR1sm/0p4LRxPKyDp2obGGlRQWfzOSwd65V
 j0ql3mqMK7a9Xd3g3eqGUzjUPQGRjq+g1XUrfBJ6Fo8/K5CunaVYm0ZF4rcmQ5cHgsor
 DPQw==
X-Gm-Message-State: AOAM531R6CxKMk7z97beUIIn6g7inifKH9mr8ruHZAq796weAAf4RLSj
 /zTbeMkpBanvV/+EdAKHgZmrAfps7Pc=
X-Google-Smtp-Source: ABdhPJyq1IizHFcOP+PA/wSNgGbOBcWCT0psv+6sfClJ/ldUyPc1HaSm4iyIruvwuyoaEydsZI7sqQ==
X-Received: by 2002:aa7:d818:: with SMTP id v24mr11734367edq.22.1624450471098; 
 Wed, 23 Jun 2021 05:14:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o5sm1680778edt.44.2021.06.23.05.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:14:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] configure, meson: convert pam detection to meson
Date: Wed, 23 Jun 2021 14:14:20 +0200
Message-Id: <20210623121424.1259496-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623121424.1259496-1-pbonzini@redhat.com>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 authz/meson.build      |  2 +-
 configure              | 38 ++++----------------------------------
 meson.build            | 30 +++++++++++++++++++++++++-----
 meson_options.txt      |  2 ++
 tests/unit/meson.build |  2 +-
 5 files changed, 33 insertions(+), 41 deletions(-)

diff --git a/authz/meson.build b/authz/meson.build
index 88fa7769cb..42a1ec0ff6 100644
--- a/authz/meson.build
+++ b/authz/meson.build
@@ -6,4 +6,4 @@ authz_ss.add(files(
   'simple.c',
 ))
 
-authz_ss.add(when: ['CONFIG_AUTH_PAM', pam], if_true: files('pamacct.c'))
+authz_ss.add(when: pam, if_true: files('pamacct.c'))
diff --git a/configure b/configure
index 3d36eea55f..237e99c3d0 100755
--- a/configure
+++ b/configure
@@ -407,7 +407,7 @@ tls_priority="NORMAL"
 gnutls="auto"
 nettle="auto"
 gcrypt="auto"
-auth_pam="$default_feature"
+auth_pam="auto"
 vte="$default_feature"
 virglrenderer="$default_feature"
 tpm="$default_feature"
@@ -1383,9 +1383,9 @@ for opt do
   ;;
   --enable-gcrypt) gcrypt="enabled"
   ;;
-  --disable-auth-pam) auth_pam="no"
+  --disable-auth-pam) auth_pam="disabled"
   ;;
-  --enable-auth-pam) auth_pam="yes"
+  --enable-auth-pam) auth_pam="enabled"
   ;;
   --enable-rdma) rdma="yes"
   ;;
@@ -2799,33 +2799,6 @@ EOF
   fi
 fi
 
-##########################################
-# PAM probe
-
-if test "$auth_pam" != "no"; then
-    cat > $TMPC <<EOF
-#include <security/pam_appl.h>
-#include <stdio.h>
-int main(void) {
-   const char *service_name = "qemu";
-   const char *user = "frank";
-   const struct pam_conv pam_conv = { 0 };
-   pam_handle_t *pamh = NULL;
-   pam_start(service_name, user, &pam_conv, &pamh);
-   return 0;
-}
-EOF
-    if compile_prog "" "-lpam" ; then
-        auth_pam=yes
-    else
-        if test "$auth_pam" = "yes"; then
-            feature_not_found "PAM" "Install PAM development package"
-        else
-            auth_pam=no
-        fi
-    fi
-fi
-
 ##########################################
 # VTE probe
 
@@ -5540,9 +5513,6 @@ if test "$gdbus_codegen" != "" ; then
     echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
 fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
-if test "$auth_pam" = "yes" ; then
-    echo "CONFIG_AUTH_PAM=y" >> $config_host_mak
-fi
 if test "$have_broken_size_max" = "yes" ; then
     echo "HAVE_BROKEN_SIZE_MAX=y" >> $config_host_mak
 fi
@@ -6251,7 +6221,7 @@ if test "$skip_meson" = no; then
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt \
+        -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Dattr=$attr -Ddefault_devices=$default_devices \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
diff --git a/meson.build b/meson.build
index d4ce2ca57b..c9266bd3cc 100644
--- a/meson.build
+++ b/meson.build
@@ -325,10 +325,6 @@ if have_system or have_tools
   pixman = dependency('pixman-1', required: have_system, version:'>=0.21.8',
                       method: 'pkg-config', kwargs: static_kwargs)
 endif
-pam = not_found
-if 'CONFIG_AUTH_PAM' in config_host
-  pam = cc.find_library('pam')
-endif
 libaio = cc.find_library('aio', required: false)
 zlib = dependency('zlib', required: true, kwargs: static_kwargs)
 linux_io_uring = not_found
@@ -907,6 +903,30 @@ if get_option('vnc').enabled()
   endif
 endif
 
+pam = not_found
+if not get_option('auth_pam').auto() or have_system
+  pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],
+                        required: get_option('auth_pam'),
+                        kwargs: static_kwargs)
+endif
+if pam.found() and not cc.links('''
+   #include <security/pam_appl.h>
+   int main(void) {
+     const char *service_name = "qemu";
+     const char *user = "frank";
+     const struct pam_conv pam_conv = { 0 };
+     pam_handle_t *pamh = NULL;
+     pam_start(service_name, user, &pam_conv, &pamh);
+     return 0;
+   }''', dependencies: pam)
+  pam = not_found
+  if get_option('auth_pam').enabled()
+    error('could not link libpam')
+  else
+    warning('could not link libpam, disabling')
+  endif
+endif
+
 snappy = not_found
 if not get_option('snappy').auto() or have_system
   snappy = cc.find_library('snappy', has_headers: ['snappy-c.h'],
@@ -2729,7 +2749,7 @@ summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
 summary_info += {'libtasn1':          tasn1.found()}
-summary_info += {'PAM':               config_host.has_key('CONFIG_AUTH_PAM')}
+summary_info += {'PAM':               pam.found()}
 summary_info += {'iconv support':     iconv.found()}
 summary_info += {'curses support':    curses.found()}
 # TODO: add back version
diff --git a/meson_options.txt b/meson_options.txt
index 343ffffb7c..ac6e90da07 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -52,6 +52,8 @@ option('multiprocess', type: 'feature', value: 'auto',
 
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
+option('auth_pam', type : 'feature', value : 'auto',
+       description: 'PAM access control')
 option('brlapi', type : 'feature', value : 'auto',
        description: 'brlapi character device driver')
 option('bzip2', type : 'feature', value : 'auto',
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 4c1ebc06ac..3e0504dd21 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -94,7 +94,7 @@ if have_block
       'test-io-channel-tls': ['io-channel-helpers.c', 'crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
                               tasn1, io, crypto, gnutls]}
   endif
-  if 'CONFIG_AUTH_PAM' in config_host
+  if pam.found()
     tests += {'test-authz-pam': [authz]}
   endif
   if xts == 'private'
-- 
2.31.1



