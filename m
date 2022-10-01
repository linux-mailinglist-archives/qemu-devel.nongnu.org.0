Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D81D85F1CAF
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:25:52 +0200 (CEST)
Received: from localhost ([::1]:58934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedR9-0002xt-T9
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBv-0002ew-OK
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:07 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:35797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBt-0004BJ-B4
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:07 -0400
Received: by mail-qv1-xf35.google.com with SMTP id i12so4539549qvs.2
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=iOOeTFvZiKxuH6E/e5oN8wQ/ZcEMZut5dQQFy/oyPm8=;
 b=pDg3zdJtvlTU7gr4N7BGuYT/DXecKJVSbaxg14SWiI7dyeXeLBq80vbqmF6KiBSc3h
 3P75xC5cNSNehb7qR0Gjeidsw7m4K43QDkZE0A8hLXFyPAZQa2e4Zpjiq+Rc7UcvjCJo
 78aqjzxtmUgDyBWixuRyAs0vwuQSy78dsG7NcPMK54jyOq9hMqs8yTj9yNYnr8a/kD9v
 LqY+E6mY5letDb42AFPE/55yWKH+ZCB/Mp8ecFOhdOkc+TeSTm89ElkmC7xxZBTGSeMt
 mdcvgxNlWKr7M2Jyl91nePKGM8lKVn4/bBOZlrZk9M6APiuWamDNbvqwVB2EIOPJgNiX
 z3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iOOeTFvZiKxuH6E/e5oN8wQ/ZcEMZut5dQQFy/oyPm8=;
 b=dK2gcH9lJekexEsraLZEJfpZOWfR7a9owExZc27A15/XORXZFguT30w0oIaMhimqLT
 DEDIgOBNVYLr5ap5m4x19GNhy/C+2nyVI7BkGFrPxtPQbNutB5IPlcptP6Q3v4x8M5CG
 Q+a49Vun+8ziVUaL5HCfo4hxffsMEveu8k15aHKMtIONOcWHmhBCyOwcLPsgTjcRFs2h
 br52vV/OGTn0h025USj30o0qwwEXNNoJ0bZt6BmOJEZ7/W4xtb4+8VW4WiYne8cWh/Xm
 rzzNvsQSbJgR5DcS39CVb38SbGQlM/K9ZW33onwPkhIacrjHj1Go4b4fk8qLc6xtSE07
 UAXQ==
X-Gm-Message-State: ACrzQf2wU42nGyNQnswArKKQ9biK/eyVIIxqo30OwIJg66Oun3aj73yP
 GQDWwryNVRdHzjAQcBjtUhR2VxkUn4ew1oUn
X-Google-Smtp-Source: AMsMyM7HzY6szFfgYU+K7AfijKIrq5lFr/b8FEL3DdIScQjmobWWlWAdSS1OjWznhb+5j69+gRCUGQ==
X-Received: by 2002:a05:6214:1c4a:b0:4af:b3d9:35b with SMTP id
 if10-20020a0562141c4a00b004afb3d9035bmr8906768qvb.40.1664633404293; 
 Sat, 01 Oct 2022 07:10:04 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 10/26] target/i386: USe DISAS_EOB_ONLY
Date: Sat,  1 Oct 2022 07:09:19 -0700
Message-Id: <20221001140935.465607-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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

Replace lone calls to gen_eob() with the new enumerator.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 717c978381..6b16c0b62c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6835,7 +6835,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             /* add stack offset */
             gen_stack_update(s, val + (2 << dflag));
         }
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0xcb: /* lret */
         val = 0;
@@ -6853,7 +6853,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                       tcg_const_i32(s->pc - s->cs_base));
         }
         set_cc_op(s, CC_OP_EFLAGS);
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0xe8: /* call im */
         {
@@ -7439,7 +7439,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_set_label(l1);
             gen_jmp_im(s, tval);
             gen_set_label(l2);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
     case 0x130: /* wrmsr */
@@ -7480,7 +7480,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_exception_gpf(s);
         } else {
             gen_helper_sysenter(cpu_env);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
     case 0x135: /* sysexit */
@@ -7491,7 +7491,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_exception_gpf(s);
         } else {
             gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
 #ifdef TARGET_X86_64
@@ -8574,7 +8574,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_update_eip_next(s);
         gen_helper_rsm(cpu_env);
 #endif /* CONFIG_USER_ONLY */
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0x1b8: /* SSE4.2 popcnt */
         if ((prefixes & (PREFIX_REPZ | PREFIX_LOCK | PREFIX_REPNZ)) !=
-- 
2.34.1


