Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DB4325C52
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:06:55 +0100 (CET)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUOz-0000Ix-W9
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTl1-0003hC-3h
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:35 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTky-00036W-9r
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:34 -0500
Received: by mail-pl1-x631.google.com with SMTP id b8so1745032plh.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=otSUGTugQziVAYtaVLRk4o8gktYRUt42gZZaoyBMQvk=;
 b=O7X6SE5odvM8kDLEuPEoLt3oDmFWqjWtgCL0D8t46ILKVGPU43wbpNbLhlVFiyS4KH
 aq6vJBki/fBWFfP612mIinnd8R7DUPYJSb3TBBjKI8WiNwUmABDGrMbFJ69HmJV+3wyq
 npfY5d3lIoZqWjgU8ZvkjfqljwhmXPljaTSrPLs769K85lCdvkgqgwani098gXnGu/EY
 BBBhx2RyetXyGzjWny7nvQygVJnKu7+cjVFdhsKJc0l1xqx9syxRtZ1ilx3rFGIzJP/r
 hPr6NbxqekXDamttD8WHP/cL9PUuu2eRWsxfUQ+WD6FtIdTZWfvDwzyt2JHVnZYQvI/c
 PJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=otSUGTugQziVAYtaVLRk4o8gktYRUt42gZZaoyBMQvk=;
 b=Q/n87eza9xWWc/q1OfiBonIeWl1dKnYhLN6POQVXkHbRSNrcrXNKnql0L+rbnAUMj4
 UrN4Xo/NCQhylfMRxfjJV+3HYr3ia1GxXf9KN0gbryeK03fG6i8mUOOl4dcW2xGik1Vd
 K3LiD+PgEpYmSSYJy0G9gDQRaTpTtyB+ig0gGGabH34UaAAOkUydLGLJ2M1qsy69xqKZ
 FAdJzuVaJcFrDWKIHX07BrspNXdp5LFSojav1QbIrySwmV/Y6tSioBL8QKS02l/T+LOd
 PfDnmQz8+mNVG1VDJlY97MGGReM8q91CIfbIvN+zxGlh2IeLA6iju8gnsCte7zZDQCps
 e+6w==
X-Gm-Message-State: AOAM533Si29lxuenPO84PpRuDCkPPcaNWIJYaZCZUa+75V87U3P8vea/
 5JeNfDFcQ/Z103X0nCkg84vmBXp57LU0VA==
X-Google-Smtp-Source: ABdhPJxZZNeX6MH+U4zO5R8+tj9ULM6Do7LAN+6p39nSYw6O2v7Wg39/JE5ue8/OJaxdjrSuHuWykQ==
X-Received: by 2002:a17:903:2306:b029:de:18e9:f439 with SMTP id
 d6-20020a1709032306b02900de18e9f439mr1038597plh.38.1614309930650; 
 Thu, 25 Feb 2021 19:25:30 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:30 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 68/75] target/riscv: gdb: support vector registers for rv64
 & rv32
Date: Fri, 26 Feb 2021 11:18:52 +0800
Message-Id: <20210226031902.23656-69-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Hsiangkai Wang <kai.wang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <greentime.hu@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hsiangkai Wang <kai.wang@sifive.com>

