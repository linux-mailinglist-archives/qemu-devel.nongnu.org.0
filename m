Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3305E6348E1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 22:00:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxaKy-0007Id-FP; Tue, 22 Nov 2022 15:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKw-0007G2-KP
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:46 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKu-0003Tr-Us
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:46 -0500
Received: by mail-pf1-x430.google.com with SMTP id c203so15462553pfc.11
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 12:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ge+zCPNFiKtYpqCipG5MIx9PztOZ/CqH4Dogt2mrOwU=;
 b=JqQ7ViWJud6iNe9dYaAMVbyhJoLEulzPMEr24zoWv1vG0rVGL/nJBWMzH4lDC4mZ/D
 iPWV4Igwi1QpgeGJKgnwia5PhtvoDdlmW7083w6N0hsgr7MiNHAwypowJBmHd3wnSN/G
 OIe895r5NGzFGTw8vGDHUjA9H74hvAqgjRf0SnWQVnkpskGBgiSb3T9HgnDDHr/X9eos
 LP8X82TLT582MHGIVyPJXNC0w6R6s0iGX/rjHOH/Z4Buu8LUe4bMH9jeep68qi/Sa3o1
 /+75dNrIYrIPf45xkquhJOz/LHEdLft0OLOUF+V3+b2bfFHl6tqC4CY0LLVRULm8tVeq
 dkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ge+zCPNFiKtYpqCipG5MIx9PztOZ/CqH4Dogt2mrOwU=;
 b=GgdQ3NKT4Bu5LUEOR0StgvTIWi6C2m7SRYPaXtwgbYc5X6oNqw68GvsZqGTIvchJuj
 +c8tKi8pnOB4f49tb6RdLVcJQHX5iKG0zFhDF7tD7cYTu2oTmUpkb4bT8xE63Way0dWG
 QpN4zW7xqaDnRRU/lUBzSINxQRt6X99EBmVpgpTWD7StXNWiK2mXyv2u91I5+1KtN1rO
 Yk+3UcWLFJKf1+1RdWdbgSRKOAS2Rj5Iodt90iuXUVF9pvafWCZIy+Frj5fhNze9Bym/
 6FOF73UIbaIyOtJsU9ph1x8Sqcd3b9FGjV6WZ59feQwhdfLrVAqetxUanuU0wFBarVm4
 l+pQ==
X-Gm-Message-State: ANoB5plDeJylT4FQWcOB8HAgz9OFIAz+ngStq5BXtIvWlTZ3aTE9yIhh
 Ho38ioRZU0qBALqR0aIhnkussiZzUzjlmw==
X-Google-Smtp-Source: AA0mqf5j/e6OOb35I4Hu7nTeADiT+6liUvZpXYgNw8YVceLb+iYAuWdbLkIJc35kwrjT8lyf/uT62Q==
X-Received: by 2002:a05:6a00:1f0f:b0:56e:7424:bc0f with SMTP id
 be15-20020a056a001f0f00b0056e7424bc0fmr15099952pfb.11.1669150663551; 
 Tue, 22 Nov 2022 12:57:43 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170903209300b00186fa988a13sm12383807plc.166.2022.11.22.12.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 12:57:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 2/7] hw/mips: Use WITH_QEMU_IOTHREAD_LOCK in
 cpu_mips_irq_request
Date: Tue, 22 Nov 2022 12:57:34 -0800
Message-Id: <20221122205739.603510-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122205739.603510-1-richard.henderson@linaro.org>
References: <20221122205739.603510-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/mips/mips_int.c | 37 ++++++++++++++-----------------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/hw/mips/mips_int.c b/hw/mips/mips_int.c
index 2db5e10fe0..c22598d353 100644
--- a/hw/mips/mips_int.c
+++ b/hw/mips/mips_int.c
@@ -32,36 +32,27 @@ static void cpu_mips_irq_request(void *opaque, int irq, int level)
     MIPSCPU *cpu = opaque;
     CPUMIPSState *env = &cpu->env;
     CPUState *cs = CPU(cpu);
-    bool locked = false;
 
     if (irq < 0 || irq > 7) {
         return;
     }
 
-    /* Make sure locking works even if BQL is already held by the caller */
-    if (!qemu_mutex_iothread_locked()) {
-        locked = true;
-        qemu_mutex_lock_iothread();
-    }
+    WITH_QEMU_IOTHREAD_LOCK() {
+        if (level) {
+            env->CP0_Cause |= 1 << (irq + CP0Ca_IP);
+        } else {
+            env->CP0_Cause &= ~(1 << (irq + CP0Ca_IP));
+        }
 
-    if (level) {
-        env->CP0_Cause |= 1 << (irq + CP0Ca_IP);
-    } else {
-        env->CP0_Cause &= ~(1 << (irq + CP0Ca_IP));
-    }
+        if (kvm_enabled() && (irq == 2 || irq == 3)) {
+            kvm_mips_set_interrupt(cpu, irq, level);
+        }
 
-    if (kvm_enabled() && (irq == 2 || irq == 3)) {
-        kvm_mips_set_interrupt(cpu, irq, level);
-    }
-
-    if (env->CP0_Cause & CP0Ca_IP_mask) {
-        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
-    } else {
-        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
-    }
-
-    if (locked) {
-        qemu_mutex_unlock_iothread();
+        if (env->CP0_Cause & CP0Ca_IP_mask) {
+            cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+        }
     }
 }
 
-- 
2.34.1


