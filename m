Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD533F75D8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:26:19 +0200 (CEST)
Received: from localhost ([::1]:43904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsuu-0001Ja-FE
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZK-0001ji-23
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:50 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsZI-0002k6-If
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:49 -0400
Received: by mail-wr1-x432.google.com with SMTP id u16so36352763wrn.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZkmjoDvMFjsU97UhZzTQFL9FN7lAozX9pcg/xU8suzM=;
 b=WBTd+sxBSVjqyA36jm7oYNQ6ehmSqoVhRDfHyehrayZvuNKo1WzJsyVJrstCzoZc+F
 +twB94H0NPtqrvusARYTpxzh8o+A6dTTRAVqVAeJxO8Ey9xYLY8aL3hGN3W2EmCueyq4
 U4zSh60k+A8+WQQW4OobFkfhhPey9u1NJuxKP1amOniksbfyhg434tx5mh6pu5F+qMb3
 r5SuUIcqLMpZYrEio1+ihSxig18/M9dBT6lZJm8ZZ1wMSMGbkatMT7Rs62lPojEZU8yc
 2WAim25MRrpou40tQ8mHqoK9nOs3t3uUjgYMEsohohfwsbQc1vtIHbs9vES7x+7FRial
 8IUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZkmjoDvMFjsU97UhZzTQFL9FN7lAozX9pcg/xU8suzM=;
 b=uOJf3Vp/nAgKgzxK2iHh2sZN0pBcIXGQW0Uti6MsfPD/kS8hDBEj5Q6VbjBENKGU9o
 +y5ZTTLTdhraSjvo02SAUwoAEgjSxVd0xvVl3tjxyKd1HAGdPXNwEpsmnX7qnVR4DXHQ
 XLyhNo9ZCmEKzHMBh2fOVErsGORlX9p+Sfsd3Ig3YKxc0gEJ2G1Myss/+Pcjb7cBnz7/
 f+fFgj1ekQg6a4CKqpEHSP7AE1tkkDmcBSxqc8wf/55TcVZd7PW2feO6MMwcj4QAv+zE
 wUnlQ/kKoySG7ZgZkEhGtgI8AUYAoNPTiqXpIghxd5x27frY2PC7xsQl/Q1TJyoEFuBU
 JG5Q==
X-Gm-Message-State: AOAM530V/7FBtbtaC3kB4kd8gQkuQBb8JU+PaOqHo6kp+uP+yYGy/6DG
 KCuA/tsjOsPaMleZgkz2OQYQLfffk3k=
X-Google-Smtp-Source: ABdhPJzPoaMdnHKmU6j3Gou24Zlmmb/XW8nCOCkZREq1NWdIbT9WWw02VQCsNBUXxJNwK0LUy5VIMA==
X-Received: by 2002:adf:9f01:: with SMTP id l1mr481332wrf.427.1629896626513;
 Wed, 25 Aug 2021 06:03:46 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 v21sm2083303wra.92.2021.08.25.06.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/28] target/mips: Inline gen_helper_1e1i() call in
 op_ld_INSN() macros
Date: Wed, 25 Aug 2021 15:02:03 +0200
Message-Id: <20210825130211.1542338-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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

gen_helper_1e1i() is one-line long and is used in one place:
simply inline it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210816205107.2051495-6-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 3417fc433ff..db7fc75d937 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1225,10 +1225,6 @@ TCGv_i64 fpu_f64[32];
     gen_helper_##name(ret, cpu_env, tcg_constant_i32(arg1));      \
     } while (0)
 
-#define gen_helper_1e1i(name, ret, arg1, arg2) do {               \
-    gen_helper_##name(ret, cpu_env, arg1, tcg_constant_i32(arg2));\
-    } while (0)
-
 #define gen_helper_0e2i(name, arg1, arg2, arg3) do {              \
     gen_helper_##name(cpu_env, arg1, arg2, tcg_constant_i32(arg3));\
     } while (0)
@@ -1991,7 +1987,7 @@ static inline void op_ld_##insn(TCGv ret, TCGv arg1, int mem_idx,          \
 static inline void op_ld_##insn(TCGv ret, TCGv arg1, int mem_idx,          \
                                 DisasContext *ctx)                         \
 {                                                                          \
-    gen_helper_1e1i(insn, ret, arg1, mem_idx);                             \
+    gen_helper_##insn(ret, cpu_env, arg1, tcg_constant_i32(mem_idx));      \
 }
 #endif
 OP_LD_ATOMIC(ll, ld32s);
-- 
2.31.1


