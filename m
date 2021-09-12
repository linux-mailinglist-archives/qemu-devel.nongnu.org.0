Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55DC407EFA
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:33:19 +0200 (CEST)
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTLy-00076W-Pk
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTH0-0005sm-SK
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGz-0004Z2-B7
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:10 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso5237644wme.4
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7Y84GjBIOXaobwPAnyM5v47r6rmRAo5JoQfnDKuPME=;
 b=Hcq3YF+xgLui5Pkp95g4yK1q3VK+LJzsZ5yQ33zO0qAEURBeruHeXbkiza2MH9b3+Y
 oy5iFfRMuo6a9gl8gMQUrS/BECNwvYIfejNgPleuOUH7CbGNcjtuhlp0S/bL1OYQDc4Y
 Js2A3GNAMx7qRpC2XLvJh3ncg//tB4eyRIJvVcxthMYsJg07rJUVYxPRmW1zFUWHqR8x
 Xa1pyYaALHXwykI9Xn48o4Jpkh5g8CJMDf9Sb5nb4HMgAyIPEocEH89J2Qn29nmBX5bE
 IMTgC+eVlyp7/ZNdo0p4JV0ayzyP+6o3aQX6vizcsaqDsRLPVidhurX5Y8aUv1WqsQwc
 RJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=a7Y84GjBIOXaobwPAnyM5v47r6rmRAo5JoQfnDKuPME=;
 b=LG/WODY7gs0TMh/AsJ9bLR9IufjkDxSUJUy//INxOnr1RuVoWDK+sr3DAieUyRNTI1
 0H5mVhxG+H6UlVl4E4B45vsNYCxCFIXEF/Jyn95aeCVy3yo9K9JO1hA1qPpBC/QPaZkn
 WbI5RfF3uUwDTGVRFhNwxVSxZR4BQ6DRcQp5m/G65YCepeI48Nlb5tACshO6L45CfvSP
 clz7mMFWG9rWzOTHgxvebWoLO2zlLpo3xmiCx89hOBtgZCABUUh+moNfoQCXsOHQ+tEB
 XAySm9uVERM95z51cF2S7Car0tojOatBWUmnm7RZkwNVEvn4y7icw39f6XW/tdXs9GbV
 D/Mg==
X-Gm-Message-State: AOAM530N67dGyrPjHv/dVysLmUPvH1e46+un3FnZg5C7O7sm13adpyv5
 Uol4izLlmK2ugX9WhJwinrSTnr6edgo=
X-Google-Smtp-Source: ABdhPJwemlKqBYaENbh0o+98v3BT0/SKOGAk8a9iN70go86uaMSlpV7ldgOztaipbBAEyVueFzFDAg==
X-Received: by 2002:a1c:a505:: with SMTP id o5mr7448404wme.32.1631467687839;
 Sun, 12 Sep 2021 10:28:07 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id e2sm5101013wra.40.2021.09.12.10.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/30] accel/tcg: Implement AccelOpsClass::has_work() as
 stub
Date: Sun, 12 Sep 2021 19:27:08 +0200
Message-Id: <20210912172731.789788-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add TCG target-specific has_work() handler in TCGCPUOps,
and add tcg_cpu_has_work() as AccelOpsClass has_work()
implementation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/tcg-cpu-ops.h |  4 ++++
 accel/tcg/tcg-accel-ops.c     | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 55123cb4d22..4a4c4053e3b 100644
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
index 1a8e8390bd6..ed4ebe735fe 100644
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
2.31.1


