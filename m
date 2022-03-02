Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978B74CA3F9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 12:41:29 +0100 (CET)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPNMG-0004xF-MP
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 06:41:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqy-0000tX-Ok; Wed, 02 Mar 2022 06:09:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMqw-0001nq-Id; Wed, 02 Mar 2022 06:09:08 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AIKQE022613; 
 Wed, 2 Mar 2022 11:08:39 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6qa0xvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B37Kt017743;
 Wed, 2 Mar 2022 11:08:36 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3egbj19jsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:08:36 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B8YmE46793172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:08:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47C7952077;
 Wed,  2 Mar 2022 11:08:34 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 051B052059;
 Wed,  2 Mar 2022 11:08:33 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5478A220294;
 Wed,  2 Mar 2022 12:08:33 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 39/87] tcg/tcg-op-gvec.c: Introduce tcg_gen_gvec_4i
Date: Wed,  2 Mar 2022 12:07:15 +0100
Message-Id: <20220302110803.849505-40-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qCA53RngevZn22Ne0Rr6WRh4jTBIfYJZ
X-Proofpoint-ORIG-GUID: qCA53RngevZn22Ne0Rr6WRh4jTBIfYJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1034
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=915 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, OBFU_UNSUB_UL=1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Following the implementation of tcg_gen_gvec_3i, add a four-vector and
immediate operand expansion method.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220225210936.1749575-34-matheus.ferst@eldorado.org.br>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/tcg/tcg-op-gvec.h |  22 ++++++
 tcg/tcg-op-gvec.c         | 146 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 168 insertions(+)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index da55fed8704a..28cafbcc5ce0 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -218,6 +218,25 @@ typedef struct {
     bool write_aofs;
 } GVecGen4;
=20
+typedef struct {
+    /*
+     * Expand inline as a 64-bit or 32-bit integer. Only one of these wi=
ll be
+     * non-NULL.
+     */
+    void (*fni8)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64, int64_t);
+    void (*fni4)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_i32, int32_t);
+    /* Expand inline with a host vector type.  */
+    void (*fniv)(unsigned, TCGv_vec, TCGv_vec, TCGv_vec, TCGv_vec, int64=
_t);
+    /* Expand out-of-line helper w/descriptor, data in descriptor.  */
+    gen_helper_gvec_4 *fno;
+    /* The optional opcodes, if any, utilized by .fniv.  */
+    const TCGOpcode *opt_opc;
+    /* The vector element size, if applicable.  */
+    uint8_t vece;
+    /* Prefer i64 to v64.  */
+    bool prefer_i64;
+} GVecGen4i;
+
 void tcg_gen_gvec_2(uint32_t dofs, uint32_t aofs,
                     uint32_t oprsz, uint32_t maxsz, const GVecGen2 *);
 void tcg_gen_gvec_2i(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
@@ -231,6 +250,9 @@ void tcg_gen_gvec_3i(uint32_t dofs, uint32_t aofs, ui=
nt32_t bofs,
                      const GVecGen3i *);
 void tcg_gen_gvec_4(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_=
t cofs,
                     uint32_t oprsz, uint32_t maxsz, const GVecGen4 *);
+void tcg_gen_gvec_4i(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32=
_t cofs,
+                     uint32_t oprsz, uint32_t maxsz, int64_t c,
+                     const GVecGen4i *);
=20
 /* Expand a specific vector operation.  */
=20
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index ffe55e908f8a..079a761b0402 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -836,6 +836,30 @@ static void expand_4_i32(uint32_t dofs, uint32_t aof=
s, uint32_t bofs,
     tcg_temp_free_i32(t0);
 }
=20
+static void expand_4i_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
+                          uint32_t cofs, uint32_t oprsz, int32_t c,
+                          void (*fni)(TCGv_i32, TCGv_i32, TCGv_i32, TCGv=
_i32,
+                                      int32_t))
+{
+    TCGv_i32 t0 =3D tcg_temp_new_i32();
+    TCGv_i32 t1 =3D tcg_temp_new_i32();
+    TCGv_i32 t2 =3D tcg_temp_new_i32();
+    TCGv_i32 t3 =3D tcg_temp_new_i32();
+    uint32_t i;
+
+    for (i =3D 0; i < oprsz; i +=3D 4) {
+        tcg_gen_ld_i32(t1, cpu_env, aofs + i);
+        tcg_gen_ld_i32(t2, cpu_env, bofs + i);
+        tcg_gen_ld_i32(t3, cpu_env, cofs + i);
+        fni(t0, t1, t2, t3, c);
+        tcg_gen_st_i32(t0, cpu_env, dofs + i);
+    }
+    tcg_temp_free_i32(t3);
+    tcg_temp_free_i32(t2);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t0);
+}
+
 /* Expand OPSZ bytes worth of two-operand operations using i64 elements.=
  */
 static void expand_2_i64(uint32_t dofs, uint32_t aofs, uint32_t oprsz,
                          bool load_dest, void (*fni)(TCGv_i64, TCGv_i64)=
)
@@ -971,6 +995,30 @@ static void expand_4_i64(uint32_t dofs, uint32_t aof=
s, uint32_t bofs,
     tcg_temp_free_i64(t0);
 }
