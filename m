Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 464AE61025E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:09:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo99I-0002Ta-3E; Thu, 27 Oct 2022 16:06:44 -0400
Received: from eggs.gnu.org ([209.51.188.92])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Peter.Jin@ibm.com>)
 id 1oo8DR-0002op-W4; Thu, 27 Oct 2022 15:06:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Peter.Jin@ibm.com>)
 id 1oo88M-0007I3-JK; Thu, 27 Oct 2022 15:01:44 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RIjx4L021857;
 Thu, 27 Oct 2022 19:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tzvPgOWULtaWWsLiHAjfGu9hS+JFg3sXM1KdiASfW2Q=;
 b=ZqpjZ1MyPi4R+txB+ii2X7IA8B5yFFikTQI2q0+wnSl5qNO5O7Twc9BE9eAuEYkfEEhT
 jUF3d61eDkQBNJGpGlfjqHmhgK694yS7GqmyVbI+2W+FDM50Y5CeRZ8gbYS1YZgewqTC
 ddNriuC6w5SeEETqg0acGJ8/I7RVPDjLkdvrY6WpiEd69khBEkbocCFRMpanDl+GTrKQ
 BHGvS5io/ekj93zIBe/AtzkClqP39rW8XmsCy8LbPiKsa5R0GVmHTBBp567zujPZkW18
 tyPOOhzwqgKD648k8ivVaPYY9f/42J+JVeYF3HiHIzKQuSTL33b5D+U1O274x/UI/y7T AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfyj90cph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 19:01:34 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29RImR7F030116;
 Thu, 27 Oct 2022 19:01:34 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfyj90cn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 19:01:34 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29RIppdJ010765;
 Thu, 27 Oct 2022 19:01:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3kfahu2hux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 19:01:32 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29RJ1TmS2163226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 19:01:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06F22AE04D;
 Thu, 27 Oct 2022 19:01:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7E25AE045;
 Thu, 27 Oct 2022 19:01:28 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Oct 2022 19:01:28 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55807)
 id A7C52E0139; Thu, 27 Oct 2022 21:01:28 +0200 (CEST)
From: Peter Jin <pjin@linux.ibm.com>
To: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 thuth@redhat.com, mjrosato@linux.ibm.com
Cc: peter@peterjin.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Peter Jin <pjin@linux.ibm.com>
Subject: [PATCH] s390x/css: revert SCSW ctrl/flag bits on error
Date: Thu, 27 Oct 2022 21:01:13 +0200
Message-Id: <20221027190113.2682917-1-pjin@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AJmfh5ZNEwVye7QkhiFFUjEFSHwMENxM
X-Proofpoint-GUID: EjVRDV3H6YEVOFlYKGrYw3qCwLQsCg8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270104
Received-SPF: pass client-ip=148.163.158.5; envelope-from=Peter.Jin@ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 27 Oct 2022 16:06:38 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Revert the control and flag bits in the subchannel status word in case
the SSCH operation fails with non-zero CC (ditto for CSCH and HSCH).
According to POPS, the control and flag bits are only changed if SSCH,
CSCH, and HSCH return CC 0, and no other action should be taken otherwise.
In order to simulate that after the fact, the bits need to be reverted on
non-zero CC.

Signed-off-by: Peter Jin <pjin@linux.ibm.com>
---
 hw/s390x/css.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 7d9523f811..95d1b3a3ce 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1522,21 +1522,37 @@ IOInstEnding css_do_xsch(SubchDev *sch)
 IOInstEnding css_do_csch(SubchDev *sch)
 {
     SCHIB *schib = &sch->curr_status;
+    uint16_t old_scsw_ctrl;
+    IOInstEnding ccode;
 
     if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV | PMCW_FLAGS_MASK_ENA)) {
         return IOINST_CC_NOT_OPERATIONAL;
     }
 
