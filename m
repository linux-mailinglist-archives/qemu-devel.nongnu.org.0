Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B833690066
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 07:33:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ0SP-0007hr-KD; Thu, 09 Feb 2023 01:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0S1-0007Xh-Jy
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:30:33 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pQ0Ry-0000mP-Ba
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 01:30:33 -0500
Received: by mail-pf1-x435.google.com with SMTP id r17so670480pff.9
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 22:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slc2qEJKHDUPCqJbT+o4fG/GNXtlIN4HHpf/pKqJaTw=;
 b=FpWYYk/+rObx8lj8TiUpzTGreHoqDxf0meG0ATcWaJEIBQyKv4sfm/s8Yhiotq4tZw
 V/XWiUCLWMfyv++0IrQxElMBNBWWhGlPWkS94HuLnoTE1YYFxx6EZfUAnWIX2M0/yBwm
 L0DGybx/GMc8JKTIey1tmlqXisSRqHFLw6jHSJO3pTDIy0QDd8WSVwxw8TXQaukURNh7
 0nmYyfW8LAUgbrqfHeLrg/Rsi+WglTE3kUFMFAsLJzKxaMHCpcEEsyIMZGQwv+Y4Zb80
 da9cnRWbIWYsYhGCOSfHbZgBgUl7TQ+LIuo/lhy8tc771Sv3gRRZhJjRfzyCmh22UIfL
 EuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=slc2qEJKHDUPCqJbT+o4fG/GNXtlIN4HHpf/pKqJaTw=;
 b=i1HRNw3Fu5usWVLpONFVl0nHu6w3ME/H8BQZct4169NuJO+0g5PK+dYaUVlWZqyUOF
 E7f8PCb2BRctLsaeyaTg372dpxI0CG7dBuPBDGTDpBpFU/VowWhmvDVfiaqspllryJkO
 cl29xS9yzne6B7RvTFKVGXJLKP/gdoNpoiSEZO1RnVw0McHwbayGmkLN/1CreKrL0Gvn
 MlAuuXzc0UhdJphiDevN5fwCxc6QPYN9fV309T6DHzweGtQqOg4SmiIQcwyPTAiqx4pL
 PuRS2oSiv6f2YN7tWgZY+THs/hxYX42r65xIK2kZpxygzpZGHXtv7vxw/5GPVOidqAiJ
 WAeg==
X-Gm-Message-State: AO0yUKWTR+urfr7frZgor9UpBb/rKIUqxeQDjgX4BSGE+JBW7oNwAjsG
 boI/YB6TyRpFhAVWX4ol69Lefqfd1F2mFOF1
X-Google-Smtp-Source: AK7set/A7D+BkYZDhyi+L9nqEefqaNyFJWmscGPQA23xnsPgoqPtMaybiQ2AyGA3/EF5GJdiM1hasw==
X-Received: by 2002:a62:520a:0:b0:5a8:44b1:7396 with SMTP id
 g10-20020a62520a000000b005a844b17396mr4414023pfb.15.1675924227118; 
 Wed, 08 Feb 2023 22:30:27 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 u15-20020aa7848f000000b00593c434b1b8sm543649pfn.48.2023.02.08.22.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 22:30:26 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Kip Walker <kip@rivosinc.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v1 RFC Zisslpcfi 4/9] target/riscv: helper functions for
 forward and backward cfi
Date: Wed,  8 Feb 2023 22:29:42 -0800
Message-Id: <20230209062947.3585481-5-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209062947.3585481-1-debug@rivosinc.com>
References: <20230209062947.3585481-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=debug@rivosinc.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


