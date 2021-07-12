Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C272B3C5F9F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:44:32 +0200 (CEST)
Received: from localhost ([::1]:44478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2y6h-0003sC-SA
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2c-0003zd-38
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:23 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2S-0000so-NW
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:12 -0400
Received: by mail-pl1-x635.google.com with SMTP id z2so6501045plg.8
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=se0upj8uwwed3TnJTE/iIfzC0n2efWNdGM2VdkwZygY=;
 b=JU75f5JD818jhOvM37jFGK3n5GcdI6qqJwqUizQupDNLpzIaPL7FAQzmMPaIfE26Ph
 A8/8Rao6288hIj0iz1JbyEk36zMOPthnnktlmrG+UMbO9oY/IZIfftIp5hNok3XPp/Dr
 uozt6VRY2kF5yAup7it5Q/fAie/MzEKLrgyNkEdPusuwxL0woLnNId9EpW0Ox4YJPrPu
 imENpzFhUDMysrqLnV+/0NBR46GiZj2s4EC/YwPAVAg0AJgF8viGpv0ETApl5kmcy3z8
 4o+FmwY9d7BRsOCe724qyxN6lbyP3X6D9g7xN1N8rv6zSzJxRQ0Vw7zwF74vfZBYR0Np
 4PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=se0upj8uwwed3TnJTE/iIfzC0n2efWNdGM2VdkwZygY=;
 b=UMz48aC2Fmd5pdBCU3E5DXtg2Zl5wyM6diGQMzD+QP6ID6Mpbe9mNIuZwNzXyMyO2r
 RluNjDUGEFU2bs9CBgqUP3PDWtKhxxvCPTlRKFwLbsKyBgz6kCHURBdsDQ5NaSagvZl+
 kAbZugjM6fY8/dzgCYljiRCdO4BQtKnr8uetPvWmBavvA9jy4DVtGjiQvpaaFbN6mAkg
 5n2LzvNy2N59oH4HIP5sWe3ibC9z8nv6V2NHygSbAmxhRBhNawwe6M/PWj57Z+duEp16
 ixEnMKlkuxNoKF5+LABl9Ky2emHq4QeylFDQI31sjsOO7DZhZnt1CKdCMJrWYL5ZoW8h
 mWLA==
X-Gm-Message-State: AOAM5335/GuPB/gQFWPr3SePfIIRIuRf3tKmyemdshGK9bhbrMomoMvB
 C6M2oH4UJyZRI9edaz0pWgV8Me6xnq4b2w==
X-Google-Smtp-Source: ABdhPJw9uBI189BcJX0kw0wB+CEY4c6QxtMS+BO8Oof2d23MZf5unRftecVFQTmuDg3SbHiJSKFVWw==
X-Received: by 2002:a17:90a:a107:: with SMTP id
 s7mr14641787pjp.1.1626104406231; 
 Mon, 12 Jul 2021 08:40:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b33sm18247635pgb.92.2021.07.12.08.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:40:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/10] accel/tcg: Move curr_cflags into cpu-exec.c
Date: Mon, 12 Jul 2021 08:39:56 -0700
Message-Id: <20210712154004.1410832-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712154004.1410832-1-richard.henderson@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will shortly have more than a simple member read here,
with stuff not necessarily exposed to exec/exec-all.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 5 +----
 accel/tcg/cpu-exec.c    | 5 +++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index dfe82ed19c..ae7603ca75 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -565,10 +565,7 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 }
 
 /* current cflags for hashing/comparison */
-static inline uint32_t curr_cflags(CPUState *cpu)
-{
-    return cpu->tcg_cflags;
-}
+uint32_t curr_cflags(CPUState *cpu);
 
 /* TranslationBlock invalidate API */
 #if defined(CONFIG_USER_ONLY)
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e22bcb99f7..ef4214d893 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -145,6 +145,11 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
+uint32_t curr_cflags(CPUState *cpu)
+{
+    return cpu->tcg_cflags;
+}
+
 /* Might cause an exception, so have a longjmp destination ready */
 static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
                                           target_ulong cs_base,
-- 
2.25.1


