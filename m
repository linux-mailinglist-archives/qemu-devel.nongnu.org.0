Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B5C52512C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:22:09 +0200 (CEST)
Received: from localhost ([::1]:34464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAdk-0006Fq-IY
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWu-00032v-6L
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:05 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWr-0000Aw-IR
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:15:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id q23so7721094wra.1
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hMQaJT6/V9cigeOWwKRdKjLzKXge3k4QnBfzWy9pCoI=;
 b=AmGx09SD9+RUYdRyBxAaH9jkRWfzIKcfrtwj6VY/CipmXTYhirXAHAyLu1ZD8W/f10
 WcKV3C1lGud2wb6Bpdv80helNWHJCTUXuCNTxetQF5EUYo+p1C4WmkIcjgpD9YYz62JG
 xJdrAPAb4gPwsV4bspt9a+N1jcq3ErXok/pRtX+EUb61T7AkMEQ1sH3k0NeBbWXtcDp1
 WbLzzxpDeGmZdhHV7d2qqJpaTSBd1Ix3dERS8K9vFD9EAxVOqq1meRuXhkP1gc5kHpjZ
 WHbo/DkO0umuTJc6nhXBd7LnFvS6KLSfPf5KMxNN8p8+CafItC85cG124nDdxGIvqdUi
 oaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hMQaJT6/V9cigeOWwKRdKjLzKXge3k4QnBfzWy9pCoI=;
 b=eRKomGjJovce142/WPdZySKY2Jnc5rrrDPfSPrKCKouErKPk7ht/lgQjOeVA7HYx/W
 kFU9kYo9ptv4+1Fm1bA1+Oj4x9uk2JGgDLwSuivXMJh6kcdfC4wMsMYHO/7kd48M2ECv
 nW7VwXP02sHEsHObqFvm0pkxGUtsN2VKewJf18b65I/xp6Fq9JjS9fhCw4tDh0/Jcl+f
 4izHLiYWwIKJo2clcdWUL6zF/wNoax/PWv4Yq4L5aHopTDuNpimrcT2Vrp6Nhnn22GIP
 gn+tAiSKX2eF2HhfX9s+FD8UlP9PVeUYQ1J/BR7Xj0yKFNk/ekjmXK5tSaKdoh+JpWc0
 xMxA==
X-Gm-Message-State: AOAM533Wu0CimvT3qoebhoHclYIcaa6+BIDVm58fdfxzKvaWQDD6iAA1
 hy2dqotBBlJuCmSbLDKQSJ/bHQ==
X-Google-Smtp-Source: ABdhPJzD6xL6rMLtJul8M59FUvkz781d2iEjPkoUz5MLAPZ8HM3JZbGLiuVzXgcDYKrgsdzepuwKsg==
X-Received: by 2002:a05:6000:1acd:b0:20c:811c:9f39 with SMTP id
 i13-20020a0560001acd00b0020c811c9f39mr137942wry.482.1652368500004; 
 Thu, 12 May 2022 08:15:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm3048378wmb.42.2022.05.12.08.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:14:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/6] hw/intc/arm_gicv3_cpuif: Handle CPUs that don't
 specify GICv3 parameters
Date: Thu, 12 May 2022 16:14:52 +0100
Message-Id: <20220512151457.3899052-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512151457.3899052-1-peter.maydell@linaro.org>
References: <20220512151457.3899052-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

We allow a GICv3 to be connected to any CPU, but we don't do anything
to handle the case where the CPU type doesn't in hardware have a
GICv3 CPU interface and so the various GIC configuration fields
(gic_num_lrs, vprebits, vpribits) are not specified.

The current behaviour is that we will add the EL1 CPU interface
registers, but will not put in the EL2 CPU interface registers, even
if the CPU has EL2, which will leave the GIC in a broken state and
probably result in the guest crashing as it tries to set it up.  This
only affects the virt board when using the cortex-a15 or cortex-a7
CPU types (both 32-bit) with -machine gic-version=3 (or 'max')
and -machine virtualization=on.

Instead of failing to set up the EL2 registers, if the CPU doesn't
define the GIC configuration set it to a reasonable default, matching
the standard configuration for most Arm CPUs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The other approach would be to make the GIC fail realize if the
CPU type doesn't officially have a GICv3 interface, and make the
virt board check for mismatches and handle 'gic-version' accordingly,
but this seems like less effort. I don't think anybody's likely
using this corner case anyway: the only reason I ran into it is
that with my patches to add cpu->gic_prebits one of the tests
in 'make check' now runs into it because it unintentionally and
unnecessarily asks for gicv3 and cortex-a15.
---
 hw/intc/arm_gicv3_cpuif.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 9efba798f82..df2f8583564 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2755,6 +2755,15 @@ void gicv3_init_cpuif(GICv3State *s)
         ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
         GICv3CPUState *cs = &s->cpu[i];
 
+        /*
+         * If the CPU doesn't define a GICv3 configuration, probably because
+         * in real hardware it doesn't have one, then we use default values
+         * matching the one used by most Arm CPUs. This applies to:
+         *  cpu->gic_num_lrs
+         *  cpu->gic_vpribits
+         *  cpu->gic_vprebits
+         */
+
         /* Note that we can't just use the GICv3CPUState as an opaque pointer
          * in define_arm_cp_regs_with_opaque(), because when we're called back
          * it might be with code translated by CPU 0 but run by CPU 1, in
@@ -2763,13 +2772,12 @@ void gicv3_init_cpuif(GICv3State *s)
          * get back to the GICv3CPUState from the CPUARMState.
          */
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
-        if (arm_feature(&cpu->env, ARM_FEATURE_EL2)
-            && cpu->gic_num_lrs) {
+        if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
             int j;
 
-            cs->num_list_regs = cpu->gic_num_lrs;
-            cs->vpribits = cpu->gic_vpribits;
-            cs->vprebits = cpu->gic_vprebits;
+            cs->num_list_regs = cpu->gic_num_lrs ?: 4;
+            cs->vpribits = cpu->gic_vpribits ?: 5;
+            cs->vprebits = cpu->gic_vprebits ?: 5;
 
             /* Check against architectural constraints: getting these
              * wrong would be a bug in the CPU code defining these,
-- 
2.25.1


