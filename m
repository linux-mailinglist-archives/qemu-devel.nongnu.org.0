Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECCD4A04BA
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:02:11 +0100 (CET)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbBy-0001L3-OE
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:02:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDag4-0000tM-4I
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:12 -0500
Received: from [2607:f8b0:4864:20::d35] (port=42745
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001bN-TH
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:08 -0500
Received: by mail-io1-xd35.google.com with SMTP id r144so9659987iod.9
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xt+oTYyYNro3WmsG/26k6iJ8qTdnlnX7PCd42MTysmw=;
 b=rEqnvtbKIIGO1cTGPVckJiE/CADWzErN1Av8V6saP1AqYhXc/t9+DbY2Ny94WIlsnY
 KubSv6bo+aRZ7kggBeuX4kEv27hvpMkXbjzKuBmP3+z7MrltVRt1dAOYSEsjSQBGmMXs
 dzakf4HBy0jAOcg+w3f5GQrp/O8CEkCdneC8bGbfREo+FrdPmiXYl872QyTYpF+jqBwO
 7H5PykAR0ow4zqblB/p0bHGo3/oHLhPeiJ0M3Wy7cytBnrnqOxeJW5PanH+szAR+ASzs
 i4MGgXpmbbmQrEJnVzLwlo9UNLAIx5tkD1u+eHY94/v0vFkZAFmIqNPITpkjuaLx7ceQ
 X0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xt+oTYyYNro3WmsG/26k6iJ8qTdnlnX7PCd42MTysmw=;
 b=yPJBqT4xuZ1bhZqKT/NIR3NX5+vPng6YAcVUoUUkaOa1ppYdfJxEmhQDV3JNhlzC4G
 SyVi5VXkrp4hmcwrtAyfqm4KwEMDHw8dJi+TDINbB8F2CXeJPJseT2aXycC2RYQ8IjRc
 YJl6MrUBxxvzMVwgxUPqyLqgMejzdMQMfTmpiHhKjQors6WhnwXRKF8yXSFdR/Mzq//K
 ky24UlYUnUKicqWpDFoH3eZQNAQjpYfFavhFwdss4oln8TgYccgdRatL1igM4X2Jzv74
 1PsuTKc83YOeOBISJPHIg41QBYxZ/5Pu2QpqG16NBSHVwDr0+MWmyRgrOmrVUPkxa2Gr
 QGeg==
X-Gm-Message-State: AOAM533W6UF5Yt0+VGbNsbV9QQiahnBckRSQYkXfVPvoe7x2edawL6QM
 uMylFTeVMXgDiSBc6vncVucNkn/9LCZeWg==
X-Google-Smtp-Source: ABdhPJwBtPq38TXe8h+hTyqhIVsZNOUggccK2SqPgxIcQkKrZJheUwUdlrvdQPon2gD4XfZUzTP6GQ==
X-Received: by 2002:a05:6602:2e88:: with SMTP id
 m8mr218673iow.79.1643412523288; 
 Fri, 28 Jan 2022 15:28:43 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:42 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 37/40] bsd-user/signal.c: do_sigaltstack
Date: Fri, 28 Jan 2022 16:28:02 -0700
Message-Id: <20220128232805.86191-38-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
index 24074d629e2..65687fbe7dc 100644
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


