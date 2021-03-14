Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A3A33A27F
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 04:28:01 +0100 (CET)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLHQ8-0001y4-Kc
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 22:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMK-0006XF-8K
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:04 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMH-0004SU-Hq
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:04 -0500
Received: by mail-wm1-x335.google.com with SMTP id d191so6054668wmd.2
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 19:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ULb0qQJUebEUkzQmRP5LxPxlhhbE/qPxwsfl/mciK6w=;
 b=IZpnYbQCRmVXF5uhIjhIZcymB+m/+BcS4dI9REG29zDjOwpKgx+T+rEFslPGY0i/9j
 N8RrqqWTUQM8/1Ys5VcJPjmHDpWh1CW0pkcT5j+sMtqmJQIQkk+VFfl7EAvapUMy0AeA
 1QcauFJGg3PG/k3YSG7g88qUV+2dDmGTeTRpkpSKVuC9dniD34m0lsQd4eUPKfud8H8V
 HlWc8ouwQ27JNKfB8mveApEGJSDNVwaQ79i7J7BnR0tBhHDjMcHPdpPYGkH6IhLiSdcg
 YD2QmiS0ugYZUh7x5m8QKoYvGNRHjPn5/AoPpg/kyldYADkPu5Ayigsbl4atFTyOrB9x
 1Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ULb0qQJUebEUkzQmRP5LxPxlhhbE/qPxwsfl/mciK6w=;
 b=P+YL4EeFZ8eQa0CAk9Ozd/m/FHUWoD5DWYKHI2HbENsqdKmYc+4YzZ6ZY3m9gM3dkv
 0YHIOZLM7YZnkCp8LogscWzRerLYyYPalwUb0SmW7hDFPoQkANxhf1a4i1eqZ7trFmm4
 +GXI5EJTzdtH/6i66+dlkuyAbmwCGS3hmb9WdeK2ZV+kVKBMG9Bda8C0VwYzJeU2Or78
 D44Xa+JT7d3aEcUg5/2rhBAvTRdme9AO1E1O/IhiBIMhXp4wIWyora/AIE8BDvx3nQ0d
 P9nTFsZLlDDAUShXJOgFQRE3kQ3SLeFgsiQ9cRiiEsy07cc4n9O16eAEi+sLIeVS9ixz
 DOrQ==
X-Gm-Message-State: AOAM533HclR3HwHK5r5ThWeVFtW/DHX82sv4xVeww18ZfApPn1g1fx2H
 Qkdw4WOp9J6ub1bvPe54CRjSJFBW7pg=
X-Google-Smtp-Source: ABdhPJzkO11Wgy1Gb1TPHHEW8R2fRpofdOGJ1FFdHVLl9IHD1TVoNdkRGTN5Jj88I9KH6hdW1Uw2Ug==
X-Received: by 2002:a1c:bc56:: with SMTP id m83mr20210266wmf.174.1615692240129; 
 Sat, 13 Mar 2021 19:24:00 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id e1sm14922249wrd.44.2021.03.13.19.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 19:23:59 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] util/compatfd.c: Replaced a malloc with GLib's variant
Date: Sun, 14 Mar 2021 05:23:21 +0200
Message-Id: <20210314032324.45142-6-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314032324.45142-1-ma.mandourr@gmail.com>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x335.google.com
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
GLib's g_try_malloc() and g_free().

Also, did slight styling changes that were producing
style errors when using the checkpatch.pl script against
the file.

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


