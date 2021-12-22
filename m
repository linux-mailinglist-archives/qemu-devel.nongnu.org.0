Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E4F47CD7C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:21:12 +0100 (CET)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzvvz-00032O-Uf
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:21:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvJ0-00005C-IP; Wed, 22 Dec 2021 01:40:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvIy-0003EW-Te; Wed, 22 Dec 2021 01:40:54 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BM3FdjX005928; 
 Wed, 22 Dec 2021 06:40:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2q0kx29y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:38 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BM6UiXD002245;
 Wed, 22 Dec 2021 06:40:37 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d2q0kx29d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BM6Z5Uf001411;
 Wed, 22 Dec 2021 06:40:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3d179akfy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:35 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BM6eWY545023630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 06:40:32 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70CB9A4064;
 Wed, 22 Dec 2021 06:40:32 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 266A9A405C;
 Wed, 22 Dec 2021 06:40:32 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Dec 2021 06:40:32 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.51.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 5D4A322028A;
 Wed, 22 Dec 2021 07:40:31 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 7/8] ppc/ppc405: Introduce a store helper for SPR_40x_PID
Date: Wed, 22 Dec 2021 07:40:24 +0100
Message-Id: <20211222064025.1541490-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222064025.1541490-1-clg@kaod.org>
References: <20211222064025.1541490-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t7zyk_H785JrCfACGmMwNhR0HWOyiEuA
X-Proofpoint-ORIG-GUID: ERlsGeOid2hykdSdqT4GtNTSUmFJf4Vw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_02,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 bulkscore=0 clxscore=1034 mlxlogscore=821 phishscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220038
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PID SPR of the 405 CPU contains the translation ID of the TLB
which is a 8-bit field. Enforce the mask with a store helper.

Cc: Christophe Leroy <christophe.leroy@c-s.fr>
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


