Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AE23542E2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:35:59 +0200 (CEST)
Received: from localhost ([::1]:32870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQKc-0003iv-5l
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQH7-00015e-Bd
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQGz-0001ee-4p
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:21 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5-20020a05600c0245b029011a8273f85eso1600559wmj.1
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQzvBFeWhvKvIkJdxBA81jOzJjQOZ8kAoP8n1T0jsyc=;
 b=OIB4su6LhoWkep3GSsaGQn1nVYPACaMK0RvF+KRcLxZkoJ0PckQbCZ3noryR/8zMdD
 0ZyOwTe+hLohW3RQCaBRhedVn2aHjvNrRIzi1hK5E2NbwSIV5z5SHs50yjd1Saq+7ISq
 EnJtfWsdj7x0w/0zo7GjcYGDRlv+ImCVFkw+SF8HcCUWwlNVYwZOxtNCd9QBwqG70BEN
 LrNhhZBS9ZFC/D3MW1qya/IgLSwb1OY3UFz+LeLZgaZGSj+sitjs8aNgEVFTL5xAo2VZ
 2/Md6y0So+FAuryfZ8tRl6NkidpJp7TKumk8dKkFknZcE8XyLJ+R8/wX43vk/LIqWV+J
 CKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DQzvBFeWhvKvIkJdxBA81jOzJjQOZ8kAoP8n1T0jsyc=;
 b=uRscjjrmsQI5BQoCwJ7yz6nSEaVdmHT8p8HnKuELYyGTM6F2USCNxbq0Dc+wsrJven
 gumMUS5LmVcpT51Oj+f1lxgvM0XpXzW8OuWxRf5RuDSm57zgi8u2Ib4f4s1l/d93d+tf
 RrVd22pXcn2J/I1RgFo/PncDuefT2UBN43bnXsIGlt8JHsaNWbvLfoQkdVEslnxZmC/q
 22SfWFbuseYnGwnKpw5yQ5fsloVe00kuP4bNdVzYEHTyguiibSzJe/vS9f0UX7CiVAZa
 P7Wv4HjQb4Fii8TbNYOwcTgrxNjingLFFQ+N3dtcU493ZQ7ftrI1jeSY3elSp6IFiPx6
 40DA==
X-Gm-Message-State: AOAM5306dIQ7t6xu8YCi0PuXIMEME/awNsJgpexOakIq0R9a+0u8lHuS
 fGAWFYZ5aAxyhsyHCEPFW0Vx5GnLjcXZJA==
X-Google-Smtp-Source: ABdhPJwO9+xzDOYdsHp7y26sG+VVGmVKlYV7zLIB3aMjf/f4XS2GTYVgqWbsmsCPVyMXMaeTE6u7kQ==
X-Received: by 2002:a05:600c:2145:: with SMTP id
 v5mr25813635wml.65.1617633131572; 
 Mon, 05 Apr 2021 07:32:11 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:10 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 04/27] arc: TCG and decoder glue code and helpers
Date: Mon,  5 Apr 2021 15:31:15 +0100
Message-Id: <20210405143138.17016-5-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
---
 target/arc/extra_mapping.def   |  63 +++++
 target/arc/helper.c            | 281 +++++++++++++++++++++++
 target/arc/helper.h            |  39 ++++
 target/arc/op_helper.c         | 406 +++++++++++++++++++++++++++++++++
 target/arc/semfunc_mapping.def | 321 ++++++++++++++++++++++++++
 5 files changed, 1110 insertions(+)
 create mode 100644 target/arc/extra_mapping.def
 create mode 100644 target/arc/helper.c
 create mode 100644 target/arc/helper.h
 create mode 100644 target/arc/op_helper.c
 create mode 100644 target/arc/semfunc_mapping.def

