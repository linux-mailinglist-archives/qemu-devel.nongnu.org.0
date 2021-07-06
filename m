Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5643BE01E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:14:10 +0200 (CEST)
Received: from localhost ([::1]:34004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vCa-0004xs-W3
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upS-00021x-6Y
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:14 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upA-0006hl-Qb
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:13 -0400
Received: by mail-pg1-x532.google.com with SMTP id 62so424427pgf.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1VZpf/Cjga2uC2Sey1urjoKxB8BD12dYWIoT4C3ZK3w=;
 b=U7UpySBmEqKTDQEHakJwBNclungbIfMHfhPkq/alokfnr9Y7+7ZDvF81xaCHSGGKsA
 fASYwiV9CgX7v/Vj4xpvPQ0OQKv/Nc7xyXSwZBwDSEYU40jP/91r2llQz3rH8neCBeVT
 bqDKv8FdoUshjPhplFe+LgeXv6emGcYB6WjRrrrbU63sPSAAAkEv/iMzLGA37U16PK6e
 64rkbixYhPgluHbh1UjLTHWGZK+cGYE9F+0ez03JIm5PylD25/SDrH4eJPD8QMOoXn9S
 l8ZjHjIfyCavmIUvsbPiEWOnrJUkOWT95XahWRw5T13KBYgFXvfU4cFuWV9YvoDvr2WS
 ZDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1VZpf/Cjga2uC2Sey1urjoKxB8BD12dYWIoT4C3ZK3w=;
 b=rIiBLz8pkUQ8uzlIsiK4flNAfMAP+6X8MXH9o0WWNfTktErCYTfaxXRnMdyxOD+Dfu
 7/wJtibZm6vzrdW/1dZ90L1gh45/w6OSx8wG2YKLCDWdtP9xjj0X78cYP9OaNp8hQQOB
 3oK+pgB+7jM4hWQFu6fvqb1ijR8wRxJv1vMT85g2u0rXhkZGkQqh+X+WHXjhUb3rU8Ic
 nEiMIVCPY4mX6aRNfhu8BW0aG8domfGwikYVL+apdO8DjVBsSFs2SguSY4xcPB95j4M6
 ieh7YQUqB8pP7rCojD3orTweT4Iw+7u6QKDjQHsVoIHVqcwEsTHsP5Cf306D256Ww8q9
 kvcA==
X-Gm-Message-State: AOAM530lPC0VQKWMZzA7w2CsbCWdQnIIuTeRcpRoxI8H2mPVHFjK0bXa
 Hx18yUlv2djPwtum0BChiFtaI1VR3wxMdg==
X-Google-Smtp-Source: ABdhPJwBJ8vrS8Lr70vGv0UTJj2qY6Tfe4opGKyOS6FqRzx8BFwIBIClP3OTzi59be9uek7mTPj+UA==
X-Received: by 2002:a63:171e:: with SMTP id x30mr23773106pgl.368.1625615395585; 
 Tue, 06 Jul 2021 16:49:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/36] linux-user/sparc: Implement setup_sigtramp
Date: Tue,  6 Jul 2021 16:49:31 -0700
Message-Id: <20210706234932.356913-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, alex.bennee@linaro.org,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_signal.h |  4 ++++
 linux-user/sparc/signal.c        | 32 ++++++++++++++++++--------------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 34f9a12519..e661ddd6ab 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -69,6 +69,10 @@ typedef struct target_sigaltstack {
 
 #ifdef TARGET_ABI32
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+#else
+/* For sparc64, use of KA_RESTORER is mandatory. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
 #endif
 
 /* bit-flags */
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0cc3db5570..65e9b7f8b4 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -290,13 +290,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        env->regwptr[WREG_O7] = sf_addr +
-                offsetof(struct target_signal_frame, insns) - 2 * 4;
-
-        /* mov __NR_sigreturn, %g1 */
-        __put_user(0x821020d8u, &sf->insns[0]);
-        /* t 0x10 */
-        __put_user(0x91d02010u, &sf->insns[1]);
+        env->regwptr[WREG_O7] = default_sigreturn;
     }
     unlock_user(sf, sf_addr, sf_size);
 }
@@ -357,13 +351,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        env->regwptr[WREG_O7] =
-            sf_addr + offsetof(struct target_rt_signal_frame, insns) - 2 * 4;
-
-        /* mov __NR_rt_sigreturn, %g1 */
-        __put_user(0x82102065u, &sf->insns[0]);
-        /* t 0x10 */
-        __put_user(0x91d02010u, &sf->insns[1]);
+        env->regwptr[WREG_O7] = default_rt_sigreturn;
     }
 #else
     env->regwptr[WREG_O7] = ka->ka_restorer;
@@ -774,4 +762,20 @@ do_sigsegv:
     unlock_user_struct(ucp, ucp_addr, 1);
     force_sig(TARGET_SIGSEGV);
 }
+#else
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(0x821020d8u, &tramp[0]);   /* mov __NR_sigreturn, %g1 */
+    __put_user(0x91d02010u, &tramp[1]);   /* t 0x10 */
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    __put_user(0x82102065u, &tramp[2]);   /* mov __NR_rt_sigreturn, %g1 */
+    __put_user(0x91d02010u, &tramp[3]);   /* t 0x10 */
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
 #endif
-- 
2.25.1


