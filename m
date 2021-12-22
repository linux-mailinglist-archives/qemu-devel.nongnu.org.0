Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D2C47CD87
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:28:08 +0100 (CET)
Received: from localhost ([::1]:47070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzw2h-0007zd-Cq
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:28:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvIp-0008NR-Qm; Wed, 22 Dec 2021 01:40:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60130
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mzvIo-0003C6-45; Wed, 22 Dec 2021 01:40:43 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BM4oTiA014817; 
 Wed, 22 Dec 2021 06:40:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d3gr3evk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:35 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BM6e5YB018572;
 Wed, 22 Dec 2021 06:40:35 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d3gr3evjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:35 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BM6Z5jt001421;
 Wed, 22 Dec 2021 06:40:33 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3d179akfy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Dec 2021 06:40:33 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BM6eVJt40632806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 06:40:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AB21AE045;
 Wed, 22 Dec 2021 06:40:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBEAFAE04D;
 Wed, 22 Dec 2021 06:40:30 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Dec 2021 06:40:30 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.51.190])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 0EF7822028A;
 Wed, 22 Dec 2021 07:40:29 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 5/8] ppc/ppc405: Rework ppc_40x_timers_init() to use a
 PowerPCCPU
Date: Wed, 22 Dec 2021 07:40:22 +0100
Message-Id: <20211222064025.1541490-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222064025.1541490-1-clg@kaod.org>
References: <20211222064025.1541490-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gDuB4Nha6VDsBpf38Apr_kOjg__3IQlX
X-Proofpoint-ORIG-GUID: o1ealt5ZSm_oVkk1mM-usCXjfMOB6cL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_02,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=869 bulkscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1034
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220038
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.4,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a small cleanup to ease reading.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc.c | 42 +++++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index cca99cb86f81..bb5bee9a3382 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1124,14 +1124,12 @@ struct ppc40x_timer_t {
 /* Fixed interval timer */
 static void cpu_4xx_fit_cb (void *opaque)
 {
-    PowerPCCPU *cpu;
-    CPUPPCState *env;
+    PowerPCCPU *cpu =3D opaque;
+    CPUPPCState *env =3D &cpu->env;
     ppc_tb_t *tb_env;
     ppc40x_timer_t *ppc40x_timer;
     uint64_t now, next;
=20
-    env =3D opaque;
-    cpu =3D env_archcpu(env);
     tb_env =3D env->tb_env;
     ppc40x_timer =3D tb_env->opaque;
     now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -1193,13 +1191,11 @@ static void start_stop_pit (CPUPPCState *env, ppc=
_tb_t *tb_env, int is_excp)
=20
 static void cpu_4xx_pit_cb (void *opaque)
 {
-    PowerPCCPU *cpu;
-    CPUPPCState *env;
+    PowerPCCPU *cpu =3D opaque;
+    CPUPPCState *env =3D &cpu->env;
     ppc_tb_t *tb_env;
     ppc40x_timer_t *ppc40x_timer;
=20
-    env =3D opaque;
-    cpu =3D env_archcpu(env);
     tb_env =3D env->tb_env;
     ppc40x_timer =3D tb_env->opaque;
     env->spr[SPR_40x_TSR] |=3D 1 << 27;
@@ -1216,14 +1212,12 @@ static void cpu_4xx_pit_cb (void *opaque)
 /* Watchdog timer */
 static void cpu_4xx_wdt_cb (void *opaque)
 {
-    PowerPCCPU *cpu;
-    CPUPPCState *env;
+    PowerPCCPU *cpu =3D opaque;
+    CPUPPCState *env =3D &cpu->env;
     ppc_tb_t *tb_env;
     ppc40x_timer_t *ppc40x_timer;
     uint64_t now, next;
=20
-    env =3D opaque;
-    cpu =3D env_archcpu(env);
     tb_env =3D env->tb_env;
     ppc40x_timer =3D tb_env->opaque;
     now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -1341,24 +1335,26 @@ clk_setup_cb ppc_40x_timers_init (CPUPPCState *en=
v, uint32_t freq,
 {
     ppc_tb_t *tb_env;
     ppc40x_timer_t *ppc40x_timer;
+    PowerPCCPU *cpu =3D env_archcpu(env);
+
+    trace_ppc40x_timers_init(freq);
=20
     tb_env =3D g_malloc0(sizeof(ppc_tb_t));
+    ppc40x_timer =3D g_malloc0(sizeof(ppc40x_timer_t));
+
     env->tb_env =3D tb_env;
     tb_env->flags =3D PPC_DECR_UNDERFLOW_TRIGGERED;
-    ppc40x_timer =3D g_malloc0(sizeof(ppc40x_timer_t));
     tb_env->tb_freq =3D freq;
     tb_env->decr_freq =3D freq;
     tb_env->opaque =3D ppc40x_timer;
-    trace_ppc40x_timers_init(freq);
-    if (ppc40x_timer !=3D NULL) {
-        /* We use decr timer for PIT */
-        tb_env->decr_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_4xx=
_pit_cb, env);
-        ppc40x_timer->fit_timer =3D
-            timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_4xx_fit_cb, env);
-        ppc40x_timer->wdt_timer =3D
-            timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_4xx_wdt_cb, env);
-        ppc40x_timer->decr_excp =3D decr_excp;
-    }
+
+    /* We use decr timer for PIT */
+    tb_env->decr_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_4xx_pit=
_cb, cpu);
+    ppc40x_timer->fit_timer =3D
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_4xx_fit_cb, cpu);
+    ppc40x_timer->wdt_timer =3D
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_4xx_wdt_cb, cpu);
+    ppc40x_timer->decr_excp =3D decr_excp;
=20
     return &ppc_40x_set_tb_clk;
 }
--=20
2.31.1