Signed-off-by: Hsiangkai Wang <kai.wang@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c     |   2 +
 target/riscv/cpu.h     |   1 +
 target/riscv/gdbstub.c | 184 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d95165b3acb..a110b6ead9b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -575,6 +575,8 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
 
     if (strcmp(xmlname, "riscv-csr.xml") == 0) {
         return cpu->dyn_csr_xml;
+    } else if (strcmp(xmlname, "riscv-vector.xml") == 0) {
+        return cpu->dyn_vreg_xml;
     }
 
     return NULL;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ad2497229db..f324949beb1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -275,6 +275,7 @@ struct RISCVCPU {
     CPURISCVState env;
 
     char *dyn_csr_xml;
+    char *dyn_vreg_xml;
 
     /* Configuration Settings */
     struct {
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 5f96b7ea2a9..dd883612c77 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -20,6 +20,32 @@
 #include "exec/gdbstub.h"
 #include "cpu.h"
 
+struct TypeSize {
+    const char *gdb_type;
+    const char *id;
+    int size;
+    const char suffix;
+};
+
+static const struct TypeSize vec_lanes[] = {
+    /* quads */
+    { "uint128", "quads", 128, 'q' },
+    /* 64 bit */
+    { "uint64", "longs", 64, 'l' },
+    /* 32 bit */
+    { "uint32", "words", 32, 'w' },
+    /* 16 bit */
+    { "uint16", "shorts", 16, 's' },
+    /*
+     * TODO: currently there is no reliable way of telling
+     * if the remote gdb actually understands ieee_half so
+     * we don't expose it in the target description for now.
+     * { "ieee_half", 16, 'h', 'f' },
+     */
+    /* bytes */
+    { "uint8", "bytes", 8, 'b' },
+};
+
 int riscv_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -101,6 +127,96 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
     return 0;
 }
 
+/*
+ * Convert register index number passed by GDB to the correspond
+ * vector CSR number. Vector CSRs are defined after vector registers
+ * in dynamic generated riscv-vector.xml, thus the starting register index
+ * of vector CSRs is 32.
+ * Return 0 if register index number is out of range.
+ */
+static int riscv_gdb_vector_csrno(int num_regs)
+{
+    /*
+     * The order of vector CSRs in the switch case
+     * should match with the order defined in csr_ops[].
+     */
+    switch (num_regs) {
+    case 32:
+        return CSR_VSTART;
+    case 33:
+        return CSR_VXSAT;
+    case 34:
+        return CSR_VXRM;
+    case 35:
+        return CSR_VCSR;
+    case 36:
+        return CSR_VL;
+    case 37:
+        return CSR_VTYPE;
+    case 38:
+        return CSR_VLENB;
+    default:
+        /* Unknown register. */
+        return 0;
+    }
+}
+
+static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
+{
+    uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    if (n < 32) {
+        int i;
+        int cnt = 0;
+        for (i = 0; i < vlenb; i += 8) {
+            cnt += gdb_get_reg64(buf,
+                                 env->vreg[(n * vlenb + i) / 8]);
+        }
+        return cnt;
+    }
+
+    int csrno = riscv_gdb_vector_csrno(n);
+
+    if (!csrno) {
+        return 0;
+    }
+
+    target_ulong val = 0;
+    int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
+
+    if (result == 0) {
+        return gdb_get_regl(buf, val);
+    }
+
+    return 0;
+}
+
+static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
+{
+    uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
+    if (n < 32) {
+        int i;
+        for (i = 0; i < vlenb; i += 8) {
+            env->vreg[(n * vlenb + i) / 8] = ldq_p(mem_buf + i);
+        }
+        return vlenb;
+    }
+
+    int csrno = riscv_gdb_vector_csrno(n);
+
+    if (!csrno) {
+        return 0;
+    }
+
+    target_ulong val = ldtul_p(mem_buf);
+    int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
+
+    if (result == 0) {
+        return sizeof(target_ulong);
+    }
+
+    return 0;
+}
+
 static int riscv_gdb_get_csr(CPURISCVState *env, GByteArray *buf, int n)
 {
     if (n < CSR_TABLE_SIZE) {
@@ -187,6 +303,68 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
     return CSR_TABLE_SIZE;
 }
 
+static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    GString *s = g_string_new(NULL);
+    g_autoptr(GString) ts = g_string_new("");
+    int reg_width = cpu->cfg.vlen;
+    int num_regs = 0;
+    int i;
+
+    g_string_printf(s, "<?xml version=\"1.0\"?>");
+    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
+    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.riscv.vector\">");
+
+    /* First define types and totals in a whole VL */
+    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
+        int count = reg_width / vec_lanes[i].size;
+        g_string_printf(ts, "%s", vec_lanes[i].id);
+        g_string_append_printf(s,
+                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
+                               ts->str, vec_lanes[i].gdb_type, count);
+    }
+
+    /* Define unions */
+    g_string_append_printf(s, "<union id=\"riscv_vector\">");
+    for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
+        g_string_append_printf(s, "<field name=\"%c\" type=\"%s\"/>",
+                               vec_lanes[i].suffix,
+                               vec_lanes[i].id);
+    }
+    g_string_append(s, "</union>");
+
+    /* Define vector registers */
+    for (i = 0; i < 32; i++) {
+        g_string_append_printf(s,
+                               "<reg name=\"v%d\" bitsize=\"%d\""
+                               " regnum=\"%d\" group=\"vector\""
+                               " type=\"riscv_vector\"/>",
+                               i, reg_width, base_reg++);
+        num_regs++;
+    }
+
+    /* Define vector CSRs */
+    const char *vector_csrs[7] = {
+        "vstart", "vxsat", "vxrm", "vcsr",
+        "vl", "vtype", "vlenb"
+    };
+
+    for (i = 0; i < 7; i++) {
+        g_string_append_printf(s,
+                               "<reg name=\"%s\" bitsize=\"%d\""
+                               " regnum=\"%d\" group=\"vector\""
+                               " type=\"int\"/>",
+                               vector_csrs[i], TARGET_LONG_BITS, base_reg++);
+        num_regs++;
+    }
+
+    g_string_append_printf(s, "</feature>");
+
+    cpu->dyn_vreg_xml = g_string_free(s, false);
+    return num_regs;
+}
+
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
@@ -198,6 +376,12 @@ void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
         gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
                                  36, "riscv-32bit-fpu.xml", 0);
     }
+    if (env->misa & RVV) {
+        gdb_register_coprocessor(cs, riscv_gdb_get_vector, riscv_gdb_set_vector,
+                                 ricsv_gen_dynamic_vector_xml(cs,
+                                                              cs->gdb_num_regs),
+                                 "riscv-vector.xml", 0);
+    }
 #if defined(TARGET_RISCV32)
     gdb_register_coprocessor(cs, riscv_gdb_get_virtual, riscv_gdb_set_virtual,
                              1, "riscv-32bit-virtual.xml", 0);
-- 
2.17.1


