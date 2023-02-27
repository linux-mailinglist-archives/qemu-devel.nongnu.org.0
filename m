Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBCA6A3A8C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 06:38:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWW6U-000653-Uq; Mon, 27 Feb 2023 00:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5d-0003I6-Jp
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:23 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW5b-0000PJ-AZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:30:21 -0500
Received: by mail-pl1-x62d.google.com with SMTP id p20so4317572plw.13
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OamVkTHfnUQ17ezU+zmeUz0tz/Qpam4ZKwlKCcTeapQ=;
 b=SWlI378sWwI/K1RgeozMlwyvCYHMg6xJrUh53vXgBqgN1fvT+a6cNl0coTpmhFFjAY
 sYeoqh9thGGdU7ofM0GSYxSMuT+3zGuvEM5tN0c9B5c1sx1fsxf3paXzzOM8Z/2DAJBi
 HSbL2BbZmsyjAkMUvhXwC+2WOm7h8lI/59LnEkmGNhP+fulK+2C82mLRy2Uxy9492+f9
 Hgu9z3VZDjlCLpK79qliJpRtt6/tbf6UedKZPu8YclDot8fn84zkq+R1IWIAtMScwlxN
 ifPLzQ7AZeot3MM9rstQkCIWr8WlQr/dgC4uP7K49acpYSOtsw94pMfPrc226IF1DnIz
 tNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OamVkTHfnUQ17ezU+zmeUz0tz/Qpam4ZKwlKCcTeapQ=;
 b=qxlr7UgRZjtNCAhpiQiEzxRKNtghCnGd/hStPI9KwL+Rpg5pM9oUYChrx4xyrKgG5I
 Q+6wV35S8CUv65dJR+FAP6xFmII6ozs7mHqfyzB5c3TDDVforW+RL7NqP7yM8Menws/r
 KjiwH377rRN+sazMY6AVZYyuMjgqE1y2L86vA1gwhwZkZ+1U/VvxiBEdAWAgdknjchDl
 VAaz3Hqcs2C7tudkseF7sa2rzBC5oETHgEQaho6lzfiCT79CUmm4sFggcm3YJqtX3zwd
 zkU8h6PZbYJfXl9+TAmrgeugv1dRYPjVVCdzPNZJOaxACSk7+BH4KAMdxpVWvfJNksHF
 P9dA==
X-Gm-Message-State: AO0yUKUQqo1bvbUyRMPuNpZZzQPbCHOu1vlHJ+/CWRQmYvL1/Tp5rSeb
 P0o1i2e5N5ZKrnKP8ELlm0ckDbmiMoKuTX5/Aek=
X-Google-Smtp-Source: AK7set8oGElELa57SFMOVPHsjEarbsqRKrfiApe19dFZmlguEIBKHSV7GDl/DhRi35zUM2j6Fcy9tw==
X-Received: by 2002:a17:90a:7a8f:b0:237:c7ed:8f4d with SMTP id
 q15-20020a17090a7a8f00b00237c7ed8f4dmr6495971pjf.15.1677475818072; 
 Sun, 26 Feb 2023 21:30:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a520400b002369e16b276sm5172926pjh.32.2023.02.26.21.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:30:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 46/76] target/mips: Drop tcg_temp_free from
 vr54xx_translate.c
Date: Sun, 26 Feb 2023 19:24:35 -1000
Message-Id: <20230227052505.352889-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/vr54xx_translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index a7d241e4e7..804672f84c 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -49,10 +49,6 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
     gen_helper_mult_acc(t0, cpu_env, t0, t1);
 
     gen_store_gpr(t0, a->rd);
-
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-
     return true;
 }
 
-- 
2.34.1


