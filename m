Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B263ABF5B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 01:27:45 +0200 (CEST)
Received: from localhost ([::1]:38958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu1QF-0003Jb-QT
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 19:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lu1OP-0000eu-3h; Thu, 17 Jun 2021 19:25:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62892
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lu1ON-0007XE-5A; Thu, 17 Jun 2021 19:25:48 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HN4oht001254; Thu, 17 Jun 2021 19:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1dRCvC/ht7biezR19PsS7U9dhDDF9mg1XWop0tgiXbs=;
 b=KmSYZXYUtgxyF+yQmivwVpM5WeAAdSgSeAZOAHQg2fcB4SjmG2iQ2UPr2xJbNwdrxklm
 G6d4kX2HgUYskD3Us2+0CKzOePi3lF5VxQhO3XG54AAWitZwZbN1ZH/v39UK6sroPZmu
 wNglfBH63aNldLqexdrL8CfG2o3vZOQaBghC+NnIBj029Hwsy2DPbFHH5lMX/mTGf6tH
 40EIt0U+f4xkBL8V88NQ8/Md/EdmqziDZ69JWIf9wUHzBxfCnceOxhaNdoB1ExZvMGdP
 +EGBfwiyeRkMoZzqx9Y7Kh4uz4mMq2xEKYxnw6obaPswr7VFiBiCtMGK6LjF1DWSuSKJ wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398f3818jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 19:25:44 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HN5YGj004290;
 Thu, 17 Jun 2021 19:25:43 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398f3818j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 19:25:43 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HNCVTM013794;
 Thu, 17 Jun 2021 23:25:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 394mj8hndt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 23:25:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HNPcIS15139122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 23:25:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86426A404D;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 705FDA4040;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 28073E03A3; Fri, 18 Jun 2021 01:25:38 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH v4 2/4] s390x/css: Split out the IRB sense data
Date: Fri, 18 Jun 2021 01:25:35 +0200
Message-Id: <20210617232537.1337506-3-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617232537.1337506-1-farman@linux.ibm.com>
References: <20210617232537.1337506-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WCQ9c3oiXliwOZdjJEjkzOTnzRsm0FQP
X-Proofpoint-ORIG-GUID: Z1XlhdV_t5hyMhpI2A3_83Y4ftU6cO6A
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170140
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/css.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 59d935570e..a54e384566 100644
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


