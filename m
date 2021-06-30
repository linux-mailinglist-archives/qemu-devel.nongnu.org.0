Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09823B88C7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:53:31 +0200 (CEST)
Received: from localhost ([::1]:55626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfL0-0003R3-TZ
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0w-0005jr-Ro
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:46 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0v-00029o-45
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:46 -0400
Received: by mail-pf1-x42b.google.com with SMTP id j199so2861281pfd.7
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlb9t26eUmvNmKvxgmiWrSkxF75bfUaFnwmdpAxQL3Q=;
 b=L4lRlSEe6X0ottRlvlfQnD/R36Do/SSlKLZPvAT19Ij2hgqTPSABLLSRzK3fd34j4m
 6Xfm5omQ2qXVDCpMcQd1xGLW2HJ3araka2ChbnlRLguW7tPGcaBMo9mGZswyTMxftFQ2
 IEQIXVdorrJxO25XxNdiXsTT4IHUMxKPlj3TbCPmsSj/BGdLH7l1FTTnXrMQ9vOqJFIj
 7o8HaGDDqFRUAu/LdbiOKr4wDR9C2reOEexdw/Qr12rTJobym51X4ScjG8tCwcpr3VfQ
 J/YLQsRWqSUC49M53ptYOilTOEJ9iaxH0ssWVu3K2C7rPxF4a3936Abck9C8kgr4WAvv
 7Fqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlb9t26eUmvNmKvxgmiWrSkxF75bfUaFnwmdpAxQL3Q=;
 b=IAtsFaMiuOQHVkcKW0lQc4Nmih7QdkkSK7meVgnN9/qC7gZSWGmyhVsoCsusEvhZx0
 IqfKL4Sb6HtkxqIKTtJNNDbtdONWBlhPrm0QvetKMhVvf54G8LVz5fURBFa7NDO+uZOk
 7f2OHSD6C4fc94Dw6zoTnBFIW9pRfF5tjYU//PAJZKS8UGPsZmT2LMJxMur91FtA0EES
 8nqMCXYic64VnNs9Hr92qQgh+kNB0IPfArrYi0EE8nmcIL1+i5BW8/WTRe+3qUeRtDY7
 6RTXZyUYnr5qh8YOa1cAGaEC2qnetQaJXigamQmgY/Hx0ioC1SyngmsPG+fMJ8wQFhZO
 zZ/Q==
X-Gm-Message-State: AOAM531N4av5iuUl1cPiAV0lSD/JGyYE+VV6m+tfor/boqTSE2Fuw5Wu
 mu7PEVhIP2vmGwTdoUPhH/yE+6L92YC+ZQ==
X-Google-Smtp-Source: ABdhPJxxQECUuoCV8EuaGuK3ZgvcEnSU5InLMCxS7gWgsNx/RzNYwGPwKB0EI3g7zhovSgakParKjQ==
X-Received: by 2002:a63:5153:: with SMTP id r19mr35566567pgl.56.1625077963974; 
 Wed, 30 Jun 2021 11:32:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/28] target/tricore: Use tcg_gen_lookup_and_goto_ptr
Date: Wed, 30 Jun 2021 11:32:25 -0700
Message-Id: <20210630183226.3290849-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The non-single-step case of gen_goto_tb may use
tcg_gen_lookup_and_goto_ptr to indirectly chain.

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 09465ea013..865020754d 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -3243,8 +3243,9 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         gen_save_pc(dest);
         if (ctx->base.singlestep_enabled) {
             generate_qemu_excp(ctx, EXCP_DEBUG);
+        } else {
+            tcg_gen_lookup_and_goto_ptr();
         }
-        tcg_gen_exit_tb(NULL, 0);
     }
 }
 
-- 
2.25.1


