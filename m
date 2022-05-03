Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0EC518FE1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:17:36 +0200 (CEST)
Received: from localhost ([::1]:48458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlztn-00021m-HP
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZz-0000ne-1v
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:03 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZw-0006Ob-KO
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:53:02 -0400
Received: by mail-pl1-x631.google.com with SMTP id j8so15862848pll.11
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zSABYP4n5j9DpaRkrATAbL9o0CDfndEvUo9tSY+Ych0=;
 b=Ef5saaaj5hJEJ5KnBAj9hB8RkLBpZoilw0vNu9Y3kretFp+rixJqjwjb5OgVeoOZOv
 95w+s4jSQy/Qf8+nS+0LqYUeujvC+33YGLo8MmvM0coZRVplTGOAnT0NlhALh3smsAl8
 stiPFR4BmWm9SiUwjh3J3QVjtah/CCIv6UwZgbDkmNo7vkKL94QdDbSfOIERJAWiG8T4
 v7WwQh/sEMviMyLe1/hmvBiknQzVmkzD125DPODM3Jg2MzVPBgIxo+se/8MtelNCt1HZ
 76w15DFW7VFbIM0Ds/wmGNlIe2Ft7Hpvn9+Om190W78t8G1aftNJwGkLGDyHs8VpvagX
 3YvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zSABYP4n5j9DpaRkrATAbL9o0CDfndEvUo9tSY+Ych0=;
 b=XHMDvofTFzgmf3HcHyfnXUtfSwTV3P6xnrBxekvucOleA2JDg3Zkx2FcUa9XgX5CDx
 by9bCge3WXFeTpBukcHuWrt9aVDKLujr5XNmUEsT+wyPbZ52tWoy1b9V1TLYsXGCHU4/
 9TUkyrbh2wbPzY9MirgJiI4owNMFLcWtFY/jdE26E/odKuL3FGE8zH7UQSuQFheX0r79
 zu9v9z0HkjjCaXo82mzHmnMix1YucpyzNlLLdsc+2yio2YSP7ezJr8Sj7llZFRMcG+7Z
 E1lD62wkGQCrD+BK8CmJjlpWHcgVtmT536oP5kyHIiSPBDA/rPOrF7yxkEgtq2Q4g0dJ
 VG5A==
X-Gm-Message-State: AOAM533gkQW0GFTVtNN4i9AWad5Gee7k4poPqPi+6EZbkaZe+LSy6WXY
 SFHVgHBj8qaBvoi70o3nPpWSLWmHO+JgHA==
X-Google-Smtp-Source: ABdhPJx4XuUu8nnZmOWcu5Mto3jc5EGOKAH31za81JxszAMtZ/D+L7VQjMeIfAAcFy3IloE6OiiXUg==
X-Received: by 2002:a17:90b:1c04:b0:1dc:4dfd:5a43 with SMTP id
 oc4-20020a17090b1c0400b001dc4dfd5a43mr6628138pjb.160.1651607577572; 
 Tue, 03 May 2022 12:52:57 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 72/74] target/rx: Cleanup rx_cpu_do_interrupt
Date: Tue,  3 May 2022 12:48:41 -0700
Message-Id: <20220503194843.1379101-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce EXCP_IRQ and EXCP_FIRQ to remember the decision
that we made in rx_cpu_exec_interrupt.  Use a switch to
select between exceptions; unify stacked interrupt frame
creation; abort if unknown exception.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/cpu.h    |   4 ++
 target/rx/helper.c | 118 ++++++++++++++++++++++-----------------------
 2 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 99e28fb70f..5b93c0dcb0 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -84,6 +84,10 @@ enum {
      */
     EXCP_INTB_0      = 0x100,
     EXCP_INTB_255    = EXCP_INTB_0 + 255,
+
+    /* Private to the qemu implementation. */
+    EXCP_IRQ,
+    EXCP_FIRQ,
 };
 
 typedef struct CPUArchState {
diff --git a/target/rx/helper.c b/target/rx/helper.c
index 29a4b075fa..d12e551cc2 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -42,12 +42,13 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte)
 
 #ifndef CONFIG_USER_ONLY
 
