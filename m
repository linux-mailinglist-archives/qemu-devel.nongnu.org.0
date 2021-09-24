Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E75E417982
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:14:35 +0200 (CEST)
Received: from localhost ([::1]:37030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTomQ-0003hX-K6
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY4-0002gb-UW
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:44 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:38828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToXq-0006rd-KE
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:44 -0400
Received: by mail-qk1-x732.google.com with SMTP id q81so25089127qke.5
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VOAvx3TChGYyGqXcRBxcpjzeCX+UxKswiiX03Eo6C3g=;
 b=lwQTK+KUnDVPNS0vgUasmJy86QCOKIYv09hfvX7kHxzm545272dsnNDdHZictKJWN2
 BboCrhg6Ofgyk/5BTxUzn1aefIXYszVm0poe4bNhFpflphP5K0YuQFcu1+Lgv0ba0JCH
 dTSkVJ+KwTz4CYkcbihofXKH1biTw3Qmdd6Tf/eKZlV1oaO15ibkYykwlLG2jzPdM2WA
 B+whWbj0cmkPHHkn8O8JnC2drkPkf/oOn/agkLufOIi06k6JBwjUMOoOK+eXbUk/XKG2
 OWLBYAN9LRadrJwYYvBNyeY81MT07S8tnw6RnpJNIPgV0t1XgK0C5utnYT/DD2fV1qsy
 vhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VOAvx3TChGYyGqXcRBxcpjzeCX+UxKswiiX03Eo6C3g=;
 b=0eJT1jVc7g6fWhTBDfoiOoWbCkbQP4C/23ZMHe4u29K49nLObXKux88/cwFbY9ITwg
 jsmvl8EK30Vqghz6d97B35G+boKl5DWd1MdOQ4P4lhJ2pZ0WKa0QNzj0ycgjGmGdILjH
 r1L2wTzHTXtiXUbr640epsoLGNOlvlPJkDyjRg67L8XFu+3ZexwscnKPKxFDZ3OEDCML
 rhxZh0ou0Z6hhkB/hqB6HmV2YAxJ1UwiU7TD9NIu3J0t5sugf1sdU/FiteBCS4eiIk1c
 2bVv5KkOkgrI+jkXBs24IDlw97e0IMSJ/pc+HdUwqL8cpZZhKzp6k6m437MoH9/8qZcr
 xv1w==
X-Gm-Message-State: AOAM533+IwnklvyBs4Z7GdV7RliYxNgyJTECwsWeViTZSVRNySGKL/5M
 OxujtKsZqZXpGQHUhrpWndHLT/CxjZNeqA==
X-Google-Smtp-Source: ABdhPJxlbXGMRhWbdQ7he+zALI6xzy0KyNLi6APRpjXUvXP+vsQN+KMGyP4CBEnb7rni7M2K4zRHEw==
X-Received: by 2002:a37:a904:: with SMTP id s4mr1620281qke.60.1632502769750;
 Fri, 24 Sep 2021 09:59:29 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/27] linux-user/aarch64: Implement setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:01 -0400
Message-Id: <20210924165926.752809-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.
Use it when the guest does not use SA_RESTORER.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h |  2 ++
 linux-user/aarch64/signal.c        | 34 ++++++++++++++++++------------
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 18013e1b23..7580d99403 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -25,4 +25,6 @@ typedef struct target_sigaltstack {
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* AARCH64_TARGET_SIGNAL_H */
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 49025648cb..29c52db3f1 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -109,7 +109,6 @@ struct target_rt_sigframe {
 struct target_rt_frame_record {
     uint64_t fp;
     uint64_t lr;
-    uint32_t tramp[2];
 };
 
 static void target_setup_general_frame(struct target_rt_sigframe *sf,
@@ -461,9 +460,9 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     layout.total_size = MAX(layout.total_size,
                             sizeof(struct target_rt_sigframe));
 
-    /* Reserve space for the return code.  On a real system this would
-     * be within the VDSO.  So, despite the name this is not a "real"
-     * record within the frame.
+    /*
+     * Reserve space for the standard frame unwind pair: fp, lr.
+     * Despite the name this is not a "real" record within the frame.
      */
     fr_ofs = layout.total_size;
     layout.total_size += sizeof(struct target_rt_frame_record);
@@ -496,15 +495,7 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         return_addr = ka->sa_restorer;
     } else {
-        /*
-         * mov x8,#__NR_rt_sigreturn; svc #0
-         * Since these are instructions they need to be put as little-endian
-         * regardless of target default or current CPU endianness.
-         */
-        __put_user_e(0xd2801168, &fr->tramp[0], le);
-        __put_user_e(0xd4000001, &fr->tramp[1], le);
-        return_addr = frame_addr + fr_ofs
-            + offsetof(struct target_rt_frame_record, tramp);
+        return_addr = default_rt_sigreturn;
     }
     env->xregs[0] = usig;
     env->xregs[29] = frame_addr + fr_ofs;
@@ -577,3 +568,20 @@ long do_sigreturn(CPUARMState *env)
 {
     return do_rt_sigreturn(env);
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /*
+     * mov x8,#__NR_rt_sigreturn; svc #0
+     * Since these are instructions they need to be put as little-endian
+     * regardless of target default or current CPU endianness.
+     */
+    __put_user_e(0xd2801168, &tramp[0], le);
+    __put_user_e(0xd4000001, &tramp[1], le);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.25.1


