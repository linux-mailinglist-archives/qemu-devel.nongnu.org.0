Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F84BB734
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 11:47:09 +0100 (CET)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL0n6-00027g-Fv
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 05:47:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0fM-00010r-RW; Fri, 18 Feb 2022 05:39:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13372
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nL0ew-0005f1-SZ; Fri, 18 Feb 2022 05:38:44 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I8b8cp022580; 
 Fri, 18 Feb 2022 10:38:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea55jp8ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:39 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21IAcclO027659;
 Fri, 18 Feb 2022 10:38:38 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea55jp8dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:38 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21IAc2De006202;
 Fri, 18 Feb 2022 10:38:37 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3e64has9mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 10:38:37 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21IAcY5v39715302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 10:38:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 852D3A406F;
 Fri, 18 Feb 2022 10:38:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49526A406E;
 Fri, 18 Feb 2022 10:38:34 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 10:38:34 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 9C61B2201F1;
 Fri, 18 Feb 2022 11:38:33 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 06/39] ppc: allow the hdecr timer to be created/destroyed
Date: Fri, 18 Feb 2022 11:37:54 +0100
Message-Id: <20220218103827.682032-7-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218103827.682032-1-clg@kaod.org>
References: <20220218103827.682032-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gABYCfbc266KJb2kC0B9PYnLefei5iGX
X-Proofpoint-ORIG-GUID: QywBUUjS1eI92WOMbUfocAv4ZUNywguS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=779
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 clxscore=1034
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202180067
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

Machines which don't emulate the HDEC facility are able to use the
timer for something else. Provide functions to start and stop the
hdecr timer.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[ clg: checkpatch fixes ]
Message-Id: <20220216102545.1808018-4-npiggin@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ppc/ppc.h |  3 +++
 hw/ppc/ppc.c         | 21 +++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
index 93e614cffd03..b0ba4bd6b978 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -54,6 +54,9 @@ struct ppc_tb_t {
=20
 uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_off=
set);
 clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq);
+void cpu_ppc_hdecr_init(CPUPPCState *env);
+void cpu_ppc_hdecr_exit(CPUPPCState *env);
+
 /* Embedded PowerPC DCR management */
 typedef uint32_t (*dcr_read_cb)(void *opaque, int dcrn);
 typedef void (*dcr_write_cb)(void *opaque, int dcrn, uint32_t val);
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index c6dfc5975f5f..9e99625ea93e 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1083,6 +1083,27 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, ui=
nt32_t freq)
     return &cpu_ppc_set_tb_clk;
 }
=20
+/* cpu_ppc_hdecr_init may be used if the timer is not used by HDEC emula=
tion */
+void cpu_ppc_hdecr_init(CPUPPCState *env)
+{
+    PowerPCCPU *cpu =3D env_archcpu(env);
+
+    assert(env->tb_env->hdecr_timer =3D=3D NULL);
+
+    env->tb_env->hdecr_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                            &cpu_ppc_hdecr_cb, cpu);
+}
+
+void cpu_ppc_hdecr_exit(CPUPPCState *env)
+{
+    PowerPCCPU *cpu =3D env_archcpu(env);
+
+    timer_free(env->tb_env->hdecr_timer);
+    env->tb_env->hdecr_timer =3D NULL;
+
+    cpu_ppc_hdecr_lower(cpu);
+}
+
 /***********************************************************************=
******/
 /* PowerPC 40x timers */
=20
--=20
2.34.1


