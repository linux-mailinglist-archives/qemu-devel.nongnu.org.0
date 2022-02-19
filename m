Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CA34BC384
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 01:36:45 +0100 (CET)
Received: from localhost ([::1]:52162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLDjv-0001JS-UM
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 19:36:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDa4-0008OW-Co
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 19:26:32 -0500
Received: from [2607:f8b0:4864:20::32e] (port=40792
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nLDZY-00073d-3g
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 19:26:31 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 k9-20020a056830242900b005ad25f8ebfdso3063959ots.7
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 16:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tpFslJQAFlqy+zdW73vFNNesvLll7Yi85SOhA9EniS8=;
 b=AwHA4+l7qZf2C2cw29nEgNW8dHPVyvoozQhWMjxcqGj/GcxJ6uSAYGQBawznpP6hFz
 EGn4l9HDW3lJPl+lcnlXit3kEQxELrhKjRE23oGD7Igvd0CM+QsZmy0QIv38QZLcRge0
 zqyDhhoIEYQUxhqtayNsV+C8hvJej5tmLyk82UBnIGYrFmR6L/OzpaQz+fPmrTzArD7I
 ZVeYMpaqEUryRmx/o7JEHsPvR77vU50pe3nv/h7pGYrE/1yC0VL4tAGqMvYUjJYH1N8n
 vo+VPDsc5CSH8eGP4B9aNyGslWUESv6YZRpE5zkjap79PbIi0UqesXeCLgNeK/E+I62T
 CBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tpFslJQAFlqy+zdW73vFNNesvLll7Yi85SOhA9EniS8=;
 b=qkh7TEfwHfuljj8E2g9fXO6grvQ2sb/6XnsZO1CedI7l/kf4c5lIoSZ0IShP4P5mJx
 Ia6VX4HKl9fcAD/b9gHkbdvwtbGpy5SSiDig77baBIMP0QN3iB3XMco3TbM3eqlbsh5/
 0g3lTRdNnvqvZHbM62i6/B/l5UlRJ7Xevon7lklFv8f2Uy5wp46N6j6Kw48CR+TNvwSL
 NoT0nHUl3r3jd7VTmfhoJNS5s7APNV1yHeG8dOLQovAJz7YabUjqh9wvFL/hAWUxTFJ1
 UW0Oc8/Z3qveFNXZ1VhjavjdGPqLXnNwl+abehuFstOOuJbN7bNiF6jxv08o3+UtKUYZ
 0Icw==
X-Gm-Message-State: AOAM530gcE8/1nKtRQclMChOu8aBg7o4N9qD3EPtbpyhufVrK3CtPIS7
 9QhAiWBGyogBw2xmIqGOlw5WVFPGIwJJDQ2n
X-Google-Smtp-Source: ABdhPJx5bRFXZIHMB6rKxxulwUYRncJQmb3qDKclEzjso8uA+jMUcjFa8JcS+44RQxotiumTxr2v4g==
X-Received: by 2002:a9d:3783:0:b0:5ad:32a6:b69a with SMTP id
 x3-20020a9d3783000000b005ad32a6b69amr1572359otb.144.1645230348149; 
 Fri, 18 Feb 2022 16:25:48 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id r38sm2315588otv.72.2022.02.18.16.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:25:47 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/12] target/riscv: Add few cache related PMU events
Date: Fri, 18 Feb 2022 16:25:16 -0800
Message-Id: <20220219002518.1936806-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220219002518.1936806-1-atishp@rivosinc.com>
References: <20220219002518.1936806-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x32e.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

Qemu can monitor the following cache related PMU events through
tlb_fill functions.

1. DTLB load/store miss
3. ITLB prefetch miss

Increment the PMU counter in tlb_fill function.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 746335bfd6b9..094d41ba07f7 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,10 +21,13 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#include "cpu.h"
+#include "cpu_bits.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -1174,6 +1177,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     riscv_raise_exception(env, cs->exception_index, retaddr);
 }
 
+
+static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
+{
+    enum riscv_pmu_event_idx pmu_event_type;
+
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
+        break;
+    case MMU_DATA_LOAD:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
+        break;
+    case MMU_DATA_STORE:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS;
+        break;
+    default:
+        return;
+    }
+
+    riscv_pmu_incr_ctr(cpu, pmu_event_type);
+}
+
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr)
@@ -1270,6 +1295,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.30.2


