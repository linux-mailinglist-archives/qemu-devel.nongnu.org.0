Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557BD3BA552
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:56:52 +0200 (CEST)
Received: from localhost ([::1]:50316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzR9X-00073m-E1
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzR5q-0001VK-8r; Fri, 02 Jul 2021 17:53:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzR5o-0001we-DW; Fri, 02 Jul 2021 17:53:02 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162LWlma181255; Fri, 2 Jul 2021 17:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qtv1UvF2608Ns8ugZeBz2a5gONMp1T0DynFGfhgmCwo=;
 b=QwWzPxft4KKPK52EKCR1QORmYLM/lwBhkCzb4kf32Z7I2pm3qedDfEtTdBwEOrNEfLsy
 syoAPxVH9/PepMkn4CGgT9ZINP7oqxNcp48KG0Qe+LRqgwEMoMvRlgWPcdbtFYgPWcbR
 VU0tWi5nDMo14irjtwPD75JDUNzngvvjUtHBj89VcrcEIxtZ5Cpf8hFuMsjy27Omg2iE
 Ecwow+v5Z5nOfDsWOBYsIUuUPgYaEmiXydf6u7SGlnlUO7HU1oWFWobRCP6/WYnKnLMb
 MaMqufu826CvyoQHxxwj8yom3FpD8KTtY01eDpTrVXCS4kHzupOEe7Z88ztR8pJFIzZo qw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39j7r7v988-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 17:52:49 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 162LfnK5002938;
 Fri, 2 Jul 2021 21:52:48 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 39hchk43ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 21:52:47 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 162LqkUZ8454692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Jul 2021 21:52:46 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAD06BE053;
 Fri,  2 Jul 2021 21:52:46 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FA78BE054;
 Fri,  2 Jul 2021 21:52:45 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.44.184])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  2 Jul 2021 21:52:45 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/ppc: Fix compilation with DEBUG_BATS debug option
Date: Fri,  2 Jul 2021 18:52:35 -0300
Message-Id: <20210702215235.1941771-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210702215235.1941771-1-farosas@linux.ibm.com>
References: <20210702215235.1941771-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xK8C8DoZla3TkbohQeue0QhFEx75ZKrf
X-Proofpoint-ORIG-GUID: xK8C8DoZla3TkbohQeue0QhFEx75ZKrf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-02_10:2021-07-02,
 2021-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=946
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107020110
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

../target/ppc/mmu-hash32.c: In function 'ppc_hash32_bat_lookup':
../target/ppc/mmu-hash32.c:204:13: error: 'BATu' undeclared (first use in this function);
  204 |             BATu = &BATut[i];
      |             ^~~~
      |             BATut
../target/ppc/mmu-hash32.c:205:13: error: 'BATl' undeclared (first use in this function);
  205 |             BATl = &BATlt[i];
      |             ^~~~
      |             BATlt
../target/ppc/mmu-hash32.c:206:13: error: 'BEPIu' undeclared (first use in this function)
  206 |             BEPIu = *BATu & BATU32_BEPIU;
      |             ^~~~~
../target/ppc/mmu-hash32.c:206:29: error: 'BATU32_BEPIU' undeclared (first use in this function);
  206 |             BEPIu = *BATu & BATU32_BEPIU;
      |                             ^~~~~~~~~~~~
      |                             BATU32_BEPI
../target/ppc/mmu-hash32.c:207:13: error: 'BEPIl' undeclared (first use in this function)
  207 |             BEPIl = *BATu & BATU32_BEPIL;
      |             ^~~~~
../target/ppc/mmu-hash32.c:207:29: error: 'BATU32_BEPIL' undeclared (first use in this function);
  207 |             BEPIl = *BATu & BATU32_BEPIL;
      |                             ^~~~~~~~~~~~
      |                             BATU32_BEPI
../target/ppc/mmu-hash32.c:208:13: error: 'bl' undeclared (first use in this function)
  208 |             bl = (*BATu & 0x00001FFC) << 15;
      |             ^~

Fixes: 9813279664 ("target-ppc: Disentangle BAT code for 32-bit hash MMUs")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/mmu-hash32.c | 5 ++++-
 target/ppc/mmu-hash32.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 9f0a497657..330bb0432e 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -27,7 +27,7 @@
 #include "mmu-hash32.h"
 #include "exec/log.h"
 
-/* #define DEBUG_BAT */
+/* #define DEBUG_BATS */
 
 #ifdef DEBUG_BATS
 #  define LOG_BATS(...) qemu_log_mask(CPU_LOG_MMU, __VA_ARGS__)
@@ -199,6 +199,9 @@ static hwaddr ppc_hash32_bat_lookup(PowerPCCPU *cpu, target_ulong ea,
     /* No hit */
 #if defined(DEBUG_BATS)
     if (qemu_log_enabled()) {
+        target_ulong *BATu, *BATl;
+        target_ulong BEPIl, BEPIu, bl;
+
         LOG_BATS("no BAT match for " TARGET_FMT_lx ":\n", ea);
         for (i = 0; i < 4; i++) {
             BATu = &BATut[i];
diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 898021f0d8..4fdeaf1937 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -22,6 +22,8 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
  * Block Address Translation (BAT) definitions
  */
 
+#define BATU32_BEPIU            0xf0000000
+#define BATU32_BEPIL            0x0ffe0000
 #define BATU32_BEPI             0xfffe0000
 #define BATU32_BL               0x00001ffc
 #define BATU32_VS               0x00000002
-- 
2.29.2


