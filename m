Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25356A3C06
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:10:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWNF-0003jD-2j; Mon, 27 Feb 2023 00:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMg-0000u2-O3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:58 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWMb-0007C0-K4
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:47:58 -0500
Received: by mail-pj1-x102d.google.com with SMTP id x34so4952411pjj.0
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BXfLkdSGhIhYLj+zF+EO/topHFdhgFnMNuKv4zKtRz4=;
 b=DF0um1RBOFgOE3wUlq6/GdigsRLtIi1t5Y/fSsnksvG4kZjaPXz/sIYxmmsCRGKXhY
 k/UAiheXRYzT+oC12U+UY+Po3rqw08cZKc539IKO3iuKTDaL9UegP+iwhewRXiv6nT4W
 cTXd2llHTZmh65z3PLhfWVoYiIyLk7G3f/Lf6QgLlT4SQxlFVuj9Rfdm8UeoTZoLnmSB
 9lwPodnxkg5vNJ3BbS6M780TZxJ6KSgrWZJYpK3miZlEAjNPoCkIkIyb/GxAp9/pszvx
 M8TR92mOKG5BHj+tJFzZUt7aqORp+zhfbju7o/LVIydCt7bHIO4as6WYkgFg2Q73bPQU
 nJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BXfLkdSGhIhYLj+zF+EO/topHFdhgFnMNuKv4zKtRz4=;
 b=BOf0qOyLpdYcoBePhR/lSc55w2EilYCuM9LbJknZh0ngKp8LtmqN4QSGnwStcXZ5A6
 qhyhMp57TgO+QRSlRL0+FGjrFgdJKnZGTLQNEm9K3J9ZwPYrSKRvG9tD5AV8D9tud7jV
 FKTZuLmvNc5jMuVQ0ZKGwAxclb+njR9m9CcT4G2Z9MAM/2m0hxukGeUKGlTMVgjfyuOX
 daWJsz6gY2IksgFrjCqcNlUBHZdqSL7keSOblqULUQVPchH4+5ZmONI2GsIw62RocasV
 jGUTstr4LsfMxTrSiujMhEqXesk9IKfGF8YO8OFBd1NgImCji3KI7jN/fTNCe7uSumra
 f75A==
X-Gm-Message-State: AO0yUKUG0hlkGqUReVqgElbRcoc9OgJoob1R55sRcXZJju3wQGsaZML6
 /z1Y5cYtefEyQ7itqFnWQPwc3E3OwTJm8Go2idc=
X-Google-Smtp-Source: AK7set8WYJbXORlcmqRwkdrn5sMTyQLYgSfGmE1B9d+9tKKxpGPbgOPVtp9dyIhwRzDZuftlj44ouw==
X-Received: by 2002:a17:902:d4ca:b0:19a:9880:175f with SMTP id
 o10-20020a170902d4ca00b0019a9880175fmr29539857plg.51.1677476871972; 
 Sun, 26 Feb 2023 21:47:51 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 im16-20020a170902bb1000b0019a983f0119sm3553986plb.307.2023.02.26.21.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:47:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 48/70] target/rx: Avoid tcg_const_i32 when new temp needed
Date: Sun, 26 Feb 2023 19:42:11 -1000
Message-Id: <20230227054233.390271-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These three cases use a constant as first input, and
then overwrite the temp in the output.  Separate them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/rx/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/rx/translate.c b/target/rx/translate.c
index c47aa26893..6b218d5d5e 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -1313,10 +1313,10 @@ static bool trans_SHLL_rr(DisasContext *ctx, arg_SHLL_rr *a)
     done = gen_new_label();
     /* if (cpu_regs[a->rs]) { */
     tcg_gen_brcondi_i32(TCG_COND_EQ, cpu_regs[a->rs], 0, noshift);
-    count = tcg_const_i32(32);
+    count = tcg_temp_new();
     tmp = tcg_temp_new();
     tcg_gen_andi_i32(tmp, cpu_regs[a->rs], 31);
-    tcg_gen_sub_i32(count, count, tmp);
+    tcg_gen_sub_i32(count, tcg_constant_i32(32), tmp);
     tcg_gen_sar_i32(cpu_psw_c, cpu_regs[a->rd], count);
     tcg_gen_shl_i32(cpu_regs[a->rd], cpu_regs[a->rd], tmp);
     tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_psw_o, cpu_psw_c, 0);
@@ -1979,10 +1979,10 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
                                         cat3(arg_, name, _rr) * a)      \
     {                                                                   \
         TCGv mask, b;                                                   \
-        mask = tcg_const_i32(1);                                        \
+        mask = tcg_temp_new();                                          \
         b = tcg_temp_new();                                             \
         tcg_gen_andi_i32(b, cpu_regs[a->rs], 31);                       \
-        tcg_gen_shl_i32(mask, mask, b);                                 \
+        tcg_gen_shl_i32(mask, tcg_constant_i32(1), b);                  \
         cat3(rx_, op, r)(cpu_regs[a->rd], mask);                        \
         return true;                                                    \
     }                                                                   \
@@ -1990,10 +1990,10 @@ static inline void rx_bnotr(TCGv reg, TCGv mask)
                                         cat3(arg_, name, _rm) * a)      \
     {                                                                   \
         TCGv mask, mem, addr, b;                                        \
-        mask = tcg_const_i32(1);                                        \
+        mask = tcg_temp_new();                                          \
         b = tcg_temp_new();                                             \
         tcg_gen_andi_i32(b, cpu_regs[a->rd], 7);                        \
-        tcg_gen_shl_i32(mask, mask, b);                                 \
+        tcg_gen_shl_i32(mask, tcg_constant_i32(1), b);                  \
         mem = tcg_temp_new();                                           \
         addr = rx_index_addr(ctx, mem, a->ld, MO_8, a->rs);             \
         cat3(rx_, op, m)(addr, mask);                                   \
-- 
2.34.1


