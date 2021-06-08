Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE6F39F4F1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:28:31 +0200 (CEST)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZuI-0006gh-4u
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp9-0006Sv-OI
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZp6-0007wZ-ND
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:10 -0400
Received: by mail-wr1-x429.google.com with SMTP id z8so21121587wrp.12
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=57UsR0DTUAS02KZLVE5DyliFV/++/zkdaZfMUJMA7R8=;
 b=JeNiydQ6U2wUff40ScujQepEKqTwHBBFdVPeAMtXpbYIG2cdJ9HXhTZnnRDuJMTTff
 uzRzp+PwiAmkGKOtRqrDTy+CLTK15PqTi+CBgP6Sa/8HTlfot5V0kEGsjsq5D7zv6aVt
 uSYC9PFim3LwvHWXBY9NTGyQImywzPa6Xm4SCgZwWxh9XuSA0NLYQJHhfq4DxpjS1KY+
 UDSssND966sDFYf8DMSz1mH/+UAT0UVLBJ+HN7div/f1Db3RqdH7xjxKqU5GKgXaaj6w
 W0UNaPm5dLimb99zWv6MfZjzL+4QYGGsfkksoQtQ+AkXnrj1/9rNtpXWvK7zNakAXArb
 dYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=57UsR0DTUAS02KZLVE5DyliFV/++/zkdaZfMUJMA7R8=;
 b=IOOAjog56PIYN6qKukX7qio0rjYshoNlYl9Ja14bP1qSwmV026ILdRVu4Ly5/iwyNH
 puhgJmV8B17XRdhfWftmTrXaW3SG/BFf+fW543qWi1JRkOT82otap2z14SyhDOi8B/nQ
 9VRQBdw4LQJhGpgDh086KSA6hZYEsNaQVJGergWP6KmYXjX3yPIV0NxIm93GBTZNO3RF
 M/HixEdkSAmBTSVEM9a0Q6K60xNeANAEopupVrEZThwgzsEay3HuI8jCy3FPYHRiadSM
 CkU+FLguPc9EWBy0cCe68buPR976h6O/DbaPdcFhXfRCiUsiCkdNVMU2/E+4aSnMzhvV
 61dw==
X-Gm-Message-State: AOAM533oHiMNnOJXTNGctFLicnL8K9pn26FQTRDCLGrRQ5LlnKomBaj3
 uekhE8rjMqCTI2LEUFbmkbYZ/lhYkqxEFw==
X-Google-Smtp-Source: ABdhPJzYhRROQjWjIWp2Pp5zUMbuF7L24cD0FqgYV86N3EwwCRX1LayX4SBgGQumjwTFXv92PJWNoQ==
X-Received: by 2002:adf:e4cf:: with SMTP id v15mr22227553wrm.162.1623151387487; 
 Tue, 08 Jun 2021 04:23:07 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/26] configure, meson: convert pam detection to meson
Date: Tue,  8 Jun 2021 13:22:40 +0200
Message-Id: <20210608112301.402434-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index ebe327b592..d3c2e8ccaf 100755
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
 
@@ -5538,9 +5511,6 @@ if test "$gdbus_codegen" != "" ; then
     echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
 fi
 echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
-if test "$auth_pam" = "yes" ; then
-    echo "CONFIG_AUTH_PAM=y" >> $config_host_mak
-fi
 if test "$have_broken_size_max" = "yes" ; then
     echo "HAVE_BROKEN_SIZE_MAX=y" >> $config_host_mak
 fi
@@ -6250,7 +6220,7 @@ if test "$skip_meson" = no; then
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt \
+        -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Dattr=$attr -Ddefault_devices=$default_devices \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
diff --git a/meson.build b/meson.build
index 305b750ced..0d4b6fff16 100644
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
@@ -2743,7 +2763,7 @@ summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
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



