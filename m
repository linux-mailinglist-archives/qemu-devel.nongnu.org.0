Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42298488A87
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:26:16 +0100 (CET)
Received: from localhost ([::1]:35086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b1L-0005bn-Bc
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:26:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6auu-0005NA-6t
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:36 -0500
Received: from [2607:f8b0:4864:20::12e] (port=45600
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6aus-00075x-OI
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:35 -0500
Received: by mail-il1-x12e.google.com with SMTP id h5so970397ilq.12
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dyAUpEDzRYL6p8x32pfiafDgm01DpIQ/wKUR1iah5qg=;
 b=7qxQfOYRP6CNe6ZsSVBz60cpkFNFeCrhZYNmXzoEqakZ1/ndOWBOeAdquUcJHTLJOO
 nijGZjAQlVgbBCkp6g+p77JWdfI+766yn4mSGVCiPhBYPA0EnP64A1SIVXRFVZ+A81O0
 oYjGWuNRy2fOcQByC7OcdOWD5axA16Eru7NUYrscxalHyP7YsVLnmlhdfyLWI6SMvVTx
 OdOGjKEsX3j+7qMl8tsgh83Z5B8/YF4NmKZe7AyCgbC2I/REfZVmNVEvTFeRbvYcinsj
 rbSc6cIQLt5DghcZoIvYHg0lZZpeRZtFJJchscRL1vPPDEtRo1sJgbswPzMsjfrWS/ZV
 8p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyAUpEDzRYL6p8x32pfiafDgm01DpIQ/wKUR1iah5qg=;
 b=XcgCqhGINPrpE2mNAbjnWrmPBLnulUndkH5ixx2vJ7/IVsD33ZcalFE2aMMfq8bqAu
 EkDK3G65aX58VIzfyjz7AJ2/hILL8XwT84jrvCkBu6SiO3ImTda+bz8Dkg5zqDw+37eH
 +6kuRW1SMeozetwqjZW8MYTSlKGuLSTI+x5W83cS0P1SRRPwmAYmJpEf7JifhHJY3mMr
 QB9ojskO3YKRpSAlZeiWyC5kaNex7CaBRNN3iLZgBId1C1UShEbj0HEZqNuHGOsIHvLM
 VkLepIj29IqXP/Qk8J8DeOwqEdlD1ro6csXm1vWBH55ZE2q7ek152NtQGrnViTvaHuoS
 antw==
X-Gm-Message-State: AOAM53378exstLnsUsAkK4HK0csvDgCkx93W5ZLjgKp0NLbRfbQBPcJD
 VyNAK/F9EpIti1ZGm39PjlW9mBfa8uWr+Lwx
X-Google-Smtp-Source: ABdhPJyCxYpnPnFK+86BfcvFklQE3Gl8AjCPSGB91vYklkqcqD3rJMTPYlMm6xUymjg+zyr9ahx3Vw==
X-Received: by 2002:a92:c26a:: with SMTP id h10mr2912982ild.320.1641745173002; 
 Sun, 09 Jan 2022 08:19:33 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:32 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/30] bsd-user/arm/arget_arch_cpu.h: Move EXCP_DEBUG and
 EXCP_BKPT together
Date: Sun,  9 Jan 2022 09:18:58 -0700
Message-Id: <20220109161923.85683-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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

Implement EXCP_DEBUG and EXCP_BKPT the same, as is done in
linux-user. The prior adjustment of register 15 isn't needed, so remove
that. Remove a redunant comment (that code in FreeBSD never handled
break points).

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/arm/target_arch_cpu.h | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index c526fc73502..05b19ce6119 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -21,6 +21,7 @@
 #define _TARGET_ARCH_CPU_H_
 
 #include "target_arch.h"
+#include "signal-common.h"
 
 #define TARGET_DEFAULT_CPU_MODEL "any"
 
@@ -64,19 +65,7 @@ static inline void target_cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_SWI:
-        case EXCP_BKPT:
             {
-                /*
-                 * system call
-                 * See arm/arm/trap.c cpu_fetch_syscall_args()
-                 */
-                if (trapnr == EXCP_BKPT) {
-                    if (env->thumb) {
-                        env->regs[15] += 2;
-                    } else {
-                        env->regs[15] += 4;
-                    }
-                }
                 n = env->regs[7];
                 if (bsd_type == target_freebsd) {
                     int ret;
@@ -171,14 +160,8 @@ static inline void target_cpu_loop(CPUARMState *env)
             queue_signal(env, info.si_signo, &info);
             break;
         case EXCP_DEBUG:
-            {
-
-                info.si_signo = TARGET_SIGTRAP;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_BRKPT;
-                info.si_addr = env->exception.vaddress;
-                queue_signal(env, info.si_signo, &info);
-            }
+        case EXCP_BKPT:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->regs[15]);
             break;
         case EXCP_YIELD:
             /* nothing to do here for user-mode, just resume guest code */
-- 
2.33.1