diff --git a/target/arc/extra_mapping.def b/target/arc/extra_mapping.def
new file mode 100644
index 0000000000..50517f058e
--- /dev/null
+++ b/target/arc/extra_mapping.def
@@ -0,0 +1,63 @@
+/*
+ * QEMU ARC EXTRA MAPPING
+ *
+ * Copyright (c) 2020 Synopsys Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * http://www.gnu.org/licenses/lgpl-2.1.html
+ */
+
+SEMANTIC_FUNCTION(ENTER, 0)
+SEMANTIC_FUNCTION(LEAVE, 0)
+MAPPING(enter_s, ENTER, 0)
+MAPPING(leave_s, LEAVE, 0)
+
+SEMANTIC_FUNCTION(SR, 2)
+SEMANTIC_FUNCTION(SRL, 2)
+SEMANTIC_FUNCTION(SYNC, 0)
+MAPPING(sr, SR, 2, 1, 0)
+MAPPING(srl, SRL, 2, 1, 0)
+MAPPING(sync, SYNC, 0)
+
+SEMANTIC_FUNCTION(TRAP, 1)
+SEMANTIC_FUNCTION(RTIE, 0)
+SEMANTIC_FUNCTION(SLEEP, 1)
+MAPPING(trap_s, TRAP, 1, 0)
+MAPPING(rtie, RTIE, 0)
+MAPPING(sleep, SLEEP, 1, 0)
+
+SEMANTIC_FUNCTION(SWI, 1)
+CONSTANT(SWI, swi, 0, 0)
+MAPPING(swi, SWI, 1, 0)
+CONSTANT(SWI, swi_s, 0, 0)
+MAPPING(swi_s, SWI, 1, 0)
+
+SEMANTIC_FUNCTION(VADD2, 3)
+SEMANTIC_FUNCTION(VADD2H, 3)
+SEMANTIC_FUNCTION(VADD4H, 3)
+SEMANTIC_FUNCTION(VSUB2, 3)
+SEMANTIC_FUNCTION(VSUB2H, 3)
+SEMANTIC_FUNCTION(VSUB4H, 3)
+SEMANTIC_FUNCTION(MPYD, 3)
+SEMANTIC_FUNCTION(MPYDU, 3)
+
+
+MAPPING(vadd2, VADD2, 3, 0, 1, 2)
+MAPPING(vadd2h, VADD2H, 3, 0, 1, 2)
+MAPPING(vadd4h, VADD4H, 3, 0, 1, 2)
+MAPPING(vsub2, VSUB2, 3, 0, 1, 2)
+MAPPING(vsub2h, VSUB2H, 3, 0, 1, 2)
+MAPPING(vsub4h, VSUB4H, 3, 0, 1, 2)
+MAPPING(mpyd, MPYD, 3, 0, 1, 2)
+MAPPING(mpydu, MPYDU, 3, 0, 1, 2)
diff --git a/target/arc/helper.c b/target/arc/helper.c
new file mode 100644
index 0000000000..e11d21d576
--- /dev/null
+++ b/target/arc/helper.c
@@ -0,0 +1,281 @@
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synppsys Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * http://www.gnu.org/licenses/lgpl-2.1.html
+ */
+
+#include "qemu/osdep.h"
+
+#include "cpu.h"
+#include "hw/irq.h"
+#include "include/hw/sysbus.h"
+#include "include/sysemu/sysemu.h"
+#include "qemu/qemu-print.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "qemu/host-utils.h"
+#include "exec/helper-proto.h"
+#include "irq.h"
+
+void arc_cpu_do_interrupt(CPUState *cs)
+{
+    ARCCPU      *cpu    = ARC_CPU(cs);
+    CPUARCState *env    = &cpu->env;
+    uint32_t     offset = 0;
+    uint32_t     vectno;
+    const char  *name;
+    MemTxResult txres;
+
+    /*
+     * NOTE: Special LP_END exception. Immediately return code execution to
+     * lp_start.
+     * Now also used for delayslot MissI cases.
+     * This special exception should not execute any of the exception
+     * handling code. Instead it returns immediately after setting PC to the
+     * address passed as exception parameter.
+     */
+    if (cs->exception_index == EXCP_LPEND_REACHED
+        || cs->exception_index == EXCP_FAKE) {
+        env->pc = env->param;
+        CPU_PCL(env) = env->pc & 0xfffffffe;
+        return;
+    }
+
+    /* If we take an exception within an exception => fatal Machine Check. */
+    if (GET_STATUS_BIT(env->stat, AEf) == 1) {
+        cs->exception_index = EXCP_MACHINE_CHECK;
+        env->causecode = 0;
+        env->param = 0;
+        arc_mmu_disable(env);
+        env->mpu.enabled = false;     /* no more MPU */
+    }
+    vectno = cs->exception_index & 0x0F;
+    offset = OFFSET_FOR_VECTOR(vectno);
+
+    /* Generic computation for exceptions. */
+    switch (cs->exception_index) {
+    case EXCP_RESET:
+        name = "Reset";
+        break;
+    case EXCP_MEMORY_ERROR:
+        name = "Memory Error";
+        break;
+    case EXCP_INST_ERROR:
+        name = "Instruction Error";
+        break;
+    case EXCP_MACHINE_CHECK:
+        name = "Machine Check";
+        break;
+    case EXCP_TLB_MISS_I:
+        name = "TLB Miss Instruction";
+        break;
+    case EXCP_TLB_MISS_D:
+        name = "TLB Miss Data";
+        break;
+    case EXCP_PROTV:
+        name = "Protection Violation";
+        break;
+    case EXCP_PRIVILEGEV:
+        name = "Privilege Violation";
+        break;
+    case EXCP_SWI:
+        name = "SWI";
+        break;
+    case EXCP_TRAP:
+        name = "Trap";
+        break;
+    case EXCP_EXTENSION:
+        name = "Extension";
+        break;
+    case EXCP_DIVZERO:
+        name = "DIV by Zero";
+        break;
+    case EXCP_DCERROR:
+        name = "DCError";
+        break;
+    case EXCP_MISALIGNED:
+        name = "Misaligned";
+        break;
+    case EXCP_IRQ:
+    default:
+        cpu_abort(cs, "unhandled exception/irq type=%d\n",
+                  cs->exception_index);
+        break;
+    }
+
+    qemu_log_mask(CPU_LOG_INT, "[EXCP] exception %d (%s) at pc=0x"
+                  TARGET_FMT_lx "\n",
+                  cs->exception_index, name, env->pc);
+
+    /*
+     * 3. exception status register is loaded with the contents
+     * of STATUS32.
+     */
+    env->stat_er = env->stat;
+
+    /* 4. exception return branch target address register. */
+    env->erbta = env->bta;
+
+    /*
+     * 5. eception cause register is loaded with a code to indicate
+     * the cause of the exception.
+     */
+    env->ecr = (vectno & 0xFF) << 16;
+    env->ecr |= (env->causecode & 0xFF) << 8;
+    env->ecr |= (env->param & 0xFF);
+
+    /* 6. Set the EFA if available. */
+    if (cpu->cfg.has_mmu || cpu->cfg.has_mpu) {
+        switch (cs->exception_index) {
+        case EXCP_DCERROR:
+        case EXCP_DIVZERO:
+        case EXCP_EXTENSION:
+        case EXCP_TRAP:
+        case EXCP_SWI:
+        case EXCP_PRIVILEGEV:
+        case EXCP_MACHINE_CHECK:
+        case EXCP_INST_ERROR:
+        case EXCP_RESET:
+            /* TODO: this should move to the place raising the exception */
+            env->efa  = env->pc;
+            break;
+        default:
+            break;
+        }
+    }
+
+    /* 7. CPU is switched to kernel mode. */
+    SET_STATUS_BIT(env->stat, Uf, 0);
+
+    if (GET_STATUS_BIT(env->stat_er, Uf)) {
+        switchSP(env);
+    }
+
+    /* 8. Interrupts are disabled. */
+    env->stat.IEf = 0;
+
+    /* 9. The active exception flag is set. */
+    SET_STATUS_BIT(env->stat, AEf, 1);
+
+    /* 10-14. Other flags sets. */
+    env->stat.Zf  = GET_STATUS_BIT(env->stat_er, Uf);
+    SET_STATUS_BIT(env->stat, Lf, 1);
+    env->stat.DEf = 0;
+    SET_STATUS_BIT(env->stat, ESf, 0);
+    SET_STATUS_BIT(env->stat, DZf, 0);
+    SET_STATUS_BIT(env->stat, SCf, 0);
+
+    /* 15. The PC is set with the appropriate exception vector. */
+    env->pc = address_space_ldl(cs->as, env->intvec + offset,
+                                MEMTXATTRS_UNSPECIFIED, &txres);
+    assert(txres == MEMTX_OK);
+    CPU_PCL(env) = env->pc & 0xfffffffe;
+
+    qemu_log_mask(CPU_LOG_INT, "[EXCP] isr=0x" TARGET_FMT_lx
+                  " vec=0x%x ecr=0x" TARGET_FMT_lx "\n",
+                  env->pc, offset, env->ecr);
+
+    /* Make sure that exception code decodes corectly */
+    env->stat.is_delay_slot_instruction = 0;
+
+    cs->exception_index = -1;
+}
+
+static gint arc_cpu_list_compare(gconstpointer a, gconstpointer b)
+{
+    ObjectClass *class_a = (ObjectClass *)a;
+    ObjectClass *class_b = (ObjectClass *)b;
+    const char *name_a;
+    const char *name_b;
+
+    name_a = object_class_get_name(class_a);
+    name_b = object_class_get_name(class_b);
+    if (strcmp(name_a, "any-" TYPE_ARC_CPU) == 0) {
+        return 1;
+    } else if (strcmp(name_b, "any-" TYPE_ARC_CPU) == 0) {
+        return -1;
+    } else {
+        return strcmp(name_a, name_b);
+    }
+}
+
+static void arc_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    const char *typename;
+    char *name;
+
+    typename = object_class_get_name(oc);
+    name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARC_CPU));
+    qemu_printf("  %s\n", name);
+    g_free(name);
+}
+
+void arc_cpu_list(void)
+{
+    GSList *list;
+
+    list = object_class_get_list(TYPE_ARC_CPU, false);
+    list = g_slist_sort(list, arc_cpu_list_compare);
+    qemu_printf("Available CPUs:\n");
+    g_slist_foreach(list, arc_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
+int arc_cpu_memory_rw_debug(CPUState *cs, vaddr addr, uint8_t *buf,
+                            int len, bool is_write)
+{
+    return cpu_memory_rw_debug(cs, addr, buf, len, is_write);
+}
+
+hwaddr arc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+{
+    ARCCPU *cpu = ARC_CPU(cs);
+    CPUARCState *env = &cpu->env;
+
+    return arc_mmu_debug_translate(env, addr);
+}
+
+void helper_debug(CPUARCState *env)
+{
+   CPUState *cs = env_cpu(env);
+
+   cs->exception_index = EXCP_DEBUG;
+   cpu_loop_exit(cs);
+}
+
+/*
+ * raises a simple exception with causecode and parameter set to 0.
+ * it also considers "pc" as the exception return address. this is
+ * not true for a software trap.
+ * it is very important that "env->host_pc" holds the recent value,
+ * else the cpu_restore_state() will not be helpful and we end up
+ * with incorrect registers in env.
+ */
+void QEMU_NORETURN arc_raise_exception(CPUARCState *env, int32_t excp_idx)
+{
+    CPUState *cs = env_cpu(env);
+    cpu_restore_state(cs, env->host_pc, true);
+    cs->exception_index = excp_idx;
+    env->causecode = env->param = 0x0;
+    env->eret  = env->pc;
+    env->erbta = env->bta;
+    cpu_loop_exit(cs);
+}
+
+
+/* vim: set ts=4 sw=4 et: */
diff --git a/target/arc/helper.h b/target/arc/helper.h
new file mode 100644
index 0000000000..1929c1682f
--- /dev/null
+++ b/target/arc/helper.h
@@ -0,0 +1,39 @@
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synopsys Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * href="http://www.gnu.org/licenses/lgpl-2.1.html
+ */
+
+DEF_HELPER_1(debug, void, env)
+DEF_HELPER_2(lr, tl, env, tl)
+DEF_HELPER_3(sr, void, env, tl, tl)
+DEF_HELPER_2(halt, noreturn, env, tl)
+DEF_HELPER_1(rtie, void, env)
+DEF_HELPER_1(flush, void, env)
+DEF_HELPER_4(raise_exception, noreturn, env, tl, tl, tl)
+DEF_HELPER_2(zol_verify, void, env, tl)
+DEF_HELPER_2(fake_exception, void, env, tl)
+DEF_HELPER_2(set_status32, void, env, tl)
+DEF_HELPER_1(get_status32, tl, env)
+DEF_HELPER_3(set_status32_bit, void, env, tl, tl)
+
+DEF_HELPER_FLAGS_3(carry_add_flag, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(overflow_add_flag, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(overflow_sub_flag, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(mpymu, TCG_CALL_NO_RWG_SE, tl, env, tl, tl)
+DEF_HELPER_FLAGS_3(mpym, TCG_CALL_NO_RWG_SE, tl, env, tl, tl)
+DEF_HELPER_FLAGS_3(repl_mask, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
diff --git a/target/arc/op_helper.c b/target/arc/op_helper.c
new file mode 100644
index 0000000000..1124541993
--- /dev/null
+++ b/target/arc/op_helper.c
@@ -0,0 +1,406 @@
+/*
+ * QEMU ARC CPU
+ *
+ * Copyright (c) 2020 Synopsys Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * http://www.gnu.org/licenses/lgpl-2.1.html
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "cpu.h"
+#include "sysemu/runstate.h"
+#include "exec/helper-proto.h"
+#include "exec/cpu_ldst.h"
+#include "exec/ioport.h"
+#include "target/arc/regs.h"
+#include "mmu.h"
+#include "hw/arc/cpudevs.h"
+#include "qemu/main-loop.h"
+#include "irq.h"
+#include "sysemu/sysemu.h"
+#include "exec/exec-all.h"
+
+
+static target_ulong get_status32(CPUARCState *env)
+{
+    target_ulong value = pack_status32(&env->stat);
+
+    /* TODO: Implement debug mode */
+    if (GET_STATUS_BIT(env->stat, Uf) == 1) {
+        value &= 0x00000f00;
+    }
+
+    if (env->stopped) {
+        value |= BIT(0);
+    }
+
+    return value;
+}
+
+static void set_status32(CPUARCState *env, target_ulong value)
+{
+    /* TODO: Implement debug mode. */
+    bool debug_mode = false;
+    if (GET_STATUS_BIT(env->stat, Uf) == 1) {
+        value &= 0x00000f00;
+    } else if (!debug_mode) {
+        value &= 0xffff6f3f;
+    }
+
+    if (GET_STATUS_BIT(env->stat, Uf) != ((value >> 7)  & 0x1)) {
+        tlb_flush(env_cpu(env));
+    }
+
+    unpack_status32(&env->stat, value);
+
+    /* Implement HALT functionality.  */
+    if (value & 0x01) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void report_aux_reg_error(target_ulong aux)
+{
+    if (((aux >= ARC_BCR1_START) && (aux <= ARC_BCR1_END)) ||
+        ((aux >= ARC_BCR2_START) && (aux <= ARC_BCR2_END))) {
+        qemu_log_mask(LOG_UNIMP, "Undefined BCR 0x" TARGET_FMT_lx "\n", aux);
+    }
+
+    qemu_log_mask(LOG_UNIMP, "Undefined aux register with id 0x" TARGET_FMT_lx
+                  "\n", aux);
+}
+
+void helper_sr(CPUARCState *env, target_ulong val, target_ulong aux)
+{
+    /* saving return address in case an exception must be raised later */
+    env->host_pc = GETPC();
+    ARCCPU *cpu = env_archcpu(env);
+    struct arc_aux_reg_detail *aux_reg_detail =
+        arc_aux_reg_struct_for_address(aux, cpu->family);
+
+    g_assert(aux_reg_detail != NULL);
+    if (aux_reg_detail == NULL) {
+        report_aux_reg_error(aux);
+        arc_raise_exception(env, EXCP_INST_ERROR);
+    }
+
+    if (aux_reg_detail->aux_reg->set_func != NULL) {
+        aux_reg_detail->aux_reg->set_func(aux_reg_detail, val,
+                                          (void *) env);
+    } else {
+        arc_raise_exception(env, EXCP_INST_ERROR);
+    }
+    cpu_outl(aux, val);
+}
+
+
+target_ulong helper_lr(CPUARCState *env, target_ulong aux)
+{
+    ARCCPU *cpu = env_archcpu(env);
+    target_ulong result = 0;
+
+    /* saving return address in case an exception must be raised later */
+    env->host_pc = GETPC();
+
+    struct arc_aux_reg_detail *aux_reg_detail =
+        arc_aux_reg_struct_for_address(aux, cpu->family);
+
+    if (aux_reg_detail == NULL) {
+        report_aux_reg_error(aux);
+        arc_raise_exception(env, EXCP_INST_ERROR);
+    }
+
+    if (aux_reg_detail->aux_reg->get_func != NULL) {
+        result = aux_reg_detail->aux_reg->get_func(aux_reg_detail,
+                                                   (void *) env);
+    } else {
+        arc_raise_exception(env, EXCP_INST_ERROR);
+    }
+
+    return result;
+}
+
+void QEMU_NORETURN helper_halt(CPUARCState *env, target_ulong npc)
+{
+    CPUState *cs = env_cpu(env);
+    if (GET_STATUS_BIT(env->stat, Uf)) {
+        cs->exception_index = EXCP_PRIVILEGEV;
+        env->causecode = 0;
+        env->param = 0;
+         /* Restore PC such that we point at the faulty instruction.  */
+        env->eret = env->pc;
+    } else {
+        env->pc = npc;
+        cs->halted = 1;
+        cs->exception_index = EXCP_HLT;
+    }
+    cpu_loop_exit(cs);
+}
+
+void helper_rtie(CPUARCState *env)
+{
+    CPUState *cs = env_cpu(env);
+    if (GET_STATUS_BIT(env->stat, Uf)) {
+        cs->exception_index = EXCP_PRIVILEGEV;
+        env->causecode = 0;
+        env->param = 0;
+         /* Restore PC such that we point at the faulty instruction.  */
+        env->eret = env->pc;
+        cpu_loop_exit(cs);
+        return;
+    }
+
+    if (GET_STATUS_BIT(env->stat, AEf) || (env->aux_irq_act & 0xFFFF) == 0) {
+        assert(GET_STATUS_BIT(env->stat, Uf) == 0);
+
+        CPU_PCL(env) = env->eret;
+        env->pc = env->eret;
+
+        env->stat = env->stat_er;
+        env->bta = env->erbta;
+
+        /* If returning to userland, restore SP.  */
+        if (GET_STATUS_BIT(env->stat, Uf)) {
+            switchSP(env);
+        }
+
+        qemu_log_mask(CPU_LOG_INT, "[EXCP] RTIE @0x" TARGET_FMT_lx
+                      " ECR:0x" TARGET_FMT_lx "\n",
+                      (target_ulong) env->r[63], (target_ulong) env->ecr);
+    } else {
+        arc_rtie_interrupts(env);
+        qemu_log_mask(CPU_LOG_INT, "[IRQ] RTIE @0x" TARGET_FMT_lx
+                      " STATUS32:0x" TARGET_FMT_lx "\n",
+                      (target_ulong) env->r[63],
+                      (target_ulong) pack_status32(&env->stat));
+    }
+
+    helper_zol_verify(env, env->pc);
+}
+
+void helper_flush(CPUARCState *env)
+{
+    tb_flush((CPUState *) env_cpu(env));
+}
+
+/*
+ * This should only be called from translate, via gen_raise_exception.
+ * We expect that ENV->PC has already been updated.
+ */
+
+void QEMU_NORETURN helper_raise_exception(CPUARCState *env,
+                                          target_ulong index,
+                                          target_ulong causecode,
+                                          target_ulong param)
+{
+    CPUState *cs = env_cpu(env);
+    cs->exception_index = index;
+    env->causecode = causecode;
+    env->param = param;
+    cpu_loop_exit(cs);
+}
+
+void helper_zol_verify(CPUARCState *env, target_ulong npc)
+{
+    CPUState *cs = env_cpu(env);
+    if (npc == env->lpe) {
+        if (env->r[60] > 1) {
+            env->r[60] -= 1;
+
+            /*
+             * Raise exception in case where Zero-overhead-loops needs
+             * to jump.
+             */
+            cs->exception_index = EXCP_LPEND_REACHED;
+            env->causecode = 0;
+            env->param = env->lps;
+            cpu_loop_exit(cs);
+        } else {
+            env->r[60] = 0;
+        }
+    }
+}
+void helper_fake_exception(CPUARCState *env, target_ulong pc)
+{
+    helper_raise_exception(env, (target_ulong) EXCP_FAKE, 0, pc);
+}
+
+target_ulong helper_get_status32(CPUARCState *env)
+{
+    return get_status32(env);
+}
+
+void helper_set_status32(CPUARCState *env, target_ulong value)
+{
+    set_status32(env, value);
+}
+
+void helper_set_status32_bit(CPUARCState *env, target_ulong bit,
+                             target_ulong value)
+{
+    target_ulong bit_mask = (1 << bit);
+    /* Verify i changing bit is in pstate. Assert otherwise. */
+    assert((bit_mask & PSTATE_MASK) == 0);
+
+    env->stat.pstate &= ~bit_mask;
+    env->stat.pstate |= (value << bit);
+}
+
+static inline target_ulong
+carry_add_flag(target_ulong dest, target_ulong b, target_ulong c, uint8_t size)
+{
+    target_ulong t1, t2, t3;
+
+    t1 = b & c;
+    t2 = b & (~dest);
+    t3 = c & (~dest);
+    t1 = t1 | t2 | t3;
+    return (t1 >> (size - 1)) & 1;
+}
+
+target_ulong helper_carry_add_flag(target_ulong dest, target_ulong b,
+                                   target_ulong c) {
+    return carry_add_flag(dest, b, c, TARGET_LONG_BITS);
+}
+
+static inline target_ulong
+overflow_add_flag(target_ulong dest, target_ulong b, target_ulong c,
+                  uint8_t size)
+{
+    dest >>= (size - 1);
+    b >>= (size - 1);
+    c >>= (size - 1);
+    if ((dest == 0 && b == 1 && c == 1)
+        || (dest == 1 && b == 0 && c == 0)) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+target_ulong helper_overflow_add_flag(target_ulong dest, target_ulong b,
+                                      target_ulong c) {
+    return overflow_add_flag(dest, b, c, TARGET_LONG_BITS);
+}
+
+static inline target_ulong
+overflow_sub_flag(target_ulong dest, target_ulong b, target_ulong c,
+                  uint8_t size)
+{
+    dest >>= (size - 1);
+    b >>= (size - 1);
+    c >>= (size - 1);
+    if ((dest == 1 && b == 0 && c == 1)
+        || (dest == 0 && b == 1 && c == 0)) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+target_ulong helper_overflow_sub_flag(target_ulong dest, target_ulong b,
+                                      target_ulong c) {
+    return overflow_sub_flag(dest, b, c, TARGET_LONG_BITS);
+}
+
+target_ulong helper_repl_mask(target_ulong dest, target_ulong src,
+                              target_ulong mask)
+{
+    target_ulong ret = dest & (~mask);
+    ret |= (src & mask);
+
+    return ret;
+}
+
+target_ulong helper_mpymu(CPUARCState *env, target_ulong b, target_ulong c)
+{
+    uint64_t _b = (uint64_t) b;
+    uint64_t _c = (uint64_t) c;
+
+    return (uint32_t) ((_b * _c) >> 32);
+}
+
+target_ulong helper_mpym(CPUARCState *env, target_ulong b, target_ulong c)
+{
+    int64_t _b = (int64_t) ((int32_t) b);
+    int64_t _c = (int64_t) ((int32_t) c);
+
+    /*
+     * fprintf(stderr, "B = 0x%llx, C = 0x%llx, result = 0x%llx\n",
+     *         _b, _c, _b * _c);
+     */
+    return (_b * _c) >> 32;
+}
+
+target_ulong
+arc_status_regs_get(const struct arc_aux_reg_detail *aux_reg_detail,
+                    void *data)
+{
+    CPUARCState *env = (CPUARCState *) data;
+    target_ulong reg = 0;
+
+    switch (aux_reg_detail->id) {
+    case AUX_ID_status32:
+        reg = get_status32(env);
+        break;
+
+    case AUX_ID_erstatus:
+        if (is_user_mode(env)) {
+            arc_raise_exception(env, EXCP_PRIVILEGEV);
+        }
+        reg = pack_status32(&env->stat_er);
+        break;
+
+    default:
+        break;
+    }
+
+    return reg;
+}
+
+void
+arc_status_regs_set(const struct arc_aux_reg_detail *aux_reg_detail,
+                    target_ulong val, void *data)
+{
+    CPUARCState *env = (CPUARCState *) data;
+
+    switch (aux_reg_detail->id) {
+
+    case AUX_ID_status32:
+        set_status32(env, val);
+        break;
+
+    case AUX_ID_erstatus:
+        unpack_status32(&env->stat_er, val);
+        break;
+
+    default:
+        break;
+    }
+}
+
+/*
+ * uint32_t lf_variable = 0;
+ * uint32_t helper_get_lf(void)
+ * {
+ *   return lf_variable;
+ * }
+ * void helper_set_lf(uint32_t v)
+ * {
+ *   lf_variable = v;
+ * }
+ */
+
+/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
+/* vim: set ts=4 sw=4 et: */
diff --git a/target/arc/semfunc_mapping.def b/target/arc/semfunc_mapping.def
new file mode 100644
index 0000000000..ab8d9ff123
--- /dev/null
+++ b/target/arc/semfunc_mapping.def
@@ -0,0 +1,321 @@
+/*
+ * QEMU ARC SEMANTIC MAPPING.
+ *
+ * Copyright (c) 2020 Synopsys, Inc.
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
+SEMANTIC_FUNCTION(FLAG, 1)
+SEMANTIC_FUNCTION(KFLAG, 1)
+SEMANTIC_FUNCTION(ADD, 3)
+SEMANTIC_FUNCTION(ADD1, 3)
+SEMANTIC_FUNCTION(ADD2, 3)
+SEMANTIC_FUNCTION(ADD3, 3)
+SEMANTIC_FUNCTION(ADC, 3)
+SEMANTIC_FUNCTION(SBC, 3)
+SEMANTIC_FUNCTION(NEG, 2)
+SEMANTIC_FUNCTION(SUB, 3)
+SEMANTIC_FUNCTION(SUB1, 3)
+SEMANTIC_FUNCTION(SUB2, 3)
+SEMANTIC_FUNCTION(SUB3, 3)
+SEMANTIC_FUNCTION(MAX, 3)
+SEMANTIC_FUNCTION(MIN, 3)
+SEMANTIC_FUNCTION(CMP, 2)
+SEMANTIC_FUNCTION(AND, 3)
+SEMANTIC_FUNCTION(OR, 3)
+SEMANTIC_FUNCTION(XOR, 3)
+SEMANTIC_FUNCTION(MOV, 2)
+SEMANTIC_FUNCTION(ASL, 3)
+SEMANTIC_FUNCTION(ASR, 3)
+SEMANTIC_FUNCTION(ASR8, 2)
+SEMANTIC_FUNCTION(ASR16, 2)
+SEMANTIC_FUNCTION(LSL16, 2)
+SEMANTIC_FUNCTION(LSL8, 2)
+SEMANTIC_FUNCTION(LSR, 3)
+SEMANTIC_FUNCTION(LSR16, 2)
+SEMANTIC_FUNCTION(LSR8, 2)
+SEMANTIC_FUNCTION(BIC, 3)
+SEMANTIC_FUNCTION(BCLR, 3)
+SEMANTIC_FUNCTION(BMSK, 3)
+SEMANTIC_FUNCTION(BMSKN, 3)
+SEMANTIC_FUNCTION(BSET, 3)
+SEMANTIC_FUNCTION(BXOR, 3)
+SEMANTIC_FUNCTION(ROL, 2)
+SEMANTIC_FUNCTION(ROL8, 2)
+SEMANTIC_FUNCTION(ROR, 3)
+SEMANTIC_FUNCTION(ROR8, 2)
+SEMANTIC_FUNCTION(RLC, 2)
+SEMANTIC_FUNCTION(RRC, 2)
+SEMANTIC_FUNCTION(SEXB, 2)
+SEMANTIC_FUNCTION(SEXH, 2)
+SEMANTIC_FUNCTION(EXTB, 2)
+SEMANTIC_FUNCTION(EXTH, 2)
+SEMANTIC_FUNCTION(BTST, 2)
+SEMANTIC_FUNCTION(TST, 2)
+SEMANTIC_FUNCTION(XBFU, 3)
+SEMANTIC_FUNCTION(AEX, 2)
+SEMANTIC_FUNCTION(LR, 2)
+SEMANTIC_FUNCTION(CLRI, 1)
+SEMANTIC_FUNCTION(SETI, 1)
+SEMANTIC_FUNCTION(NOP, 0)
+SEMANTIC_FUNCTION(PREALLOC, 0)
+SEMANTIC_FUNCTION(PREFETCH, 2)
+SEMANTIC_FUNCTION(MPY, 3)
+SEMANTIC_FUNCTION(MPYMU, 3)
+SEMANTIC_FUNCTION(MPYM, 3)
+SEMANTIC_FUNCTION(MPYU, 3)
+SEMANTIC_FUNCTION(MPYUW, 3)
+SEMANTIC_FUNCTION(MPYW, 3)
+SEMANTIC_FUNCTION(DIV, 3)
+SEMANTIC_FUNCTION(DIVU, 3)
+SEMANTIC_FUNCTION(REM, 3)
+SEMANTIC_FUNCTION(REMU, 3)
+SEMANTIC_FUNCTION(MAC, 3)
+SEMANTIC_FUNCTION(MACU, 3)
+SEMANTIC_FUNCTION(MACD, 3)
+SEMANTIC_FUNCTION(MACDU, 3)
+SEMANTIC_FUNCTION(ABS, 2)
+SEMANTIC_FUNCTION(SWAP, 2)
+SEMANTIC_FUNCTION(SWAPE, 2)
+SEMANTIC_FUNCTION(NOT, 2)
+SEMANTIC_FUNCTION(BI, 1)
+SEMANTIC_FUNCTION(BIH, 1)
+SEMANTIC_FUNCTION(B, 1)
+SEMANTIC_FUNCTION(B_S, 1)
+SEMANTIC_FUNCTION(BBIT0, 3)
+SEMANTIC_FUNCTION(BBIT1, 3)
+SEMANTIC_FUNCTION(BL, 1)
+SEMANTIC_FUNCTION(J, 1)
+SEMANTIC_FUNCTION(JL, 1)
+SEMANTIC_FUNCTION(SETEQ, 3)
+SEMANTIC_FUNCTION(BREQ, 3)
+SEMANTIC_FUNCTION(SETNE, 3)
+SEMANTIC_FUNCTION(BRNE, 3)
+SEMANTIC_FUNCTION(SETLT, 3)
+SEMANTIC_FUNCTION(BRLT, 3)
+SEMANTIC_FUNCTION(SETGE, 3)
+SEMANTIC_FUNCTION(BRGE, 3)
+SEMANTIC_FUNCTION(SETLE, 3)
+SEMANTIC_FUNCTION(SETGT, 3)
+SEMANTIC_FUNCTION(BRLO, 3)
+SEMANTIC_FUNCTION(SETLO, 3)
+SEMANTIC_FUNCTION(BRHS, 3)
+SEMANTIC_FUNCTION(SETHS, 3)
+SEMANTIC_FUNCTION(EX, 2)
+SEMANTIC_FUNCTION(LLOCK, 2)
+SEMANTIC_FUNCTION(LLOCKD, 2)
+SEMANTIC_FUNCTION(SCOND, 2)
+SEMANTIC_FUNCTION(SCONDD, 2)
+SEMANTIC_FUNCTION(DMB, 1)
+SEMANTIC_FUNCTION(LD, 3)
+SEMANTIC_FUNCTION(LDD, 3)
+SEMANTIC_FUNCTION(ST, 3)
+SEMANTIC_FUNCTION(STD, 3)
+SEMANTIC_FUNCTION(POP, 1)
+SEMANTIC_FUNCTION(PUSH, 1)
+SEMANTIC_FUNCTION(LP, 1)
+SEMANTIC_FUNCTION(NORM, 2)
+SEMANTIC_FUNCTION(NORMH, 2)
+SEMANTIC_FUNCTION(FLS, 2)
+SEMANTIC_FUNCTION(FFS, 2)
+
+
+MAPPING(flag, FLAG, 1, 0)
+MAPPING(kflag, KFLAG, 1, 0)
+MAPPING(add, ADD, 3, 1, 2, 0)
+MAPPING(add_s, ADD, 3, 1, 2, 0)
+MAPPING(add1, ADD1, 3, 1, 2, 0)
+MAPPING(add1_s, ADD1, 3, 1, 2, 0)
+MAPPING(add2, ADD2, 3, 1, 2, 0)
+MAPPING(add2_s, ADD2, 3, 1, 2, 0)
+MAPPING(add3, ADD3, 3, 1, 2, 0)
+MAPPING(add3_s, ADD3, 3, 1, 2, 0)
+MAPPING(adc, ADC, 3, 1, 2, 0)
+MAPPING(sbc, SBC, 3, 1, 2, 0)
+MAPPING(neg, NEG, 2, 1, 0)
+MAPPING(neg_s, NEG, 2, 1, 0)
+MAPPING(sub, SUB, 3, 1, 2, 0)
+MAPPING(sub_s, SUB, 3, 1, 2, 0)
+MAPPING(rsub, SUB, 3, 2, 1, 0)
+MAPPING(sub1, SUB1, 3, 1, 2, 0)
+MAPPING(sub2, SUB2, 3, 1, 2, 0)
+MAPPING(sub3, SUB3, 3, 1, 2, 0)
+MAPPING(max, MAX, 3, 1, 2, 0)
+MAPPING(min, MIN, 3, 1, 2, 0)
+MAPPING(cmp, CMP, 2, 0, 1)
+MAPPING(cmp_s, CMP, 2, 0, 1)
+MAPPING(rcmp, CMP, 2, 1, 0)
+MAPPING(and, AND, 3, 1, 2, 0)
+MAPPING(and_s, AND, 3, 1, 2, 0)
+MAPPING(or, OR, 3, 1, 2, 0)
+MAPPING(or_s, OR, 3, 1, 2, 0)
+MAPPING(xor, XOR, 3, 1, 2, 0)
+MAPPING(xor_s, XOR, 3, 1, 2, 0)
+MAPPING(mov, MOV, 2, 1, 0)
+MAPPING(mov_s, MOV, 2, 1, 0)
+CONSTANT(ASL, asl, 2, 268435457) /* For variable @c */
+MAPPING(asl, ASL, 3, 1, 2, 0)
+CONSTANT(ASL, asl_s, 2, 268435457) /* For variable @c */
+MAPPING(asl_s, ASL, 3, 1, 2, 0)
+CONSTANT(ASR, asr, 2, 1) /* For variable @c */
+MAPPING(asr, ASR, 3, 1, 2, 0)
+CONSTANT(ASR, asr_s, 2, 1) /* For variable @c */
+MAPPING(asr_s, ASR, 3, 1, 2, 0)
+MAPPING(asr8, ASR8, 2, 1, 0)
+MAPPING(asr16, ASR16, 2, 1, 0)
+MAPPING(lsl16, LSL16, 2, 1, 0)
+MAPPING(lsl8, LSL8, 2, 1, 0)
+CONSTANT(LSR, lsr, 2, 1) /* For variable @c */
+MAPPING(lsr, LSR, 3, 1, 2, 0)
+CONSTANT(LSR, lsr_s, 2, 1) /* For variable @c */
+MAPPING(lsr_s, LSR, 3, 1, 2, 0)
+MAPPING(lsr16, LSR16, 2, 1, 0)
+MAPPING(lsr8, LSR8, 2, 1, 0)
+MAPPING(bic, BIC, 3, 1, 2, 0)
+MAPPING(bic_s, BIC, 3, 1, 2, 0)
+MAPPING(bclr, BCLR, 3, 2, 1, 0)
+MAPPING(bclr_s, BCLR, 3, 2, 1, 0)
+MAPPING(bmsk, BMSK, 3, 2, 1, 0)
+MAPPING(bmsk_s, BMSK, 3, 2, 1, 0)
+MAPPING(bmskn, BMSKN, 3, 2, 1, 0)
+MAPPING(bset, BSET, 3, 2, 1, 0)
+MAPPING(bset_s, BSET, 3, 2, 1, 0)
+MAPPING(bxor, BXOR, 3, 2, 1, 0)
+MAPPING(rol, ROL, 2, 1, 0)
+MAPPING(rol8, ROL8, 2, 1, 0)
+CONSTANT(ROR, ror, 2, 1) /* For variable @n */
+MAPPING(ror, ROR, 3, 1, 2, 0)
+MAPPING(ror8, ROR8, 2, 1, 0)
+MAPPING(rlc, RLC, 2, 1, 0)
+MAPPING(rrc, RRC, 2, 1, 0)
+MAPPING(sexb, SEXB, 2, 0, 1)
+MAPPING(sexb_s, SEXB, 2, 0, 1)
+MAPPING(sexh, SEXH, 2, 0, 1)
+MAPPING(sexh_s, SEXH, 2, 0, 1)
+MAPPING(extb, EXTB, 2, 0, 1)
+MAPPING(extb_s, EXTB, 2, 0, 1)
+MAPPING(exth, EXTH, 2, 0, 1)
+MAPPING(exth_s, EXTH, 2, 0, 1)
+MAPPING(btst, BTST, 2, 1, 0)
+MAPPING(btst_s, BTST, 2, 1, 0)
+MAPPING(tst, TST, 2, 0, 1)
+MAPPING(tst_s, TST, 2, 0, 1)
+MAPPING(xbfu, XBFU, 3, 2, 1, 0)
+MAPPING(aex, AEX, 2, 1, 0)
+MAPPING(lr, LR, 2, 0, 1)
+MAPPING(clri, CLRI, 1, 0)
+MAPPING(seti, SETI, 1, 0)
+MAPPING(nop, NOP, 0)
+MAPPING(nop_s, NOP, 0)
+MAPPING(prealloc, PREALLOC, 0)
+CONSTANT(PREFETCH, prefetch, 1, 0) /* For variable @src2 */
+MAPPING(prefetch, PREFETCH, 2, 0, 1)
+CONSTANT(PREFETCH, prefetchw, 1, 0) /* For variable @src2 */
+MAPPING(prefetchw, PREFETCH, 2, 0, 1)
+MAPPING(mpy, MPY, 3, 1, 2, 0)
+MAPPING(mpy_s, MPY, 3, 1, 2, 0)
+MAPPING(mpymu, MPYMU, 3, 0, 1, 2)
+MAPPING(mpym, MPYM, 3, 0, 1, 2)
+MAPPING(mpyu, MPYU, 3, 1, 2, 0)
+MAPPING(mpyuw, MPYUW, 3, 0, 1, 2)
+MAPPING(mpyuw_s, MPYUW, 3, 0, 1, 2)
+MAPPING(mpyw, MPYW, 3, 0, 1, 2)
+MAPPING(mpyw_s, MPYW, 3, 0, 1, 2)
+MAPPING(div, DIV, 3, 2, 1, 0)
+MAPPING(divu, DIVU, 3, 2, 0, 1)
+MAPPING(rem, REM, 3, 2, 1, 0)
+MAPPING(remu, REMU, 3, 2, 0, 1)
+MAPPING(mac, MAC, 3, 1, 2, 0)
+MAPPING(macu, MACU, 3, 1, 2, 0)
+MAPPING(macd, MACD, 3, 1, 2, 0)
+MAPPING(macdu, MACDU, 3, 1, 2, 0)
+MAPPING(abs, ABS, 2, 1, 0)
+MAPPING(abs_s, ABS, 2, 1, 0)
+MAPPING(swap, SWAP, 2, 1, 0)
+MAPPING(swape, SWAPE, 2, 1, 0)
+MAPPING(not, NOT, 2, 0, 1)
+MAPPING(not_s, NOT, 2, 0, 1)
+MAPPING(bi, BI, 1, 0)
+MAPPING(bih, BIH, 1, 0)
+MAPPING(b, B, 1, 0)
+MAPPING(beq_s, B_S, 1, 0)
+MAPPING(bne_s, B_S, 1, 0)
+MAPPING(bgt_s, B_S, 1, 0)
+MAPPING(bge_s, B_S, 1, 0)
+MAPPING(blt_s, B_S, 1, 0)
+MAPPING(ble_s, B_S, 1, 0)
+MAPPING(bhi_s, B_S, 1, 0)
+MAPPING(bhs_s, B_S, 1, 0)
+MAPPING(blo_s, B_S, 1, 0)
+MAPPING(bls_s, B_S, 1, 0)
+MAPPING(b_s, B_S, 1, 0)
+MAPPING(bbit0, BBIT0, 3, 0, 1, 2)
+MAPPING(bbit1, BBIT1, 3, 0, 1, 2)
+MAPPING(bl, BL, 1, 0)
+MAPPING(bl_s, BL, 1, 0)
+MAPPING(j, J, 1, 0)
+MAPPING(j_s, J, 1, 0)
+MAPPING(jeq_s, J, 1, 0)
+MAPPING(jne_s, J, 1, 0)
+MAPPING(jl, JL, 1, 0)
+MAPPING(jl_s, JL, 1, 0)
+MAPPING(seteq, SETEQ, 3, 1, 2, 0)
+MAPPING(breq, BREQ, 3, 0, 1, 2)
+MAPPING(breq_s, BREQ, 3, 0, 1, 2)
+MAPPING(setne, SETNE, 3, 1, 2, 0)
+MAPPING(brne, BRNE, 3, 0, 1, 2)
+MAPPING(brne_s, BRNE, 3, 0, 1, 2)
+MAPPING(setlt, SETLT, 3, 1, 2, 0)
+MAPPING(brlt, BRLT, 3, 0, 1, 2)
+MAPPING(setge, SETGE, 3, 1, 2, 0)
+MAPPING(brge, BRGE, 3, 0, 1, 2)
+MAPPING(setle, SETLE, 3, 1, 2, 0)
+MAPPING(setgt, SETGT, 3, 1, 2, 0)
+MAPPING(brlo, BRLO, 3, 0, 1, 2)
+MAPPING(setlo, SETLO, 3, 1, 2, 0)
+MAPPING(brhs, BRHS, 3, 0, 1, 2)
+MAPPING(seths, SETHS, 3, 1, 2, 0)
+MAPPING(ex, EX, 2, 0, 1)
+MAPPING(llock, LLOCK, 2, 0, 1)
+MAPPING(llockd, LLOCKD, 2, 0, 1)
+MAPPING(scond, SCOND, 2, 1, 0)
+MAPPING(scondd, SCONDD, 2, 1, 0)
+MAPPING(dmb, DMB, 1, 0)
+CONSTANT(LD, ld, 2, 0) /* For variable @src2 */
+MAPPING(ld, LD, 3, 1, 2, 0)
+MAPPING(ld_s, LD, 3, 1, 2, 0)
+MAPPING(ldb_s, LD, 3, 1, 2, 0)
+MAPPING(ldh_s, LD, 3, 1, 2, 0)
+MAPPING(ldw_s, LD, 3, 1, 2, 0)
+CONSTANT(LD, ldi, 2, 0) /* For variable @src2 */
+MAPPING(ldi, LD, 3, 1, 2, 0)
+CONSTANT(LD, ldi_s, 2, 0) /* For variable @src2 */
+MAPPING(ldi_s, LD, 3, 1, 2, 0)
+CONSTANT(LDD, ldd, 2, 0) /* For variable @src2 */
+MAPPING(ldd, LDD, 3, 1, 2, 0)
+CONSTANT(ST, st, 2, 0) /* For variable @src2 */
+MAPPING(st, ST, 3, 1, 2, 0)
+MAPPING(st_s, ST, 3, 1, 2, 0)
+MAPPING(stb_s, ST, 3, 1, 2, 0)
+MAPPING(sth_s, ST, 3, 1, 2, 0)
+MAPPING(stw_s, ST, 3, 1, 2, 0)
+CONSTANT(STD, std, 2, 0) /* For variable @src2 */
+MAPPING(std, STD, 3, 1, 2, 0)
+MAPPING(pop_s, POP, 1, 0)
+MAPPING(push_s, PUSH, 1, 0)
+MAPPING(lp, LP, 1, 0)
+MAPPING(norm, NORM, 2, 1, 0)
+MAPPING(normh, NORMH, 2, 1, 0)
+MAPPING(fls, FLS, 2, 1, 0)
+MAPPING(ffs, FFS, 2, 1, 0)
-- 
2.20.1


