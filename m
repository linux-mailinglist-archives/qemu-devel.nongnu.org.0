Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C774DDA98
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:33:12 +0100 (CET)
Received: from localhost ([::1]:41298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCj9-0003s9-Lk
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:33:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZg-0006Za-Ga
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:24 -0400
Received: from [2a00:1450:4864:20::432] (port=45981
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZe-0002C7-OK
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:24 -0400
Received: by mail-wr1-x432.google.com with SMTP id p9so11694021wra.12
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=F5b5cXpmQL4zvEgjGCRXLiRUXPPFUSGLdiVG1e343YA=;
 b=YA9YH96zTuDGRoEDALss1MeBNSw2bV1HoB4wWl+yYsjfhZsrsyuzluWFyHq68vpK6J
 2MUzDqJFrPv/ZvnQwpuBg1DXBp31PJk5lMKoQiUemxDuL6qRyEzOZ3/sYiLPwSB6IzjB
 vBePX9y/b8aZZ+7sAKVAlPu3cTdBMFl3/012cbS5ioedtep7gEqTDxk2WYUfcMNZCsxL
 RkHtz7IfsiHerkW13cgRl8msVzCLodMBLmn2VJo1XEbEOv+oMhFTuKSMg8JGc4WyS7LX
 mxWrtbwjmg711v1O0c8UQKkKDGHNO0v/8/DFYjJwioqE363m+a6UZJuyG8qqXgAAFZvY
 kH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F5b5cXpmQL4zvEgjGCRXLiRUXPPFUSGLdiVG1e343YA=;
 b=7tXmKgEOvC+l9XNChyL7u8LKLUZ9CWluEwEVOSYcAsfGTgRiHxTI5TDPqDr++S45aS
 vgFRwZykE0ACdICDt4RYPjuomqGs0T6+jp6ozaogfuAB6yQ319l1pNKlf/MA6pPeKuyn
 ckc2wjypFGEAyv3eaunkvRJtaF0XqmAa2pmEgAWDxZzEEuRhbN4AaBHpBj0wmmiouuyv
 sCDWfhAzPOPPvW2IxhjLskYhPh88YBQtahCyoAP+4JgQq3VAuis7HutvdcAt4gHf2Azu
 nsrNMtVwM46WLsH1BccVgZ8Cnhu1NtgiquG4eVUgO2R14+Zp3McSBHFNb4DoLS8KVB9c
 5C4A==
X-Gm-Message-State: AOAM532T55/KH0XmBElSbKvbaMzJIe7xO3MgRo0Lf9QSiGbTkwnkjY/j
 49dk7+lMzRenFOhcrSINAmeEQBf0TNr1pQ==
X-Google-Smtp-Source: ABdhPJz0pzGqHMnQ63YJzeMFmDM9RDbV+W7Rvi9j7+XgzM3PULXODFqoRvLG1u+VKrCRqZmp4IXxeA==
X-Received: by 2002:a05:6000:10cf:b0:203:d8da:129c with SMTP id
 b15-20020a05600010cf00b00203d8da129cmr8084800wrx.300.1647609801296; 
 Fri, 18 Mar 2022 06:23:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/21] target/arm: Log M-profile vector table accesses
Date: Fri, 18 Mar 2022 13:22:56 +0000
Message-Id: <20220318132306.3254960-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Currently the CPU_LOG_INT logging misses some useful information
about loads from the vector table.  Add logging where we load vector
table entries.  This is particularly helpful for cases where the user
has accidentally not put a vector table in their image at all, which
can result in confusing guest crashes at startup.

Here's an example of the new logging for a case where
the vector table contains garbage:

Loaded reset SP 0x0 PC 0x0 from vector table
Loaded reset SP 0xd008f8df PC 0xf000bf00 from vector table
Taking exception 3 [Prefetch Abort] on CPU 0
...with CFSR.IACCVIOL
...BusFault with BFSR.STKERR
...taking pending nonsecure exception 3
...loading from element 3 of non-secure vector table at 0xc
...loaded new PC 0x20000558
----------------
IN:
0x20000558:  08000079  stmdaeq  r0, {r0, r3, r4, r5, r6}

(The double reset logging is the result of our long-standing
"CPUs all get reset twice" weirdness; it looks a bit ugly
but it'll go away if we ever fix that :-))

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20220315204306.2797684-2-peter.maydell@linaro.org
---
 target/arm/cpu.c      | 5 +++++
 target/arm/m_helper.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 185d4e774d5..498fb9f71b3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/qemu-print.h"
 #include "qemu/timer.h"
+#include "qemu/log.h"
 #include "qemu-common.h"
 #include "target/arm/idau.h"
 #include "qemu/module.h"
@@ -366,6 +367,10 @@ static void arm_cpu_reset(DeviceState *dev)
             initial_pc = ldl_phys(s->as, vecbase + 4);
         }
 
+        qemu_log_mask(CPU_LOG_INT,
+                      "Loaded reset SP 0x%x PC 0x%x from vector table\n",
+                      initial_msp, initial_pc);
+
         env->regs[13] = initial_msp & 0xFFFFFFFC;
         env->regs[15] = initial_pc & ~1;
         env->thumb = initial_pc & 1;
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 648a3b3fc16..3bd16c0c465 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -679,6 +679,10 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
     ARMMMUIdx mmu_idx;
     bool exc_secure;
 
+    qemu_log_mask(CPU_LOG_INT,
+                  "...loading from element %d of %s vector table at 0x%x\n",
+                  exc, targets_secure ? "secure" : "non-secure", addr);
+
     mmu_idx = arm_v7m_mmu_idx_for_secstate_and_priv(env, targets_secure, true);
 
     /*
@@ -719,6 +723,7 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
         goto load_fail;
     }
     *pvec = vector_entry;
+    qemu_log_mask(CPU_LOG_INT, "...loaded new PC 0x%x\n", *pvec);
     return true;
 
 load_fail:
-- 
2.25.1


