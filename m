Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390CD2DBD59
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:13:35 +0100 (CET)
Received: from localhost ([::1]:46620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSsI-0006Ge-8N
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSpn-0004kh-4m; Wed, 16 Dec 2020 04:10:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSpk-0007H4-KR; Wed, 16 Dec 2020 04:10:58 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG92RHh028487; Wed, 16 Dec 2020 04:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=UoktslZxUvRLpe5e2Q74so+Hlan9Ao0g+ynl4a54ohQ=;
 b=f3coDdUkX51mtGlsl8BZJhRwVZo203k2dKd63l++P14iFDEARZKLZ/AbM9fMJSMGVA0C
 mNKZC1dwQvrGyo/jj/GouMqmepWsnvf6v60KlkjNvB1qe6ZtV2aWEJG+kxbGMwPfzzAe
 cAeQ79T+kv2NAzzfTKBAwzKhMP7QSGytSG7kbF+EzBHm4bTHbw6ShN82Iwp+z50ixWot
 TPrM13CcjA9QeNl8cYv7cQwwR8TZkpCLUK0aA1mnwGh0WG9DanVCKKx6M+Y3TGx4DkpL
 r1oOdh5JCbensWsDqBuY59lG4nPWKml1yoBO1IasXfRdMj8w9JHVsjKzZdS33cJiH3Nc AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fdvg2p4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:10:43 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG94SgM035159;
 Wed, 16 Dec 2020 04:10:43 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35fdvg2p3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:10:43 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG989Il031094;
 Wed, 16 Dec 2020 09:10:41 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 35cng96d3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 09:10:41 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG9Aebd21823808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 09:10:41 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4F127805F;
 Wed, 16 Dec 2020 09:10:40 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C9637805E;
 Wed, 16 Dec 2020 09:10:34 +0000 (GMT)
Received: from pub.ltc.br.ibm.com (unknown [9.85.141.22])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 09:10:33 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/7] target/ppc: Add infrastructure for prefixed
 instructions
Date: Wed, 16 Dec 2020 06:07:58 -0300
Message-Id: <20201216090804.58640-2-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216090804.58640-1-gromero@linux.ibm.com>
References: <20201216090804.58640-1-gromero@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_02:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160055
Received-SPF: pass client-ip=148.163.156.1; envelope-from=gromero@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, gromero@linux.ibm.com,
 gustavo.romero@protonmail.com, Michael Roth <mdroth@linux.vnet.ibm.com>,
 mroth@lamentation.net, clg@kaod.org, david@gibson.dropbear.id.au,
 alex.bennee@linaro.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Roth <mdroth@linux.vnet.ibm.com>

Some prefixed instructions (Type 0 and 1, e.g. 8-byte Load/Store or 8LS),
have a completely seperate namespace for their primary opcodes.

Other prefixed instructions (Type 2 and 3, e.g. Modified Load/Store or MLS)
actually re-use existing opcodes to provide a modified variant. We could
handle these by extending the existing opcode handlers to check for the
prefix and handle accordingly, but in some cases it is cleaner to define
seperate handlers for these in their own table entry, and avoids the need
to add error-handling to existing handlers for cases where they are called
for a prefixed Type 2/3 instruction but don't implement the handling for
them. In the future we can re-work things to support both approaches if
cases arise where that seems warranted.

Then we have the normal non-prefixed instructions.

To handle all 3 of these cases we extend the table size 3x, with normal
instructions indexed directly by their primary opcodes, Type 0/1 indexed by
primary opcode + PPC_CPU_PREFIXED_OPCODE_OFFSET, and Type 2/3 indexed by
primary opcode + PPC_CPU_PREFIXED_MODIFIED_OPCODE_OFFSET.

Various exception/SRR handling changes related to prefixed instructions are
yet to be implemented. For instance, no alignment interrupt is generated if
a prefixed instruction crosses the 64-byte boundary; no SRR bit related to
prefixed instructions is set on any interrupt, like for FP unavailable
interrupt, data storage interrupt, etc.

