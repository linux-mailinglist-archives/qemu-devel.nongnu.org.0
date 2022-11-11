Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A467E6259A1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:41:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otSP9-0003pa-No; Fri, 11 Nov 2022 06:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otSP7-0003mw-D7
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:41:01 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otSP3-00027K-SE
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:40:59 -0500
Received: by mail-pf1-x430.google.com with SMTP id z26so4703640pff.1
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIjPHkRH18chkLBXKE8P4bOXjlUnO+BcLL5w7iG1TVY=;
 b=DYmCcan0eU1LjY6PFMYcSNEK4CKdYBQOpam1+8iLRDjZxvWmG+lKxqjvsROdIWhfvO
 MJOAv0Fe+krlMJj/5/xYqqHAK/zRX305f9EXlKdzTS339kNzyNHw8Ci69dkdvn7mpMlE
 IoIDVN6ur+XYbeNdwKreNDOSiyhrd7qr4ZatwmP1CSXamiPLoTqaqlvEOu8TD5rU2GYX
 Hw3S6YhOKHfjKkqZrt2DvCc9lpiOqyK6s9vlJPwcSstV95tX0o6eRwDljVU2Ll8Jl9UX
 J6V73Nz+64rJTSTsuJb94d3To+I/ciTKhPLMHsVXCVw522xTGgiwqt960Pa9VsTDR3wg
 hVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HIjPHkRH18chkLBXKE8P4bOXjlUnO+BcLL5w7iG1TVY=;
 b=PEgjfOIUg/cuoGdClLqmg85381z/2gpErN/Aq8wdwqDFfDqfZz8xRiPRE5aOZDnui7
 DvHQWFe6Dkvj0qwB1Vqp1sSxC/0AWw6Ah4ktBEh0JcIZdw7cSxMSLNSKKcMNhbFV7vgr
 011eV7tjxDcKkgIzblMB5v8dE1g4PQARb+/iKFQ1lIwM1CPmvx/vBl6rrbmKJI4fpiWc
 yA3kDKVME/a6XEKMvPfQnzrMpFJvnv/Yh0oxNaxgMTT+oZEg4vL/ecS+yJ2uWDVajq4D
 HRZCZdIImnkpF/zWCXvVn8DgZRlfDsSf20VpyRo9yyD6RczoKi1rlbgaeES0EnWuSfGV
 WYVA==
X-Gm-Message-State: ANoB5pm0v3bskoJN2s9uWbGaYhL566G1JxueDIfSfeavad7mu9tDsjvK
 FFP4GkZwAYOvb3KFZ5Cq0ev0tPwt/D0taZcz
X-Google-Smtp-Source: AA0mqf4ONaiYT7GKRS6/iqFGcvWbey9OwqsKjGWdApJrAKzPXL5Uad2xm73S5ByvTJ0UnVdeYIeGqQ==
X-Received: by 2002:a63:4d1c:0:b0:462:e0d0:2582 with SMTP id
 a28-20020a634d1c000000b00462e0d02582mr1331099pgb.48.1668166856057; 
 Fri, 11 Nov 2022 03:40:56 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 e29-20020a056a0000dd00b005668b26ade0sm1393933pfj.136.2022.11.11.03.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:40:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH for-7.2 2/2] target/i386: hardcode R_EAX as destination
 register for LAHF/SAHF
Date: Fri, 11 Nov 2022 21:40:44 +1000
Message-Id: <20221111114044.2510256-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111114044.2510256-1-richard.henderson@linaro.org>
References: <20221111114044.2510256-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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


