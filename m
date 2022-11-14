Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F72628DD8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:59:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouj2U-0005Xh-8U; Mon, 14 Nov 2022 18:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouj2R-0005UX-AE
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:38:52 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ouj2I-0006p3-PA
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:38:44 -0500
Received: by mail-pf1-x436.google.com with SMTP id y13so12535592pfp.7
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 15:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIjPHkRH18chkLBXKE8P4bOXjlUnO+BcLL5w7iG1TVY=;
 b=iegvts+xVMEC1hcdFzPmaJRW9bQpiZkOjY/BEWmhnitmkYayykjw7bFH9O7OAgrHmT
 720w+MWOSBi/iaMwHAs11jEqOENW0gi2No3WUPP/aGo5/wBuI8cbarkDjDqxD9YM2+qg
 U2nobYU0Whc1tRHTuWYBrgtlhjNBTqHOVf1GLRAiO1JRr1gelSSh0GQzWSvuZYxpSaF1
 inX3GD/7mLmoyFq1afqZekznL4xLwqkkiM9hVXmQOFAUzw/4y4DY9w2Dp1b6YsfVx8aB
 RICOM8hRJEr1d3JeCZMQnldGmC/9aVapDSLOVABNJsNLWe/Ax4Ma6XQRjj9/NxvZGzk+
 HpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HIjPHkRH18chkLBXKE8P4bOXjlUnO+BcLL5w7iG1TVY=;
 b=e9C9ZiTrdEdLDGVUG9/sK43LnE5YkEjekirLhFY/fx6bcAA07QiSM8zu7EPuOPAsPf
 Y0CR+3jKgPjZNTOVeaIVRByx+t1lUMOCFmGLal0DO0XtVD7UM/wpADBQpyDJb3C/7pfM
 u6c20W/FtjutnOKNG8ZcwfhrBfGRAnmYoRJl9XE2JaJOBPWPYJt/TgsfCXx4ghZIB4oZ
 ax3VQc2dJuaS67HZZDbs113rdPAHXCzHf1i1wABC7mAisQxQBJaaprMg0L7DwuH3/rYo
 1qIYiYU43JtrIZT6+OePWv53MjKMmsD4lEpHXLRZyIB7NNekIBtT1ZtKvabtExslBIjY
 j3PA==
X-Gm-Message-State: ANoB5pkfMNqw8xWfqtKaJBqNr9eGdwwTk7eAOTokY4yg3b2D+WKUCq7n
 T1gyk2o7GYZs+mqWINbVYvAQy5fPkW7olAI4
X-Google-Smtp-Source: AA0mqf4HWCdsdCm4t6Y57hs6gvZqtT2tPeLNqs3sg6Je3Pn/w3G75QgGYc9pm970QwrUbDde0dL/rA==
X-Received: by 2002:a63:c009:0:b0:46e:bcc1:28df with SMTP id
 h9-20020a63c009000000b0046ebcc128dfmr13406824pgg.187.1668469121254; 
 Mon, 14 Nov 2022 15:38:41 -0800 (PST)
Received: from stoup.. (119-18-35-77.771223.bne.static.aussiebb.net.
 [119.18.35.77]) by smtp.gmail.com with ESMTPSA id
 cp16-20020a170902e79000b00176dc67df44sm8120268plb.132.2022.11.14.15.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 15:38:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 2/2] target/i386: hardcode R_EAX as destination register for
 LAHF/SAHF
Date: Tue, 15 Nov 2022 09:38:29 +1000
Message-Id: <20221114233829.3329805-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114233829.3329805-1-richard.henderson@linaro.org>
References: <20221114233829.3329805-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

From: Paolo Bonzini <pbonzini@redhat.com>

When translating code that is using LAHF and SAHF in combination with the
REX prefix, the instructions should not use any other register than AH;
however, QEMU selects SPL (SP being register 4, just like AH) if the
REX prefix is present.  To fix this, use deposit directly without
going through gen_op_mov_v_reg and gen_op_mov_reg_v.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/130
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index dbd6492778..7e0b2a709a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5230,7 +5230,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0x9e: /* sahf */
         if (CODE64(s) && !(s->cpuid_ext3_features & CPUID_EXT3_LAHF_LM))
             goto illegal_op;
-        gen_op_mov_v_reg(s, MO_8, s->T0, R_AH);
+        tcg_gen_shri_tl(s->T0, cpu_regs[R_EAX], 8);
         gen_compute_eflags(s);
         tcg_gen_andi_tl(cpu_cc_src, cpu_cc_src, CC_O);
         tcg_gen_andi_tl(s->T0, s->T0, CC_S | CC_Z | CC_A | CC_P | CC_C);
@@ -5242,7 +5242,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_compute_eflags(s);
         /* Note: gen_compute_eflags() only gives the condition codes */
         tcg_gen_ori_tl(s->T0, cpu_cc_src, 0x02);
-        gen_op_mov_reg_v(s, MO_8, R_AH, s->T0);
+        tcg_gen_deposit_tl(cpu_regs[R_EAX], cpu_regs[R_EAX], s->T0, 8, 8);
         break;
     case 0xf5: /* cmc */
         gen_compute_eflags(s);
-- 
2.34.1


