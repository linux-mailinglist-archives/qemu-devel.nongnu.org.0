Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B653C1804
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:23:52 +0200 (CEST)
Received: from localhost ([::1]:52548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xkd-0002eE-1k
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5G-0001lu-93
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:06 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5B-0008CS-8m
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:05 -0400
Received: by mail-pg1-x533.google.com with SMTP id 62so6642582pgf.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FItVyri6c20rZDoxu/jPzJDj0+JMz8PeBWfFEbYUUVs=;
 b=e93mRtznZXmVOpHDvcVPchAxvVEIhBCqAu3b/Npj77UqmDS9/QHWC4Y/j/buJIrxLI
 U6vUggHkxWV1N1fp0AhB14Z/Y4SN07Na38JuIMn997iFbkEzq3sjC4iWE0ugJTagzv9c
 lzEWlKksQeVLIYpHxC5DcXSEM2x6isuiHxak/pyHcZDKfLgdQTPlLWlClMbNLbRl30mh
 2hs89epCLcSQlLP7IsJX+O0yivtfdRvtQR2YZgxDWG63EIukY7PuxUoVb28BTfHHZHFV
 tB75WhZYBSaLGjxL2Ei3X9DBDKgpGYCDZx1CXE7VGYJplG6xqsw872ALlgZ3ae3IM1oZ
 nmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FItVyri6c20rZDoxu/jPzJDj0+JMz8PeBWfFEbYUUVs=;
 b=imTFuRUdfNLtPguncMU54rsawoCo90MlEFFvCpTOmvWEoMhcPgZkHaStgLYDr5esZC
 pLfyugYtQeYJHEQ385xEWImuO+wURBY7Hh8jZOAIq7LIrviIMKYTJMjwT110tYWQ1kcz
 U02LakWlMLBf3rum7M3b6aV+TchUUQIM/Gl/obL2w4AkcQgvqElf/COMQVsNXw+pbG8e
 qxy2TM02lKMvho/6mTbis1ojdsw5v0lC7y6dW+FfzkOEC8PTuEbspq8DGdeNZBhDQl4e
 OwK1D+z6MuHicIXJ9UJx9Atln5/san10rJ2e5n83jFKaj/Hug3Id3rNc/V1sYhP15Yhy
 O+Ag==
X-Gm-Message-State: AOAM533+FI89Eqr6VAUstP3ejGL0svDbCNTV4ZJYPvM54MHissd+s8Ui
 nwKv2Tgy+p/vpqn8lAU9BZe+Ks+Wk6tnVA==
X-Google-Smtp-Source: ABdhPJyqTx36v6qrrhTTInE63AMIWtRe6gdGTkHGxazrwUjMl18BnLMwEnl4Rr7q/QxkwTb6V/WNbg==
X-Received: by 2002:a65:6145:: with SMTP id o5mr32872936pgv.410.1625762459868; 
 Thu, 08 Jul 2021 09:40:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/28] target/mips: Fix missing else in gen_goto_tb
Date: Thu,  8 Jul 2021 09:40:38 -0700
Message-Id: <20210708164050.711967-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not emit dead code for the singlestep_enabled case,
after having exited the TB with a debug exception.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index f22d06952f..8e8f3858b6 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4959,8 +4959,9 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         if (ctx->base.singlestep_enabled) {
             save_cpu_state(ctx, 0);
             gen_helper_raise_exception_debug(cpu_env);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
         }
-        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
-- 
2.25.1


