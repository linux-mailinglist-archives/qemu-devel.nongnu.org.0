Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E27CC6C5A42
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:24:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf6sk-0006YX-AJ; Wed, 22 Mar 2023 18:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6sh-0006Xu-98
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:24:31 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6sW-0006Wd-D7
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:24:30 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-177b78067ffso20882308fac.7
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U3NtH6HOCPh1vtXRdOnmbAb1lq7yTfwsV1uPUUDJ9mE=;
 b=Sk1DHsWo/JKBBPQlgQugoWkENtV7ekCGFKkok1MmCxiwsDuF1KFGYN3zHFutkku9Jj
 s2K9toIm8lei5TrkF2V9ZcGLKrXaT9BzhTke0NAXzCyf0PYd8Q5V+jlahf+cDF0FhvuC
 GvNlI332LbFqAxYQ9G4mALH884yd4ZLDJvo48LT6ustu+tRjT3jQU9Beq+cs6yHPuvv8
 JFvrZSMoUkZyOpFS9KyPmk2tjcBSjZohUjMZnbSc5hKYieHoYvJAcDrQ/9AbxYHJgr8m
 cy15izk2AIEDbI04KQUuk0e0V0C09NAuD97PKN1NbexUTa5mi5LUV57cUULpU8zMk00q
 96Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U3NtH6HOCPh1vtXRdOnmbAb1lq7yTfwsV1uPUUDJ9mE=;
 b=2er14WEsQG/jHGa/vtCitl8tm0PGf5kJIWJHo6LLfonJYLLqdyUxbyQIyMVNrBqf4Y
 w6is+LAbiiH/ywOHLFib2BBI4XRSF1ktQLu9HB3jsVcpQTj4IUcBYnuerY5SaXeBcbD/
 LMB6uA00dLoPzgOIbN4zWrcg8X+RpRJ8MFLYFezOHjIUAwryDDglEh4Wmj87dyChy6UP
 O8jCOTvVQPowr9C0m49Y3iJ/e+r22B70kFhMU7yf5ZviGYzWL5c1BURO1gMFxvb5IkYI
 4z5WXAOMtUDSx//YfKHV6FLCIe07JdYGdzmnbivpNclvMIIDzTH91Y3AWvRZyLEsTjLH
 EOnw==
X-Gm-Message-State: AO0yUKXjvhArLyPMIAeQu4v/XDTGIZwXNmazyEkniUQcDX4EPdgOHMog
 R/QBCS8p+4iD+d1MQ26GxRucqwjNYl6wSYb0s2s=
X-Google-Smtp-Source: AKy350YIdbjsDvDEJjKSr8iHUsB57Uy+tccjLm5aedxLcI8G4W+YthwFgQmU7/kKCoilaLJyRkgftg==
X-Received: by 2002:a05:6870:330f:b0:177:abd2:f867 with SMTP id
 x15-20020a056870330f00b00177abd2f867mr1026243oae.9.1679523687573; 
 Wed, 22 Mar 2023 15:21:27 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:21:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 21/25] target/riscv: split
 riscv_cpu_validate_set_extensions()
Date: Wed, 22 Mar 2023 19:20:00 -0300
Message-Id: <20230322222004.357013-22-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x34.google.com
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

We're now ready to split riscv_cpu_validate_set_extensions() in two.
None of these steps are going to touch env->misa_ext*.

riscv_cpu_validate_extensions() will take care of all validations based
on cpu->cfg values. cpu->cfg changes that are required for the
validation are being tolerated here. This is the case of extensions such
as ext_zfh enabling ext_zfhmin.

The RVV chain enablement (ext_zve64d, ext_zve64f and ext_zve32f) is also
being tolerated because the risk of failure is being mitigated by the
RVV -> RVD && RVF dependency in validate_misa_ext() done prior.

In an ideal world we would have all these extensions declared as object
properties, with getters and setters, and we would be able to, e.g.,
enable ext_zfhmin as soon as ext_zfh is enabled. This would avoid
cpu->cfg changes during riscv_cpu_validate_extensions(). Easier said
than done, not just because of the hundreds of lines involved in it, but
also because we want these properties to be available just for generic
CPUs (named CPUs don't want these properties exposed for users). For now
we'll work with that we have.

riscv_cpu_commit_cpu_cfg() is the last step of the validation where more
cpu->cfg properties are set and disabling of extensions due to priv spec
happens. We're already validated everything we wanted, so any cpu->cfg
change made here is valid.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index bd90e1d329..ed02332093 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1109,10 +1109,10 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
 }
 
 /*
- * Check consistency between chosen extensions while setting
- * cpu->cfg accordingly.
+ * Check consistency between chosen extensions. No changes
+ * in env->misa_ext are made.
  */
-static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
+static void riscv_cpu_validate_extensions(RISCVCPU *cpu, Error **errp)
 {
     if (cpu->cfg.epmp && !cpu->cfg.pmp) {
         /*
@@ -1201,7 +1201,10 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
             return;
         }
     }
+}
 
+static void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
+{
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -1364,12 +1367,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_validate_set_extensions(cpu, &local_err);
+    riscv_cpu_validate_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
         return;
     }
 
+    riscv_cpu_commit_cpu_cfg(cpu);
+
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
         riscv_timer_init(cpu);
-- 
2.39.2


