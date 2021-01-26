Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373B6303152
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 02:33:49 +0100 (CET)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DEq-0002xO-9U
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 20:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6V-0005ew-Bb; Mon, 25 Jan 2021 20:25:13 -0500
Received: from mail-pg1-f176.google.com ([209.85.215.176]:37832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l4D6P-00069x-7w; Mon, 25 Jan 2021 20:25:09 -0500
Received: by mail-pg1-f176.google.com with SMTP id z21so10190721pgj.4;
 Mon, 25 Jan 2021 17:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RdGbdMFIUd62J0vMmSPnX8R1crlr0ThF2wH5cyxIl8s=;
 b=bQMOBszsfGjl8QHtcmc4AVX1fRh1pUXSQvpmWnt9IyRmdxfqfuhZ7l9IvLHxAK9EWz
 pWY7CzFHNOnP7ofFTUjMXso+xNMPtStTL9kcV/JqjivnGo36MwFBATW5o/7Lucn3TgBl
 ddOQ2QUWaGoMmD9AMhY5Fdu3CHXAEMfXYIB6SrWE4D3aBfPRbJS7OuMNdYHyhGTt4kYF
 468zVVGG7bDP6jRH+Hq9QMoMOe+QyDdYLYMYCULrpQE+HMg0vuSRrpb2xokKW2xTd9Cc
 YLSmYL8MFW4c+S+fNxOZ1yW15Ijk2BiHVEmY2NtZ5hAJjn/QpJMaCoKoEtBgg4c4KAnh
 jIAw==
X-Gm-Message-State: AOAM533wjMIKTzWfoGLC3dI+1h4pt9vmnxC6LCOvj44YSV3b4voJzcO1
 Zl01UOx1on5zrtADm3Y7QuZu2KXkWeY=
X-Google-Smtp-Source: ABdhPJwjdQmY9GmrKfN0aGbd/iEtRBi/aPYsy+N9Af+U/+KdVAT7NVKdVl4cxxmhnFJfd0il0R31qQ==
X-Received: by 2002:a63:c743:: with SMTP id v3mr3206061pgg.316.1611624302912; 
 Mon, 25 Jan 2021 17:25:02 -0800 (PST)
Received: from Yifans-Mac-Mini.hsd1.ca.comcast.net. ([98.35.5.7])
 by smtp.gmail.com with ESMTPSA id o14sm536921pjf.12.2021.01.25.17.25.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jan 2021 17:25:02 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 03/11] configure: check for sys/disk.h
Date: Mon, 25 Jan 2021 17:24:49 -0800
Message-Id: <20210126012457.39046-4-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210126012457.39046-1-j@getutm.app>
References: <20210126012457.39046-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.176;
 envelope-from=osy86github@gmail.com; helo=mail-pg1-f176.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


