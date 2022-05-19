Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C397A52DB87
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:43:32 +0200 (CEST)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkBP-0001X4-MH
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk58-00064D-Ta
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk57-0000qv-3y
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:02 -0400
Received: by mail-wr1-x436.google.com with SMTP id s28so8079893wrb.7
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+lIxyYDzYt0zgG1WlaRF4O4Dv8mB78N3TjznoJBeFJI=;
 b=YF8EDBpNj3fzI9PP8a5AdJpkrGc01ZaEYToBPC0Ty0FO3kVSYjGF5RnEUKa49Ic7t3
 nJjDSCZWQvR6yx8y4Cm52AHbdmVSH7WckCinaNXG4wtMzkLqSzdr97IO3mI9nY8bRvB3
 CzJspkCGZiMPQJFwp20MhOhY0M377iIo73HiUSFn6Cb4/yCniFh0l6EBxwO5NsEwN3he
 eAdHkqBkHJw2plRhmDJJLioZasRzf/3YJ4RrBQs1W3zH3bd2E/0TSLAzLalqo+SdLjlX
 Dn8xXR8YBhAzD8E8SlFX9pDyGQIRse57m6e8DhUMQ0YhFnmF3VqGmStPu7igEYA+zCLK
 kLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+lIxyYDzYt0zgG1WlaRF4O4Dv8mB78N3TjznoJBeFJI=;
 b=J1ztW4KdO/q+uqOwBdDAul45xGv0csay7ZPJStE09f6FMq5KJ4K1A1PO86a4TTzgoR
 G0tOLfra6imN/tmfriKSQ6ZP3W2MQyA+1Ny7xngChA8zhWRnl6cJ7VW/vr/XBleXwOib
 h/e9O0a8Hrtq8hy8R5VpGbO4QQek5z1tZp+2pxXdyuF0UOkdVwU6v4BiEj+4WzQ1feAf
 yP7apA7dY8zdQrqtHDDK9rr8Z1rjZgwkGa816STXWZoM21MfMs3eYSeyguw9c+G0kMAL
 jKCp6L+C7Wl0uP6oaTTSMaN2jo6yJ7AcLme8KSnbgdqhyZDHPg42Kkh6AHfwDA3oKyN6
 Qnvw==
X-Gm-Message-State: AOAM5329Bru4xsYD7tbR53WpTSdAaXGlhtO5DA4aluscLvvH4ubT0Fxv
 U8pG0OpMCP2o5BWwz8wRJ+zvI0XScVv7zw==
X-Google-Smtp-Source: ABdhPJwolYO4S6zbqIaCmWf9xh0jKVDpSmQPTHC4lw9+742MNkD9ptTsctGhDszGAhR7Wrxt1uuCWQ==
X-Received: by 2002:adf:f6cd:0:b0:20e:673a:a3e6 with SMTP id
 y13-20020adff6cd000000b0020e673aa3e6mr4522041wrp.694.1652981819657; 
 Thu, 19 May 2022 10:36:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.36.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:36:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/22] hw/intc/arm_gicv3_cpuif: Handle CPUs that don't specify
 GICv3 parameters
Date: Thu, 19 May 2022 18:36:36 +0100
Message-Id: <20220519173651.399295-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220512151457.3899052-2-peter.maydell@linaro.org
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


