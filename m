Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9F73BC959
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:17:25 +0200 (CEST)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i8q-0000dc-6K
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htv-0000yR-Ey
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:59 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hts-0002KU-F8
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:59 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so1280768wmh.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/MVRv4+jx3llq16RDcVRAyicy4Ay5QfckD+dpn3sjS4=;
 b=Zl7pNb8Fjo13bdt+8VyfXU+w54TGNe1wex2TfADC82PhaxuqVIEgZyko28gAWvY2z9
 din7f0v6i59sQpF/CX23R+0rOEsM2hw8hCPEfuB87op+ikqMX0NuS2DYYZo5UJHpECHm
 TPwmDpKDs2/KtNPJ01+vUjTmIIe06YKbwqFJbhypp/Bfzu/98EZ6k/eVmiLGGhaUlXga
 2quBnmOrlFAeMYlzhtTkao+DubmqbFItMjReFZWOOwg9a9Hh8Y3F7ZFHfdOqxiDPJBe/
 fpXAWEWSPZTrdwHeOBtdeNI8B0zhW3weAZBN2+X7GKgAQy+NNqmCrUeuWyFKfkZnYI5R
 lPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/MVRv4+jx3llq16RDcVRAyicy4Ay5QfckD+dpn3sjS4=;
 b=gh5yX+nhkSuEY1JJjrcl67QzvBc8Uhc2ecZWmWLZ8UkqCIBlaVHVutnEUK1wcug1Vp
 d7C0EOuqJaCHzaZeEw9rnjDhywNcda3w1MthTRTYkXq2yF2iox7OPUZwt8SzR7Gqbg4k
 Fey/NqJf2aH3KplihSo8QJ9/DSScVQU95tRDnvJN8lFOOUWOaKXgo8+8F6pRTKykE746
 2/7rNuduHXrsiFvI7MnRiZr8w5fQQrwaF7aXc6NnFnsraDSM5JZkuMVQODshsliENNWT
 DHeBHBRCXDszoKOMS822SBIn8wbSQBRT0dG0XmhyAn1w4LD/+XJ1jMHzECiE9V4Kh3z+
 yCGg==
X-Gm-Message-State: AOAM531mI8vDPZXLOkfkvO2bLEPaf5aYkrEqxBAVPlpSEWm2itEF7onc
 azA45O/YNUrRVXvcH9gUSsGhDTwkiYk=
X-Google-Smtp-Source: ABdhPJx2+QOFwpdIm0t0OgR3JQwe7c52LY5YaC4hhZOOmi7VHSokArobXBYe2tI1hu6JAW3JD9FTKA==
X-Received: by 2002:a05:600c:3b0b:: with SMTP id
 m11mr19781086wms.162.1625565715152; 
 Tue, 06 Jul 2021 03:01:55 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/40] configure, meson: convert libdaxctl detection to meson
Date: Tue,  6 Jul 2021 12:01:20 +0200
Message-Id: <20210706100141.303960-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 configure         | 28 ++++------------------------
 meson.build       |  8 +++++---
 meson_options.txt |  2 ++
 3 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/configure b/configure
index 895192e0de..5b18f4fac3 100755
--- a/configure
+++ b/configure
@@ -433,7 +433,7 @@ plugins="no"
 fuzzing="no"
 rng_none="no"
 secret_keyring="$default_feature"
-libdaxctl="$default_feature"
+libdaxctl="auto"
 meson=""
 ninja=""
 skip_meson=no
@@ -1534,9 +1534,9 @@ for opt do
   ;;
   --disable-keyring) secret_keyring="no"
   ;;
-  --enable-libdaxctl) libdaxctl=yes
+  --enable-libdaxctl) libdaxctl=disabled
   ;;
-  --disable-libdaxctl) libdaxctl=no
+  --disable-libdaxctl) libdaxctl=enabled
   ;;
   --enable-fuse) fuse="enabled"
   ;;
@@ -4949,22 +4949,6 @@ if test "$libpmem" != "no"; then
 	fi
 fi
 
-##########################################
-# check for libdaxctl
-
-if test "$libdaxctl" != "no"; then
-	if $pkg_config --atleast-version=57 "libdaxctl"; then
-		libdaxctl="yes"
-		libdaxctl_libs=$($pkg_config --libs libdaxctl)
-		libdaxctl_cflags=$($pkg_config --cflags libdaxctl)
-	else
-		if test "$libdaxctl" = "yes" ; then
-			feature_not_found "libdaxctl" "Install libdaxctl"
-		fi
-		libdaxctl="no"
-	fi
-fi
-
 ##########################################
 # check for slirp
 
@@ -5738,11 +5722,6 @@ if test "$libpmem" = "yes" ; then
   echo "LIBPMEM_CFLAGS=$libpmem_cflags" >> $config_host_mak
 fi
 
-if test "$libdaxctl" = "yes" ; then
-  echo "CONFIG_LIBDAXCTL=y" >> $config_host_mak
-  echo "LIBDAXCTL_LIBS=$libdaxctl_libs" >> $config_host_mak
-fi
-
 if test "$bochs" = "yes" ; then
   echo "CONFIG_BOCHS=y" >> $config_host_mak
 fi
@@ -6108,6 +6087,7 @@ if test "$skip_meson" = no; then
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
+        -Dlibdaxctl=$libdaxctl \
         -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Dattr=$attr -Ddefault_devices=$default_devices -Dvirglrenderer=$virglrenderer \
diff --git a/meson.build b/meson.build
index 84ffdb4599..e530829105 100644
--- a/meson.build
+++ b/meson.build
@@ -1011,8 +1011,10 @@ if 'CONFIG_LIBPMEM' in config_host
                                link_args: config_host['LIBPMEM_LIBS'].split())
 endif
 libdaxctl = not_found
-if 'CONFIG_LIBDAXCTL' in config_host
-  libdaxctl = declare_dependency(link_args: config_host['LIBDAXCTL_LIBS'].split())
+if not get_option('libdaxctl').auto() or have_system
+  libdaxctl = dependency('libdaxctl', required: get_option('libdaxctl'),
+                         version: '>=57', method: 'pkg-config',
+                         kwargs: static_kwargs)
 endif
 tasn1 = not_found
 if gnutls.found()
@@ -2821,7 +2823,7 @@ summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
 summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
 summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capstone_opt}
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
-summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
+summary_info += {'libdaxctl support': libdaxctl.found()}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
diff --git a/meson_options.txt b/meson_options.txt
index a70aedb0eb..46180000fd 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -84,6 +84,8 @@ option('nettle', type : 'feature', value : 'auto',
        description: 'nettle cryptography support')
 option('gcrypt', type : 'feature', value : 'auto',
        description: 'libgcrypt cryptography support')
+option('libdaxctl', type : 'feature', value : 'auto',
+       description: 'libdaxctl support')
 option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
 option('libusb', type : 'feature', value : 'auto',
-- 
2.31.1



