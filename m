Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18851626A
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 09:10:34 +0200 (CEST)
Received: from localhost ([::1]:54938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3iz-0007t8-TT
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 03:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U5-00071q-RB
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:08 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U0-0001Mr-DG
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:51:02 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1790841pjv.4
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qbh2KrYpsf5bd2gq07XULYnsZ3c1pnWPBFUbrKfWACk=;
 b=GfYoNQGYhO9BREdXE5ZBliAovdNBBuUSGrf4ggj/sjXsGD/DGXDM7FfNZYvMqRgzNw
 0M/N4JijmUhN1eDqvGC59bcoGCsw032ufa/QQMRrQthmK3lC4uduqYVA/tPoUAf5HAxt
 VmtC76oe0vCtVFW8NE/MV1ZXCNhhTfEEcoPKFw6T5cn5kiIvDbRyxSukQW/Pr5MwzO8K
 G62g/CTAd6e6QOWfi/Grw2IS8sgI4fthtBl89rhXz9Of4BM9AegXKV1mhk2My4DSKVKH
 c8JdxPHlMoD5dW4r2/ZUxAaI6ZeswVNHQi2EXK7idlHkUstWnxCxzqQmDspmMcNHYV35
 Uycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qbh2KrYpsf5bd2gq07XULYnsZ3c1pnWPBFUbrKfWACk=;
 b=yr0YjyHszKawNDBCCib1NNB4h2XDAhznqGEqtJvruX86rrPyBi5sBUGO8GhPFFn+eo
 dFHdjE+oDQSJSnHYoIYHKNwBNY07pL/r9zWhLQ6eh25OyHkc14V7PlbXyxlipixPniuW
 uwMCRZuFNmQPrcdz1z4WVXbGNCn7aUGXlHKdwho3pdbPloLdyM7mbYfrLQGIuK6jQwxp
 spWt+xJaXHO9wexCfY/4cyj7KY/J+jjLzxXC6wmyn8UfuIcw+Hh7W2J4pCnQUEcbYu/u
 Axx5uGfibb4edeBL6XNWfMnaM+VLoeU6XwET8bXZOMy2c42eFzT3Prqp/U+gLCslHaQS
 kheQ==
X-Gm-Message-State: AOAM533kuy80GHk6BmBpktFINZ6Em5C7Uvsd6WVKtMAocbnPVxjn+rkq
 lfoMNzIli62wS5SnujXZCJvFZoZz8Q1baQ==
X-Google-Smtp-Source: ABdhPJwxK3enN1hEjZ91/Ec4U3lMz+Cg73hbNMQErHLXPbpucK4Zo74Q0jXn/SPUaU685091wSY9JA==
X-Received: by 2002:a17:902:d48a:b0:15e:a142:a9e8 with SMTP id
 c10-20020a170902d48a00b0015ea142a9e8mr552466plg.129.1651384259104; 
 Sat, 30 Apr 2022 22:50:59 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/45] target/arm: Use field names for manipulating EL2 and
 EL3 modes
Date: Sat, 30 Apr 2022 22:50:12 -0700
Message-Id: <20220501055028.646596-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use FIELD_DP{32,64} to manipulate id_pfr1 and id_aa64pfr0
during arm_cpu_realizefn.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6e8b39dc9e..1b509bbd2a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1799,11 +1799,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
          */
         unset_feature(env, ARM_FEATURE_EL3);
 
-        /* Disable the security extension feature bits in the processor feature
-         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:12].
+        /*
+         * Disable the security extension feature bits in the processor
+         * feature registers as well.
          */
-        cpu->isar.id_pfr1 &= ~0xf0;
-        cpu->isar.id_aa64pfr0 &= ~0xf000;
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1, ID_PFR1, SECURITY, 0);
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL3, 0);
     }
 
     if (!cpu->has_el2) {
@@ -1834,12 +1836,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
-        /* Disable the hypervisor feature bits in the processor feature
-         * registers if we don't have EL2. These are id_pfr1[15:12] and
-         * id_aa64pfr0_el1[11:8].
+        /*
+         * Disable the hypervisor feature bits in the processor feature
+         * registers if we don't have EL2.
          */
-        cpu->isar.id_aa64pfr0 &= ~0xf00;
-        cpu->isar.id_pfr1 &= ~0xf000;
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, EL2, 0);
+        cpu->isar.id_pfr1 = FIELD_DP32(cpu->isar.id_pfr1,
+                                       ID_PFR1, VIRTUALIZATION, 0);
     }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1