-#define INT_FLAGS (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR)
 void rx_cpu_do_interrupt(CPUState *cs)
 {
     RXCPU *cpu = RX_CPU(cs);
     CPURXState *env = &cpu->env;
-    int do_irq = cs->interrupt_request & INT_FLAGS;
+    uint32_t vec = cs->exception_index;
+    target_ulong vec_table = 0xffffff80u; /* fixed vector table */
+    const char *expname;
     uint32_t save_psw;
 
     env->in_sleep = 0;
@@ -60,69 +61,62 @@ void rx_cpu_do_interrupt(CPUState *cs)
     save_psw = rx_cpu_pack_psw(env);
     env->psw_pm = env->psw_i = env->psw_u = 0;
 
-    if (do_irq) {
-        if (do_irq & CPU_INTERRUPT_FIR) {
-            env->bpc = env->pc;
-            env->bpsw = save_psw;
-            env->pc = env->fintv;
-            env->psw_ipl = 15;
-            cs->interrupt_request &= ~CPU_INTERRUPT_FIR;
-            qemu_set_irq(env->ack, env->ack_irq);
-            qemu_log_mask(CPU_LOG_INT, "fast interrupt raised\n");
-        } else if (do_irq & CPU_INTERRUPT_HARD) {
-            env->isp -= 4;
-            cpu_stl_data(env, env->isp, save_psw);
-            env->isp -= 4;
-            cpu_stl_data(env, env->isp, env->pc);
-            env->pc = cpu_ldl_data(env, env->intb + env->ack_irq * 4);
-            env->psw_ipl = env->ack_ipl;
-            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
-            qemu_set_irq(env->ack, env->ack_irq);
-            qemu_log_mask(CPU_LOG_INT,
-                          "interrupt 0x%02x raised\n", env->ack_irq);
-        }
-    } else {
-        uint32_t vec = cs->exception_index;
-        const char *expname;
+    switch (vec) {
+    case EXCP_FIRQ:
+        env->bpc = env->pc;
+        env->bpsw = save_psw;
+        env->pc = env->fintv;
+        env->psw_ipl = 15;
+        cs->interrupt_request &= ~CPU_INTERRUPT_FIR;
+        qemu_set_irq(env->ack, env->ack_irq);
+        qemu_log_mask(CPU_LOG_INT, "fast interrupt raised\n");
+        break;
 
+    case EXCP_IRQ:
+        env->psw_ipl = env->ack_ipl;
+        cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
+        qemu_set_irq(env->ack, env->ack_irq);
+        expname = "interrupt";
+        vec_table = env->intb;
+        vec = env->ack_ipl;
+        goto do_stacked;
+
+    case EXCP_PRIVILEGED:
+        expname = "privilege violation";
+        goto do_stacked;
+    case EXCP_ACCESS:
+        expname = "access exception";
+        goto do_stacked;
+    case EXCP_UNDEFINED:
+        expname = "illegal instruction";
+        goto do_stacked;
+    case EXCP_FPU:
+        expname = "fpu exception";
+        goto do_stacked;
+    case EXCP_NMI:
+        expname = "non-maskable interrupt";
+        goto do_stacked;
+    case EXCP_RESET:
+        expname = "reset interrupt";
+        goto do_stacked;
+
+    case EXCP_INTB_0 ... EXCP_INTB_255:
+        expname = "unconditional trap";
+        vec_table = env->intb;
+        vec -= EXCP_INTB_0;
+        goto do_stacked;
+
+    do_stacked:
         env->isp -= 4;
         cpu_stl_data(env, env->isp, save_psw);
         env->isp -= 4;
         cpu_stl_data(env, env->isp, env->pc);
+        env->pc = cpu_ldl_data(env, vec_table + vec * 4);
+        qemu_log_mask(CPU_LOG_INT, "%s raised (0x%02x)\n", expname, vec);
+        break;
 
-        if (vec < EXCP_INTB_0) {
-            env->pc = cpu_ldl_data(env, 0xffffff80 + vec * 4);
-        } else {
-            env->pc = cpu_ldl_data(env, env->intb + (vec - EXCP_INTB_0) * 4);
-        }
-        switch (vec) {
-        case EXCP_PRIVILEGED:
-            expname = "privilege violation";
-            break;
-        case EXCP_ACCESS:
-            expname = "access exception";
-            break;
-        case EXCP_UNDEFINED:
-            expname = "illegal instruction";
-            break;
-        case EXCP_FPU:
-            expname = "fpu exception";
-            break;
-        case EXCP_NMI:
-            expname = "non-maskable interrupt";
-            break;
-        case EXCP_RESET:
-            expname = "reset interrupt";
-            break;
-        case EXCP_INTB_0 ... EXCP_INTB_255:
-            expname = "unconditional trap";
-            break;
-        default:
-            expname = "unknown exception";
-            break;
-        }
-        qemu_log_mask(CPU_LOG_INT, "exception 0x%02x [%s] raised\n",
-                      (vec & 0xff), expname);
+    default:
+        g_assert_not_reached();
     }
     env->regs[0] = env->isp;
 }
@@ -132,19 +126,21 @@ bool rx_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     RXCPU *cpu = RX_CPU(cs);
     CPURXState *env = &cpu->env;
     int accept = 0;
+
     /* hardware interrupt (Normal) */
     if ((interrupt_request & CPU_INTERRUPT_HARD) &&
         env->psw_i && (env->psw_ipl < env->req_ipl)) {
         env->ack_irq = env->req_irq;
         env->ack_ipl = env->req_ipl;
-        accept = 1;
+        accept = EXCP_IRQ;
     }
     /* hardware interrupt (FIR) */
     if ((interrupt_request & CPU_INTERRUPT_FIR) &&
         env->psw_i && (env->psw_ipl < 15)) {
-        accept = 1;
+        accept = EXCP_FIRQ;
     }
     if (accept) {
+        cs->exception_index = accept;
         rx_cpu_do_interrupt(cs);
         return true;
     }
-- 
2.34.1


