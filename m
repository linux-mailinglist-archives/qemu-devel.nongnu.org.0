Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF440536646
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 19:02:00 +0200 (CEST)
Received: from localhost ([::1]:36138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudLb-0002Qf-PB
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 13:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8T-0001ll-HV
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:25 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8R-0005Pt-Kj
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:25 -0400
Received: by mail-pj1-x102e.google.com with SMTP id gk22so5085972pjb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iwCHC5zYGGXmRt70+BuzxFh5vRmOK8/ztMHW5zGIQq0=;
 b=QcdlxC8USzFrAxtqMEhAKZj/KtCKlXTnKDZYLbDgzyq2MrAZRuNSY+c7ehP3oyYSrE
 l60J3rbOpAAkdHnOE66I1ho1WVP52fe9QSqkhLBqNe84Ek9wPUleiHmmGWHHVTyU2znJ
 mqVqzqlLinVxLgDK/WZrgThHFQNGDQWMNgNHHg4aHxE/gURcz0GsdkhG2zLmA7WhnaCD
 ajS3Jymc6sO4vQrLLtubaHOJmjvmXxP+NyfJE8oYf7veibHWcO1LaDFkWwB2lF+akKJ8
 1D72BGByNk39ORy1R9QeX3tZaizGWHQdS82t0b5J7MlbW3kDRY8qO+ACln7tg6JBvz0z
 +2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iwCHC5zYGGXmRt70+BuzxFh5vRmOK8/ztMHW5zGIQq0=;
 b=EcsI1NN77vX2msnUt5iEIsI4/AJo//wa8CQlw7q6tXj//45apXKSQZu4sFj3K9OlD2
 tZMOoBgN5yOMy0OUWD69B/EOVy9v4BGcaFeQkate3f+0kyup+c0/Nk9FMJqt+va4RYeW
 HRnjW8urSE73bk8ezb230H/O0RVlGTnfw6FqbLleGk/jVZcX+bdPuzPkAiR6R9UQq1bD
 Njx6UZOqPw7DgJwrD0HoThu5XIQxI3y9s5jWDUUwSmTPja9iuA8ZV7qz/7RUeoS7EFT3
 ruMf3RAIS5a8KcbjEDqzSo7bocNDpxgxKuBRsAiNZ8rgoovgIaZopPZDMLmrx8WF68YI
 KdOg==
X-Gm-Message-State: AOAM530RukRc3j6ATxBhhbWHn+Yi050Z7BwbUxLtw9squoZ9xt0G/+XP
 zMrZDOeAWr/APygg9Q0qdKx1D2x4WQajKA==
X-Google-Smtp-Source: ABdhPJx/m2nvUhQ/P6F2hnrvuJAhMTZnuAWsQDIDLlJ+4dmZnslg3f3S8RdKKxrpu4ydKLqS0u14AA==
X-Received: by 2002:a17:90b:1b08:b0:1df:f11a:7d51 with SMTP id
 nu8-20020a17090b1b0800b001dff11a7d51mr9465736pjb.190.1653670102395; 
 Fri, 27 May 2022 09:48:22 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 13/17] target/m68k: Implement FTRAPcc
Date: Fri, 27 May 2022 09:48:03 -0700
Message-Id: <20220527164807.135038-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 0cd7ef89e3..a3141d7f77 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -5567,6 +5567,35 @@ DISAS_INSN(fscc)
     tcg_temp_free(tmp);
 }
 
+DISAS_INSN(ftrapcc)
+{
+    DisasCompare c;
+    uint16_t ext;
+    int cond;
+
+    ext = read_im16(env, s);
+    cond = ext & 0x3f;
+
+    /* Consume and discard the immediate operand. */
+    switch (extract32(insn, 0, 3)) {
+    case 2: /* ftrapcc.w */
+        (void)read_im16(env, s);
+        break;
+    case 3: /* ftrapcc.l */
+        (void)read_im32(env, s);
+        break;
+    case 4: /* ftrapcc (no operand) */
+        break;
+    default:
+        /* Illegal insn */
+        disas_undef(env, s, insn);
+        return;
+    }
+
+    gen_fcc_cond(&c, s, cond);
+    do_trapcc(s, &c);
+}
+
 #if defined(CONFIG_SOFTMMU)
 DISAS_INSN(frestore)
 {
@@ -6190,6 +6219,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(fbcc,      f280, ffc0, CF_FPU);
     INSN(fpu,       f200, ffc0, FPU);
     INSN(fscc,      f240, ffc0, FPU);
+    INSN(ftrapcc,   f278, fff8, FPU);
     INSN(fbcc,      f280, ff80, FPU);
 #if defined(CONFIG_SOFTMMU)
     INSN(frestore,  f340, ffc0, CF_FPU);
-- 
2.34.1


