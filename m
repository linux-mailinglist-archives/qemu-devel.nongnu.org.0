Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02F441796E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:09:02 +0200 (CEST)
Received: from localhost ([::1]:48318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mToh3-0000pJ-Tn
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXz-0002ej-4N
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:39 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:35522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXu-0006wI-Ur
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:38 -0400
Received: by mail-qk1-x72a.google.com with SMTP id c7so29003543qka.2
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWLQL0pLDN+l5fhiAE6r0vZZJCHIq9CC1u+lOHbDMRg=;
 b=jbqpXiP227iB56KT34GI22QoNKWUmiAL5m0c+fZrYQg9FlTNcu4p5uznvNQNmGexYW
 aqn7/0JXtTqFHPjdthtVhhyHZ3CWwEPE+cKlfOCaOhh2jyjMKG55xq+uc8YiU/derCI6
 U1uhgkf/r1E4r7ZlJdDavHUGL8JwAs6jKdBYxAzSH0x/QtXKLtrIuuc3NdBDw0hnPGBM
 hEg/I+492spSjz6JKJ7SdW4cd1+U5KOl18jhnaAgE09qnjjXpG4FhGoErpDk4rmIWT2B
 nFvs1kesh+8vNiN8thn0+hHTcHfDKVyTAfdOk0Z8YigkMtwS5R5zlAZ9S6H7lAfBhLEs
 esxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FWLQL0pLDN+l5fhiAE6r0vZZJCHIq9CC1u+lOHbDMRg=;
 b=t21JrUq9u7Uofb1gNE//cBbBeS7bfiwxQdBps/suAKsniVz/DIeEzoozMHclFOkcMG
 zdIsRKAtAm15tZ98f9NG+2eHmEN5rTTZ0SAZdlCPUz61n9DgM1p/PyKTWpqeS7eAmuUa
 RWVdtfl7tkSmCSfQBU3xO4bxFfdosDK/qds/dqDbD4xN3Yg6pdJK4r6pF51OsA89dr02
 bRYuG1HX3rYRlM33DcqiTIWgxNJBG7Qs+p+pwamwiz7rdlhPGcPXsdV7xShyq8JPuHvP
 FwH34+796NoqXx4L1yGOXFQRyUkn2niP08Bt8FOLdVchVB0v6FBAD5S/DeV+6sCIILq+
 OO+Q==
X-Gm-Message-State: AOAM532etQCQzCJ8DIaNJHR4fn/Bk9YkZzliEHzu00YvtFpMLFFQnVPj
 wzN0wBREjBaTL9uWOPguREQ0FKVBaIkfVg==
X-Google-Smtp-Source: ABdhPJy495whHwjMo7cor9js8CEzqpkQ8wHBjCmkFtIzIhG4SlxDqKbuUh480GfAKZw/xkfcPS50gQ==
X-Received: by 2002:a37:9606:: with SMTP id y6mr11326294qkd.13.1632502774021; 
 Fri, 24 Sep 2021 09:59:34 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/27] linux-user/hexagon: Implement setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:07 -0400
Message-Id: <20210924165926.752809-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Continue to initialize the words on the stack, as documented.
However, use the off-stack trampoline.

Cc: Taylor Simpson <tsimpson@quicinc.com>
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


