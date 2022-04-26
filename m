Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA50C510489
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:51:54 +0200 (CEST)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOPp-0001Z0-RT
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5h-0002yG-Hm
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:14 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5e-0003pC-Gd
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:05 -0400
Received: by mail-pg1-x530.google.com with SMTP id z21so8847229pgj.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NixTeigeFj7bJFeJ3Xbq08CCTyPtA/jgmvHCQlEdtdo=;
 b=r/5P5CWzZwYKWf3wMvr9iS47/MsgRE21A6uKmLg9SSOVIBMONJhB5eCTml9NrLMJ29
 1z2gVRqxjOxowXfIwYR0cUsc6dXTM6zD2EBxdj1UqAshtqeIEmEn1d8pT2OidcSiSNpL
 KhYljWMCa/XZoT25pAVQGbxt/2a2URiK/7vzJ/zJx7UYxoQR8SntAB/3aF7/frHq3WUP
 g1gvhMd2JE1TjMazgE5dAhxf2OKNdl+ppD4brh8jDkYJo8Cbz8tqGAtyJpYk/Bh5UAcd
 TUQ4lz5xnxxwUqM9FIigHFAX1hCDvmOKwcuSZt9RniCeqYIbHrHrroroEA7WWAbuM/bX
 JUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NixTeigeFj7bJFeJ3Xbq08CCTyPtA/jgmvHCQlEdtdo=;
 b=pSpPpilrFFfmH5ymQQRYemcpn7MldU+z560X0ibdTxNmnqNJL7QPcml44LehMWwBJZ
 1sFGllx6yfbjlVWfC6kv0IilIACblXgX0Zz80dBINaDMfkGFOoTJA+LmwEXGR1DPGlBK
 d0QuJg5A+u7eHPiMYZGkHe6HTyx80Fqx5R/RfPGFPwg90d43PdLIMfwFxSyZTRP02b5x
 uIahVuB+2In+8uSBWCw2gSmirb7bJH/yWjNZQEX/u8rntGwT5kK9Ppt+9S3R3yXSCvNm
 m9ohdVhsy7nJV0Lwz19Mp7C07IL8I98OzLYIdF+Bi09P8NMz4u1+CIaxiqBaht+3n2mq
 VKow==
X-Gm-Message-State: AOAM5305XXlPrEiDbv5GGi4xw5Cz5a7GugUi4nEhsN/3u5zDaAu5cXnD
 2tY7AQq4NGOIXHEC26F4bZhDHCKWvRN/9A==
X-Google-Smtp-Source: ABdhPJxr0gzbH3Bh6ZdL1n44HB/8YVPe7YqhuRuvGhbjyR3k74Xs18JdZOJC+ZC3oO2BOy0exZX0lw==
X-Received: by 2002:a63:9502:0:b0:386:3916:ca8e with SMTP id
 p2-20020a639502000000b003863916ca8emr19922253pgd.357.1650990660941; 
 Tue, 26 Apr 2022 09:31:00 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/47] target/arm: Use tcg_constant in handle_{rev16,crc32}
Date: Tue, 26 Apr 2022 09:30:11 -0700
Message-Id: <20220426163043.100432-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9b678cc5af..ff08306d2b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5372,7 +5372,7 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
     TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-    TCGv_i64 mask = tcg_const_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
+    TCGv_i64 mask = tcg_constant_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
 
     tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
     tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
@@ -5380,7 +5380,6 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
     tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
 
-    tcg_temp_free_i64(mask);
     tcg_temp_free_i64(tcg_tmp);
 }
 
@@ -5663,15 +5662,13 @@ static void handle_crc32(DisasContext *s,
     }
 
     tcg_acc = cpu_reg(s, rn);
-    tcg_bytes = tcg_const_i32(1 << sz);
+    tcg_bytes = tcg_constant_i32(1 << sz);
 
     if (crc32c) {
         gen_helper_crc32c_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
     } else {
         gen_helper_crc32_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
     }
-
-    tcg_temp_free_i32(tcg_bytes);
 }
 
 /* Data-processing (2 source)
-- 
2.34.1


