Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883156BFC95
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 21:06:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdcoQ-00064L-A9; Sat, 18 Mar 2023 16:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoL-0005jF-AP
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:53 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pdcoJ-0007F7-M0
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 16:05:53 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 x22-20020a056830409600b0069b30fb38f7so4726128ott.5
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679169950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vt9kE6nXpZRbmPAxL8bMFdNpI5BJmqSAYbOTJpKdffU=;
 b=npOMM7r58ZzjSpp2+OhKLPSd40KIVZpTeD1ltY3qEm8Ewl4PjSYcFTePBB/Ea40/9n
 nVZkIKU3wEBrKvrgPcS6EyHXZtax0WKIQBoNSysmCU97Ui4WLlirKlXI3/TgsmEvh5DF
 PlyCaPcB30HxkVWjHxjsmr1Pnig6cgHC2UwAX1lw/PE5wZBICPuKC7wni6taV0NSua/h
 nvUWQnBiEkDPK03jtQoXCqObcDJkrs8mgQ/WVxHFdyUhyDptaieYARRE253THYPknjwd
 XcskaZvhFrMgcWLlNoWrQNZs7kjxV23wnB43j2Lqi5J3PhUG8UudHkJ6/JPCH8sKFwp/
 UkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679169950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vt9kE6nXpZRbmPAxL8bMFdNpI5BJmqSAYbOTJpKdffU=;
 b=BtfvWOdTb1GJQQUVDIes8MF7Ln5NMqI+Cjfs/UTwcqLKEQNmlDzcvbYdYIxn8o4ISB
 bTTcZLuTEU/wHgijHWG+HhLfScZHFtRNEMQXg8lCOeWSZVhWeoJ/rgTVmoRUCcR68wKP
 a/7fRbB0iGBCBNMyWvtDLchhLzojjDQuPyNv7z9SwwS1iDhfJuPkq/QwJ31rl/gYja41
 mEb+uzk8SKX9eB7bMVNBp50MeoC0GoAuifpcKr5I+KNAEXnVYqnswlSTTHPqRdF67Wzp
 iIBRkxWpWUkRctuKyM/pvXGyDqbHm0W+w5I7GAIYGKaBODhLz2G69MVtIy293SS+8Vtz
 9MHQ==
X-Gm-Message-State: AO0yUKXdTT7tVSkXoiHh8nSdJ1mh7ldfjPDblgL0E0ZMcUly+l/ZjT6e
 PFU8LOe16WobEPajka6Cun+PE04GbduNnIzNzrQ=
X-Google-Smtp-Source: AK7set9yaBgj4EmAMpIkNqX3pC33Gr9I+izxh90vbrzs3G9XWid+g/Tp3W2kHl1BBOm7arAV8ZK2RA==
X-Received: by 2002:a05:6830:5:b0:69b:6c9e:cd2d with SMTP id
 c5-20020a056830000500b0069b6c9ecd2dmr1295447otp.4.1679169950549; 
 Sat, 18 Mar 2023 13:05:50 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 f69-20020a4a5848000000b004a3d98b2ccdsm2122219oob.42.2023.03.18.13.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 13:05:50 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v3 24/26] target/riscv: update cpu->cfg misa bits in
 commit_cpu_cfg()
Date: Sat, 18 Mar 2023 17:04:34 -0300
Message-Id: <20230318200436.299464-25-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318200436.299464-1-dbarboza@ventanamicro.com>
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x336.google.com
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

write_misa() is able to use the same validation workflow
riscv_cpu_realize() uses. But it's still not capable of updating
cpu->cfg misa props yet.

We have no way of blocking future (and current) code from checking
env->misa_ext (via riscv_has_ext()) or reading cpu->cfg directly, so our
best alternative is to keep everything in sync.

riscv_cpu_commit_cpu_cfg() now receives an extra 'misa_ext' parameter.
If this val is different from the existing env->misa_ext, update
env->misa and cpu->cfg with the new value. riscv_cpu_realize() will
ignore this code since env->misa_ext isn't touched during validation,
but write_misa() will use it to keep cpu->cfg in sync with the new
env->misa_ext value.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 16 ++++++++++++++--
 target/riscv/cpu.h |  2 +-
 target/riscv/csr.c |  3 +--
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 67a46504bb..2d2a354af3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1213,8 +1213,20 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
     }
 }
 
-void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu)
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext)
 {
+    CPURISCVState *env = &cpu->env;
+
+    /*
+     * write_misa() needs to update cpu->cfg with the new
+     * MISA bits. This is a no-op for the riscv_cpu_realize()
+     * path.
+     */
+    if (env->misa_ext != misa_ext) {
+        env->misa_ext = misa_ext;
+        riscv_set_cpucfg_with_misa(&cpu->cfg, misa_ext);
+    }
+
     if (cpu->cfg.ext_zk) {
         cpu->cfg.ext_zkn = true;
         cpu->cfg.ext_zkr = true;
@@ -1383,7 +1395,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    riscv_cpu_commit_cpu_cfg(cpu);
+    riscv_cpu_commit_cpu_cfg(cpu, env->misa_ext);
 
 #ifndef CONFIG_USER_ONLY
     if (cpu->cfg.ext_sstc) {
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ca2ba6a647..befc3b8fff 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -597,7 +597,7 @@ void riscv_cpu_validate_misa_ext(CPURISCVState *env, uint32_t misa_ext,
                                  Error **errp);
 void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
                                    Error **errp);
-void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu);
+void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext);
 
 #define cpu_list riscv_cpu_list
 #define cpu_mmu_index riscv_cpu_mmu_index
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8d5e8f9ad1..839862f1a8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1396,7 +1396,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
         return RISCV_EXCP_NONE;
     }
 
-    riscv_cpu_commit_cpu_cfg(cpu);
+    riscv_cpu_commit_cpu_cfg(cpu, val);
 
     if (!(val & RVF)) {
         env->mstatus &= ~MSTATUS_FS;
@@ -1404,7 +1404,6 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
 
     /* flush translation cache */
     tb_flush(env_cpu(env));
-    env->misa_ext = val;
     env->xl = riscv_cpu_mxl(env);
     return RISCV_EXCP_NONE;
 }
-- 
2.39.2


