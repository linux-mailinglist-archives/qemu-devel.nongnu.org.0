Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CB26B2E5C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:16:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaD-00049n-Tm; Thu, 09 Mar 2023 15:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaB-00045U-CU
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:47 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMa9-0001Zw-RX
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:47 -0500
Received: by mail-pl1-x636.google.com with SMTP id p20so3183629plw.13
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fzwtyfcwtH5chvyB0g074/RPrrrEvf/RZxDG43rklpU=;
 b=kYkt/b5HJZ5D2Y9o17dgyV3h2Ol3nDRXnMxURhAJDkygGsbAQkgZ3PZb4iiceMibTb
 1+4T5itZnTixnyH877mdBuTp0zibl3HWwyn2T6RhRi0y6Lz6tnwA67Ofa3U8bXbWM1yb
 ltYbj333s79+TeydNuSBh6NKHjK/CBQtjV4k6x1TZ1CCMTRQDveEJ6DnSLrw4ciB3+1V
 VwX4r3Bh+58eK8JBV9ezVDJbomZMNfyiyMM6QWrYccxkyIF/TeEJ2aglK1jcQwxusjfN
 eLEp9NUUF8vv6yJv804VYis7sEctsO3qw1T3EzG/5uVkD0rl89/DFIHqSWmoKfH/c6vd
 Oeww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fzwtyfcwtH5chvyB0g074/RPrrrEvf/RZxDG43rklpU=;
 b=eW7ML/o4LnKMvPHYVpTqlLgZz2vsAbakR+vVR/tcQ7ck6wFebw4m1xm2XLWPji2jXS
 4oIPxI/OSgD+XYRGKSM7OkqQ7BelcOT7hFabB9P1k7F+WR4pYkUk4BG86jzIYTXyaVdC
 c3NU38rjA8mW1E/baiWRnFuxpecJCn579rEmRxke5ViVqpKrJP8J1gEPCEuc1Wp3rdTX
 yNDchzVWQDfT0mc562H/USE6Vgj47ft/ooKYNO2pHfBIUW251gA/UyOU7PKSyjs5P3lI
 0KaSTCYsg/otPTdMe4KrMwW5rdtbvO4+oBpFFgZAG9nwYzy5EH+ooIfi79YweNUyFb65
 71tg==
X-Gm-Message-State: AO0yUKW9WjMz5Du8P+sureLbZ8v9ijw0mSq8ga5klN+7YkBNKFUU09ks
 XylZme/VjchR+IdDxYr499sES+tf7DeXG0vrOuY=
X-Google-Smtp-Source: AK7set+T6apIifrWZL/d0VRW/mBBc8NGVe/bQuJDuWCkI3sDhvb2nG6Pz38kB46dsc7bP3VUUusBNg==
X-Received: by 2002:a17:902:e551:b0:19d:121a:6795 with SMTP id
 n17-20020a170902e55100b0019d121a6795mr27197939plf.55.1678392584620; 
 Thu, 09 Mar 2023 12:09:44 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 59/91] target/sh4: Avoid tcg_const_i32 for TAS.B
Date: Thu,  9 Mar 2023 12:05:18 -0800
Message-Id: <20230309200550.3878088-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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


