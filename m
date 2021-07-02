Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92803BA2E1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:45:31 +0200 (CEST)
Received: from localhost ([::1]:56290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzLMA-0008W3-3r
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:45:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzLKO-0006HT-Op; Fri, 02 Jul 2021 11:43:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lzLKM-0003EF-Oz; Fri, 02 Jul 2021 11:43:40 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162FZF4E018820; Fri, 2 Jul 2021 11:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Bbi3ZnDEEG02NJumZDfindPirRHC2i2oqcMet5uAzdI=;
 b=hMktylNDgAffYwdJieYKDPlAU53ID0pcnR5jb02Ygt3ynsj2N2VPGtkK4jk4cswEnEHm
 CepxaQuCiSr5pq8qkuXboCtoqLnl17lMj28nCWAxl9M+cvPGdYKHiNX2OuGYY708NzN6
 iZtqRRXd9qpsZmLBJqvPeY4hQ43ErrsyPKG+1QTiYZFNwZoZbTH+hH56/j+D94J4sm/v
 3qVBgAWQ4PaVP5Kt2GTGg45r7yfVtoccHdrZiOdQnx4vbIdDilNNXB6HxnxkUg+kCban
 HjW7/On1D2jzBeO1hRLP1JA4btwOCjFuWtn/mu2OnrDJoA53f7eSLFRSK6Vs5YQB9zKR EQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39j2qrwk32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 11:43:30 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 162FbeJR030441;
 Fri, 2 Jul 2021 15:43:29 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 39duvgdp90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 15:43:29 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 162FhShH37224950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Jul 2021 15:43:28 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84DC8BE054;
 Fri,  2 Jul 2021 15:43:28 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 536E3BE053;
 Fri,  2 Jul 2021 15:43:27 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.44.184])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  2 Jul 2021 15:43:27 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/ppc: Fix compilation with FLUSH_ALL_TLBS debug
 option
Date: Fri,  2 Jul 2021 12:43:19 -0300
Message-Id: <20210702154319.1895048-3-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210702154319.1895048-1-farosas@linux.ibm.com>
References: <20210702154319.1895048-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hXv7cq1FdPU1GyC3df1mM5jK2CkrJyyb
X-Proofpoint-ORIG-GUID: hXv7cq1FdPU1GyC3df1mM5jK2CkrJyyb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-02_07:2021-07-02,
 2021-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=866 clxscore=1015 phishscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107020086
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


