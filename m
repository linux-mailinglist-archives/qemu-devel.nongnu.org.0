Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B6487EF7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 23:34:29 +0100 (CET)
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xoa-000421-Hg
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 17:34:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xh4-0002ib-WF; Fri, 07 Jan 2022 17:26:43 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xh3-0006ix-FD; Fri, 07 Jan 2022 17:26:42 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207L8Fq1003982; 
 Fri, 7 Jan 2022 22:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0laTxwEK8z1Cd8vZXshX+CwzEFULNZeou8PZwUyvLT0=;
 b=aWhPFep4V3GWJgQOtumHUgAaHQ4zGfF6G8MS+zx6dCWhu94xyS1YG2/f2oEz7TeFgSzp
 G+gScDDja0GtfaTl1alm5Q5qqB6HQ3CA2HIFioQk53woFMxgWs4WmAkcO4XadJwHez/d
 uv+GiahL5wrawqn7q+LOZ/iNTZfW2cA+9aDpa3lhnKN7kdrdWbOUX8/yMsWNfIrCLFzu
 RiIxSV0xiq4KEmu9p3q0UWMcPTjpF9EFxEX05D4uvYSLIQND9JSfcuFb+lG2Vau4qO6L
 ypgJdlAsxdXH/X8YlhzGuoM1Q4hqGijgmvfH2s7GQLzrKDySnKm2NKbqQ6EmEo9NdoHF Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de59tjfdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:29 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207MQNf6001067;
 Fri, 7 Jan 2022 22:26:28 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de59tjfd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:28 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207MHu7H002461;
 Fri, 7 Jan 2022 22:26:27 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 3de5rq7ttu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:27 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207MQQOR31064568
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 22:26:26 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 791C1BE056;
 Fri,  7 Jan 2022 22:26:26 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B729FBE058;
 Fri,  7 Jan 2022 22:26:24 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.174])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 22:26:24 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/8] target/ppc: Set the correct endianness for powernv
 memory dumps
Date: Fri,  7 Jan 2022 19:26:01 -0300
Message-Id: <20220107222601.4101511-9-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107222601.4101511-1-farosas@linux.ibm.com>
References: <20220107222601.4101511-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6_K8zzyRyVbAaDgsEBDs1gEM6YCUNsj4
X-Proofpoint-ORIG-GUID: ZDSZWvst5bezwu_B6WTxDESnP76Qe2jI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_09,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=775 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070129
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We use the endianness of interrupts to determine which endianness to
use for the guest kernel memory dump. For machines that support HILE
(powernv8 and up) we have been always generating big endian dump
files.

This patch uses the HILE support recently added to
ppc_interrupts_little_endian to fix the endianness of the dumps for
powernv machines.

Here are two dumps created at different moments:

$ file skiboot.dump
skiboot.dump: ELF 64-bit MSB core file, 64-bit PowerPC ...

$ file kernel.dump
kernel.dump: ELF 64-bit LSB core file, 64-bit PowerPC ...

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/arch_dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index 12cde198a3..993740897d 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -237,7 +237,7 @@ int cpu_get_dump_info(ArchDumpInfo *info,
     info->d_machine = PPC_ELF_MACHINE;
     info->d_class = ELFCLASS;
 
-    if (ppc_interrupts_little_endian(cpu, false)) {
+    if (ppc_interrupts_little_endian(cpu, cpu->env.has_hv_mode)) {
         info->d_endian = ELFDATA2LSB;
     } else {
         info->d_endian = ELFDATA2MSB;
-- 
2.33.1


