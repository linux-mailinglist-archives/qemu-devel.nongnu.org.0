Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73D66AABDF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:22:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTW-0006Sm-S8; Sat, 04 Mar 2023 13:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTR-0006Oy-73
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:13 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTP-0003Mm-Eu
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:12 -0500
Received: by mail-pl1-x629.google.com with SMTP id i10so6056789plr.9
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BuI6QTMekuD+wzq4FTKchxi3GxTyvtiesMoc0e7akdM=;
 b=Ux7QDoXCnOI7xJiABiqv7tpW+QYkZYCWESYN9pikEX1gfBm/4jAOXsyqdnM9BlIbag
 XKbkNRfxSY77Xz4BNTbJIEG31hRvqj7jzb5+vRwoYm9thNC0vlVhE/1nUo06R2w+BDf/
 bOAFSBn7+yiKYBSSC/zrvQl8FHJzmk+ktr7TYYeoP7G7tRKekJ8gCoA+tpXlUyoNAyv+
 ec0PyePPZ46iVd+dyPv0qrM2YD0GwRhNHO/lgirOQpWkIWCw9LDeby3X57hXBxHWL1AT
 I2Vhf+aML8d1cqruE2GKKWyVMGiO0516OZDN5duFp2v6Iv3glQ7D5rcljKOVOIy4FdrM
 4H7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BuI6QTMekuD+wzq4FTKchxi3GxTyvtiesMoc0e7akdM=;
 b=w8zieZN/vjHs0E5v2aOo1ARqIxnV1wXTT4ch36xulKwPZ/whw9tENoKRWlkUiT+M23
 v2MzjNGT9R6UACyAbGGj3n8ZdzXw6wErWRH7OmI05CET+gnqywZFprRv50/0YkFDqto1
 HG6LemQjgko00YM2PE2mzZbUAB1AzbI6tqjuJXgb2V6FsfnBlujPQ9gfFLtHZVQKslmT
 wGcQORm3RTPAvHEnZQ0AjGcpZL1HWWTcMBiwZ4otpbp9gt1+JiSPgcOiEM+5pcVr/7jS
 UYYPRp+69wDlqDD5U1A1uHbAzo6ydapS8daFkm+6njWd4SsZ7L+0zEojrsv8MOQFq7qp
 /ixQ==
X-Gm-Message-State: AO0yUKXlGr5Svkg904DLrUgrFyzpFcxBkRiBH0JKxaYMnKS7D+2cV/vb
 kjUDiUoBENR/D8E4VFG+ARNIiIPf/bBGWPIpbBfKOw==
X-Google-Smtp-Source: AK7set9fHxluwyRQDEGkm4MW3Ww3/TQHME9y5FL5Ag/hqLaShVuI2UR9gRkmK3p9PvMwM0kRpd+dFw==
X-Received: by 2002:a05:6a20:429e:b0:cc:af12:44ea with SMTP id
 o30-20020a056a20429e00b000ccaf1244eamr6800922pzj.51.1677953949218; 
 Sat, 04 Mar 2023 10:19:09 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v3 08/20] target/mips: Drop tcg_temp_free from
 translate_addr_const.c
Date: Sat,  4 Mar 2023 10:18:48 -0800
Message-Id: <20230304181900.1097116-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
---
 target/mips/tcg/translate_addr_const.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/mips/tcg/translate_addr_const.c b/target/mips/tcg/translate_addr_const.c
index 96f483418e..a510da406c 100644
--- a/target/mips/tcg/translate_addr_const.c
+++ b/target/mips/tcg/translate_addr_const.c
@@ -30,10 +30,6 @@ bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
     tcg_gen_ext32s_tl(cpu_gpr[rd], cpu_gpr[rd]);
-
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
 
@@ -54,8 +50,5 @@ bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa)
     gen_load_gpr(t1, rt);
     tcg_gen_shli_tl(t0, t0, sa + 1);
     tcg_gen_add_tl(cpu_gpr[rd], t0, t1);
-    tcg_temp_free(t1);
-    tcg_temp_free(t0);
-
     return true;
 }
-- 
2.34.1


