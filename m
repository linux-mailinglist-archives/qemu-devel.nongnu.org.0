Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6826AED5F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:03:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbdz-0002I2-Cx; Tue, 07 Mar 2023 13:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdw-000211-IY
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:32 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdu-000168-W2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:32 -0500
Received: by mail-pj1-x1033.google.com with SMTP id l1so14053913pjt.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcuJr89Um9ZQm83hbx1WksiHpOi+HBEPUpFiijHAPBs=;
 b=L1IUq84itcHp91FvRu1SI8DPa3b5NLZEkkS03vl+O4GQ2T/H6bAgHailCdIWeYF989
 FnmA8UyL6Uxey1xV5ChMa8mr/UcEw1lsDYzYmUiX4fxHrqSDCv4aFFb2zuEuAE9LZ4oZ
 t/2tqhix5z6Ey02n0u3ewVs6gekl4QlKtu7pE5hf2MXsmgvAPXDArTqtPfWwF6Mj2oLH
 M5ruQM2K1sgHuB+hilYBT3Cm9igMFWSBNMKDReuQ2ZgGp5HQ8n5/DdQ92xapaetLm9oD
 E0mBgGwNvVJcvHOsYYg2DJwMOLERa3Dni0EotFBFfnTew3kr51SFDgXVN3lmqDD/8B6x
 6Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rcuJr89Um9ZQm83hbx1WksiHpOi+HBEPUpFiijHAPBs=;
 b=WSgfLCs9pMW9mnGvks+0gJpGhC3cH/SMZBAVGbIbb+S1a/o4JJ2AVOXOcgJPM7+0/N
 3MeYxG5GZOZ01KualNLPbhB3aD80eG1zTQtawkrsdzhTRAEPgvvkWdXtlPAJHa3z337w
 7NV8Ia+3U4hCPocPeoz2VigiQ2l8C/NW8RcLXyyGqORuTh8uwWqVGJjNLeSId8GLqC5r
 k1i3bJ7dZh4ratot4HtV/GJQsX0uDSD7STIHRG/UNUv2KjrCudsWP5sKKL+5ZS2kWjbp
 Tx94DpuGgup6gZ5kGHh4bF/WtRqxabDDqxk2kpt3VP4COM2KQ+J+o8koLUmSldMU92Z7
 z7XQ==
X-Gm-Message-State: AO0yUKWC1bXnaQTbaOf8TojDRPClvKhv66uis82XJo9nF+Q2pWL+4MjS
 1JlKVySRpGVihZzNrgxMzwz1KvKOx2c6Yf/3lc4=
X-Google-Smtp-Source: AK7set+/9XpG9o7DKlPrA8TfIJf7H2gltn12AipUKEVkT6nBlzP5wYeMKA+nBNmyPKOvcCLhbjjGFw==
X-Received: by 2002:a05:6a21:6da7:b0:cc:c69b:f7f1 with SMTP id
 wl39-20020a056a216da700b000ccc69bf7f1mr20500712pzb.15.1678212149665; 
 Tue, 07 Mar 2023 10:02:29 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 50/67] target/mips: Avoid tcg_const_tl in gen_r6_ld
Date: Tue,  7 Mar 2023 09:58:31 -0800
Message-Id: <20230307175848.2508955-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Allocate a separate temp for modification.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 5c5660da5a..bec0a26c83 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2964,8 +2964,8 @@ static void gen_HILO(DisasContext *ctx, uint32_t opc, int acc, int reg)
 static inline void gen_r6_ld(target_long addr, int reg, int memidx,
                              MemOp memop)
 {
-    TCGv t0 = tcg_const_tl(addr);
-    tcg_gen_qemu_ld_tl(t0, t0, memidx, memop);
+    TCGv t0 = tcg_temp_new();
+    tcg_gen_qemu_ld_tl(t0, tcg_constant_tl(addr), memidx, memop);
     gen_store_gpr(t0, reg);
 }
 
-- 
2.34.1


