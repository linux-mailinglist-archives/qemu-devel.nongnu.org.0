Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E24A59CC8D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:54:54 +0200 (CEST)
Received: from localhost ([::1]:45314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHFt-0005jf-OT
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvb-0006AQ-UF
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:57 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-0007Ho-BO
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:54 -0400
Received: by mail-pf1-x42c.google.com with SMTP id z187so11809861pfb.12
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=0Ulk/EP55oycLg6EdOWobL0jk3DQ47228AWYkja4WL8=;
 b=x+axZSuX48vgaBy97vIG9f3WX8r2TV4Ce8fHtWaUYTKRzNBUStlfJl5EBKMU8ulf0e
 gsJlJTDr4EXLxtnLuwRBscnyOS3LpyJpWOocNzj6OlR4U5/5A92VEHY9UwNRwOwtp74L
 lGzSob8ozOk11tclEF56NuqUB1XIAqipRMu9lm0c6u37U00asYlXKxu/Asl62mwWHxIJ
 5xVxOI0+zWgjRPx2/b1O6KMZ4ej4d+XXVr9f1iMw+lvpUb8BODyJJQP3SmNsE+eGawru
 CnwllD1g+PQYs9AHkHHjJYn8xQu3fYYXnKgDvfMNUDkrYOGRLpuP8zdmS0OrsHX7FUvN
 cXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=0Ulk/EP55oycLg6EdOWobL0jk3DQ47228AWYkja4WL8=;
 b=Gef6EPUx7wPpCYzMM1jPCqyndvThaoTgpSTn3qHSQWCOR/DA22Zr/moV1DxcXyjay4
 8kjZHl2/VOQdQgZtFML3kR4B6s/fRuq/0EjAW9h/fqgUmWlKTW/lnLj1osaLSzRqLs9w
 7sRJeD1zl34xal+l0INXgrDsVnZrduOf7SyWKo8wIcmg4UktRIG/gr97Tav70FkTmNpv
 R5LZXy9c+Y3uGMl7NJkj2b1GJGgZAQOYAWMLHUTOHldKWH7C54jPgydkVMbBiMOfyBVJ
 T8EBJ0trP7Geo2HV5haHgGxY5xTeefjNPlNLyEcYqO1Z8Iba2za8ZA/rbrdt+DgYPJQw
 G1Zw==
X-Gm-Message-State: ACgBeo15DBdgsWtd77K1UvHmjfuQnCNGQOWR+i3/m17/l7xhWW4Cuvr5
 PDkbpt67ZPB5ro6h3TEdYjQskU4BqyXiXg==
X-Google-Smtp-Source: AA6agR7WjvE2ma+mAAaQIYfqLHM937lFo/+w9c1iU8NkTFHf8hAjSJ2VX0EKCJmjoFN9jP3ZdAstqQ==
X-Received: by 2002:a05:6a00:114f:b0:528:2c7a:634c with SMTP id
 b15-20020a056a00114f00b005282c7a634cmr22698610pfm.41.1661211227475; 
 Mon, 22 Aug 2022 16:33:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/22] target/i386: Create gen_eip_cur
Date: Mon, 22 Aug 2022 16:33:17 -0700
Message-Id: <20220822233318.1728621-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 846040c1ab..6192a3e30e 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -516,6 +516,11 @@ static inline void gen_op_st_rm_T0_A0(DisasContext *s, int idx, int d)
     }
 }
 
+static TCGv gen_eip_cur(DisasContext *s)
+{
+    return tcg_constant_tl(s->base.pc_next - s->cs_base);
+}
+
 static void gen_jmp_im(DisasContext *s, target_ulong pc)
 {
     gen_op_jmp_v(tcg_constant_tl(pc));
@@ -6461,7 +6466,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                offsetof(CPUX86State, segs[R_CS].selector));
                 tcg_gen_st16_i32(s->tmp2_i32, cpu_env,
                                  offsetof(CPUX86State, fpcs));
-                tcg_gen_st_tl(tcg_constant_tl(s->base.pc_next - s->cs_base),
+                tcg_gen_st_tl(gen_eip_cur(s),
                               cpu_env, offsetof(CPUX86State, fpip));
             }
         }
-- 
2.34.1


