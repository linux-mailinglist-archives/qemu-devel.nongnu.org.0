Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A95F1CC9
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:31:45 +0200 (CEST)
Received: from localhost ([::1]:52876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedWp-0004s2-M3
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedC5-0002uq-7v
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:17 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedC3-0004Di-EA
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:16 -0400
Received: by mail-qk1-x72f.google.com with SMTP id i3so4421547qkl.3
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=AZ0dGRYodrffbhoE2FtdP+WtEJ39nROJL21LulCmqEM=;
 b=U6wVHHvkwSJwOztpGLZng6521uiEeqNsOsZ5yOYvfxJM5GbX9aRcPCQA2sHerwy8FI
 ktuw7r0eWo2bQyauDkAkFeo9ysAJ7qIML64mAWvQ64F+6l6Cu/trL1ISRk8T+zN0Ac03
 PM3+BJUgCx/YkDHV3+faMHFHov9s9JPyqExBORU8Ug+u/gmZQfd57UK9kod5K5bu+Mvs
 TOzjDDKyypXRELdZ77wquUztpDrAqpQu3peNXD+KPYLZ7mXVdhYhLHaducjoWzXpipkY
 1Zu9kBNZ9W8cjNLD9I6d5Cf1RdecrhycF0SH17uTRtZpJpCnOvWtq5at4yAYNNYblbmN
 3cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AZ0dGRYodrffbhoE2FtdP+WtEJ39nROJL21LulCmqEM=;
 b=OZqeaYW4jF5U+ulZvF/zZVv8XJ4sRRu7H0tgTLxTjoScofn23cq8ICjHNuIe4Con9w
 s3rdc9cRGEIWnDDma0LZZkrPhQhNGgYEayF0iIiC2fdpRMyoqNNf9moE8RGFh/VYxeoT
 s1JfJAmhMuVy+y/yRJ0KPwnYl7WO+4FzGATTRDy6yiiD+XhFDon9zqzcC7UkrVQlOfNw
 t+uoALGcU4707zuQwwaJzjffSLN+wUYElWDi/1a3GVrbQXh3iJCyEC9YAGGkid0Nl2Q6
 d5db5nPz0D87+p8vFURh9gep1XmTjgTXT+ptrn5PO2fcvD7Vuh/BP9hCmQh/SEJoLGGz
 dwwQ==
X-Gm-Message-State: ACrzQf1otfUzsvJAC+d1RWZvGN9C+Xm2pB1rWf9niukxjAB7Q3zT8ABz
 i577Thl5uPNcuooQt7b8q5/i0e9knYVeUb8T
X-Google-Smtp-Source: AMsMyM4CC4ET9klf23U/5pS1CudVB/wYppQGm3BsWwHtnN/UUNq5RB//7AJvSd1SPpGijpTAi8+ACg==
X-Received: by 2002:a05:620a:12f0:b0:6ce:4076:a80e with SMTP id
 f16-20020a05620a12f000b006ce4076a80emr9470857qkl.541.1664633414545; 
 Sat, 01 Oct 2022 07:10:14 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 14/26] target/i386: Truncate values for lcall_real to i32
Date: Sat,  1 Oct 2022 07:09:23 -0700
Message-Id: <20221001140935.465607-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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

Use i32 not int or tl for eip and cs arguments.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h         | 2 +-
 target/i386/tcg/seg_helper.c | 6 ++----
 target/i386/tcg/translate.c  | 3 ++-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index ac3b4d1ee3..39a3c24182 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -37,7 +37,7 @@ DEF_HELPER_2(lldt, void, env, int)
 DEF_HELPER_2(ltr, void, env, int)
 DEF_HELPER_3(load_seg, void, env, int, int)
 DEF_HELPER_4(ljmp_protected, void, env, int, tl, tl)
-DEF_HELPER_5(lcall_real, void, env, int, tl, int, int)
+DEF_HELPER_5(lcall_real, void, env, i32, i32, int, i32)
 DEF_HELPER_5(lcall_protected, void, env, int, tl, int, tl)
 DEF_HELPER_2(iret_real, void, env, int)
 DEF_HELPER_3(iret_protected, void, env, int, int)
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index bffd82923f..539189b4d1 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -1504,14 +1504,12 @@ void helper_ljmp_protected(CPUX86State *env, int new_cs, target_ulong new_eip,
 }
 
 /* real mode call */
-void helper_lcall_real(CPUX86State *env, int new_cs, target_ulong new_eip1,
-                       int shift, int next_eip)
+void helper_lcall_real(CPUX86State *env, uint32_t new_cs, uint32_t new_eip,
+                       int shift, uint32_t next_eip)
 {
-    int new_eip;
     uint32_t esp, esp_mask;
     target_ulong ssp;
 
-    new_eip = new_eip1;
     esp = env->regs[R_ESP];
     esp_mask = get_sp_mask(env->segs[R_SS].flags);
     ssp = env->segs[R_SS].base;
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 7db6f617a1..1aa5b37ea6 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5346,7 +5346,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                            tcg_const_tl(s->pc - s->cs_base));
             } else {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
-                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->T1,
+                tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
+                gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->tmp3_i32,
                                       tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
-- 
2.34.1


