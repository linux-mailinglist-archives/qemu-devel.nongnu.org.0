Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74A862119C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOBW-0006Zl-8r; Tue, 08 Nov 2022 07:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOBA-0006Tf-Py
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:58:13 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1osOB9-0005qJ-4n
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:58:12 -0500
Received: by mail-oi1-x22c.google.com with SMTP id h132so7531752oif.2
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 04:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0xhD3CLA0c9U1Rhojr/MSgAAnAVHwGEX5bLXtLBauhM=;
 b=BOMPjZuqBFjGVBuYPMXHhA7T/hGudF6OcV5kmwAh/0DGD/+tWHJtmWP6t68hywwcRU
 scYdslrq4RHt4ZbTqsgyzOBG35iGEJp04pUguDn4mNyFz+B3UXIzxqPEPZXrn2FY1GuP
 FoaLJYSb+B44ppwDRvV2LN7KkGymI9ZzS4n67bKU85Yrao1J4Vsb78fOLh8jacKgw6j3
 T1ie+RGPkvzF1jiDtts1Hr6uFCz29uwFkYNWO3n/sLfljUdRDfHTkzHwF/qPRmytwdCD
 Bv19CrwfQeULx+YAcRS40Jemg4J4ziV79yKnDVEgJuQEnomahdcQ5Na1VK3URjD8/Gbm
 Vd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0xhD3CLA0c9U1Rhojr/MSgAAnAVHwGEX5bLXtLBauhM=;
 b=ht5GGtlOB8CkUMeBXASXtUt8VLc5HK+bKqxWoNl9kyhDHdwhf6G+C2zH0qzNoKQPJH
 QsjS6EnC3gXoSuDpbRevw3FLlsOBeM/FeoS7mZcXhbM94vH0HUmIi1Btrf7BkCQGEkAZ
 elJfsv3zMActZfoCA3qpNlGig5oMS9AAin7ov231m+LBCV7yriuvLgVZCfvZZftILgmX
 AYAm6YnIm9ls04EzzgHAvfjpsdvcTlI1sUuGO50gm4lOT4W3nnExo/D3+MuqoDxOKXiK
 7DMRomPPve9bUYl9JA7iwRMe4BacNX6SRw3CRALvGeigPmKYvsPzVFFGaTO/CflSrJIX
 ZarA==
X-Gm-Message-State: ACrzQf055izi1rN6732zbqtekHTlSGKWy6PDOEfFVKt4fL847EQFHe1K
 /Z+4V5ZCgNTpR4rHpxpWuOqk3Q==
X-Google-Smtp-Source: AMsMyM4a51uuQtNg7QF4wF7iGLbqKHA5uNdd2ySMb+1G96oSCn/c5K3ZHh59QBXdRy7QXsMjNtDC+g==
X-Received: by 2002:a05:6808:11c8:b0:353:f092:f11b with SMTP id
 p8-20020a05680811c800b00353f092f11bmr28968853oiv.239.1667912289960; 
 Tue, 08 Nov 2022 04:58:09 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a0568080d4f00b0035a81480ffcsm2342501oik.38.2022.11.08.04.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 04:58:09 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 3/5] target/riscv: Don't clear mask in
 riscv_cpu_update_mip() for VSTIP
Date: Tue,  8 Nov 2022 18:27:01 +0530
Message-Id: <20221108125703.1463577-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108125703.1463577-1-apatel@ventanamicro.com>
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=apatel@ventanamicro.com; helo=mail-oi1-x22c.google.com
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

Instead of clearing mask in riscv_cpu_update_mip() for VSTIP, we
should call riscv_cpu_update_mip() with mask == 0 from timer_helper.c
for VSTIP.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c  |  2 --
 target/riscv/time_helper.c | 12 ++++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5d66246c2c..a403825e49 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -617,8 +617,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
         vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
     }
 
-    /* No need to update mip for VSTIP */
-    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
     vstip = env->vstime_irq ? MIP_VSTIP : 0;
 
     if (!qemu_mutex_iothread_locked()) {
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 8cce667dfd..4fb2a471a9 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -27,7 +27,7 @@ static void riscv_vstimer_cb(void *opaque)
     RISCVCPU *cpu = opaque;
     CPURISCVState *env = &cpu->env;
     env->vstime_irq = 1;
-    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
+    riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
 }
 
 static void riscv_stimer_cb(void *opaque)
@@ -57,16 +57,20 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
          */
         if (timer_irq == MIP_VSTIP) {
             env->vstime_irq = 1;
+            riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
+        } else {
+            riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
         }
-        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
         return;
     }
 
+    /* Clear the [VS|S]TIP bit in mip */
     if (timer_irq == MIP_VSTIP) {
         env->vstime_irq = 0;
+        riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(0));
+    } else {
+        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
     }
-    /* Clear the [V]STIP bit in mip */
-    riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
 
     /* otherwise, set up the future timer interrupt */
     diff = timecmp - rtc_r;
-- 
2.34.1


