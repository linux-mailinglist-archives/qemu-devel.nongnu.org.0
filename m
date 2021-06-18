Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150F3AD302
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:40:13 +0200 (CEST)
Received: from localhost ([::1]:57960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKLc-000593-6V
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBn-0001Xs-6S
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:03 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:34341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBi-0001SV-3Q
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:02 -0400
Received: by mail-pg1-x52f.google.com with SMTP id g22so8603786pgk.1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ReU8vIByGr9momebDN5YoYgZw0eebV80Kt72eW04Sn8=;
 b=J7PPF48+lDRnKZZfvhzHBxl8eM9yzfps7HPpimKJUmOs5s/jkVZQeJTPOn1paYNf0O
 WMeyAMQOO/GETptn5sIEqono3A/KvqGpNh6NE+2KgbsA724adlTwZ2gkC3VOv7yRUyWn
 eL/bNC3bdTYvESGmCviG/XY/xeGjlFEh6gZ3Fh7rcdVIvppxp+8C9wEuaIkeaQzWvE+x
 Aju0CD/7UC5ig5DociR+z8fzLm/jFm6od9N8uxS7hdWZWJ7Qbci/a6iz2/72qfE7j5wL
 EUGz98dBStqc57DZeUvrtMF96nwTaiTVJ/1KLwT2bh3OFIzOO8rBRrvAj4F+axdIdkqB
 h3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ReU8vIByGr9momebDN5YoYgZw0eebV80Kt72eW04Sn8=;
 b=Cit3wuwRo5N16s3hIayCSKaB8fy4DX0X2SfoLrf7tHtK6a/KK/DL+7PGepwjrAQ8YJ
 4cTXUODJeEBokQ0UHhH2tBf7DzM55gqQtdn7sJc8XxVHEVpLwp1nsvrfR4WLXCgu4KFK
 8lFdE7ibuEwlP+o961HfzyVzZ302bEBVCmG1wRXw6ZkXkPMlWLujpHAQ4Z3dT2jiGKt6
 Q1xrVSHSiLXeTK5xJc64J5s/E67SuktAU8loqaZWWuLW/BhoCd08CFhPWTK7kO+1H6eq
 tepAvLnEdpx4k56IR6SJ2zVIezq4mahzoptfvlmJqQxoMELXf/YoUM//K2GI+ZQuSd9w
 3xtw==
X-Gm-Message-State: AOAM5301TQKFtNlTgkgUtJIbwPCLEEhy+f4Zk9wL+PIDlPpQhmR/tnqZ
 N8H/xVjh6Hg0iYaKr2VYFghoje89tYT0Bg==
X-Google-Smtp-Source: ABdhPJxh/mN846w1eN20LgDPUeGxA8AdXfd47xfps5L6EcRvc7F0ORNTHctAAT204G5i2dHeF9SuWw==
X-Received: by 2002:a05:6a00:844:b029:2f8:5436:dc39 with SMTP id
 q4-20020a056a000844b02902f85436dc39mr6709786pfk.10.1624044596872; 
 Fri, 18 Jun 2021 12:29:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/23] linux-user/hexagon: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:36 -0700
Message-Id: <20210618192951.125651-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Continue to initialize the words on the stack, as documented.
However, use the off-stack trampoline.

Cc: Taylor Simpson <tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hexagon/target_signal.h |  2 ++
 linux-user/hexagon/signal.c        | 19 +++++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/linux-user/hexagon/target_signal.h b/linux-user/hexagon/target_signal.h
index 345cf1cbb8..9e0223d322 100644
--- a/linux-user/hexagon/target_signal.h
+++ b/linux-user/hexagon/target_signal.h
@@ -31,4 +31,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* TARGET_SIGNAL_H */
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
index 85eab5e943..bd0f9b1c85 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -161,6 +161,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     setup_ucontext(&frame->uc, env, set);
     tswap_siginfo(&frame->info, info);
+    /*
+     * The on-stack signal trampoline is no longer executed;
+     * however, the libgcc signal frame unwinding code checks
+     * for the presence of these two numeric magic values.
+     */
     install_sigtramp(frame->tramp);
 
     env->gpr[HEX_REG_PC] = ka->_sa_handler;
@@ -170,8 +175,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         frame_addr + offsetof(struct target_rt_sigframe, info);
     env->gpr[HEX_REG_R02] =
         frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->gpr[HEX_REG_LR] =
-        frame_addr + offsetof(struct target_rt_sigframe, tramp);
+    env->gpr[HEX_REG_LR] = default_rt_sigreturn;
 
     return;
 
@@ -270,3 +274,14 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 * 2, 0);
+    assert(tramp != NULL);
+
+    default_rt_sigreturn = sigtramp_page;
+    install_sigtramp(tramp);
+
+    unlock_user(tramp, sigtramp_page, 4 * 2);
+}
-- 
2.25.1


