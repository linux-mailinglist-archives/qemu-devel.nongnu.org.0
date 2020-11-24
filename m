Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D42C2315
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 11:39:35 +0100 (CET)
Received: from localhost ([::1]:42292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khVjR-00065Q-PX
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 05:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khViA-00056U-HI
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 05:38:14 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khVi8-0006vL-SQ
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 05:38:14 -0500
Received: by mail-wr1-x442.google.com with SMTP id p8so21787935wrx.5
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 02:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pXPYz5S1V8THmQFQE2Dw6eRg7/CvEX28euLcNTUQWsY=;
 b=pL7N23NEkdwhw3kEsKSaKlFmUjbmmXp3JSA5WXobDeoCrNcZ3Ag+EZNclD+BkiQzjq
 mUQ9cd2mwpWrh4yEmzGVnOVOijoD9z6AK2nK5l/zqtZJLTRk4CXY19jfaqrIo9QoKfyo
 HvlR19Y6B5MmYZPxjz7aZqkPSyeYDMG/eDDIYZpy739loSeFNfweaX22pQ8r1/MPYqcL
 dbyx2dh7xmXAcqq3ooRyqC9vDvSDZNqSuA7NOAp3JwI0zwKbQorguZlOMl5FYcgyUb3L
 e4V76gM20j9cOZEHam/8Ygllj0Df3ap3a19QplErkH129jow0I9AY/oMkxd01G1jHCmC
 llNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pXPYz5S1V8THmQFQE2Dw6eRg7/CvEX28euLcNTUQWsY=;
 b=V7ve7/8gTAp9/2Cbk2KNg/k/zLMHS/7VnU+nWMGz5aeNIZR0xchz+rYQy0mZPhfJbo
 KGlisTdXfE2Kl3H73yD5HlbcVy3VdIntPWuP/BPjowHs0ZlMPJjlbweB0m0EsxKYBCa5
 SYalmQ5Jf77khXAm47fz/BcVSNWdY0hr1WRqiSH2rx8fxhy6ZQeoh4AtQzEvA+NbsIl8
 N9kvFGB+0MC36UY9LPvbqIn00k1EtrOv97MqAS5prdTFbJlA9E+4UC8lCB5lYxAK8x2p
 9kdJM0Te8aWMYonNg3q+++YVL80JGHetb52WfvEL73K/QHD3o/LEk4qWDk84WAhe3Gwe
 XMzg==
X-Gm-Message-State: AOAM5300XrTcr4/D+6y1vebKmtbDvFteVTfV3kMqtMK0nrHJL6pEMm/6
 l8Y3rx1NzrjZLirCjLC6BxNu08yhfYk=
X-Google-Smtp-Source: ABdhPJxYN2X/xqMk2elK0uJC1BuLGa4jPTqKs7T0VnRzYjo2EPanjHkHXfRk+WBilE/KlC/ylxfZQA==
X-Received: by 2002:adf:c648:: with SMTP id u8mr4440544wrg.215.1606214291006; 
 Tue, 24 Nov 2020 02:38:11 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id q5sm27274266wrf.41.2020.11.24.02.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 02:38:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips/translate: Simplify PCPYH using deposit/extract
Date: Tue, 24 Nov 2020 11:38:08 +0100
Message-Id: <20201124103808.499948-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mateja Marjanovic <mateja.marjanovic@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify (and optimize) the Parallel Copy Halfword
instruction using deposit() / extract() helpers.

Ref: C790-Specific Instruction Set, Appendix B-63.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index c64a1bc42e1..17a28557c2c 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25220,34 +25220,19 @@ static void gen_mmi_pcpyh(DisasContext *ctx)
         tcg_gen_movi_i64(cpu_mmr[rd], 0);
     } else {
         TCGv_i64 t0 = tcg_temp_new();
-        TCGv_i64 t1 = tcg_temp_new();
-        uint64_t mask = (1ULL << 16) - 1;
 
-        tcg_gen_andi_i64(t0, cpu_gpr[rt], mask);
-        tcg_gen_movi_i64(t1, 0);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
-        tcg_gen_shli_i64(t0, t0, 16);
-        tcg_gen_or_i64(t1, t0, t1);
+        tcg_gen_extract_i64(t0, cpu_gpr[a->rt], 0, 16);
+        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 0, 16);
+        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 16, 16);
+        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 32, 16);
+        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t0, 48, 16);
 
-        tcg_gen_mov_i64(cpu_gpr[rd], t1);
+        tcg_gen_extract_i64(t0, cpu_gpr_hi[a->rt], 0, 16);
+        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], t0, 0, 16);
+        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], t0, 16, 16);
+        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], t0, 32, 16);
+        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], t0, 48, 16);
 
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
         tcg_temp_free(t1);
     }
 }
-- 
2.26.2


