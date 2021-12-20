Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F19D47B4DD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:12:53 +0100 (CET)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPxk-00066d-2f
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:12:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqk-0000Cv-7V
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:38 -0500
Received: from [2607:f8b0:4864:20::530] (port=43825
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPqh-0005tF-Qe
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:37 -0500
Received: by mail-pg1-x530.google.com with SMTP id 8so2861374pgc.10
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cq+EqsUr6Fk7YRDOR1iWeMyRL/11b3e2J0Pnd4eMUrQ=;
 b=ga3rCoEMdutGA7gepfJ20KyKDlpEqPg/VW2r4JNBTycV90TBDaUri5jV7yYBzOu5jE
 cbspCSG5NBxcLulxIPtfwztz5bcbe7Ynhm2oW+wA34pqDgH9t62zPIJp20x2LYGQLP3X
 1AodpqXqXNXxDjN+t204eb0T7MjCKrDvMGLuTPgijCeSj79oeNRry46JMoQbhxBMVDyf
 R/wMug5DrjXHoHFyFJLMCHCithxuh/6C7FkYW+CsojDIFYRA+cRSf8fvlkYkG32Xeaca
 Lr8OlvzY3meSd24jrlEZEtj7X9kfiUBMNQQbn+ZVmmKOlAbxoWz4edclwcV2+DykPTRF
 aAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cq+EqsUr6Fk7YRDOR1iWeMyRL/11b3e2J0Pnd4eMUrQ=;
 b=Lz8cge6xYPHP6bGjDGx6d5/4Zk2yP5d8ZE3mOD6Nwb44zKwnF9S47Bhd9h4kbpzokr
 B4AhEX1+IECHGxnc4v+QmSmsXK/PIlsxwmxTcxcm5/mWRlUSA0ltCqqFwCqD3XAU87Vu
 CADF83PiWlXm05+KPXOFZGFjvkTQpSh89HBgWc12JCa7u4dqhJ/YstKdQ41oJdktqn/2
 LyBCCeoaSaiOAtwyDRdyRAbHOUuXSD+KB8XMhAN2K5h+12mYr2nACbFEh4IzSK8sfdZ/
 9R7TEFm3nkrrl6+ONR88MkM+Hc9uZoIywf3rcoHjMLt9N81HioOFcitJIhCOg3tiuqK3
 uK1A==
X-Gm-Message-State: AOAM533Y7WqyLbt+MOO5uNPbiPEn2zD+JQ7jWMzOkRLddaiZPLIIc341
 yxpneXXaryI71JTtqBUvQiAv/a/cXuBkoQ==
X-Google-Smtp-Source: ABdhPJw75tu/Pm3fnuArGXTl4hU8nRFyEThTS7MNWBPq42SfAZBW4ulf2pBG02LjfEYUMeXgfwmWWQ==
X-Received: by 2002:a05:6a00:1744:b0:4a4:f4e6:1cc0 with SMTP id
 j4-20020a056a00174400b004a4f4e61cc0mr17870833pfc.15.1640034334605; 
 Mon, 20 Dec 2021 13:05:34 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/24] linux-user/hppa: Use force_sig_fault
Date: Mon, 20 Dec 2021 13:05:09 -0800
Message-Id: <20211220210529.150423-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.  Fill in the missing PC for SIGTRAP
and missing si_code for SIGBUS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hppa/cpu_loop.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/linux-user/hppa/cpu_loop.c b/linux-user/hppa/cpu_loop.c
index 375576c8f0..b09caa1111 100644
--- a/linux-user/hppa/cpu_loop.c
+++ b/linux-user/hppa/cpu_loop.c
@@ -110,7 +110,6 @@ static abi_ulong hppa_lws(CPUHPPAState *env)
 void cpu_loop(CPUHPPAState *env)
 {
     CPUState *cs = env_cpu(env);
-    target_siginfo_t info;
     abi_ulong ret;
     int trapnr;
 
@@ -147,26 +146,15 @@ void cpu_loop(CPUHPPAState *env)
         case EXCP_ILL:
         case EXCP_PRIV_OPR:
         case EXCP_PRIV_REG:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->iaoq_f;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->iaoq_f);
             break;
         case EXCP_OVERFLOW:
         case EXCP_COND:
         case EXCP_ASSIST:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = 0;
-            info._sifields._sigfault._addr = env->iaoq_f;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, 0, env->iaoq_f);
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->iaoq_f);
             break;
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
-- 
2.25.1


