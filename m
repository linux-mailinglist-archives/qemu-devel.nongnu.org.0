Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951803F75DF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:28:30 +0200 (CEST)
Received: from localhost ([::1]:53126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsxB-0007Qf-Ld
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:28:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZV-0002Nq-MX
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:01 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZR-0002oH-Ck
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:04:01 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d26so16007528wrc.0
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GNdchmjx1hAPs99QM/cyYenjVo5gduMzC+mR4TSLags=;
 b=I/lnlo20e7aZ3sfWmM6oHRnkqCBxcv0YYtpz1bY5fbDsNP1tD8ind6cejT/Z5Ybo7F
 Wom3XUMKfVkYWIPoMEdQ/bzrWKNe4KDHCqyjOumzlImAEXxBGZonuvjI5/ZiMeorBWrL
 EH0EIZGXzBPrU06TEdXa8CCdk32P0yZ9FaQ1J3LQ8g0eXpZkI3nss+7CcOnLRaNXODNG
 JB/RBZckHHvC+CLUQE8Z5PvZJzZIivVhgfNTmmUeLtvwbSg5wAaGuUz+Teg/2oqyqUJ8
 WYzS7d7Y9bOLR3nqW/kjDLu/oUkZhEra2yuK7AJLY8oFvkLc8OrYga1PBmbW9AR5YMbE
 z62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GNdchmjx1hAPs99QM/cyYenjVo5gduMzC+mR4TSLags=;
 b=lzYvH9qEvu3jMm8V24QBDepmnqVheoiknbGPtK2sy7CPwFbbEGL/LJTAabnGlIG6o9
 CyjRyJbsAw+fYR6GgEw+G7KRLZNUtVKqX3n6tppbzTGmPwXgNTefPnbBFhz8xZ+4m+s8
 9c0/B1DybDoQR4ZzjsVn+TpoOx3naefMEfccuIDDgd8lfXSsXoJxavGDmyH3wtB6Bfke
 8TG1wpylr3uC7mgQ0avyDf42d9kB8kUwtAr0poRR++93DLixZo4Yur3ohe+caF3fmqOy
 UhvlquWSdzuKcgLi5YOxYlWXqmLgvFYMonFUhr7h6T6en1s1UkpKNI8L2FLYV3S1P2Rh
 niUQ==
X-Gm-Message-State: AOAM532ZblrXrpCm6l/4G+GEJ4uQSm4O3hrx/N7b14HWIu4NKRcFxVQI
 nL+s47cZfXn3u4Lsw7UFEyXAZLZVQkM=
X-Google-Smtp-Source: ABdhPJypE72yqcuzowUbeLXu4ExOpl4Nnv19gTxX9r6bLOYitQ2R52Hn3VxM87HbXmnZD6nvW0/Ymg==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr22861929wrw.264.1629896635869; 
 Wed, 25 Aug 2021 06:03:55 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 v5sm4995658wrw.44.2021.08.25.06.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/28] target/mips: Use tcg_constant_i32() in
 generate_exception_err()
Date: Wed, 25 Aug 2021 15:02:05 +0200
Message-Id: <20210825130211.1542338-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

excp/err are temporaries input, so we can replace tcg_const_i32()
calls by tcg_constant_i32() equivalent.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210816205107.2051495-8-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c515a337ebc..93b72c994f2 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1363,12 +1363,9 @@ static inline void restore_cpu_state(CPUMIPSState *env, DisasContext *ctx)
 
 void generate_exception_err(DisasContext *ctx, int excp, int err)
 {
-    TCGv_i32 texcp = tcg_const_i32(excp);
-    TCGv_i32 terr = tcg_const_i32(err);
     save_cpu_state(ctx, 1);
-    gen_helper_raise_exception_err(cpu_env, texcp, terr);
-    tcg_temp_free_i32(terr);
-    tcg_temp_free_i32(texcp);
+    gen_helper_raise_exception_err(cpu_env, tcg_constant_i32(excp),
+                                   tcg_constant_i32(err));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.31.1


