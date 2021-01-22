Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D1F300D74
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:13:46 +0100 (CET)
Received: from localhost ([::1]:47674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32oT-0006eV-KX
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mB-0004rB-1y; Fri, 22 Jan 2021 15:11:23 -0500
Received: from mail-pl1-f176.google.com ([209.85.214.176]:33671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32m9-0004a9-G2; Fri, 22 Jan 2021 15:11:22 -0500
Received: by mail-pl1-f176.google.com with SMTP id b8so3948962plx.0;
 Fri, 22 Jan 2021 12:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nuZqkg4b5JSpteTWXviT3GF9Ync2kiIqSXzXQk/xAZU=;
 b=c0o2+m3Saka6qSTMp/SOiy4vjNO1WE5SRMyDxnkmfImZatJadgJN26nq9aqMTyXKxa
 RTPiKHMFkwZC0Ar15U71sUhnKUW3U8vqKzwWAazHg9C/kQSwlep3y2EGzf8Z9zWSNK5Z
 pLlHszY5ojTahVUpvjbRqY2N0zDX/x32fFD3iPjFuj+02y46nsIlKaTtcRaskTOcTWt4
 SZZnRjOJfwXdDqQjpDEePL4Po4ZzbHQ753fG7vTD9HuHb5eOBt+OMGkLu2r8b98ttvji
 12MwZm9GUpqAIkkcPDGyxpErBh4lYaCUpdJEH1HvNAvqFZm5zO5DMS7KfHPXq2muWr0c
 cchA==
X-Gm-Message-State: AOAM531h3zSQ6/ryVenquHtQjq7h2bAmVXJCAXgs/Q4cDeOhCly7qIc3
 3hNn4GdMvhAd7QqMADozCJDmN2ejhvA=
X-Google-Smtp-Source: ABdhPJyNxnJ+s4WMURFI7m76eKjus8lO/g0PYV1cv6TWjmumQ8KSfuJIvE9/mpeSqxObwon7TiYwGA==
X-Received: by 2002:a17:90a:8006:: with SMTP id
 b6mr3779153pjn.108.1611346279349; 
 Fri, 22 Jan 2021 12:11:19 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.129])
 by smtp.gmail.com with ESMTPSA id u12sm8741839pgi.91.2021.01.22.12.11.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:11:18 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/11] configure: check for sys/disk.h
Date: Fri, 22 Jan 2021 12:11:05 -0800
Message-Id: <20210122201113.63788-4-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210122201113.63788-1-j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.176;
 envelope-from=osy86github@gmail.com; helo=mail-pl1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 configure          | 9 +++++++++
 block.c            | 2 +-
 block/file-posix.c | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 32be5d225d..951de427bb 100755
--- a/configure
+++ b/configure
@@ -5295,6 +5295,12 @@ else
   have_host_block_device=no
 fi
 
+if check_include "sys/disk.h" ; then
+  sys_disk_h=yes
+else
+  sys_disk_h=no
+fi
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -5528,6 +5534,9 @@ echo "ARCH=$ARCH" >> $config_host_mak
 if test "$have_host_block_device" = "yes" ; then
   echo "HAVE_HOST_BLOCK_DEVICE=y" >> $config_host_mak
 fi
+if test "$sys_disk_h" = "yes" ; then
+  echo "HAVE_SYS_DISK_H=y" >> $config_host_mak
+fi
 if test "$debug_tcg" = "yes" ; then
   echo "CONFIG_DEBUG_TCG=y" >> $config_host_mak
 fi
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


