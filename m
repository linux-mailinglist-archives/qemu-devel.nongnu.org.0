Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12F642A9CE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:42:26 +0200 (CEST)
Received: from localhost ([::1]:41118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKrB-0007Pf-OK
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXo-00072e-Ln
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:24 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXY-00044I-Ek
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:24 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y7so8459033pfg.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jQKQj7yC7oasjm6gEezfZCoepcbFAh4lW7SLWUNzRbc=;
 b=ooTxSuyEuUV2AcC1yYLam202lPWvJnSqYXcjnaTZCHXPzbviXZUdJc5ANF74mKzrI2
 mPsZptUEuvzF4Dl9MqrqfN+Zj6cCMAHrQFdcH9x39R9UqviuvjXGcZX4wANBDdC0NpOD
 pniT9h9imCOqdcvysLz9i3AcsuF+ODtqCIRhIWXeM85pntNs+Y9e1M8MDdq+jI03isfj
 f5FB937CrRqcqnC10cYB1Dtuwe0Cf1oxdYVaw0fZ5l0pv6DtQwajl4WhLajWQZ3pcotq
 qAK5mf6tSCsCx2yaL/4tQTSFwKnR7ziLxKI5P5abZETVn7Upu3PrVJ/W5BsHKJTr2EJC
 kriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jQKQj7yC7oasjm6gEezfZCoepcbFAh4lW7SLWUNzRbc=;
 b=goktJG8aSVh66XfZUhFNmv+hylKo/t/RPv7t6dNrPMrzGWHdVj6NkCaC1KRfe7Xte7
 X4yZo2UIYynBRO6Y1BpuvfU4QZMHqSB2e7LwmbwABwB/27UxdmXIQ8+DFnyGgpdjPtbW
 utpBVlXjkmRLe4doSNKZLWyYBdVvF3t7MT3Ruy6CWaCjczN6R/4leUuQImBvqhqofCKS
 zcjhxr3W69sZf8A208RBJDwWmlVdLcwFQX4pArQWBLjvliy91sCeQLM6dv4CKZA1dy2P
 bKp92trJqfliQ1UUMI9Btv3NjLGdmwXoEQtqcnrtQ9A7PD+8ZP0kP94cqSnwbCs7F1EO
 E76w==
X-Gm-Message-State: AOAM531HHdV3tctv3ysfSqR3VeDP5DYA1JpofPrRqb2jX9Tl+39ndyYx
 /D6HHVETnMeEjgT4sbaTAOstpVmQlqvRfQ==
X-Google-Smtp-Source: ABdhPJwo5gwUtsdamOB6RPth8tJS1P0wHJY8TcyqE6njJQVFB3k4oDCZLsPWB+S+Yu02Tt3dwyBNjQ==
X-Received: by 2002:a62:dd15:0:b0:44c:61de:537 with SMTP id
 w21-20020a62dd15000000b0044c61de0537mr32141055pff.57.1634055727205; 
 Tue, 12 Oct 2021 09:22:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/23] target/i386: Check CF_NO_GOTO_TB for dc->jmp_opt
Date: Tue, 12 Oct 2021 09:21:44 -0700
Message-Id: <20211012162159.471406-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were using singlestep_enabled as a proxy for whether
translator_use_goto_tb would always return false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a46be75b00..c8d919bc3f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8556,6 +8556,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUX86State *env = cpu->env_ptr;
     uint32_t flags = dc->base.tb->flags;
+    uint32_t cflags = tb_cflags(dc->base.tb);
     int cpl = (flags >> HF_CPL_SHIFT) & 3;
     int iopl = (flags >> IOPL_SHIFT) & 3;
 
@@ -8593,14 +8594,14 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
     dc->cpuid_ext3_features = env->features[FEAT_8000_0001_ECX];
     dc->cpuid_7_0_ebx_features = env->features[FEAT_7_0_EBX];
     dc->cpuid_xsave_features = env->features[FEAT_XSAVE];
-    dc->jmp_opt = !(dc->base.singlestep_enabled ||
+    dc->jmp_opt = !((cflags & CF_NO_GOTO_TB) ||
                     (flags & (HF_TF_MASK | HF_INHIBIT_IRQ_MASK)));
     /*
      * If jmp_opt, we want to handle each string instruction individually.
      * For icount also disable repz optimization so that each iteration
      * is accounted separately.
      */
-    dc->repz_opt = !dc->jmp_opt && !(tb_cflags(dc->base.tb) & CF_USE_ICOUNT);
+    dc->repz_opt = !dc->jmp_opt && !(cflags & CF_USE_ICOUNT);
 
     dc->T0 = tcg_temp_new();
     dc->T1 = tcg_temp_new();
-- 
2.25.1


