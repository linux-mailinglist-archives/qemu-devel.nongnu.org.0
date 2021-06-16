Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 857413A8E58
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:26:40 +0200 (CEST)
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKKF-0001Vl-G5
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6T-0005XE-KJ
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:25 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6J-0008NP-Q4
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:25 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o88-20020a17090a0a61b029016eeb2adf66so2769756pjo.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mIx7PGhhOXR4M9l6QkZ85W49ZDY3JRjmGJKFwi0FD6o=;
 b=xICkW3lhruXZwAVX2FhH1X8qnoSV6M6NPRL/LJ3tEQaNpVnf49UZ1jE7jsqIi61H28
 13HgeQSs1LXsMGmW7rdyXizOrz7rXRoI10SRGuS5dDqaEy6IyPCzUt9oMVYR550Km0Ri
 LqCIpDpjYDYvE5hrjdIBvBpNjNwFnAkdODOmPVLV58WV4LcmlBi+khuO7LuHHiBp+ygR
 CJdzbYg0cJlobVR7g5F/KJqyBc1QProQSKQkh7CrzHzI4BBcq1yQVjllWW67oHEF2oOV
 AVDV4HlAsyOkEgA2gEKcP2X3exJqJdEwf7ico/7G+k0y1kgKfL+ThLNfZRgPmtmKD6Ya
 8IRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mIx7PGhhOXR4M9l6QkZ85W49ZDY3JRjmGJKFwi0FD6o=;
 b=GP4rSXLQ+ww1TTBnP5MiaQu477kGWtp+rxytLM4ThnHF5lYzbPEWq35MmIspLDCyAR
 P9/jdfJJ1g2jzt3yo58ujGyy1L+wEnR+gM6oDIoK9awLhE9QY4pWxxMoq3vTULVHnv6x
 6UrORa1ZRnykU3UMCMGxMWFiwx/nxFNogGVYvLWzfVeyKdcizR20iAS67aOn9oeBbuOh
 uLQARTA3+8d25y5DB1Z7+qDWY0qbheVEDiXcYYcVmmV4VKn+ZeLyt7vezIcYATCk0jxj
 EU2iYjm69DvUUdRMxzCfEAZnNC3ZT8rTEUWyfiqOEcn9aQribmFuZVfM0OuoO1aO8cz0
 0ymQ==
X-Gm-Message-State: AOAM532330xi/ijvR0MzmkdWT8RgnWoZy4O4/a84VkS+mUSjWD9OLySV
 fYoNqjTVITHJpxjKw2PRM9sgBzt1H3w1vg==
X-Google-Smtp-Source: ABdhPJzIPpzAzP54ksWHPQd/h+/wi4vuBxN0LNzrv+8DkQlgBe+E+Cm9e75+EU0/ed9h+nSS2vpxNA==
X-Received: by 2002:a17:902:bf02:b029:11e:89a0:8694 with SMTP id
 bi2-20020a170902bf02b029011e89a08694mr1342546plb.83.1623805934539; 
 Tue, 15 Jun 2021 18:12:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/21] linux-user/cris: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:11:54 -0700
Message-Id: <20210616011209.1446045-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out setup_sigreturn so that we can continue to
initialize the words on the stack, as documented.
However, use the off-stack trampoline.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/cris/target_signal.h |  2 ++
 linux-user/cris/signal.c        | 29 +++++++++++++++++++++--------
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/linux-user/cris/target_signal.h b/linux-user/cris/target_signal.h
index 495a142896..83a5155507 100644
--- a/linux-user/cris/target_signal.h
+++ b/linux-user/cris/target_signal.h
@@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* CRIS_TARGET_SIGNAL_H */
diff --git a/linux-user/cris/signal.c b/linux-user/cris/signal.c
index 1e02194377..51d1ee877f 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -96,6 +96,14 @@ static abi_ulong get_sigframe(CPUCRISState *env, int framesize)
     return sp - framesize;
 }
 
+static void setup_sigreturn(uint16_t *retcode)
+{
+    /* This is movu.w __NR_sigreturn, r9; break 13; */
+    __put_user(0x9c5f, retcode + 0);
+    __put_user(TARGET_NR_sigreturn, retcode + 1);
+    __put_user(0xe93d, retcode + 2);
+}
+
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUCRISState *env)
 {
@@ -111,14 +119,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /*
      * The CRIS signal return trampoline. A real linux/CRIS kernel doesn't
      * use this trampoline anymore but it sets it up for GDB.
-     * In QEMU, using the trampoline simplifies things a bit so we use it.
-     *
-     * This is movu.w __NR_sigreturn, r9; break 13;
      */
-    __put_user(0x9c5f, frame->retcode+0);
-    __put_user(TARGET_NR_sigreturn,
-               frame->retcode + 1);
-    __put_user(0xe93d, frame->retcode + 2);
+    setup_sigreturn(frame->retcode);
 
     /* Save the mask.  */
     __put_user(set->sig[0], &frame->sc.oldmask);
@@ -134,7 +136,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->regs[10] = sig;
     env->pc = (unsigned long) ka->_sa_handler;
     /* Link SRP so the guest returns through the trampoline.  */
-    env->pregs[PR_SRP] = frame_addr + offsetof(typeof(*frame), retcode);
+    env->pregs[PR_SRP] = default_sigreturn;
 
     unlock_user_struct(frame, frame_addr, 1);
     return;
@@ -186,3 +188,14 @@ long do_rt_sigreturn(CPUCRISState *env)
     qemu_log_mask(LOG_UNIMP, "do_rt_sigreturn: not implemented\n");
     return -TARGET_ENOSYS;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 * 2, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    setup_sigreturn(tramp);
+
+    unlock_user(tramp, sigtramp_page, 4 * 2);
+}
-- 
2.25.1


