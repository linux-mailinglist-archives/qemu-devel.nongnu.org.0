Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8D94128A0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:04:30 +0200 (CEST)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSROn-0000Fv-Lb
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6W-0003Uf-M1
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:38 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR6N-0001zq-QK
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u15so33591964wru.6
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUgRmwD7tXnbjAggXKtnmXyY+RsIf+0q/OJybdA363I=;
 b=bP9nQ7BoyCGod1BhG3z8QZjF/kVFqwUEfoZ7mDAOk+OudBxaZ+fOGTHUuyl0in/mIw
 iRqpPiEhME4Q9diVh4WgxKmzEOClBH7PjsGUgzBHK4K0PLCJNbnJDn5Kt+eZwwzEj5+A
 FDZ8kZJer87URFV5zW7EPRCLnW4cexqt01vKe4rkpuaVF+aFFqCsaXuo2SgBxDmrFTo7
 xftvGEYol89+cCXKrls/rGJr7AOu4Wa8QIHU5iF8ZZjZJpbBjVom1oGfWvYrxRgJa1/k
 ycL+MFvwF7CB4JX/blwrL58wXkCF4oXDB41m/9CUY7lzzTop7KBKZeWASwea9L/6HV8/
 Oldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TUgRmwD7tXnbjAggXKtnmXyY+RsIf+0q/OJybdA363I=;
 b=Y5zPeL42IYQWHmGugoEtWr9zNp5iM2hZ8EmBGoZxK4eEobJnlPUVpCsK0yZt+Kxjll
 QDfrovDMzAm6pXWsBMIEZsy5Kr2HODWp2uVbsnu5BcBTPN62zZU8fS3QN7xGaKpwZlR2
 C1ijUNYem6Oen6Lq5rvVWEV4PjQpDeqB9U9IBJMPp/bvktw+Jmtw/7tNIO9fRwadg2ja
 6dNuXWs9C2PgPInn1XKZnp8YUFGpDUqdJ26AR07nEwxWf2hzhl5fcont2KbvAxTtcNHh
 sJc+p7IVoN9wdTFZ/P8ILP1Mu5bBk9dksoJeOTeOgQJBmM1c2clnKXw6yGUpKL74mOHC
 w+NQ==
X-Gm-Message-State: AOAM533Ghl6XPF9hz0ajMI8UUXKDFOx2026IqiLI5spfoAvhXyJ3U+7D
 GbUV1bW431ZrdP1vZr1AusoFN9qRdfs=
X-Google-Smtp-Source: ABdhPJxa7VtuXXanz24afeAyQiO8JqFLYZ4juV5+cGW0bQm8KYYDhaBDzpEwMTV0gtXtARqk3WEpow==
X-Received: by 2002:a1c:f302:: with SMTP id q2mr862462wmq.56.1632174325818;
 Mon, 20 Sep 2021 14:45:25 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 g143sm705924wme.16.2021.09.20.14.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:45:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/31] accel/tcg: Implement AccelOpsClass::has_work() as
 stub
Date: Mon, 20 Sep 2021 23:44:24 +0200
Message-Id: <20210920214447.2998623-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add TCG target-specific has_work() handler in TCGCPUOps,
and add tcg_cpu_has_work() as AccelOpsClass has_work()
implementation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/tcg-cpu-ops.h |  4 ++++
 accel/tcg/tcg-accel-ops.c     | 10 ++++++++++
 2 files changed, 14 insertions(+)

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
index 1a8e8390bd6..f539ba53806 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -32,6 +32,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
+#include "hw/core/tcg-cpu-ops.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
@@ -73,6 +74,14 @@ int tcg_cpus_exec(CPUState *cpu)
     return ret;
 }
 
+static bool tcg_cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    g_assert(cc->tcg_ops->has_work);
+    return cc->tcg_ops->has_work(cpu);
+}
+
 /* mask must never be zero, except for A20 change call */
 void tcg_handle_interrupt(CPUState *cpu, int mask)
 {
@@ -108,6 +117,7 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
         ops->handle_interrupt = tcg_handle_interrupt;
     }
+    ops->has_work = tcg_cpu_has_work;
 }
 
 static void tcg_accel_ops_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


