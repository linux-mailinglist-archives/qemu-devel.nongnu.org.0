Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFF66AEE24
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:10:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbe7-0003Ld-56; Tue, 07 Mar 2023 13:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe4-00038R-7Y
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:40 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbe2-00018Q-I7
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:39 -0500
Received: by mail-pl1-x634.google.com with SMTP id i10so15007119plr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fzwtyfcwtH5chvyB0g074/RPrrrEvf/RZxDG43rklpU=;
 b=rW23Bg4Wb5fgzec8aSJHvI3yrFlrVjbnf59H6n+xl08Ae3nv/y5QKK3HIzhi6wDJOi
 EBxBL9vkvvRaFH2b8OukLRKoKgdyn8RrWy8aOYyR223W14GUJwGIFQWAgbcSwjhL7fcP
 BuOz2H/MuVFVR5naTv0qeZldm+9Nv08jC12E46Xt29S3B99ZaWAuD5nXzbglccoV6j7D
 I231TQ8Zd2ChDIKoh9nD/Px/MgvwNBPdDh4fLnGMTMS9/4icF36FawYcF7u1+ZUTyDZl
 /WOkqD34MC1ym+BLwhHty2VY2QIMHJUFhZ1vk/4xS4in/meHXtzg4lGu6ZdD6YEeMMBY
 DO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fzwtyfcwtH5chvyB0g074/RPrrrEvf/RZxDG43rklpU=;
 b=vy+BBIyt7948OJwskmLqqBYJaQRViUQSKS99BDg7Br9WZvhLhgfm/J1/MVhNOmfIsA
 eKXqegWMo7JA6xcuQrjZqGfkOex+pw0EovzRTjz7pQHQkbJeZu+t3N+feEdMP35nqnGI
 i5EaOEGAhQxfKMrl6HLTslUJA9+QUkMDams/6ABhyHq+dH4cK+iAg8BSKL6ooH6Ts2jH
 vrQWO4c7xr37KEUY8GjWC1G4mz43teFsOi8jYQOFQmai3YkXInKZw9fp9BwXtwrGGHcC
 MgYC71+RZLdBeT6eIFPpX9nZjBUqhkqbKmJz717ftNPUX+3BCOZF6C6HO0oUbm8jOxaQ
 hBuw==
X-Gm-Message-State: AO0yUKXu4mD35470aeNinFo0OyV0YM83ZkB0wKAoLZV7Fipet+YNIq/v
 g10fstvw2mJvPtXuJoTsXCGfwJKbo+TdVJ9gMns=
X-Google-Smtp-Source: AK7set8nUqoIdXioWfaC6usGwo/ZS8jv5bMZsKGVeAv0vg4De1Jmu8Ho3umgFDacWm1dW3JtLu47Kg==
X-Received: by 2002:a05:6a20:b712:b0:cc:a1dd:d0c1 with SMTP id
 fg18-20020a056a20b71200b000cca1ddd0c1mr15371549pzb.50.1678212157250; 
 Tue, 07 Mar 2023 10:02:37 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 59/67] target/sh4: Avoid tcg_const_i32 for TAS.B
Date: Tue,  7 Mar 2023 09:58:40 -0800
Message-Id: <20230307175848.2508955-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Since we're assigning to cpu_sr_t in the end,
use that as the intermediate temp as well.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/translate.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index ad6de41712..70a45c26e8 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1610,12 +1610,9 @@ static void _decode_opc(DisasContext * ctx)
 	tcg_gen_shri_i32(REG(B11_8), REG(B11_8), 16);
 	return;
     case 0x401b:		/* tas.b @Rn */
-        {
-            TCGv val = tcg_const_i32(0x80);
-            tcg_gen_atomic_fetch_or_i32(val, REG(B11_8), val,
-                                        ctx->memidx, MO_UB);
-            tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, val, 0);
-        }
+        tcg_gen_atomic_fetch_or_i32(cpu_sr_t, REG(B11_8),
+                                    tcg_constant_i32(0x80), ctx->memidx, MO_UB);
+        tcg_gen_setcondi_i32(TCG_COND_EQ, cpu_sr_t, cpu_sr_t, 0);
         return;
     case 0xf00d: /* fsts FPUL,FRn - FPSCR: Nothing */
 	CHECK_FPU_ENABLED
-- 
2.34.1


