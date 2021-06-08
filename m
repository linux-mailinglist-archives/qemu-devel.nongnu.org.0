Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5C39F505
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:33:25 +0200 (CEST)
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZz2-0000pW-Fu
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpD-0006Xt-JV
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:15 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpC-00080l-15
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:15 -0400
Received: by mail-wm1-x329.google.com with SMTP id h3so1588625wmq.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZLODOBcrmhrnrdjLeC81KpnKgMjP8hJ8DsNQAfM7Xg=;
 b=ENwMr/JxFL/3Xe7LCyLif39qmnb3m+TA5LEF2Uf9NQ6oqLZVDv0A+kaLQl/7qU6up2
 VZZMZphaS3B6w/pYvgf2s1jkXjiD4PP+qVbcOv3dY9qgwAiRwj8twktQtmWfswcg0YJg
 qhg2BOPkKkcizLIOS5o8qH1KI+PE1hcxSjJuU/LCxEFyxpTLLIGbBbOkc/QjZEe35996
 cj81Gaa4Vu/umt6ngPMUncdLakV17OmlA9rW13Ih3JsdOOJJdsBPOb/+9BwLyvwAPaBR
 2dbKJu7/pByQZ41NDyUspwG6WP5P/AICNKRYf2TEssQvgreVOeaU8rzmhKaY+kzwKiGt
 86Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LZLODOBcrmhrnrdjLeC81KpnKgMjP8hJ8DsNQAfM7Xg=;
 b=GMatydq44Deh9ev46rv2D4PP0VFkRdwkAcMUfpnK/2yxJ7GLAW+jzxzo4R4Z1IyCai
 Hazp5AVJ7b12IKmAuBPwvgs0wHcpWgYOAAxx5cMcOl87hL5x1/HqH2gCkJZJtKYKLo9D
 6kGU8nL/foqEnyqrdwcovedBFegBkaqH7PkgASeH83vH/88WQBQGSLQMq13P0p6wEyBv
 E6i6KLEXe3quqtLDszfDun2QTbXSg4SJyuNC5PxYnb8B/sH36QpiEpId/GKF+yp+5pad
 xmkGP4kDzqrugDxgp4/FbtwGSd/zaTPpbSNfpZdHwJGQ+LBe9BlYY+YYMxn+MHvIAYl8
 IPUw==
X-Gm-Message-State: AOAM5332PdudbCHHISjUFhdVJBvIe3l55DOyza5OY0WWU/Ig511/gNw3
 7Kp0maziX+diu67oXBPmqCdlSuFznLr7cQ==
X-Google-Smtp-Source: ABdhPJxeY1UWWubYc7eXZXFiovCRbCsOqsav+hL++TY3weUz2wAvyvRSW7aGDs9fo0Z1wPFKjJUmdw==
X-Received: by 2002:a05:600c:3b11:: with SMTP id
 m17mr21620278wms.150.1623151392881; 
 Tue, 08 Jun 2021 04:23:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/26] configure, meson: convert libdaxctl detection to meson
Date: Tue,  8 Jun 2021 13:22:46 +0200
Message-Id: <20210608112301.402434-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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
 configure         | 28 ++++------------------------
 meson.build       |  8 +++++---
 meson_options.txt |  2 ++
 3 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/configure b/configure
index c2c8c9f2d6..bd675f2254 100755
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
@@ -4950,22 +4950,6 @@ if test "$libpmem" != "no"; then
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
 
@@ -5737,11 +5721,6 @@ if test "$libpmem" = "yes" ; then
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
@@ -6107,6 +6086,7 @@ if test "$skip_meson" = no; then
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
+        -Dlibdaxctl=$libdaxctl \
         -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Dattr=$attr -Ddefault_devices=$default_devices -Dvirglrenderer=$virglrenderer \
diff --git a/meson.build b/meson.build
index 842831e1fb..f1ece39736 100644
--- a/meson.build
+++ b/meson.build
@@ -1016,8 +1016,10 @@ if 'CONFIG_LIBPMEM' in config_host
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
@@ -2835,7 +2837,7 @@ summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
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



