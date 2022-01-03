Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A92482E8E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 07:52:04 +0100 (CET)
Received: from localhost ([::1]:33290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4HCK-00062r-8M
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 01:52:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Gvy-00025e-O4; Mon, 03 Jan 2022 01:35:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63826
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n4Gvw-00080Y-EF; Mon, 03 Jan 2022 01:35:06 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2032o7YB028824; 
 Mon, 3 Jan 2022 06:34:53 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dbrpxjvw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:52 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2036XfYo021487;
 Mon, 3 Jan 2022 06:34:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3daek986yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 06:34:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2036Q6PG38732062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 06:26:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6107D4204F;
 Mon,  3 Jan 2022 06:34:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 270CE42041;
 Mon,  3 Jan 2022 06:34:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon,  3 Jan 2022 06:34:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.19])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7C8BF22017E;
 Mon,  3 Jan 2022 07:34:47 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] ppc/ppc405: Introduce a store helper for SPR_40x_PID
Date: Mon,  3 Jan 2022 07:34:40 +0100
Message-Id: <20220103063441.3424853-9-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220103063441.3424853-1-clg@kaod.org>
References: <20220103063441.3424853-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yuyo0__nSur61yjsfLSE08qlxOBxvsLX
X-Proofpoint-ORIG-GUID: yuyo0__nSur61yjsfLSE08qlxOBxvsLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_02,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1034
 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=948
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201030044
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) KHOP_HELO_FCRDNS=0.399,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PID SPR of the 405 CPU contains the translation ID of the TLB
which is a 8-bit field. Enforce the mask with a store helper.

Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211222064025.1541490-8-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 target/ppc/spr_tcg.h   | 1 +
 target/ppc/cpu_init.c  | 2 +-
 target/ppc/translate.c | 8 ++++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 64cf5302cb86..89ff111724dc 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -89,6 +89,7 @@ void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, i=
nt gprn);
 void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn);
 void spr_write_40x_tcr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_40x_tsr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_40x_pid(DisasContext *ctx, int sprn, int gprn);
 void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn);
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b5e2fde9ec4d..9ef9a1a5ddd5 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -1454,7 +1454,7 @@ static void register_405_sprs(CPUPPCState *env)
     /* MMU */
     spr_register(env, SPR_40x_PID, "PID",
                  SPR_NOACCESS, SPR_NOACCESS,
-                 &spr_read_generic, &spr_write_generic,
+                 &spr_read_generic, &spr_write_40x_pid,
                  0x00000000);
     spr_register(env, SPR_4xx_CCR0, "CCR0",
                  SPR_NOACCESS, SPR_NOACCESS,
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index eb45f679d34f..cb8ab4d67635 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -890,6 +890,14 @@ void spr_write_40x_tsr(DisasContext *ctx, int sprn, =
int gprn)
     gen_helper_store_40x_tsr(cpu_env, cpu_gpr[gprn]);
 }
=20
+void spr_write_40x_pid(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv t0 =3D tcg_temp_new();
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn], 0xFF);
+    gen_store_spr(SPR_40x_PID, t0);
+    tcg_temp_free(t0);
+}
+
 void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn)
 {
     gen_icount_io_start(ctx);
--=20
2.31.1


