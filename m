Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF440DE22
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:34:16 +0200 (CEST)
Received: from localhost ([::1]:39254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtOx-0004kw-93
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLR-0001HI-50
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:37 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLO-0002Pn-2q
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:36 -0400
Received: by mail-pg1-x531.google.com with SMTP id k24so6474200pgh.8
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+2Hxp80Fi+o3vSY5VLA0rrEE2x+zxZah+yk4DEWnBqQ=;
 b=n/bBt6FqUP/oIaWoyfHhqzVjfad66TEbRLTvpe+XZkQLJTJ7j5SzOzmEnu8ALBzD5V
 Bys7O3m04CaI4NWXab0TNlJepZsPngHhFjlx9kFp3qQlQoFwGEjrfVyp58IAQhBvBGUh
 kS/IdG1PkKU5WtI9rw6lPYg5XW1QQ1Z4hRxEkr7S9Oqh0JABKhT0o/3ah71sI0ybgfhk
 fAqA9pw5mk5rbpo/bJSH2adNA9vhA5mkboJoh2qCplU6E7Yq+uGM6vtslDIpNOdacdcC
 lj2WMIpn0/S9woDbB5gFg/rpCGPrRfV3CaMhIyBdCK1f/lAXGmU7MbREnA35HVDr3r71
 MqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+2Hxp80Fi+o3vSY5VLA0rrEE2x+zxZah+yk4DEWnBqQ=;
 b=0dMmh45NrPMZajNlTj0VtqvCd8J2ea1qShvVlCoqi9RJHuqNTCS9UO9DnlfsV8UP/q
 37dKkIUq1TbUq0PCStDD9LnlloDxTsV6GH0UrtiKyBZsaMAdpmcGXW86fEWNnHpO0lUa
 2zBRk5dlDv0sXw5l4EfOT0YUlE8DOld4iCBylpGgnmx8+/0qCOp8au3gH+sazdYM4JfI
 vCmQTnCyKIyuRF+iA+nz288nWvYLFYsn9zSVeyvb7Zvwd/vGRZ3N5tqc4hq1agzBy24M
 G1Ay9FPpAEGFxmBby/AGnB6kHO8ljpGVkiizUQ8tgAtvZoOYd6leW960h/UoKtYWyiVF
 TWFQ==
X-Gm-Message-State: AOAM5326OUVCTsOL34kLJmQNOuEsBiWwebggrl92m4MZhXWx4/ACZIoK
 syclJ73XZSw79eIt4NwdjnV1FMcRRpp94g==
X-Google-Smtp-Source: ABdhPJwAIa7UZPSCM52vgDOzhUFTtdLXDM3q9tuRuozVs2Puc49jhPwCdSOOiJqub3VuEo1T8wKm9A==
X-Received: by 2002:a62:4e0f:0:b0:3ee:668d:b841 with SMTP id
 c15-20020a624e0f000000b003ee668db841mr6122077pfb.48.1631806231697; 
 Thu, 16 Sep 2021 08:30:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/35] accel/tcg: Implement AccelOpsClass::has_work() as stub
Date: Thu, 16 Sep 2021 08:29:58 -0700
Message-Id: <20210916153025.1944763-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add TCG target-specific has_work() handler in TCGCPUOps,
and add tcg_cpu_has_work() as AccelOpsClass has_work()
implementation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-8-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h |  4 ++++
 accel/tcg/tcg-accel-ops.c     | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 55123cb4d2..4a4c4053e3 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -66,6 +66,10 @@ struct TCGCPUOps {
     void (*do_interrupt)(CPUState *cpu);
 #endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
 #ifdef CONFIG_SOFTMMU
+    /**
+     * @has_work: Callback for checking if there is work to do.
+     */
+    bool (*has_work)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
     /**
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 1a8e8390bd..ed4ebe735f 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -32,6 +32,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
+#include "hw/core/tcg-cpu-ops.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
@@ -73,6 +74,16 @@ int tcg_cpus_exec(CPUState *cpu)
     return ret;
 }
 
+static bool tcg_cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cc->tcg_ops->has_work) {
+        return false;
+    }
+    return cc->tcg_ops->has_work(cpu);
+}
+
 /* mask must never be zero, except for A20 change call */
 void tcg_handle_interrupt(CPUState *cpu, int mask)
 {
@@ -108,6 +119,7 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
     }
+    ops->has_work = tcg_cpu_has_work;
 }
 
 static void tcg_accel_ops_class_init(ObjectClass *oc, void *data)
-- 
2.25.1


