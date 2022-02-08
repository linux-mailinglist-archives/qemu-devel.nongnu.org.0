Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937364ADE59
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:28:18 +0100 (CET)
Received: from localhost ([::1]:46246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTLl-0004rA-7f
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:28:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSMD-0001xg-OX
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:41 -0500
Received: from [2607:f8b0:4864:20::1034] (port=53977
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSM9-0000Tt-3p
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:24:41 -0500
Received: by mail-pj1-x1034.google.com with SMTP id qe15so7127436pjb.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fg4IjbLcHTX9hqYq7qkMPcz1t9uhjiu/PXI4XLXN4Lk=;
 b=Js6mSOFBzJA4rDbHVDyzia5svZ3iQdNFRkyna7cX+nDIpt/d63eyaSUQSCiPnjP/Vs
 ry2PgieMIIrG+V4V9bhTFJ0DV+92AsBPVJrtclnZvPWd58X2O10rbeTPL8ZiVKhFHU/+
 DkzuM28qnSpa1J/KS4j1WUYdQcVUmEInddiQaEsH9svZPtg132xlWZz1rl0DXSuFehZU
 tMMgjOKOy3/qcS7U5G5smZpNw0DsBZG6WNBb6tpsfJ/szEov4Clj2y2BfrSeajyYY668
 k9P8PRlyQ3CHz6Vb9Piv0kWU++qKic6MCr6rkR76hzLveE5h16IzL3PdHe+kI6A+RFmo
 ksCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Fg4IjbLcHTX9hqYq7qkMPcz1t9uhjiu/PXI4XLXN4Lk=;
 b=VEqwTjQ/9HMLnM0V631JM2taR0eL3tZCrYFTwmM0b0yoExUKpT1Xf/V6LnHMACMFlH
 57SJQGhyPFgZ3lUIXTGblLV1v6ew1Dpxg11Php6cdJDbzDtlqSOIYOwaFac3Wg/1UwNU
 kidhRWDE+uLtJ8TqAcIl5WYKBGqEx0718X+2lF1uWJBz+AYht3ud6fOhdMIPMz3le/UC
 K8UvkT7ABo1JsWFhexB8ypt98or5iHG8dFK+AzZVWPJu01CkuEfQiRA8mVXxm13+HXfR
 O39k7wSLjFBP1DHUivFDWSufQDOTXooLAChmAYRoFfQMby031ZQG30I7oXKJa/DaKKpN
 yDfg==
X-Gm-Message-State: AOAM531SLBE3UVQHmPcalqP8xqPayPICFCiqWrV6vXSt/egR/BZzq3Mt
 2b8QzNEZFidDcXiDYOpJMqAqRzJhLxc=
X-Google-Smtp-Source: ABdhPJx+kZgiqtHE83gyrUjGuqRHnPJ/ZA5J2uilHSbkmo2nTMzvQEOqk01MRFYk6AUKclwKjk3KaA==
X-Received: by 2002:a17:90a:3846:: with SMTP id
 l6mr1855201pjf.221.1644333873485; 
 Tue, 08 Feb 2022 07:24:33 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id nn12sm3148055pjb.24.2022.02.08.07.24.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:24:33 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 13/13] exec: Move translation declarations to 'translate-all.h'
Date: Tue,  8 Feb 2022 16:22:43 +0100
Message-Id: <20220208152243.16452-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Translation declarations are only useful to TCG accelerator.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/stubs/tcg-stub.c                  |   1 +
 accel/tcg/cpu-exec-common.c             |   1 +
 accel/tcg/cpu-exec.c                    |   1 +
 accel/tcg/cputlb.c                      |   1 +
 accel/tcg/hmp.c                         |   2 +-
 accel/tcg/internal.h                    |   2 +-
 accel/tcg/plugin-gen.c                  |   2 +-
 accel/tcg/tb-hash.h                     |   2 +-
 accel/tcg/tcg-accel-ops-icount.c        |   2 +-
 accel/tcg/tcg-accel-ops-mttcg.c         |   2 +-
 accel/tcg/tcg-accel-ops-rr.c            |   2 +-
 accel/tcg/tcg-accel-ops.c               |   2 +-
 accel/tcg/tcg-runtime.c                 |   1 +
 accel/tcg/translate-all.c               |   1 +
 accel/tcg/translator.c                  |   2 +-
 accel/tcg/user-exec.c                   |   2 +-
 bsd-user/main.c                         |   2 +-
 bsd-user/qemu.h                         |   2 +-
 gdbstub.c                               |   1 +
 hw/ppc/spapr_hcall.c                    |   1 +
 include/exec/cpu-all.h                  |   5 -
 include/exec/cpu_ldst.h                 |   1 +
 include/exec/exec-all.h                 | 350 ----------------------
 include/exec/ram_addr.h                 |   2 -
 include/exec/translate-all.h            | 372 +++++++++++++++++++++++-
 linux-user/main.c                       |   2 +-
 linux-user/user-internals.h             |   2 +-
 plugins/api.c                           |   2 +-
 plugins/core.c                          |   2 +-
 plugins/loader.c                        |   2 +-
 semihosting/console.c                   |   1 +
 target/alpha/cpu.c                      |   2 +-
 target/alpha/fpu_helper.c               |   2 +-
 target/alpha/helper.c                   |   1 +
 target/alpha/int_helper.c               |   2 +-
 target/alpha/mem_helper.c               |   1 +
 target/alpha/sys_helper.c               |   1 +
 target/alpha/translate.c                |   2 +-
 target/alpha/vax_helper.c               |   2 +-
 target/arm/cpu.c                        |   2 +-
 target/arm/debug_helper.c               |   2 +-
 target/arm/helper-a64.c                 |   2 +-
 target/arm/helper.c                     |   2 +-
 target/arm/m_helper.c                   |   2 +-
 target/arm/mte_helper.c                 |   2 +-
 target/arm/mve_helper.c                 |   2 +-
 target/arm/op_helper.c                  |   1 +
 target/arm/pauth_helper.c               |   2 +-
 target/arm/sve_helper.c                 |   2 +-
 target/arm/tlb_helper.c                 |   1 +
 target/arm/translate-a64.c              |   2 +-
 target/arm/translate-mve.c              |   2 +-
 target/arm/translate-neon.c             |   2 +-
 target/arm/translate-sve.c              |   2 +-
 target/arm/translate-vfp.c              |   2 +-
 target/arm/translate.c                  |   2 +-
 target/avr/cpu.c                        |   2 +-
 target/avr/helper.c                     |   1 +
 target/avr/translate.c                  |   2 +-
 target/cris/helper.c                    |   1 +
 target/cris/mmu.c                       |   1 +
 target/cris/op_helper.c                 |   1 +
 target/cris/translate.c                 |   2 +-
 target/hexagon/cpu.c                    |   2 +-
 target/hexagon/op_helper.c              |   1 +
 target/hppa/cpu.c                       |   1 +
 target/hppa/helper.c                    |   1 +
 target/hppa/mem_helper.c                |   1 +
 target/hppa/op_helper.c                 |   1 +
 target/hppa/translate.c                 |   2 +-
 target/i386/helper.c                    |   1 +
 target/i386/machine.c                   |   1 +
 target/i386/tcg/excp_helper.c           |   1 +
 target/i386/tcg/fpu_helper.c            |   2 +
 target/i386/tcg/helper-tcg.h            |   2 +-
 target/i386/tcg/int_helper.c            |   2 +-
 target/i386/tcg/mem_helper.c            |   1 +
 target/i386/tcg/misc_helper.c           |   1 +
 target/i386/tcg/mpx_helper.c            |   2 +-
 target/i386/tcg/seg_helper.c            |   1 +
 target/i386/tcg/sysemu/bpt_helper.c     |   1 +
 target/i386/tcg/sysemu/svm_helper.c     |   1 +
 target/i386/tcg/translate.c             |   2 +-
 target/i386/tcg/user/excp_helper.c      |   1 +
 target/i386/tcg/user/seg_helper.c       |   1 +
 target/m68k/fpu_helper.c                |   2 +-
 target/m68k/helper.c                    |   1 +
 target/m68k/op_helper.c                 |   1 +
 target/m68k/translate.c                 |   2 +-
 target/microblaze/cpu.c                 |   2 +-
 target/microblaze/helper.c              |   1 +
 target/microblaze/mmu.c                 |   1 +
 target/microblaze/op_helper.c           |   1 +
 target/microblaze/translate.c           |   2 +-
 target/mips/cpu.c                       |   2 +-
 target/mips/sysemu/cp0.c                |   1 +
 target/mips/sysemu/physaddr.c           |   2 +-
 target/mips/tcg/exception.c             |   1 +
 target/mips/tcg/fpu_helper.c            |   2 +-
 target/mips/tcg/ldst_helper.c           |   2 +-
 target/mips/tcg/msa_helper.c            |   2 +-
 target/mips/tcg/op_helper.c             |   2 +-
 target/mips/tcg/sysemu/cp0_helper.c     |   1 +
 target/mips/tcg/sysemu/special_helper.c |   2 +-
 target/mips/tcg/sysemu/tlb_helper.c     |   1 +
 target/nios2/helper.c                   |   1 +
 target/nios2/mmu.c                      |   1 +
 target/nios2/op_helper.c                |   1 +
 target/nios2/translate.c                |   2 +-
 target/openrisc/exception.c             |   1 +
 target/openrisc/exception_helper.c      |   1 +
 target/openrisc/interrupt.c             |   2 +-
 target/openrisc/interrupt_helper.c      |   2 +-
 target/openrisc/mmu.c                   |   1 +
 target/openrisc/sys_helper.c            |   1 +
 target/openrisc/translate.c             |   2 +-
 target/ppc/excp_helper.c                |   1 +
 target/ppc/fpu_helper.c                 |   2 +-
 target/ppc/helper_regs.c                |   1 +
 target/ppc/machine.c                    |   2 +-
 target/ppc/mem_helper.c                 |   2 +-
 target/ppc/misc_helper.c                |   1 +
 target/ppc/mmu-hash32.c                 |   2 +-
 target/ppc/mmu-hash64.c                 |   2 +-
 target/ppc/mmu-radix64.c                |   2 +-
 target/ppc/mmu_common.c                 |   2 +-
 target/ppc/mmu_helper.c                 |   1 +
 target/ppc/power8-pmu.c                 |   2 +-
 target/ppc/timebase_helper.c            |   2 +-
 target/ppc/translate.c                  |   2 +-
 target/ppc/user_only_helper.c           |   1 +
 target/riscv/bitmanip_helper.c          |   2 +-
 target/riscv/cpu.c                      |   2 +-
 target/riscv/cpu_helper.c               |   1 +
 target/riscv/csr.c                      |   1 +
 target/riscv/fpu_helper.c               |   2 +-
 target/riscv/m128_helper.c              |   2 +-
 target/riscv/op_helper.c                |   1 +
 target/riscv/pmp.c                      |   1 +
 target/riscv/translate.c                |   2 +-
 target/riscv/vector_helper.c            |   2 +-
 target/rx/cpu.c                         |   1 +
 target/rx/op_helper.c                   |   1 +
 target/rx/translate.c                   |   2 +-
 target/s390x/gdbstub.c                  |   1 +
 target/s390x/interrupt.c                |   2 +-
 target/s390x/mmu_helper.c               |   1 +
 target/s390x/sigp.c                     |   1 +
 target/s390x/tcg/cc_helper.c            |   1 +
 target/s390x/tcg/crypto_helper.c        |   2 +-
 target/s390x/tcg/excp_helper.c          |   1 +
 target/s390x/tcg/fpu_helper.c           |   2 +-
 target/s390x/tcg/int_helper.c           |   2 +-
 target/s390x/tcg/mem_helper.c           |   1 +
 target/s390x/tcg/misc_helper.c          |   1 +
 target/s390x/tcg/translate.c            |   2 +-
 target/s390x/tcg/vec_fpu_helper.c       |   2 +-
 target/s390x/tcg/vec_helper.c           |   2 +-
 target/sh4/cpu.c                        |   2 +-
 target/sh4/helper.c                     |   1 +
 target/sh4/op_helper.c                  |   1 +
 target/sh4/translate.c                  |   2 +-
 target/sparc/cpu.c                      |   2 +-
 target/sparc/fop_helper.c               |   1 +
 target/sparc/helper.c                   |   1 +
 target/sparc/ldst_helper.c              |   1 +
 target/sparc/machine.c                  |   2 +-
 target/sparc/mmu_helper.c               |   1 +
 target/sparc/translate.c                |   2 +-
 target/sparc/win_helper.c               |   2 +-
 target/tricore/cpu.c                    |   2 +-
 target/tricore/helper.c                 |   1 +
 target/tricore/op_helper.c              |   1 +
 target/tricore/translate.c              |   2 +-
 target/xtensa/dbg_helper.c              |   2 +-
 target/xtensa/exc_helper.c              |   1 +
 target/xtensa/fpu_helper.c              |   2 +-
 target/xtensa/helper.c                  |   1 +
 target/xtensa/mmu_helper.c              |   1 +
 target/xtensa/op_helper.c               |   2 +-
 target/xtensa/translate.c               |   2 +-
 target/xtensa/win_helper.c              |   2 +-
 tcg/region.c                            |   2 +-
 tcg/tcg-op.c                            |   2 +-
 tcg/tcg.c                               |   2 +-
 185 files changed, 553 insertions(+), 459 deletions(-)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index d8162673ae..7ff11ac604 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 void tb_flush(CPUState *cpu)
 {
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index be6fe45aa5..40fbffebe6 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -21,6 +21,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 bool tcg_allowed;
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8b4cd6c59d..fd96f2725c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -27,6 +27,7 @@
 #include "trace.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg.h"
 #include "qemu/atomic.h"
 #include "qemu/compiler.h"
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 5e0d0eebc3..158b2f0df7 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -21,6 +21,7 @@
 #include "qemu/main-loop.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/memory.h"
 #include "exec/cpu_ldst.h"
 #include "exec/cputlb.h"
diff --git a/accel/tcg/hmp.c b/accel/tcg/hmp.c
index d2ea352655..144767e0f8 100644
--- a/accel/tcg/hmp.c
+++ b/accel/tcg/hmp.c
@@ -2,7 +2,7 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "monitor/monitor.h"
 #include "sysemu/tcg.h"
 
diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 881bc1ede0..6cb7579b58 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -9,7 +9,7 @@
 #ifndef ACCEL_TCG_INTERNAL_H
 #define ACCEL_TCG_INTERNAL_H
 
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
                               target_ulong cs_base, uint32_t flags,
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 22d95fe1c3..bc9946ebfd 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -45,7 +45,7 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/plugin-gen.h"
 #include "exec/translator.h"
 
diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
index 0a273d9605..e0f8edef37 100644
--- a/accel/tcg/tb-hash.h
+++ b/accel/tcg/tb-hash.h
@@ -21,7 +21,7 @@
 #define EXEC_TB_HASH_H
 
 #include "exec/cpu-defs.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/xxhash.h"
 
 #ifdef CONFIG_SOFTMMU
diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
index bdaf2c943b..ff93abdf5a 100644
--- a/accel/tcg/tcg-accel-ops-icount.c
+++ b/accel/tcg/tcg-accel-ops-icount.c
@@ -30,7 +30,7 @@
 #include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-icount.h"
diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index dc421c8fd7..d49af140d4 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -31,7 +31,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/notify.h"
 #include "qemu/guest-random.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "hw/boards.h"
 
 #include "tcg-accel-ops.h"
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index a805fb6bdd..2678815a43 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -31,7 +31,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/notify.h"
 #include "qemu/guest-random.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-rr.h"
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index ea7dcad674..ed484eb226 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -32,7 +32,7 @@
 #include "sysemu/cpu-timers.h"
 #include "qemu/main-loop.h"
 #include "qemu/guest-random.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 #include "tcg-accel-ops.h"
 #include "tcg-accel-ops-mttcg.h"
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index e4e030043f..74f27be5ee 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "disas/disas.h"
 #include "exec/log.h"
 #include "tcg/tcg.h"
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bd71db59a9..b635e8ce14 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -24,6 +24,7 @@
 #include "trace.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg.h"
 #if defined(CONFIG_USER_ONLY)
 #include "qemu.h"
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index f06c314266..3aa252a2a0 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -11,7 +11,7 @@
 #include "qemu/error-report.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/gen-icount.h"
 #include "exec/log.h"
 #include "exec/translator.h"
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 6f5d4933f0..f463e61844 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg.h"
 #include "qemu/bitops.h"
 #include "exec/cpu_ldst.h"
diff --git a/bsd-user/main.c b/bsd-user/main.c
index f1d58e905e..0412d65cab 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -38,7 +38,7 @@
 #include "qemu/path.h"
 #include "qemu/help_option.h"
 #include "qemu/module.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 02921ac8b3..0ee7380c6a 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "qemu/units.h"
 #include "exec/cpu_ldst.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 #undef DEBUG_REMAP
 
diff --git a/gdbstub.c b/gdbstub.c
index 3c14c6a038..2f5ab828bf 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -31,6 +31,7 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "trace/trace-root.h"
+#include "exec/translate-all.h"
 #include "exec/gdbstub.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 222c1b6bbd..1873a0e719 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -8,6 +8,7 @@
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "helper_regs.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_cpu_core.h"
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 84188febfa..efe1832c61 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -429,11 +429,6 @@ void dump_opcount_info(GString *buf);
 
 #endif /* !CONFIG_USER_ONLY */
 
-/* accel/tcg/cpu-exec.c */
-int cpu_exec(CPUState *cpu);
-void tcg_exec_realizefn(CPUState *cpu, Error **errp);
-void tcg_exec_unrealizefn(CPUState *cpu);
-
 /**
  * cpu_set_cpustate_pointers(cpu)
  * @cpu: The cpu object
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 0932096d29..a1802306eb 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -62,6 +62,7 @@
 #ifndef CPU_LDST_H
 #define CPU_LDST_H
 
+#include "exec/cpu-defs.h"
 #include "exec/memopidx.h"
 #include "qemu/int128.h"
 #include "cpu.h"
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d2cb0981f4..c9d4be3fec 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -39,30 +39,6 @@ typedef ram_addr_t tb_page_addr_t;
 #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
 #endif
 
-void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns);
-void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
-                          target_ulong *data);
-
-/**
- * cpu_restore_state:
- * @cpu: the vCPU state is to be restore to
- * @searched_pc: the host PC the fault occurred at
- * @will_exit: true if the TB executed will be interrupted after some
-               cpu adjustments. Required for maintaining the correct
-               icount valus
- * @return: true if state was restored, false otherwise
- *
- * Attempt to restore the state for a fault occurring in translated
- * code. If the searched_pc is not in translated code no state is
- * restored and the function returns false.
- */
-bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
-
-void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
-void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
-void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
-void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
-
 /**
  * cpu_loop_exit_requested:
  * @cpu: The CPU state to be tested
@@ -381,207 +357,6 @@ static inline void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
 {
 }
 #endif
-/**
- * probe_access:
- * @env: CPUArchState
- * @addr: guest virtual address to look up
- * @size: size of the access
- * @access_type: read, write or execute permission
- * @mmu_idx: MMU index to use for lookup
- * @retaddr: return address for unwinding
- *
- * Look up the guest virtual address @addr.  Raise an exception if the
- * page does not satisfy @access_type.  Raise an exception if the
- * access (@addr, @size) hits a watchpoint.  For writes, mark a clean
- * page as dirty.
- *
- * Finally, return the host address for a page that is backed by RAM,
- * or NULL if the page requires I/O.
- */
-void *probe_access(CPUArchState *env, target_ulong addr, int size,
-                   MMUAccessType access_type, int mmu_idx, uintptr_t retaddr);
-
-static inline void *probe_write(CPUArchState *env, target_ulong addr, int size,
-                                int mmu_idx, uintptr_t retaddr)
-{
-    return probe_access(env, addr, size, MMU_DATA_STORE, mmu_idx, retaddr);
-}
-
-static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
-                               int mmu_idx, uintptr_t retaddr)
-{
-    return probe_access(env, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr);
-}
-
-/**
- * probe_access_flags:
- * @env: CPUArchState
- * @addr: guest virtual address to look up
- * @access_type: read, write or execute permission
- * @mmu_idx: MMU index to use for lookup
- * @nonfault: suppress the fault
- * @phost: return value for host address
- * @retaddr: return address for unwinding
- *
- * Similar to probe_access, loosely returning the TLB_FLAGS_MASK for
- * the page, and storing the host address for RAM in @phost.
- *
- * If @nonfault is set, do not raise an exception but return TLB_INVALID_MASK.
- * Do not handle watchpoints, but include TLB_WATCHPOINT in the returned flags.
- * Do handle clean pages, so exclude TLB_NOTDIRY from the returned flags.
- * For simplicity, all "mmio-like" flags are folded to TLB_MMIO.
- */
-int probe_access_flags(CPUArchState *env, target_ulong addr,
-                       MMUAccessType access_type, int mmu_idx,
-                       bool nonfault, void **phost, uintptr_t retaddr);
-
-#define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
-
-/* Estimated block size for TB allocation.  */
-/* ??? The following is based on a 2015 survey of x86_64 host output.
-   Better would seem to be some sort of dynamically sized TB array,
-   adapting to the block sizes actually being produced.  */
-#if defined(CONFIG_SOFTMMU)
-#define CODE_GEN_AVG_BLOCK_SIZE 400
-#else
-#define CODE_GEN_AVG_BLOCK_SIZE 150
-#endif
-
-/*
- * Translation Cache-related fields of a TB.
- * This struct exists just for convenience; we keep track of TB's in a binary
- * search tree, and the only fields needed to compare TB's in the tree are
- * @ptr and @size.
- * Note: the address of search data can be obtained by adding @size to @ptr.
- */
-struct tb_tc {
-    const void *ptr;    /* pointer to the translated code */
-    size_t size;
-};
-
-struct TranslationBlock {
-    target_ulong pc;   /* simulated PC corresponding to this block (EIP + CS base) */
-    target_ulong cs_base; /* CS base for this block */
-    uint32_t flags; /* flags defining in which context the code was generated */
-    uint32_t cflags;    /* compile flags */
-
-/* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
-#define CF_COUNT_MASK    0x000001ff
-#define CF_NO_GOTO_TB    0x00000200 /* Do not chain with goto_tb */
-#define CF_NO_GOTO_PTR   0x00000400 /* Do not chain with goto_ptr */
-#define CF_SINGLE_STEP   0x00000800 /* gdbstub single-step in effect */
-#define CF_LAST_IO       0x00008000 /* Last insn may be an IO access.  */
-#define CF_MEMI_ONLY     0x00010000 /* Only instrument memory ops */
-#define CF_USE_ICOUNT    0x00020000
-#define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
-#define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
-#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
-#define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
-#define CF_CLUSTER_SHIFT 24
-
-    /* Per-vCPU dynamic tracing state used to generate this TB */
-    uint32_t trace_vcpu_dstate;
-
-    /*
-     * Above fields used for comparing
-     */
-
-    /* size of target code for this block (1 <= size <= TARGET_PAGE_SIZE) */
-    uint16_t size;
-    uint16_t icount;
-
-    struct tb_tc tc;
-
-    /* first and second physical page containing code. The lower bit
-       of the pointer tells the index in page_next[].
-       The list is protected by the TB's page('s) lock(s) */
-    uintptr_t page_next[2];
-    tb_page_addr_t page_addr[2];
-
-    /* jmp_lock placed here to fill a 4-byte hole. Its documentation is below */
-    QemuSpin jmp_lock;
-
-    /* The following data are used to directly call another TB from
-     * the code of this one. This can be done either by emitting direct or
-     * indirect native jump instructions. These jumps are reset so that the TB
-     * just continues its execution. The TB can be linked to another one by
-     * setting one of the jump targets (or patching the jump instruction). Only
-     * two of such jumps are supported.
-     */
-    uint16_t jmp_reset_offset[2]; /* offset of original jump target */
-#define TB_JMP_RESET_OFFSET_INVALID 0xffff /* indicates no jump generated */
-    uintptr_t jmp_target_arg[2];  /* target address or offset */
-
-    /*
-     * Each TB has a NULL-terminated list (jmp_list_head) of incoming jumps.
-     * Each TB can have two outgoing jumps, and therefore can participate
-     * in two lists. The list entries are kept in jmp_list_next[2]. The least
-     * significant bit (LSB) of the pointers in these lists is used to encode
-     * which of the two list entries is to be used in the pointed TB.
-     *
-     * List traversals are protected by jmp_lock. The destination TB of each
-     * outgoing jump is kept in jmp_dest[] so that the appropriate jmp_lock
-     * can be acquired from any origin TB.
-     *
-     * jmp_dest[] are tagged pointers as well. The LSB is set when the TB is
-     * being invalidated, so that no further outgoing jumps from it can be set.
-     *
-     * jmp_lock also protects the CF_INVALID cflag; a jump must not be chained
-     * to a destination TB that has CF_INVALID set.
-     */
-    uintptr_t jmp_list_head;
-    uintptr_t jmp_list_next[2];
-    uintptr_t jmp_dest[2];
-};
-
-/* Hide the qatomic_read to make code a little easier on the eyes */
-static inline uint32_t tb_cflags(const TranslationBlock *tb)
-{
-    return qatomic_read(&tb->cflags);
-}
-
-/* current cflags for hashing/comparison */
-uint32_t curr_cflags(CPUState *cpu);
-
-/* TranslationBlock invalidate API */
-#if defined(CONFIG_USER_ONLY)
-void tb_invalidate_phys_addr(target_ulong addr);
-void tb_invalidate_phys_range(target_ulong start, target_ulong end);
-#else
-void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
-#endif
-void tb_flush(CPUState *cpu);
-void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
-TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
-                                   target_ulong cs_base, uint32_t flags,
-                                   uint32_t cflags);
-void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
-
-/* GETPC is the true target of the return instruction that we'll execute.  */
-#if defined(CONFIG_TCG_INTERPRETER)
-extern __thread uintptr_t tci_tb_ptr;
-# define GETPC() tci_tb_ptr
-#else
-# define GETPC() \
-    ((uintptr_t)__builtin_extract_return_addr(__builtin_return_address(0)))
-#endif
-
-/* The true return address will often point to a host insn that is part of
-   the next translated guest insn.  Adjust the address backward to point to
-   the middle of the call insn.  Subtracting one would do the job except for
-   several compressed mode architectures (arm, mips) which set the low bit
-   to indicate the compressed mode; subtracting two works around that.  It
-   is also the case that there are no host isas that contain a call insn
-   smaller than 4 bytes, so we don't worry about special-casing this.  */
-#define GETPC_ADJ   2
-
-#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_DEBUG_TCG)
-void assert_no_pages_locked(void);
-#else
-static inline void assert_no_pages_locked(void)
-{
-}
-#endif
 
 #if !defined(CONFIG_USER_ONLY)
 
