Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FD3BA54F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:54:46 +0200 (CEST)
Received: from localhost ([::1]:45416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzR7V-0003hU-Lu
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzR5p-0001SA-BU; Fri, 02 Jul 2021 17:53:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzR5m-0001vL-Cc; Fri, 02 Jul 2021 17:53:01 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162LWS5h156020; Fri, 2 Jul 2021 17:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Bbi3ZnDEEG02NJumZDfindPirRHC2i2oqcMet5uAzdI=;
 b=YGSKIMNYkTgM+15nkEtXWgS+A74+szVWVwR4U+VHB6IrGTO07beFQKxccT2Dn8wYWWI8
 MgAjL9DHPiwXkT+WZ602cAlpiNWAX+1Lqa+7syO0E7r6Q8APlhB6A73Ry0flM69NsfeL
 FG6LEOkorTaAv99illvXy6SNutJhojEUkk0lp3V0r/HOgLj1SNxQasx1hsVDLSOrpJvM
 VrY1uwaPaFKZlX38z99Vc0cT97q9LyUvY9do6FM+sPr9IoJNgd/sFsJRrGTt9UkgRlfG
 6PVqPuh9KPgITkdao+i05lUpqpSWqYH+I1ZipIGlmIRksdmsa6isTx+qAypY7dNATr+c bg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39jah5rm7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 17:52:47 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 162LgZKm002207;
 Fri, 2 Jul 2021 21:52:45 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 39duvf6810-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 21:52:45 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 162LqjKT33030590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Jul 2021 21:52:45 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0030FBE051;
 Fri,  2 Jul 2021 21:52:45 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE8ADBE04F;
 Fri,  2 Jul 2021 21:52:43 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.44.184])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  2 Jul 2021 21:52:43 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/ppc: Fix compilation with FLUSH_ALL_TLBS debug
 option
Date: Fri,  2 Jul 2021 18:52:34 -0300
Message-Id: <20210702215235.1941771-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210702215235.1941771-1-farosas@linux.ibm.com>
References: <20210702215235.1941771-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eInBdY7vf-TgGpmtTpV3xDwdwitB74XJ
X-Proofpoint-GUID: eInBdY7vf-TgGpmtTpV3xDwdwitB74XJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-02_10:2021-07-02,
 2021-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=866 spamscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107020110
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

../target/ppc/mmu_helper.c: In function 'helper_store_ibatu':
../target/ppc/mmu_helper.c:1802:17: error: unused variable 'cpu' [-Werror=unused-variable]
 1802 |     PowerPCCPU *cpu = env_archcpu(env);
      |                 ^~~
../target/ppc/mmu_helper.c: In function 'helper_store_dbatu':
../target/ppc/mmu_helper.c:1838:17: error: unused variable 'cpu' [-Werror=unused-variable]
 1838 |     PowerPCCPU *cpu = env_archcpu(env);
      |                 ^~~
../target/ppc/mmu_helper.c: In function 'helper_store_601_batu':
../target/ppc/mmu_helper.c:1874:17: error: unused variable 'cpu' [-Werror=unused-variable]
 1874 |     PowerPCCPU *cpu = env_archcpu(env);
      |                 ^~~
../target/ppc/mmu_helper.c: In function 'helper_store_601_batl':
../target/ppc/mmu_helper.c:1919:17: error: unused variable 'cpu' [-Werror=unused-variable]
 1919 |     PowerPCCPU *cpu = env_archcpu(env);

Fixes: db70b31144 ("target/ppc: Use env_cpu, env_archcpu")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/mmu_helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index ff2c6bdd8c..67caba6369 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1798,9 +1798,6 @@ static inline void dump_store_bat(CPUPPCState *env, char ID, int ul, int nr,
 void helper_store_ibatu(CPUPPCState *env, uint32_t nr, target_ulong value)
 {
     target_ulong mask;
-#if defined(FLUSH_ALL_TLBS)
-    PowerPCCPU *cpu = env_archcpu(env);
-#endif
 
     dump_store_bat(env, 'I', 0, nr, value);
     if (env->IBAT[0][nr] != value) {
@@ -1834,9 +1831,6 @@ void helper_store_ibatl(CPUPPCState *env, uint32_t nr, target_ulong value)
 void helper_store_dbatu(CPUPPCState *env, uint32_t nr, target_ulong value)
 {
     target_ulong mask;
-#if defined(FLUSH_ALL_TLBS)
-    PowerPCCPU *cpu = env_archcpu(env);
-#endif
 
     dump_store_bat(env, 'D', 0, nr, value);
     if (env->DBAT[0][nr] != value) {
@@ -1871,7 +1865,6 @@ void helper_store_601_batu(CPUPPCState *env, uint32_t nr, target_ulong value)
 {
     target_ulong mask;
 #if defined(FLUSH_ALL_TLBS)
-    PowerPCCPU *cpu = env_archcpu(env);
     int do_inval;
 #endif
 
@@ -1916,7 +1909,6 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
 #if !defined(FLUSH_ALL_TLBS)
     target_ulong mask;
 #else
-    PowerPCCPU *cpu = env_archcpu(env);
     int do_inval;
 #endif
 
-- 
2.29.2


