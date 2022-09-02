Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF55AA694
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 05:49:30 +0200 (CEST)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTxgO-0003Sr-W5
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 23:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oTxds-00022j-Az
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 23:46:53 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1oTxdq-0001dI-1d
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 23:46:52 -0400
Received: by mail-pg1-x535.google.com with SMTP id q9so872575pgq.6
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 20:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date;
 bh=uacSV7uLaGM4xOYGO2lNdMG7oAsCoYq9Rer2MC8lULs=;
 b=QaLFodDGmBFMYVSVoycRQ+v0+6uVdBRegT/g1bITdZLHaWKIvQwJ3YjZRlcJp+LHOO
 5Ml2m+ypeFteTJaLvdIJiYxwVY7IxSUQ5l7M03lFBWL5VdKk2ZVVC5EynSSSV4fIJDtV
 rPbwprKzG5NnLjyHsE1VVF0Z54lpDwYrfhkHCCjpTfJqduTSspJ2lN0iJOCghFGp5uPh
 0H41okt2asPIEYy7JTIHHxwscx9d0sapXLTqDPeMmoj+xKQcvu/v1UGgWMbL4gkAFXU2
 YHHiU8XhrMpaoi+tcOPTIoACWawO3YI4I2KTZIfCoZzPsL5hT71GrVoqzJJZkkbkYlXO
 AN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date;
 bh=uacSV7uLaGM4xOYGO2lNdMG7oAsCoYq9Rer2MC8lULs=;
 b=4dFS7zw/FT3hXve/iyyZT1FYqoClf40b4mA4kp+afYlSFEQtF3Sch9qK18qYUNCfJ8
 KDYSdjhom7zTWW46p8dJNGEY/WdUA4N0byZFcVWLGAnFteeuxLJC3twUKSFaJPZc9pZy
 Gs7iZbLnpcNyvvTi4w7+TMD9PFjqQ6jAPrxctEErcIqT2Q/dvW3fK+JxeHkXLvZ7aK3r
 f3minIoVeYmIoWuFFIxXTG3vxCZeztU6jflK91igYnfOpoa1bo2VWHRN6i0UjGVfnrZX
 oG/Gn5crtP/95cuwH2a9c+UXzQ5ftIgWCDPJCH3t/AihOr7L1hFuA5BNbtT+4iV0FbRt
 J1Gg==
X-Gm-Message-State: ACgBeo3yFLSgQVjMtmQQNs6VUjLwbWQDQACvYHQLjN7p5+9T1iUI8of6
 4rDun+6kgqeGajQBH0gP8Hgrgg==
X-Google-Smtp-Source: AA6agR5wYo/DoV6kaA0Oe7lQuu/AkDS+wkG0qhQXp6NPr8weN+LJhoJobsHFtCG8l4bUrh/HHRI0qw==
X-Received: by 2002:a05:6a00:1a91:b0:52f:29e7:c32c with SMTP id
 e17-20020a056a001a9100b0052f29e7c32cmr34982623pfv.10.1662090407825; 
 Thu, 01 Sep 2022 20:46:47 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 2-20020a170902c20200b00174f43129fbsm384077pll.47.2022.09.01.20.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 20:46:47 -0700 (PDT)
Subject: [PATCH] RISC-V: Add support for Ztso
Date: Thu,  1 Sep 2022 20:44:12 -0700
Message-Id: <20220902034412.8918-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: qemu-devel@nongnu.org
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=palmer@rivosinc.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ztso, the RISC-V extension that provides the TSO memory model, was
recently frozen.  This provides support for Ztso on targets that are
themselves TSO.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

My first thought was to just add the TCG barries to load/store and AMOs
that as defined by Ztso, but after poking around a bit it seems that's
frowned upon by check_tcg_memory_orders_compatible().  I feel like the
indicated performance issues could probably be worked out, but this is
about the same amount of code and doesn't suffer from those performance
issues.  That said, it just seems wrong to couple targets to a RISC-V
feature.

