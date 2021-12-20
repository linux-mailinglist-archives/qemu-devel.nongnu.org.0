Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FF647B4FD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:18:16 +0100 (CET)
Received: from localhost ([::1]:35216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQ2x-0001FZ-L0
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:18:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPr2-0000ow-DM
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:57 -0500
Received: from [2607:f8b0:4864:20::632] (port=39782
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPr0-0005wn-LP
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:56 -0500
Received: by mail-pl1-x632.google.com with SMTP id z6so9030138plk.6
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aSGoNpLJmGSYi5bNrETBfs3C1lY0kiG6L8JLO5qLPZk=;
 b=n7wLEY/73s568cM9RrtDPQwjHMyuIZZptCK0zOFXh/gPxMoUkYArncRg6HEfOsuqIa
 QxJITT1TIAzMwIFNR9cXZ7IHycLoDlTzyvSAinn7XmCj7ObXDTobCQrzooKZrRffa7Sn
 d8hdH6uqg/XaUbqr3/OFBvFND/WLuqbvKtC/P7iHWRkKtJtz72dLGVgekIqqn8QG5G8j
 YKHRXqxoVEAIDNdpfSGtQ1fRifBgVHxV5fb4/O2qLUf8kg04IPqKZ0va5zldP29PpfcE
 vbInF+4YsVx0UmfBUDR4btGWZMM5CSeI/qVgA3Cgj2+s/bxIYaG+xaVHw1e/NHygZL8t
 F4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aSGoNpLJmGSYi5bNrETBfs3C1lY0kiG6L8JLO5qLPZk=;
 b=4TFryICj5xQxvuCbMx1PkQo6kXjdKdZaGJSO1jVfpSCZPZcY4GYORBZbtTdUfsH7iT
 a27izFX3wwFUa86OWCmzse/9LhTkKeCSnSva+Iu7xbHgYfWFqtIqfWTc8c/vnxf9AinB
 5KoxTytYnHj0AwzMs00so/u22UwgACRZRhIC4f66PHo2SJSxc51dbUHCPk6JUuaR9Y2T
 d59T9jpDGOODzet8ePlZ6aiJYQhc6IlP6odzmD+jLH2ZXKgoE8v/5Kh5wxrCQp+LfgJ4
 XvZN91Qc9154WHjK6G3M/JrtSUVk/LM7L3xfdWNZJyZVf1GU7Ak6R+Xbx2oMTbO+gCz/
 hboA==
X-Gm-Message-State: AOAM533q+wq86J9ciDxK86LtGDDqRITOUVIxqREkthvbeNRLGh3b5E/r
 kOsF/cKJ6W1UKsQFd0tmAOVnTnWEvcocHQ==
X-Google-Smtp-Source: ABdhPJzfsvPYDialBe/t/kCk/wIZC7HV/JLYk+tltPACbHrihSduAW9le5Hz/5kROnTSrPeobaHY4Q==
X-Received: by 2002:a17:90b:4a81:: with SMTP id lp1mr7161pjb.19.1640034349826; 
 Mon, 20 Dec 2021 13:05:49 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/24] linux-user/sparc: Use force_sig_fault
Date: Mon, 20 Dec 2021 13:05:27 -0800
Message-Id: <20211220210529.150423-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
and calling queue_signal. Fill in the missing PC for SIGTRAP.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 0ba65e431c..b3e44bc1aa 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -155,7 +155,6 @@ void cpu_loop (CPUSPARCState *env)
     CPUState *cs = env_cpu(env);
     int trapnr;
     abi_long ret;
-    target_siginfo_t info;
 
     while (1) {
         cpu_exec_start(cs);
@@ -241,19 +240,10 @@ void cpu_loop (CPUSPARCState *env)
             /* just indicate that signals should be handled asap */
             break;
         case TT_ILL_INSN:
-            {
-                info.si_signo = TARGET_SIGILL;
-                info.si_errno = 0;
-                info.si_code = TARGET_ILL_ILLOPC;
-                info._sifields._sigfault._addr = env->pc;
-                queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
-            }
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
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


