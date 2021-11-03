Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C417D44435E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:23:43 +0100 (CET)
Received: from localhost ([::1]:44074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHB0-0002yW-VF
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwk-0002HD-D3
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:58 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwi-00054N-CC
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:58 -0400
Received: by mail-qk1-x72f.google.com with SMTP id az8so2382041qkb.2
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QjcTOyfouWebLv6OWxrEWdluQ6cixLMqNIiFZ1J5dvA=;
 b=nJbU4XvDizlijKMngLwH31ra32Qd4idbp5DY4Jw6GtfXCIbyFJ8biQ2bP4e9bfZcPy
 QU33Y//wRpFmw2QWSTBhiI/btimEJ8w3IHMSrBwY2bCW9sYJNpFBuQzKCzFhHNAWaOSe
 XM3NqIwci3qcHoIz2pbg82Tds6k5VWSC2h9yl2EbMkps3GqdnHahSPNko38md0w41Dx1
 9zmeEHyHuzN9Pqqko+fAHfho72ZQFq5mmMp//jg8zvdY+78F3k88gcIKBLeHdzEIk4yN
 jJcn8eL0IhMQmJtcaUG3vm7tGMeWeiiUlll/2BSBNWPdw+HzyOosgZ8eaAtt8kHtgKQj
 OapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QjcTOyfouWebLv6OWxrEWdluQ6cixLMqNIiFZ1J5dvA=;
 b=lUmU1KYkp/Fhsl2g5M0oRuloTr36+Yu0w42l9xKDjAiDvcc98On+1XKr+pwn3kcvA2
 70uBdGNDwjLSokPSFINfQ0J/LTowYz9LGbmrQCAaEEU0a23SR1RLft+Ft8OPwzCUuqGZ
 kS2Ho5jTfqtcr5keWqP4PRFca25S0daiTyEFVl9OX6kX+bjgA0aIgCX0Qop4nNWdWAXy
 le9I4hJQxACSEaKhbST7EnaAkomxWLhbMmDAWNiFZIBHrWRLHKvW48undXQKsMmV++U+
 rCsqtcLCKquG7RMR4fK3heUQLZZEerfx4Bd+3hUDJLfuy/E9w0aHSTkamcgXM9uQRUQH
 616A==
X-Gm-Message-State: AOAM530Cn93gcMfJdc5hf6SVl4km8JWkYlxTVoxTpwYbErEHdjxyvbcr
 xe92PCIkAvbayEDG7HApLGXDyLRYZ+Yonw==
X-Google-Smtp-Source: ABdhPJyaDGoTG6MYjX4ddXRqV5JktVXVBeeYrpD7Juk0/oePkxuQ1N3zE6mgzX3KcpKLPbtILwGlGQ==
X-Received: by 2002:a37:54d:: with SMTP id 74mr5789043qkf.209.1635948535428;
 Wed, 03 Nov 2021 07:08:55 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/23] linux-user/m68k: Use force_sig_fault
Date: Wed,  3 Nov 2021 10:08:34 -0400
Message-Id: <20211103140847.454070-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 790bd558c3..f6ea3b97ec 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -29,7 +29,6 @@ void cpu_loop(CPUM68KState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     unsigned int n;
-    target_siginfo_t info;
 
     for(;;) {
         cpu_exec_start(cs);
@@ -46,25 +45,13 @@ void cpu_loop(CPUM68KState *env)
         case EXCP_ILLEGAL:
         case EXCP_LINEA:
         case EXCP_LINEF:
-            info.si_signo = TARGET_SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPN, env->pc);
             break;
         case EXCP_CHK:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_INTOVF;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTOVF, env->pc);
             break;
         case EXCP_DIV0:
-            info.si_signo = TARGET_SIGFPE;
-            info.si_errno = 0;
-            info.si_code = TARGET_FPE_INTDIV;
-            info._sifields._sigfault._addr = env->pc;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
             break;
         case EXCP_TRAP0:
             {
@@ -91,10 +78,7 @@ void cpu_loop(CPUM68KState *env)
             /* just indicate that signals should be handled asap */
             break;
         case EXCP_DEBUG:
-            info.si_signo = TARGET_SIGTRAP;
-            info.si_errno = 0;
-            info.si_code = TARGET_TRAP_BRKPT;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.25.1