This is also essentially un-tested, aside from poking around in the
generated device tree to make sure "_ztso" shows up when enabled.  I
don't think there's really any way to test it further, as we don't have
any TSO-enabled workloads and we were defacto providing TSO already on
x86 targets (which I'm assuming are what the vast majority of users are
running).
---
 target/riscv/cpu.c       | 12 ++++++++++++
 target/riscv/cpu.h       | 16 +++++++++++++++-
 target/riscv/translate.c |  6 ++++++
 tcg/i386/tcg-target.h    |  1 +
 tcg/s390x/tcg-target.h   |  1 +
 5 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac6f82ebd0..d05b8c7c4a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -919,6 +919,15 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
     DEFINE_PROP_BOOL("zhinxmin", RISCVCPU, cfg.ext_zhinxmin, false),
 
+#ifdef TCG_TARGET_SUPPORTS_MCTCG_RVTSO
+    /*
+     * We only support Ztso on targets that themselves are already TSO, which
+     * means there's no way to provide just RVWMO on those targets.  Instead
+     * just default to telling the guest that Ztso is enabled.:
+     */
+    DEFINE_PROP_BOOL("ztso", RISCVCPU, cfg.ext_ztso, true),
+#endif
+
     /* Vendor-specific custom extensions */
     DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOps, false),
 
@@ -1094,6 +1103,9 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
         ISA_EDATA_ENTRY(zksed, ext_zksed),
         ISA_EDATA_ENTRY(zksh, ext_zksh),
         ISA_EDATA_ENTRY(zkt, ext_zkt),
+#ifdef TCG_TARGET_SUPPORTS_MCTCG_RVTSO
+        ISA_EDATA_ENTRY(ztso, ext_ztso),
+#endif
         ISA_EDATA_ENTRY(zve32f, ext_zve32f),
         ISA_EDATA_ENTRY(zve64f, ext_zve64f),
         ISA_EDATA_ENTRY(zhinx, ext_zhinx),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5c7acc055a..879e11a950 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -27,8 +27,19 @@
 #include "qom/object.h"
 #include "qemu/int128.h"
 #include "cpu_bits.h"
+#include "tcg-target.h"
 
-#define TCG_GUEST_DEFAULT_MO 0
+/*
+ * RISC-V has two memory models: TSO is a bit weaker than Intel (MMIO and
+ * fetch), and WMO is approximately equivilant to Arm MCA.  Rather than
+ * enforcing orderings on most accesses, just default to the target memory
+ * order.
+ */
+#ifdef TCG_TARGET_SUPPORTS_MCTCG_RVTSO
+# define TCG_GUEST_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
+#else
+# define TCG_GUEST_DEFAULT_MO (0)
+#endif
 
 /*
  * RISC-V-specific extra insn start words:
@@ -433,6 +444,9 @@ struct RISCVCPUConfig {
     bool ext_zve32f;
     bool ext_zve64f;
     bool ext_zmmul;
+#ifdef TCG_TARGET_SUPPORTS_MCTCG_RVTSO
+    bool ext_ztso;
+#endif
     bool rvv_ta_all_1s;
 
     uint32_t mvendorid;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 63b04e8a94..00fd75b971 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -109,6 +109,9 @@ typedef struct DisasContext {
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
+#ifdef TCG_TARGET_SUPPORTS_MCTCG_RVTSO
+    bool ztso;
+#endif
     /* TCG of the current insn_start */
     TCGOp *insn_start;
 } DisasContext;
@@ -1109,6 +1112,9 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
     ctx->pm_mask_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENABLED);
     ctx->pm_base_enabled = FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENABLED);
+#ifdef TCG_TARGET_SUPPORTS_MCTCG_RVTSO
+    ctx->ztso = cpu->cfg.ext_ztso;
+#endif
     ctx->zero = tcg_constant_tl(0);
 }
 
diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 00fcbe297d..2a43d54fcd 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -236,6 +236,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 #include "tcg/tcg-mo.h"
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
+#define TCG_TARGET_SUPPORTS_MCTCG_RVTSO 1
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP  have_movbe
 
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 23e2063667..f423c124a0 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -171,6 +171,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_MEMORY_BSWAP   1
 
 #define TCG_TARGET_DEFAULT_MO (TCG_MO_ALL & ~TCG_MO_ST_LD)
+#define TCG_TARGET_SUPPORTS_MCTCG_RVTSO 1
 
 static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
                                             uintptr_t jmp_rw, uintptr_t addr)
-- 
2.34.1


