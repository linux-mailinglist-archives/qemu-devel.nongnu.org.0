Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A392B6BA4FC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 03:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcGV9-0003ia-At; Tue, 14 Mar 2023 22:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcGV6-0003hh-HL; Tue, 14 Mar 2023 22:04:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pcGV4-0000wz-SX; Tue, 14 Mar 2023 22:04:24 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32F0OLag014262; Wed, 15 Mar 2023 02:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TnE2ksgR71IFO04iUlk/kQv4Pq11IR85COdKPdxDzis=;
 b=Cr+x0H7lY3AG1QgheXkNYyssK27320Wk9LANP6n3NFh+QnGWR2xB0EbCdlBed5TZnNeK
 kbZqnyqDtR1vN2bMFayslGxirySOw3h3Q6isfB1B1bPPJ2gPk3y8X8YKQ3uljqY0ZTtE
 z3/sSbRTguQIAcFw7mvuOvc+TDxCPfHriWC0aWcJIfQC3ze0RKx03+Exx1TFq/lwi4PQ
 +9s5/9P5RHg/S2KwPuUfY91yla2dfnvsgO4wW4d2fQ9ruuUW7d2VoOOjEMP/kFFjN7LB
 YXRzm6ZPPGGJRfkeXM98lK5G5qNn5Ha7SjLw0bLselVPzyYleK86uMMbTvMrFFQ6BDZ/ Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb3evst7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:20 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32F1eaIU016033;
 Wed, 15 Mar 2023 02:04:19 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb3evst73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:19 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EN7anv003141;
 Wed, 15 Mar 2023 02:04:17 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pb29rr3yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Mar 2023 02:04:17 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32F24DfM21168670
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Mar 2023 02:04:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 912BD20043;
 Wed, 15 Mar 2023 02:04:13 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BF0320040;
 Wed, 15 Mar 2023 02:04:13 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.45.154])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 15 Mar 2023 02:04:13 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PATCH v2 1/3] target/s390x: Fix LPSW
Date: Wed, 15 Mar 2023 03:04:06 +0100
Message-Id: <20230315020408.384766-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315020408.384766-1-iii@linux.ibm.com>
References: <20230315020408.384766-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8xX6--ImEHBa50dgppTblhe4CBf6eT4j
X-Proofpoint-ORIG-GUID: pswxaCrS5yhnb9GAEMgAUz4oIvNMMHa6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_16,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150017
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

Currently LPSW does not invert the mask bit 12 and incorrectly copies
the BA bit into the address.

Fix by generating code similar to what s390_cpu_load_normal() does.

Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Co-developed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 14c3896d529..2e1e7e046a6 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2910,19 +2910,21 @@ static DisasJumpType op_lpp(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_lpsw(DisasContext *s, DisasOps *o)
 {
-    TCGv_i64 t1, t2;
+    TCGv_i64 mask, addr;
 
     per_breaking_event(s);
 
-    t1 = tcg_temp_new_i64();
-    t2 = tcg_temp_new_i64();
-    tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s),
-                        MO_TEUL | MO_ALIGN_8);
-    tcg_gen_addi_i64(o->in2, o->in2, 4);
-    tcg_gen_qemu_ld32u(t2, o->in2, get_mem_index(s));
-    /* Convert the 32-bit PSW_MASK into the 64-bit PSW_MASK.  */
-    tcg_gen_shli_i64(t1, t1, 32);
-    gen_helper_load_psw(cpu_env, t1, t2);
+    /*
+     * Convert the short PSW into the normal PSW, similar to what
+     * s390_cpu_load_normal() does.
+     */
+    mask = tcg_temp_new_i64();
+    addr = tcg_temp_new_i64();
+    tcg_gen_qemu_ld_i64(mask, o->in2, get_mem_index(s), MO_TEUQ | MO_ALIGN_8);
+    tcg_gen_andi_i64(addr, mask, PSW_MASK_SHORT_ADDR);
+    tcg_gen_andi_i64(mask, mask, PSW_MASK_SHORT_CTRL);
+    tcg_gen_xori_i64(mask, mask, PSW_MASK_SHORTPSW);
+    gen_helper_load_psw(cpu_env, mask, addr);
     return DISAS_NORETURN;
 }
 
-- 
2.39.2


