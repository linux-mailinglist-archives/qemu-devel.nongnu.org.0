Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A201738FD5B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 11:03:54 +0200 (CEST)
Received: from localhost ([::1]:47824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSyf-0006eZ-JI
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 05:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llSw5-00056I-BH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:01:13 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llSw3-0004E1-Fr
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:01:13 -0400
Received: by mail-wr1-x433.google.com with SMTP id z17so31313958wrq.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 02:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwQp4D79OpsnznTbTqhyijFdbT79aGK8mayrG8iYxJo=;
 b=dAlWTTLoId5vWlA1+CftPh+waC4D263Eo/LHaQm9+X71VYqp3NU9t6tESB5eyJiCoV
 zuKUq9oV6073N1Zn9zm5U1RXVFI9Bz8QWMh1LaQ2/PidsSI5q4SfdmyD1AIwzEkpiW7D
 0oAEjSnjlMWp7O523KKrPcp6jZx9Insev24/bWDaPnubPXoqRrP4XuC9AQF5sArTcYlN
 zo6/QOyjx4ndvIVTF1YDgWe2UzuTXWEv8rD+Azzpsp6QQb8P4h+wuxj7dopgeRmGOfS5
 kue5bBHCqnLQdc+QbxRrdpJM1iw0ItyaUCVnqHXigSHgi3ThF2shYAOHQ1srA2Xo7p4t
 zPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LwQp4D79OpsnznTbTqhyijFdbT79aGK8mayrG8iYxJo=;
 b=hOZ2SQDT4p91mMsoR1CPhDZXJ5mUJcdxKFKng51kONvBSx1U//8MN3oxjMQKea2RR4
 pYU4wzKZxU6WDZNVzV7YHTw4CKF2LJB+lZ52ujg3360x1M/2TjntvGiYDQ14MV0fKp5X
 1V2Co80jHjuvhfFhKJmp8rNEf+jKixf02HXTrK0Lxdu8fHrnN3pRQDR/Jl3YB4fVr6u1
 K5LHn1omhVcyeyAx0sWyIQi89NRAF5NriWScYZf4g6UgXSjWxCeWwSC/ExqTCo7qNQgf
 +xz+2q1Le4YypabUxVVu5ootDKEUkX+XthyM+cm04+D/EUeq66frdnjVOIdrG6g1ePPL
 YaIg==
X-Gm-Message-State: AOAM531uKM4wJJoX8DAAUr1zkbvsZjLz0qC4IoBsRFRgCxiAk5iS24rN
 Jns9u9M6KHjfHNxv0OErZBH8YQ==
X-Google-Smtp-Source: ABdhPJytZqrVgSyxCjYDUbjDXwuGxm/dpYRzfDWDb2rc2M1UBqbjEj3ZE0roB/GsvShwawdkNJn0vA==
X-Received: by 2002:adf:a2d1:: with SMTP id t17mr10372377wra.367.1621933269317; 
 Tue, 25 May 2021 02:01:09 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id o21sm10250665wmr.44.2021.05.25.02.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 02:01:08 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2] target/arm: make pointer authentication a switchable feature
Date: Tue, 25 May 2021 10:01:04 +0100
Message-Id: <20210525090104.1761645-1-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <c1bf2744-0448-51c4-551a-779f00af5a2e@linaro.org>
References: <c1bf2744-0448-51c4-551a-779f00af5a2e@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jamie@nuviainc.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 leif@nuviainc.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than having pointer authentication properties be specific to the
max CPU type, turn this into a generic feature that can be set for each
CPU model.  This means that for future CPU types the feature can be set
without having the ID_AA64ISAR1 bits clobbered in
arm_cpu_pauth_finalize.  This also makes it possible for real CPU models
to use the impdef algorithm for improved performance by setting
pauth-impdef=on on the command line.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---

Following Richard's suggestion to make impdef selectable for all CPUs 
where pointer auth is supported, I've moved this up to a full feature 
and then any future CPUs supporting pointer auth can just set 
ARM_FEATURE_PAUTH.

 target/arm/cpu.h   |  2 ++
 target/arm/cpu64.c | 13 +++++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 272fde83ca4e..f724744c4f2b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -969,6 +969,7 @@ struct ARMCPU {
      */
     bool prop_pauth;
     bool prop_pauth_impdef;
+    bool has_pauth;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
@@ -2115,6 +2116,7 @@ enum arm_features {
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
     ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
+    ARM_FEATURE_PAUTH, /* has pointer authentication support */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f42803ecaf1d..5a4386ce9218 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -760,10 +760,7 @@ static void aarch64_max_initfn(Object *obj)
         cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
         cpu->dcz_blocksize = 7; /*  512 bytes */
 #endif
-
-        /* Default to PAUTH on, with the architected algorithm. */
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
-        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+        set_feature(&cpu->env, ARM_FEATURE_PAUTH);
     }
 
     aarch64_add_sve_properties(obj);
@@ -835,8 +832,16 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 static void aarch64_cpu_instance_init(Object *obj)
 {
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);
+    ARMCPU *cpu = ARM_CPU(obj);
 
     acc->info->initfn(obj);
+
+    /* Default to PAUTH on, with the architected algorithm. */
+    if (arm_feature(&cpu->env, ARM_FEATURE_PAUTH)) {
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
+    }
+
     arm_cpu_post_init(obj);
 }
 
-- 
2.30.2