=20
+static void expand_4i_i64(uint32_t dofs, uint32_t aofs, uint32_t bofs,
+                          uint32_t cofs, uint32_t oprsz, int64_t c,
+                          void (*fni)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv=
_i64,
+                                      int64_t))
+{
+    TCGv_i64 t0 =3D tcg_temp_new_i64();
+    TCGv_i64 t1 =3D tcg_temp_new_i64();
+    TCGv_i64 t2 =3D tcg_temp_new_i64();
+    TCGv_i64 t3 =3D tcg_temp_new_i64();
+    uint32_t i;
+
+    for (i =3D 0; i < oprsz; i +=3D 8) {
+        tcg_gen_ld_i64(t1, cpu_env, aofs + i);
+        tcg_gen_ld_i64(t2, cpu_env, bofs + i);
+        tcg_gen_ld_i64(t3, cpu_env, cofs + i);
+        fni(t0, t1, t2, t3, c);
+        tcg_gen_st_i64(t0, cpu_env, dofs + i);
+    }
+    tcg_temp_free_i64(t3);
+    tcg_temp_free_i64(t2);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(t0);
+}
+
 /* Expand OPSZ bytes worth of two-operand operations using host vectors.=
  */
 static void expand_2_vec(unsigned vece, uint32_t dofs, uint32_t aofs,
                          uint32_t oprsz, uint32_t tysz, TCGType type,
@@ -1121,6 +1169,35 @@ static void expand_4_vec(unsigned vece, uint32_t d=
ofs, uint32_t aofs,
     tcg_temp_free_vec(t0);
 }
=20
+/*
+ * Expand OPSZ bytes worth of four-vector operands and an immediate oper=
and
+ * using host vectors.
+ */
+static void expand_4i_vec(unsigned vece, uint32_t dofs, uint32_t aofs,
+                          uint32_t bofs, uint32_t cofs, uint32_t oprsz,
+                          uint32_t tysz, TCGType type, int64_t c,
+                          void (*fni)(unsigned, TCGv_vec, TCGv_vec,
+                                     TCGv_vec, TCGv_vec, int64_t))
+{
+    TCGv_vec t0 =3D tcg_temp_new_vec(type);
+    TCGv_vec t1 =3D tcg_temp_new_vec(type);
+    TCGv_vec t2 =3D tcg_temp_new_vec(type);
+    TCGv_vec t3 =3D tcg_temp_new_vec(type);
+    uint32_t i;
+
+    for (i =3D 0; i < oprsz; i +=3D tysz) {
+        tcg_gen_ld_vec(t1, cpu_env, aofs + i);
+        tcg_gen_ld_vec(t2, cpu_env, bofs + i);
+        tcg_gen_ld_vec(t3, cpu_env, cofs + i);
+        fni(vece, t0, t1, t2, t3, c);
+        tcg_gen_st_vec(t0, cpu_env, dofs + i);
+    }
+    tcg_temp_free_vec(t3);
+    tcg_temp_free_vec(t2);
+    tcg_temp_free_vec(t1);
+    tcg_temp_free_vec(t0);
+}
+
 /* Expand a vector two-operand operation.  */
 void tcg_gen_gvec_2(uint32_t dofs, uint32_t aofs,
                     uint32_t oprsz, uint32_t maxsz, const GVecGen2 *g)
@@ -1533,6 +1610,75 @@ void tcg_gen_gvec_4(uint32_t dofs, uint32_t aofs, =
uint32_t bofs, uint32_t cofs,
     }
 }
