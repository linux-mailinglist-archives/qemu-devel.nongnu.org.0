Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82593330874
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:52:15 +0100 (CET)
Received: from localhost ([::1]:50580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9kU-0000Xv-GO
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJ9gs-0004Jw-1j; Mon, 08 Mar 2021 01:48:30 -0500
Received: from mail-pj1-f50.google.com ([209.85.216.50]:37397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJ9gq-0007ou-G9; Mon, 08 Mar 2021 01:48:29 -0500
Received: by mail-pj1-f50.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so2430437pjc.2; 
 Sun, 07 Mar 2021 22:48:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QgU+W/R3FIydwYpBsWZV504V0tYBh/ETkHkfv0+pIB0=;
 b=k4YiwgtFwx6Rohq/0biVi554Ouq+aNi8GuEA1+eLioK2ajxUdW+rfywwXoeAfMJJqF
 uGYQDs+lnDrZXdaTTf4z5up60HS481OveTlrwlunX9vlJnD5Fa1PZHfXcO7WtXJMF4s0
 GVHl9Vw74mXJk0aX278Ed8wQroTuHtQbPm3mrdR8rHbq6uGkRQdgwxJLYXxlLT0hKgde
 p/CVbq+UniatphQlfiaVbaNTzPbZYl2NqS2MGN93iVzRBM4DmO0YrXK9jwRauLl/3lN7
 Pd99/VpGDEYEjlEcnZNbI6TbN5qA+bBqWuvWXHdR1UhGjUY7+q9B5OOssgb+fgqsFW8q
 WlqA==
X-Gm-Message-State: AOAM532yIgMpvf2BmwPbbFgb+VjfCbGT0Uk2vhQi8cnq8jIUMTFK85hB
 1N/xVT0pYQSfgdlySLW5HDE4YjNwFY0=
X-Google-Smtp-Source: ABdhPJyhADb4y/ZmujDIyLfgP2uK7Rk8Xob9CFQAzmpdgpb5QO8I+77gqyPVlWKckQ/V8KdEMTPGxg==
X-Received: by 2002:a17:902:45:b029:e4:a5b2:ffa4 with SMTP id
 63-20020a1709020045b02900e4a5b2ffa4mr19982410pla.18.1615186106631; 
 Sun, 07 Mar 2021 22:48:26 -0800 (PST)
Received: from localhost.localdomain ([73.93.155.14])
 by smtp.gmail.com with ESMTPSA id i17sm426943pfq.135.2021.03.07.22.48.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Mar 2021 22:48:26 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] block: check for sys/disk.h
Date: Sun,  7 Mar 2021 22:48:19 -0800
Message-Id: <20210308064821.81427-3-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210308064821.81427-1-j@getutm.app>
References: <20210308064821.81427-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.50; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f50.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 meson.build | 1 +
 block.c     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 0e53876f69..ba0db9fa1f 100644
--- a/meson.build
+++ b/meson.build
@@ -1153,6 +1153,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
diff --git a/block.c b/block.c
index a1f3cecd75..b2705ad225 100644
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
-- 
2.28.0


