Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4FE5B88B6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 14:58:10 +0200 (CEST)
Received: from localhost ([::1]:45440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYRxx-0001Ne-Sp
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 08:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwW-0000FP-0p
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwL-0008Vj-M9
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id o5so7351064wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=lt+ttdGIQexwt79JDxPbiWwikZH53evL9J0LFT30Rjk=;
 b=anRq/B7OavS/ZZsMEBoCtwqQPhi+nJyPi2ZFsh6c151AWPCo8kvC7UfMi6Y+4IR3Pk
 dkCuf2JkqlsvOrfht7Zp0duRiGsQHUp/OX5IbT18TGmEg4rjfusJIEm2SJ+jOW6r769G
 npnT0EiLO4tso66yOQEMBle1iyTlp3U2LCjrJzq3veoFjjm/cboKGu2Cg6j373gXE3II
 OV7j0UoQmFAxkS9MejzkwA2JwZSz6ByLuzJeqizRgmdjYPhRHKdvsOuS44Irk4nh2gVn
 gUNt16uLvcKbEgRJ+2dOrxvfFSJGN2KEKpQINdoxGGUUj5f3TMHGDRwOt5AXiSgh40m9
 xaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lt+ttdGIQexwt79JDxPbiWwikZH53evL9J0LFT30Rjk=;
 b=TTpi1mMt7w7BFZRuACdxeLUpvcttwHuELzuqdbhd+4AIIR9Kv+vWz2GHqdoi2BAHCO
 0hbGeFmcEjQww6DzgpMFR1NJPgIxYK14tJ2tKOe0JPmzimn55/c2IcS3kwECIW/ZxHwM
 041NaQudDp2uU2B3Q9pLBLsVhnL+T/MOUCB4Pgj1xkNl5QIU9cgmZ5pvvvmWf6HQP3LN
 v40FBTK5ngNF/fGs8QjJdSwNTveOjhUIMruwsanGYax66emf9Q/HuleP2wIrv+qcaITg
 36u1zK96lR/aGqE8C4S4iE07AtTFZd57irARPg6QsBzylq8hlEiCBGpmsQHJvkP3iE/A
 LOiQ==
X-Gm-Message-State: ACgBeo2oeHi4PmT9whlOc6X5C6SlwqtPxWLN7bJPfbBVvkHOa0wssAgM
 UTvOZqeovnLPdjlSWNRSFxwJ1mtbUNGlJjO4
X-Google-Smtp-Source: AA6agR58gyzJSWRG5O67N5GH7G+TAfWg3Hsg+gpsOxElvSAemP+oPTPDCmIwAlRLLOtPI9NMt5wDUw==
X-Received: by 2002:a7b:c844:0:b0:3a9:70d2:bf23 with SMTP id
 c4-20020a7bc844000000b003a970d2bf23mr2775850wml.165.1663156344108; 
 Wed, 14 Sep 2022 04:52:24 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/20] target/arm: Implement ID_MMFR5
Date: Wed, 14 Sep 2022 12:52:02 +0100
Message-Id: <20220914115217.117532-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
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

In Armv8.6 a new AArch32 ID register ID_MMFR5 is defined.
Implement this; we want to be able to use it to report to
the guest that we implement FEAT_ETS.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220819110052.2942289-4-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 1 +
 target/arm/helper.c | 4 ++--
 target/arm/kvm64.c  | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5168e3d837..fcc5927587 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -975,6 +975,7 @@ struct ArchCPU {
         uint32_t id_mmfr2;
         uint32_t id_mmfr3;
         uint32_t id_mmfr4;
+        uint32_t id_mmfr5;
         uint32_t id_pfr0;
         uint32_t id_pfr1;
         uint32_t id_pfr2;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c171770b03..0737851925 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7586,11 +7586,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = 0 },
-            { .name = "RES_0_C0_C3_6", .state = ARM_CP_STATE_BOTH,
+            { .name = "ID_MMFR5", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_mmfr5 },
             { .name = "RES_0_C0_C3_7", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 84c4c85f40..2d737c443e 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -643,6 +643,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 3, 2));
         err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr2,
                               ARM64_SYS_REG(3, 0, 0, 3, 4));
+        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_mmfr5,
+                              ARM64_SYS_REG(3, 0, 0, 3, 6));
 
         /*
          * DBGDIDR is a bit complicated because the kernel doesn't
-- 
2.34.1


