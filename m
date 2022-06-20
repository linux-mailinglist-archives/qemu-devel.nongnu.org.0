Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F66552499
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:32:09 +0200 (CEST)
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3N84-0002J3-GY
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdU-0002xX-A1
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:29 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdO-00024e-Bs
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:24 -0400
Received: by mail-pg1-x529.google.com with SMTP id d129so10880994pgc.9
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRUKfNIQaiiNP0vvAyDKnRSVA5VX9NVJiBVrOsiCdko=;
 b=gkt5/kSJZ0gFBHQ0oNSnpk2jSqZcFw/BdcwRL0CRZnkTyd8dHafTXchy+lcB++L2xK
 C7Map+Fg3L8X2a9Jg2Xkt9Hcpox4iRNHmGBf68JmtgpDgVph/VR/z60OzjnIBCgFbPi8
 om1gtsg398AMQcH38EtXXtU1ATQTNaf0A04r7HB78FDiUN2HJcsINph4J5X1UICas8Gf
 KlYXk2ZrTSkg0vo0tyYIURp7L/MCfpsCQppaVrmrGffrjeGGEG+AMHY61HDrafSts2ld
 HXHPTW33oemBQAX5HH76tpAJgrUGxKEYsq01/H70QGbkIhBwy6tQRst6c60vCHxytws5
 PA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRUKfNIQaiiNP0vvAyDKnRSVA5VX9NVJiBVrOsiCdko=;
 b=Qmmb9oy99MbS9BlDAUvDmTTEeX1e3D6AAKOvrhdCwjsT1IGKBR1xqMoI01OIS7p9bb
 EmopJfVW0rkB+lqJlSz4AYPnSPMFwEfGzMKZhpCqVPqybudk0h+0PZRr+sO6b1DI0RI6
 8eVqZqdV3SD6DRWBVFuvAb/dQj6vGKSEqm2UAQvV2XU+nI50MLus3jmtGccDWQkMxD14
 Gw7GAfaEVBmE/aNpihvguU8bCMt/JZnN7W7G5Kjb48q+QvKdbFjgI+55CDWZK+PqF0Gb
 cv1Ys15+0bjga00H0O2i6yb/s1Yhqoq44gay8VL01MfZVoSLdK37WGiPN94JO1byN3qN
 BXtQ==
X-Gm-Message-State: AJIora8/tN/dKK2qKa3NTS13cC41kY0griIzD/m6hj3WvVkr7Q85+Zu5
 7Odxjytg3BrVp1wxciI6rQQHQwyI3OCBdA==
X-Google-Smtp-Source: AGRyM1sJQTOPRA0aOc1KBakwEm8FZwGWvgViie2fnpqOnmp1Asdvqjxlo3n0dt4E2KKoXpVT3JL+uA==
X-Received: by 2002:a05:6a00:13a3:b0:51b:d440:b047 with SMTP id
 t35-20020a056a0013a300b0051bd440b047mr25675865pfg.54.1655747780399; 
 Mon, 20 Jun 2022 10:56:20 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 50/51] target/arm: Enable SME for user-only
Date: Mon, 20 Jun 2022 10:52:34 -0700
Message-Id: <20220620175235.60881-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
index 5cb9f9f02c..13b008547e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -209,6 +209,17 @@ static void arm_cpu_reset(DeviceState *dev)
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


