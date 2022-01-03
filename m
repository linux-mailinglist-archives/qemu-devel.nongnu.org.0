Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2FB4838B4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:10:24 +0100 (CET)
Received: from localhost ([::1]:41626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4VX4-0007Ng-MM
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:10:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VV1-0004hG-8c; Mon, 03 Jan 2022 17:08:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17276
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VUy-00021W-Dq; Mon, 03 Jan 2022 17:08:14 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 203KID4q029353; 
 Mon, 3 Jan 2022 22:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zpeqNdrDbVB9Q4P59HOz5fOAUXbnN0bpsA+UdzTTNYU=;
 b=my13ne1XQrcYsx643lo8IATh05Ky/hLp5cg1j3dDr2qiszgMYnaJeDBZkmGXS/VpvriB
 xzPd7qxfzd9kGpRELTI2x/5JDl0BuSinx2HGspdHIQ1umEJ76yg4hTrpUqVMSFZCURPY
 UJnHbpLUl9T4xoQ/exMPogy69SuzOPR8VA9mzWe46c4wLnyqLVuUfrsLXEAOGw7aLC8W
 SoFmVw3nwbcSbIJvs3iFjusPQTTuInVu8kQyappfttrgDfF0nKE7I0v04qEbJcnCbcRb
 c3TakCoZMuHsqEPkE7RnBXch32zrEVjtnNjYbIfyt3qbRO10EdWAtxu7ssSRV7XyyVUC Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dc82g16xu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:06 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 203LuSHw031203;
 Mon, 3 Jan 2022 22:08:06 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dc82g16xj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:05 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 203Lvq23030569;
 Mon, 3 Jan 2022 22:08:04 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3daek9r97y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 203M84EA29950426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 22:08:04 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 126C578063;
 Mon,  3 Jan 2022 22:08:04 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 514677805E;
 Mon,  3 Jan 2022 22:08:02 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.145.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 22:08:02 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] target/ppc: Use ppc_interrupts_little_endian in
 powerpc_excp
Date: Mon,  3 Jan 2022 19:07:42 -0300
Message-Id: <20220103220746.3916246-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103220746.3916246-1-farosas@linux.ibm.com>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _ywjQkpOE-BUrki9xwnB0xgAm0WR1O2E
X-Proofpoint-GUID: pR0rtm-wN8sf810a_Cb_u6hMQJnRu53t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_09,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=703
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030147
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ppc_interrupts_little_endian function is suitable for determining
the endianness of interrupts for all Book3S CPUs.

(I'm keeping the MSR check for the rest of the CPUs, but it will go
away in the next patch.)

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 0dbadc5d07..5d31940426 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -760,25 +760,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
      * CPU, the HV mode, etc...
      */
 #ifdef TARGET_PPC64
-    if (excp_model == POWERPC_EXCP_POWER7) {
-        if (!(new_msr & MSR_HVB) && (env->spr[SPR_LPCR] & LPCR_ILE)) {
-            new_msr |= (target_ulong)1 << MSR_LE;
-        }
-    } else if (excp_model == POWERPC_EXCP_POWER8) {
-        if (new_msr & MSR_HVB) {
-            if (env->spr[SPR_HID0] & HID0_HILE) {
-                new_msr |= (target_ulong)1 << MSR_LE;
-            }
-        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
-            new_msr |= (target_ulong)1 << MSR_LE;
-        }
-    } else if (excp_model == POWERPC_EXCP_POWER9 ||
-               excp_model == POWERPC_EXCP_POWER10) {
-        if (new_msr & MSR_HVB) {
-            if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
-                new_msr |= (target_ulong)1 << MSR_LE;
-            }
-        } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
+    if (excp_model >= POWERPC_EXCP_970) {
+        if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
             new_msr |= (target_ulong)1 << MSR_LE;
         }
     } else if (msr_ile) {
-- 
2.33.1


