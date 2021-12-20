Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE6247B4FB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:18:13 +0100 (CET)
Received: from localhost ([::1]:35036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzQ2u-00017g-Qp
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 16:18:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPr2-0000pB-Lw
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:57 -0500
Received: from [2607:f8b0:4864:20::102e] (port=42650
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPr0-0005wg-Ll
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 16:05:56 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso1120711pjb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 13:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0l8DFIUjHslvq6ryn61Vjm8Wn0lLyOzSxVFdscdlWzg=;
 b=tUeXpeOFAX7mh1d2k8kZB2L2BMEWekTPjlNt4jC7Rh7vMBiHEtoRBbuK+ClAp7MxiA
 FVoaKjvdekI/7T+ye71zmYnqdMWWq+v/2pQpxeNIc7kY7nnOEaODVfq7Z3t29jbW7ca2
 FzOJ7KE5gZc9oWkcs5LSYTOk8BxdqECmK3C65T/VbA4oegnRSmJC4jhvMH01UC8H7VLW
 +EZId13xMEyVM0voCHV2JyzonJWjHdzpoqNd3ZKgRS9V/OivGXhnrPButv2CUT5NBRcG
 lyPELNwndGUi4LfWMHIJgO/sre76TqbXRNK3o9XDH4QnyzK+m6MWaNr65Biv/bTMq24t
 KBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0l8DFIUjHslvq6ryn61Vjm8Wn0lLyOzSxVFdscdlWzg=;
 b=CpoRWnmSqg0l7LctRcjgoCBcRY4LG7Z6FgFwLLRy5pGBqLdr6AQv7/vfI0+Ed+haso
 s1eJnYyGAs3M5J9WZ3Z0xMUxH1CtD+HvZAnPAp4Deeam5ntS0mHXVFhH+WVqsGcKq0hd
 lhFh+5uhR9BicwECjSujLYNU1Y3Gx3n3kvzZpiqR34U/Tkga4/5NFVBZmcLl3CJefqPo
 D863du1NPVr0no5o/Y5aiaDZ/Pq9xwpErb+Um16YF5rGLeG0Xq99v0exsuX3M++6oTUj
 NjGAjx4QMI2TKGoZUEqVv/cWC1U9n+0VqdU341QAQVbkghAhfL54RGVUX1CPEG5zMJSl
 ztAQ==
X-Gm-Message-State: AOAM530PUykvFpGxzb/vH7eruHeifYcQI5Fl+4aJqk7hQMCAwiJatn58
 tzwJ3sucPPyIRLfnZD0L+aSjU8pifpEgQw==
X-Google-Smtp-Source: ABdhPJwyoRqgCXPrwawNdugURgEHa/FYNL4flgOsoju3Cpa5vMw8dX5+/mH5hrmAD67tbAry2oTZdQ==
X-Received: by 2002:a17:90b:1e45:: with SMTP id pi5mr38738pjb.64.1640034348905; 
 Mon, 20 Dec 2021 13:05:48 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id d13sm20091021pfu.213.2021.12.20.13.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 13:05:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/24] linux-user/sh4: Use force_sig_fault
Date: Mon, 20 Dec 2021 13:05:26 -0800
Message-Id: <20211220210529.150423-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220210529.150423-1-richard.henderson@linaro.org>
References: <20211220210529.150423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 linux-user/sh4/cpu_loop.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
index ac9b01840c..fb561f1113 100644
--- a/linux-user/sh4/cpu_loop.c
+++ b/linux-user/sh4/cpu_loop.c
@@ -28,7 +28,6 @@ void cpu_loop(CPUSH4State *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr, ret;
-    target_siginfo_t info;
 
     while (1) {
         bool arch_interrupt = true;
@@ -60,10 +59,7 @@ void cpu_loop(CPUSH4State *env)
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


