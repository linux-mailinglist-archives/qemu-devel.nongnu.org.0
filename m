Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA8C41A535
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:18:56 +0200 (CEST)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2hr-0003L9-Kw
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QT-0004ci-E0
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:01 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:35632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QQ-0005k2-GL
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:00:57 -0400
Received: by mail-qk1-x732.google.com with SMTP id c7so39335636qka.2
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OeHNvhPeuZfmulgUe9ozzImEdGk/YkGYzR1u2KyMGGs=;
 b=xRRYgDrYy+28W5H/JqYLpHcRbgPZe422Xzv10xG1UAcBRpkjVCiMZBdin3xjz3J0Xr
 8U/iP94NwAbPZvfbMqbQFaZKMGwkS/MCULq+qS5oLSAoDLrwHfk5YAPxYHiwr011i5kw
 V/PgW3HjbPjF5TtxpVWlorxmYZEcZv3TPByvTf0SlXm1MnaPUJGRm+IUQ/mCNcHzqFhc
 DKdryauXHcbK7e3xVX9dsixX7KX+yvCGYfSgCLWJhM1H3O27kgyOF7sHKA1bPxPLm7nl
 hDsAxk0aZDCYWy4EKyrbyLzkn+LHZf1IqWB8Oua6aGXszfA2G+n2BEkjwuSApbFELaRd
 lpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OeHNvhPeuZfmulgUe9ozzImEdGk/YkGYzR1u2KyMGGs=;
 b=QWPMh7ASEKtuibkU0m0GjAtNigIkrtSrx7+BVW53FhUiteg2IqOLnAfAVn07rNNDZw
 dHm4aBYjckeUHhrh/WBeiF86inAocBIT3HxB0CHe4J56Xz4eIe4vxBauzwB1beM1v0t3
 YeKe46FQ+AmYY0nWvCFO1iV4wASM8tMYqE29ike5Fpp8bG+61DvxsKK7jPpe943xmbkk
 PzheL0KzBGlIIesoer3DE1HuW9FY/P64E1LKGYr0UjtSHzTgwlCXyLaakchXaHeny+Ot
 3Aqi4qrtG3ll4QssZeENrWPntbjeb25x/A0wOwm0vjzQ/hdlfUJQ4SYWXdTmMoBM9kr9
 +0tQ==
X-Gm-Message-State: AOAM531dIs1aPq8HRsDZCkaPZKKQkSkat3Ae1hLApXRj4QUaDiuCDK1W
 jRB+clawKRCwY69ymfwpImjnPDYPD3S0gA==
X-Google-Smtp-Source: ABdhPJw3155+hUI6K0/qwDbJYWxI9r7Yi/iRTsbfq7RP8cC5WCEWXPRBg6jlp6QA0nKT7EJ1FpYcRw==
X-Received: by 2002:a05:620a:e12:: with SMTP id
 y18mr3176578qkm.464.1632794453015; 
 Mon, 27 Sep 2021 19:00:53 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/25] linux-user/microblaze: Implement setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:27 -0400
Message-Id: <20210928020039.184412-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, laurent@vivier.eu,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/microblaze/target_signal.h |  2 ++
 linux-user/microblaze/signal.c        | 24 +++++++++++++++++-------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/linux-user/microblaze/target_signal.h b/linux-user/microblaze/target_signal.h
index 1c326296de..e8b510f6b1 100644
--- a/linux-user/microblaze/target_signal.h
+++ b/linux-user/microblaze/target_signal.h
@@ -21,4 +21,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* MICROBLAZE_TARGET_SIGNAL_H */
diff --git a/linux-user/microblaze/signal.c b/linux-user/microblaze/signal.c
index b822679d18..8ebb6a1b7d 100644
--- a/linux-user/microblaze/signal.c
+++ b/linux-user/microblaze/signal.c
@@ -161,17 +161,11 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     /* Kernel does not use SA_RESTORER. */
 
-    /* addi r12, r0, __NR_sigreturn */
-    __put_user(0x31800000U | TARGET_NR_rt_sigreturn, frame->tramp + 0);
-    /* brki r14, 0x8 */
-    __put_user(0xb9cc0008U, frame->tramp + 1);
-
     /*
      * Return from sighandler will jump to the tramp.
      * Negative 8 offset because return is rtsd r15, 8
      */
-    env->regs[15] =
-        frame_addr + offsetof(struct target_rt_sigframe, tramp) - 8;
+    env->regs[15] = default_rt_sigreturn - 8;
 
     /* Set up registers for signal handler */
     env->regs[1] = frame_addr;
@@ -220,3 +214,19 @@ long do_rt_sigreturn(CPUMBState *env)
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /*
+     * addi r12, r0, __NR_rt_sigreturn
+     * brki r14, 0x8
+     */
+    __put_user(0x31800000U | TARGET_NR_rt_sigreturn, tramp);
+    __put_user(0xb9cc0008U, tramp + 1);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.25.1


