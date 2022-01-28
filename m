Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66924A047E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:48:03 +0100 (CET)
Received: from localhost ([::1]:37086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDayI-0007Il-TD
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:48:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafm-0000fo-Cg
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:54 -0500
Received: from [2607:f8b0:4864:20::d29] (port=44824
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafg-0001aA-Mu
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:53 -0500
Received: by mail-io1-xd29.google.com with SMTP id p63so8829467iod.11
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+DlEs5WrZvuXfm29/4/3j1YKa0M1X3SLWmqACMEYKjk=;
 b=6dtBZu+3Z5s2Yiy6dlqBqBLqJtvUtjOC+dMHQWeWOA7JLp/skUvm1HrdghdreEinkH
 7mZqvkJgmP3F+fa+qlYrQZePg4F47U/GBifZM8LN1aleJp/R+TjNPPOJgirZOs5JU6Mz
 2WxaZXlHoh2MDZlAs19im+TNPlzYPGBCtAKXmOkQFV/PNgSjrNK7kdcQ9L7eYozapc4i
 0Qebqrde05xO1B7lVKUR0B+LciDnovRq9ZDDGMHrPFoQ7rBUAOX3rKSBKgZSo/0hA/83
 t9BiBRLRpQgI9z7j/sg4KGDjp43A3AXvrZOtO/VucQeVGUTos9LaF5sme/JnQHHrp2hC
 hDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+DlEs5WrZvuXfm29/4/3j1YKa0M1X3SLWmqACMEYKjk=;
 b=QT72RqNDY1iQ1RYDwkIOwoxhPqBrzZJFsBG25uecK+TLxJBkQA3Bpr+Sy4KLcifJcI
 B1FDN3EYVqnURGRr/ePaEfOpNkBN47oD/N/MCvqjUmcWO1HAGU+BCNg4Wl1p7JwBWDv4
 u+tcjAryazUjyu+aoryP1ZA4opHsy17N+oyUTuYUgitRHQG3VFfTkI8X0e5DohBdDkzX
 ujToEofLUB3OpM+9wo4/AdnqT1V8obMUb8Abk+74AUxXg6c+ic8pg9J1fGfPgc77lSHu
 XmGh/nrFvKZVVO/xfPocB7Fyt7dd8lAyI0Ml/rPcH/VtFZTXwaMJ6ztqXpKETukwf5as
 KCNg==
X-Gm-Message-State: AOAM531hV0vE0lcrtSW/BcNAuR/7r9BV7kQDQd+lp1bAdxqV10neAJQ9
 vRkotyGVzYUIy7SCDwIAykdakjrjMtLKkg==
X-Google-Smtp-Source: ABdhPJzN+fQmVkNV4cKMer90iUCOqaDBE+SlSIJpZllZOQjhGCAdjpQYk1PppqvBVXU/0fTCFP/4wA==
X-Received: by 2002:a6b:905:: with SMTP id t5mr6729323ioi.86.1643412498009;
 Fri, 28 Jan 2022 15:28:18 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:17 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/40] bsd-user/arm/target_arch_cpu.h: Implement data faults
Date: Fri, 28 Jan 2022 16:27:40 -0700
Message-Id: <20220128232805.86191-16-imp@bsdimp.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update for the richer set of data faults that are now possible. Copied
largely from linux-user/arm/cpu_loop.c, with minor typo fixes.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 45 ++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 9d790176420..2b395d5c97f 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -39,8 +39,7 @@ static inline void target_cpu_init(CPUARMState *env,
 
 static inline void target_cpu_loop(CPUARMState *env)
 {
-    int trapnr;
-    target_siginfo_t info;
+    int trapnr, si_signo, si_code;
     unsigned int n;
     CPUState *cs = env_cpu(env);
 
@@ -150,15 +149,41 @@ static inline void target_cpu_loop(CPUARMState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_PREFETCH_ABORT:
-            /* See arm/arm/trap.c prefetch_abort_handler() */
         case EXCP_DATA_ABORT:
-            /* See arm/arm/trap.c data_abort_handler() */
-            info.si_signo = TARGET_SIGSEGV;
-            info.si_errno = 0;
-            /* XXX: check env->error_code */
-            info.si_code = 0;
-            info.si_addr = env->exception.vaddress;
-            queue_signal(env, info.si_signo, &info);
+            /*
+             * See arm/arm/trap-v6.c prefetch_abort_handler() and
+             * data_abort_handler()
+             *
+             * However, FreeBSD maps these to a generic value and then uses that
+             * to maybe fault in pages in vm/vm_fault.c:vm_fault_trap(). I
+             * believe that the indirection maps the same as Linux, but haven't
+             * chased down every single possible indirection.
+             */
+
+            /* For user-only we don't set TTBCR_EAE, so look at the FSR. */
+            switch (env->exception.fsr & 0x1f) {
+            case 0x1: /* Alignment */
+                si_signo = TARGET_SIGBUS;
+                si_code = TARGET_BUS_ADRALN;
+                break;
+            case 0x3: /* Access flag fault, level 1 */
+            case 0x6: /* Access flag fault, level 2 */
+            case 0x9: /* Domain fault, level 1 */
+            case 0xb: /* Domain fault, level 2 */
+            case 0xd: /* Permission fault, level 1 */
+            case 0xf: /* Permission fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_ACCERR;
+                break;
+            case 0x5: /* Translation fault, level 1 */
+            case 0x7: /* Translation fault, level 2 */
+                si_signo = TARGET_SIGSEGV;
+                si_code = TARGET_SEGV_MAPERR;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+            force_sig_fault(si_signo, si_code, env->exception.vaddress);
             break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
-- 
2.33.1


