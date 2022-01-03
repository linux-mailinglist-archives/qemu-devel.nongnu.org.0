Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34AC4838BC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:13:11 +0100 (CET)
Received: from localhost ([::1]:51158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4VZm-0005NG-OS
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:13:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VV8-00055w-SE; Mon, 03 Jan 2022 17:08:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VV7-00022Z-4n; Mon, 03 Jan 2022 17:08:22 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 203LuLE6002225; 
 Mon, 3 Jan 2022 22:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QFs5zOE9UNEZRD+w55kTu9G0deafesh4qCHEqROUh4Y=;
 b=LFFBLDibnE4ejdEp2QlYoS4x/baTrsCADfDHS00MO7hLbdaW8x8z/ZvFWQKwMP0hDwaw
 jlfB7T/CrUKASxM+id1D2kNnHyHN3QmDNTjyvLkej10CDyl9UDu1yBy8iS5JYCz/acz0
 ow7eoreaVMbqgc5YM+MOilpaEzfVPRbChtZG8bEA1IN5fKSwSwoZNtAXlEq6oCiRW+3x
 6ibaqOW/A1T/6KeGicrvrc+c/DBBSQd3wgSUjn1Fa+pZufFhi3xxedgJTG9h/6qFfUTt
 eTaKWWomqrdwrWatxj6C5zFOZTRvxow2t6Hx3iVNDmL3ZfdD7MQDhNxUhDRyobG17PFj Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc4wvm37p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:08 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 203LrHSb029162;
 Mon, 3 Jan 2022 22:08:08 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dc4wvm37e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:08 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 203M4HmT013741;
 Mon, 3 Jan 2022 22:08:06 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01wdc.us.ibm.com with ESMTP id 3daeka08fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:06 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 203M86v131064564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 22:08:06 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E64D7805F;
 Mon,  3 Jan 2022 22:08:06 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69FBA7805E;
 Mon,  3 Jan 2022 22:08:04 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.145.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 22:08:04 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/9] target/ppc: powerpc_excp: Preserve MSR_LE bit
Date: Mon,  3 Jan 2022 19:07:43 -0300
Message-Id: <20220103220746.3916246-7-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103220746.3916246-1-farosas@linux.ibm.com>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _p6nzw6ia-JfdoiM75PlHNwXXyV0oUVd
X-Proofpoint-ORIG-GUID: a1FiLmU3iB7hlL2uow0DQZO_PLk5TASf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_09,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=619 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030148
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

We currently clear MSR_LE when copying bits from env->msr to
new_msr. However, for CPUs that do not have LPCR_ILE we always set
new_msr[LE] according to env->msr[LE]. And for CPUs that do have ILE
support we need to check LPCR/HID0 anyway, so there's no need to clear
the bit when copying.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 5d31940426..e56ddbe5d5 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -348,10 +348,10 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
     }
 
     /*
-     * new interrupt handler msr preserves existing HV and ME unless
-     * explicitly overriden
+     * new interrupt handler msr preserves existing HV, ME and LE
+     * unless explicitly overriden.
      */
-    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB);
+    new_msr = env->msr & (((target_ulong)1 << MSR_ME) | MSR_HVB | MSR_LE);
 
     /* target registers */
     srr0 = SPR_SRR0;
@@ -763,13 +763,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
     if (excp_model >= POWERPC_EXCP_970) {
         if (ppc_interrupts_little_endian(cpu, !!(new_msr & MSR_HVB))) {
             new_msr |= (target_ulong)1 << MSR_LE;
+        } else {
+            new_msr &= ~((target_ulong)1 << MSR_LE);
         }
-    } else if (msr_ile) {
-        new_msr |= (target_ulong)1 << MSR_LE;
-    }
-#else
-    if (msr_ile) {
-        new_msr |= (target_ulong)1 << MSR_LE;
     }
 #endif
 
-- 
2.33.1


