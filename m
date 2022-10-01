Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A895F1CA4
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:20:09 +0200 (CEST)
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedLX-0005fj-Rt
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBu-0002c8-A9
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:06 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:45954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBq-0003zl-Tj
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:05 -0400
Received: by mail-qt1-x831.google.com with SMTP id r20so4215593qtn.12
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=svonqB2VBPh+GA3LHfbIXxwiFQTqByB7DcMMP+1E+Yk=;
 b=F1VtLZeUs470DpWG27ouB/izCln+Hv2Y7vrfr16wXU9igI92KT8CnLt5ibqJZNxBC9
 Hp0O/a6A9yDr2RwvbLNw7mlX1CDU8Jvi7j4OZJYudFC/SbSutSu58Wc0XZBE4KvSMtdc
 ZpIFtS4m3PYmnMADJJMl8P1JaJWCg1Y81tM5Yxu42VH+UiiGuO9KyO65EVbc/WEmVkLo
 KXPn7Zt38LLuCC/U8T/e8iOpfKNSVdgY3suZ2LN9S0t7sNMUoNflLBPw//ynL0x+9KLw
 N0WMWtygjta/QBYo9nsCOp83MA2X6ABLYi+ouXsU/UxzghK+TfDwshT70lSVIuPRhRtM
 C9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=svonqB2VBPh+GA3LHfbIXxwiFQTqByB7DcMMP+1E+Yk=;
 b=kaeT1jD6eWK9gO5qC7mAczh2gjcdvG8j1X9IhviAlTtRgT/WtOoZzcPAqGoCFAbAXL
 iUMx1KwzsGyMJisEaFL2nIfI5R9j+M8+DmtJren413x9OxBW9hA7VJSGxcG5WdT4R5HW
 Hb1GmhIESd0X7NKgZPh7YKNlsHBhZZrAmlNyyMsXsvur+hrmYB8hMy2nBl9K/OVPUsLh
 8EDdsrSXwIEW+JyfhtoENwd85tHpFyiUB2jpYsdzlgRRtx+jrto/hCCjmGx5zoD13Ghw
 b81hv2jhcfs+XJDpDrTHVtVQ0dfc9sUIJvrcPoA25foAEywnpR6ZWY0yEApBf6Mq38D0
 R8Pw==
X-Gm-Message-State: ACrzQf1rseiInxfyplvp2K5DrFkq4Nwe3OOvGMNrKiSNDqYg2zubwMpl
 VyV21GBybyhmB6R5Z+QPVmhXcjLn6dmIF3lz
X-Google-Smtp-Source: AMsMyM7FixfmC4EQff8onIhE3rATgH9vZ4KX+0riRZM46Nji13i6ZJMbFj57lg6xT1Ws/qE9p0TbEQ==
X-Received: by 2002:a05:622a:1d5:b0:35d:497d:8b55 with SMTP id
 t21-20020a05622a01d500b0035d497d8b55mr10663927qtw.149.1664633389670; 
 Sat, 01 Oct 2022 07:09:49 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:09:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 04/26] target/i386: Remove cur_eip,
 next_eip arguments to gen_interrupt
Date: Sat,  1 Oct 2022 07:09:13 -0700
Message-Id: <20221001140935.465607-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callers pass s->base.pc_next and s->pc, which we can just as
well compute within the function.  Adjust to use tcg_constant_i32
while we're at it.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 617832fcb0..5a9c3b1e71 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2627,13 +2627,12 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
 
 /* an interrupt is different from an exception because of the
    privilege checks */
-static void gen_interrupt(DisasContext *s, int intno,
-                          target_ulong cur_eip, target_ulong next_eip)
+static void gen_interrupt(DisasContext *s, int intno)
 {
     gen_update_cc_op(s);
-    gen_jmp_im(s, cur_eip);
-    gen_helper_raise_interrupt(cpu_env, tcg_const_i32(intno),
-                               tcg_const_i32(next_eip - cur_eip));
+    gen_jmp_im(s, s->base.pc_next - s->cs_base);
+    gen_helper_raise_interrupt(cpu_env, tcg_constant_i32(intno),
+                               tcg_constant_i32(s->pc - s->base.pc_next));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -7342,12 +7341,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0xcc: /* int3 */
-        gen_interrupt(s, EXCP03_INT3, s->base.pc_next - s->cs_base, s->pc - s->cs_base);
+        gen_interrupt(s, EXCP03_INT3);
         break;
     case 0xcd: /* int N */
         val = x86_ldub_code(env, s);
         if (check_vm86_iopl(s)) {
-            gen_interrupt(s, val, s->base.pc_next - s->cs_base, s->pc - s->cs_base);
+            gen_interrupt(s, val);
         }
         break;
     case 0xce: /* into */
-- 
2.34.1


