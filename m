Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3B065B500
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 17:21:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCNXz-0008Lv-Np; Mon, 02 Jan 2023 11:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pCNXx-0008KY-Oa
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 11:20:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pCNXv-0008BQ-Q2
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 11:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672676418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CdAO3V5czTy0X88W7hYG5g3peA7hf+xDXphD1iqfGHM=;
 b=Fyw0PK/u9CUqkjPHqPVaY3gh3tA2rk7TTBEOnNCrJ1iXoOdmKssz6Wq6ku+j2KszIdfdIu
 GcgJeDgqAZfC9LgTMgXNAMqBrhcggiyRY1kVCuQkUHbvotLJ1jbnZlCvGNhvn0yvnnGhcA
 HMsRFNbLLkKOE+hnUZqt4zF5UoQ2Pp0=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-VwWBrId-P3awnfIB0wDSkQ-1; Mon, 02 Jan 2023 11:19:13 -0500
X-MC-Unique: VwWBrId-P3awnfIB0wDSkQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 e15-20020a0568301e4f00b006783b3a27c3so14862685otj.0
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 08:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CdAO3V5czTy0X88W7hYG5g3peA7hf+xDXphD1iqfGHM=;
 b=3G80XGdwZM/fpsHx9KF0AHgwR/FykrNzy0jbHrZRB4rHiYoWF7mAem1HrpQAgSJMMz
 oCa1Ds4a7jUCvyFH+kKYKhxGUXDOOr2P1jFu3ydI3fwVx3D+8Kkz8ztTWt7410AsbtvA
 ZbgafpKSH4iVvwa+evfD15Y+fyxL4LIbA4V0TXA63EMU6+s92Guo1zR9vkEE3DNA0BVY
 r6QMhIFLylVxgBgc7EcyCztdB6ESqkMpEB9tk37Sr2nsOfR9QUUOyXljL+Hk/ukbIO/R
 ORni8U3L3ka6jzJ1YLmAWaUGzcqgzrkrNLdQlmNj3lbC4eqBEjjhMSCkDlyGutgnWcCq
 nTZQ==
X-Gm-Message-State: AFqh2kqrVl7gjs5b+XDfSyB4yrCPKvn21WWlcVtJb8ganQobEYZklsfr
 4WetUH0exl2306gUtbKJ1Nozdr5tPsvFzo7aRgIYeLLNkegd5cgFlbKrIIfihJiZQprJdAXr52n
 tqyGcTElrhv8mcmSBSBQlRqDFz+ZtL+BSRaatuIRnl7jVWTlsWSZEMZ5b5+V3BDWkdOU=
X-Received: by 2002:a05:6870:ed4e:b0:144:c097:dc14 with SMTP id
 ex14-20020a056870ed4e00b00144c097dc14mr19911108oab.4.1672676352249; 
 Mon, 02 Jan 2023 08:19:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXul5p/kJRS2oQvbLM3fVX2Sa29GUMBG9x2mKKR5G87wP85+VsqoJlyIypXcus02BNGpMEQHzQ==
X-Received: by 2002:a05:6870:ed4e:b0:144:c097:dc14 with SMTP id
 ex14-20020a056870ed4e00b00144c097dc14mr19911098oab.4.1672676351871; 
 Mon, 02 Jan 2023 08:19:11 -0800 (PST)
Received: from casantos.remote.csb ([179.181.73.41])
 by smtp.gmail.com with ESMTPSA id
 cy4-20020a056870b68400b0013bc40b09dasm13086446oab.17.2023.01.02.08.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 08:19:11 -0800 (PST)
From: casantos@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Carlos Santos <casantos@redhat.com>
Subject: [PATCH] meson: allow disablind the installation of keymaps
Date: Mon,  2 Jan 2023 13:19:03 -0300
Message-Id: <20230102161903.3857354-1-casantos@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Carlos Santos <casantos@redhat.com>

There are situatuions in which the keyboard maps are not necessary (e.g.
when building only tools or linux-user emulator). Add an option to avoid
installing them, as already possible to do with firmware blobs.

Signed-off-by: Carlos Santos <casantos@redhat.com>
---
 configure                     | 2 ++
 meson_options.txt             | 2 ++
 pc-bios/keymaps/meson.build   | 6 ++++--
 scripts/meson-buildoptions.sh | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 789a4f6cc9..c6ed6a23d0 100755
--- a/configure
+++ b/configure
@@ -889,6 +889,8 @@ for opt do
   ;;
   --disable-blobs) meson_option_parse --disable-install-blobs ""
   ;;
+  --disable-keymaps) meson_option_parse --disable-install-keymaps ""
+  ;;
   --enable-vfio-user-server) vfio_user_server="enabled"
   ;;
   --disable-vfio-user-server) vfio_user_server="disabled"
diff --git a/meson_options.txt b/meson_options.txt
index 559a571b6b..be27137e98 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -48,6 +48,8 @@ option('module_upgrades', type : 'boolean', value : false,
        description: 'try to load modules from alternate paths for upgrades')
 option('install_blobs', type : 'boolean', value : true,
        description: 'install provided firmware blobs')
+option('install_keymaps', type : 'boolean', value : true,
+       description: 'install provided keyboard maps')
 option('sparse', type : 'feature', value : 'auto',
        description: 'sparse checker')
 option('guest_agent', type : 'feature', value : 'auto',
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 06c75e646b..7d80c23005 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -47,7 +47,7 @@ if native_qemu_keymap.found()
                        build_by_default: true,
                        output: km,
                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
-                       install: true,
+                       install: get_option('install_keymaps'),
                        install_dir: qemu_datadir / 'keymaps')
   endforeach
 
@@ -56,4 +56,6 @@ else
   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
 
-install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+if get_option('install_keymaps')
+  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+endif
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index aa6e30ea91..f17d9c196e 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -11,6 +11,8 @@ meson_options_help() {
   printf "%s\n" '  --datadir=VALUE          Data file directory [share]'
   printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better performance)'
   printf "%s\n" '  --disable-install-blobs  install provided firmware blobs'
+  printf "%s\n" '  --disable-install-keymaps'
+  printf "%s\n" '                           install provided keyboard maps'
   printf "%s\n" '  --docdir=VALUE           Base directory for documentation installation'
   printf "%s\n" '                           (can be empty) [share/doc]'
   printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
@@ -291,6 +293,8 @@ _meson_option_parse() {
     --includedir=*) quote_sh "-Dincludedir=$2" ;;
     --enable-install-blobs) printf "%s" -Dinstall_blobs=true ;;
     --disable-install-blobs) printf "%s" -Dinstall_blobs=false ;;
+    --enable-install-keymaps) printf "%s" -Dinstall_keymaps=true ;;
+    --disable-install-keymaps) printf "%s" -Dinstall_keymaps=false ;;
     --interp-prefix=*) quote_sh "-Dinterp_prefix=$2" ;;
     --enable-jack) printf "%s" -Djack=enabled ;;
     --disable-jack) printf "%s" -Djack=disabled ;;
-- 
2.31.1


