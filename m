Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8F9C074F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 16:26:31 +0200 (CEST)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDrCX-00016t-L6
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 10:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36833)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imbrenda@linux.ibm.com>) id 1iDqNO-0005Sg-5X
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:33:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imbrenda@linux.ibm.com>) id 1iDqNN-00020O-3C
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:33:37 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19962)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imbrenda@linux.ibm.com>)
 id 1iDqNM-00020G-SB
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:33:37 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8RDWYXd134149
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 09:33:36 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v9j7rjw7a-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 09:33:35 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <imbrenda@linux.ibm.com>;
 Fri, 27 Sep 2019 14:33:31 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Sep 2019 14:33:27 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8RDXPNa52625442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Sep 2019 13:33:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6803D42041;
 Fri, 27 Sep 2019 13:33:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F9FC4204B;
 Fri, 27 Sep 2019 13:33:25 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.39])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 27 Sep 2019 13:33:25 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v2 3/4] s390x: sclp: fix error handling for oversize control
 blocks
Date: Fri, 27 Sep 2019 15:33:22 +0200
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569591203-15258-1-git-send-email-imbrenda@linux.ibm.com>
References: <1569591203-15258-1-git-send-email-imbrenda@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19092713-0020-0000-0000-00000372509A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092713-0021-0000-0000-000021C821B3
Message-Id: <1569591203-15258-4-git-send-email-imbrenda@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-27_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909270127
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
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
Cc: frankja@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Janosch Frank <frankja@linux.ibm.com>

Requests over 4k are not a spec exception.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Jason J. Herne <jjherne@linux.ibm.com>
---
 hw/s390x/sclp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index 73244c9..abb6e50 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -213,8 +213,7 @@ int sclp_service_call(CPUS390XState *env, uint64_t sccb, uint32_t code)
     cpu_physical_memory_read(sccb, &work_sccb, sccb_len);
 
     /* Valid sccb sizes */
-    if (be16_to_cpu(work_sccb.h.length) < sizeof(SCCBHeader) ||
-        be16_to_cpu(work_sccb.h.length) > SCCB_SIZE) {
+    if (be16_to_cpu(work_sccb.h.length) < sizeof(SCCBHeader)) {
         r = -PGM_SPECIFICATION;
         goto out;
     }
-- 
2.7.4


