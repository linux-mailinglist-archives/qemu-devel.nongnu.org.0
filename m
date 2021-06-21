Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456A93AF980
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:36:38 +0200 (CEST)
Received: from localhost ([::1]:57474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTT3-0006AU-93
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC9-00017h-LV
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:09 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC6-00062J-RL
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:09 -0400
Received: by mail-pl1-x635.google.com with SMTP id y13so3296108plc.8
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ziCUNw7iMfXxhXUy1AbaM+Ca/hJ3SGJZ/ldvQFuxiE8=;
 b=iRRLsFbU2eyy5IhuFxyKQVJigjYMFlNBjrxYCuRlOTQayTYiFeBLPrOt5XJPKvDVPR
 4QF0d7ozH2LRwZurki8o1LfvFabWb8kSNM/o7xWz4cQfU8LlkpPCvV94U1z6cP25+0WO
 MyXHuaUWKp/isLueLqH4G/rzwW3IOGUm0PNRNdtnQro5OxD+d+imH16Syp+ZwNFv5W9E
 3qPa+pfENfgpfuaPjC3sq5hzvooPwqa0bXrOm/NGpPatFlTIBKwlTnGrlXIQa4G8ntyh
 e4YcIwMFZxH6WiFL2mAQiiKpvPO5rpTvu6z49+SebC2/uZ1loyToZuzyV4Bmh6SqupsT
 b8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ziCUNw7iMfXxhXUy1AbaM+Ca/hJ3SGJZ/ldvQFuxiE8=;
 b=HQd7NrGEObl/domIWc8NNQzxIp7BFTUVVwCgcbOg1gIIJ7JjI0lx6MUgxLFofYDf2D
 voY3kbmhrLURaB0kEb2VVesH+Drl/lrov8GDgSeYR4NwJ7FNsW7asV81ddd2ifD0F0Fe
 sYhGtrldfxcUR3Lsk0A1DF0peJdVMpVzwgomoawBrOFQQ8ceBcaO8ordL+TYvFkAWKaA
 hs3YB0HMAMcGvRLhXDtYmYc3cXsooWOdnMfV27oSMiO02CBC7uya15N73cK6EBLmCkA+
 BQ9oLNYgtXGoVn6ZojuKOYuqkJ44GaiwzDHJWpkXrSBfnB9oV5LZP+QHnycPBq5+1QY2
 H5tw==
X-Gm-Message-State: AOAM532QXiJvrIHCyeWgv5EeUQkoZrqdiNOTjZGRrnF2vdeGbok1IEhA
 gDPZn2Byf1JY5whR2/ayP0qy/mc2bhj0pQ==
X-Google-Smtp-Source: ABdhPJwZ+jxeDYANDUYDEcvMuD5sTalsEG1PjguUsdnC2WoRTH4y0iFYeMYRlu94xR9QBSfR7Z/3sA==
X-Received: by 2002:a17:902:263:b029:110:e758:2748 with SMTP id
 90-20020a1709020263b0290110e7582748mr19886070plc.53.1624317545555; 
 Mon, 21 Jun 2021 16:19:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:19:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/29] target/arm: Improve REVSH
Date: Mon, 21 Jun 2021 16:18:43 -0700
Message-Id: <20210621231849.1871164-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new bswap flags can implement the semantics exactly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 669b0be578..a0c6cfa902 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -354,9 +354,7 @@ void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
 /* Byteswap low halfword and sign extend.  */
 static void gen_revsh(TCGv_i32 dest, TCGv_i32 var)
 {
-    tcg_gen_ext16u_i32(var, var);
-    tcg_gen_bswap16_i32(var, var, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-    tcg_gen_ext16s_i32(dest, var);
+    tcg_gen_bswap16_i32(var, var, TCG_BSWAP_OS);
 }
 
 /* Dual 16-bit add.  Result placed in t0 and t1 is marked as dead.
-- 
2.25.1


