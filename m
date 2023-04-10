Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111136DC996
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 18:54:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plulP-0003m6-Cy; Mon, 10 Apr 2023 12:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulN-0003kH-FR
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 12:53:05 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plulL-0007Kq-K2
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 12:53:05 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1842d8976d9so6707373fac.9
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 09:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681145582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7f97QPiu1Fd+OM3S7vziX0p5A2QzwngIPHhNMODXrEY=;
 b=l9INqYBFLZyPzMeDTQOk6gz63K1Wi/MHuYpxW1lEAe4dsqf8jFftiVmFuTJzRdAbqQ
 Um7K2kCS62Y3eu9ElC4mAolpTLqr07WvA/TPBHtU7Rj1z0f3/t4G8jP0MgpaRfD8aIgN
 SGasgdURy+xBA5KnRFGWtT7pwcGOK2QfkYcZo7CYbSM6aQbPj6PafPf6M8NV7zJ7zP52
 ZeMGmLUfYAr4x5Vr44igk4U18qDybIkQZsVWQN5RqdkhBn7Aao5EM6dkdIO5zoIZigok
 5qIXodMXQeuwK2t5h6GadGfcz7sesGltu+HMIp7BnchIgcKqWtDVLeZyx2nTC7P42xt0
 U9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681145582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7f97QPiu1Fd+OM3S7vziX0p5A2QzwngIPHhNMODXrEY=;
 b=4Pj3yEPKOOWDBlRNe/brd85EXBeQj4Fqnn2ad46lJpbYsh/qDMTLAe0gLOjLVpju9G
 CNXO5dwSmx9603kkQOZhC6R+4sAJzC7Yz0V667C+Sxyu5B3ihDKZbOXzqjTekSZfZtLC
 QFZNoq1mOZT12E5xws2DvJgUQbMiq1+vGemEfD77dCCH+Y3anxza5LLjk7qo74/3GUez
 scI0EH8kfgyMB/0V5d7vznck2HkClK1gxz59+rC+jleSe1pEQltLincoWZNuTW7Nsc4Q
 3joysaZozZYv9EWI0oBv1U/FCho1bF9I3otqVm9uVODAMVOG/GbJbGE5f5DqwYHGVTVw
 LYTg==
X-Gm-Message-State: AAQBX9caNcZETDJ9p/N/Nv1CKhxBfnm9IThVxB/Zvd2FYxwQVb7a6o9U
 Us5dw68D+YSvtzjijDjd/Tc3Uo4TnB48wo6wOQA=
X-Google-Smtp-Source: AKy350YOHCSpNQv7O37Je/6stb+fB+u8KvhN6BbYRpbNaDiBTFHXG9NvZcQGyLqmqO4S13+3Nkn4Cg==
X-Received: by 2002:a05:6870:5583:b0:176:317d:16ee with SMTP id
 n3-20020a056870558300b00176317d16eemr6683501oao.19.1681145582143; 
 Mon, 10 Apr 2023 09:53:02 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 zq36-20020a0568718ea400b0017f647294f5sm4191896oab.16.2023.04.10.09.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 09:53:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 1/4] target/riscv: add CPU QOM header
Date: Mon, 10 Apr 2023 13:52:48 -0300
Message-Id: <20230410165251.99107-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410165251.99107-1-dbarboza@ventanamicro.com>
References: <20230410165251.99107-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2b.google.com
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

QMP CPU commands are usually implemented by a separated file,
<arch>-qmp-cmds.c, to allow them to be build only for softmmu targets.
This file uses a CPU QOM header with basic QOM declarations for the
arch.

We'll introduce query-cpu-definitions for RISC-V CPUs in the next patch,
but first we need a cpu-qom.h header with the definitions of
TYPE_RISCV_CPU and RISCVCPUClass declarations. These were moved from
cpu.h to the new file, and cpu.h now includes "cpu-qom.h".

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
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
index cbf3de2708..d830a64713 100644
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
 
 /*
@@ -103,8 +78,6 @@ enum {
 
 #define MAX_RISCV_PMPS (16)
 
-typedef struct CPUArchState CPURISCVState;
-
 #if !defined(CONFIG_USER_ONLY)
 #include "pmp.h"
 #include "debug.h"
@@ -389,23 +362,6 @@ struct CPUArchState {
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
2.39.2


