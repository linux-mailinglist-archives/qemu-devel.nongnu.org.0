Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CA34A04AF
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:54:38 +0100 (CET)
Received: from localhost ([::1]:51218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDb4f-0000wm-Ot
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:54:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafy-0000qS-Vn
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:08 -0500
Received: from [2607:f8b0:4864:20::d29] (port=45765
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001bJ-FR
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:06 -0500
Received: by mail-io1-xd29.google.com with SMTP id s18so9653085ioa.12
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yFznSEKSLa4wr4LT6m629JqoMGJyil+XeLDgIrumdQM=;
 b=bBhIB7fpjkX15uJlky2DIAm0jocicqU/eRephtQMqCcQYWU1ii3iQahHPi2uLAS+bz
 Iu8C2pfkE/26sUwSpCKggPucunHd6MNVP07ynUTXd8pS/YDYa4bOD0HcEMXa7V6uIZD1
 VQYsxVWO8oU7AlZQT+HxPuVERTZzvSZbSl72ocfRE2ATtLrbKl+i2t2T0mZTVHOYRDRM
 J2Rt2m34g30StzTktcbo5bfKxHWO03PlEDnHuqZVRUHlyRlVynF659JsuT32gAfVuY+z
 1EZStsLZ6zYrNpWb5OIaN1THLpSqkBGR/wzct6SER93z4H6PFS0xJ65NviiiGSdK32NY
 QCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yFznSEKSLa4wr4LT6m629JqoMGJyil+XeLDgIrumdQM=;
 b=DePXAQYkCaaYqlNz3zy5EN6QIznX65xhIE0hummLKAeC1MzAxQGgI7frwub6zQ0UiA
 pF1hF658GGPt5Yn48HMdUXgk3VZzfFygjQYnzrtqhTQwILKrrSI3geXlsfih5te3+BaS
 hNIwTL+FKOFKl4Mt1aZhPSQTL8lUYhK5VeeFnJOzgbrXxpu6ZXMvrCmyAdSXD+y0Xe63
 j6gB8V16Z4rKunYCebBgD8JGJwzUnRpf1Pjyeun9lC7UJ7RdcwO5DuiFxTQPuTz/J3rS
 4BbmhR5z5PmNM08s0i+zf9EMSEK/d0/3yjHkVtnKbwv7vjb/PkRtUMZQK7YCYLFKpOcf
 Le6A==
X-Gm-Message-State: AOAM531GXCRuT6NQ4JBJ3MBzwWpN2dErljei4zencXtTr5wZF+h1EXjK
 Tq+xDbCGxlQ6rHAJEK8JZMolL67ycH0XjQ==
X-Google-Smtp-Source: ABdhPJyS8FkunFSXLhlBIgnbrMYxUwWBh4Idi1HEyLuGbu+FPFN1hUd0oQkUiVPiyAcllXDoc69OdQ==
X-Received: by 2002:a05:6638:1450:: with SMTP id
 l16mr780510jad.30.1643412520555; 
 Fri, 28 Jan 2022 15:28:40 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:40 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 34/40] bsd-user/signal.c: process_pending_signals
Date: Fri, 28 Jan 2022 16:27:59 -0700
Message-Id: <20220128232805.86191-35-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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


