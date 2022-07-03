Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F256564665
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:22:21 +0200 (CEST)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vo4-0002ni-D6
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzb-0001XO-FU
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:15 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzZ-0006nt-RP
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:11 -0400
Received: by mail-pl1-x635.google.com with SMTP id o18so6047279plg.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vXjecf38qLWvkQbYd8UNuP/WXCTyajLWLbhxCGCynp8=;
 b=IYIgnSvacwaTHg4wwULPKxRTws3J4kTU5tJb+lCIqOoI7RV/TbQoYgc/OsBhlhNfJR
 9sSDc/8jEDxvsZYIEmRcaxmhibC2B2WL/rRNwxAjT3zGNGo9QSC4QNIvIThhars1o/2u
 0QZ1DAjsYLOvJDJt3P8kfVWqW3QHZBJrzsAid5u56s40SPIEAxQE4zgD2kxQ/sLNp51P
 fOzMI9f/1eiwnP6EukzwgjbYk/0r6DDQwo0rljafsMPGoQJ2PmywVYG4piEHzbV+WQS+
 NhYPf6u9otZ3I+czNgS/A787QA7a8PPqEMe3XLyIT1PPWJFFAwe2dYVnXeU7ewmJn9if
 aoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vXjecf38qLWvkQbYd8UNuP/WXCTyajLWLbhxCGCynp8=;
 b=po3C6ZJsZ0pR/oVPiDzTZsfqdOdn0T4wpWLpkg45WmWmGyiDYsmqRmuk/0vqdVu9Ee
 yRpU6iiKtge6atRcwincmRoBYnE0Xr1W8aTudl2nGutOYhBBJaNUmhcCdyy6pFE0Az4/
 sedtPSUuu5XC1IdV9bRIy8KQYDlygwwbKxk4jQKBF1qpilcLv1syc1cyoZFF6HpcrlGl
 vOHZxJ0NJ2ACIYLR2hUhEXeej/l1PKLtr0+W7TO1drW/dYkfF2Kqt2PofBVgLfS4KwWK
 9d2Vn+ca63aKG7kwvd2QP5Qr63T8v2dvo2qgshicGRY75Xfb9VQ5Pzjx9bg2K1P++fpQ
 mfWg==
X-Gm-Message-State: AJIora/IqHdDPnN5einRwi/KtsQ9fFOEFc469Cqkm6wtjDj5YpZq/CbX
 3OWqLadrr68gKqOszVpydLRzX5YrnCg8DTHA
X-Google-Smtp-Source: AGRyM1vz0jeG4t5dciVizEifTQ9dIE8TemWQN6J7CglPZ3YZzGh6awGF+rNSBKqs8hqSYeCoW/xIHw==
X-Received: by 2002:a17:902:6b0b:b0:16a:5c43:9aa6 with SMTP id
 o11-20020a1709026b0b00b0016a5c439aa6mr28885488plk.91.1656837008371; 
 Sun, 03 Jul 2022 01:30:08 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 53/62] target/arm: Extract HA and HD in aa64_va_parameters
Date: Sun,  3 Jul 2022 13:54:10 +0530
Message-Id: <20220703082419.770989-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1bbe4d950e..f2a421972e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1004,6 +1004,8 @@ typedef struct ARMVAParameters {
     bool using64k   : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 499577f24e..9aea6ad5f4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10626,7 +10626,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    bool epd, hpd, using16k, using64k, tsz_oob, ds;
+    bool epd, hpd, using16k, using64k, tsz_oob, ds, ha, hd;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMCPU *cpu = env_archcpu(env);
 
@@ -10644,6 +10644,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         epd = false;
         sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
     } else {
         /*
@@ -10668,6 +10670,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
     }
 
@@ -10739,6 +10743,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .using64k = using64k,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha & hd,
     };
 }
 
-- 
2.34.1


