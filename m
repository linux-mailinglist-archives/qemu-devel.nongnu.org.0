Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402D239F544
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:41:46 +0200 (CEST)
Received: from localhost ([::1]:54600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqa77-0007gW-0T
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpL-0006nQ-Oj
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpI-000847-Vx
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:23 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso1673874wmi.3
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QxIxKqTJzlnO5FbyAsTgEah7iNWff4xl/B3WeX6eUjg=;
 b=qhBlSGE9FjUpoNHuz+uTZYs0BE/57HKNEbjJqf3W51EEww7+RXk9/q8xE+oRPUhDKy
 84gpraOaHJ8eWJTl3wzwSkkNfZQy0svf3IoJRPBl2hloOE/lxIX9C/vNbJAV84sWQujs
 PM4vLwF5PH4nXDp3iU7qHmbvNOOK1cXyAjR6eT/MV4IIjfgwlH1ZQ47DQYr75z8m9oDj
 alzIB2U1WNDxrQO5JiX5Dma20jxQmAmXkhFhEn80O73whS2ZvEiqiNE7t+jSg173sEaB
 xikyn2l1DKPx5Wwvr/F5tysA+8uZKWpG4LBMJ9aEBzuUF/GwlKG3UciLNyrTCaO7ggCR
 Tf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QxIxKqTJzlnO5FbyAsTgEah7iNWff4xl/B3WeX6eUjg=;
 b=sB4QCGzSwtSVYeCZNdywDJjkj6y0l8Zw69Tg9g8LaxEnOuH8HOy6PON5eWWMLxUQgj
 Z6PjuhRc0ock3VCx3kIjZR4Yb6snBaUdwNvzGYf4i0r336T0s8KTA1CzbVXYUg0YUkEm
 G/P4gwM5sxuE6mW+0RJy87kIoHjyX54srtzLLW37U2rROo3OZrneP5pqzCPgOam0VS6d
 nxqqgCd6T+BQrn0VLNp5Sc1ec0FUjFe1ElYLXHD9uC+YAvQsIYy94dhMEl61U3b4UgLP
 hIsS9AGZTgSroMSh0lpN9PBeK2NLKW4osLceTCO2b38vINByiTBadEL3WmKzmihRwscM
 FQmA==
X-Gm-Message-State: AOAM531JNtl1l0Fnq0pE4hnfZblJxgyp74n9Y0Y8Cewa5C6pQWrslFwl
 SpUn/wfHUIOSpLPURtsn2jt3BJnOsWW9eQ==
X-Google-Smtp-Source: ABdhPJzUqceDE1FXqvmax75LvK2u2g+lx/roHLfJkgYGLINVWncqww8rm3ksmFP+c2mkGMx/SbgExA==
X-Received: by 2002:a05:600c:1c28:: with SMTP id
 j40mr3722757wms.102.1623151398307; 
 Tue, 08 Jun 2021 04:23:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/26] configure, meson: move CONFIG_IVSHMEM to meson
Date: Tue,  8 Jun 2021 13:22:52 +0200
Message-Id: <20210608112301.402434-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
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

This is a duplicate of CONFIG_EVENTFD, handle it directly in meson.build.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure              | 8 --------
 docs/devel/kconfig.rst | 2 +-
 meson.build            | 5 +++--
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 2c0f16488e..c95259435f 100755
--- a/configure
+++ b/configure
@@ -5038,11 +5038,6 @@ if test "$mingw32" = "yes" ; then
     done
 fi
 
-# We can only support ivshmem if we have eventfd
-if [ "$eventfd" = "yes" ]; then
-  ivshmem=yes
-fi
-
 # Probe for guest agent support/options
 
 if [ "$guest_agent" != "no" ]; then
@@ -5638,9 +5633,6 @@ fi
 if test "$have_getrandom" = "yes" ; then
   echo "CONFIG_GETRANDOM=y" >> $config_host_mak
 fi
-if test "$ivshmem" = "yes" ; then
-  echo "CONFIG_IVSHMEM=y" >> $config_host_mak
-fi
 if test "$debug_mutex" = "yes" ; then
   echo "CONFIG_DEBUG_MUTEX=y" >> $config_host_mak
 fi
diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index cb2d7ffac0..a1cdbec751 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -303,5 +303,5 @@ variable::
     host_kconfig = \
       ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
       ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
-      ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=y'] : []) + \
+      (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
       ...
diff --git a/meson.build b/meson.build
index 38f6f193f5..3be3ef0982 100644
--- a/meson.build
+++ b/meson.build
@@ -1337,10 +1337,11 @@ if link_language == 'cpp'
   }
 endif
 
+have_ivshmem = config_host.has_key('CONFIG_EVENTFD')
 host_kconfig = \
   ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=y'] : []) + \
   ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=y'] : []) + \
-  ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=y'] : []) + \
+  (have_ivshmem ? ['CONFIG_IVSHMEM=y'] : []) + \
   ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=y'] : []) + \
   (x11.found() ? ['CONFIG_X11=y'] : []) + \
   ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=y'] : []) + \
@@ -2499,7 +2500,7 @@ if have_tools
                install: true)
   endif
 
-  if 'CONFIG_IVSHMEM' in config_host
+  if have_ivshmem
     subdir('contrib/ivshmem-client')
     subdir('contrib/ivshmem-server')
   endif
-- 
2.31.1



