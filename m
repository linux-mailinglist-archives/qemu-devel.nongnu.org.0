Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119363609F0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 15:04:39 +0200 (CEST)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1fi-00074j-4C
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 09:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lX1eS-0005q4-MU; Thu, 15 Apr 2021 09:03:20 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lX1eQ-0001C0-Bv; Thu, 15 Apr 2021 09:03:20 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FCXsJF082325; Thu, 15 Apr 2021 09:03:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=s+xocQN6xiHTQK3frx/YTOYIPSoAczd3F8sE78d4gjE=;
 b=RloEoa0jVPbwHiPN1+AI+TQrwRCmkrfg8nWcAu6Ojb4iQd+cNHlcpPulEQ/auCqzmmiF
 oGLQDYF24Cb7N3DxceX54hiplQPeljLi14zuCiQ21anxDnsC1169HwFrndZV1qOez+qU
 G8FXu98WcKy97bdgxvpC35OZ+4lCt4GGlsOgQmfSeXICzgukt8QR0U4LBzQ8czgrK3kl
 rLga9WT7JlXe0noiO//fbd4BMJJX/uElUdrwCZT7KPSJGzdTQ7fyV04HHd6rBK4eQcIc
 7v/k1fqREVexueEVOFu+sxHpWtrFY05FPGtEa6AMqtDLMmC+BLRtKORTcoZzAdL/YLfC Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xfrnu22k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 09:03:14 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FCXsGL082274;
 Thu, 15 Apr 2021 09:03:13 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xfrnu20t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 09:03:13 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FCqRnu018468;
 Thu, 15 Apr 2021 13:03:11 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 37u3n8uw43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:03:11 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FD37j534406800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 13:03:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB25EA4062;
 Thu, 15 Apr 2021 13:03:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49051A4054;
 Thu, 15 Apr 2021 13:03:07 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 13:03:07 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 1/4] target/s390x: Fix translation exception on illegal
 instruction
Date: Thu, 15 Apr 2021 15:03:02 +0200
Message-Id: <20210415130305.28640-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210415130305.28640-1-iii@linux.ibm.com>
References: <20210415130305.28640-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NNc63C3lGSnDuTRvXtPqbq_X8IAcDhXr
X-Proofpoint-GUID: zzJD48B3gQBzIzYZe7ZYhAlmGS62KD7_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_04:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104150084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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


