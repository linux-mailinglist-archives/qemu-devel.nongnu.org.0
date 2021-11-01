Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DB8441FB8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:57:50 +0100 (CET)
Received: from localhost ([::1]:36856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbZ7-0006W2-KA
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb6E-0003qk-Iu
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:58 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb69-0000fc-I2
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:58 -0400
Received: by mail-qk1-x729.google.com with SMTP id az8so6041119qkb.2
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mXI5pLklfarH8j3WhgGW5xn4dLCOLkkDAfhYzkOpzbo=;
 b=o79TDMCIth9BAZqN3Dhzf+fW+9FveYliyLR5UQxymmXnx6C6UO+0GeIIxEUQ/8cSOV
 WV7HYQP6L+3waGhKz1u1tF3P5Hf4fX8Swhpdg0msFN+r+gsIR9W7AUm4mw5JqDDKIo7H
 y8VlLZ7W1VfAB7KQQIzaKke/qisJEKifNSxBpUiumCiPwWKpay/bVf1nwHV3EGw/P7Z+
 V7MdYDPTnCktsj7f+SkWIS4/1frP/upJ6J5xs1bn3IBOMXZsnFOA3vTf1LY0ggqmQ1Sr
 +PINVJMx6r1CIvrfRRAP02S9fTRSP7M5s6bmBBqzYUUQQqEGUWkL9Rd3Avc9QuGr/t0Y
 DLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mXI5pLklfarH8j3WhgGW5xn4dLCOLkkDAfhYzkOpzbo=;
 b=LKrVSKRfp9FA3wHzkYvksWPvOavj0swLLCUokLS3Vz2Tss3zqy9vma6UbiFIAPvaXA
 OGuh4+J9SXobo6c30Ht+bQBEs8NiFyGcVbMLZSqFG8rb4BgZYUaLbDFdwrNzbYyNptX/
 2JJ2ZvugCSK8nD0ksNiYuIZHAsHe7bdaKJBI75KtUzNXuiANSQYLryu6EkldyDeXAp3E
 8MooSt9XUysyWAvt6k5eFxgdxRA/rnaikokzKTrRNO4rupV4EUGkWuoAWfou2TId9yET
 F1rihukTbh4bS7G9vY9Uzm54r+p6IEU6VaTpTKqJ7NSC90V4p7JMaNrg+NuBo7hQcepQ
 n7HQ==
X-Gm-Message-State: AOAM532sd6hIDrXJTT2gszyX/3M+V/5Q7P+15fZ3p+x6Q0N6mkKxMLRR
 oACPvkVriIEvBW4UCGEt/GSF1DsbyBkfxA==
X-Google-Smtp-Source: ABdhPJz6WfGmV2DnAnCuNG+xocC+VMPHp3rps6xZivXpBW/JrnEL2oMLc/uhZVGO1Jr+w6F6WOhFwg==
X-Received: by 2002:a05:620a:44c8:: with SMTP id
 y8mr4458538qkp.327.1635787669525; 
 Mon, 01 Nov 2021 10:27:49 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 32/60] linux-user/openrisc: Abort for EXCP_RANGE, EXCP_FPE
Date: Mon,  1 Nov 2021 13:27:01 -0400
Message-Id: <20211101172729.23149-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU does not allow the system control bits for either exception to
be enabled in linux-user, therefore both exceptions are dead code.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/openrisc/cpu_loop.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/linux-user/openrisc/cpu_loop.c b/linux-user/openrisc/cpu_loop.c
index f6360db47c..10b7147f68 100644
--- a/linux-user/openrisc/cpu_loop.c
+++ b/linux-user/openrisc/cpu_loop.c
@@ -56,7 +56,6 @@ void cpu_loop(CPUOpenRISCState *env)
             break;
         case EXCP_DPF:
         case EXCP_IPF:
-        case EXCP_RANGE:
             info.si_signo = TARGET_SIGSEGV;
             info.si_errno = 0;
             info.si_code = TARGET_SEGV_MAPERR;
@@ -77,13 +76,6 @@ void cpu_loop(CPUOpenRISCState *env)
             info._sifields._sigfault._addr = env->pc;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
-        case EXCP_FPE:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            break;
         case EXCP_INTERRUPT:
             /* We processed the pending cpu work above.  */
             break;
@@ -96,6 +88,15 @@ void cpu_loop(CPUOpenRISCState *env)
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
+        case EXCP_RANGE:
+            /* Requires SR.OVE set, which linux-user won't do. */
+            cpu_abort(cs, "Unexpected RANGE exception");
+        case EXCP_FPE:
+            /*
+             * Requires FPSCR.FPEE set.  Writes to FPSCR from usermode not
+             * yet enabled in kernel ABI, so linux-user does not either.
+             */
+            cpu_abort(cs, "Unexpected FPE exception");
         default:
             g_assert_not_reached();
         }
-- 
2.25.1


