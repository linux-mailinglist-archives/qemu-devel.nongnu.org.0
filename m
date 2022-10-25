Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B660D1F3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:51:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyQ-0005fK-Dr; Tue, 25 Oct 2022 12:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyK-0005PU-UZ
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:12 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyF-0001bE-Th
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:12 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o4so13849110wrq.6
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cE9BuRySLzXUtT827AuGuFYq2Ao/Gkg9V7+gcu2PIBE=;
 b=dWyrlrl/b/psAAXUYQI5AzS6eJ84bIa8ff7e8tPjkNnElmXN2yvgGP/fgZgrfBZCtt
 GwKSewg2zjVOPIbn2raJd2ZQM2fg2xdlzhtg3gsdc/G8BGyQbOfcltAyd4mgNidNfpv3
 ctLuksSdzZtl/8qVePCl+ROQTzZUgNJOgMvCJycTu4CTQUKgKOyIs91nPw4mMKSrA8wE
 cjGYncMsyn5mYnKzWRuhWrvrDgMvPWDzBUoySZwXcYj9+TefAiny1NWjVCz7nEcyi3st
 oF19dIDRERRTgVd5GykAsRZtDk/l3EMGb0cqUwMaxWOa7G1IzMWJoVrzCKr2axOqCExO
 CJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cE9BuRySLzXUtT827AuGuFYq2Ao/Gkg9V7+gcu2PIBE=;
 b=BhNQC0us44Gs9mckjBzGQ9TnotpKi84tRM1hz3u4S45e6BCwGqFga4ExAoJLj5iPHs
 DO3anblYNONeFeGwo9VoIu3dkR08o5sakMT7qOEqL2z2gt1Plju7kpQUwaG9fFMq6lOi
 mrTe5/riRPU021QmoCRnT+JD3/JnScHljmteQWZBkc8M8C2M88WkDnZDhMM/jhLtRiu6
 VlTH/P7sf0AvhOXONL0PcvL2OLrk09wagZaJM6dkjnspd44gm+YsLSNt8PDs5KouqBej
 +X5hhH1/h0lRmgNb0j+frhxF9FFBTotgDVBqrs4t9S9nIIc3/9Enx3b6YwU/G1RRCby/
 zk1w==
X-Gm-Message-State: ACrzQf1YDimYuxqsRnInRQ4bSpkRiziHbsyKYG6y3Joni+X4gSJqHdxs
 4ZmutO4G/C1FoD67oDyIZe7dJqbv1DjjIA==
X-Google-Smtp-Source: AMsMyM5uFH0l0xlpJZ0kEg1quS6ccIymaIScZHsTdgA3hxpT/hyq0V5wrutosL/uZgQuGy9RSBfFQw==
X-Received: by 2002:a05:6000:2c4:b0:231:1b8:154 with SMTP id
 o4-20020a05600002c400b0023101b80154mr27959694wry.378.1666716006495; 
 Tue, 25 Oct 2022 09:40:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] target/arm: Extract HA and HD in aa64_va_parameters
Date: Tue, 25 Oct 2022 17:39:32 +0100
Message-Id: <20221025163952.4131046-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20221024051851.3074715-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index abfb32d77c2..32ed37a05b6 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1065,6 +1065,8 @@ typedef struct ARMVAParameters {
     bool hpd        : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
     ARMGranuleSize gran : 2;
 } ARMVAParameters;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 47afaec6b44..b070a20f1ad 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10470,7 +10470,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, tsz_oob, ds;
+    bool epd, hpd, tsz_oob, ds, ha, hd;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -10489,6 +10489,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         epd = false;
         sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
     } else {
         bool e0pd;
@@ -10514,6 +10516,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             e0pd = extract64(tcr, 56, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
 
         if (e0pd && cpu_isar_feature(aa64_e0pd, cpu) &&
@@ -10586,6 +10590,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha && hd,
         .gran = gran,
     };
 }
-- 
2.25.1


