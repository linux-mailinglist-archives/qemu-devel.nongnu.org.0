Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E923D0263
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 21:57:32 +0200 (CEST)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5vrv-0001h9-6p
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 15:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpH-00072I-AZ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:47 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpF-0007xA-MT
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:47 -0400
Received: by mail-pl1-x629.google.com with SMTP id h1so11953623plf.6
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bSI7+FYoYzIRMvsyeEg3j2XXfVWM2GYuNosumX6OIpk=;
 b=xH8KvVM4SBzXIQA64VMFTBGTkxp3niF5ZYMSbHc6OWQakMGCcvh75plVLvGyImSIWJ
 QRyWL6hDEfFKYg7kUuKGgXXJNjseDms19D4+LZHp8/GRrn7r/auNMddBxmAM3WyZWwb8
 L0qX+rq71k+DDM5DiphHrQFbHtGMv/X5bcUfK1KWSk/EQkxF/KsQw5MXnqn5iGJ6sOog
 YQAS2Lb1Gr+bUu5ndNInP21G3qyZaGIb8YrWRjiM0NONMK87bsYwAk0EzN43RCkFDwJu
 e113bZjZ6qKR7taU49aXIginKHylF6Y41fv/0RWnl3XnF9gBzGfK8/6+CUY+rroN9EK/
 d4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bSI7+FYoYzIRMvsyeEg3j2XXfVWM2GYuNosumX6OIpk=;
 b=A8oqBk6U4YoC36SC1Q5CA4kSB10w5canFh1U3edbqtBvjj95R2jikKoLLp5dYlZ1/x
 MlGxVQz4G3qA80S420xPj8BiCZqSWfxoClDD8ltAe8yBTFaaXnYvgPb8KDDvPsfxv3T3
 3JTRKNfxQpTiqZaPP9RYKXGCBWAeY2kesY9cKux8AymhAskgokx9qnRdjKIYuCr4m07R
 XMREr1hqLAVZ+EdU5k8amb5rETg1JlgoXR1526jCVFshSM0nUYnnk/2ZqotERU6s0FlP
 2KiFUOMsySiOXTQhppWhGE1sdNvzGxueMvFKQJXR9mcELKy1RCpFEZ9PdhU+F2aWYLxM
 yh5w==
X-Gm-Message-State: AOAM5306KBMqdZdMm50eGd+qa36/WL54nCBhPNDQn2Brqg3rwm1Lpm3w
 LnPcvmHqKgaNvSUerWTz/SJ0rJuHaF9XUw==
X-Google-Smtp-Source: ABdhPJwPEkpRcM8XVRuviuVeNXKLNQgl/Z4nq8sLXmXiRzzIRuYua91fKL6L2GA/QbngIun74VsNeQ==
X-Received: by 2002:a17:903:186:b029:12b:8d80:5d78 with SMTP id
 z6-20020a1709030186b029012b8d805d78mr8386833plg.17.1626810883985; 
 Tue, 20 Jul 2021 12:54:43 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 01/17] accel/tcg: Reduce CF_COUNT_MASK to match
 TCG_MAX_INSNS
Date: Tue, 20 Jul 2021 09:54:23 -1000
Message-Id: <20210720195439.626594-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210717221851.2124573-2-richard.henderson@linaro.org>
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


