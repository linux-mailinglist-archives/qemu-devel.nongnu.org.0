Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD1A49A22C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:54:58 +0100 (CET)
Received: from localhost ([::1]:60794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCB2v-0000B5-Lb
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:54:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfK-0002IK-RX
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:37 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=34549
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfG-0001hD-Hb
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:33 -0500
Received: by mail-io1-xd2a.google.com with SMTP id i62so6182582ioa.1
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z6B0UYkYb5Cq1cN896g5C6kZxdkS9tZeevAeukDKWKo=;
 b=RLMFTjaXnXId99GyMM5lj0p2YcRt8Ljw4tVjeYNuJgaE+tJgVcvj6I+CVpc46qt/mS
 6ZYqXZhwYLVLuIM8VhXBQpq7uyVtJVCjdvip2ADDL4y4qaiGeZXOipD/DB3hQzmQTlMf
 Qr6MeSNt+EqX43JcspO1b7o4qSJDeCtf3tWc3fsUDFrKApoW1VzPkU3XeLzDQwJmf/yN
 C551D3REoqRRTJjoogpVKhR54j9zwJt8Zz3IbOnJeTeHOEIvqzOXWYx1qsWtl4mID/qc
 s7LQVQ04Q2yIRwO2HT4GaIVxF61oRe0AZVYprI3lZ5nbSCMnMgTO2bMaDXhb8PLpgsyU
 aOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z6B0UYkYb5Cq1cN896g5C6kZxdkS9tZeevAeukDKWKo=;
 b=zTqD+RucamFfUMi1pi5CTyP67buw71L+g850w63nS3Qwxa7MaVVE2+gHqPRZqTtNK7
 2MdL8Z2JWygqJUiJQVJ4KDMFgklT6rlKACMJ8LdLU4jXTwLLW6ycIAabMpVvvfA8TbKd
 yjQIqXqRJ0X1WjHlqiSaSWgbHnSry7eP5ZvqiuKRQuaVkjMz3aWXlN1SegND27xoAOMd
 E9ifW1s3Tc/moBGSK4LFYUbTS+MnfBM4tfpB/RsZU/Vw96Lnb2o0f6FonbdCh27b6Kaf
 KmjKNG3KrspmQOL8WXVWLCTUX95wPjCEOOkvmjQe7BExo7s7Qm8kN8ViIx4mqBAVVnEj
 HIDw==
X-Gm-Message-State: AOAM532slCDMrYW/uo6ZVvV5CW31yWgscKFyEwli7n3lEDrVHyXZAKpk
 cCBHNe3i8bsSZuKtr98GgXp+nPpiVj7OFg==
X-Google-Smtp-Source: ABdhPJxnYaiCykVxwWlHz47RlDslOC+bT9QvLBuyHg6eo/WnJDwnBFgb/ZV/n3Jb07RxYllOLRGjMQ==
X-Received: by 2002:a05:6602:585:: with SMTP id
 v5mr2917876iox.101.1643074227808; 
 Mon, 24 Jan 2022 17:30:27 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:27 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 34/40] bsd-user/signal.c: process_pending_signals
Date: Mon, 24 Jan 2022 18:29:41 -0700
Message-Id: <20220125012947.14974-35-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Process the currently queued signals.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index aef1fa95490..9ec4354d232 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -755,8 +755,62 @@ static void handle_pending_signal(CPUArchState *env, int sig,
     }
 }
 
-void process_pending_signals(CPUArchState *cpu_env)
+void process_pending_signals(CPUArchState *env)
 {
+    CPUState *cpu = env_cpu(env);
+    int sig;
+    sigset_t *blocked_set, set;
+    struct emulated_sigtable *k;
+    TaskState *ts = cpu->opaque;
+
+    while (qatomic_read(&ts->signal_pending)) {
+        sigfillset(&set);
+        sigprocmask(SIG_SETMASK, &set, 0);
+
+    restart_scan:
+        sig = ts->sync_signal.pending;
+        if (sig) {
+            /*
+             * Synchronous signals are forced by the emulated CPU in some way.
+             * If they are set to ignore, restore the default handler (see
+             * sys/kern_sig.c trapsignal() and execsigs() for this behavior)
+             * though maybe this is done only when forcing exit for non SIGCHLD.
+             */
+            if (sigismember(&ts->signal_mask, target_to_host_signal(sig)) ||
+                sigact_table[sig - 1]._sa_handler == TARGET_SIG_IGN) {
+                sigdelset(&ts->signal_mask, target_to_host_signal(sig));
+                sigact_table[sig - 1]._sa_handler = TARGET_SIG_DFL;
+            }
+            handle_pending_signal(env, sig, &ts->sync_signal);
+        }
+
+        k = ts->sigtab;
+        for (sig = 1; sig <= TARGET_NSIG; sig++, k++) {
+            blocked_set = ts->in_sigsuspend ?
+                &ts->sigsuspend_mask : &ts->signal_mask;
+            if (k->pending &&
+                !sigismember(blocked_set, target_to_host_signal(sig))) {
+                handle_pending_signal(env, sig, k);
+                /*
+                 * Restart scan from the beginning, as handle_pending_signal
+                 * might have resulted in a new synchronous signal (eg SIGSEGV).
+                 */
+                goto restart_scan;
+            }
+        }
+
+        /*
+         * unblock signals and check one more time. Unblocking signals may cause
+         * us to take anothe rhost signal, which will set signal_pending again.
+         */
+        qatomic_set(&ts->signal_pending, 0);
+        ts->in_sigsuspend = false;
+        set = ts->signal_mask;
+        sigdelset(&set, SIGSEGV);
+        sigdelset(&set, SIGBUS);
+        sigprocmask(SIG_SETMASK, &set, 0);
+    }
+    ts->in_sigsuspend = false;
 }
 
 void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
-- 
2.33.1


