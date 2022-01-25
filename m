Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CA949A67C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:22:08 +0100 (CET)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBTD-0008RM-WB
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:22:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfL-0002Iq-Kp
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:43 -0500
Received: from [2607:f8b0:4864:20::d36] (port=46748
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfJ-0001iH-EY
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:35 -0500
Received: by mail-io1-xd36.google.com with SMTP id e79so21850537iof.13
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qw0iKda6K/BG/4NkGq3qGLHqviR4+9EjUAirJBptKSg=;
 b=vE/wuRmr+pfr56k7pnnLZnvYXgb0KjZ3Kk660eW1r5X1BdSrBw5nRU3nYoPUUG56bX
 BOg4wNIGcU6Tn8lDBxBQz3/Lc7q5yN8jg/iVzI8CrFGkG0Mf07ONAyXEYjX/eDQHeUgT
 pghTBbzP/HNXZagT9L/ziGQSneJO0bxRj5twyYSBAq6pLY4T134oD+DEImbz6Q142yj5
 iXgEc4tltPYmirfsAD3X8lk30OhXx8bBubuMsUN7vQdlOX8KMRkHuwKw5K0WvSo9VvUh
 We/mJ2/5D/3lQF7zyr2c/DElNzMTyn2xMlQy4J0a0RkAijwkboAScxQXezsJGFkcaH6k
 o89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qw0iKda6K/BG/4NkGq3qGLHqviR4+9EjUAirJBptKSg=;
 b=GK0ZoZAlswig3fKOWdm5P0abj3blkXViGT1euebnqT2ePGcgzCtwK7wDYwGcYHKVQ5
 uHqgpdB7eE47Jn/Dq4K4R4huCmfo89bt5gWOlOrQHTbwF7ZPEdLE7Elx8GRr3TtD3S/H
 reKCYKKNmBnowYYL55ayxZqNNer2LNgwrrzTqJ6u8JoRuvE3fmigRjSQey+r9SR6ssYO
 qxnTCkY67QIBGtUWo/6/BLuFiIJl3aOM5gQr/2jm3f4B1ApIIY0tFuZ4eIS60KS5kVH7
 cKD5Psjdy462401jMq85IDG86yyizTilXH4y+ZiD9uQ4ji0DGkC+ZhC2EFltEjW4CA4O
 GhEQ==
X-Gm-Message-State: AOAM531PRzu/b9HZYqKM8BMDhGLYRyI6khGV7TONzL+QZ7JiQRTeuug3
 TapZR9ATtD7e6KxNqxV0o+QNRaBsHv3j5w==
X-Google-Smtp-Source: ABdhPJyTUudy6xdbqsh7I6LyBPaDZXKVt+kfVF+UTKmV696muKK864AGLNpg0IKw25V+598+wPlJLA==
X-Received: by 2002:a5d:88cb:: with SMTP id i11mr9537596iol.119.1643074231128; 
 Mon, 24 Jan 2022 17:30:31 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:30 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 37/40] bsd-user/signal.c: do_sigaltstack
Date: Mon, 24 Jan 2022 18:29:44 -0700
Message-Id: <20220125012947.14974-38-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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

Implement the meat of the sigaltstack(2) system call with do_sigaltstack.

With that, all the stubbed out routines are complete, so remove
now-incorrect comment.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 72 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 5 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 42021556d65..4ec5598eb43 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -25,11 +25,6 @@
 #include "hw/core/tcg-cpu-ops.h"
 #include "host-signal.h"
 
-/*
- * Stubbed out routines until we merge signal support from bsd-user
- * fork.
- */
-
 static struct target_sigaction sigact_table[TARGET_NSIG];
 static void host_signal_handler(int host_sig, siginfo_t *info, void *puc);
 static void target_to_host_sigset_internal(sigset_t *d,
@@ -570,6 +565,73 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     cpu_exit(thread_cpu);
 }
 
+/* do_sigaltstack() returns target values and errnos. */
+/* compare to kern/kern_sig.c sys_sigaltstack() and kern_sigaltstack() */
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp)
+{
+    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    int ret;
+    target_stack_t oss;
+
+    if (uoss_addr) {
+        /* Save current signal stack params */
+        oss.ss_sp = tswapl(ts->sigaltstack_used.ss_sp);
+        oss.ss_size = tswapl(ts->sigaltstack_used.ss_size);
+        oss.ss_flags = tswapl(sas_ss_flags(ts, sp));
+    }
+
+    if (uss_addr) {
+        target_stack_t *uss;
+        target_stack_t ss;
+        size_t minstacksize = TARGET_MINSIGSTKSZ;
+
+        ret = -TARGET_EFAULT;
+        if (!lock_user_struct(VERIFY_READ, uss, uss_addr, 1)) {
+            goto out;
+        }
+        __get_user(ss.ss_sp, &uss->ss_sp);
+        __get_user(ss.ss_size, &uss->ss_size);
+        __get_user(ss.ss_flags, &uss->ss_flags);
+        unlock_user_struct(uss, uss_addr, 0);
+
+        ret = -TARGET_EPERM;
+        if (on_sig_stack(ts, sp)) {
+            goto out;
+        }
+
+        ret = -TARGET_EINVAL;
+        if (ss.ss_flags != TARGET_SS_DISABLE
+            && ss.ss_flags != TARGET_SS_ONSTACK
+            && ss.ss_flags != 0) {
+            goto out;
+        }
+
+        if (ss.ss_flags == TARGET_SS_DISABLE) {
+            ss.ss_size = 0;
+            ss.ss_sp = 0;
+        } else {
+            ret = -TARGET_ENOMEM;
+            if (ss.ss_size < minstacksize) {
+                goto out;
+            }
+        }
+
+        ts->sigaltstack_used.ss_sp = ss.ss_sp;
+        ts->sigaltstack_used.ss_size = ss.ss_size;
+    }
+
+    if (uoss_addr) {
+        ret = -TARGET_EFAULT;
+        if (copy_to_user(uoss_addr, &oss, sizeof(oss))) {
+            goto out;
+        }
+    }
+
+    ret = 0;
+out:
+    return ret;
+}
+
 /* do_sigaction() return host values and errnos */
 int do_sigaction(int sig, const struct target_sigaction *act,
         struct target_sigaction *oact)
-- 
2.33.1


