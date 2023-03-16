Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEDB6BD637
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:46:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqie-0004uS-Ev; Thu, 16 Mar 2023 12:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcqib-0004tM-8b; Thu, 16 Mar 2023 12:44:45 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcqiZ-0007z8-Nb; Thu, 16 Mar 2023 12:44:45 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GG5usc021205; Thu, 16 Mar 2023 16:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mcqVMcOaanp8R1t7w3GixPk70tKbmKMsA6Sn8hB6aWY=;
 b=Po91eAG1U8ezjEcijbMS+pyVX/uepM2OHMajWVomy2YqzyIkEyX03V/3N/ru5jzcJwTP
 f606gbGxpfXXiW4YW0xcJ4rbOn4+m49uRjGpLlf7O7FHpM/Z87NNd39Eg+Sf6+LEzX14
 JgRi6Siy5TfaxlOM8y7Bb+sjZBhpkp3aLIouVAeyQvd8SLtOVuFnpjNvwCuTzoyvYBuS
 2bde3pmc2zAPJDThWn0GkLhOzPHpsUE0W8EuyEpAtBm1ncSd/X2vhRfPbAxeV8rM+WHY
 t8rF23dHl6Ya1MFcR9+Vc1VWa/yKTsIDC5QwlLWjpsgAltx9szYaC/J6+3iuyNOD/PHZ UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbsv4kssp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:41 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GGKnTO012991;
 Thu, 16 Mar 2023 16:44:40 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbsv4ksra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:40 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32G171Yn009644;
 Thu, 16 Mar 2023 16:44:38 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3pbs5srtx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 16:44:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GGiYoN48759532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 16:44:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B0EE20040;
 Thu, 16 Mar 2023 16:44:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7340120049;
 Thu, 16 Mar 2023 16:44:33 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.2.157])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 16:44:33 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Harold Grovesteen <h.grovsteen@tx.rr.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH v4 01/12] target/s390x: Handle branching to odd addresses
Date: Thu, 16 Mar 2023 17:44:17 +0100
Message-Id: <20230316164428.275147-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316164428.275147-1-iii@linux.ibm.com>
References: <20230316164428.275147-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9ZT4REMy2fCayiVCaabhRFngaStN4LED
X-Proofpoint-ORIG-GUID: oObcqUzUa5mpVllcSQ21U035NtmB8UsQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_10,2023-03-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160131
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

Let branching happen and try to generate a new translation block with
an odd address. Generate a specification exception in
cpu_get_tb_cpu_state().

Reported-by: Harold Grovesteen <h.grovsteen@tx.rr.com>
Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/cpu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b2..0a76e96e078 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -29,6 +29,7 @@
 #include "cpu_models.h"
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
+#include "tcg/tcg_s390x.h"
 
 #define ELF_MACHINE_UNAME "S390X"
 
@@ -381,6 +382,14 @@ static inline int cpu_mmu_index(CPUS390XState *env, bool ifetch)
 static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
                                         target_ulong *cs_base, uint32_t *flags)
 {
+    if (env->psw.addr & 1) {
+        /*
+         * Instructions must be at even addresses.
+         * This needs to be checked before address translation.
+         */
+        env->int_pgm_ilen = 2; /* see s390_cpu_tlb_fill() */
+        tcg_s390_program_interrupt(env, PGM_SPECIFICATION, 0);
+    }
     *pc = env->psw.addr;
     *cs_base = env->ex_value;
     *flags = (env->psw.mask >> FLAG_MASK_PSW_SHIFT) & FLAG_MASK_PSW;
-- 
2.39.2


