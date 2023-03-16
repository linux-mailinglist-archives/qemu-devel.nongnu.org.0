Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256346BDA98
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 22:09:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcupT-0002SH-CQ; Thu, 16 Mar 2023 17:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcupR-0002S4-HH; Thu, 16 Mar 2023 17:08:05 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcupP-0008Ql-Os; Thu, 16 Mar 2023 17:08:05 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32GKYeXU007551; Thu, 16 Mar 2023 21:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0dFCbzw00PowtW0yQn1AoNywjWK6QpETPcMpwfrUATA=;
 b=Mu+vd6jw53cK3c13tH02zzDWyQIqtmzBJ3dJ3oqzc51RtK7FLP/d+yxLsWXv9LrirVW8
 c77CizVhnqGq6l0hC7O/H3J8BDAuuJD9UEGwvYHuGr6sqneoFFxDX/jjLIMXVNo06N9W
 zfa388T9AUmDfTBhOvNE8Jiy8OyO4belWddsRZxYDceu8XGe9z5YtFlLWcE37zAXMMdS
 5yfFRo0HSs/eO8xed5wFjPBQGuu12StrMD1ofEeMmx4JGVgjXeot4t3Oy3E3AMHdZYg4
 6ZSl85ls7CQvmc8Jh92fT6Wmsurr9i6KFjg81r0E7iGLwT2BRzyMtwv4+yDO9r5oVEJ4 Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pca958nyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 21:08:01 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32GKclC7019751;
 Thu, 16 Mar 2023 21:08:01 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pca958nxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 21:08:00 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32GEuwNY015019;
 Thu, 16 Mar 2023 21:07:59 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3pbsf3h8uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 21:07:59 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32GL7tc166322766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Mar 2023 21:07:55 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E8512004D;
 Thu, 16 Mar 2023 21:07:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0236820049;
 Thu, 16 Mar 2023 21:07:55 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.2.157])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 16 Mar 2023 21:07:54 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH v3 1/2] target/s390x: Fix EXECUTE of relative long instructions
Date: Thu, 16 Mar 2023 22:07:50 +0100
Message-Id: <20230316210751.302423-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316210751.302423-1-iii@linux.ibm.com>
References: <20230316210751.302423-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0kWj8mwelOqkrxuN7o2VKLfJrqeO6RPl
X-Proofpoint-GUID: yHd5RtuyKQoeNeeq_dGBEXShUaoYvbXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_14,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=970 clxscore=1015 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160158
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

The code uses the wrong base for relative addressing: it should use the
target instruction address and not the EXECUTE's address.

Fix by storing the target instruction address in the new CPUS390XState
member and loading it from the code generated by gen_ri2().

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/cpu.h            |  1 +
 target/s390x/tcg/mem_helper.c |  1 +
 target/s390x/tcg/translate.c  | 13 ++++++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

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
index 14c3896d529..e938d8538f8 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5747,7 +5747,18 @@ static void in2_a2(DisasContext *s, DisasOps *o)
 
 static TCGv gen_ri2(DisasContext *s)
 {
-    return tcg_constant_i64(s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+    int64_t delta = (int64_t)get_field(s, i2) * 2;
+    TCGv ri2;
+
+    if (unlikely(s->ex_value)) {
+        ri2 = tcg_temp_new_i64();
+        tcg_gen_ld_i64(ri2, cpu_env, offsetof(CPUS390XState, ex_target));
+        tcg_gen_addi_i64(ri2, ri2, delta);
+    } else {
+        ri2 = tcg_constant_i64(s->base.pc_next + delta);
+    }
+
+    return ri2;
 }
 
 static void in2_ri2(DisasContext *s, DisasOps *o)
-- 
2.39.2


