Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC71DD405
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 19:12:42 +0200 (CEST)
Received: from localhost ([::1]:37374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbokL-0003QP-Kt
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 13:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboJ6-0004L8-GB
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:32 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:40821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboJ5-0006hd-FA
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:32 -0400
Received: by mail-qk1-x741.google.com with SMTP id g185so7847863qke.7
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cWfP+0MUzrrNImWYZpz2KO/NSgj5qKMFSKUqs77s2xU=;
 b=DAhu+KMmtFGINUOHDZ4Q4aM3giQponNsqp92LFUNsEYUuNFf9gOFBt/bz07NCt6YW/
 ++Qx/BgVOiQ/lqFc69hWm+EIOvTLO6+IFspteIoJR0OCROpruA1x8l1qAY19hJA6aY+b
 dEPTYRWOcXc1C3kCLZEbv45/vHzjC/DO5vIU+uRZeEVZsj/xyOIcbezLbwfsOCCHQDBn
 HscOo0j7SNsaQwg5nrEqagLHhTLdVmZLBSTPcIgHEbREvU9mYeM87qf4TnjmGpQdYmLn
 2T3sEuzAhX/+SlZ/SGgblnWO0YdzufuSplf4AJ5bs/CEbMVFZf1rzcqHpAjaQG6sAdw1
 Aukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cWfP+0MUzrrNImWYZpz2KO/NSgj5qKMFSKUqs77s2xU=;
 b=qK44mAZmmT9fa0tAfzpTJq7tV1x0bfeZG5bOVoae2DCho99/g6FZ6eNNQVU4tEkJOr
 rh+Wjei4jw+pNyW812GvWtEUhaTJQHapIQobNYttb9fAb0WWWP5uEUsWodeRr4nGGXI8
 qvHBcZSow7dWaC0GsPa8U6zrMS5jMAsj59LvF7iS/oRJB1X5+Sbcf2YK/QRVGN7wEGO5
 6TRc/6ntq9ALJx3O4KZ5pBCcJqIF1rtCkOb2jNPQ3DCna+zJ/PmTInoYkguq4qoAjTOX
 qejrXlnBqP7xrGxEI4XS8vcc3L0Olz8wVmxsUdvMa+yg9HohdiJe1DnDorXen6VnGnIn
 6jcg==
X-Gm-Message-State: AOAM53089VQzdrBctFISjoRDA7a6gakVuxZihUIrmxCwSRw9zL0cg25H
 ucdGNfVsjWnFmRdoD9cOVTPf4Qz0cDWuyQ==
X-Google-Smtp-Source: ABdhPJzlQUpsoiL3MmVIR2NRHmaDBT2W71HWdond+YZy0Nm0+xGd6FV/8Z8c4PD3YheznV8IVdFvBA==
X-Received: by 2002:a05:620a:634:: with SMTP id
 20mr10172139qkv.15.1590079470076; 
 Thu, 21 May 2020 09:44:30 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1944:c530:655c:5583])
 by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:44:28 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 56/74] sparc: convert to cpu_interrupt_request
Date: Thu, 21 May 2020 12:39:53 -0400
Message-Id: <20200521164011.638-57-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=robert.foley@linaro.org; helo=mail-qk1-x741.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: robert.foley@linaro.org, richard.henderson@linaro.org, cota@braap.org,
 peter.puhov@linaro.org, alex.bennee@linaro.org,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 hw/sparc64/sparc64.c | 4 ++--
 target/sparc/cpu.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/sparc64/sparc64.c b/hw/sparc64/sparc64.c
index fe9c678459..191ebfbb93 100644
--- a/hw/sparc64/sparc64.c
+++ b/hw/sparc64/sparc64.c
@@ -57,7 +57,7 @@ void cpu_check_irqs(CPUSPARCState *env)
     /* The bit corresponding to psrpil is (1<< psrpil), the next bit
        is (2 << psrpil). */
     if (pil < (2 << env->psrpil)) {
-        if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
+        if (cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD) {
             trace_sparc64_cpu_check_irqs_reset_irq(env->interrupt_index);
             env->interrupt_index = 0;
             cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
@@ -88,7 +88,7 @@ void cpu_check_irqs(CPUSPARCState *env)
                 break;
             }
         }
-    } else if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
+    } else if (cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD) {
         trace_sparc64_cpu_check_irqs_disabled(pil, env->pil_in, env->softint,
                                               env->interrupt_index);
         env->interrupt_index = 0;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 3f05aba9d6..cef25238a5 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -704,7 +704,7 @@ static bool sparc_cpu_has_work(CPUState *cs)
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
 
-    return (cs->interrupt_request & CPU_INTERRUPT_HARD) &&
+    return (cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD) &&
            cpu_interrupts_enabled(env);
 }
 
-- 
2.17.1


