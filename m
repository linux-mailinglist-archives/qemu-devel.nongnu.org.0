Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96686BFC9C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:07:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdcoT-0006VE-I6; Sat, 18 Mar 2023 16:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoP-000669-6T
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:57 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoN-0007GS-5R
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:56 -0400
Received: by mail-oi1-x22f.google.com with SMTP id bo10so6202285oib.11
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmbX519e6VWvRcGzVkBcanGYNJBj4+Ut+TmCNDZrZTw=;
 b=lDalFKOhDjCqnFs9A+siyq67oAHiCye/gjQLy+bpjifBMju0scqGJbpCDLl6U9YI2v
 wQFUQmNJGtSmSVCGxYZHPPLG7FOnd6MhxhqVUyYD6zQ6gtajo4nWTl0y38VeWUKoW6hI
 SvklaUBYjETIahN5m0w4epo7tQ59MQTE7C/sH37/V36WHzMcoTCK8A8Of/1bcXLNvRT/
 Gi9KeT6QESJuxtbxQlZ4wsDWmUXFbJ4PckAypfyyxrAQ0aXU5mw6hYnXsskGN3VrKYMU
 ZiTUxHCsm+1+LdmU8O06M93iCv7hl2uzYrAp2jpaUFJNLaqWIyBeCkg+5rGN1JKg4okq
 hY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xmbX519e6VWvRcGzVkBcanGYNJBj4+Ut+TmCNDZrZTw=;
 b=nUozDWyLZCqWvgDqbQca3ff+QuX3ZEMD4xFJKqIbpgm+5ekzGjR48K/S4lYlcHenOa
 8F7ZSafFJshYcpbi7kSedXH53X4sqmW9RY0eg9JaeQE2r40bdMhOdrsU3xSM2kwbLle1
 0MVZ8a5hqI+f3MrxK9MLfku1yIOGBGh6aZHJiAyDLDlAhm9ofJ15F/+FE7Hd7Lkdhors
 LrRZtgKAV0QmWauED0tgyNgU1yUzSO4tLEulbXFtErvPhj8d6OSCtrOfM/o1aQ0JbB4s
 g1rFHmW1S0Rc5+M8qzMyuPEOVP667qLG85ySap+kOaNtB08CygT6thSJb1j8C5Zidit0
 Mh7A==
X-Gm-Message-State: AO0yUKWMaMIiem8yKtrme9f2CITZH5kDKYp2iPL0w6hQDMmkGpRnLNMN
 pD3etF0GrFWo1YMbhoPTmo9cKRpj8Jvyw67DEgw=
X-Google-Smtp-Source: AK7set/NmPVtu6tEJyH184gKpY/3ubiRKQyqEZhzUDWgMFg2hCCY2t9vY24SOhQq80rdBcDNimb+OA==
X-Received: by 2002:aca:2801:0:b0:386:a4c9:40c1 with SMTP id
 1-20020aca2801000000b00386a4c940c1mr5908465oix.7.1679169953544; 
 Sat, 18 Mar 2023 13:05:53 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:53 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 25/26] target/riscv: allow write_misa() to enable
 RVG
Date: Sat, 18 Mar 2023 17:04:35 -0300
Message-Id: <20230318200436.299464-26-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
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

Allow write_misa() to enable RVG by changing riscv_cpu_enable_g()
slighty: instead of returning void, return the current env->misa_ext
value. This is then retrieved by 'val', which will add the RVG flag
itself, and then we'll skip validation and go right into commiting the
changes.

The reason why it's ok to skip validation in this case is because we're
only allowing RVG (and its associated extensions/Z extensions) to be
enabled in the hart, and riscv_cpu_enable_g() already does its own
validation before enabling itself. Everything else is considered to be
already validated beforehand, so we don't need to repeat ourselves.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c |  7 +++++--
 target/riscv/cpu.h |  2 ++
 target/riscv/csr.c | 15 +++++++++++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2d2a354af3..73a5fa46ee 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -281,7 +281,8 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
     return ext;
 }
 
-static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
+
+target_ulong riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
 {
     CPURISCVState *env = &cpu->env;
     RISCVCPUConfig *cfg = &cpu->cfg;
@@ -289,7 +290,7 @@ static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
     if (cpu->cfg.ext_zfinx) {
         error_setg(errp, "Unable to enable G: Zfinx is enabled, "
                          "so F can not be enabled");
-        return;
+        return 0;
     }
 
     if (!(cfg->ext_i && cfg->ext_m && cfg->ext_a &&
@@ -315,6 +316,8 @@ static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
         cfg->ext_icsr = true;
         cfg->ext_ifencei = true;
     }
+
+    return env->misa_ext;
 }
 
 static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index befc3b8fff..3ca1d4903c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -599,6 +599,8 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
                                    Error **errp);
 void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext);
 
+target_ulong riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp);
+
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
 
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 839862f1a8..4335398c19 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1381,6 +1381,20 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         val &= RVE;
     }
 
+    if (val & RVG && !(env->misa_ext & RVG)) {
+        /*
+         * If the write wants to enable RVG, only RVG and
+         * its dependencies will be updated in the CSR.
+         */
+        val = riscv_cpu_enable_g(cpu, &local_err);
+        if (local_err != NULL) {
+            return RISCV_EXCP_NONE;
+        }
+
+        val |= RVG;
+        goto commit;
+    }
+
     /*
      * This flow is similar to what riscv_cpu_realize() does,
      * with the difference that we will update env->misa_ext
@@ -1396,6 +1410,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
+commit:
     riscv_cpu_commit_cpu_cfg(cpu, val);
 
     if (!(val & RVF)) {
-- 
2.39.2


