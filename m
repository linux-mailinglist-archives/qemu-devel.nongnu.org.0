Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E322D3CC69D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 00:23:36 +0200 (CEST)
Received: from localhost ([::1]:44836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4sid-000793-Tc
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 18:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4se9-0006pR-UR
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:18:58 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4se7-0001yc-C0
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 18:18:57 -0400
Received: by mail-pg1-x530.google.com with SMTP id 62so14574424pgf.1
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 15:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ImN2rDIibPWqsxrjnxHa+huo1+KHTGHZlA26Q9cu+A8=;
 b=h2eO0gV3xligBMjC2kDqMUgnqnmQNHJKhVCc1X534ofr7XVIUMWQHIVRz12ZmGq3C6
 z04PWOvASSanJwKBOYLdTXTQWcPuypBDqR5KLGTf+zSLjHe6dldXcoK/k2eseQBSYq6A
 ErYG0wzH9kWmT/LQQOIuqGvlJ+aSGgIVbCdEPmdnfy9HwopHHJ6VKlFqgvuTDjsk2Ti0
 lCJbaRmPa8D/ofxazewakaL2NnmU35RbJhRDjNZNzuVOLz2fYBNQ/UddF1QviQh1zUHu
 JORDeUWIkxgwi9XVDM/Po+R/ZOcYwEMB9FCyk3zgPKRfYojM9uqeO46T5QRNdnu0IqY0
 r5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ImN2rDIibPWqsxrjnxHa+huo1+KHTGHZlA26Q9cu+A8=;
 b=h10dQTollbKN+OQ4UfucJipD5i22xFDBO5KLExFZGrdAnYlWKZEb/vOc7pHp9PGpOV
 wy1WNKrjNAsZarat/R/SpoFdkAhBbax9V5P67M//3shmC2rMwrOreOUFpX2mHcqznhVH
 dLOWnd1PcsaFZfVM/xILE+BdJa0kNPDDhagb8kU3bIzMkaOo//viv3ddrN2JRpystqde
 eu2VWTom7flozoobPMNeLKLv+4aNR3hGFNjmJgyWz08G2KRA1fg995cZlQ3SQfjfjtmd
 C7nWHoJGHoLqjCMOK+uzNhuRbkD7oSa9kyA4nbTvdIgUP7OnnLFe2ZRKok99YPQzlj1A
 +bjg==
X-Gm-Message-State: AOAM530RVCn4Bm9ayBit42KxGgHqe8WqK/5DkNNwi/bRBUt+qj3chW0Q
 OATvkZ7MGu7hiyvgIR63N8LTMRoNYgusqg==
X-Google-Smtp-Source: ABdhPJwJgZodgOEFWyHpi8yB+v8M2M1nUgUOtZQO6S2aGDh9ynpOodn5Ks74ikhZBb+JdTYsb0z6hg==
X-Received: by 2002:a05:6a00:14c4:b029:331:7474:cb4b with SMTP id
 w4-20020a056a0014c4b02903317474cb4bmr18023776pfu.30.1626560333464; 
 Sat, 17 Jul 2021 15:18:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id n14sm2405091pjv.34.2021.07.17.15.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 15:18:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/13] accel/tcg: Reduce CF_COUNT_MASK to match
 TCG_MAX_INSNS
Date: Sat, 17 Jul 2021 15:18:39 -0700
Message-Id: <20210717221851.2124573-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717221851.2124573-1-richard.henderson@linaro.org>
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The space reserved for CF_COUNT_MASK was overly large.
Reduce to free up cflags bits and eliminate an extra test.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 4 +++-
 accel/tcg/translate-all.c | 5 ++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 754f4130c9..dfe82ed19c 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -492,7 +492,9 @@ struct TranslationBlock {
     target_ulong cs_base; /* CS base for this block */
     uint32_t flags; /* flags defining in which context the code was generated */
     uint32_t cflags;    /* compile flags */
-#define CF_COUNT_MASK  0x00007fff
+
+/* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
+#define CF_COUNT_MASK  0x000001ff
 #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
 #define CF_MEMI_ONLY   0x00010000 /* Only instrument memory ops */
 #define CF_USE_ICOUNT  0x00020000
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4df26de858..5cc01d693b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1428,11 +1428,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     max_insns = cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
-    }
-    if (max_insns > TCG_MAX_INSNS) {
         max_insns = TCG_MAX_INSNS;
     }
+    QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);
+
     if (cpu->singlestep_enabled || singlestep) {
         max_insns = 1;
     }
-- 
2.25.1


