Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8A041796C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:08:59 +0200 (CEST)
Received: from localhost ([::1]:47936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mToh0-0000ZX-Ow
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY0-0002ep-3v
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:41 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:42613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXu-0006vL-2F
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:39 -0400
Received: by mail-qk1-x734.google.com with SMTP id t4so28576879qkb.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gwFLRVkTdcJ6AaaaGFzbcnne0zgO30rR8Nm1DoFMwjE=;
 b=eXml2nXat9+Vihtlw6ZwnOLHOSI6g2gFXnIN6qzzVvp+XuCFeRcQUm7FYmiHLZx+T3
 nyP/C4ulaqfdsDm6PiQH/NjtqlLqtHDDRPFdUB34RoOogjKONQ/Yo1RhfM0hfoTD0wsH
 PmC+7evT+7/GZb8mtMrv9gLBb29GtrqU9sGdD8jVIC1vUtPMQ4ojJHzrr906UmgZTNSi
 kG0ZBPRl/XBwvKdCl3Z19YJ6zthA+jwi33xOgOMx6PNH4PYjkCPTb6EoyQi58Shm0Pjn
 1bipsOKuCgA2DBw408s4EYxkFuhIEkCXD/Hq7D9490UxnGHuuyKrLSt2QJnxxB8Ok2OR
 F6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gwFLRVkTdcJ6AaaaGFzbcnne0zgO30rR8Nm1DoFMwjE=;
 b=2Wkq+O5UvgpPfddzliuJ9NTVOmKgwbgTXreua2rSmstmo6+/9KwTyQxsyDAj6jo7nw
 ERbqFzK19mnlqeLRkTM349RZ2XZqOOqNm2DlDQs5F3C7L3pks3lM2GYuDpTTYpPW81AK
 YbzmY9AmLKcDdEk3zYyXPKxv7iVQxpkgUn8dk7kwTstwaX0EyzPvuAsHQlZhPhtUtmJr
 +vqCXlOmv1gB7Nsa53g8kswh+aOwAmMJ8rnBvIz5pJL6jy7/oYZpo1xJU5pUzSmkCUV1
 rZckTxyYn3JFgrwy01AGEU+zKGf626zuc1OLgPCVyksioEdbk9Z25qmUsPN8HoHujvEW
 xvaw==
X-Gm-Message-State: AOAM532oz/073c9U7Dg8BQp1njK6qdqt4whQxCZtw1dh71YAmDjY9Zpy
 VJkRna9WPofvpGHLP8M4Nk2Lq5zQIRRIuw==
X-Google-Smtp-Source: ABdhPJzXCoE1Zr8FK4ghZFUCDxR1/OVKedNqlMgPLNtu51765q9w7Z4EVQbILJkxSh98bGn6io6EgQ==
X-Received: by 2002:a37:c42:: with SMTP id 63mr11738951qkm.104.1632502773217; 
 Fri, 24 Sep 2021 09:59:33 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/27] linux-user/cris: Implement setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:06 -0400
Message-Id: <20210924165926.752809-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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

Split out setup_sigreturn so that we can continue to
initialize the words on the stack, as documented.
However, use the off-stack trampoline.

Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 2c39bdf727..7f6aca934e 100644
--- a/linux-user/cris/signal.c
+++ b/linux-user/cris/signal.c
@@ -97,6 +97,14 @@ static abi_ulong get_sigframe(CPUCRISState *env, int framesize)
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
@@ -112,14 +120,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
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
@@ -135,7 +137,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     env->regs[10] = sig;
     env->pc = (unsigned long) ka->_sa_handler;
     /* Link SRP so the guest returns through the trampoline.  */
-    env->pregs[PR_SRP] = frame_addr + offsetof(typeof(*frame), retcode);
+    env->pregs[PR_SRP] = default_sigreturn;
 
     unlock_user_struct(frame, frame_addr, 1);
     return;
@@ -187,3 +189,14 @@ long do_rt_sigreturn(CPUCRISState *env)
     qemu_log_mask(LOG_UNIMP, "do_rt_sigreturn: not implemented\n");
     return -TARGET_ENOSYS;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 6, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    setup_sigreturn(tramp);
+
+    unlock_user(tramp, sigtramp_page, 6);
+}
-- 
2.25.1


