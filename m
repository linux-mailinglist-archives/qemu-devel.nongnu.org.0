Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28674D6DC8
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 10:40:08 +0100 (CET)
Received: from localhost ([::1]:43498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSyEJ-00044v-5x
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 04:40:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSy0Z-0002aj-R7; Sat, 12 Mar 2022 04:25:55 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nSy0X-0007KT-9x; Sat, 12 Mar 2022 04:25:55 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22C4V1o6015358; 
 Sat, 12 Mar 2022 09:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QCxcymB9ZJY6i8WSNIC4qwTn3KnmWC1zF/X1ZIbb/O0=;
 b=pb83VmyGJRaTbZkleu9jFA6O/dsblJoze5jFqg596Vg1DUDIHQhAO4q5gkLZ7Cyx7RSL
 0+beaq9QevxVj0JeaS9kbJLQ68K46yTAuhHBAgI3MkEWvpF+6PxbyVz+5kx2b9fmk4T7
 Q9qKMGfxnFHySZnzd8ELstifc+WcqIaEVTbhtkdPqtKwxH1x2v+LoSEt+nXaDbEPBM2f
 4x3EaKnDBRy7bK3tRyuKE8NNqfvLMLQdXTzpmtS00GsljWP1GZMOEBppobJnbFqLg74W
 ta591o4PMCm7yB29LiFFY1vHHQQma+H0wq1x0H+focQ7iTMQQfUFyOq5yMmxT0ckBqo4 wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3erjas4tt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:50 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22C9PoSi018215;
 Sat, 12 Mar 2022 09:25:50 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3erjas4tsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:50 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22C9DuqK018676;
 Sat, 12 Mar 2022 09:25:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3erjshghsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Mar 2022 09:25:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22C9EQae23003420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Mar 2022 09:14:26 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AE4242041;
 Sat, 12 Mar 2022 09:25:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23E6A4203F;
 Sat, 12 Mar 2022 09:25:44 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.29.97])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 12 Mar 2022 09:25:44 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 1/3] s390x/tcg: Fix BRASL with a large negative offset
Date: Sat, 12 Mar 2022 10:25:39 +0100
Message-Id: <20220312092541.585282-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220312092541.585282-1-iii@linux.ibm.com>
References: <20220312092541.585282-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: felI48hXF8KqfefXlBxSn98Stk3bMayq
X-Proofpoint-GUID: hIbI-8-RbDMms3_ORD3pP9QStxQqDaqb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-12_03,2022-03-11_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxlogscore=920 clxscore=1015 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203120053
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When RI2 is 0x80000000, qemu enters an infinite loop instead of jumping
backwards. Fix by adding a missing cast, like in in2_ri2().

Fixes: 8ac33cdb8bfb ("Convert BRANCH AND SAVE")
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 904b51542f..41c8696185 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1597,7 +1597,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
     pc_to_link_info(o->out, s, s->pc_tmp);
-    return help_goto_direct(s, s->base.pc_next + 2 * get_field(s, i2));
+    return help_goto_direct(s, s->base.pc_next + (int64_t)get_field(s, i2) * 2);
 }
 
 static DisasJumpType op_bc(DisasContext *s, DisasOps *o)
-- 
2.35.1


