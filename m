Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2190B3624B1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:56:25 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQpU-00089b-3J
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQjC-00039S-Tu; Fri, 16 Apr 2021 11:49:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQj8-000087-Rg; Fri, 16 Apr 2021 11:49:54 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GFY8YY089936; Fri, 16 Apr 2021 11:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=s+xocQN6xiHTQK3frx/YTOYIPSoAczd3F8sE78d4gjE=;
 b=Z2aQmGE6togKSwKC1E5MzwWyx35igdTQvyyi3PBrVf2s6BX7CzEl/etFyKWCDgKKHeHF
 d5yF0aiTK3J2jmLBTvpb2r59yoUBYtQxCw+Fa3Su9FW+OooRGnErqHiJMTu8BdLtLNPa
 mdYKxKDRDGdpWhmLWQBri8LNCkKEVjRZc/bLEzdDPN+GbI5iK9OI9xZQ7KMwhO2kDNR0
 iRD+E4L1RdHJjnwsyNDzC4BV/aAmhopekYQOrOEgSu/739aRnkfUthCOcelKx+wwWUKC
 9uFkrOXTiOYlJdIEGSownQudT/7mG04ibG8QCt9lOm1Xaq2NHknXx3gcWpTILfNCrXBb 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37y7babrnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:49:48 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GFYhCB091628;
 Fri, 16 Apr 2021 11:49:47 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37y7babrmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:49:47 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GFf6kr013259;
 Fri, 16 Apr 2021 15:49:45 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 37u3n8af9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 15:49:45 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GFng4h35717400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 15:49:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ACBE11C04A;
 Fri, 16 Apr 2021 15:49:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74B9A11C04C;
 Fri, 16 Apr 2021 15:49:41 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 15:49:41 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v5 1/4] target/s390x: Fix translation exception on illegal
 instruction
Date: Fri, 16 Apr 2021 17:49:36 +0200
Message-Id: <20210416154939.32404-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416154939.32404-1-iii@linux.ibm.com>
References: <20210416154939.32404-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 87dxqVT9DS7zwBacRqnfZf9O_8-n7WJF
X-Proofpoint-GUID: HRz2lxJcTEQUMQLkKGkFScSUER62jKm-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104160113
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
happens is:

* uretprobe maps a userspace page containing an invalid instruction.
* uretprobe replaces the target function's return address with the
  address of that page.
* When tb_gen_code() is called on that page, tb->size ends up being 0
  (because the page starts with the invalid instruction), which causes
  virt_page2 to point to the previous page.
* The previous page is not mapped, so this causes a spurious
  translation exception.

tb->size must never be 0: even if there is an illegal instruction, the
instruction bytes that have been looked at must count towards tb->size.
So adjust s390x's translate_one() to act this way for both illegal
instructions and instructions that are known to generate exceptions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/translate.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 4f953ddfba..e243624d2a 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -6412,7 +6412,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
         qemu_log_mask(LOG_UNIMP, "unimplemented opcode 0x%02x%02x\n",
                       s->fields.op, s->fields.op2);
         gen_illegal_opcode(s);
-        return DISAS_NORETURN;
+        ret = DISAS_NORETURN;
+        goto out;
     }
 
 #ifndef CONFIG_USER_ONLY
@@ -6428,7 +6429,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
         /* privileged instruction */
         if ((s->base.tb->flags & FLAG_MASK_PSTATE) && (insn->flags & IF_PRIV)) {
             gen_program_exception(s, PGM_PRIVILEGED);
-            return DISAS_NORETURN;
+            ret = DISAS_NORETURN;
+            goto out;
         }
 
         /* if AFP is not enabled, instructions and registers are forbidden */
@@ -6455,7 +6457,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
             }
             if (dxc) {
                 gen_data_exception(dxc);
-                return DISAS_NORETURN;
+                ret = DISAS_NORETURN;
+                goto out;
             }
         }
 
@@ -6463,7 +6466,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
         if (insn->flags & IF_VEC) {
             if (!((s->base.tb->flags & FLAG_MASK_VECTOR))) {
                 gen_data_exception(0xfe);
-                return DISAS_NORETURN;
+                ret = DISAS_NORETURN;
+                goto out;
             }
         }
 
@@ -6484,7 +6488,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
             (insn->spec & SPEC_r1_f128 && !is_fp_pair(get_field(s, r1))) ||
             (insn->spec & SPEC_r2_f128 && !is_fp_pair(get_field(s, r2)))) {
             gen_program_exception(s, PGM_SPECIFICATION);
-            return DISAS_NORETURN;
+            ret = DISAS_NORETURN;
+            goto out;
         }
     }
 
@@ -6544,6 +6549,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     }
 #endif
 
+out:
     /* Advance to the next instruction.  */
     s->base.pc_next = s->pc_tmp;
     return ret;
-- 
2.29.2


