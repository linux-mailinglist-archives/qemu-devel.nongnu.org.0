Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85632AF051
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:13:36 +0100 (CET)
Received: from localhost ([::1]:54318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcp0J-0005aU-RX
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcowI-0001f2-SH
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:09:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcowF-0006pA-Sc
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605096563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7OU9Wnarb8BK3cIihbrbS+fzlvw4ENVPepjzFPS9F4w=;
 b=StMmVOFFMRIkdvRWAw2JfE5RvGNKbFZEvEePqQ/wQ5hP4hTgnn9mYANs2XCK3gn1b2tIkC
 c7+N84ouX4jNIoTJpD8FzIo8SCRwVqCWgzP4uvg2QtGJuUefagfq1jMzDuX2coI/zW0O0R
 bCAbArwyn6sHmi9/pMyiDUHSodhCrA8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-eXV7FhyZPc-CfV8jHAGKMw-1; Wed, 11 Nov 2020 07:09:21 -0500
X-MC-Unique: eXV7FhyZPc-CfV8jHAGKMw-1
Received: by mail-wm1-f69.google.com with SMTP id y26so687967wmj.7
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 04:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7OU9Wnarb8BK3cIihbrbS+fzlvw4ENVPepjzFPS9F4w=;
 b=PmDo3BYpfccBeHszOLH5+hpdcam9UfM8rASN8RcZNDMeAxpFrsxwt+Gan2eOAZm91L
 5eqtu7ICCzCLhsToN8SpXhFeleQJNoM8PGMgnpzO+DxAVvngZSvZyIfaCM1ewyq6ex11
 +zqfS00RiaugZEm3U+TgT8m9nCKTMUcVdsTh0pk73DS2Rt0wiuJywTdHcTP03m4MVamK
 xyvfBrZf0Yp3/nNIUXUpp50UkW7y6jvTGAttRVcyaM+MAHtMSd5+Q8vQH+jXyaQk37KB
 ik8P9eERqtYPZO+LGI5y0O0WCx1WR2mZHxXlukZaFW1J8Jb/AUp0VEAAtgTa0pmMSc2J
 VrRg==
X-Gm-Message-State: AOAM533jRTtBEYV3q30nz5QBi5v8O0/OwSfJ3VKk+n4VYVbRS7J8EfAc
 UjGqlha0ZTa5oRMD2f0UPkbUoxLaFQvTVIPjeiQdnfONshjKZXnww4++I3Z2cRb5ZOksFF735df
 3jBC069JQ3f47dcW8gDQi9AjPkkJ6PYVQCE28Yy9zMVFaPfM2cu9bk2XIlJi52xMr
X-Received: by 2002:adf:df86:: with SMTP id z6mr26930318wrl.57.1605096559578; 
 Wed, 11 Nov 2020 04:09:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnVXutGoISeRAb7wohlWo5L34u5L3llwo9L3Gm2HNKQJO0hpfBdpgHarT0eoiR2wchG9GQGQ==
X-Received: by 2002:adf:df86:: with SMTP id z6mr26930293wrl.57.1605096559379; 
 Wed, 11 Nov 2020 04:09:19 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id r10sm2276470wmg.16.2020.11.11.04.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 04:09:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 1/4] meson: move vhost_user_blk_server to
 meson.build
Date: Wed, 11 Nov 2020 13:09:09 +0100
Message-Id: <20201111120912.3245574-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111120912.3245574-1-philmd@redhat.com>
References: <20201111120912.3245574-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The --enable/disable-vhost-user-blk-server options were implemented in
./configure. There has been confusion about them and part of the problem
is that the shell syntax used for setting the default value is not easy
to read. Move the option over to meson where the conditions are easier
to understand:

  have_vhost_user_blk_server = (targetos == 'linux')

  if get_option('vhost_user_blk_server').enabled()
      if targetos != 'linux'
          error('vhost_user_blk_server requires linux')
      endif
  elif get_option('vhost_user_blk_server').disabled() or not have_system
      have_vhost_user_blk_server = false
  endif

This patch does not change behavior.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201110171121.1265142-2-stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure                | 16 ++++------------
 meson.build              | 12 ++++++++++++
 block/export/meson.build |  5 ++++-
 meson_options.txt        |  2 ++
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/configure b/configure
index 4cef321d9dc..516f28a0888 100755
--- a/configure
+++ b/configure
@@ -329,7 +329,7 @@ vhost_crypto=""
 vhost_scsi=""
 vhost_vsock=""
 vhost_user=""
