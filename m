Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BACC34838C4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:17:37 +0100 (CET)
Received: from localhost ([::1]:60842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Ve4-0003Vi-TP
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:17:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VVB-0005HT-W4; Mon, 03 Jan 2022 17:08:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VVA-000231-9C; Mon, 03 Jan 2022 17:08:25 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 203Llhrp016068; 
 Mon, 3 Jan 2022 22:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yaSD4YIhEaHvqlc2hY2EykDNjqw3KltjCaq8uM9+FXs=;
 b=RwZenL4u/Fx3+6jJV3gnrqT2i7PT38kgiKbEjCNaffXrZ4bIKlMZWltldHk+jh5B4LW5
 p04VutvbVYuV5BGQYEoSBctvw33CjG3RBkd/rmND9JGFOHIvP1IpkkgbZNOJdTqTvoPR
 /kmcixh8qtq5annfcoTV0OSXuoOiIiLvcdgJVLiXZWWasnD9EhAlwW0KJzGu/EiTvE9p
 LtYsF6uHZJRWlEXoJd+Ai9HIzmufL58fpaabAaLC9GvnqY/bmNn8DQiCzaE69N2IZ9pu
 dkwQdAPO/NUFxzwTiCWfvrqJMsNXS9q20K6pGqRjEFrgddcrm9cftwE5Fd5TzlGyh5ND jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc9cer7bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:11 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 203M0Ss3018438;
 Mon, 3 Jan 2022 22:08:10 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc9cer7bn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:10 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 203LwUTc001329;
 Mon, 3 Jan 2022 22:08:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3daekar3wg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 203M88SB34734526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 22:08:08 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CA4C78064;
 Mon,  3 Jan 2022 22:08:08 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81D1F7805F;
 Mon,  3 Jan 2022 22:08:06 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.145.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 22:08:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] target/ppc: powerpc_excp: Move ILE setting into a function
Date: Mon,  3 Jan 2022 19:07:44 -0300
Message-Id: <20220103220746.3916246-8-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103220746.3916246-1-farosas@linux.ibm.com>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cOIRucmhWSg5erZKh5gTzWp_IsIeIP1P
X-Proofpoint-ORIG-GUID: I8ePvtZ1e-H9vvEHNi0VBxRGcr53gtfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_09,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=756 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030147
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Move the ILE code into a separate function similarly to what we do for
AIL.

This leaves the excp_model check behind because it will go away when
we split powerpc_excp.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index e56ddbe5d5..d7e087f2f6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -290,6 +290,17 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
 #endif
 }
 
+static void ppc_excp_toggle_ile(PowerPCCPU *cpu, target_ulong *new_msr)
+{
+#ifdef TARGET_PPC64
+    if (ppc_interrupts_little_endian(cpu, !!(*new_msr & MSR_HVB))) {
+        *new_msr |= (target_ulong)1 << MSR_LE;
+    } else {
+        *new_msr &= ~((target_ulong)1 << MSR_LE);
+    }
+#endif
+}
+
 static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
                                           target_ulong vector, target_ulong msr)
 {
@@ -756,18 +767,12 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
     }
 
     /*
-     * Sort out endianness of interrupt, this differs depending on the
-     * CPU, the HV mode, etc...
+     * We preserve MSR_LE, but some CPUs can take interrupts in a
+     * different endianness.
      */
-#ifdef TARGET_PPC64
     if (excp_model >= POWERPC_EXCP_970) {
-        if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
-            new_msr |= (target_ulong)1 << MSR_LE;
-        } else {
-            new_msr &= ~((target_ulong)1 << MSR_LE);
-        }
+        ppc_excp_toggle_ile(cpu, &new_msr);
     }
-#endif
 
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_BOOKE) {
-- 
2.33.1


