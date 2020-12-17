Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642262DCED7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:52:33 +0100 (CET)
Received: from localhost ([::1]:45460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppxY-0007mW-E5
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmZ-0004yd-MR
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:11 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:38965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmS-0007n3-Cu
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:11 -0500
Received: by mail-ej1-x630.google.com with SMTP id n26so36889009eju.6
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CoTdu9oftQn1Dqcp0qnrY06GwGq+xDV3ZKjVQ17RKzU=;
 b=WEBRK9xJnuVB/aAu8q4m2KOceDGnMYhm7V5zV1n0cbBcD7IPmgUtmEzzBcZtyQL28V
 FAGJXoDOfACAdnW6W1sQhwMJ8pK01lBluIXMcA2EQZgIfu8Q5XMxq+3vNmqDkZmdrszw
 kC8dOSrtXX7FQooe13MzjwbpSBXSPBTHvbEOL/aBGjhzTxGKCdFKJdJ+YtG88bWYjyLB
 54XNhaI+3yDsaYIl1rPi154/Z4M1dRtLj/8y0/JUiFHW1dTHpAGW8IYVUxATbdcqbrqI
 2We4q8kTPrA6Fd9z/1pAkdek4RJpO90FYKSLJoALJwKPkcSMikpg2y3tFdGNxGhyQd28
 T8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CoTdu9oftQn1Dqcp0qnrY06GwGq+xDV3ZKjVQ17RKzU=;
 b=uA/2VSV+0dt9u3D3lgeN4dBTKj+sb6mHbp3GX5Gcxdto8qqgAT5SQ2ju4RSfSkj8yB
 w2S1rQBdQEqycK+mRjaZ2A9EZL4DjvtWWFRmWwQM0IZJWZlD+2/NamRIABspTs9QlTd9
 yl22/ii2KPHfCjSizLTrbh9MEAY6+5OfBQzOsfucSe/V+RMuXRy1l9SULbiWu30fZWcx
 Z1Aig0zl3H1/iVF9p0kOK18WtN0v+y1DGkj08Q1jVmgYX7BHTIpz6vk4NuhBcw59cre5
 bbeZMrbzxNzJuUOwK23aH9WVpSBifCkcFZ5DQFI4sIcSB6tJOt/IU1fvsDUZOlFN8GOY
 V7tw==
X-Gm-Message-State: AOAM531+ILGb2m5/JWZcmWN+HjAdtYctbuartaG8Luj8ogVxV7MgKahE
 aHYTDZ15lMIhYmG28g3V1Tz2OwOOtWs=
X-Google-Smtp-Source: ABdhPJxVkIr74xlcTmGVHGRssUy5CPwd66ApFTqsuO+5n72wZp4FlO9mJeMXWj8k+HEj8RY4TlAQ0g==
X-Received: by 2002:a17:906:af75:: with SMTP id
 os21mr17722693ejb.330.1608198062400; 
 Thu, 17 Dec 2020 01:41:02 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:41:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/18] meson.build: convert --with-default-devices to meson
Date: Thu, 17 Dec 2020 10:40:44 +0100
Message-Id: <20201217094044.46462-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: =?UTF-8?q?Marc-Andr=C3=83=C2=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass the boolean option directly instead of writing
CONFIG_MINIKCONF_MODE to config-host.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 13 ++++---------
 meson.build       |  5 +++--
 meson_options.txt |  2 ++
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 420663d69a..ab4b826755 100755
--- a/configure
+++ b/configure
@@ -447,7 +447,7 @@ sheepdog="no"
 libxml2="$default_feature"
 debug_mutex="no"
 libpmem="$default_feature"
-default_devices="yes"
+default_devices="true"
 plugins="no"
 fuzzing="no"
 rng_none="no"
@@ -944,9 +944,9 @@ for opt do
   ;;
   --with-trace-file=*) trace_file="$optarg"
   ;;
-  --with-default-devices) default_devices="yes"
+  --with-default-devices) default_devices="true"
   ;;
-  --without-default-devices) default_devices="no"
+  --without-default-devices) default_devices="false"
   ;;
   --without-default-features) # processed above
   ;;
@@ -5541,11 +5541,6 @@ echo "GIT_UPDATE=$git_update" >> $config_host_mak
 
 echo "ARCH=$ARCH" >> $config_host_mak
 
-if test "$default_devices" = "yes" ; then
-  echo "CONFIG_MINIKCONF_MODE=--defconfig" >> $config_host_mak
-else
-  echo "CONFIG_MINIKCONF_MODE=--allnoconfig" >> $config_host_mak
-fi
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
@@ -6498,7 +6493,7 @@ NINJA=$ninja $meson setup \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
-        -Dattr=$attr \
+        -Dattr=$attr -Ddefault_devices=$default_devices \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index 341eadaa5c..4d331405e4 100644
--- a/meson.build
+++ b/meson.build
@@ -1276,7 +1276,8 @@ foreach target : target_dirs
       output: config_devices_mak,
       depfile: config_devices_mak + '.d',
       capture: true,
-      command: [minikconf, config_host['CONFIG_MINIKCONF_MODE'],
+      command: [minikconf,
+                get_option('default_devices') ? '--defconfig' : '--allnoconfig',
                 config_devices_mak, '@DEPFILE@', '@INPUT@',
                 host_kconfig, accel_kconfig])
 
@@ -2469,7 +2470,7 @@ summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capst
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
-summary_info += {'default devices':   config_host['CONFIG_MINIKCONF_MODE'] == '--defconfig'}
+summary_info += {'default devices':   get_option('default_devices')}
 summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
 summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
 if config_host.has_key('HAVE_GDB_BIN')
diff --git a/meson_options.txt b/meson_options.txt
index 8fcec056cd..1d4a71772e 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -7,6 +7,8 @@ option('qemu_firmwarepath', type : 'string', value : '',
 option('sphinx_build', type : 'string', value : '',
        description: 'Use specified sphinx-build [$sphinx_build] for building document (default to be empty)')
 
+option('default_devices', type : 'boolean', value : true,
+       description: 'Include a default selection of devices in emulators')
 option('docs', type : 'feature', value : 'auto',
        description: 'Documentations build support')
 option('gettext', type : 'feature', value : 'auto',
-- 
2.29.2


