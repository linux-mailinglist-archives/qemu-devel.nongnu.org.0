Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D259E2C1739
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:07:08 +0100 (CET)
Received: from localhost ([::1]:49618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJ3D-00041T-Qo
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIhq-0000i0-Nb
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:05 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIhm-00018l-VO
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:45:01 -0500
Received: by mail-wr1-x444.google.com with SMTP id g14so4917328wrm.13
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Ols7j+AFzycY14iQfDkxh9tzIuV8kNY58VkxJzWR+8=;
 b=WaRwQ/iUWPtWfYtfrZeau21ir/yNWq8ZA4oK00JP69Y10QeVNfEptNjMIzv1fMsVqc
 HFNmyztBMhJrrpPgbcX4pASlUpI82V+mMgoFxMW+lQmVR1jmVDu1K8sKMLuyS8E5PrM7
 Y3qOraVKGNg/E1hFdcZH7BrgCs983sKOh+TJFfT3j5vTQXOHRHOMVbVNBbSHElD0yThT
 LMU2k/vrdNSHmXYU5Vp7AWu8PCFS3mbGOUw2I/bpfLFX1AcHIdKc9luZHnEh12Q/Wf4V
 gY8r60moT0t/Qe/5596FXzI0fqvosm5VZMff6KXOdYOrTnpfLGN02jFFcJGbzEOibvTC
 C2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5Ols7j+AFzycY14iQfDkxh9tzIuV8kNY58VkxJzWR+8=;
 b=LJc5Ohd3/8eTmZj9evdJCPO105ZtjHPMzfHKnsfUGAoFB+VWXjhx65oEGmVEJLH+CF
 VD7i9HHSuFUg1kR69oW2mjqFelV2VO+BZSxR7Q1hyfQnZszZvSfMXDf+Tu4SPCX3a4UH
 S9S1/tzq4PRLL9ntUa0/ZcCzd2m3B19JLpMovcNmqLc181XnNAK+AHNYdKEZe2Ai+18X
 OAPKxSO5b024rEX7afn4jQttnP3Hb3tlKT0gx28W78LOpcHdRS3vgr8fwuKbatSlWvK0
 HiDdNVq5+A7tC1ohLXnjhhnDtxUuBvL0H+Oj9O0cTt34VjrzANYAwCh4RqfiP4Issxpg
 xV7A==
X-Gm-Message-State: AOAM531N20G6f3eGnp4Y3hP5v9Wqs0d8rExefCrhFrF8BFMidT45J6q3
 iGmpeyHpIs6l64addIJBPn1gT1r9nfk=
X-Google-Smtp-Source: ABdhPJymTfom+lWr1ANpZ29uPNzo0Fw8RYP3TQkIKARy7MvpyOYQnxi1qHa5OeuRq9V8PBsFpzBl0Q==
X-Received: by 2002:adf:e3c9:: with SMTP id k9mr1516798wrm.275.1606164295510; 
 Mon, 23 Nov 2020 12:44:55 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id 90sm21450880wrl.60.2020.11.23.12.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 12:44:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/28] target/mips: Use FloatRoundMode enum for FCR31 modes
 conversion
Date: Mon, 23 Nov 2020 21:44:21 +0100
Message-Id: <20201123204448.3260804-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201123204448.3260804-1-f4bug@amsat.org>
References: <20201123204448.3260804-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the FloatRoundMode enum type introduced in commit 3dede407cc6
("softfloat: Name rounding mode enum") instead of 'unsigned int'.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h   | 3 ++-
 target/mips/fpu_helper.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index dd8a7809b64..bbd10e9d45f 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -225,7 +225,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 uint32_t float_class_s(uint32_t arg, float_status *fst);
 uint64_t float_class_d(uint64_t arg, float_status *fst);
 
-extern unsigned int ieee_rm[];
+extern const FloatRoundMode ieee_rm[4];
+
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
 static inline void restore_rounding_mode(CPUMIPSState *env)
diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 020b768e87b..501bd401a16 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -42,7 +42,7 @@
 #define FP_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
 
 /* convert MIPS rounding mode in FCR31 to IEEE library */
-unsigned int ieee_rm[] = {
+const FloatRoundMode ieee_rm[4] = {
     float_round_nearest_even,
     float_round_to_zero,
     float_round_up,
-- 
2.26.2


