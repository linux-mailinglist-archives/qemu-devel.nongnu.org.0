Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC10D3A8E3D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:22:17 +0200 (CEST)
Received: from localhost ([::1]:59724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKG0-0006VF-Qe
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6Q-0005Oh-Hk
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:22 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6K-0008Nc-FU
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:21 -0400
Received: by mail-pg1-x535.google.com with SMTP id e20so624147pgg.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ReU8vIByGr9momebDN5YoYgZw0eebV80Kt72eW04Sn8=;
 b=fKfiqrpqv6eaRUENCso0hwzDHWHXnovlxlYOBG056sc/2KqU+sb5lVJxWCW3gTB/NS
 aJeK4GH7QNKp4LV4p3R50SdFGDZYzFUw4ApZVabGp0byBdPugRcqbw+qEnCW2fIaOSAA
 keCZRf7cNzsuAnyiiy7dJ3OWRXMcmTpvJO3s+cSUVv+iYfcQpUD5CEa+fOBZ73ut142z
 fwtDtsyIis6YnYHZ4V4s132bHpnGkE6tXGZ/G0KrCsa9k9ES/olpa8Rb3tl1JZSDsFF3
 hhhDbJuiBxtmhgw2K/ky7JdPcEKdqcXsRtnX3MaF2mwBy5wpheDiE99xi95uMA51Ums6
 k/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ReU8vIByGr9momebDN5YoYgZw0eebV80Kt72eW04Sn8=;
 b=h9BlryBX3QuAvo202rIySgcC5DDhE2iyEwos6egY+NoTpjiOHG1yYvLqwIcSFzoieO
 NwUyfbyw8w/tC9ra0k/ZwPMtM88vJyNFzI95osS55fbHRWiNN1Be1cKhTflRrRyli0ZZ
 QfaMQSZBn4tdzdCHZfSvWsIY9Ust8OigP+YVgkN2Ahr538BEz2P+/9gSICi2P4vPwVsp
 1qPagJ1Uma3Exzi6M+7ElKi+LZ0jU0YpBLBzuq+5yVLbyl5Xvtg66Hz+pOoEev+V2glF
 xzknAj66urQ+dj/lwjLeltmZAcYK/fnV4uHW64habJ7Kn/lLSSYvD1GfcI5ie1/4OlB6
 FzPw==
X-Gm-Message-State: AOAM533QOz1wb+LrErA+8GtFolFEria3yDE3PkLp7i84NLQPU7IueJiw
 k+/9NFiwlMjbXHc9Zrxuklb4lrCZ5RLqpQ==
X-Google-Smtp-Source: ABdhPJwpCJFvgbVonPuvZcvcFpvKKSNcyeVEvbaiI6/XezNGrdPEwrOA3APb8ycuLBRoiHFQXT97rA==
X-Received: by 2002:aa7:9581:0:b029:2ea:39e:2224 with SMTP id
 z1-20020aa795810000b02902ea039e2224mr7180170pfj.32.1623805935172; 
 Tue, 15 Jun 2021 18:12:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/21] linux-user/hexagon: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:11:55 -0700
Message-Id: <20210616011209.1446045-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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


