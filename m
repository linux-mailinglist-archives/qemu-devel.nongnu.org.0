Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E993342B308
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 05:01:46 +0200 (CEST)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUWX-0004dr-VT
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 23:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHp-0004oO-Mk
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:35 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:42535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHn-0004yY-AY
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:33 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso1141950pjb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m31KIJw/lcLJxFk5HRMhG0LaXmCEuUD4FjCNknqYFfc=;
 b=tS5QHOBNSkAimxxJGS5sMxLbdlNcZlUqg80HUD3mfrp7jUWYywYXd9ja3vJ4WudfuK
 b0EbacRvKKoxVzvR4OircVEPhMCzuX4JYWl/FjcUsuElS5H0f6xWE26KOzeowi1EHPjQ
 dmriqybJ9PATd3mLgoromYY0ptoSLoz8EjT3MGvofIR5sdn1wsx4cwnu7JCSN6UKJM0n
 cep7i4yyM9D/8So+9KOFM1tuMSsOgY0SHZvAgdUIl+pqeQ34N+uWN4GCqRMsygTzEI+V
 gtuDREhA9liLtdWSzjH2X7lqsd1wf+wAWEg89qNjrZco6PzwjDAZNHQTbIL5AnubODBa
 nm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m31KIJw/lcLJxFk5HRMhG0LaXmCEuUD4FjCNknqYFfc=;
 b=7wJxSIX0+p7vs9bjX8/qb04j3WDyz3mmRxMz1GoQiG47i+YzrT58ELWaXzptXwTq8z
 ZHQq4/AWYzygVbpEE3alOWtrCiGLHxjaKbaGqpej/5xhoW4DdwI8tnmaUDxvuncfV46b
 ISYvY904cM9f8CbXlXbcHccbN8JiT7Fx699l0AgFykc9rHMQC1hawpNlZWsR2cdOJ7kD
 mfs3FvJOkziNKs4B9GvP/y93uaFYQQ36d8d+2MyWPjvpnwGGnN7m1xO8k6PWfDyh34ir
 DPyBdN/ysNOg8mgu7vP0DvTGOqnWRUad/Fsz/Qv7/2408HmLgwmQ9wT6p9Vk9i1TC7Fh
 Hkpg==
X-Gm-Message-State: AOAM530GvhjiOSjNjL1xq6VlkUZcyK9/iUiuDwf91JmkDfWWAq2vDYcG
 qwqN8uO0nUz+b60DC6rkdTq5RZhNe5FQvQ==
X-Google-Smtp-Source: ABdhPJw1NfBxr5gBx5KuItjd5YKQ3hVlX6qodbFpuFYYnzrLRF4YOroYjcAFNXSOpdG+nSZ0b+weRQ==
X-Received: by 2002:a17:90a:7d0a:: with SMTP id
 g10mr10473974pjl.73.1634093189051; 
 Tue, 12 Oct 2021 19:46:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/48] target/ppc: Use MO_128 for 16 byte atomics
Date: Tue, 12 Oct 2021 19:45:38 -0700
Message-Id: <20211013024607.731881-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: qemu-ppc@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b985e9e55b..9ca78ee156 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3462,10 +3462,12 @@ static void gen_std(DisasContext *ctx)
             if (HAVE_ATOMIC128) {
                 TCGv_i32 oi = tcg_temp_new_i32();
                 if (ctx->le_mode) {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_LEQ, ctx->mem_idx));
+                    tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128,
+                                                        ctx->mem_idx));
                     gen_helper_stq_le_parallel(cpu_env, EA, lo, hi, oi);
                 } else {
-                    tcg_gen_movi_i32(oi, make_memop_idx(MO_BEQ, ctx->mem_idx));
+                    tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128,
+                                                        ctx->mem_idx));
                     gen_helper_stq_be_parallel(cpu_env, EA, lo, hi, oi);
                 }
                 tcg_temp_free_i32(oi);
@@ -4067,11 +4069,11 @@ static void gen_lqarx(DisasContext *ctx)
         if (HAVE_ATOMIC128) {
             TCGv_i32 oi = tcg_temp_new_i32();
             if (ctx->le_mode) {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_LEQ | MO_ALIGN_16,
+                tcg_gen_movi_i32(oi, make_memop_idx(MO_LE | MO_128 | MO_ALIGN,
                                                     ctx->mem_idx));
                 gen_helper_lq_le_parallel(lo, cpu_env, EA, oi);
             } else {
-                tcg_gen_movi_i32(oi, make_memop_idx(MO_BEQ | MO_ALIGN_16,
+                tcg_gen_movi_i32(oi, make_memop_idx(MO_BE | MO_128 | MO_ALIGN,
                                                     ctx->mem_idx));
                 gen_helper_lq_be_parallel(lo, cpu_env, EA, oi);
             }
@@ -4122,7 +4124,7 @@ static void gen_stqcx_(DisasContext *ctx)
 
     if (tb_cflags(ctx->base.tb) & CF_PARALLEL) {
         if (HAVE_CMPXCHG128) {
-            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_Q) | MO_ALIGN_16);
+            TCGv_i32 oi = tcg_const_i32(DEF_MEMOP(MO_128) | MO_ALIGN);
             if (ctx->le_mode) {
                 gen_helper_stqcx_le_parallel(cpu_crf[0], cpu_env,
                                              EA, lo, hi, oi);
-- 
2.25.1


