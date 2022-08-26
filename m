Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CE95A30B3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 22:59:23 +0200 (CEST)
Received: from localhost ([::1]:33310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRgQE-0007QD-8D
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 16:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRgMO-0002ge-Th
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:55:24 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRgMN-00033I-5M
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 16:55:24 -0400
Received: by mail-pg1-x535.google.com with SMTP id 69so752103pgb.13
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 13:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5pSXFwSlSVJciy/fhHEgZkCC53rjmr2bP7A8Givhm80=;
 b=abcU9OBQipr+3mrTRVAf9oJWEfDHhM3FtmsZRN75XUgrn3Kifdo8YhZrPKN9X1tJMu
 6XGPA1nQ8lZpsK+aH0GpDslyVAAGu05YzLTuNDX9Y4zTSV4+/WjA0mAvXMpD3OKduSMj
 WFGzhLUbKLJXFWLpT+uj5Iu4ud9hPMXwh1vimC9H0pnVO0EVMurTr4HAuMK/YfJzFf+L
 Tl1Wort8lfpf8pis+Vjp+y5Qa34PrLMmWlvEMSYCHxjjumd0kkS8HgwucEBJZ1Cc4h4M
 s4SLZLFLD7tmCN/OpZvc3BIj70KiBVYm4lPBpXCLQMK/W9z5roz59TiGfw38SEeG8OIA
 UZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5pSXFwSlSVJciy/fhHEgZkCC53rjmr2bP7A8Givhm80=;
 b=I/MXu7MSh7Hf7cSQrhMP9Zc8hcboRuTR4Ly0qRK1UqvyHawBlOgHaPDHw2Tsk7jodH
 xzqKwDZRnjoCGaX1LaNM1//GSYg3rGVZWcLR1Ktc2xcMe4WR6F+UF2FHR19YVEx04Tg6
 P0cX+2Oi3cv8lCqqpD4MBCptzTbvh4TwE1BbXCg0sjG+ZpRKUalzKh6dhUFJhgzYWX9U
 4zXkTO4H1QLtTuhRg/XIWEpmSr0FcrJCyrQrWf/GEKLeIvDZBAh842l4mpkfziReS2xT
 6iOJtmOJd3VdjoY4dnDqn7WmpK9I1rNZDV2/k42CBEF3LIZi6x/6Y5MNUSScH/RVllvQ
 lacw==
X-Gm-Message-State: ACgBeo0n5qG2J4WbFz6SYL5PosSB/C6iC8utf0mEtfpmgKXClGBKg0Ba
 EGDXimzMy3w/kbqct0iwBs4aGG5EIcnlBw==
X-Google-Smtp-Source: AA6agR6xyugKov2y7bID9KEgW+TI1E2SMuvN1Evya6TtrvzkFWv/Hvmbo4zQzdfzoqL3Ttpi82EFMA==
X-Received: by 2002:a63:4916:0:b0:427:d463:55e with SMTP id
 w22-20020a634916000000b00427d463055emr4769271pga.374.1661547321911; 
 Fri, 26 Aug 2022 13:55:21 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:68d8:30f3:fbd7:6f7f])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170902650b00b00172a567d910sm2009900plk.289.2022.08.26.13.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 13:55:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com
Subject: [PATCH 1/3] target/avr: Call avr_cpu_do_interrupt directly
Date: Fri, 26 Aug 2022 13:55:16 -0700
Message-Id: <20220826205518.2339352-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826205518.2339352-1-richard.henderson@linaro.org>
References: <20220826205518.2339352-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

There is no need to go through cc->tcg_ops when
we know what value that must have.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 82284f8997..9614ccf3e4 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -29,14 +29,13 @@
 bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     bool ret = false;
-    CPUClass *cc = CPU_GET_CLASS(cs);
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
 
     if (interrupt_request & CPU_INTERRUPT_RESET) {
         if (cpu_interrupts_enabled(env)) {
             cs->exception_index = EXCP_RESET;
-            cc->tcg_ops->do_interrupt(cs);
+            avr_cpu_do_interrupt(cs);
 
             cs->interrupt_request &= ~CPU_INTERRUPT_RESET;
 
@@ -47,7 +46,7 @@ bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
         if (cpu_interrupts_enabled(env) && env->intsrc != 0) {
             int index = ctz32(env->intsrc);
             cs->exception_index = EXCP_INT(index);
-            cc->tcg_ops->do_interrupt(cs);
+            avr_cpu_do_interrupt(cs);
 
             env->intsrc &= env->intsrc - 1; /* clear the interrupt */
             if (!env->intsrc) {
-- 
2.34.1


