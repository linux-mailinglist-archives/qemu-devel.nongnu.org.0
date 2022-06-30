Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429775616BA
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 11:45:20 +0200 (CEST)
Received: from localhost ([::1]:51292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6qjb-0008FZ-LK
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 05:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1o6qiJ-0007Qa-CN; Thu, 30 Jun 2022 05:43:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1o6qiG-0004OG-Th; Thu, 30 Jun 2022 05:43:55 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U9fuaM015488;
 Thu, 30 Jun 2022 09:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=L89mO8cbe9kfVKfys39OrWjIgCLRu2kTmmDcbzEsYBg=;
 b=iKBGPm9wHbOTKHmL84BFl4k31/NbVvg538ePeEc4eQbrMwaT7ScdwpmMLB3M9z36T6FP
 CgzGTSTHnuBWLwBEX11RtssbkvZsolWtrkmhqjEv3XgnnIAvPzxW1ZN/F7dxKYIBjGgA
 h5sOYXzVbq5TzwjhB/yuwMoq5FfeKbO16XlZaTa2JVgXKbpFAR3TKUbvyLg8ZcvlIteB
 r15jlYE3YZDM5YdPqe7U0a/KbWWKkC7cgCpadFwWHG0cMmCbLbJ2OWD4z2yp43YRfbDJ
 xMPjrpC6EmZKLJNbGzS5xiyRXcou61uSo30quqpD1dXqhrbI4dkcPZNOd3tOoG5LzqAQ ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h19e48172-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 09:43:46 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25U9hkBi025586;
 Thu, 30 Jun 2022 09:43:46 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h19e48164-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 09:43:46 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25U9ZD07022686;
 Thu, 30 Jun 2022 09:43:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3gwt08yu9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 09:43:43 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25U9hf7j20840914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jun 2022 09:43:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 964B3A404D;
 Thu, 30 Jun 2022 09:43:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B644A4040;
 Thu, 30 Jun 2022 09:43:41 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jun 2022 09:43:41 +0000 (GMT)
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2] target/s390x/tcg: SPX: check validity of new prefix
Date: Thu, 30 Jun 2022 11:43:40 +0200
Message-Id: <20220630094340.3646279-1-scgl@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dYuhIZCSOOXAqTay7Waeq7nOCt-WWobS
X-Proofpoint-ORIG-GUID: 3TjC8ZgCl2c_kco8K5JSexblqEw6wiyh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_05,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=826
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300036
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
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
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/tcg/misc_helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index aab9c47747..10dadb002a 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -158,6 +158,13 @@ void HELPER(spx)(CPUS390XState *env, uint64_t a1)
     if (prefix == old_prefix) {
         return;
     }
+    /*
+     * Since prefix got aligned to 8k and memory increments are a multiple of
+     * 8k checking the first page is sufficient
+     */
+    if (!mmu_absolute_addr_valid(prefix, true)) {
+        tcg_s390_program_interrupt(env, PGM_ADDRESSING, GETPC());
+    }
 
     env->psa = prefix;
     HELPER_LOG("prefix: %#x\n", prefix);

base-commit: 3a821c52e1a30ecd9a436f2c67cc66b5628c829f
-- 
2.36.1


