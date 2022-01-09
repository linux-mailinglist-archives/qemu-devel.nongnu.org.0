Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD951488AB9
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:57:30 +0100 (CET)
Received: from localhost ([::1]:38852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bVZ-0006Hg-Rq
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:57:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avH-00068E-Tb
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:20:00 -0500
Received: from [2607:f8b0:4864:20::12c] (port=41678
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avG-0007Ay-Fp
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:59 -0500
Received: by mail-il1-x12c.google.com with SMTP id r16so7581237ile.8
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0P5M3SYYhj6/NJKc2UQgkWoQEN0Yf6hQsN8Efb/RAIs=;
 b=TrVxpudwls+XUnqPM3BPhYIxbacH1sRyGNRhilhJZowoYdfsxrev9oMdQKPf6lDyHw
 M+o3uSXIL6gi1a/J0vc/dBxOmZSSJFrI+/OQTJ1pFXnPr3bPTcz8cZaCSTYHBZiltetf
 riXf2vhn37c+dCBXH8ZvQ3NvUJqT72Kf51FevgIli9oo9Q+ZfCDOkw4qy8hxnfrlfpak
 mKqsgWhePCLlO4Qbex26cSoIK0Rher5Ck2QMHC/PRqr8nAQoON8ayzKILd6d06fTvFNx
 e54zSowz3sRv8xBRkvTJq4Ua1sqJrX86nhJX0/qUs8xxHoHAEUUHBL4XMnTVRPslsCrv
 fIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0P5M3SYYhj6/NJKc2UQgkWoQEN0Yf6hQsN8Efb/RAIs=;
 b=FdGJNih0tdmU3gslaAY4CHWu1PR3FEWR8IA3ApL3jlyLI9GuPv/PAtSAQlJfRmENuA
 sk3mkLGbdC2gOCXkgDoInYxAVcfyewMJ+ZorQ9wLx7SX7Xr0suxmMxqxypoX77XDkoQt
 MJQnIP8OSu2FxJEemltdMG8+LyrnKMDwDvt3KWOBkaOhu6LJQjyXeLcwq5/+1fr6xkgq
 KEmFkShqYzgkuZfSb1VdNQLC6nf6xZtpTuE/aAf9UWMQoteCBefeaeFvpOG6q9RQObOh
 TJCsjpNehULUFhIdtBTxmRrBN8rMimn3zSF7LWx+Rmyz5tgzP7vvyNMIzd3D6V7h/KT7
 KnXg==
X-Gm-Message-State: AOAM530qTcJZPd7ue2aBY9iqtvI5rSsy6qmM1zbYhRH4RVpg6mR0/NLw
 Cz8zB5yMpGSl4iM0cgMVSXphL4B6NM8mbONJ
X-Google-Smtp-Source: ABdhPJyoc4/st2Wxbej2x4rns8XodZ2W6cD2TXIJfjK7CGST7ga9IIHqZPQt7CxMftZqxxMTD8PUIA==
X-Received: by 2002:a92:c26c:: with SMTP id h12mr36419561ild.229.1641745197295; 
 Sun, 09 Jan 2022 08:19:57 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:56 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/30] bsd-user/signal.c: process_pending_signals
Date: Sun,  9 Jan 2022 09:19:20 -0700
Message-Id: <20220109161923.85683-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Process the currently queued signals.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index c954d0f4f37..1dd6dbb4ee1 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -781,6 +781,40 @@ static void handle_pending_signal(CPUArchState *cpu_env, int sig,
 
 void process_pending_signals(CPUArchState *cpu_env)
 {
+    CPUState *cpu = env_cpu(cpu_env);
+    int sig;
+    sigset_t *blocked_set, set;
+    struct emulated_sigtable *k;
+    TaskState *ts = cpu->opaque;
+
+    while (qatomic_read(&ts->signal_pending)) {
+        /* FIXME: This is not threadsafe. */
+
+        sigfillset(&set);
+        sigprocmask(SIG_SETMASK, &set, 0);
+
+        k = ts->sigtab;
+        blocked_set = ts->in_sigsuspend ?
+            &ts->sigsuspend_mask : &ts->signal_mask;
+        for (sig = 1; sig <= TARGET_NSIG; sig++, k++) {
+            if (k->pending &&
+                !sigismember(blocked_set, target_to_host_signal(sig))) {
+                handle_pending_signal(cpu_env, sig, k);
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


