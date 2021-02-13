Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72AB31A8BC
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 01:21:30 +0100 (CET)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAigf-0006yI-3P
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 19:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAieY-0006L3-7K
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:19:14 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAieQ-0005Pn-LB
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:19:11 -0500
Received: by mail-wr1-x42e.google.com with SMTP id u14so1395658wri.3
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 16:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UzlBWdLqrgbIiqWi3YuH/B2jLty0s5g+5TK5PDFgKHA=;
 b=OslLLRTuna/WYc49AwqERpIgVk2KbojvWqjqSOvJwipoECd8tA8nWrdB+5bLfcUASI
 Yb7bzQgoVth6K1EbNo0skpGWppCbq1+zzmj7Ouu+f3qQy1O4WezOgSQCdOfcDHccRvOj
 XyIH12HjWYpAf+4SkCknJvDbsddPke7wi+juQQNF0uDAkDFiX771kBdEeUqsH23GfRv9
 bOmj/wRx9OsdutzT8xc/qP69Kk+PTEkyU4CuRDyd1FmqqdBipbVIev0FcVXlIyaS2wrV
 8eVWvXTwGuAoQKz9bQwf7AQDTv+a6TFGMDpJfjPLng5KPlaIecbNbjVRIPiWPpgMB+1/
 f/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=UzlBWdLqrgbIiqWi3YuH/B2jLty0s5g+5TK5PDFgKHA=;
 b=YEW5MvLUm5/6jbXtkvTh/wbryMxlC2VyWJ8kNPmJSytixzUcM1u1QO3WKG5tlGAfTy
 6nxzD8ruzPbb6uUnENpGgA2/+O1kAGOaFhiVIJrguK0QEVI2F2x/OtLEGnYByNFaqxqx
 VrMJ+QWn6CGbNroOrpxdWTYEoC8vxa7fdZEWIyIY/BcljWuG8zo8UlY+ytUY1Xv+KRuO
 5/fat8jdUsmGn3cfCbpHOLZ5toMdqi4GWL73N0bnAJ5L6HLC1NIFecptKb0orrK4zfOg
 p6tmXa6wY5bPKFF0JcK6krgf3F1ay5hmiFpto07Kd4+/vVrrD21jL0ku7agt54o9EjsD
 sxJA==
X-Gm-Message-State: AOAM532crfOzggBbs4BqkGV9cZUamfUGantVenT2aMBtnhcxOcMitq69
 mKSPblwRtrnJ9NTlNKqnvsdo739DEu8=
X-Google-Smtp-Source: ABdhPJxLGmLH85m03MakIH1PQWfmmHGjtpgmua/g4cMKQV51H3twCWaINEmgEok0A1mNkLl0WdvGiw==
X-Received: by 2002:adf:f206:: with SMTP id p6mr4756089wro.337.1613175544128; 
 Fri, 12 Feb 2021 16:19:04 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g1sm15372401wmh.9.2021.02.12.16.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 16:19:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips/translate: Simplify PCPYH using deposit_i64()
Date: Sat, 13 Feb 2021 01:19:01 +0100
Message-Id: <20210213001901.75562-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify the PCPYH (Parallel Copy Halfword) instruction by using
multiple calls to deposit_i64() which can be optimized by some
TCG backends.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 36 ++++++------------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index a5cf1742a8b..5b31aa44f30 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24786,36 +24786,12 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
         tcg_gen_movi_i64(cpu_gpr[rd], 0);
         tcg_gen_movi_i64(cpu_mmr[rd], 0);
     } else {
-        TCGv_i64 t0 = tcg_temp_new();
-        TCGv_i64 t1 = tcg_temp_new();
-        uint64_t mask = (1ULL << 16) - 1;
-
-        tcg_gen_andi_i64(t0, cpu_gpr[rt], mask);
-        tcg_gen_movi_i64(t1, 0);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-
-        tcg_gen_mov_i64(cpu_gpr[rd], t1);
-
-        tcg_gen_andi_i64(t0, cpu_mmr[rt], mask);
-        tcg_gen_movi_i64(t1, 0);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-
-        tcg_gen_mov_i64(cpu_mmr[rd], t1);
-
-        tcg_temp_free(t0);
-        tcg_temp_free(t1);
+        for (int i = 0; i < 4; i++) {
+            tcg_gen_deposit_i64(cpu_gpr[rd],
+                                cpu_gpr[rd], cpu_gpr[rd], 8 * i, 8);
+            tcg_gen_deposit_i64(cpu_mmr[rd],
+                                cpu_mmr[rd], cpu_mmr[rd], 8 * i, 8);
+        }
     }
 }
 
-- 
2.26.2


