Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005B64CA4BB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:22:34 +0100 (CET)
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPO01-0007SL-2V
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrV-0001ka-DM; Wed, 02 Mar 2022 06:09:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nPMrR-0001zo-8P; Wed, 02 Mar 2022 06:09:41 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 222AIIEU003485; 
 Wed, 2 Mar 2022 11:09:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6q9gxmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:11 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 222AL2mZ013007;
 Wed, 2 Mar 2022 11:09:10 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej6q9gxju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:10 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 222B2bMV027230;
 Wed, 2 Mar 2022 11:09:08 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3efbu9d1tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 11:09:07 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 222B956G54788576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 11:09:05 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F06CA4067;
 Wed,  2 Mar 2022 11:09:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B668A4075;
 Wed,  2 Mar 2022 11:09:05 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  2 Mar 2022 11:09:05 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.58.125])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 624692201C1;
 Wed,  2 Mar 2022 12:09:04 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 86/87] hw/ppc/spapr_rtas.c: use g_autofree in
 rtas_ibm_get_system_parameter()
Date: Wed,  2 Mar 2022 12:08:02 +0100
Message-Id: <20220302110803.849505-87-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
References: <20220302110803.849505-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rJuEDEaxBXvdqgCEI7u5i_OpEyq2qSPg
X-Proofpoint-GUID: zUa_rk7YeWDCX9nK_MoWQJZD_v5xhSwp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 phishscore=0 clxscore=1034 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020047
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220228175004.8862-14-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/spapr_rtas.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index b476382ae6f5..d7c04237feb9 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -279,30 +279,29 @@ static void rtas_ibm_get_system_parameter(PowerPCCP=
U *cpu,
=20
     switch (parameter) {
     case RTAS_SYSPARM_SPLPAR_CHARACTERISTICS: {
-        char *param_val =3D g_strdup_printf("MaxEntCap=3D%d,"
-                                          "DesMem=3D%" PRIu64 ","
-                                          "DesProcs=3D%d,"
-                                          "MaxPlatProcs=3D%d",
-                                          ms->smp.max_cpus,
-                                          ms->ram_size / MiB,
-                                          ms->smp.cpus,
-                                          ms->smp.max_cpus);
+        g_autofree char *param_val =3D g_strdup_printf("MaxEntCap=3D%d,"
+                                                     "DesMem=3D%" PRIu64=
 ","
+                                                     "DesProcs=3D%d,"
+                                                     "MaxPlatProcs=3D%d"=
,
+                                                     ms->smp.max_cpus,
+                                                     ms->ram_size / MiB,
+                                                     ms->smp.cpus,
+                                                     ms->smp.max_cpus);
         if (pcc->n_host_threads > 0) {
-            char *hostthr_val, *old =3D param_val;
-
             /*
              * Add HostThrs property. This property is not present in PA=
PR but
              * is expected by some guests to communicate the number of p=
hysical
              * host threads per core on the system so that they can scal=
e
              * information which varies based on the thread configuratio=
n.
              */
-            hostthr_val =3D g_strdup_printf(",HostThrs=3D%d", pcc->n_hos=
t_threads);
+            g_autofree char *hostthr_val =3D g_strdup_printf(",HostThrs=3D=
%d",
+                                                           pcc->n_host_t=
hreads);
+            char *old =3D param_val;
+
             param_val =3D g_strconcat(param_val, hostthr_val, NULL);
-            g_free(hostthr_val);
             g_free(old);
         }
         ret =3D sysparm_st(buffer, length, param_val, strlen(param_val) =
+ 1);
-        g_free(param_val);
         break;
     }
     case RTAS_SYSPARM_DIAGNOSTICS_RUN_MODE: {
--=20
2.34.1


