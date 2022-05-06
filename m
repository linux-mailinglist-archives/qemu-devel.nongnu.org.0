Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5116851DEFC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 20:20:04 +0200 (CEST)
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn2Ya-0001N8-TJ
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 14:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IC-0005iw-MD
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:04 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IA-0003rr-Uy
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:04 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 y14-20020a9d460e000000b00605ee347da1so5411865ote.8
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UA0u5zIb+IjVjwjFedkOJVeM7leXzM2MF4hE+Hu/fBc=;
 b=thPVG18bZksA4Iu3Pgbgd4oHouv8p7dZRJnlJpS9tdBGdtQ14syu3W3EMV5cl8a3Oc
 3auMfcBvNYOrCZFNwR+4m8HS/QwNHKZNreLpaFsifDbhtgQtEUnSxiT2H9Q2nbd6VYe8
 8MzkAUANt5TjiOC+8/DfmWBH8pkQVcj6TACBOYz3VyfOwP1w8gVIlz3S4RKKi05s3CH7
 l7OHZNd36XSKV/1HBWpDlFEoEh3UabHjuEDX9bbwzuxSL0Nzw46ggBYZSa1gitmgG7u8
 QHQmTwnPoEWrxqaBTNSyPvgitpFSyqCgUALd9gaONVnUHhRmlNntQE0zi0LkeB/IDpeK
 8BmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UA0u5zIb+IjVjwjFedkOJVeM7leXzM2MF4hE+Hu/fBc=;
 b=NxbH1oOoEnF81UrApJHykOSbRWug4wAEpQYW0Ak+il3VsLv6Yqn9MNlh1vDWNdXsO1
 tfh5Cjg9fDfNDgVNCoa+yLw97f4msx46Pr5x6B1jSSfm6OwjeHv8bGOGc6bcIpMjYYNn
 O44WSbhHL72BdOgzLz0c3RVZ5z1qWjX92Fd5q8qSJY78aZsfz2EptWIXFnT2h1Dan8PV
 DO82j3dcsLGaVQrZGIkEfHmnrziqe9x/fT7dH3bWX0yLd4ieY5Gzj0/HhZf26OJgkwu9
 7WZe8uCakloK3YBh+WAV+Jh2btQZTrp6nEUx5t0m2ZHR3d17ja9GWSbjGouHWLDtFezU
 nPSw==
X-Gm-Message-State: AOAM532k7ln5/zCNNC2kV3+dDe0mtDisUBFklya4rBK8RxWz1uCiexH6
 QTpUEZkyiwVaw+/jXMmR+PBpoG0S9gfoBIU4
X-Google-Smtp-Source: ABdhPJy41zqaCfcvz+jGapLPJ5ffBJp7CVxKbFj/0DtH35TZjuIXgbgzvqUzkhU9N41j68lObMULYw==
X-Received: by 2002:a9d:74ca:0:b0:606:2168:8b63 with SMTP id
 a10-20020a9d74ca000000b0060621688b63mr1463784otl.249.1651860182218; 
 Fri, 06 May 2022 11:03:02 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 10/24] target/arm: Use field names for manipulating EL2 and
 EL3 modes
Date: Fri,  6 May 2022 13:02:28 -0500
Message-Id: <20220506180242.216785-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
index 01176b2569..7995ff2712 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1801,11 +1801,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
@@ -1836,12 +1838,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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


