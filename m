Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB2865232A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:54:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dpA-0000mn-O2; Tue, 20 Dec 2022 09:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dp8-0000la-8S
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:42:30 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7dp6-000249-JE
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:42:29 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso8965917wmp.3
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BR/sZFMBpjOuj74wzBKHaxO4GKg6uBrTeq/EpP8NU00=;
 b=JvkQRzEMMcbZt82nc/XhfFCg6gZFwPzBF0/7jPwTXxkp6PC15XR4Ge4UWWXC2XPbFz
 o22SKWvkUPbv3tzWFZ3KQNHS8E/Rsf83liYptvoiqtnt/yoORDCdY0/7UdnFFrLdr82v
 AkAXwSmtIaPDa9LD2NCLjmKGkOrtlxKj6CjHRPGMFiFSTbUkbxo1SMDCsG7hXsUf/905
 vkR9P8o3j90eV7H9NrtqbwArcITSWBCKhho3Hup3nIvfZwJLUCmyEBeAWkzIy/9C3Yof
 V7PHWEkSQ+9xz4wKZaJO80Cq60bCFYy3ruM2yveXEEQKB1fJm5GRiK5K02QekprIiZEG
 5vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BR/sZFMBpjOuj74wzBKHaxO4GKg6uBrTeq/EpP8NU00=;
 b=7lbPHqY1nmVS8IYkFCxBBcVG5GFx0H1c1WpNDYMbEdz2BggpY/t0/lo8z+3e97CDJm
 fDyEgUui7Rh4JO67peWFbqbNKnVq6hgbggE1QCz3eUE6i+U7ehkzfOFX/y7QasDgGYOr
 TVLY/xTvxu7U9a822L3kCQqybXaScAQZzrjUfcVlPFYOYxa/7YStMgFcrejns8hbPrtC
 reqLBSKX8/+enZCp/cct/wuH9E0YpdzTOhMJKmfUM0N1BVtUO0cMRUFOQj9/LlmIIqpB
 92EZK9h5FxQM2grSazGVIRxVTa6Za5VgCdNQwQWZjtu8IWCMMl8N15mcJ+nExATVjiwh
 nDAw==
X-Gm-Message-State: ANoB5pl75Yp97an9uokNlceC1hbr4gZYJdSI1hYET4GAG1aY4mjJxwYg
 ntZdlbrbGfT7EOiBGFfLltGT66fbSwc8ihG/q60=
X-Google-Smtp-Source: AA0mqf6MEFX1VXP7Ay1eArw2O7/d4HGRkddHqy49AOSYRHziiAXYiuAh68mbOZLAHA107YgIhPspew==
X-Received: by 2002:a05:600c:35ce:b0:3d1:c8e3:2452 with SMTP id
 r14-20020a05600c35ce00b003d1c8e32452mr36184199wmq.30.1671547347541; 
 Tue, 20 Dec 2022 06:42:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bn22-20020a056000061600b002366e3f1497sm13131207wrb.6.2022.12.20.06.42.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:42:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] linux-user/syscall: Silent -Wmissing-field-initializers
 warnings
Date: Tue, 20 Dec 2022 15:42:18 +0100
Message-Id: <20221220144219.25254-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220144219.25254-1-philmd@linaro.org>
References: <20221220144219.25254-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Silent when compiling with -Wextra:

  In file included from ../../linux-user/syscall.c:5742:
  ../linux-user/ioctls.h:694:3: warning: missing field 'access' initializer [-Wmissing-field-initializers]
  IOCTL_IGNORE(TIOCSTART)
  ^
  ../linux-user/syscall.c:5741:31: note: expanded from macro 'IOCTL_IGNORE'
    { TARGET_ ## cmd, 0, #cmd },
                              ^
  ../linux-user/syscall.c:5743:13: warning: missing field 'name' initializer [-Wmissing-field-initializers]
    { 0, 0, },
            ^
  ../linux-user/syscall.c:12949:44: warning: missing field 'sigev_signo' initializer [-Wmissing-field-initializers]
        struct sigevent host_sevp = { {0}, }, *phost_sevp = NULL;
                                           ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/syscall.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f8c10f8ef..f3ab6bf5a6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5738,9 +5738,9 @@ IOCTLEntry ioctl_entries[] = {
 #define IOCTL_SPECIAL(cmd, access, dofn, ...)                      \
     { TARGET_ ## cmd, cmd, #cmd, access, dofn, {  __VA_ARGS__ } },
 #define IOCTL_IGNORE(cmd) \
-    { TARGET_ ## cmd, 0, #cmd },
+    { TARGET_ ## cmd, 0, #cmd, 0, NULL, { } },
 #include "ioctls.h"
-    { 0, 0, },
+    { /* end of list */ }
 };
 
 /* ??? Implement proper locking for ioctls.  */
@@ -12946,7 +12946,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
     {
         /* args: clockid_t clockid, struct sigevent *sevp, timer_t *timerid */
 
-        struct sigevent host_sevp = { {0}, }, *phost_sevp = NULL;
+        struct sigevent host_sevp = { }, *phost_sevp = NULL;
 
         int clkid = arg1;
         int timer_index = next_free_host_timer();
@@ -12993,7 +12993,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             ret = -TARGET_EINVAL;
         } else {
             timer_t htimer = g_posix_timers[timerid];
-            struct itimerspec hspec_new = {{0},}, hspec_old = {{0},};
+            struct itimerspec hspec_new = { }, hspec_old = { };
 
             if (target_to_host_itimerspec(&hspec_new, arg3)) {
                 return -TARGET_EFAULT;
@@ -13019,7 +13019,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             ret = -TARGET_EINVAL;
         } else {
             timer_t htimer = g_posix_timers[timerid];
-            struct itimerspec hspec_new = {{0},}, hspec_old = {{0},};
+            struct itimerspec hspec_new = { }, hspec_old = { };
 
             if (target_to_host_itimerspec64(&hspec_new, arg3)) {
                 return -TARGET_EFAULT;
-- 
2.38.1