-vhost_user_blk_server=""
+vhost_user_blk_server="auto"
 vhost_user_fs=""
 kvm="auto"
 hax="auto"
@@ -1247,9 +1247,9 @@ for opt do
   ;;
   --enable-vhost-vsock) vhost_vsock="yes"
   ;;
-  --disable-vhost-user-blk-server) vhost_user_blk_server="no"
+  --disable-vhost-user-blk-server) vhost_user_blk_server="disabled"
   ;;
-  --enable-vhost-user-blk-server) vhost_user_blk_server="yes"
+  --enable-vhost-user-blk-server) vhost_user_blk_server="enabled"
   ;;
   --disable-vhost-user-fs) vhost_user_fs="no"
   ;;
@@ -2390,12 +2390,6 @@ if test "$vhost_net" = ""; then
   test "$vhost_kernel" = "yes" && vhost_net=yes
 fi
 
-# libvhost-user is Linux-only
-test "$vhost_user_blk_server" = "" && vhost_user_blk_server=$linux
-if test "$vhost_user_blk_server" = "yes" && test "$linux" = "no"; then
-  error_exit "--enable-vhost-user-blk-server is only available on Linux"
-fi
-
 ##########################################
 # pkg-config probe
 
@@ -6289,9 +6283,6 @@ fi
 if test "$vhost_vdpa" = "yes" ; then
   echo "CONFIG_VHOST_VDPA=y" >> $config_host_mak
 fi
-if test "$vhost_user_blk_server" = "yes" ; then
-  echo "CONFIG_VHOST_USER_BLK_SERVER=y" >> $config_host_mak
-fi
 if test "$vhost_user_fs" = "yes" ; then
   echo "CONFIG_VHOST_USER_FS=y" >> $config_host_mak
 fi
@@ -7012,6 +7003,7 @@ NINJA=$ninja $meson setup \
         -Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
         -Diconv=$iconv -Dcurses=$curses -Dlibudev=$libudev\
         -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
+        -Dvhost_user_blk_server=$vhost_user_blk_server \
         $cross_arg \
         "$PWD" "$source_path"
 
diff --git a/meson.build b/meson.build
index b4736203219..4b789f18c17 100644
--- a/meson.build
+++ b/meson.build
@@ -751,6 +751,16 @@
 
 has_statx = cc.links(statx_test)
 
+have_vhost_user_blk_server = (targetos == 'linux')
+
+if get_option('vhost_user_blk_server').enabled()
+    if targetos != 'linux'
+        error('vhost_user_blk_server requires linux')
+    endif
+elif get_option('vhost_user_blk_server').disabled() or not have_system
+    have_vhost_user_blk_server = false
+endif
+
 #################
 # config-host.h #
 #################
@@ -775,6 +785,7 @@
 config_host_data.set('CONFIG_CURSES', curses.found())
 config_host_data.set('CONFIG_SDL', sdl.found())
 config_host_data.set('CONFIG_SDL_IMAGE', sdl_image.found())
+config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
 config_host_data.set('CONFIG_VNC_PNG', png.found())
@@ -2103,6 +2114,7 @@
 summary_info += {'vhost-scsi support': config_host.has_key('CONFIG_VHOST_SCSI')}
 summary_info += {'vhost-vsock support': config_host.has_key('CONFIG_VHOST_VSOCK')}
 summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_KERNEL')}
+summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
 summary_info += {'vhost-user-fs support': config_host.has_key('CONFIG_VHOST_USER_FS')}
 summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
 summary_info += {'Trace backends':    config_host['TRACE_BACKENDS']}
diff --git a/block/export/meson.build b/block/export/meson.build
index 19526435d84..135b356775b 100644
--- a/block/export/meson.build
+++ b/block/export/meson.build
@@ -1,2 +1,5 @@
 blockdev_ss.add(files('export.c'))
-blockdev_ss.add(when: 'CONFIG_VHOST_USER_BLK_SERVER', if_true: files('vhost-user-blk-server.c'))
+
+if have_vhost_user_blk_server
+    blockdev_ss.add(files('vhost-user-blk-server.c'))
+endif
diff --git a/meson_options.txt b/meson_options.txt
index b4f18018752..f6f64785fe7 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -64,6 +64,8 @@ option('xkbcommon', type : 'feature', value : 'auto',
        description: 'xkbcommon support')
 option('virtiofsd', type: 'feature', value: 'auto',
        description: 'build virtiofs daemon (virtiofsd)')
+option('vhost_user_blk_server', type: 'feature', value: 'auto',
+       description: 'build vhost-user-blk server')
 
 option('capstone', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
-- 
2.26.2


