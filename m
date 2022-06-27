Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754DB55B9C6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 15:14:58 +0200 (CEST)
Received: from localhost ([::1]:49568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5oZt-00025E-3I
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 09:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1o5oY3-0000q8-Ia; Mon, 27 Jun 2022 09:13:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7850
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1o5oY1-0004SQ-B8; Mon, 27 Jun 2022 09:13:03 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RClOYY015549;
 Mon, 27 Jun 2022 13:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lh50HFoYNCQlj9EKW7boHSwNjHdxeE88dTXxCKMeHxk=;
 b=RH70reuJqN+0HvgmrFQ4n1Pa+yB5wIMmekUhKCkc+sKFf3leEtojRUt+nogWW80HKNIN
 BTkJtdc0YjLB/ei7+xCPuYNcPGBtpDrzEQnBOQwbs6BZzH6BWypcTSegZf0quLeB4WSf
 Ypva9wjAdB4rdtapa5flKAweSwzogBInFyLLSE7rNJxD7zA3v3Xm/BmhLyzK69Gw9GO4
 l5XGKp5b7011u6bT3e//S8qssRP3qh4sooYsHHEnDgllp6H4ssEemZArfiOdO6PFojeQ
 T4Wj3P5gAWbWuFth7g7beCsHerrrp4h0MY/epHT8I1niWRtzolaeS7ayb0P4DIgZeV0d 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gycuwgwm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 13:12:58 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25RDCvK2024463;
 Mon, 27 Jun 2022 13:12:57 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gycuwgwkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 13:12:57 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25RD5Xo8024192;
 Mon, 27 Jun 2022 13:12:55 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3gwt08t9a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 13:12:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25RDCrbw21168536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jun 2022 13:12:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7421742042;
 Mon, 27 Jun 2022 13:12:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F90B42041;
 Mon, 27 Jun 2022 13:12:53 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Jun 2022 13:12:53 +0000 (GMT)
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH] target/s390x/tcg: SPX: check validity of new prefix
Date: Mon, 27 Jun 2022 15:12:51 +0200
Message-Id: <20220627131251.2832076-1-scgl@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SnlhqX7VHY53OadoU0NsUPoq-3QddY4Z
X-Proofpoint-ORIG-GUID: qbF0o47pBbivJlrqqfV-wcCcwPlh-jtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=676 impostorscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206270058
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
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

According to the architecture, SET PREFIX must try to access the new
prefix area and recognize an addressing exception if the area is not
accessible.
For qemu this check prevents a crash in cpu_map_lowcore after an
inaccessible prefix area has been set.

Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
---


Is there a stricter check to see if the memory is accessible?


 target/s390x/tcg/misc_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index aab9c47747..c8447b36fc 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -158,6 +158,10 @@ void HELPER(spx)(CPUS390XState *env, uint64_t a1)
     if (prefix == old_prefix) {
         return;
     }
+    if (!mmu_absolute_addr_valid(prefix, true) ||
+        !mmu_absolute_addr_valid(prefix + TARGET_PAGE_SIZE, true)) {
+        tcg_s390_program_interrupt(env, PGM_ADDRESSING, GETPC());
+    }
 
     env->psa = prefix;
     HELPER_LOG("prefix: %#x\n", prefix);

base-commit: 3a821c52e1a30ecd9a436f2c67cc66b5628c829f
-- 
2.36.1


