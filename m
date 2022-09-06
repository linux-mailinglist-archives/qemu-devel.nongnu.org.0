Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778C45AE62F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:06:56 +0200 (CEST)
Received: from localhost ([::1]:47824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWPv-00023f-BH
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWY-00008x-Gi
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:43 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWW-0003Yn-LQ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id bj14so1389104wrb.12
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Od9/5sVYEyw5aM2oCw6JowpUd9okmRwg1CwHbwIH7Qk=;
 b=a4UOPUzQJcU/Da6iPG6nFaPUAmb/77wDda0oM699OgNCV25EBnZ61+L1pbBcz6dXaV
 xEdGfxRbg4hBRVrnPFVbfiWqOjiPCWrdSoXKXOnErpjAmMfYE8UKA2t5IL6B3FSv5QE1
 Fuo6yNpM23aPyTKIDVJtWSYn13fsG7u6skn3rZT0aI+2GWIJ0kQVJTfG4gy+6X695CnC
 jn6bMC68ANf1x0x39AVwRX4T4UHdt7V9HhNvEzqPS4leSBgUJUEwrt/rQzYBm1A8Qs7M
 ku5fFqg3Mo4ppqV4y3M+SLQhgpe0/uj2e1WVs8YCo800JKPZsPKT2QmbPDjOzQEMupKl
 cpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Od9/5sVYEyw5aM2oCw6JowpUd9okmRwg1CwHbwIH7Qk=;
 b=d2/rzHf6MzPkADkD265VJHd85dfs1siEMjFIvxm+Xc4zAIAucOCgJwqqrAwjPoIYTk
 b+KCIJkQYvBRJ7S105X8Ieu3+ny0IbnyBBUGcFzosZMGqdsJVXsqolTMQBAu3AOjRIl2
 nXwxz+Xbwt5luX3HVIwaDBDl7oNkihggC+IgEOXPxE/sQH7Dqm/k8pSl/Txzigl5ooj8
 xauie6GtQUGOR4qtCU46hwwfPmva/1GuQ+jiRRJpNg2j83xqHXizxVNNa9Srja79VXec
 Ksss4S7saUxtEJ7N8j60J4GwPINPM4M7UFXlSoR/Wpd79NgIsNBtt1Ym9sJgipJKk1ul
 lGXw==
X-Gm-Message-State: ACgBeo2ryZSlkJWqEu4bVmJZV0IPeqoEdoTu+h5+nsKGEQ021+dnixiE
 IzYUKM6XFWyQQStjkK3qBAfhaQPDqse7EVf+
X-Google-Smtp-Source: AA6agR6LmFXQQDmqpmbIgzBK4a5u0wfwDjhK6sndupQGOd2OKsCR/1RSq1gKobeupHsWCJPPDBFz3Q==
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id
 d7-20020adffbc7000000b00220600418camr25956955wrs.632.1662458978120; 
 Tue, 06 Sep 2022 03:09:38 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 04/23] target/i386: Remove cur_eip,
 next_eip arguments to gen_interrupt
Date: Tue,  6 Sep 2022 11:09:13 +0100
Message-Id: <20220906100932.343523-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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

All callers pass s->base.pc_next and s->pc, which we can just
as well compute within the function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 58e74c3162..0210382f77 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2602,13 +2602,12 @@ static void gen_unknown_opcode(CPUX86State *env, DisasContext *s)
 
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
 
@@ -7307,12 +7306,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


