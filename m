Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4837C5B8843
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:30:16 +0200 (CEST)
Received: from localhost ([::1]:44454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRWx-0004ZA-BU
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwU-0000AR-MC
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:34 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwK-0008VX-Pc
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:34 -0400
Received: by mail-wr1-x431.google.com with SMTP id bj14so25257434wrb.12
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PkomJ9lGCe9l0kTq7cdHjcXwr1BTefxDkf2qRWjzl8Y=;
 b=yyJHL6vyFNuXQj2QA5EumAffnqPA/PpN4AsjgC14X1UCinTMuUa4wk5ECJBaOeWNE6
 u2nnTHqA2lKxUkS8fjTYlFo7gibeQqtYqWUG2EsxmcCqS7AwQJsLarQjHRTbmoRswVuF
 cZ+X9QmqcBC6SiJBhXUmwZy2bjTJZM2WKJXrgjgZ9b7pO9ZstIpxEm0UuXk99DEiAqSI
 NXokTUgzNZlK2mbf/H9Y6mW0nVRuLqTnsiLXAz2X07sX3UpK1ijpwitvNEaMnd5I1DsW
 msEgOZcj4N01PPeFoJtEi2oQBUMPb+1s+EKYyCtcVzc3XPTa97MXu+dlADFGE7CdT/lp
 druQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PkomJ9lGCe9l0kTq7cdHjcXwr1BTefxDkf2qRWjzl8Y=;
 b=sCoTD91sGVcNdJQcY6gProSFhZiuuFBC6kic1bHS5fk91O7l/UvwpB3GEESEnf1gw9
 tL+6S4QOCukbT9wQdkSU1VE70rrBtF3ov/V2avgMmQWIh3LmUlilhb3hwUj+n8k/xrva
 NcMnaiHrpLs7/IEBjtV671w9gsaN1Uiz/PhxDyTUlMgaeFFyeZgyac1rZVuOBDFY4SL+
 I7Bxx7TdJk5E7o5GRT9HcI75u2O8l06QsihqnFabdTYV3QiNFnC7x+S4vBHEiNhCmRKq
 13A/KoTT0cmIooGK74mNkjmUgwvGicknF60kF6HqK76GmJ/T2POQ88RgLB/IwwXnfrdx
 zC2Q==
X-Gm-Message-State: ACgBeo2m24qcZ8CE2j+V3SHZVik2+4GhPuw+CgL4W1T91Tituu1sy1Nj
 gf4K6Vo9ecpA4PpxoNtTIHCM1qdEv1EXUk7G
X-Google-Smtp-Source: AA6agR7bNE/rkQ/9nqTq735932cGW6tezlkPTbUAqbYpCiW1KOTrOfuCA4EKdcj87enVYgRYHLCkvw==
X-Received: by 2002:a5d:5273:0:b0:228:b382:8ea0 with SMTP id
 l19-20020a5d5273000000b00228b3828ea0mr20603640wrc.347.1663156343284; 
 Wed, 14 Sep 2022 04:52:23 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/20] target/arm: Sort KVM reads of AArch32 ID registers into
 encoding order
Date: Wed, 14 Sep 2022 12:52:01 +0100
Message-Id: <20220914115217.117532-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

The code that reads the AArch32 ID registers from KVM in
kvm_arm_get_host_cpu_features() does so almost but not quite in
encoding order.  Move the read of ID_PFR2 down so it's really in
encoding order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220819110052.2942289-3-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 9b9dd46d78..84c4c85f40 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -608,8 +608,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 1, 0));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr1,
                               ARM64_SYS_REG(3, 0, 0, 1, 1));
-        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
-                              ARM64_SYS_REG(3, 0, 0, 3, 4));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_dfr0,
                               ARM64_SYS_REG(3, 0, 0, 1, 2));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr0,
@@ -643,6 +641,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 3, 1));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.mvfr2,
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
+                              ARM64_SYS_REG(3, 0, 0, 3, 4));
 
         /*
          * DBGDIDR is a bit complicated because the kernel doesn't
-- 
2.34.1


