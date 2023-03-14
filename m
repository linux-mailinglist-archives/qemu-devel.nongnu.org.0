Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2D6B9C2B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:51:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7qu-0005cM-N8; Tue, 14 Mar 2023 12:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qs-0005Uv-Hj
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:18 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qr-0002qi-0R
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:50:18 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-17711f56136so17949850fac.12
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x65YaMF/q551T09YOmWRrKe4JEANKzCqnWd/M7vc3rI=;
 b=OMgoS9JklXoXl4Fem5uyAGscJ+kGX0hj5e14KHIUTRz1MDNzY3zjeFtfbNGV4NlwEj
 xe8PENcpDSKmjW4Px7DbZ/pfHziiFJqheZLYYIA/CIEuLAwT8GNdZjVzNjQ7avNaXHNL
 3+2XW2KEmhMr+quWWFuMyXQn9bjdyNzLvVmyffGllpO1Euu9UQy4178NQSkGErl48WQx
 xsqAdei9wd+q5/9scEjebGMzfqQLiCQE6mxt29/aRPiW+34T6V5qYxb0WbUbqPpz11Wu
 BlmEzO/283T/gRs4oD7JfwtDn7Ymfx/ML0ACF9AXkUdVsEaEhq9eiYugQ7vnRXEEifod
 0fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x65YaMF/q551T09YOmWRrKe4JEANKzCqnWd/M7vc3rI=;
 b=BjqLGmtchp/+ahRcbyn7Y8VRIO8z7KIhgXvLvhphKy3wP0I9aEjHzJIsrWL2H2P49a
 2H49567JE+mKNJPvTW7x93bpztHuCXTXMpdvcGQHBgONxanIhnuO7GtjMYekP6SZKTb9
 6JGRpNbtU/xcMsQporVzM71gIagILSOAhfcuFTIK5neBGkEdU6+Hc3hsUPbOOnuZdBYn
 +PGDfC0vjypylCF7DkobzmsIhIzOeC57WEdz+c9Qj3T5K/1vgE48eS57OXTvsRjxoWw3
 qBcpY+QBKh8ysPpN5L44RiHg16Z1G5Pym4ZfiIlTPSzvQFjSnemGqYhhyiTbArurtZ4k
 kSlg==
X-Gm-Message-State: AO0yUKUN79ShiHYBdw17qZd0p/SYtQQdhBvsaHllneEStYrlpZ8hcF09
 LB70R4TRksoXdlQ4FRNBiOJN2NkDjs58E8ocMSY=
X-Google-Smtp-Source: AK7set+7CIYv7yQhzU/aIaLMLfYeYa7PwfAPTXhoU9zkLO2wfL4DoV7BzQ2QSuv7QgaPRxSLpgQ32w==
X-Received: by 2002:a05:6870:d0c6:b0:17a:a7af:6cf3 with SMTP id
 k6-20020a056870d0c600b0017aa7af6cf3mr1693734oaa.56.1678812615491; 
 Tue, 14 Mar 2023 09:50:15 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:50:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 07/26] target/riscv: move pmp and epmp validations
 to validate_set_extensions()
Date: Tue, 14 Mar 2023 13:49:29 -0300
Message-Id: <20230314164948.539135-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314164948.539135-1-dbarboza@ventanamicro.com>
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In the near future, write_misa() will use a variation of what we have
now as riscv_cpu_validate_set_extensions(). The pmp and epmp validation
will be required in write_misa() and it's already required here in
riscv_cpu_realize(), so move it to riscv_cpu_validate_set_extensions().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a298e5e55..7458845fec 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -916,6 +916,15 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     Error *local_err = NULL;
     uint32_t ext = 0;
 
+    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
+        /*
+         * Enhanced PMP should only be available
+         * on harts with PMP support
+         */
+        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
+        return;
+    }
+
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             cpu->cfg.ext_a && cpu->cfg.ext_f &&
@@ -1228,16 +1237,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (cpu->cfg.epmp && !cpu->cfg.pmp) {
-        /*
-         * Enhanced PMP should only be available
-         * on harts with PMP support
-         */
-        error_setg(errp, "Invalid configuration: EPMP requires PMP support");
-        return;
-    }
-
-
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
         riscv_timer_init(cpu);
-- 
2.39.2


