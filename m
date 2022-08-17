Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7259728F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 17:12:12 +0200 (CEST)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOKiJ-0005Jp-Ql
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 11:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oOKby-0007sE-OD; Wed, 17 Aug 2022 11:05:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oOKbw-00026E-FF; Wed, 17 Aug 2022 11:05:38 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27HEjwQ6030098;
 Wed, 17 Aug 2022 15:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vqZRHJ9RxWAUXvKEyj3EOy8OvEHfmt8c6QT0ya1G7qY=;
 b=DOoAYWNKDmNPS4PlMJkKT9s9c0REATlCwY623dFFkpW15dZ2VUVluDvlVgnEAdc3aaXN
 2azOzG5a6CTxhk0eHsmlFGokI/op/ACRfBjTCIYd1pAFjs3loQJECihKjIXFSIyxgUQ7
 qUy1RTr589mpJMW2JiGwvbhXzyKZJf0RL5ronL0yCirp8WQL2trBkbs+oOnFRJ3xh3/2
 4SZvDabCRYuUQO7Z1WKEgqGpzwPwd+fGfXx+KM9gcp5TGQvz9kbkRZlKtIQA56EwYyKu
 J/s/dKQp2rrCJUaX13ch2tn2wOmVsRyaSxrkiXMeI+IJ6LYo+iMrfrTnY8RzTmCPgbDL Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j12crru3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 15:05:15 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HEmxwg008470;
 Wed, 17 Aug 2022 15:05:15 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j12crru0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 15:05:15 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27HF58En018738;
 Wed, 17 Aug 2022 15:05:12 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3hyp8shy39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Aug 2022 15:05:12 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27HF58On32506314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Aug 2022 15:05:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D460811C04C;
 Wed, 17 Aug 2022 15:05:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B29A11C04A;
 Wed, 17 Aug 2022 15:05:08 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.21.185])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Aug 2022 15:05:08 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 1/4] linux-user: Clear tb_jmp_cache on mprotect()
Date: Wed, 17 Aug 2022 17:05:03 +0200
Message-Id: <20220817150506.592862-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817150506.592862-1-iii@linux.ibm.com>
References: <20220817150506.592862-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iokxU9S0kiZc9FmY2N1ikAg0jRNYOYTi
X-Proofpoint-ORIG-GUID: jCCC6zqe1IVqIX21kdRMkriSs9OxFpTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 impostorscore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170058
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently it's possible to execute pages that do not have PAGE_EXEC if
there is an existing translation block. Fix by clearing tb_jmp_cache,
which forces HELPER(lookup_tb_ptr)() to recheck permission bits the
next time.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/mmap.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index bbc674311b..bd96c876ba 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -115,6 +115,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
 {
     abi_ulong end, host_start, host_end, addr;
     int prot1, ret, page_flags, host_prot;
+    CPUState *cpu;
 
     trace_target_mprotect(start, len, target_prot);
 
@@ -178,6 +179,19 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
         }
     }
     page_set_flags(start, start + len, page_flags);
+
+    /*
+     * Unlike target_mmap(), target_munmap() and target_mremap(), we don't need
+     * to call tb_invalidate_phys_range() here, since pages still hold the same
+     * data.  However, tb_jmp_cache needs to be cleared, otherwise after
+     * clearing PAGE_EXEC it would still be possible to jump to the existing
+     * translation blocks.  We just clear the whole cache here: mprotect() is
+     * rare enough, so a more fine-grained approach is not necessary.
+     */
+    CPU_FOREACH(cpu) {
+        cpu_tb_jmp_cache_clear(cpu);
+    }
+
     mmap_unlock();
     return 0;
 error:
-- 
2.37.1


