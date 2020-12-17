Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89672DCEDB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 10:54:01 +0100 (CET)
Received: from localhost ([::1]:49658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kppyx-00016P-Sl
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 04:54:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmY-0004ww-QV
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:10 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kppmP-0007m3-7H
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 04:41:09 -0500
Received: by mail-ed1-x52d.google.com with SMTP id cw27so27926110edb.5
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=22tlcBFy15WQt1L+NeZp+J8Yakjh01n3hd2Pt4rd9E0=;
 b=LAKme57YVdj8NuKQttmJHb115cJILdx6DQ0Dq08ESJ3l8tDuG04wYpTvciCqFDmmQF
 pKTjqXo8fMQjINcIExuC/XQ8iyP4E7s5SZArznBNw7brLsQ62hhCEY/VjnCgdsvnWLgk
 pLpcyVU3F8K8us50MfQv26OxfGhxOewZiROG1h7MiXXEVmLBZtFH5z99ey7YMfusYKnb
 LiPqnq/WkSStSpFRrn+k9yrQPW7Ak330WmsBgvQdht6uwnsHv7YCn0OntpcW1wDXQM5C
 ygSq+kt1v/8YpmMmLq2OIRN4xOxCiJ+RVCi3Ja0X4cHWkaoDsPPVQjf447FQH2hZ9SI7
 CwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=22tlcBFy15WQt1L+NeZp+J8Yakjh01n3hd2Pt4rd9E0=;
 b=K+wK0TzNezIvHl6nZTEgVFl99/0nLsZphW4W9lsgLo91EhOvDDrKTZjNjpNIaDzLGF
 7zTFFDamLGL7DD5sjgIIQPfKmRasi1wnO06T3KR1gG7LVk/MqXnYCulHQ6jPB54zaB6c
 yAKh454sAIGMsu18d9lXHU80rbcwah/NU53XBzZTLdFXZh30mz1/hRz9z5XvYKLuWV3Z
 fQ81rsHGUFlWAmSolSjVGtcvyWg8vUGvvMGYrWV5YbP3ewliuA19KHF9K+chfK+B2TQQ
 VDE4es4hc7M9Arq7Znut0TkS4+3isAl0F1qLv8bMylxy5v0Hwy4W/N7gIGLLpCyWnCSd
 OFSA==
X-Gm-Message-State: AOAM530m/VBcutxZLqf8VCcbJNfpbBfa2pd493ChVYMWmy1JTHlu7GeG
 fppItwUBjCa64kEKBamlJhwlQvOQq5g=
X-Google-Smtp-Source: ABdhPJwuiXdXgE+15PLhLSk7reNZVY0/H2luoUU0RF1ktE3JE0o++3qh1tRePOPSjcWE4ZCRRUxYMQ==
X-Received: by 2002:a50:f307:: with SMTP id p7mr37784054edm.368.1608198059871; 
 Thu, 17 Dec 2020 01:40:59 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id rs27sm3463677ejb.21.2020.12.17.01.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 01:40:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/18] virtfs: convert to meson
Date: Thu, 17 Dec 2020 10:40:41 +0100
Message-Id: <20201217094044.46462-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094044.46462-1-pbonzini@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 29 ++++-------------------------
 meson.build       | 24 ++++++++++++++++++++++--
 meson_options.txt | 11 +++++++----
 3 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/configure b/configure
index 00c2d61a96..11d6f40f92 100755
--- a/configure
+++ b/configure
@@ -316,7 +316,7 @@ netmap="no"
 sdl="auto"
 sdl_image="auto"
 virtiofsd="auto"
-virtfs="$default_feature"
+virtfs="auto"
 libudev="auto"
 mpath="auto"
 vnc="enabled"
@@ -1005,9 +1005,9 @@ for opt do
   ;;
   --enable-qom-cast-debug) qom_cast_debug="yes"
   ;;
-  --disable-virtfs) virtfs="no"
+  --disable-virtfs) virtfs="disabled"
   ;;
-  --enable-virtfs) virtfs="yes"
+  --enable-virtfs) virtfs="enabled"
   ;;
   --disable-libudev) libudev="disabled"
   ;;
@@ -5445,24 +5445,6 @@ if [ "$eventfd" = "yes" ]; then
   ivshmem=yes
 fi
 
