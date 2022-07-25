Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E2658000B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 15:43:34 +0200 (CEST)
Received: from localhost ([::1]:36264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyMv-0005Q8-FK
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 09:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oFyKf-0003uI-6e
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:41:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oFyKc-0004fG-Nt
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:41:12 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PDKpFZ020813;
 Mon, 25 Jul 2022 13:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=BIV0GJbaNk1AEEPVnFZ7z/2cNKwzNIzBQ5JiuW0IWGQ=;
 b=jkznFqhH+V1grTDbVOIAX/Nd7eNnHmg1FX9QEIDz1I/G9yLGZMkbuFQjGAQtKgVCzHKY
 dpsMhdYZ23NIodR0071c7/A7cIKTxsZb65jBJJwQU9IA/B9qZQ7oAsmWIptJkvgk5kQw
 VgN6LhoEsgq1/+8cE/EZLBRssLPjLKnjP41adT3blO75ycN0XS0dLSklKHnBzU36hkbQ
 dguZQLsRpgo5TNHFsdGQXicufvskqovjrTFRu1z7f5K2JCVa+2/zRN7h78C8/Y9cEFj3
 hwGTbmsCUhvNFq6+vIIkTCWGAuXiMLN32Wc6CdVxUqGCAWlT95HsEinGZ5ndfjbebJcB dQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhuyv0jw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 13:41:09 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26PDbVbx014404;
 Mon, 25 Jul 2022 13:41:06 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3hg97tah4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jul 2022 13:41:06 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26PDf2Sf19988946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jul 2022 13:41:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F01E64C046;
 Mon, 25 Jul 2022 13:41:01 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A57CD4C040;
 Mon, 25 Jul 2022 13:41:01 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.40.49])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 Jul 2022 13:41:01 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] linux-user: Do not treat madvise()'s advice as a bitmask
Date: Mon, 25 Jul 2022 15:41:00 +0200
Message-Id: <20220725134100.128035-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 14-098v0BnuoV7LZoPKHjcuXQ9jNDbEd
X-Proofpoint-ORIG-GUID: 14-098v0BnuoV7LZoPKHjcuXQ9jNDbEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_09,2022-07-25_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=958 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250057
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

Advice is enum, not flags. Doing (advice & MADV_DONTNEED) also matches
e.g. MADV_MERGEABLE.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 4e7a6be6ee..edceaca4a8 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -891,7 +891,7 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
      * anonymous mappings. In this case passthrough is safe, so do it.
      */
     mmap_lock();
-    if ((advice & MADV_DONTNEED) &&
+    if (advice == MADV_DONTNEED &&
         can_passthrough_madv_dontneed(start, end)) {
         ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
     }
-- 
2.35.3


