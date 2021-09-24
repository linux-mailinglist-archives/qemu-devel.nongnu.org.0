Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A1A41796D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:09:02 +0200 (CEST)
Received: from localhost ([::1]:48280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mToh3-0000nI-RI
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY2-0002fi-J1
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:43 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:37455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXy-0006zQ-LN
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:42 -0400
Received: by mail-qk1-x730.google.com with SMTP id 73so28870149qki.4
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OeHNvhPeuZfmulgUe9ozzImEdGk/YkGYzR1u2KyMGGs=;
 b=zVH3lMoenLl4YiqnnqqgeZ7ttEm0hnZOlGueNBSeUaAjjJXy21eC9UAhtAf87totyx
 x0Bbn7cBm+VJzCDMbmOaW9IgG9AwV0Z8jTCZoGZS3ue0kl66al9NtKIbrAhVuBr+WRCP
 KHmSlRgeO3K7KYaWzUsiMEl3EtHECSG8cDd7Pgi0ubUhkEWheb+9Figdzi4qNMEA750o
 7oa1scl0OEEBMdyX8IClI75CE8onpSJfS/P7xi5d8pmPyoKyWtgUi70w26vdJpQOyz/I
 ITvF0BZhPLRiMXAqQxu2QcW4guD02UtS4GVKIP4Fn5QOxyD8Rjjn2wvlHqNUOM8/Em1t
 UjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OeHNvhPeuZfmulgUe9ozzImEdGk/YkGYzR1u2KyMGGs=;
 b=4XYRImmUTxNHlg2oS/H66cCntdHzOD6PjMj/LzKgUYpyY4Wwg5VeXFZzIWXXiu2dyF
 kAvdstQ7S7aTEozjRPjVd1CZHxBFp+M0DsBuST7ahOLRnTL/VnZHrpe3aroIdx2RmM0d
 L06Oji5FFWSiMomSgZG2y3tHteN9Ozh/EMitSfY7HyGknWco7cN3Y1C534jXR9+nh/UR
 grp8qhFE9+PyfhfY+p2vZzCiN9GiS7vAOLMpxz4t6D9USTZc7DtduSy3lElx7az1ndtJ
 GG6um7I7uQApDquwfUa6yl3O1HYccSt1+6/50XerqOcOP6E9konmviV5eAFliMQEtsF1
 ck2A==
X-Gm-Message-State: AOAM530NspMks1JBb4bIMdYr+Me3iXnEcyc4bIp1BpMH0iEw60A0xZsf
 YsIF64VCxDb2NQ8AkhldbEQvtHh8sG4Prw==
X-Google-Smtp-Source: ABdhPJz/xo6dPff/C+fgOYvFc/PLc9yvCDnQe6dzI4ANUAuWZOYAjar3yoMrZFLym82XunDypiHGNQ==
X-Received: by 2002:a37:c83:: with SMTP id 125mr12073152qkm.229.1632502777804; 
 Fri, 24 Sep 2021 09:59:37 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/27] linux-user/microblaze: Implement setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:12 -0400
Message-Id: <20210924165926.752809-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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


