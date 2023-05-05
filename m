Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487BE6F7A8A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:17:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujww-0002lC-Pz; Thu, 04 May 2023 21:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvi-0001RZ-17
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:17 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvc-00089Y-Kz
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:12 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1aaed87d8bdso8145815ad.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248885; x=1685840885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DEKsMZI/zUfkQT1MmyPbn61GggAQ1+G6neGMUD2jNA=;
 b=WosXFaqsUulL7thsQXNZjk84RJERejE5L0sGw31PNKIh+6Jy1VxPllSjYJYzQ1RWOV
 t9UVl0aimiO/ezMgrpHZwzunV9Qbfuvk4rlpV50oZCYfxpS577v24r8+czfDIl+/D4Mi
 nzYewBAK96s4Hq9CUiNa9KFrHwkVCpoRLjFj/bV+yL7ioutR6/i4vHt9ZPZ/pqTIK4L9
 2vavACP060EeEHwujsp6MSl8AajvS2Mo+gOtESZs10WwSbFCJRwGf9Kk6lbIYlNe7iYj
 L/Depl7BENacVzCjVv6RE69BK4fL3q3FbdSAYXRyDS75YBWlNfuL25c7Qir6cixzzDXt
 ODMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248885; x=1685840885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DEKsMZI/zUfkQT1MmyPbn61GggAQ1+G6neGMUD2jNA=;
 b=juIggRYTnczwBSOJGWz1/MUlVNkGQiciZSNCLxouY9VyhJO5CpowsUZKbRZg85O5fe
 b8OlAAz0/uHv6tYN5umVX8T+JEe4ukwl4h9L7Nu1hH15X6RUhyzZ/519HYChxohphsjG
 CPnEt2bAwKkPISw4Al6jKBancLBNExqGWE2uoECIF7q/uLcYsA/VgqBSxY9NrP88WuBh
 TG4N/zEMZrseFax0Pb1+WbD5PHAEfuCTx8c9lb+PLo25zNeXdMGwUhjZ1YNSr7bFi2C4
 wAaqTknUIWSpIe+r/nkPsk/VRnd9bOD2N/oKgx9aF3m+13Lk68NGDQ7x9whBZvKpGQ0S
 BgSQ==
X-Gm-Message-State: AC+VfDzrcA6O/8RxTmVh6C7wdsZxib1FKmFvju0RRTar/J9Wl2PCTi9I
 sr7cLifWYXeXUKK73oHZEGS43beuMcvnmg==
X-Google-Smtp-Source: ACHHUZ6cmoOVqlPCfXqEBipYh6X0xxUGN7nVmv24JLrSh+GOugIDPEad4E/PQemmcj50N3Q2s+BWgw==
X-Received: by 2002:a17:902:ce8f:b0:1aa:ebcc:dd5e with SMTP id
 f15-20020a170902ce8f00b001aaebccdd5emr6472467plg.65.1683248885507; 
 Thu, 04 May 2023 18:08:05 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:08:05 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 83/89] target/riscv: add CPU QOM header
Date: Fri,  5 May 2023 11:02:35 +1000
Message-Id: <20230505010241.21812-84-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

QMP CPU commands are usually implemented by a separated file,
<arch>-qmp-cmds.c, to allow them to be build only for softmmu targets.
This file uses a CPU QOM header with basic QOM declarations for the
arch.

We'll introduce query-cpu-definitions for RISC-V CPUs in the next patch,
but first we need a cpu-qom.h header with the definitions of
TYPE_RISCV_CPU and RISCVCPUClass declarations. These were moved from
cpu.h to the new file, and cpu.h now includes "cpu-qom.h".

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230411183511.189632-2-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu-qom.h | 70 ++++++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.h     | 46 +--------------------------
 2 files changed, 71 insertions(+), 45 deletions(-)
 create mode 100644 target/riscv/cpu-qom.h

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
new file mode 100644
index 0000000000..b9318e0783
--- /dev/null
+++ b/target/riscv/cpu-qom.h
@@ -0,0 +1,70 @@
+/*
+ * QEMU RISC-V CPU QOM header
+ *
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef RISCV_CPU_QOM_H
+#define RISCV_CPU_QOM_H
+
+#include "hw/core/cpu.h"
+#include "qom/object.h"
+
+#define TYPE_RISCV_CPU "riscv-cpu"
+
+#define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
+#define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
+#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
+
+#define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
+#define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
+#define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
+#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
+#define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
+#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
+#define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
+#define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
+#define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
+#define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
+#define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
+#define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
+#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
+
+#if defined(TARGET_RISCV32)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
+#elif defined(TARGET_RISCV64)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
+#endif
+
+typedef struct CPUArchState CPURISCVState;
+
+OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
+
+/**
+ * RISCVCPUClass:
+ * @parent_realize: The parent class' realize handler.
+ * @parent_phases: The parent class' reset phase handlers.
+ *
+ * A RISCV CPU model.
+ */
+struct RISCVCPUClass {
+    /*< private >*/
+    CPUClass parent_class;
+    /*< public >*/
+    DeviceRealize parent_realize;
+    ResettablePhases parent_phases;
+};
+
+#endif /* RISCV_CPU_QOM_H */
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d1f888a790..de7e43126a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -28,6 +28,7 @@
 #include "qemu/int128.h"
 #include "cpu_bits.h"
 #include "qapi/qapi-types-common.h"
+#include "cpu-qom.h"
 
 #define TCG_GUEST_DEFAULT_MO 0
 
@@ -37,32 +38,6 @@
  */
 #define TARGET_INSN_START_EXTRA_WORDS 1
 
-#define TYPE_RISCV_CPU "riscv-cpu"
-
-#define RISCV_CPU_TYPE_SUFFIX "-" TYPE_RISCV_CPU
-#define RISCV_CPU_TYPE_NAME(name) (name RISCV_CPU_TYPE_SUFFIX)
-#define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
-
-#define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
-#define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
-#define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
-#define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
-#define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
-#define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
-#define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
-#define TYPE_RISCV_CPU_SIFIVE_E34       RISCV_CPU_TYPE_NAME("sifive-e34")
-#define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
-#define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
-#define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
-#define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
-#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
-
-#if defined(TARGET_RISCV32)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
-#elif defined(TARGET_RISCV64)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
-#endif
-
 #define RV(x) ((target_ulong)1 << (x - 'A'))
 
 /* Consider updating misa_ext_cfgs[] when adding new MISA bits here */
@@ -109,8 +84,6 @@ typedef enum {
 
 #define MAX_RISCV_PMPS (16)
 
-typedef struct CPUArchState CPURISCVState;
-
 #if !defined(CONFIG_USER_ONLY)
 #include "pmp.h"
 #include "debug.h"
@@ -395,23 +368,6 @@ struct CPUArchState {
     uint64_t kvm_timer_frequency;
 };
 
-OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
-
-/*
- * RISCVCPUClass:
- * @parent_realize: The parent class' realize handler.
- * @parent_phases: The parent class' reset phase handlers.
- *
- * A RISCV CPU model.
- */
-struct RISCVCPUClass {
-    /* < private > */
-    CPUClass parent_class;
-    /* < public > */
-    DeviceRealize parent_realize;
-    ResettablePhases parent_phases;
-};
-
 /*
  * map is a 16-bit bitmap: the most significant set bit in map is the maximum
  * satp mode that is supported. It may be chosen by the user and must respect
-- 
2.40.0


