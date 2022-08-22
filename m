Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0875959CC7B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:49:42 +0200 (CEST)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHAr-0002NO-5p
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGv8-0005fZ-Ct
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:26 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:46998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGv6-0007En-S4
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso12914423pjo.5
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=I0Ab1V06eTSd++du4BEeVdBOxUXl44KJmulBDPQpHyo=;
 b=vy7AWQbXlkrOh8piRh00fhrNK7cu6sSMKdQiSQKGLxjF2nZCvIsY5GpbuhJuwSpq1b
 QsXWvbT9DfB+FG6+Fo9fW11kJwBbu8RwgG82nARZUqPGCuEX3SiIDB4yXpmv7trzyJda
 +vikdE6NtOK1UL1zc50qIIDaxEtPhay4BXggpPccTKizBBOl9i2cImDzKeszk5ZLgNF7
 PhJUNWVw05VyQSAmQRCe09l4CBwgfoB6vgI92VEyszCbcjm88OozCT+lYijE+TKpq+3E
 eQMay81xAJnQtCgYZExFjgmtaKAYRk3JRp4BQu6cRqXDGrYr+YIfYjCBjvfQTHr871SB
 ZQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=I0Ab1V06eTSd++du4BEeVdBOxUXl44KJmulBDPQpHyo=;
 b=XUmHiTR9WCo15FH8KvOAJMxktrf7qtN3kkraB2atwzsReKOXWnZs1VjdvgNSnR5Nlp
 fHY7CH8dqxvPrhVw+6xyTeLm5+I6QZcDhKLie9GIp0siVl9y/dyoY9Vyr62P6G8yOpK9
 thQ6ZOxZzmBcgj951J/Bd+5A6NfLDHoo6qj5G3C7TtfJuCBtdic2NdwxqNz9v6inr0du
 2pr2OtUDrCKWZHvhxFk+iNeEqB2s0zTKoCpOC6ufZ2nWjOlMIYNcsy4yetPWn5NbIYr1
 rDTOniw7jv+m/nnssJFBWmUjvj4EyE5Hki52PWvsL9I8iNpte2bHF7/XFtZ2/nagQUUs
 CVYw==
X-Gm-Message-State: ACgBeo25yhIlNGoh0dR6+wk3OaE5JXDdkYeFmFA1JWPOx7whyPzINDbp
 LgIFToiZkSbvlwe7Syo+n52JrATC5v3yEQ==
X-Google-Smtp-Source: AA6agR6UVQZ7n1ML6ZUUSexFJgFgRlpclP8IXIlaDrFwQhR6zw0um+LtocZ6suLqyNrVwnCK1Q6Rpw==
X-Received: by 2002:a17:902:cec1:b0:16d:c4f2:66c5 with SMTP id
 d1-20020a170902cec100b0016dc4f266c5mr21734687plg.20.1661211203606; 
 Mon, 22 Aug 2022 16:33:23 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/22] target/i386: Remove cur_eip,
 next_eip arguments to gen_interrupt
Date: Mon, 22 Aug 2022 16:32:59 -0700
Message-Id: <20220822233318.1728621-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index f6a861e10c..d3b16ea28c 100644
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
 
@@ -7194,12 +7193,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


