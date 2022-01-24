Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FB7498C1A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:21:04 +0100 (CET)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC4tj-0006F6-0g
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:21:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nC4ow-0003Fb-2P; Mon, 24 Jan 2022 14:16:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51988
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nC4oq-0001uJ-Ur; Mon, 24 Jan 2022 14:16:05 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OHBY5x017486; 
 Mon, 24 Jan 2022 19:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=JE1rmMORGL6sJanhep2Jk4ZHvsRnDiqQXJTnqUhlNNI=;
 b=SFISiiCDaBKE1WVFQji+JtMpHnOyDF8Ehg20wjRuK6h37FU8pi51kQyUSZHfT/Fbr7lX
 3Vg2PLO2Any4J59fC8pJOUNPzQddcXC6Iy5xSGfHBO+QEGj2B61WFssTkAqLMmkJjBcd
 pBMn1P9z4MU9HicUbGIMMjthUkltEB/LJQq6XPwaNWUXMFzO/EvvN4a5lHeHGV7GHfgm
 Rm3czCYVPkr6rN2+ZGVgnpfGGqHhCGpbrZNseJgANw9tKHY7tdUYUYOXpdPb3+eFAdEb
 TotV589AV8An3yy6fXB51vl/T9IGxgc8OLgH6oHlMIcOZn4vqPT7ZIw6KNHkR/apc6Rn dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt09w2pyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 19:15:58 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OIubDN028687;
 Mon, 24 Jan 2022 19:15:57 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dt09w2pyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 19:15:57 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OJ7S8d023143;
 Mon, 24 Jan 2022 19:15:56 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 3dr9ja68be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 19:15:56 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OJFtnN34079064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 19:15:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8C9C112061;
 Mon, 24 Jan 2022 19:15:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFDE911206B;
 Mon, 24 Jan 2022 19:15:53 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.163.24.67])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jan 2022 19:15:53 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Put do_rfi under a TCG-only block
Date: Mon, 24 Jan 2022 16:15:47 -0300
Message-Id: <20220124191547.1008391-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5m3bly0x8sMXBQHvQKcngr8OOJyVMPjL
X-Proofpoint-ORIG-GUID: BmdNF65cJGVHP-6aGnEc9QHcIY4Aq1JD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=706
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201240125
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The --disable-tcg build broke when do_rfi stopped being inlined.

Fixes: 62e79ef914 ("target/ppc: Remove static inline")
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index bc646c67a0..afdb6a8912 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1155,7 +1155,6 @@ void helper_pminsn(CPUPPCState *env, powerpc_pm_insn_t insn)
         (env->spr[SPR_PSSCR] & PSSCR_EC);
 }
 #endif /* defined(TARGET_PPC64) */
-#endif /* CONFIG_TCG */
 
 static void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
 {
@@ -1188,7 +1187,6 @@ static void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)
     check_tlb_flush(env, false);
 }
 
-#ifdef CONFIG_TCG
 void helper_rfi(CPUPPCState *env)
 {
     do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
-- 
2.34.1


