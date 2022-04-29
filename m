Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E783514FBD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:39:15 +0200 (CEST)
Received: from localhost ([::1]:58138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSiA-0005HU-It
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkST8-0002RQ-NB
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:43 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSz-0006BK-Dm
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:41 -0400
Received: by mail-ej1-x62f.google.com with SMTP id g6so16131457ejw.1
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MoXDJley6M6J8tvhtFK+iWMtfYto0nsDkqrlcnW/QnQ=;
 b=ZeYyLBADQqmmKMvzYdRpPBVzEi1Tu6a7xf0SLGBt2B7tRfN9m49cgyA777nY6yapMb
 XpOU80/u3enB7cMhGV91GfIcazoLUwSyYmtNTUAYPr+WPm1Se7WRQEbVIvxgzx6zzp9E
 LQ+fpmNjr1tiNmcysvEzS0gkbuQNI+nhGBT3XSHeVIHLVobe1IwhBeKCXgZE/C2OCCNL
 8LC9dsXjSEnWpSUDRLR3cQS5H1Sx9m3uKNzRRodQLUtn8du2QJQ7DXWWyWyyEdzjuLiV
 86RIRxz9OhTX6PMNS+b7y12xgzKjI7uIze03u0Y9/hSPkadUT97tE3l21qaSGUSYkjnw
 SGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MoXDJley6M6J8tvhtFK+iWMtfYto0nsDkqrlcnW/QnQ=;
 b=lK/O9Rq1v26aSNGr0hOJf9DmS/gi58UebGburOj9N0zxS3S/pXe6k+FMqIdUwsUwfv
 ho0DcfN57AoypmSEiBFqTvxyHlVT+dx9th/Y1LFd98PDvGf4wMWXToy1FJ3+2eL2wniR
 pq9AbgpbIr5ar9wc7QJVo4iSvF0Nb8T33cMVm1Dyj9pxZZ1iHRNT9EX/KK3Yhs7b4P7V
 mf8WGtmItAyPJNt4bJZNazfToP1FtjWJXYc0odEWWtzAIly7sTjaf/MAECWTGYto1x/o
 aHOa1lWeZsn7oou0rMs0ppetpxKpUgMtDsSMGG4E8UR5T1P6bxV4NvZNkHV8YhcXvv7j
 7+Uw==
X-Gm-Message-State: AOAM531fAyUAGFZ6rPc/8XTI1nFPeJyguwDUN9wkpPZ5A9nALCJ3nSdG
 yoAgopCsOdYpRj+2ATySeFyUOfbzjrEF/A==
X-Google-Smtp-Source: ABdhPJzRv9yMCcleoMxgsa1HZLbIW89KXtDBvZXUOVC4UW/jE16NlwsNNTnC1FQQzpjopPuu4FbrYw==
X-Received: by 2002:a17:907:3d92:b0:6f3:dd41:c87 with SMTP id
 he18-20020a1709073d9200b006f3dd410c87mr8420617ejc.38.1651245811845; 
 Fri, 29 Apr 2022 08:23:31 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/25] meson: create have_vhost_* variables
Date: Fri, 29 Apr 2022 17:23:09 +0200
Message-Id: <20220429152312.335715-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using Meson options rather than config-host.h, the "when" clauses
have to be changed to if statements (which is not necessarily great,
though at least it highlights which parts of the build are per-target
and which are not).

Do that before moving vhost logic to meson.build, though for now
the variables are just based on config-host.mak data.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build       | 31 ++++++++++++++++++++-----------
 tests/meson.build |  2 +-
 tools/meson.build |  2 +-
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/meson.build b/meson.build
index 53654fc08e..4545905360 100644
--- a/meson.build
+++ b/meson.build
@@ -312,6 +312,15 @@ have_tpm = get_option('tpm') \
   .require(targetos != 'windows', error_message: 'TPM emulation only available on POSIX systems') \
   .allowed()
 
+# vhost
+have_vhost_user = 'CONFIG_VHOST_USER' in config_host
+have_vhost_vdpa = 'CONFIG_VHOST_VDPA' in config_host
+have_vhost_kernel = 'CONFIG_VHOST_KERNEL' in config_host
+have_vhost_net_user = 'CONFIG_VHOST_NET_USER' in config_host
+have_vhost_net_vdpa = 'CONFIG_VHOST_NET_VDPA' in config_host
+have_vhost_net = 'CONFIG_VHOST_NET' in config_host
+have_vhost_user_crypto = 'CONFIG_VHOST_CRYPTO' in config_host
+
 # Target-specific libraries and flags
 libm = cc.find_library('m', required: false)
 threads = dependency('threads')
