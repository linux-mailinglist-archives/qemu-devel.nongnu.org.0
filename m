Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71982492E53
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:19:08 +0100 (CET)
Received: from localhost ([::1]:43582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9u0Y-0004yA-VV
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:19:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9tU0-0005kj-2G; Tue, 18 Jan 2022 13:45:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28224
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9tTy-00030I-Bm; Tue, 18 Jan 2022 13:45:27 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IH2Of3031001; 
 Tue, 18 Jan 2022 18:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Cf6ej00kOYHD9Du1gNtj3AbCa8zM23PTQsgRzufZ2O0=;
 b=Kj++KrAivt661/YazgBL+rDjtPFrZWzkSizF4YxQ6WBfiMb7sYP3Owb3VvFkXifGWYuP
 PKjXO0mlORUO8op1lCHKD6LmV2dX61EIN6NK9g2WEGgGQ1i8/yA2tKMY819gjJRPrcK0
 PfiGWJjltjv/KyhrltJf10SlusZ0y+ScsxFtEjAew6fzSX52Q/hakibMW30NHOAFQ74V
 rdHiwfnjhbKmBCeFgZKXouL6TS+MyvgoEGg9ilUXtulclJDxq+O987Jr5n83n/Ul6MPG
 PjieFEclsWrg06tbBfZ5CnWl6ethlOPeI0gZGv6+Pv6REgNNLsaSm763frwEv9VMmkvP MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dp1kq2u5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:19 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20IIFcKV001474;
 Tue, 18 Jan 2022 18:45:19 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dp1kq2u5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:19 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20IIbcjV032369;
 Tue, 18 Jan 2022 18:45:18 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3dknwawb72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:18 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20IIjHAM30015966
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 18:45:17 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19502AE066;
 Tue, 18 Jan 2022 18:45:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 999C3AE05C;
 Tue, 18 Jan 2022 18:45:14 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.109.91])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jan 2022 18:45:14 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/14] target/ppc: 405: Machine check exception cleanup
Date: Tue, 18 Jan 2022 15:44:40 -0300
Message-Id: <20220118184448.852996-7-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220118184448.852996-1-farosas@linux.ibm.com>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dE5ZVp9Q_BtRUNgc0lt1SkYRXVFICXRT
X-Proofpoint-GUID: qHMFEegJ95QWehMbi_INv3xUTf8Y4_ig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_05,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0 mlxlogscore=992
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

powerpc_excp_40x applies only to the 405, so remove HV code and
references to BookE.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index bddea702be..e98d783ecd 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -457,34 +457,12 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
             cs->halted = 1;
             cpu_interrupt_exittb(cs);
         }
-        if (env->msr_mask & MSR_HVB) {
-            /*
-             * ISA specifies HV, but can be delivered to guest with HV
-             * clear (e.g., see FWNMI in PAPR).
-             */
-            new_msr |= (target_ulong)MSR_HVB;
-        }
 
         /* machine check exceptions don't have ME set */
         new_msr &= ~((target_ulong)1 << MSR_ME);
 
-        /* XXX: should also have something loaded in DAR / DSISR */
-        switch (excp_model) {
-        case POWERPC_EXCP_40x:
-            srr0 = SPR_40x_SRR2;
-            srr1 = SPR_40x_SRR3;
-            break;
-        case POWERPC_EXCP_BOOKE:
-            /* FIXME: choose one or the other based on CPU type */
-            srr0 = SPR_BOOKE_MCSRR0;
-            srr1 = SPR_BOOKE_MCSRR1;
-
-            env->spr[SPR_BOOKE_CSRR0] = env->nip;
-            env->spr[SPR_BOOKE_CSRR1] = msr;
-            break;
-        default:
-            break;
-        }
+        srr0 = SPR_40x_SRR2;
+        srr1 = SPR_40x_SRR3;
         break;
     case POWERPC_EXCP_DSI:       /* Data storage exception                   */
         trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
-- 
2.33.1


