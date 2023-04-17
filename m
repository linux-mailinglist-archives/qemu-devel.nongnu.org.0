Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7412B6E4AE6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 16:08:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poPQA-0006qv-Jc; Mon, 17 Apr 2023 10:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPo-0005Ud-Rg
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:01:09 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1poPPY-00038P-Gw
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:01:08 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-187878a90e6so16626524fac.0
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681740051; x=1684332051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mA9TaJor3VOov64Jl6vxePW5HOjf4tVu/fsDcc2X43Y=;
 b=U40/VaMv/8KJ8YuCSZCiVMpgOk8/WnEGxPPnD5RAAVYCem2Yu76MG+1w1/HM3CPsu7
 uBjxB+iabNRqbLNGzngmx9zi/XlJFU71eusdxIdlmDiYjTpqa97oCRQzr/4uCyYEaYS3
 SwCxKV10Iqtfuz+ss7HL0igNdm21JGw3aLtJSkZZyHkcY2AmmuUJzc/dNRIpLQ0obdoE
 BO8T93nID+mSMc5A15g+dT5gDGGyB2M3+KfNPAmmkBdhD6IxA2niKePtuMZrqgjG+9dP
 UXLlFtIm2HImmc7H4jOzLyWE/lnjxsDrxrB8tpJMWJaQtxZ4OOBn7XqdTnXkFSqHKy0S
 s8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681740051; x=1684332051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mA9TaJor3VOov64Jl6vxePW5HOjf4tVu/fsDcc2X43Y=;
 b=gHcU8nypz/qaZqFFijBRlU5UdRNtDk/ZL2FvI/rq6Unu+hJRxKp1Oc68gyNviAY5sV
 7hyt/g/IaDhLu7QodwA9A8yKVvUY8qYP27NnbU9aLErH+kPv8rpoR/mc4+6C+vby3wlD
 Inuwj7XskQkiycRWmPv9/Gom12nb8qQogtimVwm/fzD3ikqazDNvkOGynbIsUjlDoYCx
 eo+hDROhTqgBpO4YBoZg/4NnssdO44r9LVgIDz7S03lVuNff5nUA2lQMb55BjjgXxeEB
 e0FDeYr16eI7z5lpeYXQlNFSd/Gx+eSguIHm/7ly9JiRDiMy4u4UFLwvLDm+7o7yCMAP
 TH2g==
X-Gm-Message-State: AAQBX9fCCFHTOPAELE9SjNqm+xgk8La5ij7jWRXkRbJmWAJRaRN7qo+B
 Nogc/jUF+TWW3bCg+1Sl7nI4R3dvi/Qbs8i3vUI=
X-Google-Smtp-Source: AKy350ZrLo/Zg/BsDLiVrpjG3+CJ+aLAMQvzYKS19lBRho+4Qn0/ttcGqFijH8ehZ9uNflL5PZswnQ==
X-Received: by 2002:a05:6870:4694:b0:184:266a:1700 with SMTP id
 a20-20020a056870469400b00184266a1700mr9423605oap.47.1681740051469; 
 Mon, 17 Apr 2023 07:00:51 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 x16-20020a05687031d000b001726cfeea97sm4531868oac.29.2023.04.17.07.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 07:00:51 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 09/12] target/riscv/cpu.c: validate extensions before
 riscv_timer_init()
Date: Mon, 17 Apr 2023 11:00:10 -0300
Message-Id: <20230417140013.58893-10-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417140013.58893-1-dbarboza@ventanamicro.com>
References: <20230417140013.58893-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is no need to init timers if we're not even sure that our
extensions are valid. Execute riscv_cpu_validate_set_extensions() before
riscv_timer_init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
---
 target/riscv/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 43635144bd..2d7f0ac785 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1257,13 +1257,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-
-#ifndef CONFIG_USER_ONLY
-    if (cpu->cfg.ext_sstc) {
-        riscv_timer_init(cpu);
-    }
-#endif /* CONFIG_USER_ONLY */
-
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1271,6 +1264,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
+    if (cpu->cfg.ext_sstc) {
+        riscv_timer_init(cpu);
+    }
+
     if (cpu->cfg.pmu_num) {
         if (!riscv_pmu_init(cpu, cpu->cfg.pmu_num) && cpu->cfg.ext_sscofpmf) {
             cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-- 
2.39.2


