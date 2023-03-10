Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8316B4F52
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:45:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagla-0007R1-EO; Fri, 10 Mar 2023 12:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1paglU-0007O7-0B; Fri, 10 Mar 2023 12:42:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1paglS-000813-0U; Fri, 10 Mar 2023 12:42:47 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32AGjJSL017164; Fri, 10 Mar 2023 17:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sR8gn/XTkOWYGeDH+nolcaoyqIv2q9YT5QOTmAqwWeM=;
 b=Ucpns/9X5dKEgLplE1vtoEwSYwSJlbP2t/jm8Ab9ATTju0pCnMjzaNyhSHMJ/ruhgd5j
 6CeE/zxWlDB/yDqeVY/oYK9aV2iD7sPaY8RFduQkIJxa+MogssyI2a75nWkd+Od1Cbmb
 1EiJJNPQpQjSoeUHsF+XaHOohRudW+k3DckKCZxvDof4o1eX32UDsU2xBkgYS2tk/Mee
 CXnU0gEvredg01VRb+FDC7jY46vepozyx/VJq/2YNLN3128a8Qsj/jdJ0e/4B/rEaxSl
 X6O6AnQZCVgFomLEsJx/esKsH/xnX1IkkYaI4BEbOPeVn99rGOEn04tGmgK6pZmEhZf0 EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p88bp19j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:42 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32AHUp8q032680;
 Fri, 10 Mar 2023 17:42:41 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p88bp19h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:41 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32A7etOQ003432;
 Fri, 10 Mar 2023 17:42:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3p6g0jk4x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 17:42:39 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32AHgZwX28311906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 17:42:35 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C793220043;
 Fri, 10 Mar 2023 17:42:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4023720040;
 Fri, 10 Mar 2023 17:42:35 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.22.18])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Mar 2023 17:42:35 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH 02/12] target/s390x: Handle EXECUTE of odd addresses
Date: Fri, 10 Mar 2023 18:42:13 +0100
Message-Id: <20230310174223.944843-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310174223.944843-1-iii@linux.ibm.com>
References: <20230310174223.944843-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: luGR7NTxl4iJwEOkqJN0eo0WQ58X5mxh
X-Proofpoint-ORIG-GUID: WcdH6shNJaRyXU4SIaWcFVI0POQBCjT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_08,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 lowpriorityscore=0 mlxlogscore=766 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303100139
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Generate a specification exception in the helper before trying to fetch
the instruction.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/mem_helper.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 6835c26dda4..9d1c4bb7374 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2468,8 +2468,16 @@ void HELPER(stpq_parallel)(CPUS390XState *env, uint64_t addr,
 */
 void HELPER(ex)(CPUS390XState *env, uint32_t ilen, uint64_t r1, uint64_t addr)
 {
-    uint64_t insn = cpu_lduw_code(env, addr);
-    uint8_t opc = insn >> 8;
+    uint64_t insn;
+    uint8_t opc;
+
+    /* EXECUTE targets must be at even addresses.  */
+    if (addr & 1) {
+        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, GETPC());
+    }
+
+    insn = cpu_lduw_code(env, addr);
+    opc = insn >> 8;
 
     /* Or in the contents of R1[56:63].  */
     insn |= r1 & 0xff;
-- 
2.39.2


