Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C43BC15B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:06:59 +0200 (CEST)
Received: from localhost ([::1]:36322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0R7a-0002XJ-6D
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1G-0001CY-GO
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1E-0003aE-Dt
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:26 -0400
Received: by mail-wr1-x431.google.com with SMTP id i8so22713413wrc.0
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/MVRv4+jx3llq16RDcVRAyicy4Ay5QfckD+dpn3sjS4=;
 b=S4LHvcyBqkvCx91D0JaPZ8kVh4S5GMSE/M02y4Ushgy6+937EqDsuQUJfXSLUwpmr5
 LYq5TvCLW+1JhVMhunjwA1FzcAkgN1L9+o3JgFFicWFXEybFox0mEccA4G478Jtizv0I
 A+xW1EJIkh0IL4TqP7nlhlc5kBzJdR7xEZlK8Anoy4WprsTxbemnffWwAJEfvvRESgWP
 M020caudgDUaKdq/48s+dpebUaZf1JbS/+qrdBKZ41wXQwbQHGMVqT56vgtJpSuCG0c2
 xlGfBoVjOYUzfRlHS7a7c+6UU8dYjZERnN66K6HBQ7gyvWv14pMh3eqjPB+TvWGTVwtW
 YTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/MVRv4+jx3llq16RDcVRAyicy4Ay5QfckD+dpn3sjS4=;
 b=HXZD5TRTaEF+svD6De7fx0Di/BEALgJAIdn+O9nfhLGDUSneqPSGe5HeFcAz3u3At7
 jjUn49Jva29A08k/ANFSCmeaE7ZJ7eqwfvZcAmQVoHgocdcC02yU7Wun0cnXnIXN60kh
 vGSA6DisM7PvetupH25dGAPIBnuZN6gL/R+ejzCntzKeaq7vWCp7KOzNOrpgJmeakqcK
 SC2LpqW7ERioD7tQVyTCaN64dp1P3qqCTJvvbsld3DmxY62kws7G76eixRt06jJBo+ul
 eet31VCmzI5vg4PMP+NDUIQ0TgUPgW+ciTZI+tBLXG3+ek8W6EktBDW2uILw9C4HFlDN
 hS5Q==
X-Gm-Message-State: AOAM532btA8yBT0Vi3tJSk5eqOAwMdKnw+WGKVG68slYt+2u4MsF7Iq7
 JN00pXV3casSgimhr7tjM09KMWZYUII=
X-Google-Smtp-Source: ABdhPJxiIpX7X7qlOxXExnpqI+y56pwzeTGmtB4ICluWR4T073CnXAVckI0AnFcypcEjD9VC0dv2Ng==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr16650522wrv.353.1625500823063; 
 Mon, 05 Jul 2021 09:00:23 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/17] configure, meson: convert libdaxctl detection to meson
Date: Mon,  5 Jul 2021 18:00:05 +0200
Message-Id: <20210705160018.241397-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
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



