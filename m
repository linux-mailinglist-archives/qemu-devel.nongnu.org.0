Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5A9690055
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 07:26:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ0M1-0000v3-DN; Thu, 09 Feb 2023 01:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Lz-0000ug-En
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:24:19 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Lx-0007x1-Kn
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:24:19 -0500
Received: by mail-pf1-x435.google.com with SMTP id a5so658588pfv.10
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 22:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slc2qEJKHDUPCqJbT+o4fG/GNXtlIN4HHpf/pKqJaTw=;
 b=6vhXlP9BP1PzczhlUyDT/OgkPtpmJzCqM6MrN31zX6E1qPKEDx7pfXjYohz+zhN5mz
 6AMTj7l077D+2RNbrhC7EO2DiU+KtXYLwRNo+Sj5usbuKZAuweV9ugy+pAYP4o0SJcgs
 G3oEjtKxSGn0b7KAAHtlO7x5jEISt/9Lq1xAm1Yr2+yNJ0GrvHIw51Ul5NQXy4jYlO6C
 6s5wrFURniSx2mohhRJ7sLiGYA1RkrWgxQFyvgZ2QsKRnKWrTfnaI4k5CKKwRnkwu1nN
 5kq71mPh7VltiJN5ocQFa+U30cjjQr13QtKyDdVhTL70kE2OqZYV7bCXiLlYLqqxG4S/
 EvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=slc2qEJKHDUPCqJbT+o4fG/GNXtlIN4HHpf/pKqJaTw=;
 b=cvgXvFGQrNWCLkc+ETu9GnpsFV/XRKFWtFH4sPukNkNDvXJGlrLvgF/Zuhiq+ckSqx
 1nxh27Gr7WklmlMQNYT/MyoI2aiGPPPpzhGzmeRKYtIu6v7Qf9wqEw/PyuD/5nLh8ew5
 XtbbJpZUFunlIh1xgNyn9wqOoRpy1sY7uRvDmaVZUR3Khers9V6etavFiDhTJtUOR4GU
 CFGwC0O9barig9D8sSIgEKkQE7GyoKqMGKWtU+Df9shlMQ1a1ohfbeby5JjlqaQ9sKmM
 BJ/zYAKN1rRR3lTtIc7f0P8NiscNnfdr2+6h4k8fFzA/lvk/FQ/X2zPEgvy5/flzGXFK
 t2Nw==
X-Gm-Message-State: AO0yUKWIzQzX7qojtQXHTqhLl0f6b69cgnzPA/JFlaEPTID7KILkC6VU
 OYV72/9i/gl6L4Ig/UFUbD2ktoHPuYYIHhpE
X-Google-Smtp-Source: AK7set8PCojduiIoCfj0XC1QNwu1p0TsGXFJxs/bNWDcx/YtIzgBqwJVVy3w0llApiYpKH6J/sZMuA==
X-Received: by 2002:a62:8493:0:b0:5a8:492f:c074 with SMTP id
 k141-20020a628493000000b005a8492fc074mr3869240pfd.29.1675923856265; 
 Wed, 08 Feb 2023 22:24:16 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b00571cdbd0771sm521919pfi.102.2023.02.08.22.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:24:15 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 4/9] target/riscv: helper functions for
 forward and backward cfi
Date: Wed,  8 Feb 2023 22:23:59 -0800
Message-Id: <20230209062404.3582018-5-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062404.3582018-1-debug@rivosinc.com>
References: <20230209062404.3582018-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Implementation for forward cfi and backward cfi needs helper function
to determine if currently fcfi and bcfi are enabled. Enable depends on
privilege mode and settings in sstatus/menvcfg/henvcfg/mseccfg CSRs.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Kip Walker  <kip@rivosinc.com>
---
 target/riscv/cpu.h        |  2 ++
 target/riscv/cpu_helper.c | 51 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 18db61a06a..d14ea4f91d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -568,6 +568,8 @@ bool riscv_cpu_virt_enabled(CPURISCVState *env);
 void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable);
 bool riscv_cpu_two_stage_lookup(int mmu_idx);
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
+bool cpu_get_fcfien(CPURISCVState *env);
+bool cpu_get_bcfien(CPURISCVState *env);
 hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                                MMUAccessType access_type, int mmu_idx,
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9a28816521..a397023840 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -30,6 +30,7 @@
 #include "sysemu/cpu-timers.h"
 #include "cpu_bits.h"
 #include "debug.h"
+#include "pmp.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -40,6 +41,56 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 #endif
 }
 
+bool cpu_get_fcfien(CPURISCVState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    /* no cfi extension, return false */
+    if (!env_archcpu(env)->cfg.ext_cfi) {
+        return false;
+    }
+
+    switch (env->priv) {
+    case PRV_U:
+        return (env->mstatus & MSTATUS_UFCFIEN) ? true : false;
+    case PRV_S:
+        return (env->menvcfg & MENVCFG_SFCFIEN) ? true : false;
+    case PRV_M:
+        return (env->mseccfg & MSECCFG_MFCFIEN) ? true : false;
+    default:
+        g_assert_not_reached();
+    }
+#endif
+}
+
+bool cpu_get_bcfien(CPURISCVState *env)
+{
+#ifdef CONFIG_USER_ONLY
+    return false;
+#else
+    /* no cfi extension, return false */
+    if (!env_archcpu(env)->cfg.ext_cfi) {
+        return false;
+    }
+
+    switch (env->priv) {
+    case PRV_U:
+        return (env->mstatus & MSTATUS_UBCFIEN) ? true : false;
+
+        /*
+         * no gating for back cfi in M/S mode. back cfi is always on for
+         * M/S mode
+         */
+    case PRV_S:
+    case PRV_M:
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+#endif
+}
+
 void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
-- 
2.25.1


