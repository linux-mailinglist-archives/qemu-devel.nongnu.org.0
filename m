Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA77536639
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:59:11 +0200 (CEST)
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudIs-000707-Ei
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8Q-0001cp-DX
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:22 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:38699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8O-0005On-Pq
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:22 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 90-20020a17090a0fe300b001e292e2b81bso584587pjz.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mJfzlbqqWQ9fRdLvn4vq10zAIiL+VAhrCO0+lipHHC8=;
 b=vOtEP5OKy6LpEaQ2O3JgroyNu6zj/b7wakakRmvyOw42YnZMF4/WmRSWvUxcC+V2HR
 ZCJ7rjqNq9l+cXc7gvL3XMwo860o0wqBnuNNM+d68U3hMPvNuAEclXsUOjDbHm1lNrks
 Z/drQIUdPvNLHoLZ9N3hfh0EfzGAA7a7RE73NahGyFdAogTTI7v85ZIu1ifkAU8jbvjQ
 1h0CeKizvyQGi3hlsDsR+0ykTc/JUx5FCa+f7P6xYnPuothyWepM5k7e6AcGy341RR22
 kgsPLNSXa3HD2m4sWM/H55PuuKlspx75kjOhUgwVgV3q7ZGr4YWG/5vDxL2iM3VlVUwa
 vFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mJfzlbqqWQ9fRdLvn4vq10zAIiL+VAhrCO0+lipHHC8=;
 b=j1+eHpZzwbVfgGg7AaGxXNTCC2jgf5yHpuk44P7fspmUS/DqsJgrHHEbCJdziS63Rw
 2uK3scuFa419XNqwQ1iTOh/BP0t9a5OLxusTg/C+Pc/wLzJX82yOchSF8YtpZ3IIAs+V
 M7buh5GfUPc6e5S91jzgOF1xWq1s0FhOw2SD1+AmGtpTywKrDxJypnNkznrkRZBiqkHp
 WJDSP7eLxb0+BNc/wojkR1KsV8TsNOmE5oQOChQs6NdCpC46SVEOZNsDxwq/vi5Grbom
 6up9narxmKyzDyFggB+Z/gRG+sshlsBrLCHwPmul3iy88csPL/sQh3eJnkM5tJFhaAsp
 LaoQ==
X-Gm-Message-State: AOAM5326q84WypxsxCw2Nl4xGX0WSkkmxvoGYIMplnLhJe7EmTECARWn
 JgW7RjlZF4xLyyUO0OmYPhN3RlIVkY1RUw==
X-Google-Smtp-Source: ABdhPJz1Gho9CkKaPm39Hd/wWWzLC6GQWkSzCTRbjpc2tTAinjzSSaaKhJrit7zdAvx8FPTCId7Uug==
X-Received: by 2002:a17:90b:350b:b0:1df:a236:370 with SMTP id
 ls11-20020a17090b350b00b001dfa2360370mr9338957pjb.245.1653670100066; 
 Fri, 27 May 2022 09:48:20 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 11/17] target/m68k: Implement TPF in terms of TRAPcc
Date: Fri, 27 May 2022 09:48:01 -0700
Message-Id: <20220527164807.135038-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

TPF stands for "trap false", and is a long-form nop for ColdFire.
Re-use the immediate consumption code from trapcc; the insn will
already expand to a nop because of the TCG_COND_NEVER test
within do_trapcc.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index c4fe8abc03..bb5ed1b7b1 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -3075,22 +3075,6 @@ DISAS_INSN(addsubq)
     tcg_temp_free(dest);
 }
 
-DISAS_INSN(tpf)
-{
-    switch (insn & 7) {
-    case 2: /* One extension word.  */
-        s->pc += 2;
-        break;
-    case 3: /* Two extension words.  */
-        s->pc += 4;
-        break;
-    case 4: /* No extension words.  */
-        break;
-    default:
-        disas_undef(env, s, insn);
-    }
-}
-
 DISAS_INSN(branch)
 {
     int32_t offset;
@@ -6099,7 +6083,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(scc,       50c0, f0c0, M68000);   /* Scc.B <EA> */
     INSN(dbcc,      50c8, f0f8, M68000);
     INSN(trapcc,    50f8, f0f8, TRAPCC);
-    INSN(tpf,       51f8, fff8, CF_ISA_A);
+    INSN(trapcc,    51f8, fff8, CF_ISA_A); /* TPF (trapf) */
 
     /* Branch instructions.  */
     BASE(branch,    6000, f000);
-- 
2.34.1


