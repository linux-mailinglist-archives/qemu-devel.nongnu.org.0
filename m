Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676993A8E9F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:56:01 +0200 (CEST)
Received: from localhost ([::1]:37320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKme-0001Yg-GY
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ltKf5-00081z-HY; Tue, 15 Jun 2021 21:48:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:11392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ltKf0-0003FN-Vo; Tue, 15 Jun 2021 21:48:11 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G1X9JG140211; Tue, 15 Jun 2021 21:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fKGsBQO0nAHqYHZXpSCBD6yApCH+OOqRyq4SB/pwj7E=;
 b=sN01MYzmwAcl2bLJwpcCAk3I/VrLpYmA/K7Zz925VWEcAe8jGg5nquQ4l2/qls5xAzhh
 caC/1IERSeN+tRsPAVWsjj111c11EkwSiBIp5mvEpTP1W90EPy9mBvWJcXea6RD+Cwtj
 Y+/4+seS855ckBbDSDyVZcmCy3FMEgeHSbZv4Xn8vXc+/xyYM4YDhCN1hb5CMN0fCd3o
 io39nvwbZXFu9ZlMALd0N1I5lsCodPDUVsX+G0z9f+qbxqJ6Qf3tRQ1nl9g2ANqmcUft
 UlIM5AEbApbqgZrE+8lS/CSPzXCcs8br7kx84J4vJpHKFpI19qN0/1NwVKfNBtX1M4GN 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3975f8betm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 21:48:04 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15G1XfZd142559;
 Tue, 15 Jun 2021 21:48:04 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3975f8bet0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 21:48:04 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15G1gUZu021888;
 Wed, 16 Jun 2021 01:48:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 394mj8st27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 01:48:02 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15G1lwVH27525504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 01:47:58 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DBB052054;
 Wed, 16 Jun 2021 01:47:58 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 24C985205F;
 Wed, 16 Jun 2021 01:47:58 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id BE526E03A2; Wed, 16 Jun 2021 03:47:57 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH v3 2/4] s390x/css: Split out the IRB sense data
Date: Wed, 16 Jun 2021 03:47:47 +0200
Message-Id: <20210616014749.2460133-3-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616014749.2460133-1-farman@linux.ibm.com>
References: <20210616014749.2460133-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o3eOUhmNzf7bgS2EVIBjNw7CJPpiV7Xd
X-Proofpoint-ORIG-GUID: TPRyhXZjKY93rcYQGSFApw95045MdUz6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_09:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106160007
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's move this logic into its own routine,
so it can be reused later.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 hw/s390x/css.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 8be21efb13..554c9083fd 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1639,6 +1639,17 @@ static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW *pmcw,
     *irb_len = sizeof(*dest);
 }
 
+static void build_irb_sense_data(SubchDev *sch, IRB *irb)
+{
+    int i;
+
+    /* Attention: sense_data is already BE! */
+    memcpy(irb->ecw, sch->sense_data, sizeof(sch->sense_data));
+    for (i = 0; i < ARRAY_SIZE(irb->ecw); i++) {
+        irb->ecw[i] = be32_to_cpu(irb->ecw[i]);
+    }
+}
+
 int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
 {
     SCHIB *schib = &sch->curr_status;
@@ -1669,14 +1680,8 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
         /* If a unit check is pending, copy sense data. */
         if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
             (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
-            int i;
-
             irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF | SCSW_FLAGS_MASK_ECTL;
-            /* Attention: sense_data is already BE! */
-            memcpy(irb.ecw, sch->sense_data, sizeof(sch->sense_data));
-            for (i = 0; i < ARRAY_SIZE(irb.ecw); i++) {
-                irb.ecw[i] = be32_to_cpu(irb.ecw[i]);
-            }
+            build_irb_sense_data(sch, &irb);
             irb.esw.erw = ESW_ERW_SENSE | (sizeof(sch->sense_data) << 8);
         }
     }
-- 
2.25.1


