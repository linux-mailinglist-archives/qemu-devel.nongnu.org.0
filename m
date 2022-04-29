Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB435514FCD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:44:53 +0200 (CEST)
Received: from localhost ([::1]:47832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSnX-0000TR-4L
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkSe9-00053V-Qj
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:35:06 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nkSe8-0007s1-0L
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:35:05 -0400
Received: by mail-pg1-x530.google.com with SMTP id i62so6806230pgd.6
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iph17vM5JKx2zwjUTuCtizhPT+K6iT4BbkNaUeHmZmk=;
 b=pbVoXyPpz6u2GpHz6nk0NY2yd35Pcl2nKq8I+pW3/lAHkvbDOUo+zeHcqTvdhtvO4F
 lHqBdc7Dgw11Z5KTSqcMdROARtteC6IrwCrslglxw1zAGBvdi7vGPrEpy+1s/PxNHt8+
 /WjqlI6ifmRCvgCvZmqjo4fUpsjDHCoOr/O6hsADs/qlRtatiVeA3arnU4JTREU4kqQ/
 nba/hqfHEK5ooI93NNv/ZSLzltk7T4vKUfRwAfldYiHf+beQBxD1fTo6tEv5XxohaQ/H
 /yePhYtkoIAMcljjAuVhEeN07681uq1FdBs/ZrT9bBR5MgWjTmtLxmJqqpTtsoKzlk+u
 SJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iph17vM5JKx2zwjUTuCtizhPT+K6iT4BbkNaUeHmZmk=;
 b=qmyzEIVhp06du82C+Ug1JoAOFFV0WNbc5IlIAN60ygUskhQvLstniVAZA08Tqi/0ZR
 b40gkSv4yJ/nwqe5pkDdeJZ6Nrkxhj7DFHXMCsx+rvZGC82YWOscRAbU8xZxWAWru/W9
 iA/4ncqE6t31OtCnbtOKc55o7n3KBktCOkooEkCJtWTdz32ZOBxrzuL4030PZ8oLm/1a
 s233u6AmWOpF8xIXHl4r8BiX0lBXTZQfGWnOuwP0tByNDSuIrAiC2ZfUKvhHY5/v/1pq
 t33tmsdW2ZXiaQYe1gyqrMlhR+MLNkBlNQ+byPSezo+48mwVe4YLNvY92B6RwC3iWUjS
 DKfg==
X-Gm-Message-State: AOAM531X6/cE6ciZVckNhMIxBqxu/0bjmaCfwIBDgF/MGNSf0sRCV6Ax
 ic0r6ZT5oJ0Q7SkgqyWKXRAMDg==
X-Google-Smtp-Source: ABdhPJwhecgxf5jmlYzSo1MdOmEWhZkEOfAzoEbiqR5gVRgboxsLXmBPzsOL0mstx31LTRRbpL2quw==
X-Received: by 2002:a63:8c1:0:b0:3c1:7c1b:7084 with SMTP id
 184-20020a6308c1000000b003c17c1b7084mr6642934pgi.438.1651246502498; 
 Fri, 29 Apr 2022 08:35:02 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.167.97.237])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a65608d000000b003c14af50606sm6439380pgu.30.2022.04.29.08.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:35:01 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH 1/3] target/riscv: Don't force update priv spec version to
 latest
Date: Fri, 29 Apr 2022 21:04:29 +0530
Message-Id: <20220429153431.308829-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429153431.308829-1-apatel@ventanamicro.com>
References: <20220429153431.308829-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Anup Patel <apatel@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The riscv_cpu_realize() sets priv spec verion to v1.12 when it is
when "env->priv_ver == 0" (i.e. default v1.10) because the enum
value of priv spec v1.10 is zero.

Due to above issue, the sifive_u machine will see priv spec v1.12
instead of priv spec v1.10.

To fix this issue, we set latest priv spec version (i.e. v1.12)
for base rv64/rv32 cpu and riscv_cpu_realize() will override priv
spec version only when "cpu->cfg.priv_spec != NULL".

Fixes: 7100fe6c2441 ("target/riscv: Enable privileged spec version 1.12")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 target/riscv/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f0a702fee6..02ee7d45d8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -169,6 +169,8 @@ static void rv64_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV64, 0);
+    /* Set latest version of privileged specification */
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 
 static void rv64_sifive_u_cpu_init(Object *obj)
@@ -204,6 +206,8 @@ static void rv32_base_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     /* We set this in the realise function */
     set_misa(env, MXL_RV32, 0);
+    /* Set latest version of privileged specification */
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 
 static void rv32_sifive_u_cpu_init(Object *obj)
@@ -509,7 +513,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     CPURISCVState *env = &cpu->env;
     RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
     CPUClass *cc = CPU_CLASS(mcc);
-    int priv_version = 0;
+    int priv_version = -1;
     Error *local_err = NULL;
 
     cpu_exec_realizefn(cs, &local_err);
@@ -533,10 +537,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    if (priv_version) {
+    if (priv_version >= PRIV_VERSION_1_10_0) {
         set_priv_version(env, priv_version);
-    } else if (!env->priv_ver) {
-        set_priv_version(env, PRIV_VERSION_1_12_0);
     }
 
     if (cpu->cfg.mmu) {
-- 
2.34.1


