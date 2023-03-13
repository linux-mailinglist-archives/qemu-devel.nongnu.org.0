Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197FF6B7C29
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:40:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbkGT-0007na-4s; Mon, 13 Mar 2023 11:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbkGM-0007jx-0D; Mon, 13 Mar 2023 11:39:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbkGK-0004ut-AP; Mon, 13 Mar 2023 11:39:01 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DFC372013184; Mon, 13 Mar 2023 15:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=C4S9U33SooANOhLXyMDCCye4+epUi5P9sre7jBAcYOk=;
 b=TUGwD8xDebJVMMNHftgtihxLiQdEeYq3LUSPIYD+zVMVlq1dm8l4kQEChSiXChcC8/kt
 7Awt/U4RcAesOZjkSuIEaJ8/39s+YdijWzHRl+bwUsat7+2TCm8VHvyaEJwoZiO1DcAB
 9l6C44FT0ZME0qGJkNVFizbSdx/vyr2LyqOCUCtPmalJ4/H2xwRW396gEYCDyhf/gijK
 2jo2Hmg4t5od5P2AFi8HtbcmyxGUBBjMewKegDLM+flkPDOELZwZ16bXg4XiRmfn7mFH
 osoBsyx6OJOSb+2KxJGv09rWZsHhlq3+UkD3hmEXBrkYRpkiJ3UyQXM6opm7KuWxe6R3 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa68q8sdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:38:57 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DFCDio013928;
 Mon, 13 Mar 2023 15:38:57 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pa68q8sd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:38:56 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DCviiM015761;
 Mon, 13 Mar 2023 15:38:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3p8h96jrxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 15:38:54 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32DFcoL118547302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 15:38:51 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D774D20043;
 Mon, 13 Mar 2023 15:38:50 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A06820040;
 Mon, 13 Mar 2023 15:38:50 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.87.70])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Mar 2023 15:38:50 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Harold Grovesteen <h.grovsteen@tx.rr.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH v2 01/12] target/s390x: Handle branching to odd addresses
Date: Mon, 13 Mar 2023 16:38:33 +0100
Message-Id: <20230313153844.9231-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313153844.9231-1-iii@linux.ibm.com>
References: <20230313153844.9231-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tQA5vtNce3-Hwfgrhh61eTnNudHMaAyx
X-Proofpoint-GUID: bKokJ1qVYpmWxix4mGmNl3D08N095xzL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_07,2023-03-13_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=981 bulkscore=0 malwarescore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130121
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


