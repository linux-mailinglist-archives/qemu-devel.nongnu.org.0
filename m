Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67627606B8C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:48:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleKt-0005I8-7x
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:48:23 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ole9o-0006zu-5z
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9Z-0006KA-I2
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:43 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9X-0000ya-UA
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:41 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso3243491pjn.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALv+diZzer09a5GMXMjosNYk9lCWFpNzZXXMnFTG3Zg=;
 b=pGm0TCySJCvXa2I87LP17uizdIRBbscuIK/ASFGTrfMzYhlXEmBit2H2iq47cL0PkH
 qjTYVmutOmPxd+quHE2e8cuOoh/hOWIrED60wwIfQ2y2yHJLKpA04tC0HUQJ+wdlc9vE
 Gafk03Qus3oJmPhNAyWngpWwPsziem0yo8Py0xO7x1bki8lo+nY18tH+1JAdSJMvdqyV
 9L4U3CFsAhRVXItkbePU1g5rKGdJodyTbcw7123tbKgzr6+rSvtaMSXzfQ1n4zBuaR8N
 J0883tcmatOKZgYMxFLPi2robmYY88FY7N9Hba6wTzXCdI3rNBj+9ElgA3HKBlGiXXQh
 yV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALv+diZzer09a5GMXMjosNYk9lCWFpNzZXXMnFTG3Zg=;
 b=nOxQW/0tgnU65LPCu7mhiF1ClGCq8EEGgQaeqih0GiZy0107AE+HnKk9BEXQzlHMU+
 G6UeADl7jCIw97Y9BNDq7XLzApS/gnOh+PQ1gB1NWv3r2Ul2VKOPo7OjOOj/7MMAzotS
 /J+w6UP5ObaTnH5L1kT8kwnTX/cHY5hfxjXAcUVMAq/vcc//r4OdCBqY0D7AcEOfKE13
 efsapZCblSusdfhv+7bAM2nwCt0X1k2UKd1UWF/bzO1V9b4a0bCVXziujwp4yVOj+LEa
 pXCb/vucDSmt0qHxdTY+egXypd/TJ5NfiR07SNYYYPjN7s8252p3/ZNDQuc6p3Vk8lyu
 Ohvg==
X-Gm-Message-State: ACrzQf1kMODNR7NmaG2j1enKmb2Sye/y4SsJKub3QeqiNm0aFOgRHHha
 wY5xuIK9f/86LZLlSqb5CnJv3moP3rPFc8Um
X-Google-Smtp-Source: AMsMyM6u0aA6lTAYt8vq/JpaILJUkYot+Aiq5n610qRDx7k7M60ic1L8DWmYUjZ0GQGxddfye5ruug==
X-Received: by 2002:a17:902:d486:b0:181:33f0:f60b with SMTP id
 c6-20020a170902d48600b0018133f0f60bmr16515733plg.174.1666305399160; 
 Thu, 20 Oct 2022 15:36:39 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 04/14] target/arm: Extract HA and HD in aa64_va_parameters
Date: Fri, 21 Oct 2022 08:35:38 +1000
Message-Id: <20221020223548.2310496-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2b6889073d..16d7989604 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1046,6 +1046,8 @@ typedef struct ARMVAParameters {
     bool hpd        : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
     ARMGranuleSize gran : 2;
 } ARMVAParameters;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cbfaabbc09..6c7a8beed6 100644
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
         /*
@@ -10510,6 +10512,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
     }
 
@@ -10577,6 +10581,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha && hd,
         .gran = gran,
     };
 }
-- 
2.34.1