@@ -596,131 +371,6 @@ static inline void assert_no_pages_locked(void)
  */
 struct MemoryRegionSection *iotlb_to_section(CPUState *cpu,
                                              hwaddr index, MemTxAttrs attrs);
-#endif
-
-#if defined(CONFIG_USER_ONLY)
-void mmap_lock(void);
-void mmap_unlock(void);
-bool have_mmap_lock(void);
-
-/**
- * get_page_addr_code() - user-mode version
- * @env: CPUArchState
- * @addr: guest virtual address of guest code
- *
- * Returns @addr.
- */
-static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
-                                                target_ulong addr)
-{
-    return addr;
-}
-
-/**
- * get_page_addr_code_hostp() - user-mode version
- * @env: CPUArchState
- * @addr: guest virtual address of guest code
- *
- * Returns @addr.
- *
- * If @hostp is non-NULL, sets *@hostp to the host address where @addr's content
- * is kept.
- */
-static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
-                                                      target_ulong addr,
-                                                      void **hostp)
-{
-    if (hostp) {
-        *hostp = g2h_untagged(addr);
-    }
-    return addr;
-}
-
-/**
- * adjust_signal_pc:
- * @pc: raw pc from the host signal ucontext_t.
- * @is_write: host memory operation was write, or read-modify-write.
- *
- * Alter @pc as required for unwinding.  Return the type of the
- * guest memory access -- host reads may be for guest execution.
- */
-MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
-
-/**
- * handle_sigsegv_accerr_write:
- * @cpu: the cpu context
- * @old_set: the sigset_t from the signal ucontext_t
- * @host_pc: the host pc, adjusted for the signal
- * @host_addr: the host address of the fault
- *
- * Return true if the write fault has been handled, and should be re-tried.
- */
-bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
-                                 uintptr_t host_pc, abi_ptr guest_addr);
-
-/**
- * cpu_loop_exit_sigsegv:
- * @cpu: the cpu context
- * @addr: the guest address of the fault
- * @access_type: access was read/write/execute
- * @maperr: true for invalid page, false for permission fault
- * @ra: host pc for unwinding
- *
- * Use the TCGCPUOps hook to record cpu state, do guest operating system
- * specific things to raise SIGSEGV, and jump to the main cpu loop.
- */
-void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
-                                         MMUAccessType access_type,
-                                         bool maperr, uintptr_t ra);
-
-/**
- * cpu_loop_exit_sigbus:
- * @cpu: the cpu context
- * @addr: the guest address of the alignment fault
- * @access_type: access was read/write/execute
- * @ra: host pc for unwinding
- *
- * Use the TCGCPUOps hook to record cpu state, do guest operating system
- * specific things to raise SIGBUS, and jump to the main cpu loop.
- */
-void QEMU_NORETURN cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
-                                        MMUAccessType access_type,
-                                        uintptr_t ra);
-
-#else
-static inline void mmap_lock(void) {}
-static inline void mmap_unlock(void) {}
-
-/**
- * get_page_addr_code() - full-system version
- * @env: CPUArchState
- * @addr: guest virtual address of guest code
- *
- * If we cannot translate and execute from the entire RAM page, or if
- * the region is not backed by RAM, returns -1. Otherwise, returns the
- * ram_addr_t corresponding to the guest code at @addr.
- *
- * Note: this function can trigger an exception.
- */
-tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr);
-
-/**
- * get_page_addr_code_hostp() - full-system version
- * @env: CPUArchState
- * @addr: guest virtual address of guest code
- *
- * See get_page_addr_code() (full-system version) for documentation on the
- * return value.
- *
- * Sets *@hostp (when @hostp is non-NULL) as follows.
- * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
- * to the host address where @addr's content is kept.
- *
- * Note: this function can trigger an exception.
- */
-tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
-                                        void **hostp);
-
 void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
 
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 64fb936c7c..4c0b614d56 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -147,8 +147,6 @@ static inline void qemu_ram_block_writeback(RAMBlock *block)
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
-void tb_invalidate_phys_range(ram_addr_t start, ram_addr_t end);
-
 static inline bool cpu_physical_memory_get_dirty(ram_addr_t start,
                                                  ram_addr_t length,
                                                  unsigned client)
