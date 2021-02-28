Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A18D32755C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:50:58 +0100 (CET)
Received: from localhost ([::1]:41234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVpx-00020H-D4
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPu-0005ow-SP
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:02 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPm-0007mN-2M
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:02 -0500
Received: by mail-pl1-x62c.google.com with SMTP id g20so8775244plo.2
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p/OP6oNpVxEQgtZxEWk9B6FS4WV2bejSngGyOnOktPA=;
 b=xNvpwiuVyg5fAWXSnb7jROYrw0SXPwoWqFW7h9+E4Ff4wWQLDwvxwpAsbKaWhGgumD
 oeQzFPXWYJii76omoHVQdTQZXKQiFuQ66ARVtEQ0++4CjKmpOFcMM+DzExLeAlUjaBlv
 kUTugoMrrKEi6XaMBH3cSw9QDiH+sQUAj0fbles+HYhubEX1YqHrS5k4YtaTiUj7RtlW
 4/IcgnS+vhK6VmuPhvIdBd6soCTIDUguDRwADuaVc2oTOlylqRCDycVR8ruT58dhaEkp
 FJ9Dw7/eWBh7qZqrEvKKMy6rSfHh2HvxqSsggSRCLWpIsCOXTGQwkQB9yC+iGcSBVPsY
 DenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p/OP6oNpVxEQgtZxEWk9B6FS4WV2bejSngGyOnOktPA=;
 b=PAv9Zblyi3SZ3oh23MKmhELMlWRuJqBe2PjBNHWJfmguZpkz95bgbfI2BtGfz6XQC8
 XvLYnxQ59BTa2KKam5IAc61rOfGaEcM/by7Iv8MIgNA5bPm1dA7XIaI+q2LeP/GIDlze
 dnakGmiKvFW2Vq8rzd90bEsk7cH+lWXjCiT2R/2EmlKaLO9/ulutqI6W7//66rjbeNq2
 UdslRTOrxJrj7UUt3AE6wW74d79psg41xiD5AJbc072ETuXNCdHmYGjFx6v2LDMHmhfp
 2cD11pfUy1z5nK51yyMQCG+i007Vou4KzyxG1ssvXPrNEiyj6SN1IjZFETn8aj7tBsMW
 FZTQ==
X-Gm-Message-State: AOAM531Hj6NmkptYJSCUQf+6hmofDDfZZHr1MQaO9Jkg75+nXhCbI7pP
 SXxbYwwhslKwX5h2j/vg2rfPOg0rDbMGWg==
X-Google-Smtp-Source: ABdhPJzHF7xQwVyPsV4f9jhj8y8bwoGjmtRYpR8Q51C3AaqimgHxG8ebYT53b4onxxbYL3PQpKmZGQ==
X-Received: by 2002:a17:902:cece:b029:e4:89af:adf with SMTP id
 d14-20020a170902ceceb02900e489af0adfmr7567994plg.53.1614554632140; 
 Sun, 28 Feb 2021 15:23:52 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 35/50] target/i386: Simplify gen_debug usage
Date: Sun, 28 Feb 2021 15:23:06 -0800
Message-Id: <20210228232321.322053-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both invocations pass the start of the current instruction,
which is available as s->base.pc_next.  The function sets
is_jmp, so we can eliminate a second setting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index c2bc3c4b22..c135be9063 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2614,10 +2614,10 @@ static void gen_interrupt(DisasContext *s, int intno,
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static void gen_debug(DisasContext *s, target_ulong cur_eip)
+static void gen_debug(DisasContext *s)
 {
     gen_update_cc_op(s);
-    gen_jmp_im(s, cur_eip);
+    gen_jmp_im(s, s->base.pc_next - s->cs_base);
     gen_helper_debug(cpu_env);
     s->base.is_jmp = DISAS_NORETURN;
 }
@@ -7146,7 +7146,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
         gen_svm_check_intercept(s, pc_start, SVM_EXIT_ICEBP);
-        gen_debug(s, pc_start - s->cs_base);
+        gen_debug(s);
         break;
 #endif
     case 0xfa: /* cli */
@@ -8586,8 +8586,7 @@ static bool i386_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
     /* If RF is set, suppress an internally generated breakpoint.  */
     int flags = dc->base.tb->flags & HF_RF_MASK ? BP_GDB : BP_ANY;
     if (bp->flags & flags) {
-        gen_debug(dc, dc->base.pc_next - dc->cs_base);
-        dc->base.is_jmp = DISAS_NORETURN;
+        gen_debug(dc);
         /* The address covered by the breakpoint must be included in
            [tb->pc, tb->pc + tb->size) in order to for it to be
            properly cleared -- thus we increment the PC here so that
-- 
2.25.1