For details, please see PowerISA v3.1, particularly the following sections:

1.6 Instruction Formats, p. 11
1.6.3  Instruction Prefix Formats, p. 22
3.3.2  Fixed-Point Load Instructions, p. 51
4.6.2  Floating-Point Load Instructions, p. 149
Chapter 7 Interrupts, p. 1247

Signed-off-by: Michael Roth <mroth@lamentation.net>
[ gromero: - comments clean up and updates
           - additional comments in the commit log ]
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 target/ppc/cpu.h                |  30 +++++-
 target/ppc/internal.h           |  14 +++
 target/ppc/translate.c          | 170 +++++++++++++++++++++++++++++++-
 target/ppc/translate_init.c.inc |  11 ++-
 4 files changed, 218 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e8aa185d4f..1e40a923bd 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -979,8 +979,34 @@ struct ppc_radix_page_info {
 #define PPC_TLB_EPID_LOAD 8
 #define PPC_TLB_EPID_STORE 9
 
-#define PPC_CPU_OPCODES_LEN          0x40
-#define PPC_CPU_INDIRECT_OPCODES_LEN 0x20
+/*
+ * The primary op-code field extracted from the instruction (PO) is used as the
+ * index in the top-level QEMU opcode table. That table is then further used to
+ * find the proper handler, or a pointer to another table (OPC1, OPC2 etc). For
+ * the normal opcodes (PO field of normal insns) the 64 first entries are used.
+ *
+ * Prefixed instructions can be divided into two major groups of instructions:
+ * the first group is formed by type 0 and 1, and the second group is by type 2
+ * and 3. Opcodes (PO) related to prefixed type 0/1 can have the same opcodes
+ * as the normal instructions but don't have any semantics related to them. But
+ * since it's an primary opcode anyway it was decided to simply extend the
+ * top-level table that handles the primary opcodes for the normal instructions.
+ * On the other handle, prefixed instructions type 2/3 work like modifiers for
+ * existing normal instructions. In that case it would be possible to reuse the
+ * handlers for the normal instructions, but that would require changing the
+ * normal instruction handler in a way it would have to check, for instance, on
+ * which ISA it has to take care of prefixes insns, and that is already done by
+ * GEN_HANDLER_* helpers when registering a new instruction, where there is a
+ * a field to inform on which ISA the instruction exists. Hence, it was decided
+ * to add another 64 entries for specific handler for the prefixed instructions
+ * of type 2/3. Thus the size of top-level PO lookup table is 3*64 = 192, hence
+ * representing three namespaces for decoding PO: for normal insns, for type 0/1
+ * and for type 2/3.
+ */
+#define PPC_CPU_OPCODES_LEN                     0xc0 /* 64 + 64 + 64 = 192 */
+#define PPC_CPU_INDIRECT_OPCODES_LEN            0x20
+#define PPC_CPU_PREFIXED_OPCODE_OFFSET          0x40 /* Prefixed type 0/1  */
+#define PPC_CPU_PREFIXED_MODIFIED_OPCODE_OFFSET 0x80 /* Prefixed type 2/3  */
 
 struct CPUPPCState {
     /* Most commonly used resources during translated code execution first */
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 15d655b356..d03d691a44 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -129,6 +129,7 @@ EXTRACT_SHELPER(SIMM5, 16, 5);
 EXTRACT_HELPER(UIMM5, 16, 5);
 /* 4 bits unsigned immediate value */
 EXTRACT_HELPER(UIMM4, 16, 4);
+
 /* Bit count */
 EXTRACT_HELPER(NB, 11, 5);
 /* Shift count */
@@ -146,6 +147,19 @@ EXTRACT_HELPER(TO, 21, 5);
 
 EXTRACT_HELPER(CRM, 12, 8);
 
+/*
+ * Instruction prefix fields
+ *
+ * as per PowerISA 3.1 1.6.3
+ */
+
+/* prefixed instruction type */
+EXTRACT_HELPER(PREFIX_TYPE, 24, 2);
+/* 1-bit sub-type */
+EXTRACT_HELPER(PREFIX_ST1, 23, 1);
+/* 4-bit sub-type */
+EXTRACT_HELPER(PREFIX_ST4, 20, 4);
+
 #ifndef CONFIG_USER_ONLY
 EXTRACT_HELPER(SR, 16, 4);
 #endif
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index fedb9b2271..eab6561094 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -180,6 +180,8 @@ struct DisasContext {
     uint32_t flags;
     uint64_t insns_flags;
     uint64_t insns_flags2;
+    uint32_t prefix;
+    uint32_t prefix_subtype;
 };
 
 /* Return true iff byteswap is needed in a scalar memop */
@@ -376,6 +378,12 @@ GEN_OPCODE(name, opc1, opc2, opc3, inval, type, PPC_NONE)
 #define GEN_HANDLER_E(name, opc1, opc2, opc3, inval, type, type2)             \
 GEN_OPCODE(name, opc1, opc2, opc3, inval, type, type2)
 
+#define GEN_HANDLER_E_PREFIXED(name, opc1, opc2, opc3, inval, type, type2)    \
+GEN_OPCODE_PREFIXED(name, opc1, opc2, opc3, inval, type, type2, false)
+
+#define GEN_HANDLER_E_PREFIXED_M(name, opc1, opc2, opc3, inval, type, type2)  \
+GEN_OPCODE_PREFIXED(name, opc1, opc2, opc3, inval, type, type2, true)
+
 #define GEN_HANDLER2(name, onam, opc1, opc2, opc3, inval, type)               \
 GEN_OPCODE2(name, onam, opc1, opc2, opc3, inval, type, PPC_NONE)
 
@@ -395,6 +403,8 @@ typedef struct opcode_t {
 #endif
     opc_handler_t handler;
     const char *oname;
+    bool prefixed;
+    bool modified;
 } opcode_t;
 
 /* Helpers for priv. check */
@@ -449,6 +459,23 @@ typedef struct opcode_t {
     },                                                                        \
     .oname = stringify(name),                                                 \
 }
+#define GEN_OPCODE_PREFIXED(name, op1, op2, op3, invl, _typ, _typ2, _modified)\
+{                                                                             \
+    .opc1 = op1,                                                              \
+    .opc2 = op2,                                                              \
+    .opc3 = op3,                                                              \
+    .opc4 = 0xff,                                                             \
+    .handler = {                                                              \
+        .inval1  = invl,                                                      \
+        .type = _typ,                                                         \
+        .type2 = _typ2,                                                       \
+        .handler = &gen_##name,                                               \
+        .oname = stringify(name),                                             \
+    },                                                                        \
+    .oname = stringify(name),                                                 \
+    .prefixed = true,                                                         \
+    .modified = _modified,                                                    \
+}
 #define GEN_OPCODE_DUAL(name, op1, op2, op3, invl1, invl2, _typ, _typ2)       \
 {                                                                             \
     .opc1 = op1,                                                              \
@@ -525,6 +552,22 @@ typedef struct opcode_t {
     },                                                                        \
     .oname = stringify(name),                                                 \
 }
+#define GEN_OPCODE_PREFIXED(name, op1, op2, op3, invl, _typ, _typ2, _modified)\
+{                                                                             \
+    .opc1 = op1,                                                              \
+    .opc2 = op2,                                                              \
+    .opc3 = op3,                                                              \
+    .opc4 = 0xff,                                                             \
+    .handler = {                                                              \
+        .inval1  = invl,                                                      \
+        .type = _typ,                                                         \
+        .type2 = _typ2,                                                       \
+        .handler = &gen_##name,                                               \
+    },                                                                        \
+    .oname = stringify(name),                                                 \
+    .prefixed = true,                                                         \
+    .modified = _modified,                                                    \
+}
 #define GEN_OPCODE_DUAL(name, op1, op2, op3, invl1, invl2, _typ, _typ2)       \
 {                                                                             \
     .opc1 = op1,                                                              \
@@ -7991,6 +8034,101 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     return true;
 }
 
+
+
+/*
+ * Prefixed instruction sub-types
+ *
+ * as per PowerISA 3.1 1.6.3
+ */
+enum {
+    /* prefixed instruction but subtype doesn't match any of below ones */
+    PREFIX_ST_INVALID   = -1,
+    /* non-prefixed instruction (normal instruction) */
+    PREFIX_ST_NONE      = 0,
+    /* Type 0b00 prefixed insn sub-types */
+    PREFIX_ST_8LS,      /* 8-byte load/store */
+    PREFIX_ST_8MLS,     /* 8-byte masked load/store */
+    /* Type 0b01 prefixed insn sub-types */
+    PREFIX_ST_8RR,      /* 8-byte reg-to-reg */
+    PREFIX_ST_8MRR,     /* 8-byte masked reg-to-reg */
+    /* Type 0b10 prefixed insn sub-types */
+    PREFIX_ST_MLS,      /* modified load/store */
+    PREFIX_ST_MMLS,     /* modified masked load/store */
+    /* Type 0b11 prefixed insn sub-types */
+    PREFIX_ST_MRR,      /* modified reg-to-reg */
+    PREFIX_ST_MMRR,     /* modified mask reg-to-reg */
+    PREFIX_ST_MMIRR,    /* modified masked immediate reg-to-reg */
+};
+
+static int32_t parse_prefix_subtype(uint32_t prefix)
+{
+    int32_t prefix_subtype = PREFIX_ST_INVALID;
+
+    /* primary opcode 1 is reserved for instruction prefixes */
+    if (opc1(prefix) != 1) {
+        return PREFIX_ST_NONE;
+    }
+
+    switch (PREFIX_TYPE(prefix)) {
+    case 0:
+        if (PREFIX_ST1(prefix) == 0) {
+            prefix_subtype = PREFIX_ST_8LS;
+        } else if (PREFIX_ST1(prefix) == 1) {
+            prefix_subtype = PREFIX_ST_8MLS;
+        }
+        break;
+    case 1:
+        if (PREFIX_ST4(prefix) == 0) {
+            prefix_subtype = PREFIX_ST_8RR;
+        } else if (PREFIX_ST4(prefix) == 8) {
+            prefix_subtype = PREFIX_ST_8MRR;
+        }
+        break;
+    case 2:
+        if (PREFIX_ST1(prefix) == 0) {
+            prefix_subtype = PREFIX_ST_MLS;
+        } else if (PREFIX_ST1(prefix) == 1) {
+            prefix_subtype = PREFIX_ST_MMLS;
+        }
+        break;
+    case 3:
+        if (PREFIX_ST4(prefix) == 0) {
+            prefix_subtype = PREFIX_ST_MRR;
+        } else if (PREFIX_ST4(prefix) == 8) {
+            prefix_subtype = PREFIX_ST_MMRR;
+        } else if (PREFIX_ST4(prefix) == 9) {
+            prefix_subtype = PREFIX_ST_MMIRR;
+        }
+        break;
+    }
+
+    return prefix_subtype;
+}
+
+static uint32_t opc1_idx(DisasContext *ctx)
+{
+    uint32_t table_offset = 0;
+
+    switch (ctx->prefix_subtype) {
+    case PREFIX_ST_8LS:
+    case PREFIX_ST_8MLS:
+    case PREFIX_ST_8RR:
+    case PREFIX_ST_8MRR:
+        table_offset = PPC_CPU_PREFIXED_OPCODE_OFFSET;
+        break;
+    case PREFIX_ST_MLS:
+    case PREFIX_ST_MMLS:
+    case PREFIX_ST_MRR:
+    case PREFIX_ST_MMRR:
+    case PREFIX_ST_MMIRR:
+        table_offset = PPC_CPU_PREFIXED_MODIFIED_OPCODE_OFFSET;
+        break;
+    }
+
+    return table_offset + opc1(ctx->opcode);
+}
+
 static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
@@ -8004,14 +8142,40 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 
     ctx->opcode = translator_ldl_swap(env, ctx->base.pc_next,
                                       need_byteswap(ctx));
+    /* check for prefix */
+    ctx->prefix_subtype = parse_prefix_subtype(ctx->opcode);
+    if (ctx->prefix_subtype == PREFIX_ST_INVALID) {
+        qemu_log_mask(LOG_GUEST_ERROR, "invalid/unsupported prefix: "
+                      "%08x " TARGET_FMT_lx "\n",
+                      ctx->prefix, ctx->base.pc_next);
+    } else if (ctx->prefix_subtype != PREFIX_ST_NONE) {
+        /*
+         * this is the 4-byte prefix of an instruction, read the
+         * next 4 and advance the PC
+         *
+         * TODO: we can optimize this to do a single load since we
+         * read in target_long anyways already
+         *
+         * double-check endianess cases.
+         *
+         * engineering note about endianess changing based on rfid
+         * or interrupt. does this need to be accounted for here?
+         */
+        ctx->prefix = ctx->opcode;
+        ctx->base.pc_next += 4;
+        ctx->opcode = translator_ldl_swap(env, ctx->base.pc_next,
+                                          need_byteswap(ctx));
+    } else {
+        ctx->prefix = 0;
+    }
 
-    LOG_DISAS("translate opcode %08x (%02x %02x %02x %02x) (%s)\n",
+    LOG_DISAS("translate opcode %08x (%02x %02x %02x %02x) prefix %08x (%s)\n",
               ctx->opcode, opc1(ctx->opcode), opc2(ctx->opcode),
-              opc3(ctx->opcode), opc4(ctx->opcode),
+              opc3(ctx->opcode), opc4(ctx->opcode), ctx->prefix,
               ctx->le_mode ? "little" : "big");
     ctx->base.pc_next += 4;
     table = cpu->opcodes;
-    handler = table[opc1(ctx->opcode)];
+    handler = table[opc1_idx(ctx)];
     if (is_indirect_opcode(handler)) {
         table = ind_table(handler);
         handler = table[opc2(ctx->opcode)];
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index bb66526280..0ea8c2c5c1 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -9563,8 +9563,13 @@ static int insert_in_table(opc_handler_t **table, unsigned char idx,
 }
 
 static int register_direct_insn(opc_handler_t **ppc_opcodes,
-                                unsigned char idx, opc_handler_t *handler)
+                                unsigned char idx, opc_handler_t *handler,
+                                bool prefixed, bool modified)
 {
+    if (prefixed) {
+        idx = modified ? idx + PPC_CPU_PREFIXED_MODIFIED_OPCODE_OFFSET
+                       : idx + PPC_CPU_PREFIXED_OPCODE_OFFSET;
+    }
     if (insert_in_table(ppc_opcodes, idx, handler) < 0) {
         printf("*** ERROR: opcode %02x already assigned in main "
                "opcode table\n", idx);
@@ -9688,7 +9693,8 @@ static int register_insn(opc_handler_t **ppc_opcodes, opcode_t *insn)
             }
         }
     } else {
-        if (register_direct_insn(ppc_opcodes, insn->opc1, &insn->handler) < 0) {
+        if (register_direct_insn(ppc_opcodes, insn->opc1, &insn->handler,
+                                 insn->prefixed, insn->modified) < 0) {
             return -1;
         }
     }
@@ -9766,6 +9772,7 @@ static void dump_ppc_insns(CPUPPCState *env)
     for (opc1 = 0x00; opc1 < PPC_CPU_OPCODES_LEN; opc1++) {
         table = env->opcodes;
         handler = table[opc1];
+        /* TODO: need to update opcode dump to account for prefixed space */
         if (is_indirect_opcode(handler)) {
             /* opc2 is 5 bits long */
             for (opc2 = 0; opc2 < PPC_CPU_INDIRECT_OPCODES_LEN; opc2++) {
-- 
2.17.1


