Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE82DFDA7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:42:24 +0100 (CET)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNKJ-0006eO-N2
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRQ-0005Ev-Ik
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:40 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRM-000803-Va
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:40 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k10so10103272wmi.3
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VHZYhA9oJgmEAppkwuoyrKj0wreNSbxgP7cRZdHvYKQ=;
 b=vcHvFyZGzSldT27NNip8dv//8k36fGRgBYtOydyqbVNyPV8U7NZPsVtMQh28SIpoBk
 YjRnJdZijIA417sXqc11CW1ndgg8IkxGh+rGoNq4Sbq0v8CWqu+MBPDMZRaB/N1lt1cg
 edpUP8nNoRZ7XoY9LTAmMxFbOxlIpsn92ZHM3nvKJdtgsadEW9OBLvfYFKUvMuh4mhmM
 bsR+ADEN6BAJNUiPieH0mJwzDoipQrot+ByZbRWOT6rf9b+caWIV93DY/XcqtDl+HwVj
 cfkyOPpwBMPGeV17h5KFQV+On1yKwPJ0vtvSf1sIt6qsU4PiH+EBOGGzdZTxwOV0uAHe
 43WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VHZYhA9oJgmEAppkwuoyrKj0wreNSbxgP7cRZdHvYKQ=;
 b=ayHHLPyoUj/7bd9Lrh23C4vzKVw8/A+H9nbJPNcrFxqR4wNk4zrfOsoO2X1a5jXNA4
 3t6w0JoCK63zR6PB0hIHShWhebDQXVkmAAv3scvtwtFC3NaHgW+qhMbMcLeStgYxjPUG
 XOvT4lEVBJKN66VnYFX/WLewrdSJVmgfMddw8MGYSveNDmY/B4ayyZNWM5KMrQvKVUqG
 Bv4SYQ9avFarZH++DXhNWqKxIIMX9cfy1iUY1dIou214whvIs+n7VXeT0iEaDbqgS5iK
 LjsLvZy4mA68MJBkRReWqBONcnkdXT8zgVauvgh7j3wkzB1jwe0xLfpVGFw/YBeqUkNU
 Xz7w==
X-Gm-Message-State: AOAM531Ab6qUEnF2AFbWfdRrGXacNuu/6KFMLe5ZrTF5RdWJDrOAgxrQ
 l/f6DTJo1F31ykx91arspNr5Tdf+stE=
X-Google-Smtp-Source: ABdhPJwg8SqQi1A9Bsv5DwzqIC13H6TZyQg2BDCESUXr2L3AB8biyZinH/CQ666iLHHEMC5Cuc/FyA==
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr17277423wmi.146.1608561935542; 
 Mon, 21 Dec 2020 06:45:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 53/55] meson.build: convert --with-default-devices to meson
Date: Mon, 21 Dec 2020 15:44:45 +0100
Message-Id: <20201221144447.26161-54-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
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
index 18af62a3e0..63ac12d5b8 100755
--- a/configure
+++ b/configure
@@ -446,7 +446,7 @@ sheepdog="no"
 libxml2="$default_feature"
 debug_mutex="no"
 libpmem="$default_feature"
-default_devices="yes"
+default_devices="true"
 plugins="no"
 fuzzing="no"
 rng_none="no"
@@ -943,9 +943,9 @@ for opt do
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
@@ -5539,11 +5539,6 @@ echo "GIT_UPDATE=$git_update" >> $config_host_mak
 
 echo "ARCH=$ARCH" >> $config_host_mak
 
-if test "$default_devices" = "yes" ; then
-  echo "CONFIG_MINIKCONF_MODE=--defconfig" >> $config_host_mak
-else
-  echo "CONFIG_MINIKCONF_MODE=--allnoconfig" >> $config_host_mak
-fi
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
@@ -6496,7 +6491,7 @@ NINJA=$ninja $meson setup \
         -Dlibnfs=$libnfs -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Dlibssh=$libssh -Drbd=$rbd -Dlzo=$lzo -Dsnappy=$snappy -Dlzfse=$lzfse \
         -Dzstd=$zstd -Dseccomp=$seccomp -Dvirtfs=$virtfs -Dcap_ng=$cap_ng \
-        -Dattr=$attr \
+        -Dattr=$attr -Ddefault_devices=$default_devices \
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
         -Dvhost_user_blk_server=$vhost_user_blk_server \
         -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek \
diff --git a/meson.build b/meson.build
index fef0c0f013..98d302cb22 100644
--- a/meson.build
+++ b/meson.build
@@ -1282,7 +1282,8 @@ foreach target : target_dirs
       output: config_devices_mak,
       depfile: config_devices_mak + '.d',
       capture: true,
-      command: [minikconf, config_host['CONFIG_MINIKCONF_MODE'],
+      command: [minikconf,
+                get_option('default_devices') ? '--defconfig' : '--allnoconfig',
                 config_devices_mak, '@DEPFILE@', '@INPUT@',
                 host_kconfig, accel_kconfig])
 
@@ -2476,7 +2477,7 @@ summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capst
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



