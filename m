Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B12506593
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 09:19:24 +0200 (CEST)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngi8x-0004KE-Qe
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 03:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggmB-0001D2-2r
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggm5-0004Sn-9B
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id q20so9939251wmq.1
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p4zJu+UCpzjbdE0k96aL3nBQu8Ujaw7AsMU86QsOaBE=;
 b=cvu7fi42YypuN327McoH/C82tdQIPp3lDSJ7G72DqGDKNuh9i2InPT2B83QjLsYzI/
 gC3u+Dj1y9enMjD9TZnMFr9B3a3Y1MTJ+7mLiqd0W8u/F2VXSCcohj4Y1amLx09nvdfi
 j7ftY8M9/LQRkzedA0VgdNsw7wwqXfCa436ZYyUTNgl3k2pKxc1w60B+phietl2cqDXM
 ZxMpLmfvGLBmr0dW2STSKjtLg7rz6sgFq/zwlgsZytlf8IpRswXGkjpNX2bEnLhYEAhx
 RGvUum+eySXxA7b3ZrmNP58NCaNWMIHdQ1SKO4gMDV6SbSQO3HFhliLtlz72RbE9Ipry
 wAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p4zJu+UCpzjbdE0k96aL3nBQu8Ujaw7AsMU86QsOaBE=;
 b=R90VVHGs8DoT6vGQLnnmt35HiaMI8jZYp7YJYZ0Uv4g9y//19QiyU0WYfVRFhh54wA
 B19G0UJEUKTpnD7qFiVkYG42w89bO1439qy1QxGT8rqCBoy8/5Gyquy5FWTizUIze9P6
 h2bwkSzymtxHsZLH97rWe5Xha1dv3WCekoy/jXwvYdHgTHg+uOsVIQTzxbrEz/mwI+Ia
 w+6Hn0i8ORt4rqw0spf4uqiwb5swcBB8KqW9Vz0fGIRqEK2jh6pTLfpWMzGct/ktooXM
 lj/VpF1ttitK82GozQ4eTcgM/gNw4Zac4Xu8RgObqaErO3eW6kYjhTLTJn9x3Yuk1rDX
 S+QQ==
X-Gm-Message-State: AOAM531+Snr6L0CFGLVctCA1JDjBealTHmKnoob3v79awWMbHlQTGi63
 eVyw/cO0uF9YVNwzEixfEy6qgHLOEFtw1w==
X-Google-Smtp-Source: ABdhPJwh/DsoHAfYGBKTF+Iu7cunwXDo3AaO0658x5XI8dSV0rZHxJMkMmFR0Qf5/25oQ3YZkFDqJg==
X-Received: by 2002:a7b:cb0d:0:b0:38e:aaf3:b08f with SMTP id
 u13-20020a7bcb0d000000b0038eaaf3b08fmr18665382wmj.12.1650347499589; 
 Mon, 18 Apr 2022 22:51:39 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/53] qga: remove explicit environ argument from exec/spawn
Date: Tue, 19 Apr 2022 07:50:51 +0200
Message-Id: <20220419055109.142788-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Environment is implicitly inherited from the current process "environ"
variable for execl() or g_spawn_sync(), no need to be explicit about it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323155743.1585078-31-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build          |  2 --
 qga/commands-posix.c | 24 +++++++-----------------
 2 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/meson.build b/meson.build
index 08f8183a66..a0b6de255c 100644
--- a/meson.build
+++ b/meson.build
@@ -1654,8 +1654,6 @@ config_host_data.set('CONFIG_BYTESWAP_H',
                      cc.has_header_symbol('byteswap.h', 'bswap_32'))
 config_host_data.set('CONFIG_EPOLL_CREATE1',
                      cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
-config_host_data.set('CONFIG_HAS_ENVIRON',
-                     cc.has_header_symbol('unistd.h', 'environ', prefix: gnu_source_prefix))
 config_host_data.set('CONFIG_FALLOCATE_PUNCH_HOLE',
                      cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_PUNCH_HOLE') and
                      cc.has_header_symbol('linux/falloc.h', 'FALLOC_FL_KEEP_SIZE'))
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 1e7b4656ed..84a3b912be 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -32,15 +32,6 @@
 #include <utmpx.h>
 #endif
 
-#ifndef CONFIG_HAS_ENVIRON
-#ifdef __APPLE__
-#include <crt_externs.h>
-#define environ (*_NSGetEnviron())
-#else
-extern char **environ;
-#endif
-#endif
-
 #if defined(__linux__)
 #include <mntent.h>
 #include <linux/fs.h>
@@ -109,8 +100,8 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
         reopen_fd_to_null(1);
         reopen_fd_to_null(2);
 
-        execle("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
-               "hypervisor initiated shutdown", (char *)NULL, environ);
+        execl("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
+               "hypervisor initiated shutdown", (char *)NULL);
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
         error_setg_errno(errp, errno, "failed to create child process");
@@ -193,8 +184,7 @@ void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
 
         /* Use '/sbin/hwclock -w' to set RTC from the system time,
          * or '/sbin/hwclock -s' to set the system time from RTC. */
-        execle(hwclock_path, "hwclock", has_time ? "-w" : "-s",
-               NULL, environ);
+        execl(hwclock_path, "hwclock", has_time ? "-w" : "-s", NULL);
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
         error_setg_errno(errp, errno, "failed to create child process");
@@ -1560,7 +1550,7 @@ static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
         reopen_fd_to_null(1);
         reopen_fd_to_null(2);
 
-        execle(hook, hook, arg_str, NULL, environ);
+        execl(hook, hook, arg_str, NULL);
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
         error_setg_errno(errp, errno, "failed to create child process");
@@ -1874,7 +1864,7 @@ static int run_process_child(const char *command[], Error **errp)
     spawn_flag = G_SPAWN_SEARCH_PATH | G_SPAWN_STDOUT_TO_DEV_NULL |
                  G_SPAWN_STDERR_TO_DEV_NULL;
 
-    success =  g_spawn_sync(NULL, (char **)command, environ, spawn_flag,
+    success =  g_spawn_sync(NULL, (char **)command, NULL, spawn_flag,
                             NULL, NULL, NULL, NULL,
                             &exit_status, &g_err);
 
@@ -2555,9 +2545,9 @@ void qmp_guest_set_user_password(const char *username,
         reopen_fd_to_null(2);
 
         if (crypted) {
-            execle(passwd_path, "chpasswd", "-e", NULL, environ);
+            execl(passwd_path, "chpasswd", "-e", NULL);
         } else {
-            execle(passwd_path, "chpasswd", NULL, environ);
+            execl(passwd_path, "chpasswd", NULL);
         }
         _exit(EXIT_FAILURE);
     } else if (pid < 0) {
-- 
2.35.1



