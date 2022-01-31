Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBC44A508F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:52:27 +0100 (CET)
Received: from localhost ([::1]:56218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdf0-00054r-GG
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:52:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcng-0004xT-5U
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:20 -0500
Received: from [2607:f8b0:4864:20::d34] (port=39860
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002g0-Hf
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:19 -0500
Received: by mail-io1-xd34.google.com with SMTP id c188so18404288iof.6
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yFznSEKSLa4wr4LT6m629JqoMGJyil+XeLDgIrumdQM=;
 b=UbOVK6+q8y5HMod4jvFX0eXD83YN1oQA8rQdJMXfc1bhcdEFb8/WrNZmZdgy6txIW9
 BxcAg8ufgc3J+V6zVpa77xl6LVPVFLkO7rKi3Sird2sdH5aVDhXgPcefAorQO3AR0DiE
 6h2TZqmtTd05X1J/64a94pxJBOsbK/bqJG+WUWMAeJrwiXbQ9xc2ed/6ioPmhnWP/t8R
 5EZDaNIieKxs12p3iVvcsbwym7DH1Nbd2R6CMAKeZxOFirDNDJvcIWbaeaSyZyEWfIS8
 VK83I3oHlBQ+6YKiuPwhzKlWF1aTOKDFiVPid8Yl4/8d8DTkMtajBoztoaA/xP592yki
 mVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yFznSEKSLa4wr4LT6m629JqoMGJyil+XeLDgIrumdQM=;
 b=7LENEb1e43Pycba9FufACJLtrp7nGYdoewHmgtqciUa5VKcUsCFpMLT02THsZWcKrS
 Re5Zouv6lWltKofdO/dccL5AFwwklBheL6WhK/Mm+hXoIqGs70Pa6y8dY6RA0BYk4gC9
 0S+PJV8/hBio4kWUQKeus69TioV5LOEFFZDTli5Daf2rSZ9FAGOVcVYxsd9kamAtEeYS
 RfOL3KIgd4fS3dHJZFb/rCyOMbEgU7CFIJVDE+xgfvm1TcCgEzNt/RHwV+dYFqVba7Zx
 RIuIm4uO2elnhcx6vQDFw3iusEC8/a+mjjnR+S/JYXch4xiiHxr2qgoW/rq31PWO6E0g
 UN9w==
X-Gm-Message-State: AOAM53247IWZjw4zk0WhSiqEx74/ps8PpRFLySXcExGiS1iO2gEM6Ipn
 rNlZ5Fk1qyuAHRMtK5sh6HXyX8ezaJm79g==
X-Google-Smtp-Source: ABdhPJw+lO5ryTJS5ySw4nqeeI2EW0ziKWe5q6gu1atKWc2bLrz41WXyBfRdeVafUXTHAXKFIySjOw==
X-Received: by 2002:a02:a602:: with SMTP id c2mr4602171jam.220.1643659024973; 
 Mon, 31 Jan 2022 11:57:04 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:57:04 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/40] bsd-user/signal.c: process_pending_signals
Date: Mon, 31 Jan 2022 12:56:30 -0700
Message-Id: <20220131195636.31991-35-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 34e8c811ad6..4b398745f45 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -756,8 +756,62 @@ static void handle_pending_signal(CPUArchState *env, int sig,
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
+         * Unblock signals and check one more time. Unblocking signals may cause
+         * us to take another host signal, which will set signal_pending again.
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


