Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE7C65C5EE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:18:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrY-0008Th-Ew; Tue, 03 Jan 2023 13:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqw-0008Iw-V0
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:41 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqu-0005EO-M6
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:33 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id n205so8663272vkf.13
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JCltR3KinAgd2uF6C+01owj+mYF2uDzhF9nMarGDJGo=;
 b=X+zQqDX8Ddq0L+t7pqSYvm/voixbduZ09pXLbG4XglTYcHqYH+l12o/qSO6g3BvQ0M
 /z+nHnsNsXUDRFWu0jmfmI3jGeeobFTekNN7lb/083UHOTkNF9ffEq6z4wVVPL9Bts34
 xILEFR208pJs92Jjz1Ncd8ja6azjJBZDS8hd9BfbuNq0czdB9F2PycjobOZYX6EuBqpu
 uGa/p4/EI8KWU2UjawKsvKnUgRYx2Msg+zO7saYf3KOTulzBoRc4N0Fv+XFPmNHkO/S8
 Fcn2hpV9LwvgpmOKN2mRZPtxblliaSmkb3HsKxYradx5g9J2zaSZe7k6A2gbkA503hWJ
 fLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JCltR3KinAgd2uF6C+01owj+mYF2uDzhF9nMarGDJGo=;
 b=BX0pyBn671RBBXsURQX0zHY2nXC7sXAi0KYXS+ssxO9tGKLPN27gG7Qz7SYbRPuA6W
 iECWLJbWW0UKoL7DUTjtysbR0R3DqzuWXFJ4/4QLbLFX/yHbQCUfR/3E8OBBAGBfvfUk
 GZlFbEQjjeziqfKubuecL4mwBDvRpzth4+jg9RVyS1//f+4Y1yPtYVYfZFVcS4M1ER7q
 jFZwjtQHLJLQwxq/mpunQc9x9QyIhdAah4b0/Ldaa9AWlG4+IOJMmc+LgQ5UZMjgDdfj
 ceCT2I5bIUHSt3iSy0QS7iGFx6fpsTy20eSA++q8oVNLIqX0NvSLrMa2ZCCEI57oFqna
 kkHw==
X-Gm-Message-State: AFqh2kr0jXDY7I8dEYMX+LjZ5bC0fu5t+AUnyocvV51DcwwEJV4CLrdm
 9w5vc37LKhJHeBNSe5Wr0+90khQoZhiaZcRRoIw=
X-Google-Smtp-Source: AMrXdXsWBFc1Aweg6OJd1TXb6zz3+Gbld47xhGsnINX5LGQmfP8X2FrCrd10Rutx5Dx4j4dLXC7bIw==
X-Received: by 2002:a1f:3141:0:b0:3d1:b994:7c61 with SMTP id
 x62-20020a1f3141000000b003d1b9947c61mr18269237vkx.8.1672769851796; 
 Tue, 03 Jan 2023 10:17:31 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 14/40] target/arm: Rename arm_cpu_mp_affinity
Date: Tue,  3 Jan 2023 10:16:20 -0800
Message-Id: <20230103181646.55711-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rename to arm_build_mp_affinity.  This frees up the name for
other usage, and emphasizes that the cpu object is not involved.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h  | 2 +-
 hw/arm/npcm7xx.c  | 2 +-
 hw/arm/sbsa-ref.c | 2 +-
 hw/arm/virt.c     | 2 +-
 target/arm/cpu.c  | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2d9bddf197..dd72519fda 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1037,7 +1037,7 @@ struct ArchCPU {
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
 
-uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
+uint64_t arm_build_mp_affinity(int idx, uint8_t clustersz);
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_arm_cpu;
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index d85cc02765..41124b7444 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -462,7 +462,7 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     /* CPUs */
     for (i = 0; i < nc->num_cpus; i++) {
         object_property_set_int(OBJECT(&s->cpu[i]), "mp-affinity",
-                                arm_cpu_mp_affinity(i, NPCM7XX_MAX_NUM_CPUS),
+                                arm_build_mp_affinity(i, NPCM7XX_MAX_NUM_CPUS),
                                 &error_abort);
         object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
                                 NPCM7XX_GIC_CPU_IF_ADDR, &error_abort);
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4bb444684f..06fd4b6fb0 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -165,7 +165,7 @@ static bool cpu_type_valid(const char *cpu)
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
 {
     uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
-    return arm_cpu_mp_affinity(idx, clustersz);
+    return arm_build_mp_affinity(idx, clustersz);
 }
 
 /*
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ea2413a0ba..3642604dea 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1700,7 +1700,7 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
             clustersz = GICV3_TARGETLIST_BITS;
         }
     }
-    return arm_cpu_mp_affinity(idx, clustersz);
+    return arm_build_mp_affinity(idx, clustersz);
 }
 
 static inline bool *virt_get_high_memmap_enabled(VirtMachineState *vms,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8463c45d87..a104a77165 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1171,7 +1171,7 @@ static void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     }
 }
 
-uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
+uint64_t arm_build_mp_affinity(int idx, uint8_t clustersz)
 {
     uint32_t Aff1 = idx / clustersz;
     uint32_t Aff0 = idx % clustersz;
@@ -1927,8 +1927,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
      * so these bits always RAZ.
      */
     if (cpu->mp_affinity == ARM64_AFFINITY_INVALID) {
-        cpu->mp_affinity = arm_cpu_mp_affinity(cs->cpu_index,
-                                               ARM_DEFAULT_CPUS_PER_CLUSTER);
+        cpu->mp_affinity = arm_build_mp_affinity(cs->cpu_index,
+                                                 ARM_DEFAULT_CPUS_PER_CLUSTER);
     }
 
     if (cpu->reset_hivecs) {
-- 
2.34.1


