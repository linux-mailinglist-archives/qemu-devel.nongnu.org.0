Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3E039F50F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:35:35 +0200 (CEST)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqa18-0006Nu-Mh
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpF-0006cy-CV
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:17 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpD-00081J-EK
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id c5so21119024wrq.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x9Fn8aGSUN1MXpHE+pv+qJcB/2aEHuqSvmuUZb8Mu0g=;
 b=iaXHm1dI9McIFrWTMHlk7alsajwKopdOxeB8xR31ON7VtoZYZifHFJ5OYrONzZ/vjU
 IdRU2pvzGClthwCNszXUYkxsxkzXFecmcEJuKJidDTGClU2NNY+6JHwOy0WqsygnD3FL
 xPCTGkJPXlCa19NLqz6UcUlBIySvsows6ig8PCTk6i2YLnUJKM6mukGOwXWiXLR4tHmJ
 +9MXr2pU+kub64nQge0DivGkK4JArzbZVvRJAZJmtrNd/v/M1J4ZyrRoZZfKiP746MH1
 Knl0XxIq2ITN+GWBmcozTCRQph1X1IceEeX2tiMmQxiDAlpiuAOJu0BYUwmPqkHmrM8r
 qPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x9Fn8aGSUN1MXpHE+pv+qJcB/2aEHuqSvmuUZb8Mu0g=;
 b=CK2QM8YZIMSbDv3Ep9bbqvbpvDCjnCydcBE5GRacgLoncBLaU3kTXsDP3wVN1zk5gy
 zFaNAkJdkKAdBrJoNEwmCoBz5nqu/imaKcT8JrhIfcHx+3d/qilAJ8HBDdV6Gq7CyqpS
 WULTEG605MKCgW4PLMpG1sDUZo2z1YwsXo0gAVWHjlwup6tWADbSMhyGI0vrm3tDcEYA
 oSYyDlBhyNZwC+Mm8i9q53TwhrqhehOwfD0N71ucgIqPaQ+QNaAsSYDiTgSBq22szVtv
 SvU1LD3qlLcqfRsvOzg/gnJIYUXjeQXhYlvtxyXOiRWO42+ndV7rg2jvvgnoyYdgnizp
 iyAA==
X-Gm-Message-State: AOAM532G2Zz9Sjg9f95UGBqjJJfrC7shzkqqO0GzMY022dS4V7MMH6Cy
 iurRPT5nc3Rm5Y2pb42EwKgkrw1czh1zsA==
X-Google-Smtp-Source: ABdhPJxaOI6sk0j5NagF9P/5H41LAupHvzBm+kNRqaMueo5DbWe/tvyFwrGJGSh79JAnqmByBTqdPQ==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr21672466wrm.403.1623151393808; 
 Tue, 08 Jun 2021 04:23:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/26] configure, meson: convert libpmem detection to meson
Date: Tue,  8 Jun 2021 13:22:47 +0200
Message-Id: <20210608112301.402434-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
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
 configure         | 24 ++++--------------------
 meson.build       |  8 ++++----
 meson_options.txt |  2 ++
 3 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/configure b/configure
index bd675f2254..8389a6f73f 100755
--- a/configure
+++ b/configure
@@ -427,7 +427,7 @@ qed=${default_feature:-yes}
 parallels=${default_feature:-yes}
 libxml2="$default_feature"
 debug_mutex="no"
-libpmem="$default_feature"
+libpmem="auto"
 default_devices="true"
 plugins="no"
 fuzzing="no"
@@ -1504,9 +1504,9 @@ for opt do
   ;;
   --disable-debug-mutex) debug_mutex=no
   ;;
-  --enable-libpmem) libpmem=yes
+  --enable-libpmem) libpmem=disabled
   ;;
-  --disable-libpmem) libpmem=no
+  --disable-libpmem) libpmem=enabled
   ;;
   --enable-xkbcommon) xkbcommon="enabled"
   ;;
@@ -4934,22 +4934,6 @@ EOF
   fi
 fi
 
-##########################################
-# check for libpmem
-
-if test "$libpmem" != "no"; then
-	if $pkg_config --exists "libpmem"; then
-		libpmem="yes"
-		libpmem_libs=$($pkg_config --libs libpmem)
-		libpmem_cflags=$($pkg_config --cflags libpmem)
-	else
-		if test "$libpmem" = "yes" ; then
-			feature_not_found "libpmem" "Install nvml or pmdk"
-		fi
-		libpmem="no"
-	fi
-fi
-
 ##########################################
 # check for slirp
 
@@ -6086,7 +6070,7 @@ if test "$skip_meson" = no; then
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dlibdaxctl=$libdaxctl \
+        -Dlibdaxctl=$libdaxctl -Dlibpmem=$libpmem \
         -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Dattr=$attr -Ddefault_devices=$default_devices -Dvirglrenderer=$virglrenderer \
diff --git a/meson.build b/meson.build
index f1ece39736..8563443865 100644
--- a/meson.build
+++ b/meson.build
@@ -1011,9 +1011,9 @@ if not get_option('libusb').auto() or have_system
 endif
 
 libpmem = not_found
-if 'CONFIG_LIBPMEM' in config_host
-  libpmem = declare_dependency(compile_args: config_host['LIBPMEM_CFLAGS'].split(),
-                               link_args: config_host['LIBPMEM_LIBS'].split())
+if not get_option('libpmem').auto() or have_system
+  libpmem = dependency('libpmem', required: get_option('libpmem'),
+                       method: 'pkg-config', kwargs: static_kwargs)
 endif
 libdaxctl = not_found
 if not get_option('libdaxctl').auto() or have_system
@@ -2836,7 +2836,7 @@ summary_info += {'zstd support':      zstd.found()}
 summary_info += {'NUMA host support': config_host.has_key('CONFIG_NUMA')}
 summary_info += {'libxml2':           config_host.has_key('CONFIG_LIBXML2')}
 summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capstone_opt}
-summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
+summary_info += {'libpmem support':   libpmem.found()}
 summary_info += {'libdaxctl support': libdaxctl.found()}
 summary_info += {'libudev':           libudev.found()}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
diff --git a/meson_options.txt b/meson_options.txt
index 46180000fd..b23174d0a1 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -86,6 +86,8 @@ option('gcrypt', type : 'feature', value : 'auto',
        description: 'libgcrypt cryptography support')
 option('libdaxctl', type : 'feature', value : 'auto',
        description: 'libdaxctl support')
+option('libpmem', type : 'feature', value : 'auto',
+       description: 'libpmem support')
 option('libudev', type : 'feature', value : 'auto',
        description: 'Use libudev to enumerate host devices')
 option('libusb', type : 'feature', value : 'auto',
-- 
2.31.1



