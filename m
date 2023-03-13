Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BEC6B862E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 00:40:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbrkd-0007JH-WC; Mon, 13 Mar 2023 19:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbrkT-0007IN-Er; Mon, 13 Mar 2023 19:38:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pbrkR-0003Sv-J4; Mon, 13 Mar 2023 19:38:37 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DNQiRq013046; Mon, 13 Mar 2023 23:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cTgzSpQHMzBnzJjgHOzLUPz+PrdkEvzvzoO2DyMrtNI=;
 b=V+wYrwS7VnlrAvhQ+90h3bsbShNfCP4D7TXpSQ3kfRb1q3hfoIwQiJt2mTI1Qc7HSG6A
 YW9vPx3EgOsl+KcnIh3oE/cQ5rcqUYeSC7x/NPTlFJmGHiF8OhSrXtS7uI5emlKGKyKg
 MtXop5LzsMWtIovmtg8P0DFpvFvY3/I38dC4XHGS0+4fOMu6bdi8/07alhCOcoLpDNxo
 9O6Uq3QqXfluGNbtWPbvZ0lvSv3ylXrLF/Yvak8rzEjzcqe+eLySW2jIIrar2vGrBnfu
 sYNUDKKQF1EsSneXxjuYC+zK8n5mjyV4FNAc9J52pbh4YREhn3nhiMB9pzUEHCorbtuG HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3padgv87r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 23:38:32 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32DNSdBl022066;
 Mon, 13 Mar 2023 23:38:32 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3padgv87qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 23:38:31 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DFkYfD028730;
 Mon, 13 Mar 2023 23:38:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3p8h96m00t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Mar 2023 23:38:29 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32DNcPVS20316638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Mar 2023 23:38:26 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2F7320040;
 Mon, 13 Mar 2023 23:38:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 594842004B;
 Mon, 13 Mar 2023 23:38:25 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.57.117])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 13 Mar 2023 23:38:25 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH 1/2] target/s390x: Fix EXECUTE of relative long instructions
Date: Tue, 14 Mar 2023 00:38:18 +0100
Message-Id: <20230313233819.122329-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313233819.122329-1-iii@linux.ibm.com>
References: <20230313233819.122329-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1kCYjaF5TRKrK9TxCxTa3cYFvJaKvlAG
X-Proofpoint-ORIG-GUID: qFW3rTMPaMNWoN-Ls4Ib6lJo21g00WN-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_11,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130186
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

The code uses the wrong base for relative addressing: it should use the
target instruction address and not the EXECUTE's address.

Fix by storing the target instruction address in the new CPUS390XState
member and loading it from the code generated by in2_ri2().

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/cpu.h            |  1 +
 target/s390x/tcg/mem_helper.c |  1 +
 target/s390x/tcg/translate.c  | 10 +++++++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b2..8aaf8dd5a3b 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -87,6 +87,7 @@ struct CPUArchState {
     uint64_t cc_vr;
 
     uint64_t ex_value;
+    uint64_t ex_target;
 
     uint64_t __excp_addr;
     uint64_t psa;
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 6835c26dda4..00afae2b640 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -2530,6 +2530,7 @@ void HELPER(ex)(CPUS390XState *env, uint32_t ilen, uint64_t r1, uint64_t addr)
        that ex_value is non-zero, which flags that we are in a state
        that requires such execution.  */
     env->ex_value = insn | ilen;
+    env->ex_target = addr;
 }
 
 uint32_t HELPER(mvcos)(CPUS390XState *env, uint64_t dest, uint64_t src,
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 811049ea281..fefff95b91c 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5888,7 +5888,15 @@ static void in2_a2(DisasContext *s, DisasOps *o)
 
 static void in2_ri2(DisasContext *s, DisasOps *o)
 {
-    o->in2 = tcg_const_i64(s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+    int64_t delta = (int64_t)get_field(s, i2) * 2;
+
+    if (unlikely(s->ex_value)) {
+        o->in2 = tcg_temp_new_i64();
+        tcg_gen_ld_i64(o->in2, cpu_env, offsetof(CPUS390XState, ex_target));
+        tcg_gen_addi_i64(o->in2, o->in2, delta);
+    } else {
+        o->in2 = tcg_const_i64(s->base.pc_next + delta);
+    }
 }
 #define SPEC_in2_ri2 0
 
-- 
2.39.2


