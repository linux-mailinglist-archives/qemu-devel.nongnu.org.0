Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EBF3B7897
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:27:25 +0200 (CEST)
Received: from localhost ([::1]:40548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJOG-0002hJ-2H
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0007zX-E9
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:16 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIsv-0000ru-ED
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:16 -0400
Received: by mail-pl1-x631.google.com with SMTP id v13so28569ple.9
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mh5EZkP0+byxDxbYNRT/+ZJFV0r5FEDwMRHJL2U5umA=;
 b=PCAnACylR+xDqvAL1HKR5NfjoFNG8Jc/sQRgW7JUGpXZoXN3G8yY8SHq6UMGCJ97PO
 0+PD6p3Y8gEd9y3Mt6P67QJKr/Dm5szerJ3404uEHEyedel8trpXUJqU5QqgusCEmpx9
 fGw/oKyQ/6Pcnit0xndTMv5Y34z2e7G5Bmztf3cEOdijP3mOarsufrRF+eAgEv/03kQG
 Q9tJmBpdAQsRiQN8MGnL6flllVINjoRDom284G/MwyLgORPiHTOMLidF9mWCsnhlHDEm
 RLTy8SPAWpCj84xD5axn/yAB/ouE5vlJA26UjYQuXQ9r9oubuTwo0+VV0R7YfD2jnda1
 HjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mh5EZkP0+byxDxbYNRT/+ZJFV0r5FEDwMRHJL2U5umA=;
 b=cmSqHn4RiPjYXLqhzeui9wFZ6l3GXRGjakRgXgOoMEz6KYsptAJkc4rCpcHDH8VtCU
 bo+EVYXIuME4M/Ih/On/vXOnXwmCR0qvPDadufao7RTBhbpLxyoWGf88+PhRN/d8GHr3
 zBIs5VvNN22sptpWGjRVLyMvUKhNN80F+piI0D3DC7cUB+DzCfq192NOXSkL03M9LEPq
 2pandQ7wrks2gc3KwXapFdWEzQfE1LCNYg1jF7v/JF1fTVNbXImDtng0BQ5EozImrCIP
 nRMx7M6/nXc2+8CicV6l/HzksLvf/OakGzvsb+2afuLsQgzUMY055uz5hYg/C7uVaJ4B
 2WrQ==
X-Gm-Message-State: AOAM533+/jR1TEIb1PklhvWSXs8IlBzR3XcIe9RlKw1p4sF4DomB4kDw
 A5a0z3gAe2cNbiEhX5aqjaUwCXL3tzGA3g==
X-Google-Smtp-Source: ABdhPJzX/K7GQFOZfxwuxmIJmcGYufuLLf8aqq6ycqurT5tDKhKTwA+3QXMLYFQtvvnKTX81eKAQ5g==
X-Received: by 2002:a17:90a:4216:: with SMTP id o22mr297028pjg.3.1624992900212; 
 Tue, 29 Jun 2021 11:55:00 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:54:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/63] target/nios2: Clean up goto in handle_instruction
Date: Tue, 29 Jun 2021 11:53:59 -0700
Message-Id: <20210629185455.3131172-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 6fd4330b31..9e71267b42 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -753,7 +753,8 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
     op = get_opcode(code);
 
     if (unlikely(op >= ARRAY_SIZE(i_type_instructions))) {
-        goto illegal_op;
+        t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
+        return;
     }
 
     dc->zero = NULL;
@@ -764,11 +765,6 @@ static void handle_instruction(DisasContext *dc, CPUNios2State *env)
     if (dc->zero) {
         tcg_temp_free(dc->zero);
     }
-
-    return;
-
-illegal_op:
-    t_gen_helper_raise_exception(dc, EXCP_ILLEGAL);
 }
 
 static const char * const regnames[] = {
-- 
2.25.1


