Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FFF6DC7BD
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 16:15:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plsHf-0001Cz-0Y; Mon, 10 Apr 2023 10:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plsHd-0001CZ-86
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:14:13 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plsHb-0000Ss-Q8
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 10:14:13 -0400
Received: by mail-wm1-x336.google.com with SMTP id q5so2851356wmo.4
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681136050; x=1683728050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wwcJMYioCETaUAbI9id00MHSwcNGqBVlBGyKFH1vsv4=;
 b=nC6fbiUv0lgpxZZqx269YJ1xlXnThxXv2LwcHSfHt+uAyWitZAlvWCGI3UFSeiZ3Gn
 pt5CGY93FwAcCYq7otv+toJXg7FkvH+Hs3Qx1ZvN0zxaJe9qelUkrCHDqZEKG9MEw0z6
 X2H++BGz5vghVntOfZoFc8gckPvqEdBRC5Q3nM6vbcgot0ZDzJqLdomWcmrqtB0N/o6H
 nGZjX8JMnauZHZO/Qx5ru59lVnkkb6s0Q3iuiPPLH0qXARwCzLxJ01I7k/u4oyh0cP31
 PiTV5cI+KV4FCtVVkh1D61fR872ZpgneEulDemJ2FqO5hHEGATICIlHTRzhIhM9ja5oy
 kDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681136050; x=1683728050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wwcJMYioCETaUAbI9id00MHSwcNGqBVlBGyKFH1vsv4=;
 b=G1VvvBySxJcZkS6uRg9nmfmCTT7Dj1ycHtV2ewykZQSJl20164Y1JbcHYyqaVVH2OI
 WPU/MqvO+9HYkSh27aSkcgFP5XifaSX7OFFGvR/vs9YSlC1x12UQuR1Pmcmhtnkw7bzI
 vtaX7/pWM8YVDGMBTgcXrj6lf4XfhV8ifySKjrw2wP4agN4amqaZUHmvAG87f6b65mOc
 k1RL9GkGBAASCfOZ0dm4R+CGlSqCbL2ZQakPk8pgdZoszA5KfFVwoG6ifsnJrq9+BFr1
 n4IRsnh7Da8WJ5i4/0EEh6D0pu2L8XC7WUKa8tpNnIh9J/0Db+VFbheHR2X9y+5uNrvh
 0VJQ==
X-Gm-Message-State: AAQBX9esGhQ6FjVjsUIAkhB1sY4An/VXuu4YYv7/L5JFuIfSSnQUexGU
 4OrD2t5jA+oT1SG/QYh9NGRIrXvAXXzxwRQJ9Jw=
X-Google-Smtp-Source: AKy350YDl/LTen+Ux81JgAFw4mVKsgaJIcXbJD7zN+ajxieMWCI4hsozcoo0Jj+GTECXJjj9cBJsVg==
X-Received: by 2002:a7b:cd87:0:b0:3ee:19b4:a2e6 with SMTP id
 y7-20020a7bcd87000000b003ee19b4a2e6mr7628805wmj.19.1681136050396; 
 Mon, 10 Apr 2023 07:14:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a7bc389000000b003ef64affec7sm13793060wmj.22.2023.04.10.07.14.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 07:14:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] target/arm: PTE bit GP only applies to stage1
Date: Mon, 10 Apr 2023 15:14:07 +0100
Message-Id: <20230410141408.3564269-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410141408.3564269-1-peter.maydell@linaro.org>
References: <20230410141408.3564269-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Only perform the extract of GP during the stage1 walk.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20230407185149.3253946-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ec3f51782aa..58a6de09bc9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1585,11 +1585,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.attrs.secure = false;
     }
 
-    /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
-    if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = extract64(attrs, 50, 1); /* GP */
-    }
-
     if (regime_is_stage2(mmu_idx)) {
         result->cacheattrs.is_s2_format = true;
         result->cacheattrs.attrs = extract32(attrs, 2, 4);
@@ -1600,6 +1595,11 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         assert(attrindx <= 7);
         result->cacheattrs.is_s2_format = false;
         result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
+
+        /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB. */
+        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
+            result->f.guarded = extract64(attrs, 50, 1); /* GP */
+        }
     }
 
     /*
-- 
2.34.1


