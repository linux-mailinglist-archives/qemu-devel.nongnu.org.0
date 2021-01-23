Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97604301327
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 06:00:25 +0100 (CET)
Received: from localhost ([::1]:36968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3B28-0003qk-Ju
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 00:00:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3AyY-0006sb-7t; Fri, 22 Jan 2021 23:56:42 -0500
Received: from mail-pl1-f181.google.com ([209.85.214.181]:40938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l3AyW-0005pQ-N7; Fri, 22 Jan 2021 23:56:41 -0500
Received: by mail-pl1-f181.google.com with SMTP id q4so4444905plr.7;
 Fri, 22 Jan 2021 20:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RdGbdMFIUd62J0vMmSPnX8R1crlr0ThF2wH5cyxIl8s=;
 b=GD5SEnjRe9BVnqPKdbeYO1Y+eoayRFyNSzt2tXX/h+s5sNpig9hdCscUaeZGePmDOz
 abZXqbJh7iNbIoSEmn2Cp4Stv94wg1eJO6nRl/W8px8F+L9dweRk01IjpuJUCfhX8n8L
 dcrKCdCuaeWwE0pVvxRLoIikHoJocscFqx58202Y9jIqdVr6Z6dk2xYAFMvYi/4v3VsG
 Tllaj6c0/KAcz2meRw/1EtoC88YjASoGne2vTjzoYYU58I4DX0EMtzcLnfTwmjDjmdN0
 phIpvZRDggyeZte3lph2gOczN+zKye0JyHplUriew53TC666NSidD/Y2EJ36jQ73nCHm
 vsPw==
X-Gm-Message-State: AOAM533wFzNukoFhb/wusDfG55AYFvGSZ7Bo+hh5FanD3lKS4FznxiTw
 c+8uY3EIPP5WymoIE0ap76wkRH+YCiE=
X-Google-Smtp-Source: ABdhPJzN81wQYrhok7J58c5bfL9qiMvocce9sdgcwX+uDluNp5ENnRZscKCGPXShn6yZJPXzxkgyJw==
X-Received: by 2002:a17:90a:8814:: with SMTP id
 s20mr9544223pjn.69.1611377798622; 
 Fri, 22 Jan 2021 20:56:38 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.229])
 by smtp.gmail.com with ESMTPSA id c62sm9872772pfa.116.2021.01.22.20.56.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 20:56:38 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/11] configure: check for sys/disk.h
Date: Fri, 22 Jan 2021 20:56:24 -0800
Message-Id: <20210123045632.18482-4-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210123045632.18482-1-j@getutm.app>
References: <20210123045632.18482-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.181;
 envelope-from=osy86github@gmail.com; helo=mail-pl1-f181.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Joelle van Dyne <j@getutm.app>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some BSD platforms do not have this header.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 meson.build        | 1 +
 block.c            | 2 +-
 block/file-posix.c | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 27110075df..6818d97df5 100644
--- a/meson.build
+++ b/meson.build
@@ -1117,6 +1117,7 @@ config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
diff --git a/block.c b/block.c
index 8b9d457546..c4cf391dea 100644
--- a/block.c
+++ b/block.c
@@ -54,7 +54,7 @@
 #ifdef CONFIG_BSD
 #include <sys/ioctl.h>
 #include <sys/queue.h>
-#ifndef __DragonFly__
+#if defined(HAVE_SYS_DISK_H)
 #include <sys/disk.h>
 #endif
 #endif
diff --git a/block/file-posix.c b/block/file-posix.c
index 11d2021346..666d3e7504 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2320,7 +2320,7 @@ again:
         }
         if (size == 0)
 #endif
-#if defined(__APPLE__) && defined(__MACH__)
+#if defined(HAVE_SYS_DISK_H) && defined(__APPLE__) && defined(__MACH__)
         {
             uint64_t sectors = 0;
             uint32_t sector_size = 0;
-- 
2.28.0


