Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5D441C54A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:12:37 +0200 (CEST)
Received: from localhost ([::1]:44642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZO0-00077y-Ao
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHw-0006aw-1m
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:20 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZHt-0006A2-NK
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:19 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so2750115otq.7
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1f4aYpKsB+ja4QJ7hAEtER7A5IlRmh/mgnhLrHPEyy0=;
 b=lKMEdvbvcFY/uSD1n4udJCgXqKjbImCTqkQ3svlZ40/BBqDWTqUyu6CyhL7cFi2xdd
 +Ga1IgBS8ck9SIP38aqwwlxTycZjxp+J6rWNgGGYnoKYufF/OSE8bpkmay4Hn6qf1/Sj
 tDyXlihSXbbAluIM4aLxFRqi+HyNkvsH1vE9w3J8l1wd+y1N3aW9yQVJuNYGPUoYMTc6
 Pu/sLfV7x6Avn1B2INlsANK6gxIEzv2PBrcGUo5nzwW+By9lmK50ljumLoCBWBtzuGP9
 ascmM6ghKYGY55hwZVTllnPDD2pYwVNsYJq3a9aLfE6NW8UNoQf3Oldh3awGpvuKqQry
 L72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1f4aYpKsB+ja4QJ7hAEtER7A5IlRmh/mgnhLrHPEyy0=;
 b=o+3ayP/TfxxFx8kowtk3UmAwtYsCZ5x8jrhyBKr0Tgv7RA/W1Fe0Bm2C2iUM2Blhez
 /jkwj4D54DNktYlggHUAsfe0Acstml30xI/8aboKwsrJVJkFZ+YcWcIi9ZEuNN0QQX4v
 UPWSJHso9xTRcZDsrrs39ruEgjlquJUWE+Ve7EtCwoWnfizD0GQvogxUiGjYnuI17axa
 F5eHk+Qbuxmug2dXLK2GJvOZJEUVuj/E0SUtbrwitse/hLljG7s/kPCztAbXviqLKsq9
 4Y+J3KzPg8wqoxTbmvI6FjY6+El6i4Yfr8xZzYJ8q561nerCjhGp+GRVSEYgPTmu2q3A
 oXWw==
X-Gm-Message-State: AOAM532nzv/M0TGgA722RXSMtKG1w/RK11bKyHOeqJJTjvlZF+TRKq1v
 KuNg+WSONUti3yVryYUu36zdi8lid0lwAg==
X-Google-Smtp-Source: ABdhPJxxoxOT1VbikLIFWpfY6TsoCW93CkhQUgfA3Ntu+pIcZ+VLsUTtDYuDdyKocpgUdJwcMZuUiw==
X-Received: by 2002:a05:6830:31b8:: with SMTP id
 q24mr10117464ots.275.1632920776534; 
 Wed, 29 Sep 2021 06:06:16 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/26] linux-user/hexagon: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:35 -0400
Message-Id: <20210929130553.121567-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Continue to initialize the words on the stack, as documented.
However, use the off-stack trampoline.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index c7f0bf6b92..74e61739a0 100644
--- a/linux-user/hexagon/signal.c
+++ b/linux-user/hexagon/signal.c
@@ -162,6 +162,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     setup_ucontext(&frame->uc, env, set);
     tswap_siginfo(&frame->info, info);
+    /*
+     * The on-stack signal trampoline is no longer executed;
+     * however, the libgcc signal frame unwinding code checks
+     * for the presence of these two numeric magic values.
+     */
     install_sigtramp(frame->tramp);
 
     env->gpr[HEX_REG_PC] = ka->_sa_handler;
@@ -171,8 +176,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         frame_addr + offsetof(struct target_rt_sigframe, info);
     env->gpr[HEX_REG_R02] =
         frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->gpr[HEX_REG_LR] =
-        frame_addr + offsetof(struct target_rt_sigframe, tramp);
+    env->gpr[HEX_REG_LR] = default_rt_sigreturn;
 
     return;
 
@@ -271,3 +275,14 @@ badframe:
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


