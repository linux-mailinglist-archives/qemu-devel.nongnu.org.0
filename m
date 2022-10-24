Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203D60AE2D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:51:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTE-0003Zi-Fc; Mon, 24 Oct 2022 09:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSn-0003QF-LR
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:57 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSl-00043O-37
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:57 -0400
Received: by mail-pj1-x102f.google.com with SMTP id l6so4539471pjj.0
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JF3XGXjHYNHuxSwtZLkg/V+n2/HF5CeeOxU68TL7GUw=;
 b=x8R0gHwrSKxTEH/uahxGUSrmxc4Ces3xlJFThmEpckvojCk8KsCZu4vvB3rzyKbq7d
 fRpYB4V6unIkyBq8NBm1kPzqTYUjsHqFKJsCTvGD49yBetmpVQAWeBTA9LBE1iKQynre
 DJV08Bp47P9P/i+xiT6/t9QI7+8Ts4Aw+sTylECtGeOW56wr6wMPHuCIlMGCGO7lJQNy
 JOgGwaYAjkQ8BBGPgcVf2XYRfHj1M7rQ97Mu0VVIO6u25pfFLWbqFFygBIe108Ug60PO
 I4X5PH9Ouw9RoU4RMonssIJo8H8g/90jwyCgxS1PT9EFMeZgSgyh7ks5cMjP/rXAS1XG
 0v0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JF3XGXjHYNHuxSwtZLkg/V+n2/HF5CeeOxU68TL7GUw=;
 b=GUlxhF9pN5WEmTW7XGKrbIfQUlirAMiuTjRtL437vLBY8D98S5p2aWfc2hc8zL1On1
 b7YmsJP9+Isz8YDcExepNhbAKXJJUYso4gxQU5fchINl2R4WiS87+ThUiAr9fPah7fdH
 T/sMknyEVC3ueRr6AAVDUzTbx0NfM1B4uZKQ97UwJlZ0G5G/BJPWCX1mL3M6I9nOXTwP
 txrfDSw4wQGLt5RAg/wxGm9h+WxyKw2YOM7tdmJg6oV5WE7C9JgopWtP5ThM79lksOb+
 5IRp2Q/ArBiq+lrKwS6fVE6u85wqkJr3IgBs0GvP515RMKxxJifX3wGwYFMwthbwqMqj
 jS9A==
X-Gm-Message-State: ACrzQf2bRc6HC8iA+iv3tZ2tLd1FD0zusmN6/aLyeOFQ905wcxtd8SD0
 6mL9mK6o/0ZikX4IfVh2l97IJPtbp5uOjg==
X-Google-Smtp-Source: AMsMyM426hjXICzyvuDEpOa8DUV3u1nxwnqEEAACQ3xNyNM9WLBbz8j67Qy+I+KclgR/D7bXrVh5bw==
X-Received: by 2002:a17:902:d510:b0:185:4b76:6277 with SMTP id
 b16-20020a170902d51000b001854b766277mr33032817plg.82.1666617953567; 
 Mon, 24 Oct 2022 06:25:53 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/29] target/rx: Convert to tcg_ops restore_state_to_opc
Date: Mon, 24 Oct 2022 23:24:47 +1000
Message-Id: <20221024132459.3229709-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/cpu.c       | 10 ++++++++++
 target/rx/translate.c |  6 ------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 2f28099723..9003c6e9fe 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -47,6 +47,15 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.pc = tb_pc(tb);
 }
 
+static void rx_restore_state_to_opc(CPUState *cs,
+                                    const TranslationBlock *tb,
+                                    const uint64_t *data)
+{
+    RXCPU *cpu = RX_CPU(cs);
+
+    cpu->env.pc = data[0];
+}
+
 static bool rx_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request &
@@ -192,6 +201,7 @@ static const struct SysemuCPUOps rx_sysemu_ops = {
 static const struct TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
+    .restore_state_to_opc = rx_restore_state_to_opc,
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/rx/translate.c b/target/rx/translate.c
index ea5653bc95..87a3f54adb 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2371,12 +2371,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns,
     translator_loop(cs, tb, max_insns, pc, host_pc, &rx_tr_ops, &dc.base);
 }
 
-void restore_state_to_opc(CPURXState *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-
 #define ALLOC_REGISTER(sym, name) \
     cpu_##sym = tcg_global_mem_new_i32(cpu_env, \
                                        offsetof(CPURXState, sym), name)
-- 
2.34.1


