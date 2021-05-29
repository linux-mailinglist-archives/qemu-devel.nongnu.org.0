Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA73394D46
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 18:56:14 +0200 (CEST)
Received: from localhost ([::1]:40364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln2Fx-0001Kx-2X
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 12:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ln2Ee-00005k-UW
 for qemu-devel@nongnu.org; Sat, 29 May 2021 12:54:53 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ln2Eb-0004kz-Ta
 for qemu-devel@nongnu.org; Sat, 29 May 2021 12:54:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id r10so6289514wrj.11
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 09:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H/j00hEbe6+E9TUrgGoJ4busYCQdPM+IW6semZPtYG4=;
 b=sn+YCOf2BhZB8M9EYzyu/HdkiwbgV6ZGIp9ABRQf+EfCOZsMEGEXRJhH0y+D7Hntfl
 S0mHaf/uOyCbQ1aAU5+eG48u6UWOVcyj0se9aExnrLXRE03Br80dbt6MZZ/0g0lgv98I
 /WCxIFoP++0JPRgfAKq+ZeTXJt06nIdeATXWr+GVoWYoRcmHCz3NxpxzjUtPv0I3sfFb
 V8TvskGMSsyqrADP0Dl2sWYmevuCXsWRi7npVevL1T2Nzhf4UpOmgO906055R2yAi1hS
 ms1/sAcV+IhjeJ4a57FLbTmh4x0HPyfnFfj4ho9IaLOiRL2B6WV44FuidhnTLLT+l0Q8
 tbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=H/j00hEbe6+E9TUrgGoJ4busYCQdPM+IW6semZPtYG4=;
 b=IJNPboTtW0nog6/4j+PgyuFoP2VZjuPsA5qGADzgvuLjTJja+a4BJvrdoHk+ZnXqBn
 MlYkHu8sWfhFyhX+Qlgv2THrE82Cpg8bN8wfC/cJmxv/4cG0swTNu0H4A8rPV9TSb/ya
 aDelgEFD4lQHFS0if84lmKnRoQvc7P9GCCXUZOdeKJ9jR8XMzuRM011+YHmOfRJzRZKQ
 VR9xwdnnuKyz/wLFW9QTNwbMFr2058TZ5fRk/wmBeI3E5NP1bgY0jJyjMUzI2QHbUZqC
 v7ZJTs5KTZZfHim53rBySIuuXl19g6rEc8ebVPNjxrDwCDWW2KaIO7dLWMbgrgpBfmPC
 ATzw==
X-Gm-Message-State: AOAM530juP3XqngFi5eP+q2fNbqvLFDE+3qvCO0JqAywzg9NvcS3rIer
 4ss5RuZnqsBd5zxsVsQK6yJEoMzaJVC1lQ==
X-Google-Smtp-Source: ABdhPJztxKmfKDOS6oU8LX+ghLTQOBdrkBDnKaGu19rQPqY/bx6L0iLzgH/tj6e8SZHDi0X+yXOqFw==
X-Received: by 2002:a5d:5745:: with SMTP id q5mr14447900wrw.56.1622307285906; 
 Sat, 29 May 2021 09:54:45 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id z5sm10956187wrn.69.2021.05.29.09.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 09:54:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Raise exception when DINSV opcode used with DSP
 disabled
Date: Sat, 29 May 2021 18:54:43 +0200
Message-Id: <20210529165443.1114402-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Jia Liu <proljc@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the "MIPS® DSP Module for MIPS64 Architecture" manual, rev. 3.02,
Table 5.3 "SPECIAL3 Encoding of Function Field for DSP Module":

  If the Module/ASE is not implemented, executing such an instruction
  must cause a Reserved Instruction Exception.

The DINSV instruction lists the following exceptions:
- Reserved Instruction
- DSP Disabled

If the MIPS core doesn't support the DSP module, or the DSP is
disabled, do not handle the '$rt = $0' case as a no-op but raise
the proper exception instead.

Cc: Jia Liu <proljc@gmail.com>
Fixes: 1cb6686cf92 ("target-mips: Add ASE DSP bit/manipulation instructions")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c03a8ae1fed..6ccba34c050 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -24373,10 +24373,11 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
         {
             TCGv t0, t1;
 
+            check_dsp(ctx);
+
             if (rt == 0) {
                 break;
             }
-            check_dsp(ctx);
 
             t0 = tcg_temp_new();
             t1 = tcg_temp_new();
-- 
2.26.3


