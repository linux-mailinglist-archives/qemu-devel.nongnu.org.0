Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9C7485A44
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:53:33 +0100 (CET)
Received: from localhost ([::1]:53610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DHn-0007gA-Ow
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:53:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5x-0003J7-MH; Wed, 05 Jan 2022 15:41:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5j-00019p-03; Wed, 05 Jan 2022 15:41:17 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205JZSmD005165; 
 Wed, 5 Jan 2022 20:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HrINeBaxwN/OCjaWbcbozVdw2/FtHkYLm6hPH/NvRDI=;
 b=iRVWXtRRMV4ZeGL/S/88IAeWTiBUi0qbxlK0Ksh3RbKOzNckWtrUiHo6fFW9VSiRiPNl
 GSv9Pw0TwYv0RHYXmYxKKmXNXF+ntCxDa/nZMq0yDD4AQ9ja5cnqNvAu/USZK4pMRkAO
 Y2L02yP7vl9DQ251QCRn1jGH9fDpe3I1b4zeWicZsl3gKPWV6UrheaN0T52Yeu55/QPH
 lpEsa1HOC3gbEllo/fZZPVgTIYdG92D7iTdS/kxPpxXo97e7paePFm0n9AuCltdKeh8v
 ZbSOlhskQvg0ohVB8JdPMBXjF38Hkwd847xKQfZfxqbu76tPBtTc+4caBwqDFEbHCH9A Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dckxtadkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:51 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 205KU3gU027027;
 Wed, 5 Jan 2022 20:40:50 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dckxtadjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:50 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205KVruT002845;
 Wed, 5 Jan 2022 20:40:49 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 3daekbdv6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:49 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205KemqY15401254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 20:40:48 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F63178064;
 Wed,  5 Jan 2022 20:40:48 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9854A78060;
 Wed,  5 Jan 2022 20:40:46 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.200])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jan 2022 20:40:46 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] target/ppc: Add MSR_ILE support to
 ppc_interrupts_little_endian
Date: Wed,  5 Jan 2022 17:40:27 -0300
Message-Id: <20220105204029.4058500-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105204029.4058500-1-farosas@linux.ibm.com>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wrkBQm2S-zAcTFKvN7o7DFzSFgJIyA1_
X-Proofpoint-ORIG-GUID: wX5tI0BIbFWinECyiiAFvSo0iVMuxZ4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_06,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=974 priorityscore=1501 spamscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201050133
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Some CPUs set ILE via an MSR bit. We can make
ppc_interrupts_little_endian handle that case as well. Now we have a
centralized way of determining the endianness of interrupts.

This change has no functional impact.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index a6fc857ad4..f99cd0ea92 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2733,7 +2733,7 @@ static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu, bool hv)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     CPUPPCState *env = &cpu->env;
-    bool ile = false;
+    bool ile;
 
     if (hv && env->has_hv_mode) {
         if (is_isa300(pcc)) {
@@ -2744,6 +2744,8 @@ static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu, bool hv)
 
     } else if (pcc->lpcr_mask & LPCR_ILE) {
         ile = !!(env->spr[SPR_LPCR] & LPCR_ILE);
+    } else {
+        ile = !!(msr_ile);
     }
 
     return ile;
-- 
2.33.1


