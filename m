Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73893B40D4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:49:52 +0200 (CEST)
Received: from localhost ([::1]:37162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiT9-0008Vt-Vj
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi3w-0004Ab-1H
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:23:48 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi3r-0001cn-F8
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:23:44 -0400
Received: by mail-wr1-x436.google.com with SMTP id g7so5197326wri.7
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jnFRCnirhHN/LJxQWIK0doxtcYNiRzsabYEfVyfdjrg=;
 b=gg8TNXNipFAYxUUTBGWIz5pdroidBD+jZvTe+JfC9+S2FT4xS+AL6BkBUzl3axinL1
 Pmh9F6ZNQGkp8vl9NSOMhkRuuFkkiwDeY9g1ahmTAjHwjZVZXxlhjhFs252WJNaGmgja
 vM2SV6nmQNhsb+HMthcR18y9FBW401a11SZSmzIyeJAHNQpLU9EXMvKyxTJbCJ6bGs0g
 Y3zmutD5X5yQV1cVFn4jDmwRL4TUdoOoTeIU4dOmzEkkuRMcag18cZVnlj4Xd4Sbz0yd
 mpwWVDLmwL4oaDV8CwiXDvaYQwS1UWzel96P19vXrZ98EKLjFYSK6cDqXgIf0FuSrkxR
 L5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jnFRCnirhHN/LJxQWIK0doxtcYNiRzsabYEfVyfdjrg=;
 b=RxgAtbmJYdJiBvoSOa2Fnr/wkmdepFqfQfbmO27bKVWMxYnRPpgkkWrx8cdNrb9L5a
 Nj90A/YAXouM0K/8VCA6cSq88ltS6boFamQdL2bqxNC9ED9JCDktb0tsF5C+ddzdvWYJ
 W+VDI+tWMk1yMX/sVssI5D2AhKSGbIRCfDpuPW/Ud0ui0NgVeORIRk4oosxJw4OLrcKj
 THxg8X+gCf6Xo+MSB+kevd4DpmwR1OZwtt45SGuAnQDMULuruJzpUWcVL+sB+gmongF6
 fjldlA4m9pMxH+QGVg8MkZR/sMy9+FaNTGfNC06EVUtBpkZiRuHPjdNH3KBUF1QsOgO/
 ov5w==
X-Gm-Message-State: AOAM530um2oHwPBwrO/28tUpViCu1uwO/Uykrr9r9Lp8RdYS6GThztnc
 oDgkjiIK4EKZLsTMYCu3txrWFr0NpfRLfQ==
X-Google-Smtp-Source: ABdhPJxCdAOsUsc82M70D0SgcTyHgUv8sCWVi9huFtsT/AzdlssQqMqHbUjuWKHywoeECBSeNmbnGg==
X-Received: by 2002:a5d:6c68:: with SMTP id r8mr6271220wrz.263.1624613021556; 
 Fri, 25 Jun 2021 02:23:41 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v5sm10766541wml.26.2021.06.25.02.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:23:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] target/mips: Fix TCG temporary leaks in
 gen_pool32a5_nanomips_insn()
Date: Fri, 25 Jun 2021 11:23:16 +0200
Message-Id: <20210625092329.1529100-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a pair of TCG temporary leak when translating nanoMIPS SHILO opcode.

Fixes: 3285a3e4445 ("target/mips: Add emulation of DSP ASE for nanoMIPS")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210530094538.1275329-1-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 797eba44347..120484a6c06 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -20182,6 +20182,8 @@ static void gen_pool32a5_nanomips_insn(DisasContext *ctx, int opc,
             tcg_gen_movi_tl(tv0, rd >> 3);
             tcg_gen_movi_tl(tv1, imm);
             gen_helper_shilo(tv0, tv1, cpu_env);
+            tcg_temp_free(tv1);
+            tcg_temp_free(tv0);
         }
         break;
     case NM_MULEQ_S_W_PHL:
-- 
2.31.1


