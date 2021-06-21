Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F2D3AE18F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 03:52:48 +0200 (CEST)
Received: from localhost ([::1]:59716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv97H-00066W-M3
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 21:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8qG-0004Bv-2x
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:12 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv8q1-0005Fk-Ha
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 21:35:11 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so9292419pjn.1
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 18:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FyYP01btqNHdTOFLIRaUteWZ03amrYw7Mq0xWdr/+oA=;
 b=hQdA7rUDm50MV6QRisqQw3w4PUj5b2FTh7YKG0/9wSct2BYIq1+e4we0aXPur0TYf3
 DaSAxX9XVzckZ2h1+xXWaLc16H57Ka851OaKvLsoZtl9UizuU/EvraCzGc/C0BtAyI7F
 5d4Qmb12vlxvpcmMWSptEMytxci8qF1P/g/0aE4XTq+CAEFGdzkPD5MtvKB3Hpx5Np85
 s0MpXLOK/y0+c65Y41LnGVUQXlxwZF2QV7fl1BH6nyM6zwhkESFkOXVUKZWEF5QhoZd7
 3KAnscVatFDt7WeQXxJbWGHi3RsuZEwSJTF29AR05GB/n10Wege/Vus9/CJeauhDUnGQ
 rD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FyYP01btqNHdTOFLIRaUteWZ03amrYw7Mq0xWdr/+oA=;
 b=XeIuliNeBHOcg+FTHVHHsjauh9LtjA3SmgnsBYqZNYsEzGP9nqVDErfE1x6uJW14D2
 n60Ilp0tPjOOd0iyAdIx+gGpw2cwSDzvovmxUSNPmbaNM1Gfc6rnBERQGIf30QH2NMZK
 WwZ1XqwGBaszcVdUueMcrt28jJdRFjB6okCwvwKEY725i1Vw7y/Hc0wu+wEW8G6SIm8c
 AqGZWg082qp0uBifQ1sKUBCmmdlPq5CmhEDTQ23bb1n+EzgxFffe+/v7dJiMCDe2nygz
 osqBeIPViEg9w8bKrS2c3A2OHKtfaAwSGNSHikAiK6dXks8tomrcBCWLzjOvm6jxse8b
 Iyew==
X-Gm-Message-State: AOAM5319tIHpah/JALVTtYnrrIzsO6FOLaSKWg0i7YaLa69w1uJlI5lJ
 5AF4cdFaFBnwC2YrBXj+7Rvb+RIYDDzmGA==
X-Google-Smtp-Source: ABdhPJz1YN0VyH8n8k34a7n+uDi9vbQjpsAOHqmOw6PC7jugdY0WTJvxsR0WuQ0KW1xmE9Ei4y7DqQ==
X-Received: by 2002:a17:902:720b:b029:113:19d7:2da7 with SMTP id
 ba11-20020a170902720bb029011319d72da7mr15481603plb.55.1624239295362; 
 Sun, 20 Jun 2021 18:34:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s27sm1495628pfg.169.2021.06.20.18.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 18:34:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/26] target/tricore: Use tcg_gen_lookup_and_goto_ptr
Date: Sun, 20 Jun 2021 18:34:38 -0700
Message-Id: <20210621013439.1791385-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621013439.1791385-1-richard.henderson@linaro.org>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
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