+    /*
+     * Save the current scsw.ctrl in case CSCH fails and we need
+     * to revert the scsw to the status quo ante.
+     */
+    old_scsw_ctrl = schib->scsw.ctrl;
+
     /* Trigger the clear function. */
     schib->scsw.ctrl &= ~(SCSW_CTRL_MASK_FCTL | SCSW_CTRL_MASK_ACTL);
     schib->scsw.ctrl |= SCSW_FCTL_CLEAR_FUNC | SCSW_ACTL_CLEAR_PEND;
 
-    return do_subchannel_work(sch);
+    ccode = do_subchannel_work(sch);
+
+    if (ccode != IOINST_CC_EXPECTED) {
+        schib->scsw.ctrl = old_scsw_ctrl;
+    }
+
+    return ccode;
 }
 
 IOInstEnding css_do_hsch(SubchDev *sch)
 {
     SCHIB *schib = &sch->curr_status;
+    uint16_t old_scsw_ctrl;
+    IOInstEnding ccode;
 
     if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV | PMCW_FLAGS_MASK_ENA)) {
         return IOINST_CC_NOT_OPERATIONAL;
@@ -1553,6 +1569,12 @@ IOInstEnding css_do_hsch(SubchDev *sch)
         return IOINST_CC_BUSY;
     }
 
+    /*
+     * Save the current scsw.ctrl in case HSCH fails and we need
+     * to revert the scsw to the status quo ante.
+     */
+    old_scsw_ctrl = schib->scsw.ctrl;
+
     /* Trigger the halt function. */
     schib->scsw.ctrl |= SCSW_FCTL_HALT_FUNC;
     schib->scsw.ctrl &= ~SCSW_FCTL_START_FUNC;
@@ -1564,7 +1586,13 @@ IOInstEnding css_do_hsch(SubchDev *sch)
     }
     schib->scsw.ctrl |= SCSW_ACTL_HALT_PEND;
 
-    return do_subchannel_work(sch);
+    ccode = do_subchannel_work(sch);
+
+    if (ccode != IOINST_CC_EXPECTED) {
+        schib->scsw.ctrl = old_scsw_ctrl;
+    }
+
+    return ccode;
 }
 
 static void css_update_chnmon(SubchDev *sch)
@@ -1605,6 +1633,8 @@ static void css_update_chnmon(SubchDev *sch)
 IOInstEnding css_do_ssch(SubchDev *sch, ORB *orb)
 {
     SCHIB *schib = &sch->curr_status;
+    uint16_t old_scsw_ctrl, old_scsw_flags;
+    IOInstEnding ccode;
 
     if (~(schib->pmcw.flags) & (PMCW_FLAGS_MASK_DNV | PMCW_FLAGS_MASK_ENA)) {
         return IOINST_CC_NOT_OPERATIONAL;
@@ -1626,11 +1656,26 @@ IOInstEnding css_do_ssch(SubchDev *sch, ORB *orb)
     }
     sch->orb = *orb;
     sch->channel_prog = orb->cpa;
+
+    /*
+     * Save the current scsw.ctrl and scsw.flags in case SSCH fails and we need
+     * to revert the scsw to the status quo ante.
+     */
+    old_scsw_ctrl = schib->scsw.ctrl;
+    old_scsw_flags = schib->scsw.flags;
+
     /* Trigger the start function. */
     schib->scsw.ctrl |= (SCSW_FCTL_START_FUNC | SCSW_ACTL_START_PEND);
     schib->scsw.flags &= ~SCSW_FLAGS_MASK_PNO;
 
-    return do_subchannel_work(sch);
+    ccode = do_subchannel_work(sch);
+
+    if (ccode != IOINST_CC_EXPECTED) {
+        schib->scsw.ctrl = old_scsw_ctrl;
+        schib->scsw.flags = old_scsw_flags;
+    }
+
+    return ccode;
 }
 
 static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW *pmcw,
-- 
2.37.3


