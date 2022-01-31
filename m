Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398D94A5008
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:19:28 +0100 (CET)
Received: from localhost ([::1]:39866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEd95-0005vB-Bp
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:19:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcne-0004uy-KU
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:19 -0500
Received: from [2607:f8b0:4864:20::d34] (port=34545
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002gE-9X
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:18 -0500
Received: by mail-io1-xd34.google.com with SMTP id i62so18434679ioa.1
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L53wLRKkzhSwZeg5kGDXA2T9I89c4pRBaMotKhUPWks=;
 b=gpeuxAvy2cEXfh8/CZTPQnr+kklDg9Modgmh7soEjYHxoMuXx2EDwsdJGCPM21Jd8y
 LTT7mat0psrTFmVAxIDtOtOxm8/2ERBgKYHIltO/KuAkyGuOhPTBpyFIX0Pypmj/ycKL
 qMy7AC8O9cg5jcCgTspl+ffmkT9ZYg7IkSYa0IbQyrcciP1f6lZrdSNPWsyR4O3Q0lXx
 Dr1FhYFEZkOtWqCk2yRcFZs3CBY2FDEfFxSvb/UPUJH2Z7HqxSRmJrFYjRsSBfwuxeNC
 iB3iRDCJf5OrrCWF70hmzSZSJvR0bVbL8rS8JuqHmfnq2Zt717PyDZSPMgJfTl+WzEfi
 3QvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L53wLRKkzhSwZeg5kGDXA2T9I89c4pRBaMotKhUPWks=;
 b=x/A9j9C+DpTjypZZyiz5mXQto5l393JkjI18yUTAaburDDej5c+ULBuK3rVSCyqw8j
 rbWYzkS40/3PVAL6r0vEieOtiTW8P/XqOmTFZO0HrqpPF6tGm8/6SZNrSPslc69s2AYF
 8wUqfB0uj6BKD0sygfkoxfBCTznzCfdjbiOtdIBG84ncrCJ/bKFq0+z4aAAI4mOZm5iH
 sOs8oiZnb4vTCH8uRZJqKPdG4jXLwoNN7dnJiLW2EuskGaJFtV8hJSaZUvqRMnlcsCHM
 49jZdBadmv1Nj4XlrKVMqqesrBVSNVugq7zbSxBoFEdFFsaTiaf2LvDquUroEb+PofuJ
 gvRQ==
X-Gm-Message-State: AOAM530H6tyvGlo1JQwQIt1DvUEcsIsX3EYEkwjHhXvVmz34JBuKb8QA
 vYXyne8ppuCVvbSh4xVlZphx/QyOZ60WXA==
X-Google-Smtp-Source: ABdhPJzQYVQmI02Vj2n+sgNXqwaPDQio2dqMKdAYKVNuM3U7+CFRZVkWN6HYeqJAbXkpbsqR/LuWtw==
X-Received: by 2002:a02:29cd:: with SMTP id
 p196mr11947992jap.100.1643659028003; 
 Mon, 31 Jan 2022 11:57:08 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:57:07 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/40] bsd-user/signal.c: do_sigaltstack
Date: Mon, 31 Jan 2022 12:56:33 -0700
Message-Id: <20220131195636.31991-38-imp@bsdimp.com>
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

Implement the meat of the sigaltstack(2) system call with do_sigaltstack.

With that, all the stubbed out routines are complete, so remove
now-incorrect comment.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c | 72 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 5 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 5c94bd02e38..ad22ba9d90d 100644
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
@@ -573,6 +568,73 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
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


