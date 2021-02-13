Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053E631A8C7
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 01:29:01 +0100 (CET)
Received: from localhost ([::1]:53026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAio0-0002KT-45
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 19:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAilp-00018n-T5
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:26:45 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAilo-0008Pb-Fd
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 19:26:45 -0500
Received: by mail-wr1-x430.google.com with SMTP id n6so1366979wrv.8
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 16:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2Bx/4DDKwq+AGPA3ntsbF3z2tZ4YW92IADITCxNa3c=;
 b=V+LJ/0iXTSEcp7mWw8iyHvIZqrogZeVdVseHH6z7aCwhSX3aELz8EeV+3ZJbCT5GiW
 j0J4BvHTMrNO2GvaEn0Q2VNl+CvAaOYIL4CcfFGeU8uWqQAOH3Uj6jcAFh39/mRl3CQk
 pC+cb1pZuyCb1+rJyHQyR3wAvNer07mtY0xMSD392pUoHmr1ekeHG3HG7lJYWyXA2MD8
 VSYU30FPcOp240I1/PMlbsY+6g/CKjpp/xFJnzvglLVBt4P3ijF1FxDlfqGzEJd6s4Cz
 kygJXHDoXB/Pt/X97CBlJAVFPiDrkr9DY4Z2w1nQR/fT7YmryK2oZsOUKINrZUpL2m9m
 xSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=t2Bx/4DDKwq+AGPA3ntsbF3z2tZ4YW92IADITCxNa3c=;
 b=IQL/bUXVR24le8wZTf8UwbOS6Q2v0eIIROHuuYAEaapILF8+VfvRh5PjSmLMlxXIC7
 LbNKtqlvE3MltRdF44Rj8X5J1qFj9ekJlpirFR84pp7ojKy5ZLdGQOzCXoWqsz/Syhc7
 9XZsLuVfdJRSVbO97XyoTBxlj8voQwfWixzLPg8Taqbt/88QCl9aOIToV9vfpmjwIGnp
 jwmtWt7PYHUbEhZpdGhD2T9/lkgK1/HLx+ymxTsXwjo2VQjwnuJrH7jKzCrT2NfHTrsF
 Q2IJM5vYfeebGrtKaU9vTRel2wPt5fvQurF9aNFJoJqXMPGaS3qX9SxIC8N7Hd30X3Ki
 HN9w==
X-Gm-Message-State: AOAM530fsiAlLVaaAzEgOUX5ZlaFnpXSL/NTo19c4rqyJcPlEs73g1mi
 2Tla5X+xhlv9FRdlYRknu2+fxxaRsz8=
X-Google-Smtp-Source: ABdhPJyXFdbmQH4auQKkMrNWwjBlYLDvbDGSw1lXywVZI3kUrVJb/OXi2AysEEtfvlDgt9Dk5j5/6A==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr6478445wri.105.1613176001596; 
 Fri, 12 Feb 2021 16:26:41 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j23sm13677472wmo.18.2021.02.12.16.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 16:26:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/mips/translate: Simplify PCPYH using deposit_i64()
Date: Sat, 13 Feb 2021 01:26:39 +0100
Message-Id: <20210213002639.77681-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify the PCPYH (Parallel Copy Halfword) instruction by using
multiple calls to deposit_i64() which can be optimized by some
TCG backends.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Send the Halfword version :)
---
 target/mips/translate.c | 36 ++++++------------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index a5cf1742a8b..ddae26009dd 100644
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
+                                cpu_gpr[rd], cpu_gpr[rd], 16 * i, 16);
+            tcg_gen_deposit_i64(cpu_mmr[rd],
+                                cpu_mmr[rd], cpu_mmr[rd], 16 * i, 16);
+        }
     }
 }
 
-- 
2.26.2


