Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4393535E007
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 15:27:48 +0200 (CEST)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJ51-00012P-C5
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 09:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lWJ1S-00082l-DP
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:24:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1lWJ1Q-0005T4-Gp
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 09:24:06 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DD4lvl071711; Tue, 13 Apr 2021 09:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=44nATt4pPU1X4XpbG2nkG81Qs2gJDi+Dn3qjr+yIzlk=;
 b=lMCXJzHrvV4Z6HfBF2SS0RW4uflaPOL9eG2XG+LtZUy9AA9zHJKTHtQ7bbJV5ZV8k/h4
 TUh15hPpgHSiC3x6DpQDncdLaZzfGnbIbIZKRyDRSqIw8gb6hMlQq9ClOWY7KQA2GAuj
 YbDheipyyvl/vYRllvm1V0ZF0+McuBwVzrc4kUcdu6eiJiJXs2W4VTFmSwvco+AUxPuw
 znGn7MoVPblWetEB/4TP539lU2uZagfByQQHOtQQQ7TkPH6nsSR7/ey2o/IPmikUgm1W
 HjXm4ZSaKMVXTqbJMdIspNLuka1iBO/nzhC9LjQcaa7IsylRq7i/CzEpM+vuf+iVzCDr 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vk3sj2e8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 09:24:01 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13DD5Grp073666;
 Tue, 13 Apr 2021 09:24:00 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vk3sj2dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 09:24:00 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DDMVaO003170;
 Tue, 13 Apr 2021 13:23:58 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 37u3n89e3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 13:23:58 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DDNtWv32506262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 13:23:55 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 263504204C;
 Tue, 13 Apr 2021 13:23:55 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1F824203F;
 Tue, 13 Apr 2021 13:23:54 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 13:23:54 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] accel/tcg: Fix translation exception on invalid instruction
Date: Tue, 13 Apr 2021 15:23:49 +0200
Message-Id: <20210413132349.20520-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BmwhPKNhvIMFxSuey8nqDM2H6Ga6InXI
X-Proofpoint-ORIG-GUID: vObAFJ7Uwd3bSUOUerHRbKa47nZzOhxC
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_07:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1011 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130091
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
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

Fix by special-casing tb->size == 0: since there is no useful code, we
don't need to link pages in this case.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/translate-all.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ba6ab09790..77043b98c4 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1848,7 +1848,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     CPUArchState *env = cpu->env_ptr;
     TranslationBlock *tb, *existing_tb;
     tb_page_addr_t phys_pc, phys_page2;
-    target_ulong virt_page2;
     tcg_insn_unit *gen_code_buf;
     int gen_code_size, search_size, max_insns;
 #ifdef CONFIG_PROFILER
@@ -2085,11 +2084,15 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     }
 
     /* check next page if needed */
-    virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
     phys_page2 = -1;
-    if ((pc & TARGET_PAGE_MASK) != virt_page2) {
-        phys_page2 = get_page_addr_code(env, virt_page2);
+    if (tb->size != 0) {
+        target_ulong virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
+
+        if ((pc & TARGET_PAGE_MASK) != virt_page2) {
+            phys_page2 = get_page_addr_code(env, virt_page2);
+        }
     }
+
     /*
      * No explicit memory barrier is required -- tb_link_page() makes the
      * TB visible in a consistent state.
-- 
2.29.2