diff --git a/include/exec/translate-all.h b/include/exec/translate-all.h
index 9f646389af..9e4f75b784 100644
--- a/include/exec/translate-all.h
+++ b/include/exec/translate-all.h
@@ -19,8 +19,299 @@
 #ifndef TRANSLATE_ALL_H
 #define TRANSLATE_ALL_H
 
-#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 
+/* allow to see translation results - the slowdown should be negligible, so we leave it */
+#define DEBUG_DISAS
+
+/* Page tracking code uses ram addresses in system mode, and virtual
+   addresses in userspace mode.  Define tb_page_addr_t to be an appropriate
+   type.  */
+#if defined(CONFIG_USER_ONLY)
+typedef abi_ulong tb_page_addr_t;
+#define TB_PAGE_ADDR_FMT TARGET_ABI_FMT_lx
+#else
+typedef ram_addr_t tb_page_addr_t;
+#define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
+#endif
+
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns);
+void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
+                          target_ulong *data);
+
+#define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
+
+/* Estimated block size for TB allocation.  */
+/* ??? The following is based on a 2015 survey of x86_64 host output.
+   Better would seem to be some sort of dynamically sized TB array,
+   adapting to the block sizes actually being produced.  */
+#if defined(CONFIG_SOFTMMU)
+#define CODE_GEN_AVG_BLOCK_SIZE 400
+#else
+#define CODE_GEN_AVG_BLOCK_SIZE 150
+#endif
+
+/*
+ * Translation Cache-related fields of a TB.
+ * This struct exists just for convenience; we keep track of TB's in a binary
+ * search tree, and the only fields needed to compare TB's in the tree are
+ * @ptr and @size.
+ * Note: the address of search data can be obtained by adding @size to @ptr.
+ */
+struct tb_tc {
+    const void *ptr;    /* pointer to the translated code */
+    size_t size;
+};
+
+struct TranslationBlock {
+    target_ulong pc;   /* simulated PC corresponding to this block (EIP + CS base) */
+    target_ulong cs_base; /* CS base for this block */
+    uint32_t flags; /* flags defining in which context the code was generated */
+    uint32_t cflags;    /* compile flags */
+
+/* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
+#define CF_COUNT_MASK    0x000001ff
+#define CF_NO_GOTO_TB    0x00000200 /* Do not chain with goto_tb */
+#define CF_NO_GOTO_PTR   0x00000400 /* Do not chain with goto_ptr */
+#define CF_SINGLE_STEP   0x00000800 /* gdbstub single-step in effect */
+#define CF_LAST_IO       0x00008000 /* Last insn may be an IO access.  */
+#define CF_MEMI_ONLY     0x00010000 /* Only instrument memory ops */
+#define CF_USE_ICOUNT    0x00020000
+#define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
+#define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
+#define CF_NOIRQ         0x00100000 /* Generate an uninterruptible TB */
+#define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
+#define CF_CLUSTER_SHIFT 24
+
+    /* Per-vCPU dynamic tracing state used to generate this TB */
+    uint32_t trace_vcpu_dstate;
+
+    /*
+     * Above fields used for comparing
+     */
+
+    /* size of target code for this block (1 <= size <= TARGET_PAGE_SIZE) */
+    uint16_t size;
+    uint16_t icount;
+
+    struct tb_tc tc;
+
+    /* first and second physical page containing code. The lower bit
+       of the pointer tells the index in page_next[].
+       The list is protected by the TB's page('s) lock(s) */
+    uintptr_t page_next[2];
+    tb_page_addr_t page_addr[2];
+
+    /* jmp_lock placed here to fill a 4-byte hole. Its documentation is below */
+    QemuSpin jmp_lock;
+
+    /* The following data are used to directly call another TB from
+     * the code of this one. This can be done either by emitting direct or
+     * indirect native jump instructions. These jumps are reset so that the TB
+     * just continues its execution. The TB can be linked to another one by
+     * setting one of the jump targets (or patching the jump instruction). Only
+     * two of such jumps are supported.
+     */
+    uint16_t jmp_reset_offset[2]; /* offset of original jump target */
+#define TB_JMP_RESET_OFFSET_INVALID 0xffff /* indicates no jump generated */
+    uintptr_t jmp_target_arg[2];  /* target address or offset */
+
+    /*
+     * Each TB has a NULL-terminated list (jmp_list_head) of incoming jumps.
+     * Each TB can have two outgoing jumps, and therefore can participate
+     * in two lists. The list entries are kept in jmp_list_next[2]. The least
+     * significant bit (LSB) of the pointers in these lists is used to encode
+     * which of the two list entries is to be used in the pointed TB.
+     *
+     * List traversals are protected by jmp_lock. The destination TB of each
+     * outgoing jump is kept in jmp_dest[] so that the appropriate jmp_lock
+     * can be acquired from any origin TB.
+     *
+     * jmp_dest[] are tagged pointers as well. The LSB is set when the TB is
+     * being invalidated, so that no further outgoing jumps from it can be set.
+     *
+     * jmp_lock also protects the CF_INVALID cflag; a jump must not be chained
+     * to a destination TB that has CF_INVALID set.
+     */
+    uintptr_t jmp_list_head;
+    uintptr_t jmp_list_next[2];
+    uintptr_t jmp_dest[2];
+};
+
+/* Hide the qatomic_read to make code a little easier on the eyes */
+static inline uint32_t tb_cflags(const TranslationBlock *tb)
+{
+    return qatomic_read(&tb->cflags);
+}
+
+/* current cflags for hashing/comparison */
+uint32_t curr_cflags(CPUState *cpu);
+
+/* TranslationBlock invalidate API */
+#if defined(CONFIG_USER_ONLY)
+void tb_invalidate_phys_addr(target_ulong addr);
+void tb_invalidate_phys_range(target_ulong start, target_ulong end);
+#else
+void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
+void tb_invalidate_phys_range(ram_addr_t start, ram_addr_t end);
+#endif
+void tb_flush(CPUState *cpu);
+void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
+TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
+                                   target_ulong cs_base, uint32_t flags,
+                                   uint32_t cflags);
+void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
+
+/* GETPC is the true target of the return instruction that we'll execute.  */
+#if defined(CONFIG_TCG_INTERPRETER)
+extern __thread uintptr_t tci_tb_ptr;
+# define GETPC() tci_tb_ptr
+#else
+# define GETPC() \
+    ((uintptr_t)__builtin_extract_return_addr(__builtin_return_address(0)))
+#endif
+
+/* The true return address will often point to a host insn that is part of
+   the next translated guest insn.  Adjust the address backward to point to
+   the middle of the call insn.  Subtracting one would do the job except for
+   several compressed mode architectures (arm, mips) which set the low bit
+   to indicate the compressed mode; subtracting two works around that.  It
+   is also the case that there are no host isas that contain a call insn
+   smaller than 4 bytes, so we don't worry about special-casing this.  */
+#define GETPC_ADJ   2
+
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_DEBUG_TCG)
+void assert_no_pages_locked(void);
+#else
+static inline void assert_no_pages_locked(void)
+{
+}
+#endif
+
+#if defined(CONFIG_USER_ONLY)
+void mmap_lock(void);
+void mmap_unlock(void);
+bool have_mmap_lock(void);
+
+/**
+ * get_page_addr_code() - user-mode version
+ * @env: CPUArchState
+ * @addr: guest virtual address of guest code
+ *
+ * Returns @addr.
+ */
+static inline tb_page_addr_t get_page_addr_code(CPUArchState *env,
+                                                target_ulong addr)
+{
+    return addr;
+}
+
+/**
+ * get_page_addr_code_hostp() - user-mode version
+ * @env: CPUArchState
+ * @addr: guest virtual address of guest code
+ *
+ * Returns @addr.
+ *
+ * If @hostp is non-NULL, sets *@hostp to the host address where @addr's content
+ * is kept.
+ */
+static inline tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env,
+                                                      target_ulong addr,
+                                                      void **hostp)
+{
+    if (hostp) {
+        *hostp = g2h_untagged(addr);
+    }
+    return addr;
+}
+
+/**
+ * adjust_signal_pc:
+ * @pc: raw pc from the host signal ucontext_t.
+ * @is_write: host memory operation was write, or read-modify-write.
+ *
+ * Alter @pc as required for unwinding.  Return the type of the
+ * guest memory access -- host reads may be for guest execution.
+ */
+MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write);
+
+/**
+ * handle_sigsegv_accerr_write:
+ * @cpu: the cpu context
+ * @old_set: the sigset_t from the signal ucontext_t
+ * @host_pc: the host pc, adjusted for the signal
+ * @host_addr: the host address of the fault
+ *
+ * Return true if the write fault has been handled, and should be re-tried.
+ */
+bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_t *old_set,
+                                 uintptr_t host_pc, abi_ptr guest_addr);
+
+/**
+ * cpu_loop_exit_sigsegv:
+ * @cpu: the cpu context
+ * @addr: the guest address of the fault
+ * @access_type: access was read/write/execute
+ * @maperr: true for invalid page, false for permission fault
+ * @ra: host pc for unwinding
+ *
+ * Use the TCGCPUOps hook to record cpu state, do guest operating system
+ * specific things to raise SIGSEGV, and jump to the main cpu loop.
+ */
+void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
+                                         MMUAccessType access_type,
+                                         bool maperr, uintptr_t ra);
+
+/**
+ * cpu_loop_exit_sigbus:
+ * @cpu: the cpu context
+ * @addr: the guest address of the alignment fault
+ * @access_type: access was read/write/execute
+ * @ra: host pc for unwinding
+ *
+ * Use the TCGCPUOps hook to record cpu state, do guest operating system
+ * specific things to raise SIGBUS, and jump to the main cpu loop.
+ */
+void QEMU_NORETURN cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
+                                        MMUAccessType access_type,
+                                        uintptr_t ra);
+
+#else
+static inline void mmap_lock(void) {}
+static inline void mmap_unlock(void) {}
+
+/**
+ * get_page_addr_code() - full-system version
+ * @env: CPUArchState
+ * @addr: guest virtual address of guest code
+ *
+ * If we cannot translate and execute from the entire RAM page, or if
+ * the region is not backed by RAM, returns -1. Otherwise, returns the
+ * ram_addr_t corresponding to the guest code at @addr.
+ *
+ * Note: this function can trigger an exception.
+ */
+tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr);
+
+/**
+ * get_page_addr_code_hostp() - full-system version
+ * @env: CPUArchState
+ * @addr: guest virtual address of guest code
+ *
+ * See get_page_addr_code() (full-system version) for documentation on the
+ * return value.
+ *
+ * Sets *@hostp (when @hostp is non-NULL) as follows.
+ * If the return value is -1, sets *@hostp to NULL. Otherwise, sets *@hostp
+ * to the host address where @addr's content is kept.
+ *
+ * Note: this function can trigger an exception.
+ */
+tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
+                                        void **hostp);
+
+#endif
 
 /* translate-all.c */
 struct page_collection *page_collection_lock(tb_page_addr_t start,
@@ -37,4 +328,83 @@ void page_protect(tb_page_addr_t page_addr);
 int page_unprotect(target_ulong address, uintptr_t pc);
 #endif
 
+/**
+ * probe_access:
+ * @env: CPUArchState
+ * @addr: guest virtual address to look up
+ * @size: size of the access
+ * @access_type: read, write or execute permission
+ * @mmu_idx: MMU index to use for lookup
+ * @retaddr: return address for unwinding
+ *
+ * Look up the guest virtual address @addr.  Raise an exception if the
+ * page does not satisfy @access_type.  Raise an exception if the
+ * access (@addr, @size) hits a watchpoint.  For writes, mark a clean
+ * page as dirty.
+ *
+ * Finally, return the host address for a page that is backed by RAM,
+ * or NULL if the page requires I/O.
+ */
+void *probe_access(CPUArchState *env, target_ulong addr, int size,
+                   MMUAccessType access_type, int mmu_idx, uintptr_t retaddr);
+
+static inline void *probe_write(CPUArchState *env, target_ulong addr, int size,
+                                int mmu_idx, uintptr_t retaddr)
+{
+    return probe_access(env, addr, size, MMU_DATA_STORE, mmu_idx, retaddr);
+}
+
+static inline void *probe_read(CPUArchState *env, target_ulong addr, int size,
+                               int mmu_idx, uintptr_t retaddr)
+{
+    return probe_access(env, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr);
+}
+
+/**
+ * probe_access_flags:
+ * @env: CPUArchState
+ * @addr: guest virtual address to look up
+ * @access_type: read, write or execute permission
+ * @mmu_idx: MMU index to use for lookup
+ * @nonfault: suppress the fault
+ * @phost: return value for host address
+ * @retaddr: return address for unwinding
+ *
+ * Similar to probe_access, loosely returning the TLB_FLAGS_MASK for
+ * the page, and storing the host address for RAM in @phost.
+ *
+ * If @nonfault is set, do not raise an exception but return TLB_INVALID_MASK.
+ * Do not handle watchpoints, but include TLB_WATCHPOINT in the returned flags.
+ * Do handle clean pages, so exclude TLB_NOTDIRY from the returned flags.
+ * For simplicity, all "mmio-like" flags are folded to TLB_MMIO.
+ */
+int probe_access_flags(CPUArchState *env, target_ulong addr,
+                       MMUAccessType access_type, int mmu_idx,
+                       bool nonfault, void **phost, uintptr_t retaddr);
+
+/**
+ * cpu_restore_state:
+ * @cpu: the vCPU state is to be restore to
+ * @searched_pc: the host PC the fault occurred at
+ * @will_exit: true if the TB executed will be interrupted after some
+               cpu adjustments. Required for maintaining the correct
+               icount valus
+ * @return: true if state was restored, false otherwise
+ *
+ * Attempt to restore the state for a fault occurring in translated
+ * code. If the searched_pc is not in translated code no state is
+ * restored and the function returns false.
+ */
+bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
+
+void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
+void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
+void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
+void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
+
+/* accel/tcg/cpu-exec.c */
+int cpu_exec(CPUState *cpu);
+void tcg_exec_realizefn(CPUState *cpu, Error **errp);
+void tcg_exec_unrealizefn(CPUState *cpu);
+
 #endif /* TRANSLATE_ALL_H */
diff --git a/linux-user/main.c b/linux-user/main.c
index 16def5215d..7bd4ce01e2 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -39,7 +39,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/plugin.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/gdbstub.h"
 #include "tcg/tcg.h"
 #include "qemu/timer.h"
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index a8fdd6933b..5fc8d91a3d 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -19,7 +19,7 @@
 #define LINUX_USER_USER_INTERNALS_H
 
 #include "exec/user/thunk.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/log.h"
 
 extern char *exec_path;
diff --git a/plugins/api.c b/plugins/api.c
index 19595460fb..974e6d6c29 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -38,7 +38,7 @@
 #include "qemu/plugin.h"
 #include "qemu/log.h"
 #include "tcg/tcg.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/ram_addr.h"
 #include "disas/disas.h"
 #include "plugin.h"
diff --git a/plugins/core.c b/plugins/core.c
index 792262da08..22a8ba8237 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -23,7 +23,7 @@
 #include "hw/core/cpu.h"
 #include "exec/cpu-common.h"
 
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
diff --git a/plugins/loader.c b/plugins/loader.c
index a4ec281692..2597198c42 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -27,7 +27,7 @@
 #include "qemu/xxhash.h"
 #include "qemu/plugin.h"
 #include "hw/core/cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/boards.h"
 #endif
diff --git a/semihosting/console.c b/semihosting/console.c
index ef6958d844..3c4ea3c2f8 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -20,6 +20,7 @@
 #include "semihosting/console.h"
 #include "exec/gdbstub.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/log.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index a8990d401b..34c7117b4a 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -23,7 +23,7 @@
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 
 static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
diff --git a/target/alpha/fpu_helper.c b/target/alpha/fpu_helper.c
index 3ff8bb456d..0841eed9b0 100644
--- a/target/alpha/fpu_helper.c
+++ b/target/alpha/fpu_helper.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index dcaa2d03ad..18acd2a8a0 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "fpu/softfloat-types.h"
 #include "exec/helper-proto.h"
 #include "qemu/qemu-print.h"
diff --git a/target/alpha/int_helper.c b/target/alpha/int_helper.c
index 5672696f6f..413fb02b1a 100644
--- a/target/alpha/int_helper.c
+++ b/target/alpha/int_helper.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 
diff --git a/target/alpha/mem_helper.c b/target/alpha/mem_helper.c
index 47283a0612..558ae46e67 100644
--- a/target/alpha/mem_helper.c
+++ b/target/alpha/mem_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 
 static void do_unaligned_access(CPUAlphaState *env, vaddr addr, uintptr_t retaddr)
diff --git a/target/alpha/sys_helper.c b/target/alpha/sys_helper.c
index 25f6cb8894..62de612245 100644
--- a/target/alpha/sys_helper.c
+++ b/target/alpha/sys_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 66768ab47a..341e2854ca 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -22,7 +22,7 @@
 #include "sysemu/cpus.h"
 #include "disas/disas.h"
 #include "qemu/host-utils.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
diff --git a/target/alpha/vax_helper.c b/target/alpha/vax_helper.c
index f94fb519db..a575808cfb 100644
--- a/target/alpha/vax_helper.c
+++ b/target/alpha/vax_helper.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9555f6707b..f082f61fdf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -31,7 +31,7 @@
 #include "hw/core/tcg-cpu-ops.h"
 #endif /* CONFIG_TCG */
 #include "internals.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "hw/qdev-properties.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 32f3caec23..71e781c479 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -8,7 +8,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internals.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 
 /* Return true if the linked breakpoint entry lbn passes its checks */
diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index d6a6fd73d9..78363f0912 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -28,7 +28,7 @@
 #include "qemu/bitops.h"
 #include "internals.h"
 #include "qemu/crc32c.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 883ea3a4e1..e38d5131fc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -20,7 +20,7 @@
 #include "qemu/bitops.h"
 #include "qemu/crc32c.h"
 #include "qemu/qemu-print.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include <zlib.h> /* For crc32 */
 #include "hw/irq.h"
 #include "semihosting/semihost.h"
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 648a3b3fc1..aa98f6d868 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -20,7 +20,7 @@
 #include "qemu/crc32c.h"
 #include "qemu/qemu-print.h"
 #include "qemu/log.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include <zlib.h> /* For crc32 */
 #include "semihosting/semihost.h"
 #include "sysemu/cpus.h"
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index d11a8c70d0..06d661632d 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -21,7 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "internals.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/ram_addr.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 846962bf4c..637c760881 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -23,7 +23,7 @@
 #include "vec_internal.h"
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 70b42b55fd..a7a70ae5f6 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -22,6 +22,7 @@
 #include "exec/helper-proto.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 
 #define SIGNBIT (uint32_t)0x80000000
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index cd6df18150..1ad474ffe1 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internals.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 07be55b7e1..33d257bdac 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internals.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index b79004e0cc..ae4d05f910 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -9,6 +9,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5a1df25f91..4d43cc6f19 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
 #include "qemu/log.h"
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4267d43cc7..b8df82d6b9 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/gen-icount.h"
 #include "translate.h"
 #include "translate-a32.h"
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 3854dd3516..acea38a2fc 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -23,7 +23,7 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/gen-icount.h"
 #include "translate.h"
 #include "translate-a32.h"
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 33ca1bcfac..70e18c225c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 17f796e32a..ad908b8690 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -23,7 +23,7 @@
 #include "qemu/osdep.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/gen-icount.h"
 #include "translate.h"
 #include "translate-a32.h"
diff --git a/target/arm/translate.c b/target/arm/translate.c
index bf2196b9e2..e375919ac7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -23,7 +23,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
 #include "qemu/log.h"
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5d70e34dd5..9dfd48b108 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -21,7 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/qemu-print.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "cpu.h"
 #include "disas/dis-asm.h"
 
diff --git a/target/avr/helper.c b/target/avr/helper.c
index c27f702901..ad5e0d9545 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/address-spaces.h"
 #include "exec/helper-proto.h"
 
diff --git a/target/avr/translate.c b/target/avr/translate.c
index af8a3e0f9c..1ef6341915 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -22,7 +22,7 @@
 #include "qemu/qemu-print.h"
 #include "tcg/tcg.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
diff --git a/target/cris/helper.c b/target/cris/helper.c
index 91e4aeb178..bdd0c89240 100644
--- a/target/cris/helper.c
+++ b/target/cris/helper.c
@@ -25,6 +25,7 @@
 #include "mmu.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 
diff --git a/target/cris/mmu.c b/target/cris/mmu.c
index b574ec6e5b..501910fddf 100644
--- a/target/cris/mmu.c
+++ b/target/cris/mmu.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "mmu.h"
 
 #ifdef DEBUG
diff --git a/target/cris/op_helper.c b/target/cris/op_helper.c
index d55a18a213..5e16831550 100644
--- a/target/cris/op_helper.c
+++ b/target/cris/op_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 
 //#define CRIS_OP_HELPER_DEBUG
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 3656cd6db1..1a81ec3c4e 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -26,7 +26,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-proto.h"
 #include "mmu.h"
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index fa9bd702d6..e3e88e101f 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -19,7 +19,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "internal.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
 #include "fpu/softfloat-helpers.h"
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 057baf9a48..c71d1edc7f 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -18,6 +18,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 5f46ba801e..07797b7afd 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -25,6 +25,7 @@
 #include "cpu.h"
 #include "qemu/module.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "fpu/softfloat.h"
 
 
diff --git a/target/hppa/helper.c b/target/hppa/helper.c
index e2758d8df3..77d6e98fd0 100644
--- a/target/hppa/helper.c
+++ b/target/hppa/helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "fpu/softfloat.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/qemu-print.h"
 
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index 5046cc8f9d..286d699ce1 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "hw/core/cpu.h"
 #include "trace.h"
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index 2810361be0..f2e4a8fb8c 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "qemu/timer.h"
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 5c0b1eb274..a2c71df793 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "disas/disas.h"
 #include "qemu/host-utils.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 0639aea11b..6c93f4412d 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -21,6 +21,7 @@
 #include "qapi/qapi-events-run-state.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "sysemu/runstate.h"
 #include "kvm/kvm_i386.h"
 #ifndef CONFIG_USER_ONLY
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 6202f47793..f6c9e86661 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "hw/isa/isa.h"
 #include "migration/cpu.h"
 #include "kvm/hyperv.h"
diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
index bdae887d0a..16af80a935 100644
--- a/target/i386/tcg/excp_helper.c
+++ b/target/i386/tcg/excp_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/log.h"
 #include "sysemu/runstate.h"
 #include "exec/helper-proto.h"
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index cdd8e9f947..d957a0bc4e 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -21,6 +21,8 @@
 #include <math.h>
 #include "cpu.h"
 #include "tcg-cpu.h"
+#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "fpu/softfloat-macros.h"
diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 0a4401e917..55a49fb074 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -20,7 +20,7 @@
 #ifndef I386_HELPER_TCG_H
 #define I386_HELPER_TCG_H
 
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 /* Maximum instruction code size */
 #define TARGET_MAX_INSN_SIZE 16
diff --git a/target/i386/tcg/int_helper.c b/target/i386/tcg/int_helper.c
index 599ac968b0..841c2a1f47 100644
--- a/target/i386/tcg/int_helper.c
+++ b/target/i386/tcg/int_helper.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "qapi/error.h"
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index e3cdafd2d4..8f6e19b4bd 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index 24a0eaa3d5..57dcd7ec04 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "helper-tcg.h"
 
 /*
diff --git a/target/i386/tcg/mpx_helper.c b/target/i386/tcg/mpx_helper.c
index 22423eedcd..dc6156ada8 100644
--- a/target/i386/tcg/mpx_helper.c
+++ b/target/i386/tcg/mpx_helper.c
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "helper-tcg.h"
 
 
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index baa905a0cd..1e9df14863 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -23,6 +23,7 @@
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "helper-tcg.h"
diff --git a/target/i386/tcg/sysemu/bpt_helper.c b/target/i386/tcg/sysemu/bpt_helper.c
index 4d96a48a3c..ccd4ff0dfd 100644
--- a/target/i386/tcg/sysemu/bpt_helper.c
+++ b/target/i386/tcg/sysemu/bpt_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "tcg/helper-tcg.h"
 
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 2b6f450af9..78cdd1eb96 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "tcg/helper-tcg.h"
 
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 77878cd832..d590306d82 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -21,7 +21,7 @@
 #include "qemu/host-utils.h"
 #include "cpu.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/cpu_ldst.h"
 #include "exec/translator.h"
diff --git a/target/i386/tcg/user/excp_helper.c b/target/i386/tcg/user/excp_helper.c
index cd507e2a1b..a70c1b08b3 100644
--- a/target/i386/tcg/user/excp_helper.c
+++ b/target/i386/tcg/user/excp_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/helper-tcg.h"
 
 void x86_cpu_record_sigsegv(CPUState *cs, vaddr addr,
diff --git a/target/i386/tcg/user/seg_helper.c b/target/i386/tcg/user/seg_helper.c
index 67481b0aa8..86d303ff0a 100644
--- a/target/i386/tcg/user/seg_helper.c
+++ b/target/i386/tcg/user/seg_helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "tcg/helper-tcg.h"
 #include "tcg/seg_helper.h"
diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index fdc4937e29..c36d4dd569 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -21,7 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "softfloat.h"
 
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 5728e48585..820e3d54e3 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 8decc61240..8bd094af31 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "semihosting/semihost.h"
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index af43c8eab8..d28dda58c8 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -21,7 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "qemu/log.h"
 #include "qemu/qemu-print.h"
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index aed200dcff..3302fe38b5 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -27,7 +27,7 @@
 #include "cpu.h"
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "fpu/softfloat-helpers.h"
 
 static const struct {
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index a607fe68e5..d3760ff32d 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/host-utils.h"
 #include "exec/log.h"
 
diff --git a/target/microblaze/mmu.c b/target/microblaze/mmu.c
index 75651979a9..c2e8a0f9d6 100644
--- a/target/microblaze/mmu.c
+++ b/target/microblaze/mmu.c
@@ -22,6 +22,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 static unsigned int tlb_decode_size(unsigned int f)
 {
diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
index 5b745d0928..1215545333 100644
--- a/target/microblaze/op_helper.c
+++ b/target/microblaze/op_helper.c
@@ -24,6 +24,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 2561b904b9..22d7338824 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -21,7 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 4aae23934b..7ebe31e4e1 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -28,7 +28,7 @@
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
 #include "sysemu/qtest.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-clock.h"
 #include "semihosting/semihost.h"
diff --git a/target/mips/sysemu/cp0.c b/target/mips/sysemu/cp0.c
index bae37f515b..00cdf0cbc2 100644
--- a/target/mips/sysemu/cp0.c
+++ b/target/mips/sysemu/cp0.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 /* Called for updates to CP0_Status.  */
 void sync_c0_status(CPUMIPSState *env, CPUMIPSState *cpu, int tc)
diff --git a/target/mips/sysemu/physaddr.c b/target/mips/sysemu/physaddr.c
index 1918633aa1..22f70c845d 100644
--- a/target/mips/sysemu/physaddr.c
+++ b/target/mips/sysemu/physaddr.c
@@ -18,7 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "../internal.h"
 
 static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 0b21e0872b..040e20b5c6 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -24,6 +24,7 @@
 #include "internal.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 target_ulong exception_resume_pc(CPUMIPSState *env)
 {
diff --git a/target/mips/tcg/fpu_helper.c b/target/mips/tcg/fpu_helper.c
index 8ce56ed7c8..9a2658e6b0 100644
--- a/target/mips/tcg/fpu_helper.c
+++ b/target/mips/tcg/fpu_helper.c
@@ -24,7 +24,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
 #include "fpu_helper.h"
diff --git a/target/mips/tcg/ldst_helper.c b/target/mips/tcg/ldst_helper.c
index d0bd0267b2..18fd868a2d 100644
--- a/target/mips/tcg/ldst_helper.c
+++ b/target/mips/tcg/ldst_helper.c
@@ -23,7 +23,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/memop.h"
 #include "internal.h"
 
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 5667b1f0a1..2bb33c4e62 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "tcg/tcg.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "exec/memop.h"
 #include "fpu/softfloat.h"
diff --git a/target/mips/tcg/op_helper.c b/target/mips/tcg/op_helper.c
index ef3dafcbb3..a57cd74409 100644
--- a/target/mips/tcg/op_helper.c
+++ b/target/mips/tcg/op_helper.c
@@ -22,7 +22,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/memop.h"
 #include "fpu_helper.h"
 
diff --git a/target/mips/tcg/sysemu/cp0_helper.c b/target/mips/tcg/sysemu/cp0_helper.c
index aae2af6ecc..37ae357636 100644
--- a/target/mips/tcg/sysemu/cp0_helper.c
+++ b/target/mips/tcg/sysemu/cp0_helper.c
@@ -28,6 +28,7 @@
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 
 /* SMP helpers.  */
diff --git a/target/mips/tcg/sysemu/special_helper.c b/target/mips/tcg/sysemu/special_helper.c
index f4f8fe8afc..8699b489de 100644
--- a/target/mips/tcg/sysemu/special_helper.c
+++ b/target/mips/tcg/sysemu/special_helper.c
@@ -22,7 +22,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "internal.h"
 
 /* Specials */
diff --git a/target/mips/tcg/sysemu/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
index 73254d1929..10ed2a5987 100644
--- a/target/mips/tcg/sysemu/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "hw/mips/cpudevs.h"
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index e5c98650e1..518c8e83a5 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "exec/helper-proto.h"
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 2545c06761..8746d53a52 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -22,6 +22,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "mmu.h"
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index a59003855a..0e45724a42 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -23,6 +23,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/main-loop.h"
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index f9abc2fdd2..6f2aff796e 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -24,7 +24,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "tcg/tcg-op.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "disas/disas.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
diff --git a/target/openrisc/exception.c b/target/openrisc/exception.c
index 28c1fce523..c752d84a2a 100644
--- a/target/openrisc/exception.c
+++ b/target/openrisc/exception.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exception.h"
 
 void QEMU_NORETURN raise_exception(OpenRISCCPU *cpu, uint32_t excp)
diff --git a/target/openrisc/exception_helper.c b/target/openrisc/exception_helper.c
index d02a1cf0aa..f87dbd50a1 100644
--- a/target/openrisc/exception_helper.c
+++ b/target/openrisc/exception_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "exception.h"
 
diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index e5724f5371..cddc17b780 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/gdbstub.h"
 #include "qemu/host-utils.h"
 #ifndef CONFIG_USER_ONLY
diff --git a/target/openrisc/interrupt_helper.c b/target/openrisc/interrupt_helper.c
index ab4ea88b69..bcc8607e52 100644
--- a/target/openrisc/interrupt_helper.c
+++ b/target/openrisc/interrupt_helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 
 void HELPER(rfe)(CPUOpenRISCState *env)
diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index d7e1320998..2078667508 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -22,6 +22,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/gdbstub.h"
 #include "qemu/host-utils.h"
 #include "hw/loader.h"
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index 48674231e7..b3b3519c10 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "exception.h"
 #ifndef CONFIG_USER_ONLY
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index ca79e609da..5db817b897 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "disas/disas.h"
 #include "tcg/tcg-op.h"
 #include "qemu/log.h"
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index cbac63d53c..89c61f8fd6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "internal.h"
 #include "helper_regs.h"
 
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index e5c29b53b8..b8f3af97e7 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "internal.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 5b12cb03c9..07e61c5266 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "sysemu/kvm.h"
 #include "helper_regs.h"
 #include "power8-pmu.h"
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index a503e00ddc..81db34dc9b 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -1,6 +1,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "sysemu/kvm.h"
 #include "helper_regs.h"
 #include "mmu-hash64.h"
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 39945d9ea5..e924586390 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/host-utils.h"
 #include "qemu/main-loop.h"
 #include "exec/helper-proto.h"
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 129432be01..6742c98ae7 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 3957aab2dc..c4ee7068ba 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
 #include "internal.h"
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index da9fe99ff8..2a22777d8c 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
 #include "sysemu/hw_accel.h"
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 040c055bff..a3bdb8ea4a 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 6512ee031c..f9392c0399 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -24,7 +24,7 @@
 #include "kvm_ppc.h"
 #include "mmu-hash64.h"
 #include "mmu-hash32.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/log.h"
 #include "helper_regs.h"
 #include "qemu/error-report.h"
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index a2a52a12c3..e52de17223 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -25,6 +25,7 @@
 #include "mmu-hash64.h"
 #include "mmu-hash32.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/log.h"
 #include "helper_regs.h"
 #include "qemu/error-report.h"
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 236e8e66e9..8f8132b233 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -13,7 +13,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "helper_regs.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
diff --git a/target/ppc/timebase_helper.c b/target/ppc/timebase_helper.c
index af378318c1..2193550956 100644
--- a/target/ppc/timebase_helper.c
+++ b/target/ppc/timebase_helper.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c2f436f8d3..d862256f25 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -22,7 +22,7 @@
 #include "cpu.h"
 #include "internal.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
 #include "qemu/host-utils.h"
diff --git a/target/ppc/user_only_helper.c b/target/ppc/user_only_helper.c
index 7ff76f7a06..3c21f8c637 100644
--- a/target/ppc/user_only_helper.c
+++ b/target/ppc/user_only_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "internal.h"
 
 void ppc_cpu_record_sigsegv(CPUState *cs, vaddr address,
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index f1b5e5549f..6fd7b53010 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1cb0436187..be9458e83f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -23,7 +23,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "internals.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/qdev-properties.h"
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 327a2c4f1d..20bf62e8ea 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -22,6 +22,7 @@
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 45f04c701a..1815d4ee91 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "sysemu/cpu-timers.h"
 
 /* CSR function table public API */
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 4a5982d594..cff7363f5b 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -19,7 +19,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/host-utils.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "internals.h"
diff --git a/target/riscv/m128_helper.c b/target/riscv/m128_helper.c
index 7bf115b85e..86e7114f38 100644
--- a/target/riscv/m128_helper.c
+++ b/target/riscv/m128_helper.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/main-loop.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 
 target_ulong HELPER(divu_i128)(CPURISCVState *env,
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 1a75ba11e6..bad53d6c87 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "qemu/main-loop.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 
 /* Exceptions processing helpers */
diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index 81b61bb65c..0b5f23aaa5 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -25,6 +25,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 static void pmp_write_cfg(CPURISCVState *env, uint32_t addr_index,
     uint8_t val);
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f0bbe80875..cdfc102de3 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -22,7 +22,7 @@
 #include "tcg/tcg-op.h"
 #include "disas/disas.h"
 #include "exec/cpu_ldst.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 020d2e841f..327b79f35d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -21,7 +21,7 @@
 #include "qemu/bitops.h"
 #include "cpu.h"
 #include "exec/memop.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 #include "tcg/tcg-gvec-desc.h"
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 25a4aa2976..da5f8e1d2c 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -23,6 +23,7 @@
 #include "qemu-common.h"
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "hw/loader.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 11f952d340..41f343111d 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/bitops.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 5db8f79a82..3a585a3214 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -20,7 +20,7 @@
 #include "qemu/bswap.h"
 #include "qemu/qemu-print.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index a5d69d0e0b..ae3a9bacb6 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/gdbstub.h"
 #include "qemu/bitops.h"
 #include "sysemu/hw_accel.h"
diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
index 5195f060ec..6936114911 100644
--- a/target/s390x/interrupt.c
+++ b/target/s390x/interrupt.c
@@ -11,7 +11,7 @@
 #include "cpu.h"
 #include "kvm/kvm_s390x.h"
 #include "s390x-internal.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "hw/s390x/ioinst.h"
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index b04b57c235..fcd98811d6 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -24,6 +24,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "trace.h"
 #include "hw/hw.h"
 #include "hw/s390x/storage-keys.h"
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 9dd977349a..08af079f04 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -15,6 +15,7 @@
 #include "sysemu/runstate.h"
 #include "exec/address-spaces.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "sysemu/tcg.h"
 #include "trace.h"
 #include "qapi/qapi-types-machine.h"
diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
index 8d04097f78..5eb95c2254 100644
--- a/target/s390x/tcg/cc_helper.c
+++ b/target/s390x/tcg/cc_helper.c
@@ -23,6 +23,7 @@
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 
diff --git a/target/s390x/tcg/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
index 138d9e7ad9..f45a0db5d7 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -15,7 +15,7 @@
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 
 uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index be6c966cfa..967e6544dc 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -25,6 +25,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/timer.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "hw/s390x/ioinst.h"
 #include "exec/address-spaces.h"
diff --git a/target/s390x/tcg/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
index 4067205405..ff97a3cfc5 100644
--- a/target/s390x/tcg/fpu_helper.c
+++ b/target/s390x/tcg/fpu_helper.c
@@ -22,7 +22,7 @@
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
diff --git a/target/s390x/tcg/int_helper.c b/target/s390x/tcg/int_helper.c
index 954542388a..490ae6814b 100644
--- a/target/s390x/tcg/int_helper.c
+++ b/target/s390x/tcg/int_helper.c
@@ -22,7 +22,7 @@
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "tcg_s390x.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index b5523ef3c7..8b97790e3c 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -25,6 +25,7 @@
 #include "tcg_s390x.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "qemu/int128.h"
 #include "qemu/atomic128.h"
diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index aab9c47747..0fe6147b5d 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -28,6 +28,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/timer.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "qapi/error.h"
 #include "tcg_s390x.h"
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 46dea73357..8430775171 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -32,7 +32,7 @@
 #include "cpu.h"
 #include "s390x-internal.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-op-gvec.h"
 #include "qemu/log.h"
diff --git a/target/s390x/tcg/vec_fpu_helper.c b/target/s390x/tcg/vec_fpu_helper.c
index 1a77993471..561407bd95 100644
--- a/target/s390x/tcg/vec_fpu_helper.c
+++ b/target/s390x/tcg/vec_fpu_helper.c
@@ -16,7 +16,7 @@
 #include "vec.h"
 #include "tcg_s390x.h"
 #include "tcg/tcg-gvec-desc.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/s390x/tcg/vec_helper.c b/target/s390x/tcg/vec_helper.c
index ededf13cf0..405f593889 100644
--- a/target/s390x/tcg/vec_helper.c
+++ b/target/s390x/tcg/vec_helper.c
@@ -17,7 +17,7 @@
 #include "tcg/tcg-gvec-desc.h"
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 void HELPER(gvec_vbperm)(void *v1, const void *v2, const void *v3,
                          uint32_t desc)
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 06b2691dc4..c2a1da2730 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -24,7 +24,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "migration/vmstate.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "fpu/softfloat-helpers.h"
 
 static void superh_cpu_set_pc(CPUState *cs, vaddr value)
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 6a620e36fc..af02fae0af 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -21,6 +21,7 @@
 
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/log.h"
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index 752669825f..7d7ec41f5a 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -20,6 +20,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 43bc88b7b3..a4f0e838c3 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -22,7 +22,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 55268ed2a1..54cbca84e5 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -22,7 +22,7 @@
 #include "cpu.h"
 #include "qemu/module.h"
 #include "qemu/qemu-print.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "hw/qdev-properties.h"
 #include "qapi/visitor.h"
 
diff --git a/target/sparc/fop_helper.c b/target/sparc/fop_helper.c
index f54fa9b959..64b56b9a40 100644
--- a/target/sparc/fop_helper.c
+++ b/target/sparc/fop_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/sparc/helper.c b/target/sparc/helper.c
index c4358bba84..ab971a64d0 100644
--- a/target/sparc/helper.c
+++ b/target/sparc/helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/timer.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index ec4fae78c3..4598b70f4f 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -23,6 +23,7 @@
 #include "tcg/tcg.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "asi.h"
 
diff --git a/target/sparc/machine.c b/target/sparc/machine.c
index 44b9e7d75d..1370ba6b1d 100644
--- a/target/sparc/machine.c
+++ b/target/sparc/machine.c
@@ -1,6 +1,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/timer.h"
 
 #include "migration/cpu.h"
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 346a6dfa35..f04504a20b 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/qemu-print.h"
 #include "trace.h"
 
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 4c7c7b5347..216b2a4168 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -23,7 +23,7 @@
 #include "cpu.h"
 #include "disas/disas.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/cpu_ldst.h"
 
diff --git a/target/sparc/win_helper.c b/target/sparc/win_helper.c
index 3a7c0ff943..9d1e7fc387 100644
--- a/target/sparc/win_helper.c
+++ b/target/sparc/win_helper.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/helper-proto.h"
 #include "trace.h"
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index b95682b7f0..c5cc8a0707 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "qemu/error-report.h"
 
 static inline void set_feature(CPUTriCoreState *env, int feature)
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 1db32808e8..8a235ea502 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -19,6 +19,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "fpu/softfloat-helpers.h"
 #include "qemu/qemu-print.h"
 
diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
index 9476d10d00..f7d3026266 100644
--- a/target/tricore/op_helper.c
+++ b/target/tricore/op_helper.c
@@ -19,6 +19,7 @@
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include <zlib.h> /* for crc32 */
 
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 417edbd3f0..4a967d1e9a 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -21,7 +21,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "disas/disas.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 #include "exec/cpu_ldst.h"
 #include "qemu/qemu-print.h"
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index ce2a820c60..25f203d3a8 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -31,7 +31,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/address-spaces.h"
 
 static void tb_invalidate_virtual_addr(CPUXtensaState *env, uint32_t vaddr)
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index d4823a65cd..3e96c440fc 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -32,6 +32,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 void HELPER(exception)(CPUXtensaState *env, uint32_t excp)
 {
diff --git a/target/xtensa/fpu_helper.c b/target/xtensa/fpu_helper.c
index d2a10cc797..6d2f0a2e17 100644
--- a/target/xtensa/fpu_helper.c
+++ b/target/xtensa/fpu_helper.c
@@ -31,7 +31,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "fpu/softfloat.h"
 
 enum {
diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
index e0a9caab4b..d1899226c2 100644
--- a/target/xtensa/helper.c
+++ b/target/xtensa/helper.c
@@ -29,6 +29,7 @@
 #include "qemu/log.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
 #include "qemu/error-report.h"
diff --git a/target/xtensa/mmu_helper.c b/target/xtensa/mmu_helper.c
index fa66e8e867..3be1f3a649 100644
--- a/target/xtensa/mmu_helper.c
+++ b/target/xtensa/mmu_helper.c
@@ -34,6 +34,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 
 #define XTENSA_MPU_SEGMENT_MASK 0x0000001f
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index d85d3516d6..fc03f2f624 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -30,7 +30,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "exec/cpu_ldst.h"
 #include "qemu/timer.h"
 
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index b1491ed625..4f3bca77ba 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -31,7 +31,7 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "disas/disas.h"
 #include "tcg/tcg-op.h"
 #include "qemu/log.h"
diff --git a/target/xtensa/win_helper.c b/target/xtensa/win_helper.c
index 5a1555360a..368f983731 100644
--- a/target/xtensa/win_helper.c
+++ b/target/xtensa/win_helper.c
@@ -31,7 +31,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 
 static void copy_window_from_phys(CPUXtensaState *env,
                                   uint32_t window, uint32_t phys, uint32_t n)
diff --git a/tcg/region.c b/tcg/region.c
index 9cc30d4922..b970d7cdda 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg.h"
 #include "tcg-internal.h"
 
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 61b492d89f..90098cef71 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-op.h"
 #include "tcg/tcg-mo.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 5d2f0d8b10..0c33c2e578 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -42,7 +42,7 @@
    instructions */
 #define NO_CPU_IO_DEFS
 
-#include "exec/exec-all.h"
+#include "exec/translate-all.h"
 #include "tcg/tcg-op.h"
 
 #if UINTPTR_MAX == UINT32_MAX
-- 
2.34.1


