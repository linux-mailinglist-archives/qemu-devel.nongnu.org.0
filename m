Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C02DBD6A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:18:38 +0100 (CET)
Received: from localhost ([::1]:32828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpSxB-0003me-Nc
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSqD-0005CB-D2; Wed, 16 Dec 2020 04:11:25 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13584
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gromero@linux.ibm.com>)
 id 1kpSqB-0007NY-3U; Wed, 16 Dec 2020 04:11:25 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BG93vHR140842; Wed, 16 Dec 2020 04:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=CoA67O50IW9BVuVBZwocpCeADYdBCFfpfHhsgm8nkvk=;
 b=CUJLbu34Y6qFCaubiPseFekVQZlp17HItycG/R1HiXn4Ny1lHx2vfely9ia5Z+DQjvZg
 +pTRVdmHWhSvYOIMgpLLdtusKcGo0+YO77hiw6hQ40kRVf6MUqxVMb0I2iu7G6V6sN+j
 5/hPOpLlqf7vKcI6BvhRG/Rd2gdoXiHzsQbdeMaLintSRN2H5unlK4FPcf4bJis//u28
 Xt83blP+s2AOb6O5vyiViN1V2DzFglpy/XBGvL9am6Gq9kXlX/V2kI//j6cqaNwxIPa6
 VMGUS3cmpDDWva3BszIAIAsLQBh7pgrU4tnVh4kRYIzDnu0NWAuMsBLIU4bcN57pflqe HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35fe53j54g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:11:12 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BG95Ob9148599;
 Wed, 16 Dec 2020 04:11:12 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35fe53j541-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 04:11:11 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BG8uuGZ006090;
 Wed, 16 Dec 2020 09:11:11 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 35cng8unx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Dec 2020 09:11:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BG9B5di23986658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Dec 2020 09:11:05 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CA7778067;
 Wed, 16 Dec 2020 09:11:05 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0625E7805C;
 Wed, 16 Dec 2020 09:10:59 +0000 (GMT)
Received: from pub.ltc.br.ibm.com (unknown [9.85.141.22])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Dec 2020 09:10:58 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] target/ppc: Add support for paired vector load/store
 instructions
Date: Wed, 16 Dec 2020 06:08:01 -0300
Message-Id: <20201216090804.58640-5-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216090804.58640-1-gromero@linux.ibm.com>
References: <20201216090804.58640-1-gromero@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-16_02:2020-12-15,
 2020-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012160058
Received-SPF: pass client-ip=148.163.158.5; envelope-from=gromero@linux.ibm.com;
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

This adds support for the following load/store instructions for paired
vector registers:

  lxvp, plxvp, lxvpx
  stxvp, pstxvp, stxvpx

Signed-off-by: Michael Roth <mroth@lamentation.net>
[ gromero: - fix in helper_load_paired_vec(), for LE
           - fix in helper_store_paired_vec(), for LE
           - fix build when target != PPC64 ]
Sgined-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 target/ppc/helper.h                 |  3 ++
 target/ppc/internal.h               |  7 +++
 target/ppc/mem_helper.c             | 61 ++++++++++++++++++++++++++
 target/ppc/translate.c              |  8 ++++
 target/ppc/translate/vsx-impl.c.inc | 66 +++++++++++++++++++++++++++++
 5 files changed, 145 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 6a4dccf70c..e8ecd2e878 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -279,6 +279,9 @@ DEF_HELPER_4(lxvl, void, env, tl, vsr, tl)
 DEF_HELPER_4(lxvll, void, env, tl, vsr, tl)
 DEF_HELPER_4(stxvl, void, env, tl, vsr, tl)
 DEF_HELPER_4(stxvll, void, env, tl, vsr, tl)
+/* lxvp/stxvp, plxvp/pstxvp, lxvpx/stxvpx */
+DEF_HELPER_4(store_paired_vec, void, env, tl, vsr, vsr)
+DEF_HELPER_4(load_paired_vec, void, env, tl, vsr, vsr)
 #endif
 DEF_HELPER_4(vsumsws, void, env, avr, avr, avr)
 DEF_HELPER_4(vsum2sws, void, env, avr, avr, avr)
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index f67bd30730..27a5311e3a 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -80,6 +80,12 @@ static inline int16_t name(uint32_t opcode)                                   \
         (((opcode >> (shift_op_d2)) & ((1 << (d2_bits)) - 1)) << (shift_d2));  \
 }
 
