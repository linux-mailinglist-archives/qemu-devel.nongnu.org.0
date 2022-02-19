Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC8F4BC365
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 01:30:42 +0100 (CET)
Received: from localhost ([::1]:41904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLDe5-0002fF-3Q
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 19:30:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZx-00089W-6k
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 19:26:25 -0500
Received: from [2607:f8b0:4864:20::c2e] (port=42628
 helo=mail-oo1-xc2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZD-0006z1-JZ
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 19:26:24 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so5542900oos.9
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 16:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tlEL+ggQLzoVYyGwKI1PH0WEkU9kiNDiYwBere3odAA=;
 b=Uh269YVWu4Y4vLKWRLu7AciYD//42xexTXsMfOa7xCsryq32vIi3SmBwV1a8ge+bUP
 9HN8ExWuh6uqUNkBMum/8UiY3XM3HHB0I6FpPCJkjiFZhGgnWya3JgdB0k8h5fDlExdN
 BpaL9tifc2TNaUhy56XC1ESm8ciqaql8jUEuyOdGdH3wWnmDsQ3yODw8IQZCoUTsT4Ew
 f79PS814yV08ShE8I0X/sgnpNpt7663dss9mElwXMC2tbzCgWHSk13J+C1iyCDt/vjiY
 BJm2BJ7ochDJwtucRw/YXeS1L5jme1ssc6AzHf2GQevs+vKxwzX3Vl4QhkXdHF5t8NEK
 iiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tlEL+ggQLzoVYyGwKI1PH0WEkU9kiNDiYwBere3odAA=;
 b=6uyRTgINUWaSh9dgbDOHrgd1vcZkBlPdQxtYK9KqrZkKRkenSHTnUe3PZ66888aIY+
 cc9E2eP06U6pNEK304ARzl9DzyFiaFhse1QMMrSNowu3R+2KjZWNKue4srWIYI/N1TpR
 N+Z4LtHRql0b4kYGp2DD57WgUhSl+XlYF+1GoLzzNVISZj8R2+YWlq0FvRp7sLjCqPC8
 HpgQPG14uCAQNn+25PqRC6uULxqghy6BbPB4uK5L2iUI2VIhAkX1IO6eImUnsm7Y+WKs
 /7g/arVxwPlPt6eAysZhHwcq21m7O9UvRlr4y233ysmelQOMXy94SmxnWSs/MNg6UUQO
 vtag==
X-Gm-Message-State: AOAM530EQ9uiUecXYjz07RNz2NFJslHUN2iYD5CBsZ73R86nmoJucJ4D
 ONew43n/YIqzxYaQ53XjGsv+8PUZeyZ/izfC
X-Google-Smtp-Source: ABdhPJzUO6wpk8VFAj+s3BGvJLh3Zsr2IfFrE9btvMqMDy0ZbUDGaEIeNBy8TGt4dMpbEw3N5EA7Hw==
X-Received: by 2002:a05:6870:3c0a:b0:ce:c0c9:703 with SMTP id
 gk10-20020a0568703c0a00b000cec0c90703mr5420319oab.341.1645230337939; 
 Fri, 18 Feb 2022 16:25:37 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id r38sm2315588otv.72.2022.02.18.16.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:25:37 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/12] target/riscv: pmu: Rename the counters extension to
 pmu
Date: Fri, 18 Feb 2022 16:25:09 -0800
Message-Id: <20220219002518.1936806-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219002518.1936806-1-atishp@rivosinc.com>
References: <20220219002518.1936806-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

The PMU counters are supported via cpu config "Counters" which doesn't
indicate the correct purpose of those counters.

Rename the config property to pmu to indicate that these counters
are performance monitoring counters. This aligns with cpu options for
ARM architecture as well.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 2 +-
 target/riscv/cpu.h | 2 +-
 target/riscv/csr.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 09dc07d12d6f..173b9d3c5d3e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -768,7 +768,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5d914bd34550..2dc491887f24 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -365,7 +365,7 @@ struct RISCVCPUConfig {
     bool ext_zbb;
     bool ext_zbc;
     bool ext_zbs;
-    bool ext_counters;
+    bool ext_pmu;
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_svinval;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 789f0c598932..2c3bba81c8af 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -69,8 +69,8 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
 
-    if (!cpu->cfg.ext_counters) {
-        /* The Counters extensions is not enabled */
+    if (!cpu->cfg.ext_pmu) {
+        /* The PMU extension is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-- 
2.30.2


