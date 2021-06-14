Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45F23A5EAB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:56:20 +0200 (CEST)
Received: from localhost ([::1]:60772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiOJ-00028W-RC
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6y-0002XX-Oh
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:24 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6o-0003ct-OQ
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:24 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e1so6151794plh.8
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u6MGt+Q30W0DPkO3zn0zAr3wVy2EgLq+Mej76ef0rEM=;
 b=SzYiMDuWQ9M/iRz/zbb54S69iYKXEYw9D1aFyKYxn9Y6uvsSYiPsAbh6fW2DyeZEFY
 EK8K/+BdU+eroAIrRwqPnufs/320D5jX0IfkE4MOP3dL/Cn6Jfsc7a5dRTOSNl9V4qjg
 oOy+QF2TSG8HtCvu5flahGjGBh4oXMQkCFqpG9rLwdD9kJ6B6DH8qDXoxUC05bKewj64
 04fiFpzeqK5zDD1FL8gHvF2fGMjpG0Tmsff3MVhw7drwAeOAUdB5qvFe1HAoPkJN8okt
 u8QCF9m87nbb3X2DY3oC5c7cOqCuNEQwvgN2q691CN8TK8YkVa95AD8+bIvMa+lLHHNP
 ulQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6MGt+Q30W0DPkO3zn0zAr3wVy2EgLq+Mej76ef0rEM=;
 b=TaCEBSUASvhh95Lz92D7dFre+XAta6IBEpG88y+pMyIO8jCvubqwOgnD9VsX7CJYLx
 66irBnxrLiC34WIGRy7W6Dm28iuFg5pl5M9kY2gQwqKNLvmHzz1f+rQ2oxx5j0TDaODd
 Jn0SHrpmfrT1ziFJUO2HKIjfes/KeK+3smJOjXvjbKa5CAv3R1IdCkCjgf8wPr8LE3h+
 Fu77ys0EvuQKwXqTN2WCtoZTVwy6qJEKi/QBqld8JmcIQt38TSCjQPbr+0SRpyTjfTHU
 ZqrwY6J0yymtK8y1aPqZnWHRW1DiVdmmVxUMZI3EDleJ/lnglemgwVLmAVD1shsc18Ov
 RM7A==
X-Gm-Message-State: AOAM532H6v1KtaRBZPn7ltXhUrtcUN9erjUqPZSOP5YHDGqrOcwxa8fN
 oqI3nGNouAMZDsTmxqE7GbZRJjMGqOElMQ==
X-Google-Smtp-Source: ABdhPJyBphYKRUlS67RlqZ7hRONFHhKcskarFe/vwjt58vrWpzJgjUwNzX9q4P0QRsUwW5c3ZBk4nA==
X-Received: by 2002:a17:902:c20d:b029:110:483c:b965 with SMTP id
 13-20020a170902c20db0290110483cb965mr15756500pll.77.1623659893429; 
 Mon, 14 Jun 2021 01:38:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/28] target/arm: Improve REV32
Date: Mon, 14 Jun 2021 01:37:52 -0700
Message-Id: <20210614083800.1166166-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

For the sf version, we are performing two 32-bit bswaps
in either half of the register.  This is equivalent to
performing one 64-bit bswap followed by a rotate.

For the non-sf version, we can remove TCG_BSWAP_IZ
and the preceding zero-extension.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e0785ce859..ea9d2d4647 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5430,22 +5430,13 @@ static void handle_rev32(DisasContext *s, unsigned int sf,
                          unsigned int rn, unsigned int rd)
 {
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
+    TCGv_i64 tcg_rn = cpu_reg(s, rn);
 
     if (sf) {
-        TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-        TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-
-        /* bswap32_i64 requires zero high word */
-        tcg_gen_ext32u_i64(tcg_tmp, tcg_rn);
-        tcg_gen_bswap32_i64(tcg_rd, tcg_tmp, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        tcg_gen_shri_i64(tcg_tmp, tcg_rn, 32);
-        tcg_gen_bswap32_i64(tcg_tmp, tcg_tmp, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-        tcg_gen_concat32_i64(tcg_rd, tcg_rd, tcg_tmp);
-
-        tcg_temp_free_i64(tcg_tmp);
+        tcg_gen_bswap64_i64(tcg_rd, tcg_rn);
+        tcg_gen_rotri_i64(tcg_rd, tcg_rd, 32);
     } else {
-        tcg_gen_ext32u_i64(tcg_rd, cpu_reg(s, rn));
-        tcg_gen_bswap32_i64(tcg_rd, tcg_rd, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
+        tcg_gen_bswap32_i64(tcg_rd, tcg_rn, TCG_BSWAP_OZ);
     }
 }
 
-- 
2.25.1


