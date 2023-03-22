Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3007F6C5A5E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:31:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf6pg-0006Pf-3m; Wed, 22 Mar 2023 18:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6pe-0006PE-2a
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:21:22 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pf6pG-0006V5-2b
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:21:17 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1755e639b65so20931826fac.3
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679523647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEPTSkB86BpaaFtLEftxltn8EEKuvxXM6fE3vNx61Lo=;
 b=l1RcBFaZs9QDDMMnvPk66caZ29GzphCzEHPlIFp27V9tpLCxG9KR5mHVdDtODCbq4p
 RZopJaao6B6PEJEs5lJzq9T2sP49yN+0NaaHlmsfLbVh0G0hr394RZu0wStONHBONhP8
 x40KnYffGqF9Kdm/rQK9y3NzZHH5U6qetNgUg9ghdtSSwMqRUz0zHLqhjg3BKQgooHCN
 S3VT7JP0/B8C0E/8OgUK/JtjNxrAlys/iPgcKNh26rkx2xsAKWg6ggjInrRcimTXVP6V
 ujhFHkILsJz8FNyFdldzElbdukde/Nj0wx1wjE+edSRsgoZFwTsOLyo7e5jZ5GTs3ksP
 CrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679523647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEPTSkB86BpaaFtLEftxltn8EEKuvxXM6fE3vNx61Lo=;
 b=SrlbrFGKGkgnSbd9z/c5li2Zi90gIoY9i+XfdRxYlSmAt1UGKqk8nQB0H0uw8NBlyh
 Bvz8q8J7WrpPE1QO2FPkpbNv0YfdW2o+cL+Z8eVlKUPPj++g3XhzAfX09YvBCSvsKk/s
 23RGWqlABVTI0BAWz7zdQsu4KWMmp3kmy+Y2J4+DXp7hNOhb3tqNx9NS3/RI8uwcEWWZ
 hoznDB/oH5ET1rbpEE2Oo9ThwU6kyFEZLFKFJyNia2LDW2XKS6nJa0Ka/NWB354IDXRv
 qSM1nPo6Q4+mGYf8JPIY8fOY3N6jFqY57OfbRtjvcmTGZc4JqE0OGbqM+1xq5p4munC4
 EU5A==
X-Gm-Message-State: AAQBX9ejSvXruoU7+T6qs72REkJ5gbP/Bpl/a/DAukIGYwBx3zGovm//
 3cXoDqtOyZORIEp880NyRM2yWc1MaLYrQBYDxfo=
X-Google-Smtp-Source: AKy350ZNOMJ7M4EsOJkDXyb6z7sOJfOCZnEKTrnFrffCB5GOdt/hCO3EIUKKMnfx3ucKBGiYDL+6mw==
X-Received: by 2002:a05:6870:a68f:b0:17e:e65:c922 with SMTP id
 i15-20020a056870a68f00b0017e0e65c922mr824017oam.36.1679523647246; 
 Wed, 22 Mar 2023 15:20:47 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 ax35-20020a05687c022300b0017243edbe5bsm5586817oac.58.2023.03.22.15.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:20:46 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v4 08/25] target/riscv/cpu.c: validate extensions
 before riscv_timer_init()
Date: Wed, 22 Mar 2023 19:19:47 -0300
Message-Id: <20230322222004.357013-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322222004.357013-1-dbarboza@ventanamicro.com>
References: <20230322222004.357013-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2f.google.com
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

There is no need to init timers if we're not even sure that our
extensions are valid. Execute riscv_cpu_validate_set_extensions() before
riscv_timer_init().

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 7458845fec..fef55d7d79 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1237,12 +1237,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-#ifndef CONFIG_USER_ONLY
-    if (cpu->cfg.ext_sstc) {
-        riscv_timer_init(cpu);
-    }
-#endif /* CONFIG_USER_ONLY */
-
     riscv_cpu_validate_set_extensions(cpu, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -1250,6 +1244,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
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


