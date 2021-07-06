Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF34D3BC9FF
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:32:51 +0200 (CEST)
Received: from localhost ([::1]:36956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iNm-0000HU-Nb
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htv-0000yW-G4
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:59 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htt-0002L9-BA
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:59 -0400
Received: by mail-wr1-x433.google.com with SMTP id i8so12482651wrp.12
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NOvdFt+RLlKN0qQm+dvftDb9ngUzv7CJ6xbSDTj8gq0=;
 b=dpKtzZLOKV3zFMWBNrtZp1H2aAuVI5lOk/xhMc7pi3JED4Uc6M1GtOfGSKANtVUuF1
 F5fT03nbyJtTAlkhwggn997jnYg28TjqLK/AapEXLULShv9ty51Guu0PnLFGYRvhAMnh
 UzGHCveDaRK8iAFBWvzeT0DM/+xy/CrCxIlwfsIOzI46SShbS5OG1CjqYIiTQr5M76TA
 0IDtlDA91ub8luUhF4GOE2mrMwtoPiiXl9Jlkj4BBD6dhBe+th1/snMX7HbQpfKkBlUk
 JqlRn8eXjvSa4rrgYpY3MoTwmavWxOHTItyAP8trxVs2pUPNZsNO4IJxhCwtQ47gcqlD
 Re/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NOvdFt+RLlKN0qQm+dvftDb9ngUzv7CJ6xbSDTj8gq0=;
 b=pXOPuzGNz9IeXAQt38yw+/0hmMB6mFOAcbZfBIvxr4sQ3kzLlymLz9kO0h4jpGKtxu
 2buCvuKucNKDOYKjO7yfhBSOas/2ceOHMugbH4DW31FFZoyfytrEkHgMmXhC78rEULFn
 WSyDg7sO475gG5t4E6p7tB4uVPkbBYIkN+kuBpkmf4rJBEeBdwWc568PrOhwnPotG1Yd
 x10aYxSfPQ3a8pIGgSmQ7ypkaUiXpp3qrXBgjyVmtbjfGjOYRO84Nss1o8OuW7/3E6dJ
 zVemUIZaMIvPHyR9vdnxHuSvQoSXRWxMMgLzo0eA8woq6cmqO+M2bno11MlT61gJXN1N
 xQhw==
X-Gm-Message-State: AOAM5332moULvYNoMxEni+fLZWSUeOviPkGWdi+1bG1vzKsAEQhdTLDX
 IbeFJxdiujoAaa5M6aS2O+34lu9enEk=
X-Google-Smtp-Source: ABdhPJy7MWbGkN3DVDMDffTZ7tSDsOxTdsdk1nzOZEx0KYwAl3dvVzd2sVhV/Ly0qNBB27CKB3e73Q==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr20341360wrs.282.1625565715976; 
 Tue, 06 Jul 2021 03:01:55 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/40] configure, meson: convert libpmem detection to meson
Date: Tue,  6 Jul 2021 12:01:21 +0200
Message-Id: <20210706100141.303960-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
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
 configure         | 24 ++++--------------------
 meson.build       |  8 ++++----
 meson_options.txt |  2 ++
 3 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/configure b/configure
index 5b18f4fac3..51b8c3290a 100755
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
@@ -4933,22 +4933,6 @@ EOF
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
 
@@ -6087,7 +6071,7 @@ if test "$skip_meson" = no; then
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dlibdaxctl=$libdaxctl \
+        -Dlibdaxctl=$libdaxctl -Dlibpmem=$libpmem \
         -Dgnutls=$gnutls -Dnettle=$nettle -Dgcrypt=$gcrypt -Dauth_pam=$auth_pam \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
         -Dattr=$attr -Ddefault_devices=$default_devices -Dvirglrenderer=$virglrenderer \
diff --git a/meson.build b/meson.build
index e530829105..e301eda3a5 100644
--- a/meson.build
+++ b/meson.build
@@ -1006,9 +1006,9 @@ if not get_option('libusb').auto() or have_system
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
@@ -2822,7 +2822,7 @@ summary_info += {'zstd support':      zstd.found()}
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