+#define EXTRACT_HELPER_SPLIT_SHIFTED(name, shift1, nb1, shift2, nb2, shift3)  \
+static inline uint32_t name(uint32_t opcode)                                  \
+{                                                                             \
+    return extract32(opcode, shift1, nb1) << (nb2 + shift3) |                 \
+               extract32(opcode, shift2, nb2) << shift3;                      \
+}
 
 /* Opcode part 1 */
 EXTRACT_HELPER(opc1, 26, 6);
@@ -226,6 +232,7 @@ EXTRACT_HELPER(SP, 19, 2);
 EXTRACT_HELPER(IMM8, 11, 8);
 EXTRACT_HELPER(DCMX, 16, 7);
 EXTRACT_HELPER_SPLIT_3(DCMX_XV, 5, 16, 0, 1, 2, 5, 1, 6, 6);
+EXTRACT_HELPER_SPLIT_SHIFTED(xTp, 21, 1, 22, 4, 1);
 
 void helper_compute_fprf_float16(CPUPPCState *env, float16 arg);
 void helper_compute_fprf_float32(CPUPPCState *env, float32 arg);
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 98f589552b..8d35a19c68 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -532,6 +532,67 @@ STVE(stvewx, cpu_stl_data_ra, bswap32, u32)
 #undef I
 #undef LVE
 
+#ifdef TARGET_PPC64
+void helper_load_paired_vec(CPUPPCState *env, target_ulong addr,
+                            ppc_vsr_t *xt0, ppc_vsr_t *xt1)
+{
+    ppc_vsr_t t0, t1;
+    int i;
+
+    t0.s128 = int128_zero();
+    t1.s128 = int128_zero();
+
+    if (msr_le) {
+        for (i = 0; i < 16; i++) {
+            t1.VsrB(15 - i) = cpu_ldub_data_ra(env, addr, GETPC());
+            addr = addr_add(env, addr, 1);
+        }
+        for (i = 0; i < 16; i++) {
+            t0.VsrB(15 - i) = cpu_ldub_data_ra(env, addr, GETPC());
+            addr = addr_add(env, addr, 1);
+        }
+    } else { // TODO: check if it's correct for BE.
+        for (i = 0; i < 16; i++) {
+            t0.VsrB(i) = cpu_ldub_data_ra(env, addr, GETPC());
+            addr = addr_add(env, addr, 1);
+        }
+        for (i = 0; i < 16; i++) {
+            t1.VsrB(i) = cpu_ldub_data_ra(env, addr, GETPC());
+            addr = addr_add(env, addr, 1);
+        }
+    }
+
+    *xt0 = t0;
+    *xt1 = t1;
+}
+
+void helper_store_paired_vec(CPUPPCState *env, target_ulong addr,
+                             ppc_vsr_t *xt0, ppc_vsr_t *xt1)
+{
+    int i;
+
+    if (msr_le) {
+        for (i = 0; i < 16; i++) {
+            cpu_stb_data_ra(env, addr, xt1->VsrB(15 - i), GETPC());
+            addr = addr_add(env, addr, 1);
+        }
+        for (i = 0; i < 16; i++) {
+            cpu_stb_data_ra(env, addr, xt0->VsrB(15 - i), GETPC());
+            addr = addr_add(env, addr, 1);
+        }
+    } else { // TODO: check if it's correct for BE.
+        for (i = 0; i < 16; i++) {
+            cpu_stb_data_ra(env, addr, xt0->VsrB(i), GETPC());
+            addr = addr_add(env, addr, 1);
+        }
+        for (i = 0; i < 16; i++) {
+            cpu_stb_data_ra(env, addr, xt1->VsrB(i), GETPC());
+            addr = addr_add(env, addr, 1);
+        }
+    }
+}
+#endif /* TARGET_PPC64 */
+
 #ifdef TARGET_PPC64
 #define GET_NB(rb) ((rb >> 56) & 0xFF)
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0bca3a02e4..25a3c1198b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7397,6 +7397,14 @@ GEN_HANDLER_E_PREFIXED(pstq, 0x3c, 0xFF, 0xFF, 0x00000000, PPC_64B, PPC2_ISA310)
 GEN_HANDLER_E(dform39, 0x39, 0xFF, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA205),
 /* handles stfdp, lxv, stxsd, stxssp, stxv */
 GEN_HANDLER_E(dform3D, 0x3D, 0xFF, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA205),
