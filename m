Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E83C17B1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:03:59 +0200 (CEST)
Received: from localhost ([::1]:43132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XRO-0000XD-MQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5E-0001fD-Aa
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:04 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X59-0008C3-Uz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:04 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h4so6603597pgp.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5qeUnpTdLcqBB4VJnNOm/71P6psxWkg2opVhSeP3uiA=;
 b=BLuspFy5pWnF7Im3xuUhe3vCxHWPVEGXg1VErOkAiX9eii97eaClRTtDyMu/6ws87N
 t0i44OrVwzT1YSQnk8mWRlI4+jZZjPQpC+d+Q56ERgAUphraxPPaaqBiUtZTXVays1/m
 lxML2J3OpwH4mU6383qMBQF59bDESHqnWezNzJ4u342Zop2DyCCV9gWsSKt0NLGekOcZ
 fLSVvd7cneuZydlJMbaV1AxUBAxhBatHDppD9r3jalnREP67l9tEpiVjQ1L0oE2XsTrf
 XayCvN6Kc76xSgOBcQkWnp7Qnz3qu93czXFciPnIFkpBP22smYo92/xACgQWLB17D4x/
 iPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5qeUnpTdLcqBB4VJnNOm/71P6psxWkg2opVhSeP3uiA=;
 b=f2VDucy6m5CsfMBRASjMoffWfON3EmLpAhAkon5IUi4jwXpXdYTvqmFJQKRcmxFcqc
 8rZLmdNAa/2v0eilGQVObN8IdgYFhKfXZtIR2qynG1m9yktSoQA1lRA07DQ9KcfOSXbR
 zc+o7gmhDkX2qLq8pISyH5xM80fBC0qQ6UsFvVTOeQpavu/3gXd71I7aQIWPJ/f7zmAt
 XYpqmhBAycLqZrWwaodwVbi/GygqqUhMzUz0XxKzOegKgFlANcG5adPbOjtpcaj59CF0
 5fUxIIfvxp8ktfoM8scVvs/PjI5zd+ZTEJeNuRq+iSo2fxFd8SxNBb6aMKbWBpt/Auqv
 IyoA==
X-Gm-Message-State: AOAM53263w13CBeLmIq3Bme/1bDJkuScsoCvmMMlhbo5OBHlgIhVbJAc
 7yWY2UYvYJ89yfmPgN0YJxj7Etha+PX4yA==
X-Google-Smtp-Source: ABdhPJz6yntRX1rLqfoT0/MOWl0w2v8NKWzuPx4FFMeDhssDFiF4AehHLkzp6RihTb71nPk/hgXTog==
X-Received: by 2002:a65:4286:: with SMTP id j6mr20227986pgp.10.1625762457838; 
 Thu, 08 Jul 2021 09:40:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/28] target/i386: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:34 -0700
Message-Id: <20210708164050.711967-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use translator_use_goto_tb directly at the one call site,
rather than maintaining a local wrapper.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b21873ed23..eb9ee0296f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2314,21 +2314,11 @@ static inline int insn_const_size(MemOp ot)
     }
 }
 
-static inline bool use_goto_tb(DisasContext *s, target_ulong pc)
-{
-#ifndef CONFIG_USER_ONLY
-    return (pc & TARGET_PAGE_MASK) == (s->base.tb->pc & TARGET_PAGE_MASK) ||
-           (pc & TARGET_PAGE_MASK) == (s->pc_start & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
-}
-
-static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
+static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
 {
     target_ulong pc = s->cs_base + eip;
 
-    if (use_goto_tb(s, pc))  {
+    if (translator_use_goto_tb(&s->base, pc))  {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
         gen_jmp_im(s, eip);
-- 
2.25.1


