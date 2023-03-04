Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEB26AABD4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 19:20:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYWTV-0006Pw-UF; Sat, 04 Mar 2023 13:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTP-0006Np-Rn
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:11 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYWTL-0003M7-Ox
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 13:19:10 -0500
Received: by mail-pl1-x62b.google.com with SMTP id n6so6083508plf.5
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 10:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677953945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CC08sc/7f1akAHHWB9NB+xcDcBZ96GXhinyNlTxvBEg=;
 b=trrSws4kroecdQGtfYs2jO1C+qQhpgliLm8pAG2SL1FFKW2VJT2obxkVqIz9YZ/GX/
 taqoQCK+zbwuQjAVEH0o3L16jTo2fLheGa6xDkyzRHSwBnM9usBzkDWPHVwSSKyciYm0
 LJm8QLKW93vne3DhLrV78yr8lTs634HAM7D/Uvl489Eg57QgKeyIdQmwdVQ0oRwKjpFW
 4xMRqrTajWYV1OQCKQSwjIEYxCg3s3OwEW4l0XHfigOWC1w2NRYxgTnxleTihxScTo7e
 F0RCxaWwnA327uOlIkIkq3f8+km3Oq4ah8CQAFoK2sIqUacdAoaIl86xgk/WD8y7jHey
 mKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677953945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CC08sc/7f1akAHHWB9NB+xcDcBZ96GXhinyNlTxvBEg=;
 b=l9coNV99qVjaU3ZE2iuyzvPRvLW0DmA6xvB7zqyj17oK7xNKC8vFO9t/3C2phUhfSe
 JMAK0Pm50cFM16G+cVZFfFK3S6VuTQezpkhO70TW+L57+cAyUdpj+8oJ0Md2XESraSOE
 w5i0FOb/V1nz6wavqxeOVI1uMDzPBv+Ir9AhQG+9dnktCzURJv7oBonNbvs/4fzh9UGb
 6DXqU7gyPomeE2HoJWPRNlCRlN9b4k7fZm0d0PnfMuK7S/ZOP1VSMDHgzW6f1F/ks3h8
 Dm/QP0ZVybDSNuBrPosWD8+yIEqOOS6gI0dnrK+cu5aSBiLATHI/WqtadXy5Ac1VYWET
 5bWg==
X-Gm-Message-State: AO0yUKWjYItz2NA59lqg3LTFgA5RkM862F+2TWLnQUW6IrR3zJhJ++mn
 jXHc6wz5z3udmGenJ+6ttMGxc3xwDutk521m9RBGhA==
X-Google-Smtp-Source: AK7set/SOZzG6uwTlXwmr6uX1OSXNdpa9sEZLq1bMvrXk2+ZOKfom5a55xK6r/0nKzJ0pU2hzeDLNQ==
X-Received: by 2002:a05:6a20:431a:b0:cb:77ef:b502 with SMTP id
 h26-20020a056a20431a00b000cb77efb502mr6704170pzk.5.1677953944773; 
 Sat, 04 Mar 2023 10:19:04 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:62b1:64d8:8207:f04e])
 by smtp.gmail.com with ESMTPSA id
 25-20020aa79259000000b005d866d184b5sm3529668pfp.46.2023.03.04.10.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 10:19:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PATCH v3 03/20] target/mips: Drop tcg_temp_free from
 mips16e_translate.c.inc
Date: Sat,  4 Mar 2023 10:18:43 -0800
Message-Id: <20230304181900.1097116-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304181900.1097116-1-richard.henderson@linaro.org>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
 target/mips/tcg/mips16e_translate.c.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 918b15d55c..602f5f0c02 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -280,9 +280,6 @@ static void gen_mips16_save(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, -framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 static void gen_mips16_restore(DisasContext *ctx,
@@ -386,9 +383,6 @@ static void gen_mips16_restore(DisasContext *ctx,
 
     tcg_gen_movi_tl(t2, framesize);
     gen_op_addr_add(ctx, cpu_gpr[29], cpu_gpr[29], t2);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-    tcg_temp_free(t2);
 }
 
 #if defined(TARGET_MIPS64)
-- 
2.34.1