+#if defined(TARGET_PPC64)
+GEN_HANDLER_E_PREFIXED(plxvp, 0x3A, 0xFF, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA310),
+GEN_HANDLER_E_PREFIXED(pstxvp, 0x3E, 0xFF, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA310),
+/* handles lxvp, stxvp */
+GEN_HANDLER_E(dqform6, 0x6, 0x0, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA310),
+GEN_HANDLER_E(lxvpx, 0x1F, 0xD, 0xA, 0x00000000, PPC_NONE, PPC2_ISA310),
+GEN_HANDLER_E(stxvpx, 0x1F, 0xD, 0xE, 0x00000000, PPC_NONE, PPC2_ISA310),
+#endif
 GEN_HANDLER(lmw, 0x2E, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER(stmw, 0x2F, 0xFF, 0xFF, 0x00000000, PPC_INTEGER),
 GEN_HANDLER(lswi, 0x1F, 0x15, 0x12, 0x00000001, PPC_STRING),
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index b518de46db..6640b7ae05 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -376,6 +376,72 @@ VSX_VECTOR_LOAD_STORE_LENGTH(stxvl)
 VSX_VECTOR_LOAD_STORE_LENGTH(stxvll)
 #endif
 
+#ifdef TARGET_PPC64
+
+static void gen_dqform6(DisasContext *ctx)
+{
+    TCGv EA;
+    TCGv_ptr xt0, xt1;
+
+    EA = tcg_temp_new();
+    xt0 = gen_vsr_ptr(xTp(ctx->opcode));
+    xt1 = gen_vsr_ptr(xTp(ctx->opcode) + 1);
+    gen_set_access_type(ctx, ACCESS_INT);
+    gen_addr_imm_index(ctx, EA, 0x0F);
+
+    if (extract32(ctx->opcode, 0, 4) == 1) {
+        /* stxvp */
+        gen_helper_store_paired_vec(cpu_env, EA, xt0, xt1);
+    } else {
+        /* lxvp */
+        gen_helper_load_paired_vec(cpu_env, EA, xt0, xt1);
+    }
+
+    tcg_temp_free(EA);
+    tcg_temp_free_ptr(xt0);
+    tcg_temp_free_ptr(xt1);
+}
+
+#define VSX_VECTOR_LOAD_STORE_PAIRED(name, dform, op)              \
+static void gen_##name(DisasContext *ctx)                          \
+{                                                                  \
+    TCGv EA;                                                       \
+    TCGv_ptr xt0, xt1;                                             \
+                                                                   \
+    if (unlikely(!ctx->altivec_enabled)) {                         \
+        gen_exception(ctx, POWERPC_EXCP_VPU);                      \
+        return;                                                    \
+    }                                                              \
+                                                                   \
+    EA = tcg_temp_new();                                           \
+    xt0 = gen_vsr_ptr(xTp(ctx->opcode));                           \
+    xt1 = gen_vsr_ptr(xTp(ctx->opcode) + 1);                       \
+    gen_set_access_type(ctx, ACCESS_INT);                          \
+                                                                   \
+     if (dform) {                                                  \
+        /* pstxvp, plxvp, 8LS, D-form */                           \
+        if (gen_addr_imm34_index(ctx, EA)) {                       \
+            goto out;                                              \
+        }                                                          \
+    } else {                                                       \
+        /* lxvpx, stxvpx, X-form */                                \
+        gen_addr_reg_index(ctx, EA);                               \
+    }                                                              \
+                                                                   \
+    gen_helper_##op##_paired_vec(cpu_env, EA, xt0, xt1);           \
+out:                                                               \
+    tcg_temp_free(EA);                                             \
+    tcg_temp_free_ptr(xt0);                                        \
+    tcg_temp_free_ptr(xt1);                                        \
+}
+
+VSX_VECTOR_LOAD_STORE_PAIRED(plxvp, 1, load)
+VSX_VECTOR_LOAD_STORE_PAIRED(pstxvp, 1, store)
+VSX_VECTOR_LOAD_STORE_PAIRED(lxvpx, 0, load)
+VSX_VECTOR_LOAD_STORE_PAIRED(stxvpx, 0, store)
+
+#endif
+
 #define VSX_LOAD_SCALAR_DS(name, operation)                       \
 static void gen_##name(DisasContext *ctx)                         \
 {                                                                 \
-- 
2.17.1


