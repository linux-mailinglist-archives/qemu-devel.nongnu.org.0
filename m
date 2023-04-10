Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A946DC6CC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 14:31:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plqfM-0007ST-BB; Mon, 10 Apr 2023 08:30:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plqer-0007Ag-Mb
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 08:30:06 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1plqeo-0000tq-UE
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 08:30:05 -0400
Received: by mail-oi1-x22c.google.com with SMTP id bf5so3050794oib.8
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 05:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681129801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QQVAabeAJXG93R9o2+wybfrTUqipz7vwVTHH4p1nQcc=;
 b=dkiqu/aTnyD3IXaXxzQiOJz2WPJeLXwU5/yfjrucXPCvZyURP9CBZTMGBYe8Xhsm17
 TgTSsPGaVjXq/LVBxvfHKj/tv7VnvAf+aITYdTXAlz6ZqlmM85hFszbGWRhfA2TBv2gY
 tDE5ZofV73oFaf6eLtrm2UYG3cYOHSS0VfkzWOq8Z/O+G5eXWp9sSVjvj5B4lssl0nMg
 3mPvHAkgyEY2pw38LVSeRvz1rFvGRHRtaeU0n0SxHAguWnjdlvTSusXhBFa5fyN8t8EG
 isN50P08Uq3XJ7vkfdwALM0Bcua+WIbUWsHmjlprBaR6EKRPRLQSXGNPhEmQhkVWpYjc
 9IgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681129801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QQVAabeAJXG93R9o2+wybfrTUqipz7vwVTHH4p1nQcc=;
 b=fCxtxcRInJkQauDuH1cA15BOFZZ0hL/bEYFiGrZAXWDXHGQsNM49TnRausUhFj7w36
 ECVQcT884Ir9OdTiVeeHL5kPGOeIdw2aRNX8jTSkxLv74RnzKonlAJZafxXVD7dkokMf
 KL2MoquzBl/dcJNOIAjf8qf2c78BZbfrHdjgiUhl8k+i0bKjpSn96Jh4qylAVAdPxX16
 4ze3RmlDcd588NGedX1+T0o2+alW26n8MInt4fS0jfVKimRRHMT21/RrdI5X72x1fIG7
 QMnk/K8zHD1BDPwH89QmHTkPkmMoiObBxWbEPRUl4pyfBIjphe5NWGMjW4d8E+KUXjPl
 Z15A==
X-Gm-Message-State: AAQBX9dLYiKuUCwO23HBJZH2KVBe2Tj/wlzMB6ZF646Vxzb3mICNwd1t
 B2x3if81RFyDGg2yzU+FALcSJdkDJ/gKX0aEHzI=
X-Google-Smtp-Source: AKy350b5y/gGpGqg2jB8WE73FEy7r038wHNPXEeQQgzDU42hmzapxIurR8h+5r4PkI6lgw3Sb8QG0g==
X-Received: by 2002:a05:6808:1a11:b0:386:e309:cfbf with SMTP id
 bk17-20020a0568081a1100b00386e309cfbfmr5966386oib.13.1681129801386; 
 Mon, 10 Apr 2023 05:30:01 -0700 (PDT)
Received: from grind.. ([191.255.108.232]) by smtp.gmail.com with ESMTPSA id
 o13-20020a056808124d00b00387160bcd46sm4297016oiv.46.2023.04.10.05.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 05:30:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 3/4] target/riscv: add 'static' attribute of
 query-cpu-definitions
Date: Mon, 10 Apr 2023 09:29:44 -0300
Message-Id: <20230410122945.77439-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410122945.77439-1-dbarboza@ventanamicro.com>
References: <20230410122945.77439-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22c.google.com
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

'static' is defined in the QMP doc as:

"whether a CPU definition is static and will not change depending on
QEMU version, machine type, machine options and accelerator options. A
static model is always migration-safe."

For RISC-V we'll consider all named CPUs as static since their
extensions can't be changed by user input. Generic CPUs will be
considered non-static.

We aren't ready to make the change for generic CPUs yet because we're
using the same class init for every CPU. We'll deal with it next.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu-qom.h        | 3 +++
 target/riscv/cpu.c            | 6 ++++++
 target/riscv/riscv-qmp-cmds.c | 2 ++
 3 files changed, 11 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index b9318e0783..687cb6f4d0 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -54,6 +54,7 @@ OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
 
 /**
  * RISCVCPUClass:
+ * @static_model: See CpuDefinitionInfo::static
  * @parent_realize: The parent class' realize handler.
  * @parent_phases: The parent class' reset phase handlers.
  *
@@ -65,6 +66,8 @@ struct RISCVCPUClass {
     /*< public >*/
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
+
+    bool static_model;
 };
 
 #endif /* RISCV_CPU_QOM_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cb68916fce..30a1e74ea6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -1679,6 +1679,12 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     resettable_class_set_parent_phases(rc, NULL, riscv_cpu_reset_hold, NULL,
                                        &mcc->parent_phases);
 
+    /*
+     * Consider all models to be static. Each CPU is free to
+     * set it to false if needed.
+     */
+    mcc->static_model = true;
+
     cc->class_by_name = riscv_cpu_class_by_name;
     cc->has_work = riscv_cpu_has_work;
     cc->dump_state = riscv_cpu_dump_state;
diff --git a/target/riscv/riscv-qmp-cmds.c b/target/riscv/riscv-qmp-cmds.c
index 128677add9..639f2c052e 100644
--- a/target/riscv/riscv-qmp-cmds.c
+++ b/target/riscv/riscv-qmp-cmds.c
@@ -30,6 +30,7 @@
 static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
+    RISCVCPUClass *cc = RISCV_CPU_CLASS(oc);
     CpuDefinitionInfoList **cpu_list = user_data;
     CpuDefinitionInfo *info = g_malloc0(sizeof(*info));
     const char *typename = object_class_get_name(oc);
@@ -37,6 +38,7 @@ static void riscv_cpu_add_definition(gpointer data, gpointer user_data)
     info->name = g_strndup(typename,
                            strlen(typename) - strlen("-" TYPE_RISCV_CPU));
     info->q_typename = g_strdup(typename);
+    info->q_static = cc->static_model;
 
     QAPI_LIST_PREPEND(*cpu_list, info);
 }
-- 
2.39.2


