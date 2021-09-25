Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00810418327
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:16:29 +0200 (CEST)
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9Pf-0007xS-Vf
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92Y-0000kO-8v
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92W-0005t5-4w
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w29so36387467wra.8
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zpMC5xjCsBbH9RpT6gPVCF+edgca48PVAQbhvKWBiG4=;
 b=pro94nGaKjAJepwvuSNNOkQ5pBuLVB9iPlyaiginNHAUm6f+4oCWrtpNSa86Qs6DXL
 6xSZW5+MxFw0istcKTqb3+cG/0il7na3bU8fvLvRMW7kI4sGQpggaAsUE6QcXD7yP2Ar
 zS7L0raKHyIm8KBz6QzRI6rTwQQOHcqoFCF7RiTZg1qf8ZM5paDtp7O1W855Qd3+ubp7
 zwv2ricM1JWAtfN3X1CoSO5CR84/3QsIUdZCZfN6QbNE2VJ4HaBF7DAK5Q5Ez9o0yK7Z
 TMRVTv3XpB3dknzLvGCmxKlTL+k/tKvEKk6+ALA5N7BzSZZRDsgOIVuVfysr06XNe3v9
 Lgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zpMC5xjCsBbH9RpT6gPVCF+edgca48PVAQbhvKWBiG4=;
 b=v3mH5FoThy/Bq738Z58jAm4qJCRRVHdo4/+Yku/pC1/DgbMjh64k6wRrewnewRpnI9
 XJthHpaMCMsukDmRfuHL/FLk47eJEodJAoeDY56uRrY59+JffvO0edUFH3qIV5ribkwo
 RUH6hVQ5BMCodKeF4bnL2IoNfWqhiWMma4LsiAmQ2QbJ22qnfJn0151YH++dhYDwzht4
 JXqsypK5zTtH+OMdZccSFfA7YtN1AbNYC6nqiZQ41k5PlcMzRCyVAgzqCget5PXFPZWL
 1z/0uYuTZWqSeEs6v8waQDHeh2ZBX7sHUXhJawj0VDfYO38kONB6KnL+4y7vSPqxEsYS
 tf9Q==
X-Gm-Message-State: AOAM531hipbzrVdIbrS63C8B1mktLhdv1AOsp/TdKk67tNVtAcFk8mrl
 I6U6cGZsRxIHtiRftJ1MddGRKn2VcJ0=
X-Google-Smtp-Source: ABdhPJzgMSfnxXTcl9fy1mYuun+HkpZUdYaw/FGUCNXrtjVJjuXvkvfPuquQ52GiOu8b/0xZHcs6tA==
X-Received: by 2002:a05:600c:350f:: with SMTP id
 h15mr7347895wmq.144.1632581550685; 
 Sat, 25 Sep 2021 07:52:30 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 s2sm10977263wrn.77.2021.09.25.07.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 15/40] accel/tcg: Introduce TCGCPUOps::has_work()
Date: Sat, 25 Sep 2021 16:50:53 +0200
Message-Id: <20210925145118.1361230-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a target-specific has_work() handler for TCG.
Eventually call it from tcg_cpu_has_work(), our
AccelOpsClass::has_work() handler.

Inspired-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/tcg-cpu-ops.h | 4 ++++
 accel/tcg/tcg-accel-ops.c     | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 6cbe17f2e6d..c19c507b23c 100644
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
index ebaacff1842..cd44bb6d0d8 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -32,6 +32,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
 #include "exec/exec-all.h"
+#include "hw/core/tcg-cpu-ops.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
@@ -80,6 +81,9 @@ static bool tcg_cpu_has_work(CPUState *cpu)
     if (cc->has_work) {
         return cc->has_work(cpu);
     }
+    if (cc->tcg_ops->has_work) {
+        return cc->tcg_ops->has_work(cpu);
+    }
     return false;
 }
 
-- 
2.31.1


