Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BBB488A8D
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:28:58 +0100 (CET)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b3x-00034K-AG
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:28:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av0-0005Y0-2z
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:42 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=40676
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6auy-00076c-L2
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:41 -0500
Received: by mail-io1-xd2a.google.com with SMTP id q5so14352192ioj.7
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NWE35M5y7jk9AxHhr1h+K7kB1EAcuO0k+kc2X1bs6cU=;
 b=sjetmxgZKNt6hXT961KklsVpGaYUpoPUBJezAza6TBEDXubT8O3rSGRAucKycG5Qug
 M+RwEtf+4MGTXGksmmXueksyB7UVlZSCW7JQDSK5N0VUPWL2bjAWuVwr/kpkXMuJskRY
 kaIyEuRBK7Boljj+aceTcYeJqOiT3Qu35uOFZ3mixlbtyfRptk9zLKqc/lznkJXqVs7D
 o7SSFAn/xxXAusYVIWE5MJ/K73UzcxQOkBhrG7chlDLZRavTVL3oHYcg23UgjkzVh0dy
 DdgmFs2TNCkovDTHPWtag12Q8vz/cHwBnBHzX479WDVcq/W70tPmc6ruuVhy9iTO/YWx
 tTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NWE35M5y7jk9AxHhr1h+K7kB1EAcuO0k+kc2X1bs6cU=;
 b=AdbyjytD8Ct8vfeIGrRV+9ALIHLsTUkFjIARLD+HMKrg7kh4d1Ngv0/qmJ6LbX4yO+
 oTG9SzhaOkaWtQGKoei51/5K7xqurQw9U66UTYFIOe9d9BxglWBfxvxTkFU6+QpQ2qDy
 9mK8iTyccLf3tVX/bCPCss/8Dok4n1uSZ70kifyiVLw2oWNIZ4EsxPWeJ5Q7b4NdMjpT
 MTRkG7lQIX/cGqtjuWIEqm8dU6cEj7F3xDk38dlcE7P8yBdp9+2udWUaJG3YD391OuDf
 PKx82Zz7WagxCHZFbj325CTZoxuK0N7jnK3nkzBvM6Tlg82c0yM98CCXMlZ7yNlTYv14
 DtFA==
X-Gm-Message-State: AOAM532KqIyA44NMRfp6RdBPcjSSoDlQ0H3fWCM27E0CpujGfR1mJn+W
 iqBzs4BHW74Vks6c4c+RS1G9Fxn5wU2DrAA4
X-Google-Smtp-Source: ABdhPJzjHmqoAAo7lzunnUtUGxZ2SKVMayJoynU6PWXl/jbrsoI5nr0v9f4dIPAE6dLjpzYEz4rTFg==
X-Received: by 2002:a05:6602:134a:: with SMTP id
 i10mr33498520iov.147.1641745177795; 
 Sun, 09 Jan 2022 08:19:37 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:35 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/30] bsd-user/arm/target_arch_cpu.h: Implement data faults
Date: Sun,  9 Jan 2022 09:19:01 -0700
Message-Id: <20220109161923.85683-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update for the richer set of data faults that are now possible. Copied
largely from linux-user/arm/cpu_loop.c

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 44 ++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 996a361e3fe..51e592bcfe7 100644
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
 
@@ -143,15 +142,40 @@ static inline void target_cpu_loop(CPUARMState *env)
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
+             * See arm/arm/trap-v6.c prefetch_abort_handler() and data_abort_handler()
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
+            case 0xd: /* Permision fault, level 1 */
+            case 0xf: /* Permision fault, level 2 */
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


