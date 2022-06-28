Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DB255BE52
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:01:45 +0200 (CEST)
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63M8-0003M5-Ne
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62nl-0000R7-Sh
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:14 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:34500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62nk-0004Nu-CV
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:26:13 -0400
Received: by mail-pl1-x62f.google.com with SMTP id jh14so9999970plb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SXozRQJRDsddSiDU4WvdirQqE4A6/ObOnm30QCWvExc=;
 b=lw3ZBC5IAkdqx1p1s2KVFqXCc6vW6k1VFV64JFiVW4zFkG5KdVnVQK1JGC8aSYfHXx
 3woHK+egJwJ2qOXjvFDPXy3InKWNCqPiMA1v3P1YjJucKsBEgFwOaaaiVhREgD+jZh+P
 OKlzLPpHI2sCukSVETWVXw3ATh0uKiOgYEHCZ4UEqwqGm5sJbGW275g0ZHs83SWTRT8H
 /XrkD5ghWLO6LK+9HYhR/lQF8x+2T2H6R8ufQNMS3E/o75Rd/tEf4MUiDneQzJ1kxJ9D
 3EINihabLq0WW4sesm1jjhANIOJaeoAaOKTl/KuM8B7NbSON+Rzn/QVya+bmGfd7Gdx8
 mQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SXozRQJRDsddSiDU4WvdirQqE4A6/ObOnm30QCWvExc=;
 b=JSy6/FfXZNDs9suRAqggqBfURyq6ngfRya1zJZcJXPoKtlLDH62a5bPLkNjYFFnFez
 vZlxUTYf7wbl9CGuY2/cBUBk6dg7JFpwcYA4l0+YWojwIe/0VefDKFun2veuUvpM09vN
 ZutJXi+YYJCcE0H1ulUMLAToUrEH2A20OG4/PHqcIq0At3rh7kdv3x3d/WbITStfI1Sm
 4C1/W2si26uNYUjVS2GCz7t1XuLoAF1IULUiG0VoIAtEaWV1qLivRVigf2c6e+o+m17T
 NAuDSn6brRXGtvKR3uMb7Q5EfwEJHQcgFUzSaV+Kbatzq2Cs8z9kDnTU5gTSgA7c2pXw
 Gplg==
X-Gm-Message-State: AJIora/8BSLX41tH9TI3jVj/+IEMpXluN1LCjjf7+MGjSi5iWefFMd3H
 h/eX+nrP29NiocNZr+PcJPS5TJpz66kSDA==
X-Google-Smtp-Source: AGRyM1sA/qHuZH5zlcCEgU5FfSAdrBl0BxVmnqbHpWvvgDFxmpLG08uSk3DXwV31VxLpiRwN/As20Q==
X-Received: by 2002:a17:90a:a40b:b0:1ec:a22d:5c3 with SMTP id
 y11-20020a17090aa40b00b001eca22d05c3mr25318448pjp.118.1656390371598; 
 Mon, 27 Jun 2022 21:26:11 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 k26-20020aa7821a000000b0052517150777sm8160565pfi.41.2022.06.27.21.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:26:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 44/45] target/arm: Enable SME for user-only
Date: Tue, 28 Jun 2022 09:51:16 +0530
Message-Id: <20220628042117.368549-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Enable SME, TPIDR2_EL0, and FA64 if supported by the cpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 20cb622083..87d836fb2f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -210,6 +210,17 @@ static void arm_cpu_reset(DeviceState *dev)
                                              CPACR_EL1, ZEN, 3);
             env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
+        /* and for SME instructions, with default vector length, and TPIDR2 */
+        if (cpu_isar_feature(aa64_sme, cpu)) {
+            env->cp15.sctlr_el[1] |= SCTLR_EnTP2;
+            env->cp15.cpacr_el1 = FIELD_DP64(env->cp15.cpacr_el1,
+                                             CPACR_EL1, SMEN, 3);
+            env->vfp.smcr_el[1] = cpu->sme_default_vq - 1;
+            if (cpu_isar_feature(aa64_sme_fa64, cpu)) {
+                env->vfp.smcr_el[1] = FIELD_DP64(env->vfp.smcr_el[1],
+                                                 SMCR, FA64, 1);
+            }
+        }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
          * Enable TBI0 but not TBI1.
-- 
2.34.1


