Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDF841093D
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 04:17:33 +0200 (CEST)
Received: from localhost ([::1]:53616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRmOZ-0002zq-3J
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 22:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5N-00044k-FD
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:41 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm5M-0005Gw-0Q
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:41 -0400
Received: by mail-pf1-x429.google.com with SMTP id y4so11344441pfe.5
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+LdqSLTC/toL0xqBBht+5qqnjjIGLiPFr2liaHYD1A=;
 b=n970EApoHmNzjtUSEdhXHLazswV1cVOO/pPVyTWTf2RPM2KUjg8OHT6iPLDiJZZGC1
 hBhnGYmATnzODxA688git9OqngctEQNohwNCeSkjMYcowzGU9+3n9kg36yLnqv388Ps0
 f6wFluYAK98PynstFW6ji7rtRo8RV/8UQBFxDDZ6tTyTglcL4tROmoXXsFApKX5bUXCt
 jw+/n2yFLa9VP1F8ebrCRc+ubcWw0+AkhNHSfbI3ezDrSNAa3T5z6a6bFnpLBnFAKkxy
 5DdIBY0ctLVi7PF2xFo4U/WCZbeQbUfBS7dIcvMrpspe0+XevVRCpHQpuDm+vPjycNd3
 4Ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+LdqSLTC/toL0xqBBht+5qqnjjIGLiPFr2liaHYD1A=;
 b=1DLNGZB6vKjME9tCVzOb9FdlIeb7WOpKZ5GBJnZWsxDF6yzTuD5J95VSvDvCqmH7c9
 JNsQMbvG/5wXBrqqLIPyI35R+DXeaoHgDW0qArh6tbGbqy7aiTzoYpHspD3ybjybSjck
 fIuC3lp4prRVxAhnFbD0QxfkobmsODg3iub+COKEO9PkksWvAll4Qu2f35Ajym5BtVH0
 2Zxn543KVj0v92uOgvH/MUPdfCcn753FjtozD/F0ipVLwnFTKgm4QcRQL2fX6FxM/3Fq
 l5iMMNaOsZdfilG3mziZ4WfVAhIgQL9n4mA+eCBj/bQEI0zKbcOK1Z0an/50QH1VspLF
 HEJQ==
X-Gm-Message-State: AOAM532yW6YZ+Y3l8lDDgnLtWrU9fHZgczAQGBTQBOENTxadYzegIudu
 sBJ3tMDmwzjZCa/Yw7yrnh49WHf6mdr3kQ==
X-Google-Smtp-Source: ABdhPJxHoJ4Rsi9ji0jrqdi6h0nr+AIWpwmDYwDnTXJKYeQhERXaLheDI7OFJTueEWnt/WA9wCsAeA==
X-Received: by 2002:a62:6246:0:b0:443:852a:2a2e with SMTP id
 w67-20020a626246000000b00443852a2a2emr14475941pfb.14.1632016658184; 
 Sat, 18 Sep 2021 18:57:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/25] linux-user/s390x: Use force_sig_fault
Date: Sat, 18 Sep 2021 18:57:15 -0700
Message-Id: <20210919015718.466207-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210919015718.466207-1-richard.henderson@linaro.org>
References: <20210919015718.466207-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new function instead of setting up a target_siginfo_t
and calling queue_signal.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/cpu_loop.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 7a1d032227..cc034b860e 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -57,7 +57,6 @@ void cpu_loop(CPUS390XState *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, n, sig;
-    target_siginfo_t info;
     target_ulong addr;
     abi_long ret;
 
@@ -157,11 +156,7 @@ void cpu_loop(CPUS390XState *env)
              */
             env->psw.addr += env->int_pgm_ilen;
         do_signal:
-            info.si_signo = sig;
-            info.si_errno = 0;
-            info.si_code = n;
-            info._sifields._sigfault._addr = addr;
-            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            force_sig_fault(sig, n, addr);
             break;
 
         case EXCP_ATOMIC:
-- 
2.25.1


