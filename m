Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4DF339F2D
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:42:53 +0100 (CET)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL7Lo-0006YP-Af
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HO-0002UY-0K
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:18 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lL7HL-0007Lp-Go
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:38:17 -0500
Received: by mail-wr1-x431.google.com with SMTP id 61so3438490wrm.12
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MhHnkYeqj2bHe1c8USts/NrhTNQ41OZC2qSF3HkSwjo=;
 b=gbKA6+8JyCYu8DDvvsrx2TYXBlkYr/6SjwzY3o7LZlzDGOYmwBrpoQoHC7U9c9TVBD
 9DxF8ELBeUyJlnIOM9Vsc2CrCKNH7qxmwWQ3Cm4YeOME4+eG+hF9onldEj5T8ZDc3hKk
 KEFoev3iinspRJJUVufVgpCM4DM7agSi+6PO8v9YXqOE4t63itbArAYfkGLxtF6Q3BnG
 CJcc8GRLuapNJk49A3pgUgXFR7nrvqCiqeyEYB2EA7l1yVBIF/+/KwEFbKwlQQUCZiMz
 vuSgTBTUrTiMFpVIPwLm/dNNesT1AYru8w9kLuY2jzp1+ji8/aKK5IkGtqviRvic3oR+
 sPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MhHnkYeqj2bHe1c8USts/NrhTNQ41OZC2qSF3HkSwjo=;
 b=dKIcAw9RcZcIEBpo9ENx+VxT71B6PfaoCPKrdxC2kqDJ9PFkCAcpi4o34SWsrsgFpI
 HnebMCXiJX5NzZtdoB1+xYdWhN/zkrJbxZeZy39MJEcFlqLAnyZJ0b301lTax7ClSp+g
 18+CB1awqLu28elKpDM2gZXqywf9bMYhMD1MaACh2weH6MuJQHN8WcDpSodfSvqjaTOi
 ZZUzHO20lBek/jtjg9LehoXlWsjC/ifUf/OGCK58WmQMONn7N13MUzlkKcgBeN5t2/AG
 nNOEwfEGEmvbK9YE2N8cHMVcK3B7fd4MjVQeKfUqSA6fLI5GJ5l1lxsgrndpT2AQtA5R
 dTTg==
X-Gm-Message-State: AOAM530japHcDePCoFq1up7YvM5krqa3jYzcn6P5zr4IxKCY1gyEKyAn
 5nyR4vu7CCmDhBnwVVy8YH1M64XMR8o=
X-Google-Smtp-Source: ABdhPJx2/KcLEN1cRlf5tGzxii0Mv/PpIs4ZxOmfMt1dLE1+w64LvzuVYJaRXuaRiSOWmw1CXddKzA==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr19719132wrt.31.1615653490693; 
 Sat, 13 Mar 2021 08:38:10 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id n6sm13173441wrt.1.2021.03.13.08.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 08:38:10 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] util/compatfd.c: Replaced a malloc with GLib's
 g_try_malloc
Date: Sat, 13 Mar 2021 18:36:50 +0200
Message-Id: <20210313163653.37089-7-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210313163653.37089-1-ma.mandourr@gmail.com>
References: <20210313163653.37089-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced a malloc() call and its respective free() call with
GLib's g_try_malloc() and g_free(). Also, did slight styling
changes that were producing errors using the checkpatch.pl
script.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 util/compatfd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/util/compatfd.c b/util/compatfd.c
index ee47dd8089..834ddd0573 100644
--- a/util/compatfd.c
+++ b/util/compatfd.c
@@ -20,8 +20,7 @@
 #include <sys/syscall.h>
 #endif
 
-struct sigfd_compat_info
-{
+struct sigfd_compat_info {
     sigset_t mask;
     int fd;
 };
@@ -53,8 +52,9 @@ static void *sigwait_compat(void *opaque)
 
                 len = write(info->fd, (char *)&buffer + offset,
                             sizeof(buffer) - offset);
-                if (len == -1 && errno == EINTR)
+                if (len == -1 && errno == EINTR) {
                     continue;
+                }
 
                 if (len <= 0) {
                     return NULL;
@@ -72,14 +72,14 @@ static int qemu_signalfd_compat(const sigset_t *mask)
     QemuThread thread;
     int fds[2];
 
-    info = malloc(sizeof(*info));
+    info = g_try_malloc(sizeof(*info));
     if (info == NULL) {
         errno = ENOMEM;
         return -1;
     }
 
     if (pipe(fds) == -1) {
-        free(info);
+        g_free(info);
         return -1;
     }
 
-- 
2.25.1