-if test "$softmmu" = yes ; then
-  if test "$linux" = yes; then
-    if test "$virtfs" != no && test "$cap_ng" = yes && test "$attr" = yes ; then
-      virtfs=yes
-    else
-      if test "$virtfs" = yes; then
-        error_exit "VirtFS requires libcap-ng devel and libattr devel"
-      fi
-      virtfs=no
-    fi
-  else
-    if test "$virtfs" = yes; then
-      error_exit "VirtFS is supported only on Linux"
-    fi
-    virtfs=no
-  fi
-fi
-
 # Probe for guest agent support/options
 
 if [ "$guest_agent" != "no" ]; then
@@ -5919,9 +5901,6 @@ fi
 if test "$libattr" = "yes" ; then
   echo "CONFIG_LIBATTR=y" >> $config_host_mak
 fi
-if test "$virtfs" = "yes" ; then
-  echo "CONFIG_VIRTFS=y" >> $config_host_mak
-fi
 if test "$vhost_scsi" = "yes" ; then
   echo "CONFIG_VHOST_SCSI=y" >> $config_host_mak
 fi
@@ -6582,7 +6561,7 @@ NINJA=$ninja $meson setup \
         -Dcurl=$curl -Dglusterfs=$glusterfs -Dbzip2=$bzip2 -Dlibiscsi=$libiscsi \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
-        -Dzstd=$zstd -Dseccomp=$seccomp \
+        -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index a0132730d7..08d3586df5 100644
--- a/meson.build
+++ b/meson.build
@@ -959,6 +959,25 @@ endif
 # config-host.h #
 #################
 
+have_virtfs = (targetos == 'linux' and
+    have_system and
+    libattr.found() and
+    libcap_ng.found())
+
+if get_option('virtfs').enabled()
+  if not have_virtfs
+    if targetos != 'linux'
+      error('virtio-9p (virtfs) requires Linux')
+    elif not libcap_ng.found() or not libattr.found()
+      error('virtio-9p (virtfs) requires libcap-ng-devel and libattr-devel')
+    elif not have_system
+      error('virtio-9p (virtfs) needs system emulation support')
+    endif
+  endif
+elif get_option('virtfs').disabled()
+  have_virtfs = false
+endif
+
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
@@ -1001,6 +1020,7 @@ config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
 config_host_data.set('CONFIG_VNC_PNG', png.found())
 config_host_data.set('CONFIG_VNC_SASL', sasl.found())
+config_host_data.set('CONFIG_VIRTFS', have_virtfs)
 config_host_data.set('CONFIG_XKBCOMMON', xkbcommon.found())
 config_host_data.set('CONFIG_KEYUTILS', keyutils.found())
 config_host_data.set('CONFIG_GETTID', has_gettid)
@@ -1099,7 +1119,7 @@ host_kconfig = \
   ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
   ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=y'] : []) + \
   ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
-  ('CONFIG_VIRTFS' in config_host ? ['CONFIG_VIRTFS=y'] : []) + \
+  (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=y'] : [])
 
@@ -2287,7 +2307,7 @@ summary_info += {'mingw32 support':   targetos == 'windows'}
 summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
 summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
 summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
-summary_info += {'VirtFS support':    config_host.has_key('CONFIG_VIRTFS')}
+summary_info += {'VirtFS support':    have_virtfs}
 summary_info += {'build virtiofs daemon': have_virtiofsd}
 summary_info += {'Multipath support': mpathpersist.found()}
 summary_info += {'VNC support':       vnc.found()}
diff --git a/meson_options.txt b/meson_options.txt
index 1854a9639f..59a8a50e5b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -90,10 +90,6 @@ option('vnc_sasl', type : 'feature', value : 'auto',
        description: 'SASL authentication for VNC server')
 option('xkbcommon', type : 'feature', value : 'auto',
        description: 'xkbcommon support')
-option('virtiofsd', type: 'feature', value: 'auto',
-       description: 'build virtiofs daemon (virtiofsd)')
-option('vhost_user_blk_server', type: 'feature', value: 'auto',
-       description: 'build vhost-user-blk server')
 option('zstd', type : 'feature', value : 'auto',
        description: 'zstd compression support')
 option('fuse', type: 'feature', value: 'auto',
@@ -101,6 +97,13 @@ option('fuse', type: 'feature', value: 'auto',
 option('fuse_lseek', type : 'feature', value : 'auto',
        description: 'SEEK_HOLE/SEEK_DATA support for FUSE exports')
 
+option('vhost_user_blk_server', type: 'feature', value: 'auto',
+       description: 'build vhost-user-blk server')
+option('virtfs', type: 'feature', value: 'auto',
+       description: 'virtio-9p support')
+option('virtiofsd', type: 'feature', value: 'auto',
+       description: 'build virtiofs daemon (virtiofsd)')
+
 option('capstone', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
        description: 'Whether and how to find the capstone library')
-- 
2.29.2



