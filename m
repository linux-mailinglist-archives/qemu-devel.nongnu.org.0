Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C044E508D0F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:18:49 +0200 (CEST)
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhD2W-0004Yw-RX
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCMC-0002G1-VC
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:35:05 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCMB-00013K-6z
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:35:04 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso1481777wml.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/0zAoQsiX4u9I3ungDt9Q7kGOaiqUTIxH9IA1KKGoWo=;
 b=pLMQzdvUReYOZkqdYcjo+EhZ3IJ6ybMMxAUraYXTaTVtM+gcorc+zHSa2/kR+RSWpi
 hnPFg4+ehAihwoUAQWjShVkJOqzJQcOOXoqbgvu22YHRnOQVvr9d7MTOSffkKL1J4Pbp
 OiiV6Kj6LoCd57+XadFZj5a1YPkWCUn0D/qGN5W3mfESyIh7QL6wti/gbmRpHZ/IRPs+
 Qg3UgO/W5arSRAXjycMGIFAZzxcuA2rhq1pMZIheuLUrDA1BV7vEZx2u7E9bc9eqP3iB
 8dwKmbFNactXS0qErKG0fdtxInghmXpJ1wF5NcQ1Z+zBUY4DLM0fW0D4tPKcIpy0mF0X
 GtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/0zAoQsiX4u9I3ungDt9Q7kGOaiqUTIxH9IA1KKGoWo=;
 b=ePhUhtFpDOKjPXD+ehGSmaOOswwoD8Sbh+4bIFa0VFgD2UaA74t5xHHfEOnZ7yZGeq
 hUg6kcGKUIgIaUSaalmCr8BCnhF4UcW/zWtN7kfNdp6pbK4BR8UTerAWFsZFcQR9/Bqu
 My6rUX9AffIf03uWvf8ICf/ixkAFab/ogl8Y5iIdGl9XMlbfxN28WdpSnZ3qr9RDT/4/
 ESty9YccHTYAucEmxqcSXIFpiIQTcieJkRA70xyvsiCu9qED8cChqBoTuPFm52C4uHtf
 efu/8PYMZtkAPN7K98mMJuLjwSt+Dxp3MBwIKepbSCxUacOdxK2qMxUA8ZL3hdbMtOVv
 Xqfg==
X-Gm-Message-State: AOAM530f3bbh420n5aZIXLI/yE3PD3dOeHffV9zevsUwYvbYUGW0Vux1
 nDMDC7r/AIIGHSpl11NHPAZtzRpSiytvcQ==
X-Google-Smtp-Source: ABdhPJwfYQFMZrJxhrfDxAx8GUN1KagNaa13qrtk95doznt4TYrR1DgFb603PUfpKoI3mbsCg8sryw==
X-Received: by 2002:a05:600c:4f55:b0:38f:f897:28d1 with SMTP id
 m21-20020a05600c4f5500b0038ff89728d1mr4363672wmq.97.1650468901516; 
 Wed, 20 Apr 2022 08:35:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:35:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/34] meson: create have_vhost_* variables
Date: Wed, 20 Apr 2022 17:34:05 +0200
Message-Id: <20220420153407.73926-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using Meson options rather than config-host.h, the "when" clauses
have to be changed to if statements (which is not necessarily great,
though at least it highlights which parts of the build are per-target
and which are not).

Do that before moving vhost logic to meson.build, though for now
the variables are just based on config-host.mak data.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build       | 31 ++++++++++++++++++++-----------
 tests/meson.build |  2 +-
 tools/meson.build |  2 +-
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/meson.build b/meson.build
index 870dd8dee0..5b5eb442c4 100644
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
@@ -1440,7 +1449,7 @@ has_statx_mnt_id = cc.links(statx_mnt_id_test)
 have_vhost_user_blk_server = get_option('vhost_user_blk_server') \
   .require(targetos == 'linux',
            error_message: 'vhost_user_blk_server requires linux') \
-  .require('CONFIG_VHOST_USER' in config_host,
+  .require(have_vhost_user,
            error_message: 'vhost_user_blk_server requires vhost-user support') \
   .disable_auto_if(not have_system) \
   .allowed()
@@ -2283,9 +2292,9 @@ host_kconfig = \
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
@@ -2967,7 +2976,7 @@ if have_system or have_user
 endif
 
 vhost_user = not_found
-if targetos == 'linux' and 'CONFIG_VHOST_USER' in config_host
+if targetos == 'linux' and have_vhost_user
   libvhost_user = subproject('libvhost-user')
   vhost_user = libvhost_user.get_variable('vhost_user_dep')
 endif
@@ -3548,7 +3557,7 @@ if have_tools
              dependencies: qemuutil,
              install: true)
 
-  if 'CONFIG_VHOST_USER' in config_host
+  if have_vhost_user
     subdir('contrib/vhost-user-blk')
     subdir('contrib/vhost-user-gpu')
     subdir('contrib/vhost-user-input')
@@ -3674,12 +3683,12 @@ if 'simple' in get_option('trace_backends')
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