=20
+/* Expand a vector four-operand operation.  */
+void tcg_gen_gvec_4i(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32=
_t cofs,
+                     uint32_t oprsz, uint32_t maxsz, int64_t c,
+                     const GVecGen4i *g)
+{
+    const TCGOpcode *this_list =3D g->opt_opc ? : vecop_list_empty;
+    const TCGOpcode *hold_list =3D tcg_swap_vecop_list(this_list);
+    TCGType type;
+    uint32_t some;
+
+    check_size_align(oprsz, maxsz, dofs | aofs | bofs | cofs);
+    check_overlap_4(dofs, aofs, bofs, cofs, maxsz);
+
+    type =3D 0;
+    if (g->fniv) {
+        type =3D choose_vector_type(g->opt_opc, g->vece, oprsz, g->prefe=
r_i64);
+    }
+    switch (type) {
+    case TCG_TYPE_V256:
+        /*
+         * Recall that ARM SVE allows vector sizes that are not a
+         * power of 2, but always a multiple of 16.  The intent is
+         * that e.g. size =3D=3D 80 would be expanded with 2x32 + 1x16.
+         */
+        some =3D QEMU_ALIGN_DOWN(oprsz, 32);
+        expand_4i_vec(g->vece, dofs, aofs, bofs, cofs, some,
+                      32, TCG_TYPE_V256, c, g->fniv);
+        if (some =3D=3D oprsz) {
+            break;
+        }
+        dofs +=3D some;
+        aofs +=3D some;
+        bofs +=3D some;
+        cofs +=3D some;
+        oprsz -=3D some;
+        maxsz -=3D some;
+        /* fallthru */
+    case TCG_TYPE_V128:
+        expand_4i_vec(g->vece, dofs, aofs, bofs, cofs, oprsz,
+                       16, TCG_TYPE_V128, c, g->fniv);
+        break;
+    case TCG_TYPE_V64:
+        expand_4i_vec(g->vece, dofs, aofs, bofs, cofs, oprsz,
+                      8, TCG_TYPE_V64, c, g->fniv);
+        break;
+
+    case 0:
+        if (g->fni8 && check_size_impl(oprsz, 8)) {
+            expand_4i_i64(dofs, aofs, bofs, cofs, oprsz, c, g->fni8);
+        } else if (g->fni4 && check_size_impl(oprsz, 4)) {
+            expand_4i_i32(dofs, aofs, bofs, cofs, oprsz, c, g->fni4);
+        } else {
+            assert(g->fno !=3D NULL);
+            tcg_gen_gvec_4_ool(dofs, aofs, bofs, cofs,
+                               oprsz, maxsz, c, g->fno);
+            oprsz =3D maxsz;
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+    tcg_swap_vecop_list(hold_list);
+
+    if (oprsz < maxsz) {
+        expand_clr(dofs + oprsz, maxsz - oprsz);
+    }
+}
+
 /*
  * Expand specific vector operations.
  */
--=20
2.34.1