@@ -1442,7 +1451,7 @@ has_statx_mnt_id = cc.links(statx_mnt_id_test)
 have_vhost_user_blk_server = get_option('vhost_user_blk_server') \
   .require(targetos == 'linux',
            error_message: 'vhost_user_blk_server requires linux') \
-  .require('CONFIG_VHOST_USER' in config_host,
+  .require(have_vhost_user,
            error_message: 'vhost_user_blk_server requires vhost-user support') \
   .disable_auto_if(not have_system) \
   .allowed()
@@ -2296,9 +2305,9 @@ host_kconfig = \
   (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
   (opengl.found() ? ['CONFIG_OPENGL=y'] : []) + \
   (x11.found() ? ['CONFIG_X11=y'] : []) + \
-  ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
-  ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=y'] : []) + \
-  ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
+  (have_vhost_user ? ['CONFIG_VHOST_USER=y'] : []) + \
+  (have_vhost_vdpa ? ['CONFIG_VHOST_VDPA=y'] : []) + \
+  (have_vhost_kernel ? ['CONFIG_VHOST_KERNEL=y'] : []) + \
   (have_virtfs ? ['CONFIG_VIRTFS=y'] : []) + \
   ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=y'] : []) + \
   (have_pvrdma ? ['CONFIG_PVRDMA=y'] : []) + \
@@ -2980,7 +2989,7 @@ if have_system or have_user
 endif
 
 vhost_user = not_found
-if targetos == 'linux' and 'CONFIG_VHOST_USER' in config_host
+if targetos == 'linux' and have_vhost_user
   libvhost_user = subproject('libvhost-user')
   vhost_user = libvhost_user.get_variable('vhost_user_dep')
 endif
@@ -3561,7 +3570,7 @@ if have_tools
              dependencies: qemuutil,
              install: true)
 
-  if 'CONFIG_VHOST_USER' in config_host
+  if have_vhost_user
     subdir('contrib/vhost-user-blk')
     subdir('contrib/vhost-user-gpu')
     subdir('contrib/vhost-user-input')
@@ -3687,12 +3696,12 @@ if 'simple' in get_option('trace_backends')
 endif
 summary_info += {'D-Bus display':     dbus_display}
 summary_info += {'QOM debugging':     get_option('qom_cast_debug')}
-summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
-summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
-summary_info += {'vhost-crypto support': config_host.has_key('CONFIG_VHOST_CRYPTO')}
-summary_info += {'vhost-user support': config_host.has_key('CONFIG_VHOST_USER')}
+summary_info += {'vhost-kernel support': have_vhost_kernel}
+summary_info += {'vhost-net support': have_vhost_net}
+summary_info += {'vhost-user support': have_vhost_user}
+summary_info += {'vhost-user-crypto support': have_vhost_user_crypto}
 summary_info += {'vhost-user-blk server support': have_vhost_user_blk_server}
-summary_info += {'vhost-vdpa support': config_host.has_key('CONFIG_VHOST_VDPA')}
+summary_info += {'vhost-vdpa support': have_vhost_vdpa}
 summary_info += {'build guest agent': have_ga}
 summary(summary_info, bool_yn: true, section: 'Configurable features')
 
diff --git a/tests/meson.build b/tests/meson.build
index 4f691e8465..8e318ec513 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -68,7 +68,7 @@ test_deps = {
   'test-qht-par': qht_bench,
 }
 
-if have_tools and 'CONFIG_VHOST_USER' in config_host and 'CONFIG_LINUX' in config_host
+if have_tools and have_vhost_user and 'CONFIG_LINUX' in config_host
   executable('vhost-user-bridge',
              sources: files('vhost-user-bridge.c'),
              dependencies: [qemuutil, vhost_user])
diff --git a/tools/meson.build b/tools/meson.build
index 46977af84f..10eb3a043f 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -3,7 +3,7 @@ have_virtiofsd = get_option('virtiofsd') \
              error_message: 'virtiofsd requires Linux') \
     .require(seccomp.found() and libcap_ng.found(),
              error_message: 'virtiofsd requires libcap-ng-devel and seccomp-devel') \
-    .require('CONFIG_VHOST_USER' in config_host,
+    .require(have_vhost_user,
              error_message: 'virtiofsd needs vhost-user-support') \
     .disable_auto_if(not have_tools and not have_system) \
     .allowed()
-- 
2.35.1



