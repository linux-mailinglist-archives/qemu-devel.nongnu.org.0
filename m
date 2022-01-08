Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66199488259
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:29:53 +0100 (CET)
Received: from localhost ([::1]:37388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n676m-0005Ou-D8
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:29:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ii-0005KO-MP
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:13 -0500
Received: from [2607:f8b0:4864:20::134] (port=37412
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Ie-0003Pp-7n
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:06 -0500
Received: by mail-il1-x134.google.com with SMTP id 2so2324349ilj.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLTwIHEIl13GSbdWHtA7LCjVkj5LLcCAHprKI0xeB4I=;
 b=4lFcgypJReRH3+v5LQNNNcGKNixJ4XHsBqLakGEpSGXTwBOU+aKzEj2ylU2uVNUSMS
 0kEy0TgmrQogQE7exdxQCpECDfsJZnwYMUjdub22jb2o5eAI1yeyrlgwC2YukpQcOVNZ
 SBQTSN8GECMFEIiFrqER/fwWlbyzA2drQi7wF/82bbeY1MsQqoDPbGtUL3h4mBronWSL
 C5HjoUTWdWAoeizYy6pqkrZJqyJD0vyxmrSwLxVSGy5GfLoYOP22DK8oCUHhxryZa9XU
 zwDoBczo3WRi085/v7IyFBOmUOCsw1UCU1b3n8r2aFgHJe+q/0AuGnbdWvcO4vlCqqhb
 u0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLTwIHEIl13GSbdWHtA7LCjVkj5LLcCAHprKI0xeB4I=;
 b=qwhaCHqvggA1cSLVfkA6RdjjMfcRXYrbFcuDAiUVAMhMWLb1ZPr+FiS0n74xj8B8g4
 SlCc8XZPPpdvbyK4sPt6mZnPhlmy2U+IyJXXLxD+jOO+AszZOq1ZnFnyyFxcrs3o/Cx5
 tgczztTKufTadfGw8Xj+kkFlzofmjGGnkQPvrmb1k7oa8np92vLc6U61/wf530Fg1eZy
 2FlRgYcvMy6fAwbbx+Ox9BDMBcNEcHYwkK7gIDoxcHDKDYQdpk+nfRvOZ1KJg/l+AaE9
 CPk6o+r4ALBy42MuJQJr/aXus+GiW7FgkCWaL6wNSCBErCxV6SouLGP62sdDOCv3jg/0
 pgOg==
X-Gm-Message-State: AOAM532db7YDS1GLXGE+qK0z/JmDctL/ZPhQwWHc6bl4i+uOE3pDl6mU
 0Px2q4pLasLQ9ICA4WNog76TquugoodCd1Sq
X-Google-Smtp-Source: ABdhPJyroJ6d1NLPvLF+CdzcMJVJVohvG9kJpuKazDmwM3Bl4lyl8YlyfQITAjCtdKaoCrHvgACI1g==
X-Received: by 2002:a05:6e02:1569:: with SMTP id
 k9mr30182738ilu.290.1641627481369; 
 Fri, 07 Jan 2022 23:38:01 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:01 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/37] bsd-user/arm/target_arch_cpu.h: Implement trivial EXCP
 exceptions
Date: Sat,  8 Jan 2022 00:37:19 -0700
Message-Id: <20220108073737.5959-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement EXCP_UDEF, EXCP_DEBUG, EXCP_INTERRUPT, EXCP_ATOMIC and
EXCP_YIELD. The first two generate a signal to the emulated
binary. EXCP_ATOMIC handles atomic operations. The remainder are fancy
nops.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_cpu.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
index 2484bdc2f7a..9f9b380b137 100644
--- a/bsd-user/arm/target_arch_cpu.h
+++ b/bsd-user/arm/target_arch_cpu.h
@@ -48,6 +48,39 @@ static inline void target_cpu_loop(CPUARMState *env)
         cpu_exec_end(cs);
         process_queued_cpu_work(cs);
         switch (trapnr) {
+        case EXCP_UDEF:
+            {
+                /* See arm/arm/undefined.c undefinedinstruction(); */
+                info.si_addr = env->regs[15];
+
+                /* illegal instruction */
+                info.si_signo = TARGET_SIGILL;
+                info.si_errno = 0;
+                info.si_code = TARGET_ILL_ILLOPC;
+                queue_signal(env, info.si_signo, &info);
+
+                /* TODO: What about instruction emulation? */
+            }
+            break;
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
+        case EXCP_DEBUG:
+            {
+
+                info.si_signo = TARGET_SIGTRAP;
+                info.si_errno = 0;
+                info.si_code = TARGET_TRAP_BRKPT;
+                info.si_addr = env->exception.vaddress;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+        case EXCP_ATOMIC:
+            cpu_exec_step_atomic(cs);
+            break;
+        case EXCP_YIELD:
+            /* nothing to do here for user-mode, just resume guest code */
+            break;
         default:
             fprintf(stderr, "qemu: unhandled CPU exception 0x%x - aborting\n",
                     trapnr);
-- 
2.33.1


