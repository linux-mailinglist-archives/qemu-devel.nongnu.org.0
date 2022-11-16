Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F218E62BF3B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:19:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIJe-00030V-QD; Wed, 16 Nov 2022 08:18:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1ovIJC-0002o7-Q9; Wed, 16 Nov 2022 08:18:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1ovIJA-0007dR-LG; Wed, 16 Nov 2022 08:18:30 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AGCifXT010794; Wed, 16 Nov 2022 13:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=zkIKtyLkeDSQbq1EF39SDp4/1QhmUhQHVPPQLIXy8AA=;
 b=Q0aD1JA+7kCGL/Feyz6ATGG0TqDcmDOoqbmgocyCH5Hqs+XshEoSLltGbv0oweK++RJ8
 4vp4D56Omhok6ZffmKEL7iUQeBYVG6vqj3w6xSsIvFYOWGyyjD6fpaw/tNhgRvQUe6Y9
 v1iKAqHnfafwZtR3JZ/IFULOHzyf2rBs6rZy76N6EO4Eu4eYrRb2kkoPJQgeA5sFSyBu
 pjUj8dEjNPuz7FOwRz3G7STe+Vegfb5s/7p3rqrxMFhi6fIQsnl6JGZdFOO2iqDJZnJ8
 I+q53L1ozTZwxiEsvQgNSQuj9QXMqaOXzGkl3+hHKW6qy+fIBkT27honNTGtDLzL1vTG Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kw04uh3d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 13:18:10 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AGCjJfd013671;
 Wed, 16 Nov 2022 13:18:10 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kw04uh3cb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 13:18:09 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AGD62P3021802;
 Wed, 16 Nov 2022 13:18:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ktbd9m4yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 13:18:07 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AGDI4wa65798642
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Nov 2022 13:18:04 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13B66AE051;
 Wed, 16 Nov 2022 13:18:04 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48EA1AE045;
 Wed, 16 Nov 2022 13:18:01 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.73.37])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 16 Nov 2022 13:18:01 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Wed, 16 Nov 2022 18:48:00 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, david@gibson.dropbear.id.au,
 clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 groug@kaod.org, Kowshik Jois B S <kowsjois@linux.ibm.com>
Subject: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
Date: Wed, 16 Nov 2022 18:47:43 +0530
Message-Id: <20221116131743.658708-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TBk9Nf1qtcmpCeXx9sAyS_lnsMMo9yhr
X-Proofpoint-ORIG-GUID: _YH9QAkBRS0A9hyAnxQd4CAhJlyPvqup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=982 spamscore=0 clxscore=1011 adultscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211160092
Received-SPF: pass client-ip=148.163.156.1; envelope-from=vaibhav@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Kowshik reported that building qemu with GCC 12.2.1 for 'ppc64-softmmu'
target is failing due to following build warnings:

<snip>
 ../target/ppc/cpu_init.c:7018:13: error: 'ppc_restore_state_to_opc' defined but not used [-Werror=unused-function]
 7018 | static void ppc_restore_state_to_opc(CPUState *cs,
<snip>

Fix this by wrapping these function definitions in 'ifdef CONFIG_TCG' so that
they are only defined if qemu is compiled with '--enable-tcg'

Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 target/ppc/cpu_init.c    | 2 ++
 target/ppc/excp_helper.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 32e94153d1..cbf0081374 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7015,6 +7015,7 @@ static vaddr ppc_cpu_get_pc(CPUState *cs)
     return cpu->env.nip;
 }
 
+#ifdef CONFIG_TCG
 static void ppc_restore_state_to_opc(CPUState *cs,
                                      const TranslationBlock *tb,
                                      const uint64_t *data)
@@ -7023,6 +7024,7 @@ static void ppc_restore_state_to_opc(CPUState *cs,
 
     cpu->env.nip = data[0];
 }
+#endif /* CONFIG_TCG */
 
 static bool ppc_cpu_has_work(CPUState *cs)
 {
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a05a2ed595..94adcb766b 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2842,6 +2842,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulong arg2,
 #endif
 #endif
 
+#ifdef CONFIG_TCG
 static uint32_t helper_SIMON_LIKE_32_64(uint32_t x, uint64_t key, uint32_t lane)
 {
     const uint16_t c = 0xfffc;
@@ -2924,6 +2925,7 @@ HELPER_HASH(HASHST, env->spr[SPR_HASHKEYR], true)
 HELPER_HASH(HASHCHK, env->spr[SPR_HASHKEYR], false)
 HELPER_HASH(HASHSTP, env->spr[SPR_HASHPKEYR], true)
 HELPER_HASH(HASHCHKP, env->spr[SPR_HASHPKEYR], false)
+#endif /* CONFIG_TCG */
 
 #if !defined(CONFIG_USER_ONLY)
 
-- 
2.38.1


