Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54374A500C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:22:48 +0100 (CET)
Received: from localhost ([::1]:47582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdCJ-0002yh-EA
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:22:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnc-0004nA-1m
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:16 -0500
Received: from [2607:f8b0:4864:20::12c] (port=38409
 helo=mail-il1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnV-0002e6-Ix
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:15 -0500
Received: by mail-il1-x12c.google.com with SMTP id i1so12412234ils.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+DlEs5WrZvuXfm29/4/3j1YKa0M1X3SLWmqACMEYKjk=;
 b=z8yvaXGmjjAJ3zxjpMyRBIyn2YA3hO9O/a6mMOBKDyC0tgNnT17OwJWgvMhm6Lfn7c
 /GLdOqA1YzzAZsjD8cIqWRY52IS0TwyfVoVZwjNea5t2LoZ/msZwZhvXdFzxtWatLQvx
 PRKSgiqhXX12m9azSPBFhanXp8i0FXm74sk5qsmEMhSSPcIuRnLZ2y5vuVatNqrwgfp6
 aLLwvNTvsrPqbW+DPH4L3z9aE3I8Htelb23UhZWODiYUwbymet5jKBEgbmemLiHWiZm6
 etbzfxeUdAL0wPeDsD6L9oXoUFj8aEjgL96zJNSaWkap+pVOd98wil4eLFstNbLAj/B6
 QjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+DlEs5WrZvuXfm29/4/3j1YKa0M1X3SLWmqACMEYKjk=;
 b=qqWgKxK03MVNfZSACkpsW5tj3F33bzSQsFh0qsemLwBlSVQA4XVfLj+L/gMi6yZJeI
 dni3x6opLVmBfr/TpVddOV4Ce4p2kiBK9fOngjLwsMd21SOs8R+ILL0ArJggB9xfpPp4
 lXh9q96Vv6s82nQoemAqMRmS66/CDCBdkNxrFTvjk3Pg/Nnx8U52reB5SDrQZ495CU4u
 c0l119+cg2rMpoQjDdmI3G7DmMHrusWLV/6Ssg26B4o/Id3kbq8hIbvpnwQhJhoc4hww
 cslgFB9bX9rUBl+SaUCGy9l5hW7lCELFTTZD1KpABMWRfiL3jNfEwsCztM+vr2j6Yeir
 qHqQ==
X-Gm-Message-State: AOAM531ewqNGsfsiFfcpOe+B9oWyxivZMKiBeTZRw+Qi5XSzbAtN2LBz
 nbwKhxeDGDl0Wl1IfdKqHNJSwc3Qp2Y5kw==
X-Google-Smtp-Source: ABdhPJyauF7mcsxdPUt3mbZ6nIRT2xtkIXyZcY3taAO3zpQrK1eB5g8marn6ERwGNbLB/V5DZg1V2Q==
X-Received: by 2002:a92:c109:: with SMTP id p9mr13239469ile.129.1643659005027; 
 Mon, 31 Jan 2022 11:56:45 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:44 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/40] bsd-user/arm/target_arch_cpu.h: Implement data faults
Date: Mon, 31 Jan 2022 12:56:11 -0700
Message-Id: <20220131195636.31991-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
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


